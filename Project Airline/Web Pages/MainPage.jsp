<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IndiAir</title>
</head>
<link rel="icon" href="logo.png" type="image/x-icon"> 
<link
    href="https://cdn.jsdelivr.net/npm/remixicon@4.3.0/fonts/remixicon.css"
    rel="stylesheet"/>
    
    <!--Start of Tawk.to Script-->
<script type="text/javascript">
var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
(function(){
var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
s1.async=true;
s1.src='https://embed.tawk.to/67c9c7e715ee90190bdb44af/1ilm39okl';
s1.charset='UTF-8';
s1.setAttribute('crossorigin','*');
s0.parentNode.insertBefore(s1,s0);
})();
</script>
<!--End of Tawk.to Script-->
</head>
 <style>
        body{
            background-image:url("bg2.jpg");
            background-attachment:fixed;
            background-size: 100% 100%;
            animation: changeBackground 12s infinite;
            color:#000000;
            display:flex;
            align-items: center;
            justify-content: center; 
            flex-direction:column;
            margin: 1%;
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

           .div1{
                font-family:'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
                display: flex;
                text-align: center;
                justify-content: center;
           }
           .div2{
               font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;
               position: relative;
                width: 100vw;
            }

           span{
                padding: 1px;
                }

            .div3{
                background-color: #fff;
                border-radius: 15px;
                box-shadow: 0 0 20px rgba(red, green, blue, alpha);
                padding: 2px 20px;
                transition: transform 0.2s;
                width: 450px;
                text-align:center;
            }
            h2{
                color:;
            }
            h3{
            color:red;
            text-decoration: none;
            }
            label{
                display: block;
                width: 100%;
                margin-top: 5px;
                margin-bottom: 1px;
                text-align:left;
                color: #555;
                font-weight: bold;
            }
            input{
                display: block;
                width: 100%;
                margin-bottom: 5px;
                padding: 10px;
                box-sizing: border-box;
                border: 1px solid #ddd;
                border-radius: 5px;
                text-align: left;
            }
            button{
                padding: 15px;
                border-radius: 10px;
                margin-top: 5px;
                margin-bottom: 5px;
                border: none;
                color: white;
                cursor: pointer;
                background-color:cornflowerblue;
                width: 50%;
                font-size: 16px;
            }
            .submit{
                display: flex;
                justify-content: center;
                align-items: center;
            }
            a{
                color:#fff;
                font-weight: bold;
                text-decoration:none;
            }
            a:hover {
                color:;
                 background-color: transparent;
                text-transform: uppercase;
                font-weight: bold;
                text-decoration: none;
                }
                
 			  
 			  nav{
 			  max-width:var(--max-width);
 			  margin:auto;
 			  padding:0rem;
 			  display:flex;
 			  align-items:center;
 			  justify-content:space-between;
 			  gap:1rem;
 			  }
			
			.nav_logo{
			font-size:2.0rem;
			font-weight:600;
			color:var(--text-dark);
			align-items:left;
			}
			
			.nav_links{
			font-size:1.0rem;
			list-style:none;
			display:flex;
			align-items:center;
			gap:5rem;
			}
			
			.link a{
			font-weight:500;
			color:var(--text-light);
			transition:0.3s;			
			}
			
			.link a:hover{
			color:var(--text-dark);
			}
			.name{
			padding:.75rem 2rem;
			font-size:1.7rem;
			font-weight:500;
			}
			footer {
				  text-align: center;
				  padding: 10px 0;
				  font-size: 14px;
				  position: relative;
				  bottom: 0;
				  width: 100%;
				}
			 .dropdown {
		      position: absolute;
		      top: 25px;
		      center: 10px;
		    }
		    .dropdown select {
		      padding: 5px;
		      font-size: 16px;
		      color: black;
		      background-color: transparent;
		      border: none;
		      border-radius: 0px; 
		      outline: none; 
		      transition: border-color 0.3s; 
		    }
		    .dropdown select:focus {
		      border-color: cornflowerblue; 
		    }
		    .login{
                background-color: #fff;
                border-radius: 15px;
                box-shadow: 0 0 20px rgba(red, green, blue, alpha);
                padding: 10px 20px;
                transition: transform 0.2s;
                width: 1000px;
                text-align:center;
            }
		    .content img,
		    .content video {
		      width: 500px;
		      height: auto;
		      margin-top: 30px;
		      transition: transform 0.5s ease, opacity 0.5s ease;
		    }
		
		    .content img:hover,
		    .content video:hover {
		      transform: scale(1.1);
		      opacity: 0.9; 
    		}
    		#dropdown {
            cursor: pointer;
            padding: 8px;
            font-size: 16px;
        }
        .content {
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 20px;
    }
    .content img,
    .content video {
        width: 600%;
        height: auto;
        max-width: 500px;
    }
    
    .nav_links {
    display: flex;
    align-items: center;
    list-style: none;
    gap: 15px; /* Adjust spacing between links */
    padding: 0;
    margin: 0;
}

