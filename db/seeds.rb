user = User.create(email: "foo@bar.com", password: "foo", password_confirmation: "foo", cash: 90000)

user.stocks.create(symbol:"goog", quantity: 100)