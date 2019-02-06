<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>DESIGNED BY AFAQUE</title>
</head>

<body>
<div class="container-fluid">
<div id="myCarousel" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
                <li data-target="#myCarousel" data-slide-to="3"></li>
            </ol>
            <div class="carousel-inner" role="listbox">
                <div class="item active" align="center">
                    <img class="first-slide home-image" src="<c:url value='/resources/images/one.jpg'></c:url>" alt="first slide" height="600px" width="1300px">
                    <div class="container">
                        <div class="carousel-caption">
                            <h1> ARDUINO</h1>
                            <p>UNO</p>
                        </div>
                    </div>
                </div>
                <div class="item" align="center">
                    <img class="second-slide home-image" src="<c:url value='/resources/images/two.jpg'></c:url>" alt="Second slide">
                    <div class="container">
                        <div class="carousel-caption">
                            <h1>ARDUINO</h1>
                            <p>NANO</p>
                        </div>
                    </div>
                </div>
                <div class="item" align="center">
                    <img class="third-slide home-image " src="<c:url value='/resources/images/three.jpg'></c:url>" alt="Third slide">
                    <div class="container">
                        <div class="carousel-caption">
                            <h1>ARDUINO</h1>
                            <p>MEGA</p>
                        </div>
                    </div>
                </div>
                 <div class="item" align="center">
                    <img class="forth-slide home-image " src="<c:url value='/resources/images/four.jpg'></c:url>" alt="forth slide">
                    <div class="container">
                        <div class="carousel-caption">
                            <h1>RASBERRY PI</h1>
                            <p>PI-3</p>
                        </div>
                    </div>
                </div>
            </div>
            <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" ></span>
                <span class="sr-only">Next</span>
            </a>
        </div>

</div>
 
</body>
</html>