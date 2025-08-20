\# Modelo Conceitual de E-commerce



Este projeto representa o modelo conceitual de um sistema de e-commerce, desenvolvido como desafio de projeto.  

O objetivo é mapear as principais entidades e relacionamentos, contemplando clientes, pedidos, pagamentos, fornecedores, parceiros e entregas.



---



\## Objetivos do Desafio



Refinar o modelo original acrescentando:



\- \*\*Cliente PJ e PF\*\*: Uma conta pode ser Pessoa Física ou Pessoa Jurídica.

\- \*\*Pagamento\*\*: Um pedido pode ter mais de uma forma de pagamento cadastrada.  

\- \*\*Entrega\*\*: Cada pedido possui status e código de rastreamento.



---



\## Entidades e Relacionamentos



\### Cliente

\- Cliente armazena os dados básicos (id, nome, endereço).  

\- Relacionamento com:  

&nbsp; - Cliente\_PF: contém apenas CPF.  

&nbsp; - Cliente\_PJ: contém apenas CNPJ.  

&nbsp;Essa separação garante que um cliente seja \*\*PF ou PJ\*\*, nunca ambos.



\### Pedido

\- Ligado a um Cliente.  

\- Contém status, descrição e frete.  

\- Associado a:

&nbsp; - Produto (N:N)  

&nbsp; - Pagamento (N:N)  

&nbsp; - Entrega (1:1)  



\### Produto

\- Contém categoria, descrição e valor.  

\- Relacionado com:

&nbsp; - Fornecedor.  

&nbsp; - Estoque.  

&nbsp; - Parceiros/Vendedores.  



\### Pagamento

\- Pagamentos: lista das formas de pagamento disponíveis.  

\- Pagamentos\_Pedido: relação entre pedido e forma de pagamento.  

&nbsp; - Campos adicionais:  

&nbsp;   - Tipo de pagamento.  

&nbsp;   - Parcelamento (número de parcelas, se houver).  



\### Entrega

\- Cada pedido possui uma entrega vinculada.  

\- Campos:  

&nbsp; - Status .  

&nbsp; - Código de rastreio.



---



\## Autor



Desenvolvido por Vanessa Costa

Desafio proposto no bootcamp de Analise de dados da DIO.

