# counter_7

## Jawaban dari Pertanyaan Tugas 7
### 1. Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget dan jelaskan perbedaan dari keduanya.
- Stateless widget: Widget yang tidak pernah berubah. Contohnya adalah Icond dan IconButton.
- Stateful widget: Widget yang dapat berubah-ubah (dinamis), bergantung dengan statenya. Contohnya adalah Checkbox, Form, Radio, dan Slider.
- Perbedaan: Stateless widget bersifat statis, immutable, dan tidak memiliki state. Sedangkan stateful widget bersifat dinamis, mutable, dan memiliki state.

### 2. Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
`Text` untuk tempat menaruh text. `Padding` untuk membuat space kosong pada bagian dan ukuran tertentu. `Row` untuk membuat seluruh elemen childnya sejajar. `Visibility` untuk hide and show child. `FloatingActionButton` untuk menampilkan button yang dapat memberikan action tertentu. `Expanded` untuk meng-expand container (dalam kasus ini adalah row terbawah) agar tampilan terlihat full (kiri hingga kanan).

### 3. Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
setState() digunakan sebagai tanda bahwa terdapat internal state yang berubah sehingga mengakibatkan terjadinya re-build widget tree sehingga tampilan pada widget yang statenya berubah akan ikut berubah juga.

### 4. Jelaskan perbedaan antara const dengan final.
- Const: Value sudah harus diketahui ketika compile time
- Final: Value tidak harus diketahui ketika compile time, tetapi sudah harus diketahui saat run time.

### 5. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.
1. Membuat flutter app counter_7 dengan menjalankan perintah `flutter create counter_7`
2. Menambahkan floatting Action Button baru untuk decrement dan menyesuaikan posisinya menggunakan widget pading, row, dan expanded
3. Membuat fungsi decrement untuk mengurangi nilai dan meng-assign fungsinya ke button decrement
4. Mengganti teks beserta warna yang ditampilkan berdasarkan counternya (ganjil atau genap)
5. Memberikan conditional agar button decrement tidak memiliki pengaruh ketika counter == 0
6 (Implement bonus) Memberikan conditional agar button decrement tidak terlihat ketika counter == 0

## Jawaban dari Pertanyaan Tugas 8
### 1. Jelaskan perbedaan Navigator.push dan Navigator.pushReplacement.
`Navigator.push` akan menambahkan atau menumpuk suatu page pada stack (menjadi top of stack dari stack). Sedangkan `Navigator.pushReplacement` akan merubah halaman sekarang dengan halaman baru dengan cara menghapus top of stack saat ini, dan kemudian menambahkan page yang dituju ke top of stack.

### 2. Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
- `Center`: Menempatkan widget children ke tengah halaman
- `Column`: Menampilkan widget secara vertikal
- `Form`: Preparation form (beserta key nya)
- `Container`: Menampung widget children
- `Padding`: Membuat space kosong pada bagian dan ukuran tertentu
- `TextFormField`: Membuat form dengan text field
- `SizedBox`: Membuat fixed size box
- `InputDecoration`: Membuat decoration untuk input form
- `Icon`: Menampilkan icon
- `OutlineInputBorder`: Membuat outline pada border input form
- `DropdownButtonFormField`: Membaut dropdown untuk form
- `Text`: Menampilkan text
- `TextButton`: Menampilkan button dengan text
- `Spacer`: Membuat space pada widget sehingga menjadi fleksibel
- `Align`: Meng-align child widget
- `SingleChildScrollView`: Menampilkan widget children yang dapat di scroll dalam 1 column
- `Row`: Membuat seluruh elemen childnya sejajar
- `Center`: Membuat seluruh elemen childnya ke tengah halaman

### 3. Sebutkan jenis-jenis event yang ada pada Flutter (contoh: onPressed).
- `onChanged`: Event terjadi ketika terdapat perubahan pada input
- `onSaved`: Event terjadi ketika user men-save input
- `onPressed`: Event terjadi ketika user menekan button

### 4. Jelaskan bagaimana cara kerja Navigator dalam "mengganti" halaman dari aplikasi Flutter.
Navigator menggunakan prinsip Stack, yaitu First in last out. Ketika ingin berpindah halaman, page yang sedang dilihat akan di pop pada stack, kemudian halaman yang akan dimuat akan di-push pada top of stack. Halaman yang ditampilkan ke user merupakan halaman yang berada pada top of stack.

### 5. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.
1. Membuat drawer pada semua file yang dibutuhkan
2. Membuat routing pada semua drawer agar dapat mengarah ke halaman yang tepat ketika drawer ditekan
3. Membuat halaman form beserta elemen inputnya (disesuaikan berdasarkan kebutuhan soal)
4. Membuat class Budget dan ListBudget sebagai objek & tempat penyimpanan objek.
5. Menampilkan data yang terdapat pada ListBudget menggunakan bantuan card.
6. Implement bonus
6. (Implement bonus) Memberikan conditional agar button decrement tidak terlihat ketika counter == 0
