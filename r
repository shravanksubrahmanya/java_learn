1)Creation of VPC.
Create VPC
Create 3 subnets in 3 different zones
Create IG attach VPC
Create Route Table
Edit Subnet Associations -> Attach all subnets
Edit Routes -> 0.0.0.0/0 Target IG created
Create Security Group, Edit and add Inbound rules


2)Linux server implementation using (php).
sudo -i
yum install httpd php php-mysql
service httpd start
cd /var/www/html
vim test.php
+i
<?php
$x = "Hello world!";
$y = 'Hello world!';
echo $x;
echo "<br>";
echo $y;
?>
Esc + :wq (To escape from the editor)


3)Ubuntu server implementation (R program)
sudo apt-get dist-upgrade
sudo apt-get upgrade
sudo su
echo "deb http://cran.rstudio.com/bin/linux/ubuntu trusty/" >> /etc/apt/sources.list
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9
apt-get update
apt-get install r-base
R // This is for R command prompt)
message <-"Hello World!"
print(message)
q() //to quit


4)Windows server implementation with (C program)


5)AMI Implementation
Create image from running instance
Launch instance from image
Run program as previous question


6)Launching website using S3 Bucket
Create IAM user and attach admin full access and S3 full access policies to it
Login though IAM
Create bucket
Upload html file, give public access
Copy file URL on browser


7)Load Balancing and autoscaling
Create two EC2 Linux instances
Classic LB
LB PROTOCOL - TCP
Add subnets
Add SG
PING PROTOCOL - HTTP
RESPONSE 2s
INTERVAL 5s
ADD both instances
RUN both instances on PUTTY/AWS
On both instances :
yum install httpd
start httpd service
cd /var/www/html
vim test.html
Check for InService under LB>Instances


8)IAM user Implementation
Create IAM user and login
II INTERNALS

1) Demonstrate an autoscaling group with a loadbalancer.
Create Launch Template
Create AutoScaling Group
Go to EC2 n check for instances
Check health of instances in AutoScaling

2)Create a new user from the root user using aws Iam and
demonstrate s3 using new user account.
DONE

3)Demonstrate hosting application from desktop using
filezilla.
On filezilla >
Site manager >
Host : public ip
Port : 22
Protocol : ssh
Logon type :
Browse ppk file
In ec2 Instance>
sudo yum install httpd
sudo service httpd start
Ls //check file copied from filezilla
sudo cp file.html /var/www/html
Browser > public_ip/file.html

4)Create mysql database server and connect to the RDS
server using mysql workbench
a)Create any database
b) Retrieve data from the Db server by running a PHP
program on ec2 Instance.
Create a DB SUBNET GROUP
Create a DB PARAMETER GROUP -> mysql.8
Create a MySQL DB
Connect on MySQL workbench , create a table and add data
Run an ec2 instance
sudo -i
yum install httpd php php-mysql
service httpd start
cd /var/www/html
vim db.php
+i

<?php
$servername = "rondb.c93fxu82udnu.ap-south-1.rds.amazonaws.com";
$username = "admin";
$password = "admin123";
$dbname = "RONdb";
// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
die("Connection failed: " . $conn->connect_error);
}
$sql = "SELECT * FROM RONdb.student";
$result = $conn->query($sql);
if ($result->num_rows > 0) {
// output data of each row
while($row = $result->fetch_assoc()) {
echo "id: " . $row["idstudent"]. " - Name: " .
$row["studentcol"]. "<br>";
}
} else {
echo "0 results";
}
$conn->close();
?>
Go to browser, run public_ip/db.php

5) Create mysql database server and connect to the RDS
server using mysql workbench
a)Create any database
b) Retrieve data from database server by running cmd
on EC2 cmd prompt

Create a DB SUBNET GROUP
Create a DB PARAMETER GROUP -> mysql.8
Create a MySQL DB
Connect on MySQL workbench , create a table and add data
sudo -i
wget http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm
sudo rpm -ivh mysql-community-release-el7-5.noarch.rpm
yum update
yum install mysql-server
service mysql start
mysql --version
mysql -u admin -p -h rondb.c93fxu82udnu.ap-south-1.rds.amazonaws.com -P 3306
mysql> use RONdb //your dbname
mysql> select * from student //yout ttable name

