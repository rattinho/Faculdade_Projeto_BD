CREATE INDEX idx_medico_crm ON Medico USING btree (CRM);
CREATE INDEX idx_procedimento_crm ON Procedimento USING btree (CRM);
CREATE INDEX idx_procedimento_codexame ON Procedimento USING btree (CodExame);
CREATE INDEX idx_paciente_cpf ON Paciente USING btree (CPF);
CREATE INDEX idx_atendimento_codpaciente ON Atendimento USING btree (CodPaciente);
CREATE INDEX idx_atendimento_codprocedimento ON Atendimento USING btree (CodProcedimento);
CREATE INDEX idx_sol_exam_plan_codexame ON SolExamPlan USING btree (CodExame);


CREATE INDEX idx_medico_codhospital ON Medico USING hash (CodHospital);
CREATE INDEX idx_hospital_codhospital ON Hospital USING hash (CodHospital);
CREATE INDEX idx_farmacia_codfarmacia ON Farmacia USING hash (CodFarmacia);
CREATE INDEX idx_medicamento_codmedicamento ON Medicamento USING hash (CodMedicamento);
