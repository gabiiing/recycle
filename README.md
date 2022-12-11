![Build status](https://build.appcenter.ms/v0.1/apps/3755a6dc-e99d-4b1b-9a00-c9ea2a991c32/branches/main/badge)](https://appcenter.ms)
![Staging](https://github.com/gabiiing/recycle/actions/workflows/staging.yml/badge.svg)
![Pre-release](https://github.com/gabiiing/recycle/actions/workflows/pre-release.yml/badge.svg)
![Release](https://github.com/gabiiing/recycle/actions/workflows/release.yml/badge.svg)

<div align="center" style="padding-bottom: 10px">
<h1>🎐Tugas Kelompok PBP-D UAS Kelompok D01 T.A. 2022/2023🎐</h1>
</div>

## 🐱‍💻 Nama Anggota Kelompok 🐱‍💻
Tugas Kelompok dibuat oleh kelompok DO1 yang beranggotakan sebagai berikut.
- Muflih Naufal Maxi - 2106629963
- Shafanisa Alifia Suparno - 2106634723
- Alfredo Austin - 2106705865
- Febi Claudia Damanik - 2106751884
- Gabriel Zebaoth Krisopras Putra - 2106751480
- Sayyid Hafidzurrahman Atstsaqofi - 2106651925

## :rocket: [Railway Link](https://pbp-d01.up.railway.app/)

## 📲 Deskripsi Aplikasi 📲
◽ **Nama aplikasi :** **re.cycle**

◽ **Fungsi aplikasi :**

Platform (Website dan Mobile App) **re.cycle** diharapkan dapat membantu banyak pihak dalam memberikan informasi terkait daur ulang sampah dan mengajak masyarakat untuk mengurangi jumlah pencemaran dengan cara melakukan daur ulang sampah. Melalui aplikasi yang dibuat ini, masyarakat Indonesia diharapkan dapat mengakses website **re.cycle** secara mobile melalui *smartphone*. Selain itu, platform kami juga menyediakan forum bagi pengguna yang memiliki pertanyaan seputar kegiatan penghijauan atau pelestarian lingkungan dimana pertanyaan tersebut bisa dijawab oleh pengguna lain yang sekiranya tahu atau pernah mengalami apa yang ditanyakan tersebut. Dengan demikian, keterlibatan masyarakat Indonesia dalam mengikuti *event* daur ulang dapat lebih meningkat demi menjaga dan melestarikan lingkungan sekitar.

◽ **Peran atau aktor pengguna aplikasi  :**

1. **User**, pengguna yang mengakses halaman pada aplikasi re.cycle.
2. **Manager** **Event**, pengguna yang menyelenggarakan event.
3. **Admin**, pengguna yang memiliki akses penuh terhadap aplikasi.

## 🗃️ Daftar Modul yang akan Diimplementasikan 🗃️
1. **Landing Page (Alfredo)**: Halaman ini berisi deskripsi atau penjelasan singkat tentang daur ulang, manfaat daur ulang, testimoni, dan drawer menu. Terdapat juga *section* bagi para User untuk bertanya mengenai daur ulang.
    #### Drawer/List Menu pada Flutter
    1. **Register**: mengarah ke page register<br>
    2. **Login**: mengarah ke page login<br>
    3. **Events**: mengarah ke page daftar event<br>
    4. **Admin**: mengarah ke page admin<br>
    5. **About Us**: mengarah ke page about us page<br>
    6. **Profile**: mengarah ke page profile page<br>
2. **About Us page (Sayyid)**: Halaman ini berisi kontributor dan peranannya dalam mengembangkan website. User dapat memberikan kritik/saran kepada para kontributor.
3. **Register dan  Login  Page (Alifia)**: Halaman untuk pendaftaran dan autentikasi user. Logged-in user akan memperoleh pesan "Anda sudah melakukan login" jika membuka page register/login. 
5. **Admin page (Febi)**: Halaman untuk memberikan serta menampilkan *feedback* untuk admin dan/atau para kontributor.
6. **Event Page - Daftar Event (User) dan Create Event (Manager) (Gabriel)**: Halaman ini berisi tampilan daftar event pemanfaatan barang bekas yang sedang berlangsung, akan berlangsung, dan telah berlangsung. Manager event dapat membuat event baru.
7. **Event Page - Detail & Forum Event (Muflih)**: Halaman ini berisi tampilan detail event beserta forum untuk berdiskusi mengenai event tersebut. User dapat me-*reply* comment user lain pada forum tersebut.
8. **Profile Page (Alifia)**: Halaman ini berisi tampilan dari detail user yang sudah melakukan Login pada aplikasi re.cycle.

## 💱 Alur pengintegrasian dengan web service 💱
◽ Mendefinisikan model class sesuai dengan response data yang akan diambil ketika melakukan pemanggilan *web service*. Pendefinisian model akan disesuaikan dengan modul yang diimplementasikan per anggota kelompok.

◽ Menambahkan *keyword* `required` pada setiap parameter class pada bagian constructor sehingga terbentuk sebuah model yang merupakan suatu model yang merepresentasikan response dari pemanggilan *web service*.

◽ Setiap modul akan terintegrasi dengan database django yang berasal dari website Flutter pada Mobile App, kemudian dilanjutkan dengan membuat sebuah API yang dapat mengembalikan response dalam bentuk JSON. Dengan menggunakan method **GET** akan menampilkan data dan mengirim input dengan method **POST** untuk update data baru, serta diintegrasi dengan konsep async HTTP. 

◽ Membuat fungsi untuk melakukan fetching data dari *web service* kemudian mengiterasi serta menampilkan setiap data ke aplikasi dengan memanfaatkan `FutureBuilder`. Setiap data di-fetch melalui HTTP **GET** request yang melakukan pengambilan data dari URL yang diinginkan dan mengembalikan sebuah response dengan menggunakan metode `http.get`.

◽ Response tersebut akan dikonversi menjadi Dart object. Untuk setiap object tersebut akan dilakukan looping dan disimpan pada sebuah list. Selain itu, iterasi dari list tersebut digunakan untuk menampilkan data pada flutter kemudian disimpan ke dalam database.

## 🔰Tools🔰
![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
