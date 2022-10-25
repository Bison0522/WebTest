<!DOCTYPE html>

<html lang="ja">
  <head>
    <meta charset="UTF-8">
    <Sheet1>
    <link rel="stylesheet" href="QuestionStyle.css">
  </head>
  <body>
    <div class="vectrical">
      <div class="text1" id="text1">漢字</div>
      <div class="text2" id="text2">漢字</div>
      <div class="text3" id="text3">漢字</div>
    </div><br>

    <input type="button" class="buttonposAns" onclick="location.href='https://bison0522.github.io/WebTest/AnswerSheet.html'" value="回答する">
    <input type="button" class="buttonposSkip" onclick="location.href='https://bison0522.github.io/WebTest/QuestionSheet.hsp'" value="スキップ">


    <script type="module">
    window.onload = function(){     
      getCsv("Questions.csv", 0);
      getCsv("Log.csv", 1);
    }
      
    function getCsv(data, num){
      let xhr = new XMLHttpRequest(); 
      xhr.open("GET",data,true);
      xhr.onload = function (e) {
          if (xhr.readyState === 4) {
              if (xhr.status === 200) {
                csvArr(xhr.responseText, num);
              } 
              else {
                console.error(xhr.statusText);
              }
          }
      };
      xhr.send(null);
    }
    
    function csvArr(dataArr, num){
      let arr = [];
      let list = dataArr.split('\n');
      for(let i = 0; i < list.length; i++){
        arr[i] = list[i].split(',');
      }
      if(num == 0){
        checkAns(arr);
      }
      else{
        console.log(arr.length);
        let ipmatch = false;
        let ip = 0;
        fetch('https://ipinfo.io?callback')
          .then(res => res.json())
          .then(json => ip=json.ip);
        for(let i = 1; i < (arr.length-1); i++){
          ipmatch = (arr[i][0] == ip);
          if(ipmatch == true){
            break;
          }
        }
        console.log(ip);
      }
    }
    
    function checkAns(dataList){
      let i = dataList.length - 2;
      let num = getRandomInt(1, i);
    
      let text1 = document.getElementById("text1");
      let text2 = document.getElementById("text2");
      let text3 = document.getElementById("text3");
      text1.innerHTML = dataList[num][1];
      text2.innerHTML = dataList[num][2];
      text3.innerHTML = dataList[num][3];
    }
    
    function getRandomInt(min, max) {
      min = Math.ceil(min);
      max = Math.floor(max);
      return Math.floor(Math.random() * (max - min) + min); 
    }
     

      
    </script>
  </body>
</html>
