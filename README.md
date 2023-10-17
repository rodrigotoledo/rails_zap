# Projeto Rails ZAP (clone do whatsapp usando Ruby on Rails)
O intuito deste projeto é recriar o mínimo visual do que o aplicativo web whatsapp oferece a seus usuários e também algumas funcionalidades ativas.

Já deixando bem claro que nem tudo será perfeitamente igual pois é um aplicativo muito complexo portanto a idéia é objetividade.

## O que será utilizado
- Ruby on Rails 7.x
- ChatGPT
- Devise
- TailwindCSS
- Material Icons
- Stimulus
- StimulusReflex
- Broadcasting com hotwire-rails
- Docker para
  - Redis

## O que será recriado
A interface principal que envolve a lista de últimas conversas em sua área a esquerda.

Centralmente, ao clicar em uma conversa serão exibidas as mensagens recebidas e enviadas para o usuário em questão.

Possibilidade de na mesma tela enviar uma mensagem ao usuário em questão.

## O que NÃO será recriado
As funcionalidades de multimídia e ações das mesmas envolvem muito tempo de estudo e preparo para fazer da maneira mais correta possível, portanto nessa versão não irei desenvolver.

Telas para Login e Criação de conta também não será utilizado, apesar de já ser utilizado Devise como opção de autenticação.

Recriação 100% fiel da versão mobile. Tentarei deixar próximo mas não irei dar prioridade.

## Idéia da estrutrura do banco de dados

- Tabela `users` e seus campos
```
id
email
username
name
profile_picture
```

- Tabela `conversations` e seus campos
```
id
```

- Tabela `conversations_users` e seus campos
```
id
user_id
conversation_id
```

- Tabela `messages` e seus campos
```
id
conversation_id
user_id
message
```

## Contato para ajuda na live
rodrigo@rtoledo.inf.br

+5533991221596 (whatsapp)