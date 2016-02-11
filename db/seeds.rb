t = Time.now

e1 = Exercise.create title: "Rails Datetime pt 1", text: "Learn how to use Rails Datetime", deadline: t.advance(hours: 2)
e2 = Exercise.create title: "Rails Datetime pt 2", text: "Learn how to create a DatePicker", deadline: t.advance(days: 6)
e3 = Exercise.create title: "Rails Datetime pt 3", text: "Now you know enough to create your own Google Calendar App! Go and do it!", deadline: t.advance(days: 12)
e4 = Exercise.create title: "Become a Rails Pro", text: "Do or do not. There is no try!"

u1 = User.create email: "student@example.com", password: "password", teacher: false
u2 = User.create email: "teacher@example.com", password: "password", teacher: true
