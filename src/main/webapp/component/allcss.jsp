<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>

<style>
.backImg {
	background-image: url('../img/backImg.jpg');
	height: 115vh;
	background-repeat: no-repeat;
	width: 100%;
	background-size: cover;
	background-position: center;
}

* {
	margin: 0;
	padding: 0;
}

@import
	url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;500&display=swap')
	;

:root {
	--green: green;
	--black: #130f40;
	--light-color: #666;
	--box-shadow: 0 .5rem 1.5rem rgba(0, 0, 0.1);
	--border: .2rem solid rgba(0, 0, 0.1);
	--outline: .1rem solid rgba(0, 0, 0.1);
}

* {
	font-family: 'Poppins', sans-serif;
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	text-decoration: none;
	text-transform: capitalize;
	transition: all .2s linear;
}

/* footer section */
.footer {
	background: #fff;
	margin: 2rem;
	padding: 1rem;
	font-size: 1rem;
}

.footer .box-container {
	border: 0px solid;
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(26rem, 1fr));
	gap: 1.5rem;
}

.footer .box-container .box h1 {
	font-size: 3rem;
	color: var(--black);
	padding: 0rem 0;
	margin: 0;
}

.footer .box-container .box h1 i {
	font-size: 2.5rem;
	color: var(--green);
}

.footer .box-container .box h1 a {
	font-size: 2rem;
	color: var(--green);
}

.footer .box-container .box h3 {
	font-size: 2rem;
	color: var(--black);
	padding: 0.5rem 0;
}

.footer .box-container .box h3 i {
	color: var(--green);
}

.footer .box-container .box .links {
	display: block;
	font-size: 1.2rem;
	color: #4e3b3b;
	padding: 0.5rem 0;
}

.footer .box-container .box .links i {
	color: var(--green);
	padding-right: .5rem;
}

.footer .box-container .box .links:hover i {
	padding-right: 2rem;
}

.footer .box-container .box p {
	line-height: 1.8;
	font-size: 1.2rem;
	color: #385aed;
	padding: 1rem 0;
}

.footer .box-container .box .share a {
	border: 0px solid;
	height: 4rem;
	width: 4rem;
	line-height: 4rem;
	border-radius: .5rem;
	font-size: 2rem;
	color: var(--black);
	margin-left: .2rem;
	background: #eee;
	text-align: center;
}

.footer .box-container .box .share a:hover {
	background: var(--green);
	color: #fff;
}

.footer .box-container .box .email {
	width: 100%;
	margin: .7rem 0;
	padding: 1rem;
	border-radius: .5rem;
	background: #eee;
	font-size: 1.6rem;
	color: var(--black);
	text-transform: none;
}

.footer .box-container .box img {
	margin-top: 2rem;
	padding: 0 4rem;
	height: 4rem;
	width: 35rem;
}

.footer .credit {
	text-align: center;
	margin-top: 2rem;
	padding: 1rem;
	padding-top: 2.5rem;
	font-size: 2rem;
	color: var(--black);
	border-top: var(--border);
}

.footer .credit span {
	color: var(--green);
}

/* footer section */
</style>