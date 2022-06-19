-- Qual o nome do retalhista (ou retalhistas) responsaveis pela reposicao do maior numero de
-- categorias? 

-- TODO: problema categorias em IVMs diferentes --
SELECT name
FROM responsavel_por NATURAL JOIN retalhista
GROUP BY name  
HAVING COUNT(DISTINCT nome_cat) >= ALL (
    SELECT COUNT(DISTINCT nome_cat)
    FROM responsavel_por NATURAL JOIN retalhista
    GROUP BY name
);   


-- Qual o nome do ou dos retalhistas que sao responsaveis por todas as categorias simples?

-- TODO: ?? not sure
SELECT name
FROM responsavel_por NATURAL JOIN retalhista
GROUP BY nome
HAVING COUNT(DISTINCT nome_cat) = (
    SELECT COUNT(*)
    FROM categoria_simples
);

-- Quais os produtos (ean) que nunca foram repostos?
SELECT ean
FROM produto 
WHERE ean NOT IN (
    SELECT ean FROM evento_reposicao)
;

-- Quais os produtos (ean) que foram repostos sempre pelo mesmo retalhista?
-- TODO: ??? o que eu fiz esta no slide 46 de SQL avancado 2
SELECT ean
FROM evento_reposicao a
WHERE NOT EXISTS(
    SELECT ean 
    FROM evento_reposicao
    EXCEPT
    SELECT b.ean
    FROM (evento_reposicao b)
    WHERE a.tin = b.tin
)
;
