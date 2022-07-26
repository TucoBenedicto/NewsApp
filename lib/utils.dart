getDayNameFromWeekDay({  int? day}) {

  switch (day){

    case 1: return 'Lundi';
    break;

    case 2: return 'Mardi';
    break;

    case 3: return 'Mercredi';
    break;

    case 4: return 'Jeudi';
    break;

    case 5: return 'Vendredi';
    break;

    case 6: return 'Samedi';
    break;

    case 7: return 'Dimanche';
    break;

  }
}



 getMonthNumberFromName({String? month}) {

  switch (month){

    case 'Jan': return '01';
    break;

    case 'Feb': return '02';
    break;

    case 'Mar': return '03';
    break;

    case 'Apr': return '04';
    break;

    case 'May': return '05';
    break;

    case 'Jun': return '06';
    break;

    case 'Jul': return '07';
    break;

    case 'Aug': return '08';
    break;

    case 'Sep': return '09';
    break;

    case 'Oct': return '10';
    break;

    case 'Nov': return '11';
    break;

    case 'Dec': return '12';
    break;

  }

}


getMonthNumberInWords({ int? month}) {

  switch (month) {
    case 1 : return 'Janvier';
    break;

    case 2 : return 'Fevrier';
    break;

    case 3 : return 'Mars';
    break;

    case 4 : return 'Avril';
    break;

    case 5 : return 'Mai';
    break;

    case 6 : return 'Juin';
    break;

    case 7 : return 'Juillet';
    break;

    case 8 : return 'Aout';
    break;

    case 9 : return 'Septembre';
    break;

    case 10 : return 'Octobre';
    break;

    case 11 : return 'Novembre';
    break;

    case 12 : return 'Decembre';
    break;

  }
}