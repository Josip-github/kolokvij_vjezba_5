drop database if exists kolokvij_vjezba_5;
create database kolokvij_vjezba_5;
use kolokvij_vjezba_5;


create table mladic(
	sifra int not null primary key auto_increment,
	kratkamajica varchar(48) not null,
	haljina varchar (30) not null,
	asocijalno bit,
	zarucnik int
);

create table ostavljena(
	sifra int not null primary key auto_increment,
	majica varchar(33),
	ogrlica int not null,
	carape varchar(44),
	stilfrizura varchar(42),
	punica int not null
);

create table zarucnik(
	sifra int not null primary key auto_increment,
	jmbag char(11),
	lipa decimal(12,8),
	indiferentno bit not null
);

create table punac(
	sifra int not null primary key auto_increment,
	dukserica varchar(33),
	prviputa datetime not null,
	majica varchar(36),
	svekar int not null
);

create table punica(
	sifra int not null primary key auto_increment,
	hlace varchar(43) not null,
	nausnica int not null,
	ogrlica int,
	vesta varchar(49) not null,
	modelnaocala varchar(31) not null,
	treciputa datetime not null,
	punac int not null
);

create table cura(
	sifra int not null primary key auto_increment,
	carape varchar(41) not null,
	maraka decimal(17,10) not null,
	asocijalno bit,
	vesta varchar(47) not null
);

create table svekar(
	sifra int not null primary key auto_increment,
	bojakose varchar(33),
	majica varchar(31),
	carape varchar(31) not null,
	haljina varchar(43),
	narukvica int,
	eura decimal(14,5) not null
);

create table svekar_cura(
	sifra int not null primary key auto_increment,
	svekar int not null,
	cura int not null
);


alter table mladic add foreign key (zarucnik) references zarucnik(sifra);

alter table ostavljena add foreign key (punica) references punica(sifra);

alter table punica add foreign key (punac) references punac(sifra);

alter table punac add foreign key (svekar) references svekar(sifra);

alter table svekar_cura add foreign key (svekar) references svekar(sifra);
alter table svekar_cura add foreign key (cura) references cura(sifra);

#U tablice punica, punac i svekar_cura unesite po 3 retka.
insert into svekar(carape,eura)
values('bijele',1309.98),('crne',345.67),('sportske',987.65),('adidas bijele',333.65);

insert into punac(prviputa,svekar)
values('1939-09-01',1),('1945-05-08',2),('1964-12-25',2);

insert into punica(hlace,nausnica,vesta,modelnaocala,treciputa,punac)
values('ljetne hla??e',234,'proljetna','nao??ale za ??itanje','1957-08-15',2),
('zimske hla??e',345,'adidas','sun??ane nao??ale','1953-03-12',1),
('sve??ane hla??e',112,'nike vesta za tr??anje','nao??ale za ??itanje','1923-05-04',3);

insert into cura(carape,maraka,vesta)
values('pokemon ??arape',10.10,'Adidas'),('pikachu ??arapice',12.12,'Reebok'),('bijele sportske',33.33,'S kapulja??om');

insert into svekar_cura(svekar,cura)
values(1,1),(2,2),(3,3);

#U tablici mladic postavite svim zapisima kolonu haljina na vrijednost Osijek.
update mladic set haljina ='Osijek';

#U tablici ostavljena obri??ite sve zapise ??ija je vrijednost kolone ogrlica jednako 17.
delete from ostavljena where ogrlica = 17;

#Izlistajte majica iz tablice punac uz uvjet da vrijednost kolone prviputa nepoznate.
select majica from punac where prviputa is null;

/*Prika??ite asocijalno iz tablice cura, stilfrizura iz tablice ostavljena te
nausnica iz tablice punica uz uvjet da su vrijednosti kolone prviputa iz
tablice punac poznate te da su vrijednosti kolone majica iz tablice
svekar sadr??e niz znakova ba. Podatke poslo??ite po nausnica iz tablice
punica silazno.*/

#cura, ostavljena, punica, punac, svekar
select c.asocijalno, o.stilfrizura, p2.nausnica 
from cura c inner join svekar_cura sc on c.sifra = sc.cura 
inner join svekar s on sc.svekar = s.sifra 
inner join punac p on s.sifra = p.svekar 
inner join punica p2 on p.sifra = p2.punac 
inner join ostavljena o on p2.sifra = o.punica 
where p.prviputa is not null and s.majica like '%ba%';

#Prika??ite kolone majica i carape iz tablice svekar ??iji se primarni klju?? ne nalaze u tablici svekar_cura.
select s.majica , s.carape 
from svekar s left join svekar_cura sc on s.sifra = sc.svekar 
where sc.svekar is null;




