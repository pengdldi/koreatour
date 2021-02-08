<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>main</title>
<link rel="Stylesheet" type="text/css" href="./css/main.css" />
<style>
    html, body {
        height: 100%;
        margin: 0;
        padding: 0;
    }

    #map {
        height: 100%;
    }
</style>
<script src="http://code.jquery.com/jquery-1.11.2.js"></script>
<script>
function areaChange() {
	var x = form.Area.value;
	
	if(x == 0) {
		return;
	}
	
	$.ajax({
		type: "POST",
		url: "GetSigungu.jsp",
		data: "areaCode=" + x,
		success: setSigungu
	});
}

function setSigungu(msg) {
	$("#target").html(msg); //innerHTML을 이런 방식으로 사용함 id는 $("#id") name의 경우 $("name")으로 접근함
}
</script>
</head>
<body>
<table cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td width="50%" height="130">&nbsp;</td>
        <td width="900" height="130">
            <p align="center"><img src="img/maintop.png" width="511" height="131" border="0"></p>
        </td>
        <td width="50%" height="130">&nbsp;</td>
    </tr>
    <tr>
        <td width="1872" align="center" colspan="3" height="50" bgcolor="#10AC8D">
<form name="form">
<select name="Area" onchange="areaChange()">
<option value="0">-- 지역 선택 --</option>
<option value="1">서울</option>
<option value="2">인천</option>
<option value="3">대전</option>
<option value="4">대구</option>
<option value="5">광주</option>
<option value="6">부산</option>
<option value="7">울산</option>
<option value="8">세종특별자치시</option>
<option value="31">경기도</option>
<option value="32">강원도</option>
<option value="33">충청북도</option>
<option value="34">충청남도</option>
<option value="35">경상북도</option>
<option value="36">경상남도</option>
<option value="37">전라북도</option>
<option value="38">전라남도</option>
<option value="39">제주도</option>
</select>
<span id="target">
<select name="Sigungu">
<option value="0">-- 시/군/구 선택 --</option>
</select>
</span>
<select name="Type">
<option value="0">-- 타입 선택 --</option>
<option value="A01">자연</option>
<option value="A02">인문(문화/예술/역사)</option>
<option value="A03">레포츠</option>
<option value="A04">쇼핑</option>
<option value="A05">음식</option>
<option value="B02">숙박</option>
<option value="C01">추천코스</option>
<option value="ETC">기타</option>
</select>
</form>
        </td>
    </tr>
</table>
<p>&nbsp;</p>

<div id="map"></div>
    <script>
    function initMap() {
        var location = {
            lat: 37.5148783564,
            lng: 127.0587929491
        };

        var map = new google.maps.Map(document.getElementById('map'), {
            scaleControl: true,
            center: location,
            zoom: 15
        });

        var contentString = '<h2>곰바위(봉은사본점)</h2>' +
            '<a href="http://www.naver.com">www.naver.com</a>';

        var infowindow = new google.maps.InfoWindow({
            content : contentString
        });

        var marker = new google.maps.Marker({
            map: map,
            position: location
        });

        marker.addListener('click', function () {
            infowindow.open(map, marker);
        });
    }
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDTJdKlj8PLqvqCE1i9bslAKsyYOgtkR9E&callback=initMap" type="text/javascript"></script>
</body>
</html>