.nav_links li {
    display: flex;
    align-items: center;
}

.dropdown select {
    padding: 5px;
    font-size: 16px;
    border-radius: 5px;
}
.feedback-button {
    position: fixed;
    right: 0;
    top: 50%;
    transform: translateY(-50%);
    background-color: 	#0047AB;
    font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;
    color: white;
    padding: 10px 15px;
    font-size: 16px;
    font-weight: bold;
    text-align: center;
    border-radius: 5px 0 0 5px;
    writing-mode: vertical-rl;
    text-decoration: none;
    cursor: pointer;
}

.feedback-button a {
    color: white;
    text-decoration: none;
}
.feedback-button.disabled {
    background-color: gray;
    pointer-events: none;
}

    
     </style>
          <script>
		    function navigateToPage() {
		    const dropdown = document.getElementById("dropdown");
		    const value = dropdown.value;
		      if (value) {
		        window.location.href = value; 
		      }                                           
		    }
		  </script>
<body>
<nav style="display: flex; align-items: center; justify-content: space-between; width: 100%;">
    <div class="nav_logo">
        <img src="logo.png" alt="icon" width="35px" height="30px"> IndiAir
    </div>
    
    <ul class="nav_links" style="display: flex; align-items: center; list-style: none; gap: 20px; padding: 0; margin: 0; font-size:18px;">
        <li class="link"><a href="login.jsp">Login</a></li>
        <li class="link"><a href="register.jsp">Register</a></li>
        <li class="link"><a href="aboutus.jsp">About Us</a></li>
        
        <!-- View Maps Dropdown -->
        <li class="link" style="display: flex; align-items: center;">
            <label for="dropdown" style="margin-right: 5px;">📍</label>
            <select id="dropdown" onchange="navigateToPage()" style="padding: 5px; font-size: 16px;">
                <option value="">View Maps</option>
                <option value="map.jsp">Indian Airport Map</option>
                <option value="internationalmap.jsp">International Airport Map</option>
            </select>
        </li>

        <!-- Contact Us Dropdown -->
        <li class="link" style="display: flex; align-items: center;">
            <label for="contact-options" style="margin-right: 5px;">📞</label>
            <select id="contact-options" onchange="handleSelection(this.value)" style="padding: 5px; font-size: 16px;">
                <option value="" disabled selected>Contact Us</option>
                <option value="mobile">1800120139</option>
                <option value="email">indiair6239@gmail.com</option>
            </select>
        </li>
    </ul>
</nav>

    
    <script>
        function handleSelection(value) {
            if (value === "mobile") {
                window.location.href = "tel:+1800120139";
            } else if (value === "email") {
                window.location.href = "mailto:indiair6239@gamil.com"; 
            }
        }
    </script>
     <div class="feedback-button">
    <a href="Feedback.jsp">Feedback</a>
</div>
<p id="feedback-message" style="color: red; text-align: center;"></p>
<script>
  document.addEventListener("DOMContentLoaded", function () {
    let feedbackCount = localStorage.getItem("feedbackCount") || 0;
    feedbackCount = parseInt(feedbackCount);
    
    const feedbackLink = document.getElementById("feedback-link");
    const feedbackMessage = document.getElementById("feedback-message");

    if (feedbackCount >= 5) {
        feedbackLink.parentElement.classList.add("disabled");
        feedbackMessage.textContent = "You have reached the maximum feedback limit (5).";
    }

    feedbackLink.addEventListener("click", function (event) {
        if (feedbackCount >= 5) {
            event.preventDefault();
        } else {
            localStorage.setItem("feedbackCount", feedbackCount + 1);
        }
    });
});

</script>
<div class="div1">
            <span><h1><i> Welcome To IndiAir </i></h1></span> 
            </div> 

        <div class="div2" style="text-align: center;">
             <strong><h2><marquee>✈️ Fly Smart, Travel Easy! Book Your Next Journey with IndiAir Today! 🚀</marquee></h2></strong>
             </div>
             <form method="post" action="login">
            <div class="login">
            <div class="content">
	        <img src="IndiAir Main Page pic1.png" alt="IndiAir Logo">
	        <video src="IndiAir Main Page Pic 2.mp4" alt="IndiAir Logo" controls autoplay loop muted></video>
               </div>
                </div>
                </form>  
</body>
<footer>Copyright © 2025 IndiAir All Rights Reserved</footer>
</html>