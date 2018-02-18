# README

# MARRE DE TWITTER !
Désolé, mais les bots twitter et moi on n'est pas copain et j'ai BEAUCOUP de mal à comprendre ce qu'il faut faire.

* Ruby version : 2.3.4
* Rails version : 5.1.4
* Gems added :
> * twitter
> * dotenv-rails
* Services : send_tweet.rb


## Deployment instructions
One file added that is on the .gitignore list :
> * .env with my personal .env password, so if you're downloading the app from this repo, you should use your own .env files :
TWITTER_CONSUMER_KEY = your_consumer_key
TWITTER_CONSUMER_SECRET = your_consumer_secret_key
TWITTER_ACCESS_KEY = your_access_key
TWITTER_ACCESS_SECRET = your_access_secret_key


## Gem dotenv-rails
Ajouter la gem dans le Gemfile, dans le groupe :development et le groupe :test :
> * gem 'dotenv-rails'

Créer un fichier .env (juste l'extension) en racine de l'app (même niveau que le .gitignore) et y stocker les mots de passe sous la forme (en fait, il s'agit de donner des noms de variables aux mots de passe pour les masquer) :
ADMIN_PASSWORD = qsdmkazeori2290dd
ou
TWITTER_CONSUMER_KEY = qsdmkazeori2290dd
TWITTER_CONSUMER_SECRET =  qsdmkazeori2290dd
TWITTER_ACCESS_KEY =  4501301836-qsdmkazeori2290dd
TWITTER_ACCESS_SECRET = qsdmkazeori2290dd

Rajouter le fichier .env dans le fichier .gitignore pour que les mots de passe ne soient pas pushé sur github ou sur heroku (et mis à disposition de tout le monde...) :
> * .env

Dans l'application, on utilisera les noms donnés aux mots de passe et non les mots de passe eux-mêmes afin de les protéger.


## Gem Bootstrap
Ajouter la gem dans le Gemfile (pas de groupe) :
> * gem 'bootstrap', '~> 4.0.0' (ou autre version)
> * gem 'sass-rails', '~> 5.0' (Bootstrap est en sass, les fichiers css doivent normalement avoir l'extension .sass. Sass-rails permet d'utiliser l'extension .scss

Dans le fichier **.scss** qui va bien, rajouter au début @import "Bootstrap" pour utiliser les class Bootstrap (consulter www.w3school.com pour les classes). Dans app/assets/stylesheets, on peut utiliser le fichier application.css à condition de changer l'extension en .scss. Sinon, on peut créer un autre fichier (ici custom.scss) et mettre le @import "Bootstrap" en tête du fichier.


## Problème avec un model qui bloque un rails db:migrate
bundle exec rails db:rollback    
rails destroy model <model_name>

When you generate a model, it creates a database migration. If you run 'destroy' on that model, it will delete the migration file, but not the database table. So before run :
bundle exec rake db:rollback

