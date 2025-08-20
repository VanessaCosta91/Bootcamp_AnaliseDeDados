# Modelo Conceitual - Oficina Mecânica

Este projeto apresenta o esquema conceitual de um sistema de controle e gerenciamento de ordens de serviço em uma oficina mecânica.

## Entidades principais

- **Cliente**: possui nome, CPF/CNPJ e endereço.
- **Veículo**: identificado pela placa, modelo e ano, vinculado a um cliente.
- **Ordem de Serviço**: possui data de emissão, data de conclusão, valor, status, cliente, veículo e equipe responsável.
- **Equipe**: agrupamento de mecânicos que executam os serviços.
- **Mecânicos**: possuem nome, endereço e especialidade.
- **Tabela_Servicos**: tabela de referência com tipos de serviços e valores.
- **Peças**: peças utilizadas nas ordens de serviço, com nome e valor.

## Relacionamentos

- Um cliente pode ter vários veículos.
- Cada ordem de serviço está vinculada a um cliente, a um veículo e a uma equipe.
- Uma equipe pode ter vários mecânicos.
- Cada ordem de serviço pode incluir vários serviços (consultados na tabela de serviços).
- Cada ordem de serviço pode incluir várias peças.

## Objetivo

O modelo permite organizar e gerenciar:
- Cadastro de clientes, veículos e mecânicos.
- Atribuição de ordens de serviço a equipes.
- Controle de serviços realizados e peças utilizadas.
- Cálculo do valor total da OS com base em serviços e peças.


## Autor

Desenvolvido por Vanessa Costa

Desafio proposto no bootcamp de Analise de dados da DIO.

