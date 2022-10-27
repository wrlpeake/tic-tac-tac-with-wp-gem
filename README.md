# Ruby Tic-Tac-Toe Starter Project - Will Peake

This is a Tic-Tac-Toe (AKA Knoughts & Crosses here in the UK) game which uses my `tic_tac_toe_wp` gem to provide the game logic.

## Setup

1. Ensure Ruby is installed on your machine with a package manager of your choice
1. Run `bundle add tic_tac_toe_wp` to install the `tic_tac_toe_gem` which contains the game logic.
1. Run `bundle install`

## How to Play

1. Start the game by running `ruby lib/game_starter.rb` from your command line while you are inside the directory

## Testing

1. Run `rspec` for one run of the test suite
2. Run `bundle exec guard` to start the test watcher

## Rubocop

1. To run `rubocop` gem to as a linter and formatter, run `rubocop` from the command line while inside the directory

## Test Coverage

1. To see the test coverage report from `simplecov`, run the test suite with `rspec` then run `open coverage/index.html` to show the report in your browser. **Note:** [This guide](https://dwheeler.com/essays/open-files-urls.html) can help if you're unsure which command your particular operating system requires.

