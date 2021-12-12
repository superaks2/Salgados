<%@ page import = "java.io.*,java.util.*,javax.mail.*"%>
<%@ page import = "javax.mail.internet.*,javax.activation.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>

<%
   String result;
   
   // Recipient's email ID needs to be mentioned.
   String to = "loja@jacksontavares.ga";

   // Sender's email ID needs to be mentioned
   String from = "jacksontavaresrod@hotmail.com";

   // Assuming you are sending email from localhost
   String host = "smtp.hostinger.com";

   // Get system properties object
   Properties properties = System.getProperties();

   // Setup mail server
   properties.setProperty("mail.smtp.host", host);
   properties.setProperty("mail.user", to);
   properties.setProperty("mail.smtp.port", "465");
   properties.setProperty("mail.password", "Loja@2021");

   /*
   			this.properties.put("mail.smtp.socketFactory.port", smtpPort);
			this.properties.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
			this.properties.put("mail.smtp.auth", "true");
   */
   // Get the default Session object.
   Session mailSession = Session.getDefaultInstance(properties);

   try {
      // Create a default MimeMessage object.
      MimeMessage message = new MimeMessage(mailSession);
      
      // Set From: header field of the header.
      message.setFrom(new InternetAddress(from));
      
      // Set To: header field of the header.
      message.addRecipient(Message.RecipientType.TO,
                               new InternetAddress(to));
      // Set Subject: header field
      message.setSubject("This is the Subject Line!");
      
      // Now set the actual message
      message.setText("This is actual message");
      
      // Send message
      Transport.send(message);
      result = "Sent message successfully....";
   } catch (MessagingException mex) {
      mex.printStackTrace();
      result = "Error: unable to send message....";
   }
%>

<html>
   <head>
      <title>Send Email using JSP</title>
   </head>
   
   <body>
         <h1>Send Email using JSP</h1>
      
      <p align = "center">
         <% 
            out.println("Result: " + result + "\n");
         %>
         Não deu...
      </p>
   </body>
</html>