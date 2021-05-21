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
	trciputa datetime not null,
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











