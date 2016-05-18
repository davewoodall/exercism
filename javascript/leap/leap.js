var Year = function (year) {
  this.input = year;
}

Year.prototype = {
  isLeap: function() {
    var year = this.input;
    if (year % 4 === 0 && year % 100 !== 0 || year % 400 === 0 ) {
      return true
    } else if (year % 100 === 0 || year % 4 !== 0 ) {
      return false;
    }
  }
}

module.exports = Year;
