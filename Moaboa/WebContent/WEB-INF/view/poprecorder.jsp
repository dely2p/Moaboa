<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!Doctype html>
<html>
<head>
	<meta name="viewport" content="width=device-width,initial-scale=1" />
	<title>Audio Recorder</title>

	<script src="../assets/js/audiodisplay.js"></script>
	<script src="../assets/js/recorderjs/recorder.js"></script>
	<script src="../assets/js/main.js"></script>
	
	<style>
*{box-sizing: border-box; margin: 0; padding: 0;}
html, body{height: 100%;}
#viz{width: 50%; height: 100%; float: left;}
#viz canvas{display: block; background: #202020; width: 90%; height: 45%; margin: 5% auto 0; box-shadow: 0px 0px 10px blue;}
#controls{width: 50%; height: 100%; float: left; padding: 1%;}
#controls #recordandsave{width: 100%; height: 50%; padding-top: 15%; text-align: center;}
#controls #recordandsave #record{display: inline-block; width: 30%;}
#controls #recordandsave #record.recording { 
		background: red;
		background: -webkit-radial-gradient(center, ellipse cover, #ff0000 0%,rgba(211, 211, 211, 0) 75%,rgba(211, 211, 211, 0) 100%,#7db9e8 100%);
		background: -moz-radial-gradient(center, ellipse cover, #ff0000 0%,rgba(211, 211, 211, 0) 75%,rgba(211, 211, 211, 0) 100%,#7db9e8 100%);
		background: radial-gradient(center, ellipse cover, #ff0000 0%,rgba(211, 211, 211, 0) 75%,rgba(211, 211, 211, 0) 100%,#7db9e8 100%);
		 
	}
#controls #recordandsave #save{display: inline-block; width: 30%;}
#controls #recordandsave #save img{display: block; width: 100%;}
#controls #searchandupload{width: 100%; height: 50%; padding-top: 15%;}
#controls #searchandupload #uploadFile{width: 100%; height: 100%; overflow: hidden; padding: 1%;}
#controls #searchandupload #uploadFile .upFile{width: 50%; float: left;}
#controls #searchandupload #uploadFile #uploadimg{width: 30%;}
.upFile{cursor: pointer; border: 0xp; padding: 0px; filter: alpha(opacity:0);}

/* 
	
	#record { height: 50vh;}
	#record.recording { 
		background: red;
		background: -webkit-radial-gradient(center, ellipse cover, #ff0000 0%,lightgrey 75%,lightgrey 100%,#7db9e8 100%); 
		background: -moz-radial-gradient(center, ellipse cover, #ff0000 0%,lightgrey 75%,lightgrey 100%,#7db9e8 100%); 
		background: radial-gradient(center, ellipse cover, #ff0000 0%,lightgrey 75%,lightgrey 100%,#7db9e8 100%);
		 
	}
	#saveorupload {
		height: 50vh;
	}
	#save, #save img { height: 50vh; }
	#save { opacity: 0.25;}
	#save[download] { opacity: 1;}
	
	#controls {
		height: 100%;
		width: 60%;
		display: flex;
		flex-direction: column;
		justify-content: space-around;
		align-items: center;
		margin-left: 10%; 
	}
	

	@media (orientation: landscape) {
		body { flex-direction: row;}
		#controls { flex-direction: column; height: 100%; width: 10%;}
		#viz { height: 100%; width: 30%;}
	}
 */
	</style>

</head>
<body>
	<div id="viz">
		<canvas id="analyser"></canvas>
		<canvas id="wavedisplay"></canvas>
	</div>
	<div id="controls">
		<div id="recordandsave">
			<img id="record" src="../assets/img/mic128.png" onclick="toggleRecording(this);">
			<a id="save" href="#" ><img src="../assets/img/save.png"></a>		
		</div>
		<div id="searchandupload">
			<form:form method="post" action="upload.do" commandName="uploadFile" enctype="multipart/form-data">
				<input type="file" name="file" id="" class="upFile" />
								
				<form:errors path="file" />	
				<input id="uploadimg" type="image" src="../assets/img/upload.png" name="submit" value="전송" align="absmiddle">
	<!-- 			<a id="uploadfile" href=""><input type="submit" value="전송"><img id="save" src="../assets/img/upload.png" onclick="record(this);"></a> -->
			<!-- <img id="save1" src="../assets/img/upload.png" onclick="record(this);"> -->
			</form:form>
		</div>
	</div>
</body>
</html>