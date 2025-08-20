# Modelo Conceitual de E-commerce


Este projeto representa o modelo conceitual de um sistema de e-commerce, desenvolvido como desafio de projeto. 
O objetivo é mapear as principais entidades e relacionamentos, contemplando clientes, pedidos, pagamentos, fornecedores, parceiros e entregas.


---


## Objetivos do Desafio


Refinar o modelo original acrescentando:


- **Cliente PJ e PF**: Uma conta pode ser Pessoa Física ou Pessoa Jurídica.
- **Pagamento**: Um pedido pode ter mais de uma forma de pagamento cadastrada.
- **Entrega**: Cada pedido possui status e código de rastreamento.


---


## Entidades e Relacionamentos


### Cliente

- Cliente armazena os dados básicos (id, nome, endereço). 
- Relacionamento com:
  - Cliente_PF: contém apenas CPF.  
  - Cliente_PJ: contém apenas CNPJ.  
Essa separação garante que um cliente seja **PF ou PJ**, nunca ambos.


### Pedido

- Ligado a um Cliente.
- Contém status, descrição e frete. 
- Associado a:
  - Produto (N:N)
  - Pagamento (N:N) 
  - Entrega (1:1)  


### Produto

- Contém categoria, descrição e valor.
- Relacionado com:
  - Fornecedor. 
  - Estoque.
  - Parceiros/Vendedores.  


### Pagamento

- Pagamentos: lista das formas de pagamento disponíveis. 
- Pagamentos_Pedido: relação entre pedido e forma de pagamento.  
Campos adicionais:  
   - Tipo de pagamento. 
   - Parcelamento (número de parcelas, se houver).  


### Entrega

- Cada pedido possui uma entrega vinculada. 
- Campos:
  - Status.
  - Código de rastreio.


---


## Autor

Desenvolvido por Vanessa Costa
Desafio proposto no bootcamp de Analise de dados da DIO.

