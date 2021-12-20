# Trabalho PWE 

### Alunos: :grinning::grinning::grinning:

* **Ciro Esteves Vieira GU3011321**
* **Diego de Sá Lorandi GU3011216**
* **Jackson Tavares Rodrigues GU300841X** 

**Links Vídeos e GitHub**

https://github.com/superaks2/Salgados

https://youtu.be/OXrVG2jGugY

https://youtu.be/ijFXNUvr6fE



****

### Site Loja Restaurante :shopping_cart:

* **Estrutura** (Clicando no link, leva para a pasta ou arquivo)

  * **Front-End**
    * [Index](https://github.com/superaks2/Salgados/blob/main/Salgados/WebContent/app/index.jsp)
    * [Login](https://github.com/superaks2/Salgados/blob/main/Salgados/WebContent/admin/login.jsp)
    * [Contato](https://github.com/superaks2/Salgados/blob/main/Salgados/WebContent/app/contato.jsp)
    * [Sobre](https://github.com/superaks2/Salgados/blob/main/Salgados/WebContent/app/sobre.jsp)
    * [Carrinho](https://github.com/superaks2/Salgados/blob/main/Salgados/WebContent/app/carrinho.jsp)
    * [Cardápio](https://github.com/superaks2/Salgados/blob/main/Salgados/WebContent/app/cardapio-detalhe.jsp)
    * [Dashboard](https://github.com/superaks2/Salgados/blob/main/Salgados/WebContent/admin/index.jsp) (Apenas para Admin)
  * **Back-End**
    * [Models](https://github.com/superaks2/Salgados/tree/main/Salgados/src/model) (CRUD)
    * [Controller](https://github.com/superaks2/Salgados/tree/main/Salgados/src/controller) (MVC)
    * [Envio de Email](https://github.com/superaks2/Salgados/blob/main/Salgados/WebContent/app/contato.jsp)
    * [Session](https://github.com/superaks2/Salgados/blob/main/Salgados/src/controller/AdminLoginCtrl.java)
    * [Cookie](https://github.com/superaks2/Salgados/blob/main/Salgados/WebContent/app/popup/popups.jsp)
  * **Banco de Dados**
    * [Banco de Dados](https://github.com/superaks2/Salgados/blob/main/Salgados/projetopwe.sql)

  ****

  

  ### Manual ​U​s​u​á​ri​o​ :book:

* **Login**

Para entrar no site como admin é necessário realizar o login, onde é feita a validação de e-mail e senha do usuário, caso o usuário e senhas não constem no banco de dados a página recarrega para nova tentativa, caso o usuário e senha estejam corretos, o usuário é direcionado para a página de dashboard

* **Dashboard**

No dashboard o usuário tem acesso a realizar o CRUD dos elementos do site como produtos e usuários, é possível sair da sessão ao clicar em Sair, assim o usuário e direcionado para a tela de login novamente

* **Home**

Para entrar no site como cliente comum, na página home, o usuário tem acesso à outras partes do site como o "Sobre", "Cardápio", "Contato" e "Carrinho"

* **Sobre**

Na página sobre, o usuário tem acesso a informações sobre o restaurante e sua história

* **Cardápio**

Na página cardapio, o usuário tem acesso ao produtos do menu do restaurante podendo utilizar filtros 

* **Contato**

Na página contato, o usuário tem acesso às informações de contato do restaurante e também pode fazer um envio de e-mail através da ferramenta

* **Carrinho**

Na página carrinho, com auxílio de cookie, o cliente adiciona produtos no carrinho e eles continuam salvos durante um tempo mesmo que o cliente feche a página e por ela, ele pode realizar a compra dos produtos

****



### Requisitos (Exemplos no código) :hammer_and_wrench:

* Login/Session

  * .jsp

  ![](https://i.imgur.com/TuTB0f2.jpg)

  * controller

  ![](https://i.imgur.com/V5NTFBo.jpg)

  * Validação do Session na view

    ![](https://i.imgur.com/lvmYyD6.jpg)



* Cookie

![](https://i.imgur.com/lZt4ReF.png)

![](https://i.imgur.com/ZCH710C.png)



* CRUD

![](https://i.imgur.com/dGzcVbK.jpg)



![](https://i.imgur.com/Y8P0IxD.jpg)



* Controller/Servlet

![](https://i.imgur.com/icwng9A.jpg)

![](https://i.imgur.com/xQE4V4y.jpg)

* Ajax

![](https://i.imgur.com/KbRJJoh.png)

