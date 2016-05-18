var Year = function (year) {
  this.input = year;
}

Year.prototype = {
  isLeap: function() {
    if (this.leapYears()) {
      return true;
    } else if (!this.notLeapYears()){
      return false;
    }
  },
  leapYears: function() {
    var year = this.input;
    if (year % 4 === 0 && year % 100 !== 0 || year % 400 === 0 ) {
      return true;
    }
  },
  notLeapYears: function() {
    var year = this.input;
    if (year % 100 === 0 || year % 4 !== 0 ) {
     return false;
   }
  }
}

module.exports = Year;
