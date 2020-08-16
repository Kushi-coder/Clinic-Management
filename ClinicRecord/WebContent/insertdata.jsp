<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.sql.*"%>
    <%
if(session.getAttribute("username")==null)
{
	response.sendRedirect("login.jsp");
}
%>
<%
if(request.getParameter("submit")!=null)
{
	String name=request.getParameter("name");
	String pno=request.getParameter("pno");
	String address=request.getParameter("address");
	String problemofp=request.getParameter("problemofp");
	String opointeddr=request.getParameter("opointeddr");
	String opointeddate=request.getParameter("opointeddate");
	String opointedtimeci=request.getParameter("opointedtimeci");
	String opointedtimeco=request.getParameter("opointedtimeco");
	
	
	Class.forName("com.mysql.jdbc.Driver").newInstance(); 
		Connection con;
		PreparedStatement pst;
		ResultSet rs;
		

		String url="jdbc:mysql://localhost:3306/pdata";
		String dbname="root";
		String dbpass="";
		con=DriverManager.getConnection(url,dbname,dbpass);
		pst=con.prepareStatement("insert into pdata.ptable(name,pno,address,problemofp,opointeddr,opointeddate,opointedtimeci,opointedtimeco)values(?,?,?,?,?,?,?,?)");
		pst.setString(1, name);
		pst.setString(2, pno);
		pst.setString(3, address);
		pst.setString(4, problemofp);
		pst.setString(5, opointeddr);
		pst.setString(6, opointeddate);
		pst.setString(7, opointedtimeci);
		pst.setString(8, opointedtimeco);
		pst.executeUpdate();
		System.out.println("recourd added");
		response.sendRedirect("dashbord.jsp");

	
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style><%@include file="/insertdatastyle.css"%></style>
<link rel="stylesheet" media="screen" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">

</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top" id="navid">
  <div class="container-fluid"id="navid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" id="naid1" href="dashbord.jsp">Admin dashboard</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="ulcolor">
      <ul class="nav navbar-nav"id=ulid1>
        <li><a href="dashbord.jsp" id="naid2"><i class="fa fa-tachometer" aria-hidden="true"></i> Dashboard <span class="sr-only">(current)</span></a></li>
        
        <li><a href="dashbord.jsp" id="naid3"><i class="fa fa-users" aria-hidden="true"></i>
 Profile</a></li>
        <li><a href="aboutus.jsp" id="naid4"><i class="fa fa-question-circle" aria-hidden="true"></i>
 About us</a></li>
        
      </ul>
      
      <ul class="nav navbar-nav navbar-right">
        <li><a href="insertdata.jsp"id="naid5"><i class="fa fa-user-plus" aria-hidden="true"></i>
 Add Users</a></li>
        <li><a href="login.jsp" id="naid6"><i class="fa fa-sign-out" aria-hidden="true"></i>

 Logout</a></li>
        
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
<div class="page-wrapper bg-gra-02 p-t-130 p-b-100 font-poppins">
        <div class="wrapper wrapper--w680">
            <div class="card card-4">
                <div class="card-body">
                    <h2 class="title">Registration Form</h2>
                    <form method="POST">
                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label1">First Name</label>
                                    <input class="input--style-4" type="text" name="name">
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label1">Phone Number</label>
                                    <input class="input--style-4" type="text" name="pno">
                                </div>
                            </div>
                        </div>
                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label1">Address</label>
                                    <input class="input--style-4" type="text" name="address">
                                </div>
                            </div>

                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label1">Problem of Patient</label>
                                    <input class="input--style-4" type="text" name="problemofp">
                                </div>
                            </div>
                            

                        </div>
                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label1">Opointed doctor</label>
                                    <input class="input--style-4" type="text" name="opointeddr">
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label1">Opointed Date</label>
                                    <input class="input--style-4" type="date" name="opointeddate">
                                </div>
                            </div>
                        </div>
                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label1">Opointed Time Check In</label>
                                    <input class="input--style-4" type="time" name="opointedtimeci">
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label1">Opointed Time Check Out</label>
                                    <input class="input--style-4" type="time" name="opointedtimeco">
                                </div>
                            </div>
                        </div>
                        
                        <div class="p-t-15">
                            <button class="btn btn--radius-2 btn--blue btn-lg"  name="submit" type="submit">Submit</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
     <div class="col-md-12">
	<div class="panel-body">
	<table id="tb1-student" class="table table-responsive table-bordered">
	<thead>
	<tr>
		<th>First Name</th>
		<th>Phone Number</th>
		<th>Address</th>
		<th>Problem of Patient</th>
		<th>Opointed doctor</th>
		<th>Opointed Date</th>
		<th>Opointed Time Check In</th>
		<th>Opointed Time Check Out</th>
		
		
		</tr>
		<% 
		 	String url="jdbc:mysql://localhost:3306/pdata";
			String dbname="root";
			String dbpass="";
			ResultSet rs;
			String query="select * from pdata.ptable";
			    Class.forName("com.mysql.jdbc.Driver").newInstance(); ;
			   Connection con=DriverManager.getConnection(url,dbname,dbpass);
			   Statement sta=con.createStatement();
			   rs=sta.executeQuery(query);
			   while(rs.next())
			   {
				   int id=rs.getInt("id");
				   
		%>	
		<tr>
		
		<td><%=rs.getString("name") %></td>
		<td><%=rs.getString("pno") %></td>
		<td><%=rs.getString("address") %></td>
		<td><%=rs.getString("problemofp") %></td>
		<td><%=rs.getString("opointeddr") %></td>
		<td><%=rs.getString("opointeddate") %></td>
		<td><%=rs.getString("opointedtimeci") %></td>
		<td><%=rs.getString("opointedtimeco") %></td>
		
		
		</tr>
		<%
			   }
		
		%>	
	</table>
	</div>
	</div>
</body>
</html>