-- Criação da tabela Medicamento
CREATE TABLE Medicamento (
    CodMedicamento SERIAL PRIMARY KEY,
    TipoMedicamento VARCHAR(255),
    Nome VARCHAR(255)
);

-- Criação da tabela Farmacia
CREATE TABLE Farmacia (
    CodFarmacia SERIAL PRIMARY KEY,
    Nome VARCHAR(255),
    Quantidade INT,
    CodMedicamento INT,
    foreign key (CodMedicamento) references Medicamento (CodMedicamento)
);

-- Criação da tabela Hospital
CREATE TABLE Hospital (
    CodHospital SERIAL PRIMARY KEY,
    Nome VARCHAR(255),
    Endereco VARCHAR(255),
    CodFarmacia INT,
    foreign key (CodFarmacia) references Farmacia (CodFarmacia)
);


-- Criação da tabela Medico
CREATE TABLE Medico (
    CRM SERIAL PRIMARY KEY,
    Especialidade VARCHAR(255),
    Endereco VARCHAR(255),
    Nome VARCHAR(255),
    Salario INT,
    Sexo CHAR(1),
    CodHospital INT,
    FOREIGN KEY (CodHospital) REFERENCES Hospital (CodHospital)
);

-- Criação da tabela Exame
create table Exame (
	CodExame SERIAL primary key,
	Resultado VARCHAR(255),
	TipoExame VARCHAR(255)
);

-- Criação da tabela Procedimento
create table Procedimento (
	CodProcedimento SERIAL primary key,
	Data DATE,
	Hora TIME,
	CRM INT,
	CodExame INT,
	foreign key (CRM) references Medico (CRM),
	foreign key (CodExame) references Exame (CodExame)
);

-- Criação da tabela Empresa
CREATE TABLE Empresa (
    CNPJ SERIAL PRIMARY KEY,
    Nome VARCHAR(255),
    Endereco VARCHAR(255)
);


-- Criação da tabela PlanoSaude
CREATE TABLE PlanoSaude (
    NumCarteira SERIAL PRIMARY KEY,
    TipoPlano VARCHAR(255),
    ValorPlano INT,
    CodEmpresa INT,
    foreign key (CodEmpresa) references Empresa (CNPJ)
);


-- Criação da tabela Solicita Exame Plano Saude
create table SolExamPlan (
	Valor INT,
	CodExame INT,
	CodPlanoSaude INT,
	foreign key (CodExame) references Exame (CodExame),
	foreign key (CodPlanoSaude) references PlanoSaude (NumCarteira)
);

-- Criação da tabela Internacao
CREATE TABLE Internacao (
	CodInternacao SERIAL primary key,
    DataEntrada DATE,
    HoraEntrada TIME,
    NumQuarto INT,
    QtdInternados INT,
    CodHospital INT,
    foreign key (CodHospital) references Hospital (CodHospital)
);

-- Criação da tabela Visita
create table Visita (
	Hora TIME,
	Data DATE,
	CPF INT,
	Nome VARCHAR,
	NumQuarto INT,
	foreign key (NumQuarto) references Internacao (CodInternacao)
);

-- Criação da tabela Paciente
CREATE TABLE Paciente (
    CPF SERIAL PRIMARY KEY,
    Nome VARCHAR(255),
    Sexo CHAR(1),
    DataNascimento DATE,
    Endereco VARCHAR(255),
    CodPlanoSaude INT,
    NumQuarto INT,
	foreign key (NumQuarto) references Internacao (CodInternacao),
    foreign key (CodPlanoSaude) references PlanoSaude (NumCarteira)
);

-- Criação Entrada Paciente Hospital
create table EntradaPacHosp (
	Data DATE,
	Hora TIME,
	CodPaciente INT,
	CodHospital INT,
	foreign key (CodPaciente) references Paciente (CPF),
	foreign key (CodHospital) references Hospital (CodHospital)
);



-- Criação da tabela EstadoPaciente
CREATE TABLE EstadoPaciente (
    CodEstado SERIAL PRIMARY KEY,
    Sintomas TEXT,
    NumCarteira INT,
    FOREIGN KEY (NumCarteira) REFERENCES PlanoSaude (NumCarteira)
);

-- Criação da tabela Atendimento
create table Atendimento (
	Data DATE,
	Hora TIME,
	CRM INT,
	CodProcedimento INT,
	CodPaciente INT,
	CodEstadoPaciente INT,
	foreign key (CodEstadoPaciente) references EstadoPaciente (CodEstado),
	foreign key (CodPaciente) references Paciente (CPF),
	foreign key (CRM) references Medico (CRM),
	foreign key (CodProcedimento) references Procedimento (CodProcedimento)
);


