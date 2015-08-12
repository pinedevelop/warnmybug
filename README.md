[![Build Status](https://travis-ci.org/pinedevelop/warnmybug.svg?branch=master)](https://travis-ci.org/pinedevelop/warnmybug) [![Code Climate](https://codeclimate.com/github/pinedevelop/warnmybug/badges/gpa.svg)](https://codeclimate.com/github/pinedevelop/warnmybug) [![Test Coverage](https://codeclimate.com/github/pinedevelop/warnmybug/badges/coverage.svg)](https://codeclimate.com/github/pinedevelop/warnmybug/coverage)
# warnmybug

Warnmybug is a great, free and open source project to help take care of javascript log's/error/warnings in the browser.

- Create a project
- Copy project js snippet and paste it in your website
- Invite other users
- Get e-mailed all logs/errors/warnings that happen in user browsers
- See a summary of notifications/reports/statistics on the project web page
	
***

Warnmybug é um projeto, free e de código aberto que ajuda os seus usuários a cuidar dos logs/erros/warnings de javascript que ocorrem no browser dos clientes.

- Crie um projeto
- Copie o snipet javascript gerado e cole no seu projeto
- Convide outros usuários
- Receba através de e-mail todos os logs/erros/warnings que acontecerem nos browsers de seus clientes
- Acompanhe as notificações/relatórios/estatisticas na página do projeto

## Usage

You can clone the git repository and deploy it on your environment or feel free to use our infrastructure at

`https://warnmybug.com`

***

Você pode clonar o projeto e fazer deploy usando sua infraestrutura, ou se preferir, é bem vindo a usar a nossa:

`https://warnmybug.com`

## Contributing

We would love any help to make Warnmybug a great project.

We have lots of work to do, features to implement, and ideas to think about. You are very welcome to join us and contribute to the project.

When contributing please consider:

- If you have any question or anything you wanna discuss, please, open a github issue and we can discuss it there :)
- We love tests and we have up to 90% covered, please be a good person and keep it high

***

Nós vamos amar se você nos ajudar a transformar o warnmybug em um grande projeto.

Nós temos um monte de trabalho para fazer, funcionalidades para implementar, ideias para pensar.
Você é muito bem vindo para se juntar a nós e contribuir para o projeto.

Para contribuir com nosso projeto, leve em consideração alguns pontos:

- Se você tiver alguma dúvida ou questão que gostaria de discturi, abra uma issue no github para podermos discutir isso :)
- Nós amamos testes, nós temos uma cobertura acima de 90%, por favor seja uma boa pessoa e mantenha isso alto.

### Run locally

To run WMB at your local env you will need to install:

- Ruby
- Node
- Bower

and execute these commands at your terminal

- `bundle`
- `rake bower:install`
- `rake db:migrate db:seed`
- `rails s`

after these commands you will be able to access `http://localhost:3000` and enter with `admin@admin.com` password: `admin123456`

***

Para rodar o WMB no seu ambiente local você precisa ter instalado

- Ruby
- Node
- Bower

e executar estes comandos no seu terminal

- `bundle`
- `rake bower:install`
- `rake db:migrate db:seed`
- `rails s`

após estes comandos você deverá poder acessar `http://localhost:3000` e usar o usuário: `admin@admin.com` senha: `admin123456`
