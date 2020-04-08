# SOCIAL MEDIA LISTS V2 -   Vinícius Gregório

## Instalação

Rails 5.2.1

É necessário configurar os acessos à base de dados no arquivo database.yml
A aplicação foi desenvolvida utilizando [MySQL](https://www.mysql.com/) como base de dados porém pode ser alterada para utilizar [PostgreSQL](https://www.postgresql.org/) ou outra base de dados com alterações no Gemfile (para o adaptador) e no database.yml.

Para utilização em máquina de desenvolvimento com outros projetos Rails em versões diferentes, recomendo a utilização de um sistema gestor de stacks de desenvolvimento, como o [RVM](https://rvm.io/). Caso esse seja o seu caso, crie uma nova gemset com os comandos abaixo:

```
rvm gemset create rails-social-media-lists
rvm gemset use rails-social-media-lists
```

Após definir a gemset atual, execute o bundler para baixar todas as dependências do projeto:

```
bundle install
```

Após atualizar a gemset com as dependências da aplicação, é necessário inicializar a base de dados para a utilização:

```
rake db:create db:migrate db:seed
```

## Dependências

A aplicação utiliza as dependências abaixo:

[rspec](https://github.com/rspec/rspec-rails) - Utilizei o RSpec para os testes unitários e para os testes integrados (features).

[capybara](https://github.com/teamcapybara/capybara) - Utilizado para testes de integração para simular a navegação do usuário.

[shoulda-matchers](https://github.com/thoughtbot/shoulda-matchers) - Gem com DSL utilizada para facilitar o desenvolvimento dos testes integrados do sistema.

[factory_bot_rails](https://github.com/thoughtbot/factory_bot_rails) - Utilizado para a geração de stubs para os testes automátizados.

[faker](https://github.com/faker-ruby/faker) - Utilizado para a geração de dados fake para os stubs nos testes e para popular a base de dados de desenvolvimento.

[database_cleaner](https://github.com/DatabaseCleaner/database_cleaner) - Gem utilizada para limpar e manter a base de dados de testes e stubs estável.

[seedbank](https://github.com/james2m/seedbank) - Para organizar o carregamento da base de dados em diversas tabelas e, também, para não poluir um único arquivo de db/seeds.rb.

[annotate_models](https://github.com/ctran/annotate_models) - Gem utilizada para gerar comentários e documentação em modelos e testes com o mapeamento das colunas em base de dados para um recurso

[will_paginate](https://github.com/mislav/will_paginate) e [will_paginate-bootstrap4](https://github.com/delef/will_paginate-bootstrap4) - Gems utilizadas para gerar a paginação na interface de listagem dos posts.

A aplicação também utiliza CDNs específicas para realizar o link para componentes visuais (bootstrap).

## Sobre a tarefa

A atividade propõe a criação de uma aplicação simples para a listagem de registros de mídias sociais, segmentados por redes sociais e listagens de pessoas.

A modelagem de dados segue o princípio de que uma pessoa pode ter diversas contas de mídias sociais, mesmo que diversas de uma mesma rede. Essas contas podem ter postagens com características próprias que também permitam um filtro pelo seu conteúdo.

Essas pessoas podem ser organizadas em listas e, todos os posts das suas contas de mídias sociais, seriam atrelados a essa listagem.

Esse cenário permite algumas abordagens de desenvolvimento pois o conteúdo é rico e fragmentado em diversas entidades distintas de negócios, podendo ser filtrado por diversos critérios.

Para solucionar o tarefa e manter o mínimo de dependências externas, sem sacrificar a performance da aplicação, optei por utilizar uma combinação de scopes nas entidades propostas para esse cenário.

Essa solução permite um código limpo e de fácil compreensão, além da reutilização de código em um módulo específico apartado (Filterable) que permite extender esse conceito também para as actions dentro do controller.

Os scopes também facilitam o desenvolvimento de filtros com múltiplas listas ou redes sociais. As redes sociais foram apartadas em uma entidade específica na base de dados, com campos indicativos para a carga em tempo de execução dos conectores necessários e qual a URL base para a obtenção dos posts.

Assim, embora a tarefa indique para não realizar, seria possível instalar um activeadmin e gerenciar todas as entidades da base de dados, inclusive incluir novas redes sociais sem a necessidade de alterações no código.

Ainda dentro do padrão do Rails (ActiveRecord), foi possível utilizar o dependent: :nullify para atender ao requisito de manter todas as postagens da base de dados mesmo com a exclusão do author.

## Outras escolhas para o mesmo resultado

Uma possibilidade seria utilizar daemons apartados do código para realizar a indexação desses dados em formatos pré-configurados para os tipos de buscas a serem utilizadas. sunspot-solr ou elastic-search seriam boas opções para essa arquitetura da solução.

Porém, esse tipo de solução exige a instalação de serviços adicionais na máquina do usuário e complicações extras desnecessárias para uma aplicação com esse porte. Motivos pelos quais essa opção foi descartada.

Outra possibilidade com ótimos resultados seria utilizar uma base de dados não relacional, como MongoDB com mongoid por sua característica de flexibilidade na estrutura de dados, permitindo uma filtragem mais simplificada dos dados.

## Melhorias Futuras

Uma das melhorias significativas para essa aplicação seria o desenvolvimento de uma API para a consulta desses dados por demais aplicações, em conjunto com o desenvolvimento da interface em um framework como Angular ou Node.

## Tests

Para rodar os testes:

```
rspec
```

ou

```
bundle exec rspec
```

Os teste foram cruciais para definirmos os relacionamentos entre as entidades propostas no exercício e também para verificar as possibilidades de filtros.

As definições de como realizar os testes e o quê deve ser testado em uma aplicação são assuntos de diversos debates contínuos literalmente por décadas na comunidade de desenvolvimento, com proponentes e defensores de diversas abordagens.

Para a padronização dos testes utilizei como referência:

[https://rspec.info/about/](https://rspec.info/about/)
[http://www.betterspecs.org/](http://www.betterspecs.org/)
[https://thoughtbot.com/blog/testing-named-scopes](https://thoughtbot.com/blog/testing-named-scopes)
[https://blog.davidchelimsky.net/blog/2012/02/12/validations-are-behavior-associations-are-structure/](https://blog.davidchelimsky.net/blog/2012/02/12/validations-are-behavior-associations-are-structure/)
