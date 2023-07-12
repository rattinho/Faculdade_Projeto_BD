--Inserir medicamento na farmácia:
CREATE OR REPLACE FUNCTION InserirMedicamento(
    tipo_medicamento VARCHAR,
    nome_medicamento VARCHAR,
    quantidade INT
)
RETURNS VOID AS $$
BEGIN
    INSERT INTO Medicamento (TipoMedicamento, Nome)
    VALUES (tipo_medicamento, nome_medicamento);

    INSERT INTO Farmacia (Nome, Quantidade, CodMedicamento)
    VALUES ('Nome da Farmácia', quantidade, currval('medicamento_codmedicamento_seq'));
END;
$$ LANGUAGE plpgsql; 


--Registrar internação:
CREATE OR REPLACE FUNCTION RegistrarInternacao(
    data_entrada DATE,
    hora_entrada TIME,
    num_quarto INT,
    qtd_internados INT,
    cod_hospital INT
)
RETURNS VOID AS $$
BEGIN
    INSERT INTO Internacao (DataEntrada, HoraEntrada, NumQuarto, QtdInternados, CodHospital)
    VALUES (data_entrada, hora_entrada, num_quarto, qtd_internados, cod_hospital);
END;
$$ LANGUAGE plpgsql; 


--Agendar procedimento:
CREATE OR REPLACE FUNCTION AgendarProcedimento(
    data_procedimento DATE,
    hora_procedimento TIME,
    crm_medico INT,
    cod_exame INT
)
RETURNS VOID AS $$
BEGIN
    INSERT INTO Procedimento (Data, Hora, CRM, CodExame)
    VALUES (data_procedimento, hora_procedimento, crm_medico, cod_exame);
END;
$$ LANGUAGE plpgsql;


--Cadastrar paciente:
CREATE OR REPLACE FUNCTION CadastrarPaciente(
    cpf INT,
    nome_paciente VARCHAR,
    sexo CHAR,
    data_nascimento DATE,
    endereco VARCHAR,
    cod_plano_saude INT,
    num_quarto INT
)
RETURNS VOID AS $$
BEGIN
    INSERT INTO Paciente (CPF, Nome, Sexo, DataNascimento, Endereco, CodPlanoSaude, NumQuarto)
    VALUES (cpf, nome_paciente, sexo, data_nascimento, endereco, cod_plano_saude, num_quarto);
END;
$$ LANGUAGE plpgsql;


--Verificar estado do paciente:
--Verificar estado do paciente:
CREATE OR REPLACE FUNCTION VerificarEstadoPaciente(cod_carteira INT)
RETURNS TABLE (cod_estado INT, sintomas TEXT) AS $$
BEGIN
    RETURN QUERY SELECT EstadoPaciente.CodEstado, EstadoPaciente.Sintomas
    FROM EstadoPaciente
    WHERE EstadoPaciente.NumCarteira = cod_carteira;
END;
$$ LANGUAGE plpgsql; 

