USE db_clinica;

SELECT * FROM tb_especialidade;

INSERT INTO tb_especialidade (Id_Especialidade, Descricao, TB_Medico_CRM)
VALUES (1, 'Ressonância Magnetica', '0023656SP');

SELECT * 
FROM tb_medico A 
INNER JOIN tb_especialidade B 
ON A.CRM = B.TB_Medico_CRM;

SELECT * FROM tb_medico;
SELECT * FROM tb_paciente;

SELECT * 
FROM tb_estado 
WHERE Cod_regiao = 4 
ORDER BY Desc_estado DESC;

SELECT a.Cod_regiao, b.Desc_regiao, COUNT(*) AS quantidade
FROM tb_estado a 
INNER JOIN tb_regiao b
ON a.cod_regiao = b.cod_regiao
WHERE a.Cod_estado >= 4 AND a.Cod_regiao = 2
GROUP BY a.Cod_regiao, b.Desc_regiao;

SELECT desc_estado, Cod_regiao 
FROM tb_estado;

SELECT * FROM tb_regiao;