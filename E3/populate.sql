drop table categoria cascade;
drop table categoria_simples cascade;
drop table super_categoria cascade;
drop table tem_outra cascade;
drop table produto cascade;
drop table tem_categoria cascade;
drop table IVM cascade;
drop table ponto_de_retalho cascade;
drop table instalada_em cascade;
drop table prateleira cascade;
drop table planograma cascade;
drop table retalhista cascade;
drop table responsavel_por cascade;
drop table evento_reposicao cascade;

----------------------------------------
-- Table Creation
----------------------------------------

-- Named constraints are global to the database.
-- Therefore the following use the following naming rules:
--   1. pk_table for names of primary key constraints
--   2. fk_table_another for names of foreign key constraints

create table categoria (
	nome_categoria varchar(255) not null,
	constraint pk_categoria primary key(nome_categoria)
);

create table categoria_simples (
	nome_categoria varchar(255) not null,
	constraint pk_categoria_simples primary key(nome_categoria),
	constraint fk_categoria_simples_categoria foreign key(nome_categoria) references categoria(nome_categoria)
);

create table super_categoria (
	nome_categoria varchar(255) not null,
	constraint pk_super_categoria primary key(nome_categoria),
	constraint fk_super_categoria_categoria foreign key(nome_categoria) references categoria(nome_categoria)
);

create table tem_outra (
	super_nome_categoria	varchar(255) not null,
	nome_categoria			varchar(255) not null,
	constraint pk_tem_outra primary key(nome_categoria),
	constraint fk_tem_outra_super_categoria foreign key(super_nome_categoria) references super_categoria(nome_categoria),
	constraint fk_tem_outra_categoria foreign key(nome_categoria) references categoria(nome_categoria)
);

create table produto (
	ean				char(13) not null,
	nome_categoria	varchar(255) not null,
	descricao		varchar(255) not null,
	constraint pk_produto primary key(ean),
	constraint fk_produto_categoria foreign key(nome_categoria) references categoria(nome_categoria)
);

create table tem_categoria (
	ean				char(13) not null,
	nome_categoria	varchar(255) not null,
	constraint pk_tem_categoria primary key(ean, nome_categoria),
	constraint fk_tem_categoria_produto foreign key(ean) references produto(ean),
	constraint fk_tem_categoria_categoria foreign key(nome_categoria) references categoria(nome_categoria)
);

create table ivm (
	num_serie	varchar(255) not null,
	fabricante	varchar(255) not null,
	constraint pk_ivm primary key(num_serie, fabricante)
);

create table ponto_de_retalho (
	nome_ponto_de_retalho	varchar(255) not null,
	distrito				varchar(255) not null,
	concelho				varchar(255) not null,
	constraint pk_ponto_de_retalho primary key(nome_ponto_de_retalho)
);

create table instalada_em (
	num_serie	varchar(255) not null,
	fabricante	varchar(255) not null,
	local		varchar(255) not null,
	constraint pk_instalada_em primary key(num_serie, fabricante),
	constraint fk_instalada_em_ivm foreign key(num_serie, fabricante) references ivm(num_serie, fabricante),
	constraint fk_instalada_em_ponto_de_retalho foreign key(local) references ponto_de_retalho(nome_ponto_de_retalho)
);

create table prateleira (
	num_prateleira	int not null,
	num_serie		varchar(255) not null,
	fabricante		varchar(255) not null,
	altura			float not null,
	nome_categoria	varchar(255) not null,
	constraint check_num_prateleira check (num_prateleira >= 0),
	constraint check_altura check (altura >= 0),
	constraint pk_prateleira primary key(num_prateleira, num_serie, fabricante),
	constraint pk_prateleira_ivm foreign key(num_serie, fabricante) references ivm(num_serie, fabricante),
	constraint pk_prateleira_categoria foreign key(nome_categoria) references categoria(nome_categoria)
);

create table planograma (
	ean				char(13) not null,
	num_prateleira	int not null,
	num_serie		varchar(255) not null,
	fabricante		varchar(255) not null,
	faces			int not null,
	unidades		int not null,
	loc				int not null,
	constraint check_num_prateleira check (num_prateleira >= 0),
	constraint check_faces check (faces >= 0),
	constraint check_unidades check (unidades >= 0),
	constraint check_loc check (loc >= 0),
	-- FIXME loc eh exatamente o queh
	constraint pk_planograma primary key(ean, num_prateleira, num_serie, fabricante),
	constraint pk_planograma_produto foreign key(ean) references produto(ean),
	constraint pk_planograma_prateleira foreign key(num_prateleira, num_serie, fabricante) references prateleira(num_prateleira, num_serie, fabricante)
);

create table retalhista (
	tin				varchar(255) not null,
	nome_retalhista	varchar(255) not null unique,
	constraint pk_retalhista primary key(tin)
);

create table responsavel_por (
	nome_categoria	varchar(255) not null,
	tin				varchar(255) not null,
	num_serie		varchar(255) not null,
	fabricante		varchar(255) not null,
	constraint pk_responsavel_por primary key(num_serie, fabricante),
	constraint pk_responsavel_por_ivm foreign key(num_serie, fabricante) references ivm(num_serie, fabricante),
	constraint pk_responsavel_por_retalhista foreign key(tin) references retalhista(tin),
	constraint pk_responsavel_por_categoria foreign key(nome_categoria) references categoria(nome_categoria)
);

