# Avaliação de Desenvolvedor - App Tabela Periódica

Olá, logo começaremos os trabalhos! Mas primeiro um comentário importante. Você encontrará uma lista de tarefas logo abaixo. Não é necessário realizar todas, mas quanto mais avançar melhor para sua avaliação.

Durante as 48h da avaliação, você poderá fazer perguntas para esclarecer dúvidas que tenha. Mas tente ler todo o texto, pois nele contém algumas informações bem importantes pra realização da mesma.

Este pacote contém uma aplicação RubyOnRails funcional. Você não precisará criar um app do zero. Somente precisamos que você faça algumas melhorias nele.

## Como se localizar na aplicação?

Caso você não seja familiarizado com o RubyOnRails, os arquivos importantes para realizar as tarefas abaixo são:

* config/routes.rb: arquivos que registra a rota para visualização da tabela
* app/controllers/table_controller.rb: controller para onde router direciona a requisição do navegador
* app/views/table: pasta que contém o html da tabela
* db/data.json: os dados puros da tabela que você precisa para montá-la

O arquivo `db/data.json` possui uma série de dados sobre cada elemento da tabela, porém somente alguns são relevantes para essa avaliação.

Para montar um elemento corretamente na tabela, você precisará dos campos abaixo:

* name: Nome do elemento
* atomic_mass: Massa atômica
* number: Número atômico
* period: Período da tabela onde aparece o elmento
* category: Categoria/família do elemento
* symbol: Símbolo do elemento
* xpos: Posição no eixo x da tabela
* ypos: Posição no eixo y da tabela

Se você precisar de uma inspiração, existe essa tabela online https://ptable.com.

A aplicação possui um código inicial que já possibilita o carregamento dos dados para montar a tabela.

## Lista de tarefas

Você precisa implementar as melhorias abaixo:

- Implemente a visualização da tabela conforme o link informado acima;
- Insira em cada componente da tabela os dados `name`, `atomic_mass`, `number` e `symbol` conforme a tabela do link;
- Precisamos que você atribua uma cor para cada elemento, conforme sua categoria/família;
- Ao clicar num elemento, o site deve navegar para uma nova página que contém somente o elmento clicado;
- Exiba na página do elemento uma versão aumentada do mesmo, e inclua informação de níveis de energia `shells` do json.
- Também na página do elmento monte uma tabela completa com os dados extras do json.

## Como rodar a aplicação

Para desenvolvimento das atividades da avaliação, recomendamos o uso do https://www.gitpod.io. Nele você poderá desenvolver e rodar a aplicação, com um ambiente muito baseado no Visual Studio Code, diretamente no navegador, sem a necessidade de instalação de dependências em sua máquina.

Esta aplicação foi testada neste ambiente, para garantir que você tenha máximo foco na avaliação e não nas preliminares do desenvolvimento.

No entanto, se você já possui um ambiente de desenvolvimento RubyOnRails, pode utilizá-lo, sem problemas.

Seguindo os passos abaixo, você conseguirá rodar sem problemas:

- Crie o repositório no github;
- Execute os comandos abaixo no terminal dentro da pasta do projeto

```bash
git init
git add README.md
git commit -m "first commit"
git branch -M master
```

- O comando abaixo precisa do endereço do seu repositório no Github.

```bash
git remote add origin https://github.com/SEU_USUARIO/periodic_table.git
git push -u origin master
```

- Visite o https://gitpod.io e clique no link trynow
- Coloque o endereço do respositório que você acabou de criar

Ao avançar ele pedirá que faça login com sua conta do GitHub e pronto, seu ambiente ficará pronto depois de alguns minutos.

Quando o ambiente estiver pronto, você presirá rodar os comandos:

```bash
bundle install
yarn install
```

Para rodar a aplicação:

```bash
foreman start
```

## Dica importante

O Gitpod pode não conseguir rotear a chamada para a aplicação. Quando isso acontecer ele informará uma linha semelhante a que apresento abaixo.

```ruby
config.hosts << "3000-c369a0f3-02ba-4978-b123-20fd29e6dd77.ws-eu03.gitpod.io"
```

Você precisará colocar essa linha de configuração no `config/application.rb`

## Como devo entregar o código?

Todo trabalho desenvolvido deve ser entregue através de um repositório público no https://github.com.

E deve estar compatível com o ambiente do Gitpod, que é por onde faremos a avaliação do seu trabalho.

## Boa sorte!

Se tiver qualquer problema, entre em contato.

Abraços.
