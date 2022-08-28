# **Introdução**
Aqui estão os desafios da segunda fase do processo seletivo para os candidatos da ordem Jedi Let’s Code by Ada. 

# **Descrição**
Temos três desafios para serem entregues:

* **Criação da infraestrutura base**
* **Back-end**
* **Front-end**

Não existe uma receita de bolo para atingir o objetivo do desafio, mas temos boas práticas que serão avaliadas junto aos códigos que deverão ser bem documentados.

**Como entregar estes desafio:**
Você deve criar um repositório em seu GitHub/GitLab, fazer o push da sua solução e enviar o link do repositório junto com seu LinkedIn e currículo (atualizados) para o e-mail do recrutador. Lembrando que a implementação deve ficar em pastas de forma estruturada no GitHub/GitLab para que tenhamos fácil identificação. É recomendado que você faça commits da sua aplicação seguindo o fluxo do GitFlow e com as especificações do **Conventional Commits**.

Um diferencial é adicionar um conteúdo informativo que julgue ser útil ao projeto, como por exemplo uma descrição da aplicação no README com instruções de como executá-lo. 

Lembre-se de considerar as melhores práticas como se fosse um ambiente de produção.

### **Escopo**:
A Let's by Ada está migrando sua infraestrutura do On Premises para Cloud Pública. Ela deseja utilizar todos os benefícios que a computação distribuída oferece como escalabilidade, elasticidade, redução de custos, segurança e rápido provisionamento. Atualmente a empresa conta com uma aplicação monolítica rodando em um único servidor e deseja segmentá-la em microserviços. Será necessário a criação de uma nova rede para hospedar as aplicações, segmentar a atual aplicação Let 's by Ada em front-end, back-end e banco de dados em containers, provisionar os recursos utilizando IaC, promover alta disponibilidade e providenciar observability para as aplicações.

Você é a pessoa responsável por executar a migração. Você pode escolher entre AWS, Azure ou GCP para prover o desafio.

Lembrando que recursos de infraestrutura em nuvem devem ser sempre criados utilizando gerenciadores de configuração, tais como CloudFormation, Terraform ou Ansible, garantindo que todo recurso possa ser versionado e recriado de forma facilitada. Você deve escolher entre Cloudformation, Terraform ou Ansible para realizar o desafio.

## **Desafio 00: Criação de infraestrutura base**

Sua aplicação irá rodar na nuvem e precisa de uma VPC configurada corretamente para sua execução. Crie uma VPC com três subnets privadas e três subnets públicas. As privadas não podem ser acessadas diretamente da rede externa, as públicas devem estar expostas publicamente com os devidos cuidados. Sua rede será pequena, escolha um range de IP adequado e justifique-o. A VPC deve ser criada utilizando IaC. 

## **Desafio 01: Back-end**

### **Necessidade**
Você recebeu acesso ao monolito da Let's by Ada e é hora de segmentá-lo em microserviços. A aplicação deve oferecer três camadas isoladas: Front-end, Back-end e Banco de dados.  Os serviços devem ser executados em servidores Linux e em containers utilizando o Kubernetes. 

Kubernetes atualmente é a principal ferramenta de orquestração e deployment de containers utilizado no mundo, praticamente tornando-se um padrão para abstração de recursos de infraestrutura.

Na Let's by Ada todos os nossos serviços serão conteinerizados e distribuídos em clusters para cada ambiente, sendo assim é importante que as aplicações sejam adaptáveis para cada ambiente e haja controle via código dos recursos Kubernetes através de seus manifestos.

A comunicação entre os componentes deve ser realizada via HTTP e a utilização de filas no fluxo será um diferencial.  

### **Objetivo**
Criar uma instância Linux no provedor Cloud escolhido utilizando Cloudformation, Terraform ou Ansible. 
Pré-instalar o Java e suas dependências na instância para que suba automaticamente a API da aplicação Let's by Ada.
A instância deve abrir somente às portas 80 e 443 para a internet. A porta SSH (22) deve estar acessível somente para um range IP definido.

Escolha um banco de dados relacional de sua preferência e abra sua respectiva porta para conectar com a aplicação. O banco deve rodar em um PaaS do seu provedor Cloud.
 
## **Desafio 02: Front-end**

### **Necessidade:**
Após migrar o back-end da aplicação Let's by Ada para a cloud é hora de trabalharmos com o front-end. Você deve pensar no melhor serviço cloud para executar o front-end pensando em escalabilidade, facilidade de manutenção e otimização de custos. Na AWS uma boa escolha para este serviço pode ser o S3, mas fique à vontade para rodar essa aplicação em outro serviço e provedor de cloud.

### **Objetivo:**
Realizar o deploy da aplicação front-end que irá consumir a API back-end. A aplicação deve ser chamada via DNS, fique a vontade para usar um domínio de sua escolha.

### **Notas:**
Dentro do repositório do desafio existem três pastas, backend, frontend e database, em cada pasta você irá encontrar um subdiretório app e um Dockerfile que constrói a imagem da aplicação, seu objetivo é:

* Construir a imagem docker da aplicação;
* Criar os manifestos de recursos kubernetes para rodar a aplicação *(deployments, services, ingresses, configmap e qualquer outro que você considere necessário)*;
* Criar um script para a execução do deploy em uma única execução;
* A aplicação deve ter seu deploy realizado em uma única linha de comando em um cluster kubernetes local;
* Todos os pods devem estar rodando;
* A aplicação deve responder à uma URL específica configurada no ingress;
* A aplicação sobe por default utilizando a porta 3000 e utiliza uma variável de ambiente $NAME.

Lembrando que:

* Pode-se utilizar tanto AWS, Azure ou GCP, não é preciso executar o teste em ambas, somente uma;
* Todos os recursos devem ser criados utilizando os créditos gratuitos da AWS/Azure/GCP;
* Não esquecer de destruir os recursos após criação e testes do desafio para não haver cobranças ou esgotamento dos créditos.


### **Extras (diferencial):**

* Utilizar HELM;
* Divisão de recursos por namespaces;
* Utilização de health check na aplicação;
* Utilização de módulos do Terraform;
* Realizar o deploy através de um pipeline CI/CD;
* Montar um pequeno observability da infra da aplicação com uma ferramenta de sua escolha;
* Fazer com que a aplicação exiba seu nome ao invés de "Que a força esteja com você!".

**Sucesso no desafio!!**
