-- Proses DDL (Data DEFINITION LANGUAGE) untuk Membuat Tabel Entitas dan Relasi
-------------------------------------------------------------------------------

---------- Tabel Entitas ----------

-- Tabel Acara
CREATE TABLE acara (
    acara_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
    nama_acara VARCHAR(50),
    jenis_acara VARCHAR(50),
    deskripsi VARCHAR(255),
    tanggal_mulai DATE,
    tanggal_selesai DATE,
    kuota_peserta INT,
    status_acara VARCHAR(50),
    biaya_pendaftaran INT
);

-- Tabel Jadwal
CREATE TABLE jadwal (
    jadwal_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    acara_id INT,
    tanggal_acara DATE,
    jam_mulai TIMESTAMP,
    jam_selesai TIMESTAMP,
    tipe_kegiatan VARCHAR(50),
    penanggung_jawab VARCHAR(50),
    deskripsi VARCHAR(255),
    catatan VARCHAR(255),
    FOREIGN KEY (acara_id) REFERENCES Acara(acara_id)
);

-- Tabel Lokasi
CREATE TABLE lokasi (
    lokasi_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nama_tempat VARCHAR(50),
    alamat VARCHAR(100),
    kota VARCHAR(50),
    provinsi VARCHAR(50),
    kapasitas INT,
    fasilitas VARCHAR(255),
    tipe_lokasi VARCHAR(50),
    no_telepon VARCHAR(15),
    email VARCHAR(50)
);

-- Tabel Panitia
CREATE TABLE panitia (
    panitia_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nama_panitia VARCHAR(50),
    no_telepon VARCHAR(15),
    email VARCHAR(50),
    status_panitia VARCHAR(50),
    jenis_kelamin CHAR(2),
    alamat VARCHAR(100)
);

-- Tabel Peserta
CREATE TABLE peserta (
    peserta_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nama_peserta VARCHAR(50),
    email VARCHAR(50),
    no_telepon VARCHAR(15),
    jenis_kelamin CHAR(2),
    alamat VARCHAR(100),
    institusi VARCHAR(50),
    tanggal_lahir DATE
);

-- Tabel Sponsor
CREATE TABLE sponsor (
    sponsor_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nama_sponsor VARCHAR(50),
    jenis_sponsor VARCHAR(50),
    no_telepon VARCHAR(15),
    email VARCHAR(50),
    alamat VARCHAR(100),
    status_kerjasama VARCHAR(50)
);

-- Tabel Pembayaran
CREATE TABLE pembayaran (
    pembayaran_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    metode_pembayaran VARCHAR(50),
    status_pembayaran VARCHAR(50),
    jumlah_pembayaran INT,
    tanggal_pembayaran DATE,
    bukti_transfer VARCHAR(50),
    bank VARCHAR(50),
    waktu_konfirmasi TIMESTAMP,
    diskon DOUBLE
);

---------- Tabel Relasi ----------

-- Relasi: Pendaftaran (Peserta ⇄ Acara)
CREATE TABLE pendaftaran (
    pendaftaran_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    peserta_id INT,
    acara_id INT,
    status_kehadiran VARCHAR(50),
    tanggal_daftar DATE,
    kode_tiket VARCHAR(20) UNIQUE,
    FOREIGN KEY (peserta_id) REFERENCES peserta(peserta_id),
    FOREIGN KEY (acara_id) REFERENCES acara(acara_id)
);

-- Relasi: Penempatan Lokasi (Acara ⇄ Lokasi)
CREATE TABLE penempatan_lokasi (
    penempatan_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    acara_id INT,
    lokasi_id INT,
    tanggal_pakai DATE,
    jam_mulai TIME,
    jam_selesai TIME,
    FOREIGN KEY (acara_id) REFERENCES acara(acara_id),
    FOREIGN KEY (lokasi_id) REFERENCES lokasi(lokasi_id)
);

-- Relasi: Pembayaran Peserta (Peserta ⇄ Pembayaran)
CREATE TABLE transaksi_pembayaran (
    transaksi_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    peserta_id INT,
    pembayaran_id INT,
    acara_id INT,
    kode_invoice VARCHAR(20) UNIQUE,
    FOREIGN KEY (peserta_id) REFERENCES peserta(peserta_id),
    FOREIGN KEY (pembayaran_id) REFERENCES pembayaran(pembayaran_id),
    FOREIGN KEY (acara_id) REFERENCES acara(acara_id)
);