create table evento_reposicao (
	ean				char(13) not null,
	num_prateleira	int not null,
	num_serie		varchar(255) not null,
	fabricante		varchar(255) not null,
	instante		timestamp not null,
	unidades		int not null,
	tin				varchar(255) not null,
	constraint check_num_prateleira check (num_prateleira >= 0),
	constraint check_unidades check (unidades >= 0),
	constraint pk_evento_reposicao primary key(ean, num_prateleira, num_serie, fabricante, instante),
	constraint pk_evento_reposicao_planograma foreign key(ean, num_prateleira, num_serie, fabricante) references planograma(ean, num_prateleira, num_serie, fabricante),
	constraint pk_evento_reposicao_retalhista foreign key(tin) references retalhista(tin)
);

----------------------------------------
-- Populate Relations
----------------------------------------

-- insert into customer values ('Adams',	'Main Street',	'Lisbon');
-- insert into customer values ('Brown',	'Main Street',	'Oporto');
-- insert into customer values ('Cook',	'Main Street',	'Lisbon');
-- insert into customer values ('Davis',	'Church Street','Oporto');
-- insert into customer values ('Evans',	'Forest Street','Coimbra');
-- insert into customer values ('Flores',	'Station Street','Braga');
-- insert into customer values ('Gonzalez','Sunny Street', 'Faro');
-- insert into customer values ('Iacocca',	'Spring Steet',	'Coimbra');
-- insert into customer values ('Johnson',	'New Street',	'Cascais');
-- insert into customer values ('King',	'Garden Street','Aveiro');
-- insert into customer values ('Lopez',	'Grand Street',	'Vila Real');
-- insert into customer values ('Martin',	'Royal Street',	'Braga');
-- insert into customer values ('Nguyen',	'School Street','Castelo Branco');
-- insert into customer values ('Oliver',	'First Stret',	'Oporto');
-- insert into customer values ('Parker',	'Hope Street',  'Oporto');
--
-- insert into branch values ('Central',	'Guimarães',		2100000);
-- insert into branch values ('Clerigos',  'Oporto',		3900000);
-- insert into branch values ('Downtown',	'Lisbon',		1900000);
-- insert into branch values ('Metro',	'Amadora',	 	400200);
-- insert into branch values ('Round Hill','Amadora',		8000000);
-- insert into branch values ('Ship Terminal', 'Sintra',	 	0400000);
-- insert into branch values ('University',	'Vila Real',	7200000);
-- insert into branch values ('Uptown',	'Amadora',		1700000);
-- insert into branch values ('Wine Celar', 'Oporto',		4002800);
--
-- insert into account values ('A-101',	'Downtown',	500);
-- insert into account values ('A-102',	'Uptown',	700);
-- insert into account values ('A-201',	'Uptown',	900);
-- insert into account values ('A-215',	'Metro',	600);
-- insert into account values ('A-217',	'University',	650);
-- insert into account values ('A-222',	'Central',	550);
-- insert into account values ('A-305',	'Round Hill',	800);
-- insert into account values ('A-333',	'Central',	750);
-- insert into account values ('A-444',	'Downtown',	850);
--
-- insert into depositor values ('Cook',	 'A-102');
-- insert into depositor values ('Johnson', 'A-101');
-- insert into depositor values ('Cook',	 'A-101');
-- insert into depositor values ('Johnson', 'A-201');
-- insert into depositor values ('Brown',	 'A-215');
-- insert into depositor values ('Iacocca', 'A-217');
-- insert into depositor values ('Evans',   'A-222');
-- insert into depositor values ('Flores',	 'A-305');
-- insert into depositor values ('Oliver',  'A-333');
-- insert into depositor values ('Brown',	 'A-444');
--
-- insert into loan values ('L-11', 'Round Hill',	6000);
-- insert into loan values ('L-14', 'Downtown',	4000);
-- insert into loan values ('L-15', 'Uptown',	3000);
-- insert into loan values ('L-16', 'Uptown',	7000);
-- insert into loan values ('L-17', 'Downtown',	1000);
-- insert into loan values ('L-20', 'Downtown',	8000);
-- insert into loan values ('L-21', 'Central',	9000);
-- insert into loan values ('L-23', 'Central',	2000);
-- insert into loan values ('L-93', 'Metro',	5000);
--
-- insert into borrower values ('Brown',	'L-11');
-- insert into borrower values ('Nguyen',	'L-14');
-- insert into borrower values ('Cook',	'L-15');
-- insert into borrower values ('Iacocca',	'L-16');
-- insert into borrower values ('Gonzalez','L-17');
-- insert into borrower values ('Iacocca',	'L-17');
-- insert into borrower values ('Parker',	'L-20');
-- insert into borrower values ('Brown',	'L-21');
-- insert into borrower values ('Brown',	'L-23');
-- insert into borrower values ('Davis',	'L-93');
