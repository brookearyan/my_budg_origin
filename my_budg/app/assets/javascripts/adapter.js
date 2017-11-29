class Adapter {
  constructor() {
    this.baseUrl = 'http://localhost:3000';
    this.headers = {
      'Content-Type': 'application/json',
      Accept: 'application/json'
    };
  }

  fetchData() {
    return this.get(`${this.baseUrl}/`);
  }
}
