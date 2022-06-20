----------------------------
--         3. SQL         --
----------------------------


-- Qual o nome do retalhista (ou retalhistas) responsaveis pela reposicao do maior numero de
-- categorias?

-- TODO: problema categorias em IVMs diferentes --
-- NOTE (filipe) isto parece funcionar, se bem nao sei
select nome_retalhista
from responsavel_por natural join retalhista
group by nome_retalhista
having count(distinct nome_categoria) >= all (
    select count(distinct nome_categoria)
    from responsavel_por natural join retalhista
    group by nome_retalhista
);


-- Qual o nome do ou dos retalhistas que sao responsaveis por todas as categorias simples?

-- TODO: ?? not sure
select nome_retalhista
from responsavel_por natural join retalhista
group by nome
having count(distinct nome_categoria) = (
    select count(*)
    from categoria_simples
);

-- Quais os produtos (ean) que nunca foram repostos?
select ean
from produto
where ean not in (
    select ean from evento_reposicao)
;

-- Quais os produtos (ean) que foram repostos sempre pelo mesmo retalhista?
-- TODO: ??? o que eu fiz esta no slide 46 de SQL avancado 2
select ean
from evento_reposicao a
where not exists(
    select ean
    from evento_reposicao
    except
    select b.ean
    from (evento_reposicao b)
    where a.tin = b.tin
)
;



----------------------------
--        6. OLAP         --
----------------------------

-- 1. num dado periodo (i.e. entre duas datas), por dia da semana, por concelho e no total
-- TODO: falta periodo de tempo. nao sei como fazer com datas desconhecidas
select dia_semana, conselho, SUM(unidades) as total
from Vendas
group by
    CUBE(dia_semana,conselho);

-- 2. num dado distrito (i.e. "Lisboa"), por concelho, categoria, dia da semana e no total
select conselho, cat, dia_semana, SUM(unidades) as total
from Vendas
where distrito = "Lisboa"
group by
    CUBE(conselho, cat, dia_semana);

