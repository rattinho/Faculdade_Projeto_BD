
--Visão que mostra os pacientes internados em um determinado hospital:
--Essa visão combina informações das tabelas Paciente, Internacao e Hospital para apresentar os detalhes dos pacientes internados em um determinado hospital. Ela inclui o CPF, nome, sexo, data de nascimento, endereço, número do quarto e o nome do hospital.
CREATE OR REPLACE VIEW PacientesInternados AS
SELECT p.CPF, p.Nome, p.Sexo, p.DataNascimento, p.Endereco, i.NumQuarto, h.Nome AS NomeHospital
FROM Paciente p
JOIN Internacao i ON p.NumQuarto = i.NumQuarto
JOIN Hospital h ON i.CodHospital = h.CodHospital;

--Visão que mostra a média salarial dos médicos por especialidade:
--Essa visão calcula a média salarial dos médicos agrupados por especialidade. Ela retorna a especialidade médica e a média salarial correspondente para cada especialidade. 
CREATE OR REPLACE VIEW MediaSalarioMedicos AS
SELECT m.Especialidade, AVG(m.Salario) AS MediaSalario
FROM Medico m
GROUP BY m.Especialidade;