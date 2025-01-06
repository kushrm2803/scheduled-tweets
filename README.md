# Scheduled Tweets Application

## What is Scheduled Tweets?
Scheduled Tweets is a web application that allows users to connect their X accounts, schedule tweets, and post them efficiently. It provides an intuitive interface for handling scheduled content, making use of the X API to automate tasks related to posting tweets at specific time.
While the application includes a functional Bootstrap-based interface, its primary focus remains on demonstrating Rails capabilities in handling backend operations, background job processing, and third-party API integrations. The frontend serves primarily as a practical interface to interact with the backend systems.

## Tech Stack
* **Framework**: Ruby on Rails
* **Database**: SQLite3
* **Authentication**: OmniAuth for Twitter
* **Background Jobs**: Sidekiq
* **Cache Store**: Redis
* **Styling**: Bootstrap 5 for UI components

## Features
* **User Authentication**: Secure sign-up and sign-in using email and password.
* **Twitter Account Management**: Connect to X and manage accounts directly within the application.
* **Scheduled Tweets**: Create, edit, and delete scheduled tweets with customizable scheduled timings.
* **Password Management**: Securely update passwords and manage user credentials (Stored securely using ruby-hash).
* **Forgot Password Functionality**: Password reset options for users (Mailer-link to reset the password of user).
* **Flash Notifications**: Display messages to users (success and error messages) upon actions.

## Dependencies
### Gems Used
```ruby
gem 'rails'
gem 'sqlite3'
gem 'puma'
gem 'sidekiq'
gem 'redis'
gem "turbo-rails"
gem "omniauth-twitter"
gem "omniauth-rails_csrf_protection"
gem "x"
```

## How to Run the Application

### 1. Prerequisites
* Ruby on Rails
* Redis server
* SQLite3
* Node.js and Yarn

### 2. Setup the Application
* Clone the repository:
```bash
git clone https://github.com/kushrm2803/scheduled-tweets.git
cd scheduled-tweets
```

* Install all required gems:
```bash
bundle install
```

* Set up the database:
```bash
rails db:setup
```

### 3. Configure Environment
* Run the following command to edit the credentials file:
```bash
rails credentials:edit
```

```yml
twitter:
  api_key: "YOUR_API_KEY"
  api_secret: "YOUR_API_SECRET_KEY"
  access_key: "YOUR_ACCESS_TOKEN"
  access_secret: "YOUR_ACCESS_TOKEN_SECRET"
```

### 4. Starting the Application
You need to start three processes in separate terminal windows:

1. Start Rails server:
```bash
rails server
```

2. Start Redis server:
```bash
redis-server
```

3. Start Sidekiq worker process:
```bash
bundle exec sidekiq
```

The application will be available at: http://localhost:3000

**Important Note**: All three processes (Redis, Sidekiq, and Rails server) must be running simultaneously for the application to function properly.