6)Create mysql database server and connect to the RDS
server using mysql workbench and Retrieve data from DBS
by running Xampp on local system
Create a DB SUBNET GROUP
Create a DB PARAMETER GROUP -> mysql.8
Create a MySQL DB
Connect on MySQL workbench , create a table and add data
Run apache and sql on xampp.
Copy this code into a php file in C -> xampp -> htdocs folder
Go to browser and run localhost/file.php

<?php
$servername = "rondb.c93fxu82udnu.ap-south-1.rds.amazonaws.com";
$username = "admin";
$password = "admin123";
$dbname = "RONdb";
// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
die("Connection failed: " . $conn->connect_error);
}
$sql = "SELECT * FROM RONdb.student";
$result = $conn->query($sql);
if ($result->num_rows > 0) {
// output data of each row
while($row = $result->fetch_assoc()) {
echo "id: " . $row["idstudent"]. " - Name: " .
$row["studentcol"]. "<br>";
}
} else {
echo "0 results";
}
$conn->close();
?>

7)Demonstrate by creating a MsSql Database server and
create a database using appropriate Editor
https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_ConnectToMicrosoftSQLS
erverInstance.html
LINK TO DOWNLOAD WORKBENCH :
https://learn.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms?view
=sql-server-ver16
Connect to AWS DB engine
Create new DB , TABLE , Add datausing script, RETRIEVE

8)Demonstrate dynamo db

9)Aws eclipse integration using EBS
Create an IAM user
Create Access key for IAM
Install AWS toolkit from AWS marketplace
Add Access key credentials in eclipse

10)Demonstrate retrieve data from db server using JDBC
Program

import java.sql.*;
public class JDBClass {
public static void main(String args[]){
try{
Class.forName("com.mysql.cj.jdbc.Driver");
String dbName = "RONdb";
String userName = "admin";
String password = "admin123";
String hostname = "rondb.c93fxu82udnu.ap-south-1.rds.amazonaws.com";
String port ="3306";
String jdbcUrl = "jdbc:mysql://" + hostname + ":" + port + "/" + dbName + "?user=" +
userName + "&password=" + password;
Connection con = DriverManager.getConnection(jdbcUrl);
if (con != null) {
System.out.println("Connected to the database test1");
}
Statement stmt=con.createStatement();
ResultSet rs=stmt.executeQuery("select * from RONdb.student");
while(rs.next())
System.out.println(rs.getInt(1)+" "+rs.getString(2));
con.close();
}catch(Exception e){ System.out.println(e);}
}
}


11)Demonstrate retrieving data from Db server using JSP
program.
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("userId");
String driverName = "com.mysql.cj.jdbc.Driver";
String hostname = "rondb.c93fxu82udnu.ap-south-1.rds.amazonaws.com";
String port = "3306";
String dbName = "RONdb";
String userId = "admin";
String password = "admin123";
String connectionUrl = "jdbc:mysql://" + hostname + ":" + port + "/" + dbName + "?user=" +
userId + "&password=" + password;
try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<h2 align="center"><font><strong>Retrieve data from database in jsp</strong></font></h2>
<table align="center" cellpadding="5" cellspacing="5" border="1">
<tr>
</tr>
<tr bgcolor="#A52A2A">
<td><b>id</b></td>
<td><b>user_id</b></td>
<td><b>Password</b></td>
<td><b>Name</b></td>
<td><b>Email</b></td>
</tr>
<%
try{
Class.forName("com.mysql.cj.jdbc.Driver");
Connection
con=DriverManager.getConnection("jdbc:mysql://rondb.c93fxu82udnu.ap-south-1.rds.amazona
ws.com:3306/RONdb?user=admin&password=admin123");
if (con != null) {
System.out.println("Connected to the database test1");
}
Statement stmt=con.createStatement();
ResultSet rs=stmt.executeQuery("select * from RONdb.student");
while(resultSet.next()){
%>
<tr bgcolor="#DEB887">
<td><%=resultSet.getInt("id") %></td>
<td><%=resultSet.getString("name") %></td>
</tr>
<%
}
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>

12)EMR:-
