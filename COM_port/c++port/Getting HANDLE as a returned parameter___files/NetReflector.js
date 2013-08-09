jQuery.cookie=function(d,c,a){if(typeof c!="undefined"){a=a||{};if(c===null){c="";a.expires=-1}var h="";if(a.expires&&(typeof a.expires=="number"||a.expires.toUTCString)){var b;if(typeof a.expires=="number"){b=new Date;b.setTime(b.getTime()+a.expires*24*60*60*1e3)}else b=a.expires;h="; expires="+b.toUTCString()}var l=a.path?"; path="+a.path:"",j=a.domain?"; domain="+a.domain:"",k=a.secure?"; secure":"";document.cookie=[d,"=",encodeURIComponent(c),h,l,j,k].join("")}else{var f=null;if(document.cookie&&document.cookie!="")for(var g=document.cookie.split(";"),e=0;e<g.length;e++){var i=jQuery.trim(g[e]);if(i.substring(0,d.length+1)==d+"="){f=decodeURIComponent(i.substring(d.length+1));break}}return f}};(function(a){if(!a.Microsoft)a.Microsoft={};if(!a.Microsoft.Mtps)a.Microsoft.Mtps={};a.Microsoft.Mtps.NetReflector=function(a){return this.init(a)};a.extend(a.Microsoft.Mtps.NetReflector.prototype,{cookieOptions:{NRCookieName:"netreflector",ComscoreCookieName:"msresearch",path:"/",domain:".microsoft.com",duration:90},init:function(b){this.surveyUrl=b.surveyUrl;this.throttleRate=b.throttleRate;this.privacyStatementText=b.privacyStatementText;this.trackerWindowText=b.trackerWindowText;this.logoUrl=b.logoUrl;this.closeButtonUrl=b.closeButtonUrl;this.topBarUrl=b.topBarUrl;this.bottomBarUrl=b.bottomBarUrl;this.blankPage=b.blankPage;this.nrMainPanel=a("#divNRMain");this.nrCloseButton=a("#imgNRClose");this.nrSubmitButton=a("#btnNRYes");this.nrCancelButton=a("#btnNRNo");this.showSurveyToComscoreUser=b.showSurveyToComscoreUser;if(this.isCookiesEnabled()&&this.checkCookie()&&this.getRandom()){this.bindEvent();this.setCookie();this.showPopup()}},bindEvent:function(){this.nrCloseButton.bind("click",this,function(a){a.data.nrMainPanel.css("display","none")});this.nrSubmitButton.bind("click",this,function(a){a.data.popupTracker();a.data.nrMainPanel.css("display","none")});this.nrCancelButton.bind("click",this,function(a){a.data.nrMainPanel.css("display","none")})},checkCookie:function(){var c=a.cookie(this.cookieOptions.NRCookieName),b=a.cookie(this.cookieOptions.ComscoreCookieName);return b!=null&&this.showSurveyToComscoreUser=="no"?false:!c?true:false},setCookie:function(){a.cookie(this.cookieOptions.NRCookieName,1,{expires:this.cookieOptions.duration,path:this.cookieOptions.path,domain:this.cookieOptions.domain})},isCookiesEnabled:function(){a.cookie("stotest",1,{expires:0,path:this.cookieOptions.path,domain:this.cookieOptions.domain});var b=a.cookie("stotest");return b?true:false},getRandom:function(){var a=Math.random()*100;return a<this.throttleRate?true:false},showPopup:function(){var c=(a(window).height()-this.nrMainPanel.height())/2,b=(a(window).width()-this.nrMainPanel.width())/2,d=this.nrMainPanel,e=Math.round(c/10);this.nrMainPanel.css("top",0);this.nrMainPanel.css("left",b>0?b:0);this.nrMainPanel.css("display","block");a(d).animate({top:c},1500);this.addAnimation()},addAnimation:function(){var b=this.nrMainPanel;a(window).resize(function(){b.animate({top:(a(window).height()-b.height())/2+a(window).scrollTop(),left:(a(window).width()-b.width())/2+a(window).scrollLeft()},100)});a(window).scroll(function(){b.animate({top:(a(window).height()-b.height())/2+a(window).scrollTop(),left:(a(window).width()-b.width())/2+a(window).scrollLeft()},100)})},popupTracker:function(){newwindow=window.open(this.blankPage,"","height=325px,width=390px;resizable=1,scrollbars=1,titlebar=1")},getTrackerHtml:function(){var a="<html>";a+="<head>";a+="<title>SurveyTracker</title>";a+='<link href="resources/core.css" rel="stylesheet" type="text/css" />';a+="</head>";a+="<body >";a+='<table width="350px" height="300px" cellpadding="1" cellspacing="0" border="0" bgcolor="#FFFFFF">';a+='<tr><td style="padding: 1px;">';a+='<table width="100%" cellpadding="1" cellspacing="0" border="0" bgcolor="#999999">';a+='<tr><td style="padding: 0px;">';a+='<table width="100%" cellpadding="0" cellspacing="0" border="0" bgcolor="#FFFFFF">';a+='<tr valign="center"> <td><img src="'+this.logoUrl+'" /><br>';a+='<img src="'+this.topBarUrl+'" /> </td>';a+='<table width="100%" cellpadding="2" cellspacing="0" style="background-color: White; font-family: Segoe UI, Lucida Grande, Verdana, Arial, Helvetica, sans-serif;font-size: 80%;color: #333">';a+='<tr><td style="padding: 2px">';a+="<div >"+this.trackerWindowText+"</div>";a+='<div style="padding-top:20px"><a href="http://privacy.microsoft.com/">'+this.privacyStatementText+"</a></div>";a+="</td></tr></table>";a+='<img src="'+this.bottomBarUrl+'" />';a+="</td></tr></table>";a+="</td></tr></table>";a+="</td></tr></table>";a+='<script type="text/javascript">';a+='var timer = self.setInterval("checkParentWindow()", 1000);';a+="var mainWindow;";a+="function checkParentWindow() {";a+="if (window.opener) {";a+="if (window.opener.closed) { showSurvey(); }";a+="else { try { mainWindow = window.opener.location.href; } catch (ex) { showSurvey(); } } }";a+="else { window.close(); } }";a+="function showSurvey() {";a+='window.open("'+this.surveyUrl+'");';a+="timer = window.clearInterval(timer);";a+="widnow.close();}";a+="<\/script>";a+="</body>";a+="</html>";return a}});if(a.Microsoft.Mtps.NetReflectorInit!==undefined){var b=a.Microsoft.Mtps.NetReflectorInit;a(document).ready(function(){new a.Microsoft.Mtps.NetReflector({surveyUrl:b.surveyUrl,throttleRate:b.throttleRate,privacyStatementText:b.privacyStatementText,trackerWindowText:b.trackerWindowText,logoUrl:b.logoUrl,closeButtonUrl:b.closeButtonUrl,topBarUrl:b.topBarUrl,bottomBarUrl:b.bottomBarUrl,blankPage:b.blankPage,showSurveyToComscoreUser:b.showSurveyToComscoreUser})})}})(jQuery);