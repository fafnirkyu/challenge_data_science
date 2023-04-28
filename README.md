Desafio data science Alura

Utilizar modelos de machine learning para aprovação de crédito

| :placard: Vitrine.Dev |     |
| -------------  | --- |
| :sparkles: Nome        | Desafio data science
| :label: Tecnologias | python, sklearn, mysql, powerbi
| :rocket: URL         | -
| :fire: Desafio     |  	-

<!-- Inserir imagem com a #vitrinedev ao final do link -->
![](https://crol.mx/wp-content/uploads/2021/01/PowerBI-Logo.png#vitrinedev)

Detalhes do projeto:

O projeto visa utlizar modelos de Machine Learning para auxiliar na aprovação ou não de crédito para novos clientes da empresa AluraCash.
O desafio foi separado em 4 etapas

[Etapa 1] Utilização do MySQL para a união de 3 diferente tabelas para formar o nosso dataset final, após esta etapa, ainda no MySQL foi feita a tradução das colunas e de alguns itens dentro das colunas que estavam em inglês para o português.


[Etapa]Utilizando a biblioteca SKlearn foram definidos modelos de machine learning, atravéz de tecnicas de scoring foi definido que o modelo com melhor desempenho foi o KNearestNeighbours.

[Etapa 3] Criação de uma API para disponibilizar o modelo de machine learning para o PowerBI. a API foi criada utilizando FASTapi

[Etapa 4] Criação de uma dashboard no PowerBI com estatiscas sobre a nossa base de dados.

Base de dados bruta: https://github.com/Mirlaa/Challenge-Data-Science-1ed/tree/main/Dados/dumps

Dicinário dos dados

Tabela contendo os dados pessoais de cada solicitante

| Feature | Característica |
| --- | --- |
|`person_id`|ID da pessoa solicitante|
| `person_age` | Idade da pessoa - em anos - que solicita empréstimo |
| `person_income` | Salário anual da pessoa solicitante |
| `person_home_ownership` | Situação da propriedade que a pessoa possui: *Alugada* (`Rent`), *Própria* (`Own`), *Hipotecada* (`Mortgage`) e *Outros casos* (`Other`) |
| `person_emp_length` | Tempo - em anos - que a pessoa trabalhou |

### emprestimos

Tabela contendo as informações do empréstimo solicitado

| Feature | Característica |
| --- | --- |
|`loan_id`|ID da solicitação de empréstico de cada solicitante|
| `loan_intent` | Motivo do empréstimo: *Pessoal* (`Personal`), *Educativo* (`Education`), *Médico* (`Medical`), *Empreendimento* (`Venture`), *Melhora do lar* (`Homeimprovement`), *Pagamento de débitos* (`Debtconsolidation`) |
| `loan_grade` | Pontuação de empréstimos, por nível variando de `A` a `G` |
| `loan_amnt` | Valor total do empréstimo solicitado |
| `loan_int_rate` | Taxa de juros |
| `loan_status` | Possibilidade de inadimplência |
| `loan_percent_income` | Renda percentual entre o *valor total do empréstimo* e o *salário anual* |


### historicos_banco

Histório de emprétimos de cada cliente

| Feature | Característica |
| --- | --- |
|`cb_id`|ID do histórico de cada solicitante|
| `cb_person_default_on_file` | Indica se a pessoa já foi inadimplente: sim (`Y`,`YES`) e não (`N`,`NO`) |
| `cb_person_cred_hist_length` | Tempo - em anos - desde a primeira solicitação de crédito ou aquisição de um cartão de crédito |

### id

Tabela que relaciona os IDs de cada informação da pessoa solicitante

| Feature | Característica |
| --- | --- |
|`person_id`|ID da pessoa solicitante|
|`loan_id`|ID da solicitação de empréstico de cada solicitante|
|`cb_id`|ID do histórico de cada solicitante|
