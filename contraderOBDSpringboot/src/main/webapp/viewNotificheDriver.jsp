<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="vendor/img/favicon.ico">

    <title>Contrader | OBD project</title>

    <!-- Bootstrap Core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="vendor/morrisjs/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <div id="wrapper">

        <%@ include file = "header.jsp" %>

            <div id="page-wrapper">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Notifiche</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
                <div class="row">
                    <%@ include file = "message.jsp" %>
                        <div class="col-lg-12">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <i class="fa fa-automobile fa-fw"></i>
                                    ${viewAuto.casaCostruttrice} ${viewAuto.modello}
                                </div>
                                <!-- /.panel-heading -->
                                <div class="panel-body">
                                    <c:if test="viewAuto.setDatiEntity.isEmpty()">
                                        <div class="alert alert-primary">
                                            <h2>Nessun dato rilevato</h2>
                                        </div>
                                    </c:if>
                                    <c:forEach items="${viewAuto.datiEntitySet}" var="dato">
                                        <c:if test="${dato.codErrore != null}">
                                            <c:set var="errore" value="ok" />
                                            <div class="alert alert-danger">
                                                <h2>ALERT! Errore: ${dato.codErrore} ricevuto in data ${dato.data}
                                                    <button class="btn btn-circle btn-lg pull-right" data-toggle="modal" data-target="#formChiediAppuntamento" style="margin-top: -10px">
                                                        <i class="fa fa-calendar"></i>
                                                    </button>
                                                    <button class="btn btn-circle btn-lg pull-right" data-toggle="modal" data-target="#formChiediPreventivo" style="margin-top: -10px">
                                                        <i class="fa fa-euro"></i>
                                                    </button>
                                                </h2>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                    <c:if test="${errore != 'ok'}">
                                        <c:if test="${scadenze == 'ok'}">
                                            <div class="alert alert-success">
                                                <h2>Nessuna scadenza a breve</h2>
                                            </div>
                                        </c:if>
                                    </c:if>
                                    <c:if test="${scadenze == 'tagliando'}">
                                        <div class="alert alert-warning">
                                            <h2>Tagliando in scadenza
                                                <button class="btn btn-circle btn-lg pull-right" data-toggle="modal" data-target="#formChiediAppuntamento" style="margin-top: -10px">
                                                    <i class="fa fa-calendar"></i>
                                                </button>
                                                <button class="btn btn-circle btn-lg pull-right" data-toggle="modal" data-target="#formChiediPreventivo" style="margin-top: -10px">
                                                    <i class="fa fa-euro"></i>
                                                </button>
                                            </h2>
                                        </div>
                                    </c:if>
                                    <c:if test="${scadenze == 'revisione'}">
                                        <div class="alert alert-warning">
                                            <h2>La revisione scadr&aacute; tra meno di 1 mese
                                                <button class="btn btn-circle btn-lg pull-right" data-toggle="modal" data-target="#formChiediAppuntamento" style="margin-top: -10px">
                                                    <i class="fa fa-calendar"></i>
                                                </button>
                                                <button class="btn btn-circle btn-lg pull-right" data-toggle="modal" data-target="#formChiediPreventivo" style="margin-top: -10px">
                                                    <i class="fa fa-euro"></i>
                                                </button>
                                            </h2>
                                        </div>
                                    </c:if>
                                    <%@ include file = "modalChiediAppuntamento.jsp" %>
                                        <%@ include file = "modalChiediPreventivo.jsp" %>
                                            <!-- /.panel-body -->
                                </div>
                                <!-- /.panel -->
                            </div>
                            <%@ include file = "tabs.jsp" %>
                        </div>
                        <!-- /.row -->
                </div>
                <!-- /#page-wrapper -->

            </div>
            <!-- /#wrapper -->

            <!-- jQuery -->
            <script src="vendor/jquery/jquery.min.js"></script>

            <!-- Bootstrap Core JavaScript -->
            <script src="vendor/bootstrap/js/bootstrap.min.js"></script>

            <!-- Metis Menu Plugin JavaScript -->
            <script src="vendor/metisMenu/metisMenu.min.js"></script>

            <!-- Morris Charts JavaScript -->
            <script src="vendor/raphael/raphael.min.js"></script>
            <script src="vendor/morrisjs/morris.min.js"></script>
            <script src="data/morris-data.js"></script>

            <!-- Custom Theme JavaScript -->
            <script src="dist/js/sb-admin-2.js"></script>

</body>

</html>