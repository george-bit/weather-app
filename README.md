# README

In order to run this application you will need to first git clone the repository onto your machine:

`git clone git@github.com:george-bit/weather-app.git`

You will then need to make sure you have the following dependencies installed via Homebrew

`brew install`

- postgresql
- ruby
- yarn
- webpacker
- bundler

Before running you will first need to create a database and migrate it

`rails db:create`
`rails db:migrate`

You will then need to run

`bundle exec rails server`

You can then visit http://localhost:3000/
