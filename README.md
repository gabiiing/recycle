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

## 🚀

## 📲 Deskripsi Aplikasi 📲
◽ **Nama aplikasi :** re.cycle

◽ **Fungsi aplikasi :**

Platform (Website dan Mobile App) re.cycle diharapkan dapat membantu banyak pihak dalam memberikan informasi terkait daur ulang sampah dan mengajak masyarakat untuk mengurangi jumlah pencemaran dengan cara melakukan daur ulang sampah. Melalui aplikasi yang dibuat ini, masyarakat Indonesia diharapkan dapat mengakses website re.cycle secara mobile melalui *smartphone*. Selain itu, platform kami juga menyediakan forum bagi pengguna yang memiliki pertanyaan seputar kegiatan penghijauan dimana pertanyaan tersebut bisa dijawab oleh pengguna lain yang sekiranya tahu atau pernah mengalami apa yang ditanyakan tersebut. Dengan demikian, keterlibatan masyarakat Indonesia lebih meningkat dalam mengikuti *event* daur ulang demi keberlanjutan lingkungan Indonesia.

◽ **Peran atau aktor pengguna aplikasi  :**

1. User : 
2. Admin 

## 🗃️ Daftar Modul yang akan Diimplementasikan 🗃️
1. Landing Page 
2. Register dan Login page
3. Profile Page
4. About Us Page
5. Event Page - Menambahkan event
6. Event Page - Detail & Forum Event

## 💱 Alur pengintegrasian dengan web service 💱
◽ Mendefinisikan model class sesuai dengan response data yang akan diambil ketika melakukan pemanggilan *web service*. Dalam hal ini, pendefinisian model akan disesuaikan dengan modul yang diimplementasikan per anggota kelompok.

◽ Menambahkan *keyword* `required` pada setiap parameter class pada bagian constructor sehingga terbentuk sebuah model yang merupakan suatu model yang merepresentasikan response dari pemanggilan *web service*.

◽ Membuat fungsi untuk melakukan fetching data dari web service kemudian mengiterasi serta menampilkan setiap data ke aplikasi dengan memanfaatkan FutureBuilder.

◽ Setiap data di-fetch melalui HTTP GET request yang melakukan pengambilan data dari URL yang diinginkan dan mengembalikan sebuah response dengan menggunakan metode http.get.

◽ Response tersebut akan dikonversi menjadi Dart object. Untuk setiap object tersebut akan dilakukan looping dan disimpan pada sebuah list. Selain itu, iterasi dari list tersebut digunakan untuk menampilkan data pada flutter.


## 🔰Tools🔰
![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
