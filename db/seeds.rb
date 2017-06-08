
create_user = User.create(first_name: "Arief", last_name: "Rahman", full_name: 'Arief Rahman', email: "arief_coolz@yahoo.com", password: '123123123', password_confirmation: '123123123', email_confirmed: true, birthday: "1995-09-27", gender: 1, city: "Jakarta", phone_number: "0818395967")

create_admin = Admin.create(name: "Administrator", email: "admin@gadup.co.id", password: "gadup123", password_confirmation: "gadup123", super_admin: true)

create_feed = Feed.create(name: "Detik Finance", url: "https://finance.detik.com/", description: "Berita dan Informasi Terbaru Bisnis, Finansial, Ek...", created_at: "2017-05-24 04:51:23", updated_at: "2017-05-24 04:51:23", admin_id: 1)

create_entry = Entry.create(feed_id: 1, entries_url: "https://finance.detik.com/berita-ekonomi-bisnis/d-3510910/langkah-jokowi-untuk-ratakan-ekonomi-ri-dinilai-sudah-tepat", image_url: "https://akcdn.detik.net.id/community/media/visual/2014/11/20/7c8cacfb-8641-4c05-9adb-b2aeed91ab9c_169.jpg?w=780&q=90", title: "Langkah Jokowi untuk Ratakan Ekonomi RI Dinilai Sudah Tepat", content: "Jakarta - Ekonomi Indonesia boleh saja tumbuh tinggi, namun tidak merata sampai ke seluruh pelosok negeri. Catat saja, ekonomi tumbuh di atas 5% dalam beberapa tahun terakhir, akan tetapi rasio gini justru makin meningkat sampai ke level 0,41.", author: "Citra Fitri Mardiana", published: "2017-05-24 13:20:00", created_at: "2017-05-24 18:19:10", updated_at: "2017-05-24 18:19:10", admin_id: 1)
