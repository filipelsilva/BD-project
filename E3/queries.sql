----------------------------
--         3. SQL         --
----------------------------

-- Qual o nome do retalhista (ou retalhistas) responsaveis pela reposicao do
-- maior numero de categorias?

select nome_retalhista
from responsavel_por natural join retalhista
group by nome_retalhista
having count(distinct nome_categoria) >= all (
	select count(distinct nome_categoria)
	from responsavel_por natural join retalhista
	group by nome_retalhista
);

-- Qual o nome do ou dos retalhistas que sao responsaveis por todas as
-- categorias simples?

select nome_retalhista
from responsavel_por natural join retalhista
group by nome_retalhista
having count(distinct nome_categoria) = (
	select count(*)
	from categoria_simples
);

-- Quais os produtos (ean) que nunca foram repostos?

select ean
from produto
where ean not in (
	select ean from evento_reposicao
);

-- Quais os produtos (ean) que foram repostos sempre pelo mesmo retalhista?

select ean
from evento_reposicao a
where not exists(
	select ean
	from evento_reposicao
	except
	select b.ean
	from evento_reposicao b
	where a.tin = b.tin
);
