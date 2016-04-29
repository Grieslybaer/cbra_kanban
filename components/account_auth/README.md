# CommentEngine
This is a quick guide to use the AccountAuth Engine for Ruby on Rails Applications.
This engine adds a authentication syntax, based on Devise, to your application.

## Getting started
AccountAuth works with Rails 4.2 onwards. As its not available on a Gemserver, you need to download it manualy and put it somewhere in your application. I recommend to put it into your *vendor/* folder. Maybe create another folder called *engines*. You can then add it to your Gemfile with:

```ruby
gem 'account_auth', path: "vendor/engines/account_auth"
```

Run the bundle command to install it.

Afterwards run:

```console
rails generate account_auth:install
```

This will add an initializer to your *config/initialiters* folder and mount the engine in your routes.

After you install AccountAuth, you need to set the classname for the User in the *config/initializers/account_auth.rb* file to something like that:

```ruby
AccountAuth.user_class = "User"
```

The engine is mounted to the */account* path within your applications routes:

```ruby
mount AccountAuth::Engine, at: "/account", as: "account_auth"
```

Feel free to specify another path.

## Uninstall AccountAuth
The command below will remove all migrations from the engine:
```console
rake db:migrate SCOPE=account_auth VERSION=0
```

## License

MIT License.

