# https://stackoverflow.com/a/14061796/2237879
#
# This hack allows you to run make commands with any set of arguments.
#
# For example, these lines are the same:
#   > make g devise:install
#   > bundle exec rails generate devise:install
# And these:
#   > make add-migration add_deleted_at_to_users deleted_at:datetime
#   > bundle exec rails g migration add_deleted_at_to_users deleted_at:datetime
# And these:
#   > make add-model Order user:references record:references{polymorphic}
#   > bundle exec rails g model Order user:references record:references{polymorphic}
#
RUN_ARGS := $(wordlist 2, $(words $(MAKECMDGOALS)), $(MAKECMDGOALS))

add-migration:
	bundle exec rails g migration $(RUN_ARGS)

add-model:
	bundle exec rails g model $(RUN_ARGS)

db-create:
	bundle exec rake db:create

db-migrate:
	bundle exec rake db:migrate

db-rollback:
	bundle exec rake db:rollback

lint-setup:
	bundle exec rubocop --auto-gen-config

lint:
	bundle exec rubocop -a

console:
	bundle exec rails console

generate:
	bundle exec rails generate $(RUN_ARGS)

install:
	yarn install
	bundle install

reinstall:
	bundle install --redownload

serve:
	bundle exec puma -t 1:1 -b tcp://0.0.0.0:3000

sidekiq:
	bundle exec sidekiq -q critical,9 -q default,5 -q low,1

test:
	bundle exec rspec $(RUN_ARGS)

c: console

g: generate

i: install

r: reinstall

s: serve