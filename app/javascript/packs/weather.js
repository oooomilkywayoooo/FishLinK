  /*global $*/
  /*global gon*/
  $(function () {
  const API_KEY = gon.api

  window.onload = function() {
    weather_search()
    };

  const wheather_select = document.querySelector('#wheather-select');
  const options = document.querySelectorAll("#wheather-select option");
  const weather_search = function () {

    const index =  this.selectedIndex;
    const spot_id = index ?　options[index].value : wheather_select.value
    const weather_url = 'https://api.openweathermap.org/data/2.5//forecast?id=' + spot_id + '&appid=' + API_KEY;

    wheather_select.addEventListener('change', weather_search);

    $.ajax({
      url: weather_url,
      dataType: 'json',
      type: 'GET',
      })
    .done(function (weather) {
    let insertHTML = '';
    // 0から8まで計9回繰り返す
    for (let i = 0; i <= 28; i = i + 4) {
      insertHTML += buildHTML(weather, i);
    }
    $('#weather').html(insertHTML);
    })
    .fail(function (weather) {
    alert('天気予報の取得に失敗しました');
    });
  }
});

// 日本語で表示
function buildHTML(weather, i) {
  //日付、時間を取得（Dateがミリ秒なので1000倍が必要）
  const date = new Date(weather.list[i].dt_txt);
  //UTCとの時差を無くす(日本は-9時間のため9を足す)
  date.setHours(date.getHours() + 9);
  //月を取得。getMonth()は0~11を返すため1を足すことによって1月~12月を返すように設定
  const month = date.getMonth() + 1;
  //曜日の日本語化のため、配列を用意する
  const Week = new Array('(日)', '(月)', '(火)', '(水)', '(木)', '(金)', '(土)');
  //月＋日＋曜日をdayに代入。getDay()は0~6を返すためWeek配列内のインデックスに対応した文字列を取得
  const day = month + '/' + date.getDate() + Week[date.getDay()];
  // 時間の取得
  const time = date.getHours() + "：00";
  //天気のアイコンを取得
  const icon = weather.list[i].weather[0].icon;
  //風速を取得
  const wind_speed = Math.floor(weather.list[i].wind.speed);
  //風向（角度）を取得し方角表記へ変換
  const get_deg_string = function(wind_deg) {
    let r = '北';
    if (wind_deg>=11.25) r = '北北東';
    if (wind_deg>=33.75) r = '北東';
    if (wind_deg>=56.25) r = '東北東';
    if (wind_deg>=78.75) r = '東';
    if (wind_deg>=101.25) r = '東南東';
    if (wind_deg>=123.75) r = '南東';
    if (wind_deg>=146.25) r = '南南東';
    if (wind_deg>=168.75) r = '南';
    if (wind_deg>=191.25) r = '南南西';
    if (wind_deg>=213.75) r = '南西';
    if (wind_deg>=236.25) r = '西南西';
    if (wind_deg>=258.75) r = '西';
    if (wind_deg>=281.25) r = '西北西';
    if (wind_deg>=303.75) r = '北西';
    if (wind_deg>=326.25) r = '北北西';
    return r;
  };
  const wind_deg = get_deg_string(weather.list[i].wind.deg);

  const html =
    '<div class="weather__content--report">' +
      '<img src="https://openweathermap.org/img/w/' + icon + '.png">' +
      '<p class="weather__content--report-date">' + day + "</p>" +
      '<p class="weather__content--report-time">' + time + "</p>" +
      '<p class="weather__content--report-wind_deg">' + wind_deg + "</p>" +
      '<p class="weather__content--report-wind_speed"><i class="fa-solid fa-wind"></i>' + wind_speed + "m</p>" +
    '</div>';
  return html
}