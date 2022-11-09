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