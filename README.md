# Wohai
The good Rails template.

## Commands

### Installation

- Run `make install`

### Runn the app

- Run `make serve`

### Migrate the database

- Run `make db:migrate`

### Reset the database

- Run `make db:reset`

### Run tests

- Run `make test`

### Deploy the app

- Run `make deploy`

## Generators

### Generate templates

- Run `ruby lib/templates/generate.rb Type name`

  e.g.

  ```sh
   ruby lib/templates/generate.rb Invoker flag_and_archive_todo_flow
   ruby lib/templates/generate.rb Validator check_todo_exists
   ruby lib/templates/generate.rb Command flag_todo
   ruby lib/templates/generate.rb Callback archive_todo
   ruby lib/templates/generate.rb Client import_remote_todos
  ```

## Contribution
Sylvance Mbaka.
