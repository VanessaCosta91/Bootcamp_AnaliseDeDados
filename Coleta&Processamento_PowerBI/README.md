# Coleta e Processamento de Dados com Power BI

Este projeto tem como objetivo integrar o MySQL com o Power BI e realizar transformações nos dados para análise.

---

## Programas Necessários

1. [MySQL Installer (Workspace)](https://dev.mysql.com/downloads/installer/)
2. [MySQL Community Server 9.4.0 Innovation](https://dev.mysql.com/downloads/mysql/?platform&os=3)
3. [Power BI](https://apps.microsoft.com/detail/9ntxr16hnw1t?hl=pt-BR&gl=BR)

---

## Passo a Passo

### 1. Preparação do Banco de Dados
- No **MySQL Workspace**, importar e executar os scripts:
  - `script_bd_company.sql`
  - `insercao_de_dados_e_queries_sql.sql` 
  (disponíveis na pasta [scripts](/scripts))

---

### 2. Conexão com o Power BI
- No Power BI:
  1. Acessar Obter Dados → Banco de Dados MySQL
  2. Informar usuário e senha
  3. Selecionar todas as tabelas
  4. Clicar em Transformar Dados para abrir no Power Query

---

### 3. Transformações no Power Query

#### Tabela `employee`
1. Alterar tipo de dado de `Salary` para Decimal Fixo  
2. Alterar tipo de dado de `Dno` para Texto 
3. Substituir valores nulos de `Super_ssn` por “Não se aplica”  
4. Mesclar `employee` com `department`, criando a tabela `employee_department`

#### Tabela `employee_department`
1. Ajustar tipos de dados  
2. Remover colunas duplicadas  

#### Tabela `department`
- Alterar tipo de dado de `Dnumber` para **Texto**

#### Tabela `dept_locations`
- Alterar tipo de dado de `Dnumber` para **Texto**

#### Tabela `project`
- Alterar tipo de dado de `Pnumber` e `Dnumber` para **Texto**

#### Tabela `works_on`
- Alterar tipo de dado de `Pnumber` para **Texto**

---

### 4. Modelagem e Relatório no Power BI
1. Renomear todas as tabelas (removendo o nome do schema)  
2. Verificar e corrigir relacionamentos entre tabelas  
3. Criar relatório contendo:
   - Tabela com o total de horas por projeto

---

## Observações
- As etapas de transformação seguem as diretrizes do desafio, incluindo ajustes de tipos, tratamento de valores nulos e junções entre tabelas.

