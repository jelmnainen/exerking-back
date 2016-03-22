t = Time.now

cat1 = Category.create title: "Oliot", color: "red"
cat2 = Category.create title: "Loopit", color: "teal"
cat3 = Category.create title: "Funktiot", color: "pink"

bat1 = Batch.create title: "Eka batchi", deadline: t.advance(days: 12)
bat2 = Batch.create title: "Toka batchi", deadline: t.advance(days: 24)
bat3 = Batch.create title: "Kolmas batchi", deadline: t.advance(days: 36)

e1 = Exercise.create title: "Rails Datetime pt 1", text: "Learn how to use Rails Datetime", deadline: t.advance(hours: 2), file_upload: true, batch: bat1, category: cat1
e2 = Exercise.create title: "Rails Datetime pt 2", text: "Learn how to create a DatePicker", deadline: t.advance(days: 6), file_upload: false, batch: bat1, category: cat2
e3 = Exercise.create title: "Rails Datetime pt 3", text: "Now you know enough to create your own Google Calendar App! Go and do it!", deadline: t.advance(days: 12), file_upload: true, batch: bat1, category: cat3
e4 = Exercise.create title: "Become a Rails Pro", text: "Do or do not. There is no try!", file_upload: true, batch: bat2

u1 = User.create email: "student@example.com", password: "password", teacher: false
u2 = User.create email: "teacher@example.com", password: "password", teacher: true
