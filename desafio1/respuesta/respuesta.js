const lastYearData = require("../last_year.json");

let days = {} //  obj guardar las ocurrencias
let day;
let lastSightingDay;

lastYearData.forEach(function (tupleData) {

    day = tupleData[0];
    lastSightingDay = tupleData[1];

    if (!(day in days)) {
        days[day] = {
            "sightingDay": 1
        }
    }else{
        days[day].sightingDay += 1;
    }
});

let min = Infinity;
let saferDay = Infinity;


for (const key in days) {
    if (days.hasOwnProperty(key)) {
        const element = days[key];

        if (element.sightingDay < min) {
            const { weekDay: checkWeekDay, month: checkMonth, dateOfYear: checkDate } = getWeekDayAndMonth(key+1);
    
            //check month is valid
            if(checkMonth == ('enero' || 'diciembre')){
                continue;
            }

            min = element.sightingDay;
            saferDay = key;
        }
    }
}

function getWeekDayAndMonth(dayOfYear) {
    const date = new Date(new Date().getFullYear(), 0);
    date.setDate(dayOfYear);
    
    const weekDay = date.toLocaleString('default', { weekday: 'long' });
    const month = date.toLocaleString('default', { month: 'long' });
    const dateOfYear = date.toLocaleString();

    return { weekDay, month, dateOfYear };
  }
  
  const dayOfYear = parseInt(saferDay)+1;
  const { weekDay, month, dateOfYear } = getWeekDayAndMonth(dayOfYear);

console.log(`Dia mas seguro para hacer la expedicion corresponde al dia ${dayOfYear} del año, con fecha ${dateOfYear}, con un numero minimo de avistamiento correspondiente a ${min} Titanes segun registro del año 2022`);