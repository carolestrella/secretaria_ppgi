# Secretaria PPGI
## **Integrantes:**
- Carolina Estrella Machado - 180074792 - **Product Owner**
- Raphael Paula Leite Müller - 170113477 - **Scrum Master**
- Luís Felipe de Assis Medeiros - 170195503
- Luis Filipe Siqueira Ribeiro - 180053906 

## Sprint 3
### Funcionalidades implementadas e refatoradas
**Responsável pela implementação**: Equipe completa

1. - [x] Refatoração das Step Definitions de todas as funcionalidades
	
2.  - [x] Refatoração das Features

3.  - [x] Implementação das Controllers, Models e Views
		
4.  - [x] Refatoração da estrutura do Banco de Dados para atender às novas estruturas

5.  - [x] Happy Path e Sad Path nas features do Cucumber

6.  - [x] Documentação do código com RDoc
7.  - [ ] Cobertura de testes RSpec
8.  - [ ] Refatoração de testes RSpec


## Complexidade ciclomática
O teste ciclomático está disponível no arquivo:
> ./detailed/index_cyclo.html

## Estrutura de banco de dados
O banco de dados foi refatorado de modo a permitir a criação das funcionalidades previstas nas histórias de usuário. Isso porque a estrutura fornecida parecia não abranger todas entidades necessárias, tais como "orçamento", "passagens", "diárias" e "requisitos". Assim, adotou-se a seguinte estrutura:

- **budgets**: Tabela que contém o orçamento disponível. Um novo orçamento pode ser cadastrado, porém implica na deleção do anterior.
- **requirements**: Contém um único registro que descreve os requisitos para se realizar uma solicitação de passagem ou diária. Assim como budget, somente um registro desta tabela é permitido no sistema.
- **bookings**: Representa as diárias, que possuem uma data de entrada (início) e saída (fim).
- **tickets**: Representa as passagens, que possuem uma data de entrada (embarque) e saída (desembarque).
- **request_deadlines**: Tabela que contém um único registro, correspondente à data limite para envio de solicitações de passagens ou diárias. Uma nova *deadline* pode ser cadastrada, porém implica na deleção da anterior.
- **admin**: Entidade criada com o único intuito de criar um painel que centraliza as tabelas de passagens e diárias em uma única página, disponível na rota '/admin/panel'.