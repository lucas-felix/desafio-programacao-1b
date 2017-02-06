# Desafio de programação 1B

Programa que recebe um arquivo `.txt` no formato <a href="https://en.wikipedia.org/wiki/Tab-separated_values" target="_blank">TSV (Tab-separated values)</a>,
via upload, e salva os dados em um banco de dados.

Os dados são normalizados, e inseridos em suas devidas tabelas no banco de dados.

## Preparando o ambiente

As seguints tecnologias são utilizadas:

- Ruby 2.3.3
- Rails 4.2.7.1
- SQLite 3.11

Recomenda-se utilizar o RVM para instalar o ruby: https://rvm.io/rvm/install

```bash
$ rvm install 2.3.3
$ rvm use 2.3.3
$ ruby -v
ruby 2.3.3p222 (2016-11-21 revision 56859) [x86_64-linux]
```

Para instalar o Rails, execute o seguinte comando:

```bash
$ gem install rails -v 4.2.7.1
```

Em seguida verifique se tudo funcionou. O seguinte comando deve retornar a versão do Rails:

```bash
$ rails -v
```

A maioria dos sistemas Unix-like vêm com o SQLite instalado. Você pode verificar por meio do seguinte comando. O retorno
deve ser a versão do SQLite:

```bash
$ sqlite3 --version
```

## Executando a aplicação

Acesse o diretório do projeto:

```bash
$ cd desafio-programacao-1b
```

Em seguida execute os seguintes comandos:

```bash
$ bundle install
$ rake db:migrate
$ rails s
```

Por fim, acesse <a href="http://localhost:3000" target="_blank">http://localhost:3000</a> para utilizar a aplicação.

Para executar os testes:

```bash
$ rspec
```
