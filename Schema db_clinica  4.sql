USE db_clinica;

SELECT COUNT(*) FROM tb_estado;
SELECT COUNT(*) FROM tb_estado WHERE Cod_regiao IS NULL;
SELECT COUNT(*) FROM tb_estado WHERE Cod_regiao IS NOT NULL;

SELECT * 
FROM tb_estado 
WHERE Cod_regiao BETWEEN 2 AND 4 
AND Desc_estado LIKE 'A%';

SELECT * FROM tb_estado WHERE Desc_estado LIKE 'S%';

CREATE TABLE IF NOT EXISTS TB_Cliente (
  ID_Cliente INT NOT NULL,
  Nome_Cliente VARCHAR(45),
  CPF_Cliente VARCHAR(11),
  Email_Cliente VARCHAR(45),
  Cod_Estado TINYINT,
  PRIMARY KEY (ID_Cliente),
  FOREIGN KEY (Cod_Estado) REFERENCES TB_Estado(Cod_Estado)
);

INSERT INTO tb_cliente 
VALUES (1, 'teste', '54856435741', 'teste@hotmail.com', 2);

SELECT * 
FROM tb_cliente A 
INNER JOIN tb_estado B ON A.Cod_estado = B.Cod_estado 
INNER JOIN tb_regiao C ON B.Cod_regiao = C.Cod_regiao;

SELECT * FROM tb_cliente;

SELECT * 
FROM tb_regiao C 
LEFT JOIN tb_estado A 
ON A.Cod_regiao = C.Cod_regiao;

SELECT Cod_estado, Nome_Cliente FROM tb_cliente
UNION ALL
SELECT Cod_estado, Desc_estado FROM tb_estado
ORDER BY 1;

SELECT A.Cod_regiao, B.Desc_regiao, COUNT(A.Cod_regiao) 
FROM tb_estado A 
INNER JOIN tb_regiao B 
ON A.Cod_regiao = B.Cod_regiao
GROUP BY A.Cod_regiao, B.Desc_regiao
ORDER BY A.Cod_regiao;