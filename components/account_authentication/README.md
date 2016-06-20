# AccountAuth
This is a quick guide to use the AccountAuth Engine for Ruby on Rails Applications.

This engine adds an authentication syntax (based on Devise) to your application.

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

This will add an initializer to your *config/initializers* folder and mount the engine in your routes.



After you install AccountAuth, you need to set the classname for the User in the *config/initializers/account_auth.rb* file to something like that:

```ruby
AccountAuth.user_class = "User"
```


The engine is mounted to the */account* path within your applications routes:

```ruby
mount AccountAuth::Engine, at: "/account", as: "account_auth"
```

Feel free to specify another path.


## User Migration
Make sure your user migration has at least the following attributes (based on Devise):

```ruby
class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
  end
end
```

## License

MIT License.

