<%@ page import="com.virtualpairprogrammers.domain.Annunci" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
 <% List<Annunci> annunci = (List<Annunci>) session.getAttribute("listAnnunci");
 String ruolo =((String) session.getAttribute("ruolo"));
 Integer idcandidato = ((Integer) session.getAttribute("id"));%>


</head>
<body>
<table>
<tr>
    <th>
    Id
    </th>
    <th>
    Titolo
    </th>
    <th>
    Luogo
    </th>
    <th>
    Categoria
    </th>
    <th>
    Contratto
    </th>

</tr>

<%for (Annunci annuncio : annunci){ %>
<tr>

<td>
<%= annuncio.getId()%>
</td>

<td>
<%= annuncio.getTitolo()%>
</td>

<td>
<%= annuncio.getLuogo()%>
</td>

<td>
<%= annuncio.getCategoria()%>
</td>

<td>
<%= annuncio.getContratto()%>
</td>


<td>
<%if (ruolo.equals("gestore")){%>
<a href="CancellaAnnuncioServlet?id=<%= annuncio.getId()%>">Cancella Annuncio</a>
<%}%>
</td>

<td>
<%if (ruolo.equals("candidato")){%>
<a href="IscrizioneAnnuncioServlet?id=<%= annuncio.getId()%>&idca=<%= idcandidato%>">Candidati</a>
<%}%>



</tr>
<% }%>
</table>
 <%if (ruolo.equals("gestore")){%>
                <a href="homeGestore.jsp">Home</a>
                <%}else if (ruolo.equals("recruiter")){%>
                <a href="homeRecruiter.jsp">Home</a>
                <%}else if (ruolo.equals("candidato")){%>
                <a href="homeCandidato.jsp">Home</a>
  <%}%>
</body>
</html>