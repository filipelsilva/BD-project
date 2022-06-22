----------------------------
--        6. OLAP         --
----------------------------

-- 1. num dado periodo (i.e. entre duas datas), por dia da semana,
-- por concelho e no total

-- TODO: falta periodo de tempo. nao sei como fazer com datas desconhecidas

select dia_semana, concelho, sum(unidades) as total
from vendas
where ano between '2020' and '2022'
	and mes between '1' and '10'
	and dia_mes between '10' and '31'
group by cube(dia_semana, concelho);

-- 2. num dado distrito (i.e. "Lisboa"), por concelho, categoria, dia
-- da semana e no total

select concelho, nome_categoria, dia_semana, sum(unidades) as total
from vendas
where distrito = 'Leiria'
group by cube(concelho, nome_categoria, dia_semana);
