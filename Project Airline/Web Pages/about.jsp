<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
 if(session.getAttribute("name")==null)
 {
	 response.sendRedirect("login.jsp");
 }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>About IndiAir</title>
 <link rel="icon" href="logo.png" type="image/x-icon">
</head>
<style>
            body{
            background-image:url("bg2.jpg");
            background-attachment:fixed;
            background-size: 100% 100%;
            animation: changeBackground 12s infinite;
            color:#000000;
            display:flex;
            align-items: left;
            justify-content: left;
            line-height: 1.6;
            min-height: 100vh;
            flex-direction:column;
            margin: 3%;
         overflow: scroll;
            overflow-x: hidden;
            }
            ::-webkit-scrollbar{
            width:0;
            }
         @keyframes changeBackground {
      		0% { background-image: url('Bg.jpg'); }
    		33% { background-image: url('bg2.jpg'); }
     		66% { background-image: url('bg3.jpg'); }
      		100% { background-image: url('bg4.jpg'); }
    		}
         .about{
            border-radius: 20px;
            width: 100px;
            border-radius: 15px;
            color:aquamarine;
         }
          .login{
             display: flex;
 			 align-items: right;
 			 justify-content: right;
 			 flex-direction: row;
 			 gap:4rem;
 			 color:red
 			  } 
			 a{
                color:#fff;
                font-weight: bold;
                text-decoration:none;
            }
            .b2{
                padding: 15px;
                border-radius: 10px;
                margin-top: 15px;
                margin-bottom: 15px;
                border: none;
                color: white;
                justify-content:center;
                cursor: pointer;
                background-color:cornflowerblue;
                width: 10%;
                gap: 10px;
                font-size: 16px;
            }
            .b2:hover{
            text-transform: uppercase;
                font-weight: bold;
                text-decoration: none;
            }
            a
            {
            color: white;
            }
                footer {
				  text-align: center;
				  padding: 10px 0;
				  font-size: 14px;
				  position: relative;
				  bottom: 0;
				  width: 100%;
				}
        </style>
<body>
<div class="about">

                <h2>About Us</h2>
            </div>
          <h4><p>IndiAir's Mission is to become India's preferred low-cost airline, delivering the lowest air fares <br>
               with the highest consumer value to price sensitive consumers to fulfill everyone's dream of flying! <br>
               With India's economic and business growth the percentage of traveling population is burgeoning. <br>
               Indians are traveling for both business pleasure and everyone needs to save both time and money. <br>
               IndiAir's Vision is to address that and ensure that flying is for everyone. <br>
               The power to fly for everyone with a dynamic fare structure.  
            </p></h4>  
               <br>
<div class="about">
               <h2>Careers</h2>
               </div>
          <h4><p>At IndiAir, we believe that our people are our greatest asset. We are always on a lookout for highly <br>
               motivated individuals who can collaborate with like-minded people in an environment that embraces <br>
               individuality and rewards your best work. A career opportunity at IndiAir will entail you to unlimited <br>
               opportunites and host of benifts. Come, be a part of IndiAir.  
          </p> </h4>  
           <button class="b2" type="submit"> <a style="text-decoration: none" href="index.jsp"  style="text-decoration:dotted;"> Go Back </a> </button> 
           <footer>Copyright © 2025 IndiAir All Rights Reserved</footer>
</body>
</html>