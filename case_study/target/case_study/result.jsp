<% import="java.sql.*" %>

<html>
<head>
    <title>View Allotment</title>
    <style>
        body{font-family: Arial; background-color: #f4f7fb;}
        h2{text-align: center; color: #1f3864;}
        table{width: 250px; padding: 8px auto;}
        thead{background-color: #1f3864; color: white; font-weight: bold;}
    </style>
</head>
<body>

    <% 
    INT rollNo = request.getParameter("rollno");
    String hall = request.getParameter("hall");
    INT benchno = request.getParameter("benchno");

    Connection con = DBConnection.getConnection();
    PreparedSatement ps = con.prepareStatement(
        "INSERT INTO hall_allot(roll_no, hall, bench_no) VALUES(?, ?, ?)")";

    ps.setInt(1,roll_no);
    ps.setString(2, hall);
    ps.setInt(3, bench_no);
    ps.executeUpdate();
    %>

    <h2>Saved! All Records</h2>

    <table border="1">
            <tr>
                <th>ID</th>
                <th>Roll No</th>
                <th>Hall</th>
                <th>Bench No</th>
            </tr>

            <%
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM hall_allot");
            while (rs.next()) {%>
        
            <tr>
                <td><%= rs.getINT(1) %></td>
                <td><%= rs.getInt(2) %></td>
                <td><%= rs.getString(3)</td>
                <td><%= rs.getInt(4)</td>
            </tr>
            <%
            }
            con.close();
            %>
    </table>
</body>
</html>