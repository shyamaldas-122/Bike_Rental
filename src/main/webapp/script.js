let displayDate = document.getElementById("display-date");
let dateToday = new Date();
/*
Possible values for formats:
weekday: "narrow","short","long"
year: "numeric", "2-digit"
month: "numeric", "2-digit", "narrow", "short", "long"
day: "numeric", "2-digit"
*/
let formats = {
  weekday: "long",
  year: "2-digit",
  month: "long",
  day: "2-digit",
};
let formattedDate = dateToday.toLocaleDateString("en-US", formats);
displayDate.innerText = formattedDate;