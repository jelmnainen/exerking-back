t = Time.now

e1 = Exercise.create title: "Rails Datetime pt 1", text: "Learn how to use Rails Datetime", deadline: t.advance(hours: 2), file_upload: true
e2 = Exercise.create title: "Rails Datetime pt 2", text: "Learn how to create a DatePicker", deadline: t.advance(days: 6), file_upload: false
e3 = Exercise.create title: "Rails Datetime pt 3", text: "Now you know enough to create your own Google Calendar App! Go and do it!", deadline: t.advance(days: 12), file_upload: true
e4 = Exercise.create title: "Become a Rails Pro", text: "Do or do not. There is no try!", file_upload: true

u1 = User.create email: "student@example.com", password: "password", teacher: false
u2 = User.create email: "teacher@example.com", password: "password", teacher: true
