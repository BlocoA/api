# Bloco A API

Para rodar o projeto em modo desenvolvimento, temos as opções com e sem Docker.

## Sem Docker

Instale as dependências a seguir:

- Ruby 3.1.2
- Bundler (`gem install bundler` depois de instalar o Ruby)
- PostgreSQL >= 11.0

Rode os comandos: 

```bash
bundle install
bundle exec rails server -p 5000 -b 0.0.0.0
```

A aplicação estará rodando em: http://localhost:5000

## Com Docker

Tenha a última versão do Docker e Docker Compose instalada.

Rode o comando:

- `docker compose up`