-- Relasi: Sponsor Acara (Sponsor ⇄ Acara)
CREATE TABLE kontribusi_sponsor (
    kontribusi_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    sponsor_id INT,
    acara_id INT,
    nominal_dana INT,
    jenis_kontribusi VARCHAR(50),
    status_konfirmasi VARCHAR(50),
    FOREIGN KEY (sponsor_id) REFERENCES sponsor(sponsor_id),
    FOREIGN KEY (acara_id) REFERENCES acara(acara_id)
);

-- Relasi: TugasPanitia (Panitia ⇄ Acara)
CREATE TABLE tugas_panitia (
    tugas_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    panitia_id INT,
    acara_id INT,
    divisi VARCHAR(50),
    jabatan VARCHAR(50),
    waktu_masuk TIMESTAMP,
    FOREIGN KEY (panitia_id) REFERENCES panitia(panitia_id),
    FOREIGN KEY (acara_id) REFERENCES acara(acara_id)
);


-- Proses DML (Data MANIPULATION LANGUAGE) untuk Melakukan Manipulasi Data pada Tabel seperti INSERT, UPDATE, DELETE
--------------------------------------------------------------------------------------------------------------------

---------- INSERT Data (Minimal 5 Data untuk setiap tabel) ----------

-- INSERT Data Acara
INSERT INTO acara (nama_acara, jenis_acara, deskripsi, tanggal_mulai, tanggal_selesai, kuota_peserta, status_acara, biaya_pendaftaran)
VALUES 
('Seminar Teknologi AI', 'Seminar', 'Seminar mengenai perkembangan teknologi AI terkini', '2025-06-15', '2025-06-15', 150, 'Aktif', 75000),
('Workshop Data Science', 'Workshop', 'Workshop pengenalan Data science untuk pemula', '2025-07-10', '2025-07-12', 50, 'Aktif', 200000),
('Konser Amal Peduli Bencana', 'Konser', 'Konser amal untuk korban bencana alam', '2025-08-20', '2025-08-20', 500, 'Persiapan', 150000),
('Kompetisi Programming', 'Kompetisi', 'Lomba programming untuk mahasiswa se-Indonesia', '2025-09-05', '2025-09-07', 100, 'Aktif', 50000),
('Pameran Teknologi', 'Pameran', 'Pameran teknologi terbaru dari berbagai vendor', '2025-10-01', '2025-10-05', 1000, 'Persiapan', 25000);

-- INSERT Data Lokasi
INSERT INTO lokasi (nama_tempat, alamat, kota, provinsi, kapasitas, fasilitas, tipe_lokasi, no_telepon, email)
VALUES 
('Gedung Serbaguna Utama', 'Jl. Jendral Sudirman No. 123', 'Jakarta', 'DKI Jakarta', 500, 'AC, Sound System, Proyektor', 'Indoor', '021-5551234', 'gedung@example.com'),
('Aula Universitas Maju', 'Jl. Pendidikan No. 45', 'Bandung', 'Jawa Barat', 300, 'AC, Sound System, WiFi', 'Indoor', '022-6667788', 'univ@example.com'),
('Taman Kota Indah', 'Jl. Taman Bunga No. 10', 'Surabaya', 'Jawa Timur', 1000, 'Panggung Outdoor, Toilet Umum', 'Outdoor', '031-7778899', 'taman@example.com'),
('Hotel Megah', 'Jl. Protokol No. 55', 'Yogyakarta', 'DIY', 200, 'AC, Katering, WiFi, Proyektor', 'Indoor', '0274-112233', 'hotel@example.com'),
('Stadion Olahraga', 'Jl. Atletik No. 100', 'Semarang', 'Jawa Tengah', 5000, 'Panggung, Sound System, Area Parkir Luas', 'Outdoor', '024-9990000', 'stadion@example.com');

