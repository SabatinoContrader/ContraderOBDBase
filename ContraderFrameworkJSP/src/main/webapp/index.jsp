<!-- inizio linguaggio HTML-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Piattaforma di Recruitment</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--indica le librerie che sto utilizzando per bootstrap(con relativo CSS) e JQuery />-->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!--indica le librerie che sto utilizzando per bootstrap(con relativo CSS) e JQuery />-->
<% String esito = (String) session.getAttribute("esitoLogin");%>

<!-- inizio linguaggio CSS-->
<style>


    html,body, .container,.full-height{
    height:100%;
    }

    #logo{
    width: 100%;
    height: auto;
    padding-top: 60px;
	padding-bottom:40px;
    }

    #linea{
	width: 100%;
    height:9px;
    }

    #username{
    margin-top:0px;
    }

    #login{
    margin-top:80px;
    margin-left:20px;
    }

    #frasedue{
    padding-left:220px;
    padding-top:247px;
    }

    #frasetre{
    color:#2A1E70;
    padding-left:295px;
    padding-top:10px;
    font-size:28pt;
    font-family: impact;
    }

    #username{
    border-color:#ffffff;
    }

    #pwd{
    border-color:#ffffff;
    }

	.btn{
	background-color:#2A1E70;
	color:#ffffff;
	margin-top:65px;
	border-radius:9px;
	height:36px;
	width:130px;
	margin-left:-10px;
	}

	div.row.uno{
	padding-top:40px;
	}

	div.row.due{
    padding-top:30px;
	}

    @media screen and (min-width: 992px) {
	#top {
	display: none;
	}
	}

	@media screen and (max-width: 991px) {
	#top {
	display: block;
	}
	}

	@media screen and (min-width: 992px) {
	#fascia {
	display: block;
	}
	}

	@media screen and (max-width: 991px) {
	#fascia {
	display: none;
    width: 100%;
	}
	}

	@media screen and (min-width: 992px) {
	#frasedue {
	font-size:610%;
    color:#2A1E70;
    font-family: impact;
    padding-left: 290px;
    }
	}

    <@media screen and (max-width: 354px) {
    #frasefascia {
    font-size:20px;
	}
	}

    @media screen and (min-width: 355px) {
    #frasefascia {
    font-size:28px;
	}
	}

    @media screen and (min-width: 491px) {
    #frasefascia {
    font-size:29px;
	}
	}

    @media screen and (min-width: 627px) {
    #frasefascia {
    font-size:35px;
	}
	}


    #frasefascia{
    color:#2A1E70;
    padding-left:25px;
    padding-top: 70px;
    font-family: impact;
    }

    #fototop{
    height: 200px;
    }

     </style>
 <!-- fine linguaggio CSS-->


<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<title>Contreader Recruitment</title>
</head>
<body>
<div class="container col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
<!-- sezione bootsrap container generale-->
<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 full-height">
<!-- inizio sezione sinistra con inserimento dati dell'utente-->
    <form action="LoginServlet" method="post">

<!--inizio fascialta con immagine in background quando lo schermo passa da lg a md />-->
<div class="row" id="top">
    <div id="fototop" class="col-md-12" style="background-image:url('fascialta1.jpg')">
		<div id="frasefascia">Accedi o registrati e scopri i nostri vantaggi. </div>
    </div>
</div>
<!--fine fascialta con immagine in background quando lo schermo passa da lg a md />-->


<!--inizio inserimento logo piattaforma />-->
<div class="row">
    <div class="col-lg-1 col-md-1 col-sm-2 col-xs-2">
	    </div>
            <div class="col-lg-10 col-md-10 col-sm-8 col-xs-8">
                <img id="logo" src="logoapp.png"/>
            </div>
        <div class="col-lg-1 col-md-1 col-sm-2 col-xs-2">
    </div>
</div>
<!--fine inserimento logo piattaforma />-->


<!--inizio del login error quando i dati non vengono compilati nel modo corretto />-->
<div class="row">
    <div class="col-lg-1 col-md-1 col-sm-2 col-xs-2">
        </div>
            <div class="col-lg-10 col-md-10 col-sm-8 col-xs-8">
                <%if(esito=="errato"){%>
                                        <div class="col-lg-10 col-md-10 col-sm-8 col-xs-8">
                                            <div class="alert alert-danger alert-dismissible fade in">
                                                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                                <strong>Login errato!</strong>
                                            </div>
                                        </div>
                                     <%}%>
            </div>
        <div class="col-lg-1 col-md-1 col-sm-2 col-xs-2">
    </div>
