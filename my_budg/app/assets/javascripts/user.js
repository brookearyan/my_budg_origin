
class User {

  User.all = [];

  constructor(data) {
    this.id = data.id;
    this.name = data.name;
    this.zipcode = data.zipcode;
    this.income = data.income;
    this.expenses = [];
    this.bills = [];

    User.all.push(this);
  }

  expenses() {
    return Expenses.all.filter(expense => {
      return expense.user_id === this.id
    })
  };

  bills() {
    return Bill.all.filter(bill => {
      return bill.user_id === this.id
    })
  };


}