-- INSERT Data Jadwal
INSERT INTO jadwal (acara_id, tanggal_acara, jam_mulai, jam_selesai, tipe_kegiatan, penanggung_jawab, deskripsi, catatan)
VALUES 
(1, '2025-06-15', '2025-06-15 09:00:00', '2025-06-15 12:00:00', 'Sesi Presentasi', 'Dr. Budi', 'Pembukaan dan Keynote Speech', 'Persiapan 1 jam sebelumnya'),
(1, '2025-06-15', '2025-06-15 13:00:00', '2025-06-15 16:00:00', 'Panel Diskusi', 'Prof. Ani', 'Diskusi dengan Praktisi AI', 'Konfirmasi pembicara H-7'),
(2, '2025-07-10', '2025-07-10 10:00:00', '2025-07-10 17:00:00', 'Pelatihan', 'Joko S.Kom', 'Dasar-dasar Data Science', 'Peserta membawa laptop'),
(3, '2025-08-20', '2025-08-20 19:00:00', '2025-08-20 22:00:00', 'Pertunjukan', 'Dian', 'Konser Utama', 'Cek sound H-1'),
(4, '2025-09-05', '2025-09-05 08:00:00', '2025-09-05 18:00:00', 'Kompetisi', 'Rudi, M.Cs', 'Hari pertama kompetisi', 'Pastikan internet stabil');

-- INSERT Data Panitia
INSERT INTO panitia (nama_panitia, no_telepon, email, status_panitia, jenis_kelamin, alamat)
VALUES 
('Ahmad Rizky', '081234567890', 'ahmad@example.com', 'Aktif', 'L', 'Jl. Melati No. 10, Jakarta'),
('Siti Nurhaliza', '085678901234', 'siti@example.com', 'Aktif', 'P', 'Jl. Anggrek No. 5, Bandung'),
('Budi Santoso', '087812345678', 'budi@example.com', 'Aktif', 'L', 'Jl. Cendana No. 18, Surabaya'),
('Dian Permata', '081987654321', 'dian@example.com', 'Aktif', 'P', 'Jl. Kenanga No. 7, Yogyakarta'),
('Eko Prasetyo', '089876543210', 'eko@example.com', 'Aktif', 'L', 'Jl. Dahlia No. 22, Semarang');

-- INSERT Data Peserta
INSERT INTO peserta (nama_peserta, email, no_telepon, jenis_kelamin, alamat, institusi, tanggal_lahir)
VALUES 
('Arif Rahman', 'arif@gmail.com', '081122334455', 'L', 'Jl. Merdeka No. 15, Jakarta', 'PT Global Tech', '1990-05-15'),
('Nina Sari', 'nina@gmail.com', '082233445566', 'P', 'Jl. Veteran No. 8, Bandung', 'Universitas Negeri Bandung', '1995-08-22'),
('Rudi Hermawan', 'rudi@gmail.com', '083344556677', 'L', 'Jl. Pahlawan No. 3, Surabaya', 'PT Data Solusi', '1988-11-10'),
('Laila Fitri', 'laila@gmail.com', '084455667788', 'P', 'Jl. Pemuda No. 9, Yogyakarta', 'Universitas Teknologi', '1992-02-28'),
('Joko Widodo', 'joko@gmail.com', '085566778899', 'L', 'Jl. Sudirman No. 45, Semarang', 'CV Digital Kreatif', '1985-07-17');

-- INSERT Data Sponsor
INSERT INTO sponsor (nama_sponsor, jenis_sponsor, no_telepon, email, alamat, status_kerjasama)
VALUES 
('PT Teknologi Maju', 'Platinum', '021-9876543', 'tech@example.com', 'Jl. Sudirman No. 88, Jakarta', 'Aktif'),
('Bank Negara', 'Gold', '021-8765432', 'bank@example.com', 'Jl. Thamrin No. 10, Jakarta', 'Aktif'),
('Digital Solution', 'Silver', '022-7654321', 'digital@example.com', 'Jl. Gatot Subroto No. 15, Bandung', 'Aktif'),
('PT Mitra Sejahtera', 'Bronze', '031-6543210', 'mitra@example.com', 'Jl. HR. Muhammad No. 55, Surabaya', 'Pending'),
('Global Network', 'Gold', '0274-5432109', 'global@example.com', 'Jl. Malioboro No. 70, Yogyakarta', 'Aktif');

