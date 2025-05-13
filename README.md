# 🏥 Sistema de Gerenciamento Hospitalar - Modelo de Banco de Dados

Projeto desenvolvido como parte das atividades do curso **PROA**, sob orientação do professor **Gabriel**.  
O objetivo é modelar um sistema hospitalar que permita o gerenciamento de **consultas**, **pacientes**, **médicos**, **convênios** e **receitas médicas**.

---

## 📌 Diagrama Entidade-Relacionamento (MER)

![Diagrama MER](https://github.com/yaslopesyweb/Hospital-DB/blob/main/Atividade-Hospital.svg)  


---

## 🗃️ Estrutura das Tabelas

### 🩺 `medico`
Armazena os dados dos médicos.

| Campo       | Tipo                  | Descrição                        |
|-------------|-----------------------|----------------------------------|
| id_medico   | int [PK]              | Identificador único do médico   |
| nome        | varchar(100)          | Nome completo                    |
| telefone    | varchar(20)           | Telefone                         |
| email       | varchar(100)          | E-mail institucional             |
| tipo        | enum                  | Tipo de médico: `generalista`, `especialista`, `residente` |

---

### 🧠 `especialidade`
Armazena as especialidades médicas.

| Campo             | Tipo         | Descrição                  |
|------------------|--------------|----------------------------|
| id_especialidade | int [PK]     | Identificador da especialidade |
| nome_especialidade | varchar(100) | Nome da especialidade      |

---

### 🧬 `medico_especialidade`
Relaciona médicos com suas especialidades (N:N).

| Campo           | Tipo     | Descrição                          |
|----------------|----------|------------------------------------|
| medico_id       | int [FK] | Chave estrangeira de `medico`      |
| especialidade_id| int [FK] | Chave estrangeira de `especialidade` |
| **Primary Key** | (medico_id, especialidade_id) | Chave composta |

---

### 🏠 `endereco`
Armazena endereços dos pacientes.

| Campo        | Tipo         | Descrição         |
|--------------|--------------|-------------------|
| id_endereco  | int [PK]     | ID do endereço    |
| rua          | varchar(250) | Nome da rua       |
| numero       | varchar(10)  | Número do imóvel  |
| complemento  | varchar(30)  | Complemento       |
| bairro       | varchar(180) | Bairro            |
| cidade       | varchar(180) | Cidade            |
| estado       | char(2)      | UF (Estado)       |
| cep          | varchar(9)   | Código postal     |

---

### 👤 `paciente`
Dados dos pacientes.

| Campo          | Tipo         | Descrição                       |
|----------------|--------------|---------------------------------|
| id_paciente    | int [PK]     | ID do paciente                  |
| nome           | varchar(100) | Nome completo                   |
| data_nascimento| date         | Data de nascimento              |
| id_endereco    | int [FK]     | Endereço do paciente            |
| telefone       | varchar(20)  | Telefone pessoal                |
| email          | varchar(100) | E-mail                          |
| cpf            | varchar(14)  | CPF                             |
| rg             | varchar(20)  | RG                              |
| id_convenio    | int [FK]     | Convênio vinculado              |

---

### 🏦 `convenio`
Armazena informações dos convênios médicos.

| Campo         | Tipo         | Descrição               |
|---------------|--------------|-------------------------|
| id_convenio   | int [PK]     | Identificador do convênio |
| nome          | varchar(100) | Nome do convênio        |
| cnpj          | varchar(18)  | CNPJ                    |
| carencia      | varchar(20)  | Tempo de carência       |

---

### 📅 `consulta`
Registra as consultas realizadas.

| Campo            | Tipo           | Descrição                              |
|------------------|----------------|----------------------------------------|
| id_consulta      | int(30) [PK]   | ID da consulta                         |
| id_paciente      | int [FK]       | Paciente atendido                      |
| id_medico        | int [FK]       | Médico responsável                     |
| data_consulta    | datetime       | Data e hora da consulta                |
| valor            | decimal(10,2)  | Valor da consulta                      |
| id_especialidade | int [FK]       | Especialidade buscada                  |
| numero_carteira  | varchar(30)    | Número da carteirinha do convênio      |

---

### 💊 `receita`
Registra receitas médicas emitidas após as consultas.

| Campo        | Tipo     | Descrição                      |
|--------------|----------|--------------------------------|
| id_receita   | int [PK] | ID da receita                  |
| id_consulta  | int [FK] | Consulta relacionada           |

---

### 💉 `medicamento_receitado`
Medicamentos prescritos em uma receita.

| Campo           | Tipo         | Descrição                   |
|------------------|--------------|-----------------------------|
| id_medicamento   | int [PK]     | ID do medicamento           |
| nome_medicamento | varchar(100) | Nome do medicamento         |
| id_receita       | int [FK]     | Receita relacionada         |
| quantidade       | varchar(20)  | Quantidade prescrita        |
| instrucoes       | varchar(255) | Instruções de uso           |

---

## 🧩 Relacionamentos principais

- **1 médico** pode ter **várias especialidades** → via tabela `medico_especialidade`.
- **1 paciente** tem **1 endereço** e **1 convênio**.
- **1 consulta** envolve **1 paciente**, **1 médico**, **1 especialidade**, e pode gerar **1 receita**.
- **1 receita** pode conter **vários medicamentos**.

---

### 👨‍🏫 Projeto acadêmico | Curso PROA — Professor Gabriel

---

