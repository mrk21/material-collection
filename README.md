# Material Collection

This app is for technology research such as API system(GraphQL, batch requesting), admin app constructed by SPA, etc..

## Dependencies

- Ruby `= 2.5.1`
- Rails `= 5.2.0`
- MySQL `= 5.7.22`
- Node.js `= 10.8.0`
- Docker `>= 18.06.0-ce`
- direnv `>= 2.17.0`

### Installation

The almost dependency packages installed on Docker environment, so all you need to do is install Docker and direnv.

#### for mac

- [Docker](https://www.docker.com/)
  1. Install [Docker for Mac](https://www.docker.com/products/docker-desktop)
- [direnv](https://github.com/direnv/direnv)
  1. Install [Homebrew](https://brew.sh/index_ja)
  2. Enter `brew install direnv` command
  3. Describe boot up settings to `.bashrc` or `.zshrc`

## Setup

```bash
$ cp .envrc.local.sample .envrc.local
$ vi .envrc.local
$ direnv allow .
$ cp .env.sample .env
$ vi .env
$ cp web-app/.env.sample web-app/.env
$ vi web-app/.env
$ docker-compose build
$ docker-compose run app bundle install
$ docker-compose run app rails db:setup
$ docker-compose run webapp npm install
$ docker-compose up
$ open http://localhost:$DOCKER_HOST_WEBAPP_PORT
```

## Test

You can execute tests by the commands listed below:

```bash
$ docker-compose run app rspec # or docker-compose exec ...
```

## RDB connection

You can connect to the RDB by the commands listed below:

```bash
$ docker-compose run db mysql # or docker-compose exec ...
```

Or you can connect to it by your RDB client with the settings listed below:

- Host `127.0.0.1`
- Port `<value of $DOCKER_HOST_DB_PORT>`
- User `root`
- Password `<no password>`
- Database `material-collection_development`

## Code Formatting & Linting

### Ruby codes

Ruby codes of this project can be formatted/linted by RuboCop:

**Check**

```bash
$ docker-compose run app rubocop # or docker-compose exec ...
```

**Check & auto collect**

```bash
$ docker-compose run app rubocop -a # or docker-compose exec ...
```

**Refer to**

- [RuboCop: The Ruby Linter that Serves and Protects](https://rubocop.readthedocs.io/en/latest/)

### TypeScript codes

TypeScript codes of this project can be formatted/linted by TSLint/Prettier:

**Check**

```bash
$ docker-compose run webapp npm run lint # or docker-compose exec ...
```

**Check & auto collect**

```bash
$ docker-compose run webapp npm run lint:fix # or docker-compose exec ...
```

## More documentation

- https://mrk21.kibe.la/shared/entries/144381ef-2b22-4908-acab-d9925cc9a997