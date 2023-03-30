# **Desafio DevOps**

Aqui estão os **desafios** da segunda fase do processo seletivo para os candidatos da ordem Jedi da **Let’s Code by Ada** para às vagas com o **time de DevOps**. 

# **Descrição**
Temos três desafios para serem entregues:

* **Infraestrutura**
* **Back-end**
* **Front-end**

Não existe uma receita de bolo para atingir o objetivo do desafio, as boas práticas serão avaliadas junto aos códigos que deverão ser bem documentados.
 
# **Entrega**

**Você deve:**

- criar um repositório em seu GitHub/GitLab;
- fazer o push da sua solução e enviar o link do repositório junto com seu LinkedIn e currículo (atualizados) para a nossa recrutadora;
- a implementação deve ficar em pastas de forma estruturada no GitHub/GitLab para que tenhamos fácil identificação;

Um diferencial é adicionar um conteúdo informativo que julgue ser útil ao projeto, como por exemplo uma descrição da aplicação no README com instruções de como executá-lo.
 
# **Escopo**:

A **Let’s Code by Ada** está **migrando sua infraestrutura do On-Premises para a Cloud Pública**. 

Atualmente a empresa conta com uma aplicação monolítica rodando em um único servidor e deseja segmentá-la em microserviços. 

Ela deseja utilizar todos os benefícios que a computação distribuída oferece como escalabilidade, elasticidade, redução de custos, segurança e rápido provisionamento. 

Será necessário a **criação de uma infraestrutura para hospedar as aplicações**, **segmentar a aplicação monolítica Let’s Code by Ada em front-end**, **back-end e banco de dados**, lembrando de provisionar os recursos utilizando **IaC**, **promover alta disponibilidade** e **providenciar observability minima** para as aplicações.
 
# **Introdução**

- Você pode escolher entre os provedores **AWS, Azure** ou **GCP** para entregar o seu desafio;
- A terminologia utilizada na descrição do desafio refere-se ao provedor **AWS**;
- Você deve escolher entre **Cloudformation** ou **Terraform** para entregar os recursos de infra;
- Os serviços devem ser executados em **servidores linux** e **containers kubernetes**.

Você recebeu acesso ao monolito da **Let’s Code by Ada** e é hora de segmentá-lo em microserviços. A aplicação deve oferecer três camadas isoladas: **Front-end, Back-end e Banco de Dados**. 

Sua aplicação irá rodar na nuvem e precisa de uma **VPC** configurada corretamente para sua execução com **três subnets privadas** e **três subnets públicas**. As privadas não podem ser acessadas diretamente da rede externa, as públicas devem estar expostas publicamente com os devidos cuidados.

Na **Let’s Code by Ada** todos os serviços serão **conteinerizados** e **distribuídos em clusters para cada ambiente**, sendo assim é importante que as aplicações sejam adaptáveis em cada ambiente e haja controle via código dos recursos kubernetes através de seus manifestos.

# **Mão na massa!**

## Infraestrutura
- criar vpc
- criar subnet
- criar role/policy
- criar sg
- criar banco de dados relacional
- criar cluster kubernetes

## Back-end e Front-end

Existem duas pastas, **backend** e **frontend**, nelas você irá encontrar o subdiretório **app** e um **dockerfile** que constrói a imagem da aplicação, seu objetivo é:

- construir a imagem docker da aplicação;
- criar os manifestos de recursos kubernetes para rodar a aplicação *(deployments, services, ingresses, configmap e qualquer outro que você considere necessário)*;
- criar um script para a execução do deploy em uma única execução;
- a aplicação deve ter seu deploy realizado em uma única linha de comando em um cluster kubernetes;
- a aplicação deve responder à uma URL específica configurada no ingress;
- a aplicação sobe por default utilizando a porta 3000 e utiliza uma variável de ambiente $NAME;
- importante liberar as apenas as portas necessárias no sg

Na pasta **backend** você irá encontrar o código da **API Java**. Você deve transformar esse código em um **Dockerfile** e colocar a aplicação em execução.
 
