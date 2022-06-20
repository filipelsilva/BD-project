drop trigger if exists check_categoria_nomes on tem_outra;
drop trigger if exists check_evento_reposicao_unidades on evento_reposicao;

create or replace function check_categoria()
returns trigger as
$$
begin
	if new.nome_categoria = new.nome_super_categoria then
		raise exception 'uma categoria não pode estar contida em si mesma';
	end if;
	return new;
end;
$$ language plpgsql;

create trigger ckeck_categoria_nomes
before update or insert on tem_outra
for each row execute procedure check_categoria();

create or replace function check_evento_reposicao()
returns trigger as
$$
declare count_produtos integer;
declare categoria1 varchar;
declare categoria2 varchar;
begin
	select unidades from planograma where ean = new.ean into count_produtos;
	if new.unidades > unidades then
		raise exception 'demasiadas unidades para repor';
	end if;

	select nome_categoria from planograma where ean = new.ean into categoria1;
	select nome_categoria from produto where ean = new.ean into categoria2;
	if categoria1 != categoria2 then
		raise exception 'não existe categoria nesta prateleira correspondente';
	end if;

	return new;
end;
$$ language plpgsql;

create trigger check_evento_reposicao_unidades
before update or insert on evento_reposicao
for each row execute procedure check_evento_reposicao();
