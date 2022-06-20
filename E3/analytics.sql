----------------------------
--        6. OLAP         --
----------------------------

-- 1. num dado periodo (i.e. entre duas datas), por dia da semana, por concelho
-- e no total

-- TODO: falta periodo de tempo. nao sei como fazer com datas desconhecidas

select dia_semana, conselho, SUM(unidades) as total
from Vendas
group by CUBE(dia_semana,conselho);

-- 2. num dado distrito (i.e. "Lisboa"), por concelho, categoria, dia da semana
-- e no total

select conselho, cat, dia_semana, SUM(unidades) as total
from Vendas
where distrito = "Lisboa"
group by CUBE(conselho, cat, dia_semana);
