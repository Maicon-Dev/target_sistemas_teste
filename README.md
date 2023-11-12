# Teste flutter

## Funcionalidades

- Autenticação com Firebase
- Armazenamento de dados com Firestore
- Funcionalidade de login
- Operações CRUD para as notas separada por usuários

##  Usuários para teste
- Usuario 1
  - userName: usuario1
  - password: usuario1
- Usuario 2
  - userName: usuario2
  - password: usuario2

## Observações

 - Algumas informações que deveriam ser secretas, como dados de conexão com o Firebase, foram deixadas no commit para facilitar a avaliação do código. Em uma situação real, essas informações seriam armazenadas de forma segura usando variáveis de ambiente.

 - Quando o aplicativo é fechado, o login é perdido. Isso foi feito de forma intencional, pois não há um botão de logout disponível. Para deslogar, basta fechar o aplicativo e fazer login novamente ou se estiver rodando em debug é necessário apenas um restart.

## Arquitetura
  ### Autenticação
  - Não autenticação é pedido para se autenticar com usuario, como não é escificado ser um email fiz a suposição de que seria por nome de usuário apenas e não usando email. Como usei o firebase e nas opções gratuitas não usa uma autenticação usando nome de usuário criei um coleção no banco chamado Users, nessa coleção é oonde seria armazenado o nome de usuário e possui um dado que funciona como uma chave estrangeira que seria o email do usuario funciona da seguinte forma:
    - O usuário se tenta fazer login usando email e senha
    - Logo após isso é realizado uma busca na coleção de usuários por aquele usuário e ele retorna os dados desse usuário
    - Com o resultado da busca de usuário é retirado da resposta o email do usuario e enviado uma requisição de login ao firebase pelo método signInWithEmailAndPassword
    - Se os dados estiverem corretos ele entrará na conta armazenando as informações do usuário logado na store, caso contrário retornará um erro de autenticação.

## Contato
 - Estou disponível para contato para tirar quaisquer dúvidas ou fornecer mais informações sobre o projeto.
 - Se você tiver alguma dúvida ou sugestão, por favor entre em contato através do email [maiconmoraisfs@gmail.com](maiconmoraisfs@gmail.com) ou visite meu site https://maiconmorais.netlify.app/#/.
