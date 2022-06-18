drop table categoria cascade;
drop table categoria_simples cascade;
drop table super_categoria cascade;
drop table tem_outra cascade;
drop table produto cascade;
drop table tem_categoria cascade;
drop table ivm cascade;
drop table ponto_de_retalho cascade;
drop table instalada_em cascade;
drop table prateleira cascade;
drop table planograma cascade;
drop table retalhista cascade;
drop table responsavel_por cascade;
drop table evento_reposicao cascade;

--------------------------------------------------------------------------------
-- Table Creation
--------------------------------------------------------------------------------

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
	loc				varchar(255) not null,
	constraint check_num_prateleira check (num_prateleira >= 0),
	constraint check_faces check (faces >= 0),
	constraint check_unidades check (unidades >= 0),
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

--------------------------------------------------------------------------------
-- Populate Relations
--------------------------------------------------------------------------------

insert into categoria values ('Congelados');
insert into categoria values ('Laticinios');
insert into categoria values ('Iogurtes');
insert into categoria values ('Queijos');
insert into categoria values ('Manteigas');
insert into categoria values ('Carne');
insert into categoria values ('Peixe');
insert into categoria values ('Doces');
insert into categoria values ('Vegetais');
insert into categoria values ('Frutas');

insert into categoria_simples values ('Congelados');
insert into categoria_simples values ('Iogurtes');
insert into categoria_simples values ('Queijos');
insert into categoria_simples values ('Manteigas');
insert into categoria_simples values ('Carne');
insert into categoria_simples values ('Peixe');
insert into categoria_simples values ('Doces');
insert into categoria_simples values ('Vegetais');
insert into categoria_simples values ('Frutas');

insert into super_categoria values ('Laticinios');

insert into tem_outra values ('Laticinios', 'Iogurtes');
insert into tem_outra values ('Laticinios', 'Queijos');
insert into tem_outra values ('Laticinios', 'Manteigas');

insert into produto values ('0', 'Iogurtes', 'Mimosa');
insert into produto values ('1', 'Queijos', 'Babybel');
insert into produto values ('2', 'Manteigas', 'Becel');
insert into produto values ('3', 'Frutas', 'Banana');

insert into tem_categoria values ('0', 'Iogurtes');
insert into tem_categoria values ('1', 'Queijos');
insert into tem_categoria values ('2', 'Manteigas');
insert into tem_categoria values ('3', 'Frutas');

insert into ivm values ('ivm0', 'Bosch');
insert into ivm values ('ivm1', 'Apple');
insert into ivm values ('ivm2', 'Marca1');
insert into ivm values ('ivm3', 'Marca2');

insert into ponto_de_retalho values ('Restaurante0', 'Leiria', 'Batalha');
insert into ponto_de_retalho values ('Restaurante1', 'Leiria', 'Leiria');
insert into ponto_de_retalho values ('Restaurante2', 'Leiria', 'Marinha Grande');
insert into ponto_de_retalho values ('Restaurante3', 'Leiria', 'Caldas da Rainha');
insert into ponto_de_retalho values ('Restaurante4', 'Leiria', 'Pombal');

insert into instalada_em values ('ivm0', 'Bosch', 'Restaurante0');
insert into instalada_em values ('ivm1', 'Apple', 'Restaurante1');
insert into instalada_em values ('ivm2', 'Marca1', 'Restaurante2');
insert into instalada_em values ('ivm3', 'Marca2', 'Restaurante3');

insert into prateleira values ('0', 'ivm0', 'Bosch', '10.5', 'Iogurtes');
insert into prateleira values ('1', 'ivm1', 'Apple', '09.5', 'Queijos');
insert into prateleira values ('2', 'ivm2', 'Marca1', '11.5', 'Manteigas');
insert into prateleira values ('3', 'ivm3', 'Marca2', '08.5', 'Frutas');

insert into planograma values ('0', '0', 'ivm0', 'Bosch', '1', '2', 'ns1');
insert into planograma values ('1', '1', 'ivm1', 'Apple', '2', '3', 'ns2');
insert into planograma values ('2', '2', 'ivm2', 'Marca1', '3', '4', 'ns3');
insert into planograma values ('3', '3', 'ivm3', 'Marca2', '4', '5', 'ns4');

insert into retalhista values ('1', 'Jorge');
insert into retalhista values ('2', 'Bruno');
insert into retalhista values ('3', 'Alexandra');

insert into responsavel_por values ('Iogurtes', '1', 'ivm0', 'Bosch');
insert into responsavel_por values ('Queijos', '2', 'ivm1', 'Apple');
insert into responsavel_por values ('Manteigas', '2', 'ivm2', 'Marca1');
insert into responsavel_por values ('Frutas', '3', 'ivm3', 'Marca2');

insert into evento_reposicao values ('0', '0', 'ivm0', 'Bosch', to_timestamp('2020-02-04 06:45', 'YYYY-MM-DD HH24:MI'), '10', '1');
insert into evento_reposicao values ('1', '1', 'ivm1', 'Apple', to_timestamp('2020-03-31 14:21', 'YYYY-MM-DD HH24:MI'), '11', '1');
insert into evento_reposicao values ('2', '2', 'ivm2', 'Marca1', to_timestamp('2020-05-13 17:29', 'YYYY-MM-DD HH24:MI'), '12', '2');
insert into evento_reposicao values ('3', '3', 'ivm3', 'Marca2', to_timestamp('2020-10-07 21:35', 'YYYY-MM-DD HH24:MI'), '13', '3');