A aplicação precisa se **conectar a um banco de dados** e a conexão ocorre através do arquivo **application.yml** na pasta **resources**. 

Após apontar as variáveis de ambiente para o banco de dados corretamente, o spring irá criar a tabela **usuario** necessária para seguir com o desafio. 

Você deve preencher as variáveis de ambiente da aplicação seguindo o exemplo abaixo:
 
![Application Backend Java](https://s3-sa-east-1.amazonaws.com/lcpi/f0d632a4-3e51-4d7f-9c18-5c75a257dc51.PNG)
 
Após configurar o **back-end** e o **banco de dados** é necessário criar um **usuário para acessar a aplicação**. Acesse o banco de dados pela forma que desejar e crie um usuário (será necessário informar o **username** e **password**).
 
![Tabela Usuário](https://s3-sa-east-1.amazonaws.com/lcpi/9e3c8f37-44bc-4964-8740-0ea422fdec07.PNG)

Dentro do repositório na pasta **frontend** você irá encontrar o código da aplicação em **angular**. Você deve transformar esse código em um **Dockerfile** e colocar a aplicação em execução. 

Lembre-se que para instalar as dependências da aplicação basta aplicar o comando **npm install**, e para executá-lo aplique o comando **ng serve**.
 
Você deve alterar o apontamento para o **back-end** através do arquivo **environment.ts** na pasta **src/environments**.
 
![Envitoment Angular](https://s3-sa-east-1.amazonaws.com/lcpi/a14aa61a-5197-445d-aef4-9c2ad64715ad.PNG)
 
A aplicação deve ser chamada via DNS, fique a vontade para usar um domínio de sua escolha.
 
Após configurar a aplicação realize o deploy. Deve ser exibido a tela de login:
 
![Tela Login](https://s3-sa-east-1.amazonaws.com/lcpi/c92a1db7-fe23-43d7-84b0-ff7b3161e9c6.PNG)
 
Acesse com o usuário/senha criados. Deve ser exibido a tela home: 
 
![Tela Home](https://s3-sa-east-1.amazonaws.com/lcpi/bec49cb2-03de-41b6-a5d6-88b9268c62b5.PNG)

# **Extras (diferencial):**

* utilizar HELM;
* divisão de recursos por namespaces;
* utilização de health check na aplicação;
* realizar o deploy através de um pipeline CI/CD;
* montar um observability mínima da infraestrutura com uma ferramenta de sua escolha;
* fazer com que a aplicação exiba seu nome.

# **Notas:**

- Todos os recursos devem ser criados utilizando os créditos gratuitos da AWS/Azure/GCP.

- Não esquecer de destruir os recursos após criação e testes do desafio para não haver cobranças ou esgotamento dos créditos.

# **Teoria**

Buscamos os melhores candidatos para às vagas com o **time de DevOps**. Por isso, entendemos se você não tiver tempo para codificar o desafio. Portanto, esta é uma alternativa ao projeto de código, ou seja, você pode optar por **codificar o desafio** OU **realizar um estudo de caso** e **construir um desenho de solução** de um segmento modernizado.

### **Escolher um segmento para modernização**
  - pagamentos
  - cobrança
  - crédito
  - investimento
  - seguros
  - outros
    - *possibilidade de escolher um segmento que tenha familiaridade*

### **Contextualizar o segmento**
  - o que é?
  - regra de negócio
  - desafio
    - *exemplo: minimizar o SLA de uma cobrança*

### **Constuir um 'Desenho de Solução'**
  - utilizar a ferramenta [Diagrams.net](https://app.diagrams.net/) ou [Excalidraw](https://excalidraw.com/)
  
### **Descrever o 'por que' dos serviço utilizados**
  - utilizar serviços **AWS** ou **Azure** ou **GCP**
    - exemplo: *AWS SNS para notificações por e-mail*
    
### **Aplicar Monitoramento e Observabilidade Minima**
  - metrics
  - logs
  - trace
  - alertas
  - incidentes
    - exemplo: *configurar e expor uma métrica do volume de pagamento; adicionar um alerta de disponibilidade da aplicação; importante informar as ferramentas utilizadas.*
