
create_user = User.create(first_name: "Arief", last_name: "Rahman", full_name: 'Arief Rahman', email: "arief_coolz@yahoo.com", password: '123123123', password_confirmation: '123123123', email_confirmed: true, birthday: "1995-09-27", gender: 1, city: "Jakarta", phone_number: "0818395967")

create_admin = Admin.create(name: "Administrator", email: "admin@gadup.co.id", password: "gadup123", password_confirmation: "gadup123", super_admin: true)