-- INSERT Data Pembayaran
INSERT INTO pembayaran (metode_pembayaran, status_pembayaran, jumlah_pembayaran, tanggal_pembayaran, bukti_transfer, bank, waktu_konfirmasi, diskon)
VALUES 
('Transfer Bank', 'Lunas', 75000, '2025-06-01', 'bukti_tf_1.jpg', 'BCA', '2025-06-01 14:30:00', 0),
('QRIS', 'Lunas', 200000, '2025-06-25', 'bukti_qris_1.jpg', NULL, '2025-06-25 10:15:00', 0),
('Transfer Bank', 'Lunas', 150000, '2025-07-15', 'bukti_tf_2.jpg', 'Mandiri', '2025-07-15 16:45:00', 0),
('Kartu Kredit', 'Lunas', 50000, '2025-08-02', NULL, 'BNI', '2025-08-02 09:20:00', 0),
('Transfer Bank', 'Pending', 25000, '2025-08-20', 'bukti_tf_3.jpg', 'BRI', NULL, 0);

-- INSERT Data Relasi Pendaftaran
INSERT INTO pendaftaran (peserta_id, acara_id, status_kehadiran, tanggal_daftar, kode_tiket)
VALUES 
(1, 1, 'Belum Hadir', '2025-05-20', 'TECH-001'),
(2, 2, 'Belum Hadir', '2025-06-15', 'WS-001'),
(3, 3, 'Belum Hadir', '2025-07-10', 'KONSER-001'),
(4, 4, 'Belum Hadir', '2025-08-01', 'COMP-001'),
(5, 5, 'Belum Hadir', '2025-08-25', 'EXPO-001');

-- INSERT Data Relasi Penempatan Lokasi
INSERT INTO penempatan_lokasi (acara_id, lokasi_id, tanggal_pakai, jam_mulai, jam_selesai)
VALUES 
(1, 1, '2025-06-15', '08:00:00', '17:00:00'),
(2, 2, '2025-07-10', '09:00:00', '18:00:00'),
(3, 5, '2025-08-20', '15:00:00', '23:00:00'),
(4, 2, '2025-09-05', '07:00:00', '20:00:00'),
(5, 3, '2025-10-01', '08:00:00', '21:00:00');

-- INSERT Data Relasi Transaksi Pembayaran
INSERT INTO transaksi_pembayaran (peserta_id, pembayaran_id, acara_id, kode_invoice)
VALUES 
(1, 1, 1, 'INV-20250601-001'),
(2, 2, 2, 'INV-20250625-001'),
(3, 3, 3, 'INV-20250715-001'),
(4, 4, 4, 'INV-20250802-001'),
(5, 5, 5, 'INV-20250820-001');

-- INSERT Data Relasi Kontribusi Sponsor
INSERT INTO kontribusi_sponsor (sponsor_id, acara_id, nominal_dana, jenis_kontribusi, status_konfirmasi)
VALUES 
(1, 1, 25000000, 'Dana', 'Terkonfirmasi'),
(2, 1, 15000000, 'Dana', 'Terkonfirmasi'),
(1, 2, 20000000, 'Dana', 'Terkonfirmasi'),
(3, 3, 10000000, 'Dana', 'Terkonfirmasi'),
(4, 4, 5000000, 'Barang', 'Pending');

-- INSERT Data Relasi Tugas Panitia
INSERT INTO tugas_panitia (panitia_id, acara_id, divisi, jabatan, waktu_masuk)
VALUES 
(1, 1, 'Acara', 'Ketua', '2025-06-15 07:00:00'),
(2, 1, 'Registrasi', 'Staff', '2025-06-15 07:30:00'),
(3, 2, 'Acara', 'Ketua', '2025-07-10 08:00:00'),
(4, 3, 'Publikasi', 'Koordinator', '2025-08-20 14:00:00'),
(5, 4, 'Teknis', 'Staff', '2025-09-05 06:30:00');


---------- UPDATE Data ----------

-- Update status acara
UPDATE acara 
SET status_acara = 'Dibatalkan', 
    deskripsi = 'Dibatalkan karena jumlah pendaftar kurang' 
WHERE acara_id = 3;

