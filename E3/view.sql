create VIEW Vendas(ean, cat, ano, trimestre, mes, dia_mes, dia_semana, distrito, conselho, unidades)
as
select  p.ean as ean, 
        p.cat as cat, 
        extract(year from e.instante) as ano, 
        extract(quarter from e.instante) as trimestre, 
        extract(month from e.instante) as mes,
        extract(day from e.instante) as dia_mes,
        extract(dow from e.instante) as dia_semana,
        r.distrito as distrito, 
        r.conselho as conselho, 
        e.unidades as unidades 
from evento_reposicao e 
    join produto p
        on e.ean = p.ean 
    join instalada_em i
        on i.num_serie = e.num_serie and i.fabricante = e.fabricante
    join ponto_de_retalho r
        on r.nome = i.local
;
