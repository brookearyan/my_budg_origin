class Bill {
  constructor(data) {
    this.id = data.id;
    this.name = data.company;
    this.type = data.type;
    this.cost = data.cost;
    this.date = data.date;
    this.user_id = data.user_id;
    Bill.all.push(this);
  }

  // userBills () {
  //   if (this.user_id === current_user.id) {
  //     listBills.push(this);
  //   }
  // }
  // listBills = [];

}
