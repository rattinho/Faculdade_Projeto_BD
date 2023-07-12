
--Encontre todos os médicos que trabalham em um hospital específico e realizam um procedimento específico.
SELECT M.Nome 
FROM Medico M 
INNER JOIN Procedimento P ON M.CRM = P.CRM 
INNER JOIN Hospital H ON M.CodHospital = H.CodHospital 
WHERE P.CodProcedimento = <cod_procedimento> AND H.CodHospital = <cod_hospital>;

--Encontre todos os pacientes que foram internados em um hospital específico em uma data específica.
SELECT Pa.Nome 
FROM Paciente Pa
INNER JOIN EntradaPacHosp E ON Pa.CPF = E.CodPaciente 
WHERE E.Data = '<data>' AND E.CodHospital = <cod_hospital>;

--Encontre todos os hospitais que possuem um determinado medicamento.
SELECT DISTINCT H.Nome 
FROM Hospital H
INNER JOIN Farmacia F ON H.CodFarmacia = F.CodFarmacia 
INNER JOIN Medicamento M ON F.CodMedicamento = M.CodMedicamento 
WHERE M.Nome = '<nome_medicamento>';

--Encontre todos os pacientes que receberam um exame específico através de um plano de saúde específico.
SELECT Pa.Nome 
FROM Paciente Pa
INNER JOIN SolExamPlan S ON Pa.CodPlanoSaude = S.CodPlanoSaude 
WHERE S.CodExame = <cod_exame>;

--Determine o custo total dos procedimentos realizados por um médico específico.
SELECT M.Nome, SUM(S.Valor) AS Total
FROM Medico M 
INNER JOIN Procedimento P ON M.CRM = P.CRM 
INNER JOIN SolExamPlan S ON P.CodExame = S.CodExame 
WHERE M.CRM = <crm> 
GROUP BY M.Nome;

--Encontre todos os pacientes que foram atendidos por um médico específico em uma data específica.
SELECT Pa.Nome 
FROM Paciente Pa 
INNER JOIN Atendimento A ON Pa.CPF = A.CodPaciente 
WHERE A.CRM = <crm> AND A.Data = '<data>';

--Encontre todos os médicos que atenderam um paciente específico.
SELECT DISTINCT M.Nome 
FROM Medico M
INNER JOIN Atendimento A ON M.CRM = A.CRM 
WHERE A.CodPaciente = <cod_paciente>;

--Encontre todos os exames realizados em um hospital específico.
SELECT DISTINCT E.TipoExame 
FROM Exame E 
INNER JOIN Procedimento P ON E.CodExame = P.CodExame 
INNER JOIN Medico M ON P.CRM = M.CRM 
WHERE M.CodHospital = <cod_hospital>;

--Encontre o valor total gasto por um paciente em um hospital específico.
SELECT Pa.Nome, SUM(S.Valor) AS Total
FROM Paciente Pa 
INNER JOIN Atendimento A ON Pa.CPF = A.CodPaciente 
INNER JOIN Procedimento P ON A.CodProcedimento = P.CodProcedimento 
INNER JOIN SolExamPlan S ON P.CodExame = S.CodExame 
WHERE A.CodHospital = <cod_hospital> AND Pa.CPF = <cpf> 
GROUP BY Pa.Nome;

--Encontre o número total de pacientes atendidos por um médico em um dia específico.
SELECT M.Nome, COUNT(A.CodPaciente) AS Numero_Pacientes
FROM Medico M 
INNER JOIN Atendimento A ON M.CRM = A.CRM 
WHERE A.Data = '<data>' 
GROUP BY M.Nome;
