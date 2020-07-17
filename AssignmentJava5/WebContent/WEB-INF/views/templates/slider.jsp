<%-- 
    Document   : slider
    Created on : Oct 18, 2017, 8:22:49 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>



	<div class="slideshow-header">

		<div class="slideContainer">
			<div class="mySlides">

				<img src="images/a1.jpg" style="width: 100%; height: 300px"
					class="pic">



			</div>
			<div class="mySlides">

				<img src="images/a2.png" style="width: 100%; height: 300px"
					class="pic">

			</div>
			<div class="mySlides">

				<img src="images/a3.jpg" style="width: 100%; height: 300px"
					class="pic">

			</div>

		</div>

		<!-- 	<a class="prev" onclick="plusSlides(-1)">&#10094;</a> <a class="next"
			onclick="plusSlides(1)">&#10095;</a> -->
	</div>

	<div style="text-align: center">
		<span class="dot" onclick="currentSlide(1)"></span> <span class="dot"
			onclick="currentSlide(2)"></span> <span class="dot"
			onclick="currentSlide(3)"></span>

	</div>




	<script type="text/javascript">
		var slideIndexAuto = 0;
		showSlidesAuto();

		function showSlidesAuto() {
			var i;
			var slides = document.getElementsByClassName("mySlides");
			var dots = document.getElementsByClassName("dot");
			for (i = 0; i < slides.length; i++) {
				slides[i].style.display = "none";
			}
			slideIndexAuto++;
			if (slideIndexAuto > slides.length) {
				slideIndexAuto = 1
			}
			slides[slideIndexAuto - 1].style.display = "block";
			for (i = 0; i < dots.length; i++) {
				dots[i].className = dots[i].className.replace(" active", "");
			}
			dots[slideIndexAuto - 1].className += " active";
			setTimeout(showSlidesAuto, 5000); // Change image every 2 seconds
		}

		var slideIndex = 1;
		showSlides(slideIndex);

		// Next/previous controls
		function plusSlides(n) {
			showSlides(slideIndex += n);
		}

		// Thumbnail image controls
		function currentSlide(n) {
			showSlides(slideIndex = n);
		}

		function showSlides(n) {
			var i;
			var slides = document.getElementsByClassName("mySlides");
			var dots = document.getElementsByClassName("dot");
			if (n > slides.length) {
				slideIndex = 1;
			}
			if (n < 1) {
				slideIndex = slides.length;
			}
			for (i = 0; i < slides.length; i++) {
				slides[i].style.display = "none";
			}
			for (i = 0; i < dots.length; i++) {
				dots[i].className = dots[i].className.replace(" active", "");
			}
			slides[slideIndex - 1].style.display = "block";
			dots[slideIndex - 1].className += " active";

		}
	</script>

