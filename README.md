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

### Generate commands

- Run `script/generate app/commands/[resource]/[action].rb`
  e.g.
  ```sh
   script/generate app/commands/todo/create.rb
  ```

### Generate events

- Run `script/generate app/events/[resource]/[action].rb`
  e.g.
  ```sh
   script/generate app/events/todo/todo_created.rb
  ```

### Generate reactors

- Run `script/generate app/reactors/[resource]/[noun].rb`
  e.g.
  ```sh
   script/generate app/reactors/todo/new_todo.rb
  ```

### Generate creators

- Run `script/generate app/creators/pattern/[resource]/[action].rb`
  e.g.
  ```sh
   script/generate app/creators/builders/todo/new_todo.rb
  ```

### Generate strategies

- Run `script/generate app/strategies/pattern/[resource]/[action].rb`
  e.g.
  ```sh
   script/generate app/strategies/builder/todo/new_todo.rb
  ```

## Contribution
Sylvance Mbaka.
