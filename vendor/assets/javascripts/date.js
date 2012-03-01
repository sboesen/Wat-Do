(function(a){a.fn.extend({datetimeparse:function(b){function t(a){var b=new Date;if(a>b){return true}return false}function s(a){switch(a.toLowerCase()){case"sun":case"sunday":var b=0;break;case"mon":case"monday":var b=1;break;case"tue":case"tues":case"tuesday":var b=2;break;case"wed":case"wednesday":var b=3;break;case"thur":case"thurs":case"thursday":var b=4;break;case"fri":case"friday":var b=5;break;case"sat":case"saturday":var b=6;break}if(b!=undefined){return b}return false}function r(a){if(a==undefined){return false}timeArray=a.split(":");for(var b=0;b<timeArray.length;b++){if(isNaN(parseInt(timeArray[b]))){return false}}if(a.length<=2&&timeArray.length==1){return true}if(timeArray.length==2){return true}if(timeArray.length==3){return true}return false}function q(a){var b=false;switch(a){case"a":case"am":b=true;break;case"p":case"pm":b=true;break}return b}function p(b){b=a.trim(b);if(b.substr(-1)=="/"){return false}if(b.length<=5){return b.charAt(1)=="/"||b.charAt(2)=="/"}else{var c=b.split("/").pop();if(c.length!=2&&c.length!=4){return false}var d=b.charAt(1)=="/"||b.charAt(2)=="/";var e=b.charAt(3)=="/"||b.charAt(4)=="/"||b.charAt(5)=="/";return d&&e}}function o(a,b){return}function n(a,b){return}function m(a){a=typeof a!="undefined"?a:new Date;a.setHours(b.hours);a.setMinutes(b.minutes);a.setSeconds(b.seconds);a.setMilliseconds(b.milliseconds);return a}function l(a){timeArray=a.split(":");if(timeArray.length<3){return 0}return timeArray[2]}function k(a,b){var c=a.split(":");var d=parseInt(c[0]);if(b==undefined){b="am"}if(b.indexOf("a")!=-1){if(d>11){d=d-12}}else{if(d<=11){d=d+12}}return d}function j(a){timeArray=a.split(":");if(timeArray.length<2){return 0}return timeArray[1]}function i(a,b){var c=b.getHours();var d=b.getDay();if(d==a){b.setHours(c+24*7)}else if(d<a){b.setHours(c+24*(a-d))}else if(d>a){b.setHours(c+24*(a-d+7))}return b}function h(a,b,c){switch(b){case"second":case"seconds":c.setSeconds(c.getSeconds()-a);break;case"minute":case"minutes":c.setMinutes(c.getMinutes()-a);break;case"hour":case"hours":c.setHours(c.getHours()-a);break;case"day":case"days":c.setHours(c.getHours()-24*a);break;case"week":case"weeks":c.setHours(c.getHours()-168*a);break;case"month":case"months":c.setMonth(c.getMonth()-a);break;case"year":case"years":c.setFullYear(c.getFullYear()-a);break}}function g(a,b,c){a=parseInt(a);switch(b){case"second":case"seconds":c.setSeconds(c.getSeconds()+a);break;case"minute":case"minutes":c.setMinutes(c.getMinutes()+a);break;case"hour":case"hours":c.setHours(c.getHours()+a);break;case"day":case"days":c.setHours(c.getHours()+24*a);break;case"week":case"weeks":c.setHours(c.getHours()+168*a);break;case"month":case"months":c.setMonth(c.getMonth()+a);break;case"year":case"years":c.setFullYear(c.getFullYear()+a);break}}function f(a){var b=new Date;while(a<b){var c=a.getHours();a.setHours(c+24)}return a}function e(a,c,e){if(e==null){e=new Date;e=m(e)}if(p(a)){e=new Date(c[0]);e=m(d)}else if(r(a)){var n=k(a,c[0]);var o=j(a);var q=l(a);e.setHours(n);e.setMinutes(o);e.setSeconds(q);c.shift()}else if(s(a)!=false){var t=s(a);e=i(t,e)}else if(a=="at"){if(r(c[0])){var n=k(c[0],c[1]);var o=j(c[0]);var q=l(c[0]);e.setHours(n);e.setMinutes(o);e.setSeconds(q);c.shift()}}else if(a=="on"){if(p(c[0])){oldHours=e.getHours();oldMinutes=e.getMinutes();oldSeconds=e.getSeconds();oldMilliseconds=e.getMilliseconds();e=new Date(c[0]);e.setHours(oldHours);e.setMinutes(oldMinutes);e.setSeconds(oldSeconds);e.setMilliseconds(oldMilliseconds)}else if(s(c[0])!=false){dotw=s(c[0]);i(dotw,e)}c.shift()}else if(a=="+"){g(c[0],c[1],e);c.shift();c.shift()}else if(a=="-"){h(c[0],c[1],e);c.shift();c.shift()}else if(a=="tom"||a=="tomorrow"){e=m(e);e.setHours(24)}else if(a=="today"){e=m(new Date)}else if(a=="now"){e=new Date}if(b.assumeFuture){e=f(e)}return e}var c={hours:0,minutes:0,seconds:0,milliseconds:0,assumeFuture:false};var b=a.extend(c,b);var d=null;this.each(function(){var b=a.trim(a(this).val());var c=b.split(" ");while(c.length>0){var f=e(c.shift(),c,d);if(f!=null){d=f}}});if(d==undefined){return"Something went wrong!"}return d}})})(jQuery)