# Rails ZAP Project (WhatsApp clone using Ruby on Rails)

The purpose of this project is to recreate the visual aspects and some active functionalities of the WhatsApp web application. Please note that not everything will be perfectly identical since WhatsApp is a very complex application; therefore, the goal is to achieve a simplified version.

## What will be used
- Ruby on Rails 7.x
- ChatGPT
- Devise
- TailwindCSS
- Material Icons
- Stimulus
- StimulusReflex
- Broadcasting with hotwire-rails
- Docker with Redis

## What will be recreated
The main interface that includes the list of recent chats on the left-hand side.

When clicking on a chat, the received and sent messages for the respective user will be displayed in the center.

Ability to send a message to the selected user on the same screen.

## What will NOT be recreated
Multimedia features and their related actions involve a significant amount of study and preparation to implement correctly. Therefore, these functionalities will not be developed in this version.

Screens for login and account creation will also not be used, despite Devise being an authentication option.

A 100% faithful recreation of the mobile version will not be the top priority. The goal is to get it close, but not to prioritize it.

## Database Structure Idea

- table and its fields
```
id
email
username
name
profile_picture
```

- `conversations` table and its fields
```
id
```

- `conversations_users` table and its fields
```
id
user_id
conversation_id
```

- `messages` table and its fields
```
id
conversation_id
user_id
message
```

## Running
To run the applicationn you need to run the following
```
./dev docker
```

Clearing the jobs
```
docker compose run web rails jobs:clear_queue
```

## Contact for assistance during the live session
rodrigo@rtoledo.inf.br

+5533991221596 (whatsapp)