</div>
<!--fine del login error quando i dati non vengono compilati nel modo corretto />-->


<!--inizio del campo login username per l'inserimento dei dati dell'user />-->
<div class="row">
    <div class="col-lg-1 col-md-1 col-sm-2 col-xs-2">
        </div>
            <div class="col-lg-10 col-md-10 col-sm-8 col-xs-8">
                <div class="form-group">
                    <input type="text" class="form-control" id="username" placeholder="Username" name="user">
                </div>
            </div>
        <div class="col-lg-1 col-md-1 col-sm-2 col-xs-2">
     </div>
</div>
<!--fine del campo loginusername per l'inserimento dei dati dell'user />-->


<!--inizio della linea separatrice tra l'usename e la password />-->
<div class="row">
    <div class="col-lg-1 col-md-1 col-sm-2 col-xs-2">
        </div>
            <div class="col-lg-10 col-md-10 col-sm-8 col-xs-8" >
                <div class="form-group">
                    <img src="linea.png" id="linea"/>
                </div>
            </div>
        <div class="col-lg-1 col-md-1 col-sm-2 col-xs-2">
    </div>
</div>
<!--fine della linea separatrice tra l'usename e la password />-->


<!--inizio del campo login passowrd per l'inserimento dei dati dell'user />-->
<div class="row">
	<div class="col-lg-1 col-md-1 col-sm-2 col-xs-2">
        </div>
            <div class="col-lg-10 col-md-10 col-sm-8 col-xs-8">
                <div class="form-group">
                    <input type="password" class="form-control" id="pwd" placeholder="Password" name="pwd">
                </div>
            </div>
        <div class="col-lg-1 col-md-1 col-sm-2 col-xs 2">
    </div>
</div>
<!--fine del campo login password per l'inserimento dei dati dell'user />-->


<!--inizio della riga al di sotto del login con recupero della password dell'utente />-->
<div class="row uno">
    <div class="col-lg-1 col-md-1 col-sm-2 col-xs-2">
        </div>
            <div class="col-lg-5 col-md-5 col-sm-4 col-xs-4">
                <div><label><input type="checkbox"> Remember me</label></div>
                    </div>
                        <div class="col-lg-5 col-md-5 col-sm-4 col-xs-4" style="text-align:right">
                        <div class="link">
                    <label><a id="m_login_forget_password" class="m-link">Forget Password</a></label>
                </div>
            </div>
        <div class="col-lg-1 col-md-1 col-sm-2 col-xs 2">
    </div>
</div>
<!--fine della riga al di sotto del login con recupero della password dell'utente />-->

<!--inizio inserimento del botton per il login accedendo alla pagina successiva del sito />-->
<div class="row">
    <div class="col-lg-4 col-md-3 col-xs-2">
        </div>
            <div class="col-lg-4 col-md-6 col-xs-8" style="text-align:center">
                <div class="form-group">
                  <button class="btn" type="submit" id="login" value="Login" name="bott">Log In</button>
                </div>
            </div>
        <div class="col-lg-4 col-md-3 col-xs-2" >
    </div>
</div>
<!--fine inserimento del botton per il login accedendo alla pagina successiva del sito />-->
</form>


<!--inizio accesso per la registrazione al sito con relativi dati personali  />-->
<div class="row due">
    <div class="col-lg-1 col-md-1 col-xs-2">
        </div>
            <div class="col-lg-10 col-md-10 col-xs-8" style="text-align:center">
                <span class="m-login__account-msg">
                    Don't have an account yet ?</span>
               <a id="m_login_forget_password" class="m-link">Sign Up</a>
            </div>
        <div class="col-lg-1 col-md-1 col-xs-2">
    </div>
</div>
</div>
<!--fine accesso per la registrazione al sito con relativi dati personali  />-->
<!--fine sezione sinistra con inserimento dati dell'utente />-->


<!--inizio sezione destra con immagine in background />-->
<div id="fascia" class="col-xs-12 col-sm-8 col-md-8 col-lg-8 col-xl-8 full-height" style="background-image:url('fondotre1.jpg')">
    <div id="frasedue">CHI SIAMO</div>
    <div id="frasetre">Accedi o registrati <br>e scopri i nostri vantaggi.</div>
</div>
<!--fine sezione destra con immagine in background />-->


</div>
</body>
</html>
<!--fine linguaggio HTML />-->