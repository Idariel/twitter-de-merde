# README : MARRE DE TWITTER !
Désolé, mais les bots twitter et moi on n'est pas copain et j'ai BEAUCOUP de mal à comprendre ce qu'il faut faire.
* Ruby version : 2.3.4
* Rails version : 5.1.4
* Gems added :
> * twitter
> * dotenv-rails
* Services : send_tweet.rb

##
## Deployment instructions
One file added that is on the .gitignore list :
> * .env with my personal .env password, so if you're downloading the app from this repo, you should use your own .env files :
TWITTER_CONSUMER_KEY = your_consumer_key
TWITTER_CONSUMER_SECRET = your_consumer_secret_key
TWITTER_ACCESS_KEY = your_access_key
TWITTER_ACCESS_SECRET = your_access_secret_key

##
## Gem dotenv-rails
Ajouter la gem dans le Gemfile, dans le groupe :development et le groupe :test :
> * gem 'dotenv-rails'

Créer un fichier .env (juste l'extension) en racine de l'app (même niveau que le .gitignore) et y stocker les mots de passe sous la forme (en fait, il s'agit de donner des noms de variables aux mots de passe pour les masquer) :
> ADMIN_PASSWORD = qsdmkazeori2290dd
ou
> TWITTER_CONSUMER_KEY = qsdmkazeori2290dd
> TWITTER_CONSUMER_SECRET =  qsdmkazeori2290dd
> TWITTER_ACCESS_KEY =  4501301836-qsdmkazeori2290dd
> TWITTER_ACCESS_SECRET = qsdmkazeori2290dd

Rajouter le fichier .env dans le fichier .gitignore pour que les mots de passe ne soient pas pushé sur github ou sur heroku (et mis à disposition de tout le monde...) :
> * .env

Dans l'application, on utilisera les noms donnés aux mots de passe et non les mots de passe eux-mêmes afin de les protéger.

##
## Gem Bootstrap
Ajouter la gem dans le Gemfile (pas de groupe) :
> * gem 'bootstrap', '~> 4.0.0' (ou autre version)
> * gem 'sass-rails', '~> 5.0' (Bootstrap est en sass, les fichiers css doivent normalement avoir l'extension .sass. Sass-rails permet d'utiliser l'extension .scss

Dans le fichier **.scss** qui va bien, rajouter au début @import "Bootstrap" pour utiliser les class Bootstrap (consulter www.w3school.com pour les classes). Dans app/assets/stylesheets, on peut utiliser le fichier application.css à condition de changer l'extension en .scss. Sinon, on peut créer un autre fichier (ici custom.scss) et mettre le @import "Bootstrap" en tête du fichier.

##
## L'API
En gros, une API permet de profiter des services d'un site sans passer par l'interface graphique du site. Tu vas sur une adresse web, dans laquelle il y a des clés d'APIs, qui permet d'effectuer des actions du service. Ainsi, il est possible de tweeter, on d'envoyer des messages Facebook, ou encore de récupérer une liste de messages d'un chan Slack en utilisant les APIs de ces services. Pour la majorité des gros sites, tu pourras trouver des wrappers d'APIs en ruby, ce qui te permettra d'aviter de coder toutes les reqûetes à la main : il de suffira de rentrer tes clés d'APIs, puis de faire facebook.update_status("Mon statut !") et hop trop facile.
##
## Gem Twitter
Ligne très importante qui appelle la gem. Sans elle, le programme ne saura pas appeler Twitter :
require 'twitter'

Mettre gem "twitter" dans le Gemfile.

### Configuration
https://apps.twitter.com/
Dans Twitter API, vous devez créer et enregistrer votre application. Ensuite, cliquez sur le bouton 'OAuth'. Bien entendu, il faut vérifier le niveau d'autorisation sinon on risque d'avoir l'erreur :
> Read-only application cannot POST
Sur la page qui apparaît, vous avez votre "consumer_key", "consumer_secret_key", "access_token" et "access_secret" qui seront réutilisés dans l'application, sinon :
> Bad Authentication data

Quelques lignes qui enregistrent les clés d'APIs :
Les options de configuration peuvent être transmises dans ce block :
client = Twitter::REST::Client.new do |config|
> config.consumer_key        = "YOUR_CONSUMER_KEY"
> config.consumer_secret     = "YOUR_CONSUMER_SECRET"
> config.access_token        = "YOUR_ACCESS_TOKEN"
> config.access_token_secret = "YOUR_ACCESS_SECRET"
end

Ligne qui permet de tweeter
client.update('Mon premier tweet en ruby !!!!')

### Exemples d'utilisations :
Après avoir configuré le client, vous pouvez faire les choses suivantes :
> Tweet (en tant qu'utilisateur authentifié)
> > client.update("I'm tweeting with @gem!")
> Suivre un user (par pseudo ou user_id)
> > client.follow("gem")
> > client.follow(213747670)
> Récupérer un user (par pseudo ou user_id)
> > client.user("gem")
> > client.user(213747670)
> Récupérer une liste de follower avec infos de profil (par pseudo ou user_id, or ou par authentification implicite)
> > client.followers("gem")
> > client.followers(213747670)
> > client.followers
> Récupérer une liste d'amis' avec infos de profil (par pseudo ou user_id, or ou par authentification implicite)
> > client.friends("gem")
> > client.friends(213747670)
> > client.friends
> Récupérer la timeline des tweets d'un utilisateur
> > client.user_timeline("gem")
> > client.user_timeline(213747670)
> Récupérer la timeline des tweets à partir de la home d'un utilisateur authentifié
> > client.home_timeline
> Récupérer la timeline des tweets citant un utilisateur authentifié
> > client.mentions_timeline
> Récupérer un tweet particulier avec son ID
> > client.status(27558893223)
> Récupérer les 3 plus récentes demandes en mariage adressées à @justinbieber
> > client.search("to:justinbieber marry me", result_type: "recent").take(3).collect do |tweet|
> > > "#{tweet.user.screen_name}: #{tweet.text}"
> > end
> Trouver un tweet en japonais avec le tag #ruby (en excluant les retweets)
> > client.search("#ruby -rt", lang: "ja").first.text
### Streaming
Le streaming de site est réservé au comptes whitelisté. Pour demander l'accès, suivre les instruction de la documentation concernant le streaming de sites. User Streams ne nécessite pas d'être approuvé par avance.
#### La configuration est la même que pour Twitter::REST::Client
> client = Twitter::Streaming::Client.new do |config|
> > config.consumer_key        = "YOUR_CONSUMER_KEY"
> > config.consumer_secret     = "YOUR_CONSUMER_SECRET"
> > config.access_token        = "YOUR_ACCESS_TOKEN"
> > config.access_token_secret = "YOUR_ACCESS_SECRET"
> end
#### Streamer une série aléatoire de tweets
> client.sample do |object|
> > puts object.text if object.is_a?(Twitter::Tweet)
> end
#### Streamer toutes les tweets avec café ou thé dedans
> topics = ["coffee", "tea"]
> client.filter(track: topics.join(",")) do |object|
> > puts object.text if object.is_a?(Twitter::Tweet)
> end
#### Stream tweets, events, and direct messages for the authenticated user
> client.user do |object|
> > case object
> > when Twitter::Tweet
> > > puts "It's a tweet!"
> > when Twitter::DirectMessage
> > > puts "It's a direct message!"
> > when Twitter::Streaming::StallWarning
> > > warn "Falling behind!"
> > end
> end
#### Quelques autres exemples d'objets :
> Twitter::Tweet
> Twitter::DirectMessage
> Twitter::Streaming::DeletedTweet
> Twitter::Streaming::Event
> Twitter::Streaming::FriendList
> Twitter::Streaming::StallWarning

##
## Rajout de gems dans le Gemfile
Bien sûr, pour tester en local, il ne faut pas oublier de :
> * soit installer chaque gem individuellemen (install gem maGem)
> * soit faire un *bundle install* (--without production si vous utiliser le Gemfile de Félix)

##
## Problème avec un model qui bloque un rails db:migrate
> * bundle exec rails db:rollback    
> * rails destroy model <model_name>

Quand vous générer un model, cela crée une migration. If vous détruisez uniquement le model, cela détruira aussi le fichier de migration, mais pas la base modifiée par cette migration (schema.rb). Il faut donc ramener la base de donnée à son état AVANT la migration, et seulement ensuite détruire le model.

Dans le cas, où vous avez créé un model, mais que le rails db:migrate ne se fait pas (m'est déjà arrivé), le rollback est inutile. Il faut simplement faire rails destroy model <model_name>