-- Update informasi lokasi
UPDATE lokasi 
SET kapasitas = 600, 
    fasilitas = 'AC, Sound System, Proyektor, WiFi Kecepatan Tinggi' 
WHERE lokasi_id = 1;

-- Update status pembayaran
UPDATE pembayaran 
SET status_pembayaran = 'Lunas', 
    waktu_konfirmasi = '2025-08-21 10:30:00' 
WHERE pembayaran_id = 5;

---------- DELETE Data ----------

-- Hapus peserta yang membatalkan pendaftaran
DELETE FROM Pendaftaran WHERE pendaftaran_id = 3;

-- Hapus jadwal yang tidak diperlukan
DELETE FROM Jadwal WHERE jadwal_id = 4;


---------- SELECT dengan JOIN ----------

-- 1. Menampilkan detail acara beserta lokasinya
SELECT 
    a.acara_id AS 'Kode Acara',
    a.nama_acara AS 'Nama Acara',
    a.jenis_acara AS 'Jenis Acara',
    a.tanggal_mulai AS 'Tanggal Mulai',
    a.tanggal_selesai AS 'Tanggal Selesai',
    a.status_acara AS 'Status Acara',
    l.nama_tempat AS 'Nama Tempat',
    l.alamat AS 'Alamat Tempat',
    l.kota AS 'Kota',
    l.kapasitas AS 'Kapasitas Tempat' 
FROM 
    acara a
JOIN 
    penempatan_lokasi pl ON a.acara_id = pl.acara_id
JOIN 
    Lokasi l ON pl.lokasi_id = l.lokasi_id;

-- 2. Menampilkan daftar peserta beserta acara yang diikuti
SELECT 
    p.peserta_id AS 'Kode Peserta',
    p.nama_peserta AS 'Nama Peserta',
    p.email AS 'Email Peserta',
    p.institusi AS 'Institusi Asal',
    a.nama_acara AS 'Nama Acara',
    a.tanggal_mulai AS 'Tanggal Mulai',
    d.status_kehadiran AS 'Status Kehadiran',
    d.kode_tiket AS 'Kode Tiket'
FROM 
    peserta p
JOIN 
    pendaftaran d ON p.peserta_id = d.peserta_id
JOIN 
    acara a ON d.acara_id = a.acara_id;

-- 3. Menampilkan struktur panitia untuk setiap acara
SELECT 
    a.nama_acara AS 'Nama Acara',
    p.nama_panitia AS 'Nama Panitia',
    tp.divisi AS 'Divisi',
    tp.jabatan AS 'Jabatan',
    p.no_telepon AS 'No Telepon Panitia',
    p.email AS 'Email Panitia'
FROM 
    tugas_panitia tp
JOIN 
    panitia p ON tp.panitia_id = p.panitia_id
JOIN 
    acara a ON tp.acara_id = a.acara_id
ORDER BY 
    a.nama_acara, tp.divisi, tp.jabatan;

-- 4. Menampilkan jumlah peserta untuk setiap acara
SELECT 
    a.nama_acara AS 'Nama Acara',
    a.jenis_acara AS 'Jenis Acara',
    COUNT(d.peserta_id) AS 'Jumlah Peserta',
    a.kuota_peserta AS 'Kouta Peserta',
    (a.kuota_peserta - COUNT(d.peserta_id)) AS 'Sisa Kuota Peserta'
FROM 
    acara a
LEFT JOIN 
    pendaftaran d ON a.acara_id = d.acara_id
GROUP BY 
    a.acara_id, a.nama_acara, a.jenis_acara, a.kuota_peserta;

-- 5. Menampilkan acara dengan sponsor terbanyak
SELECT 
    a.nama_acara AS 'Nama Acara',
    COUNT(ks.sponsor_id) AS jumlah_sponsor,
    SUM(ks.nominal_dana) AS total_dana_sponsor
FROM 
    acara a
LEFT JOIN 
    kontribusi_sponsor ks ON a.acara_id = ks.acara_id
WHERE 
    ks.status_konfirmasi = 'Terkonfirmasi'
GROUP BY 
    a.acara_id, a.nama_acara
ORDER BY 
    jumlah_sponsor DESC, total_dana_sponsor DESC;