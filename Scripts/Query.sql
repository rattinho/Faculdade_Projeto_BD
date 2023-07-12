SELECT M.Nome 
FROM Medico M 
INNER JOIN Procedimento P ON M.CRM = P.CRM 
INNER JOIN Hospital H ON M.CodHospital = H.CodHospital 
WHERE P.CodProcedimento = '4' AND H.CodHospital = '4';


SELECT Pa.Nome 
FROM Paciente Pa
INNER JOIN EntradaPacHosp E ON Pa.CPF = E.CodPaciente 
WHERE E.Data = '12/12/2002' AND E.CodHospital = '2';


SELECT DISTINCT H.Nome 
FROM Hospital H
INNER JOIN Farmacia F ON H.CodFarmacia = F.CodFarmacia 
INNER JOIN Medicamento M ON F.CodMedicamento = M.CodMedicamento 
WHERE M.Nome = '<nome_medicamento>';


SELECT Pa.Nome 
FROM Paciente Pa
INNER JOIN SolExamPlan S ON Pa.CodPlanoSaude = S.CodPlanoSaude 
WHERE S.CodExame = '1';


SELECT M.Nome, SUM(S.Valor) AS Total
FROM Medico M 
INNER JOIN Procedimento P ON M.CRM = P.CRM 
INNER JOIN SolExamPlan S ON P.CodExame = S.CodExame 
WHERE M.CRM = '1'
GROUP BY M.Nome;


SELECT Pa.Nome 
FROM Paciente Pa 
INNER JOIN Atendimento A ON Pa.CPF = A.CodPaciente 
WHERE A.CRM = '1' AND A.Data = '12/12/1212';


SELECT DISTINCT M.Nome 
FROM Medico M
INNER JOIN Atendimento A ON M.CRM = A.CRM 
WHERE A.CodPaciente = '1';


SELECT DISTINCT E.TipoExame 
FROM Exame E 
INNER JOIN Procedimento P ON E.CodExame = P.CodExame 
INNER JOIN Medico M ON P.CRM = M.CRM 
WHERE M.CodHospital = '1';


SELECT Pa.Nome, SUM(S.Valor) AS Total
FROM Paciente Pa 
INNER JOIN Atendimento A ON Pa.CPF = A.CodPaciente 
INNER JOIN Procedimento P ON A.CodProcedimento = P.CodProcedimento 
INNER JOIN Medico M ON P.CRM = M.CRM
INNER JOIN SolExamPlan S ON P.CodExame = S.CodExame 
WHERE M.CodHospital = '1' AND Pa.CPF = '1'
GROUP BY Pa.Nome;


SELECT M.Nome, COUNT(A.CodPaciente) AS Numero_Pacientes
FROM Medico M 
INNER JOIN Atendimento A ON M.CRM = A.CRM 
WHERE A.Data = '12/12/2222' 
GROUP BY M.Nome;
