
-- Tabel Pelanggan
CREATE TABLE pelanggan (
    id_pelanggan VARCHAR(10) PRIMARY KEY,
    nama VARCHAR(50),
    alamat TEXT,
    no_hp VARCHAR(15),
    email VARCHAR(50),
    jenis_kelamin CHAR(1),
    tanggal_daftar DATE,
    total_transaksi INT,
    status VARCHAR(10)
);

-- Tabel Kendaraan
CREATE TABLE kendaraan (
    id_kendaraan VARCHAR(10) PRIMARY KEY,
    id_pelanggan VARCHAR(10),
    jenis_kendaraan VARCHAR(20),
    merk VARCHAR(30),
    warna VARCHAR(20),
    nomor_polisi VARCHAR(15),
    tahun INT,
    status VARCHAR(10),
    foto VARCHAR(100),
    catatan TEXT,
    FOREIGN KEY (id_pelanggan) REFERENCES pelanggan(id_pelanggan)
);

-- Tabel Layanan
CREATE TABLE layanan (
    id_layanan VARCHAR(10) PRIMARY KEY,
    nama_layanan VARCHAR(50),
    deskripsi TEXT,
    harga INT,
    durasi INT,
    jenis_kendaraan VARCHAR(20),
    diskon FLOAT,
    status VARCHAR(10),
    tanggal_mulai DATE,
    tanggal_berakhir DATE
);

-- Tabel Pegawai
CREATE TABLE pegawai (
    id_pegawai VARCHAR(10) PRIMARY KEY,
    nama VARCHAR(50),
    jabatan VARCHAR(30),
    no_hp VARCHAR(15),
    alamat TEXT,
    tanggal_masuk DATE,
    status VARCHAR(10),
    gaji_pokok INT,
    bonus INT,
    shift VARCHAR(20)
);

-- Tabel Jadwal Cuci
CREATE TABLE jadwal_cuci (
    id_jadwal VARCHAR(10) PRIMARY KEY,
    id_kendaraan VARCHAR(10),
    id_layanan VARCHAR(10),
    id_pegawai VARCHAR(10),
    tanggal DATE,
    jam TIME,
    status VARCHAR(15),
    estimasi_selesai TIME,
    catatan TEXT,
    rating INT,
    FOREIGN KEY (id_kendaraan) REFERENCES kendaraan(id_kendaraan),
    FOREIGN KEY (id_layanan) REFERENCES layanan(id_layanan),
    FOREIGN KEY (id_pegawai) REFERENCES pegawai(id_pegawai)
);

-- Tabel Transaksi
CREATE TABLE transaksi (
    id_transaksi VARCHAR(10) PRIMARY KEY,
    id_pelanggan VARCHAR(10),
    id_jadwal VARCHAR(10),
    total_bayar INT,
    metode_pembayaran VARCHAR(20),
    tanggal DATE,
    status VARCHAR(15),
    diskon INT,
    bonus INT,
    kasir VARCHAR(30),
    FOREIGN KEY (id_pelanggan) REFERENCES pelanggan(id_pelanggan),
    FOREIGN KEY (id_jadwal) REFERENCES jadwal_cuci(id_jadwal)
);

-- Tabel Komplain
CREATE TABLE komplain (
    id_komplain VARCHAR(10) PRIMARY KEY,
    id_pelanggan VARCHAR(10),
    id_transaksi VARCHAR(10),
    isi_komplain TEXT,
    tanggal DATE,
    status VARCHAR(15),
    tanggapan TEXT,
    penanganan TEXT,
    id_pegawai VARCHAR(10),
    prioritas VARCHAR(10),
    FOREIGN KEY (id_pelanggan) REFERENCES pelanggan(id_pelanggan),
    FOREIGN KEY (id_transaksi) REFERENCES transaksi(id_transaksi),
    FOREIGN KEY (id_pegawai) REFERENCES pegawai(id_pegawai)
);

-- Tabel Gaji Pegawai
CREATE TABLE gaji_pegawai (
    id_gaji VARCHAR(10) PRIMARY KEY,
    id_pegawai VARCHAR(10),
    bulan INT,
    tahun INT,
    total_gaji INT,
    bonus INT,
    potongan INT,
    tanggal_transfer DATE,
    status VARCHAR(15),
    catatan TEXT,
    FOREIGN KEY (id_pegawai) REFERENCES pegawai(id_pegawai)
);

-- Tabel Paket Layanan
CREATE TABLE paket_layanan (
    id_paket VARCHAR(10) PRIMARY KEY,
    nama_paket VARCHAR(50),
    deskripsi TEXT,
    harga INT,
    jumlah_kunjungan INT,
    bonus TEXT,
    masa_berlaku INT,
    diskon FLOAT,
    status VARCHAR(15),
    tanggal_mulai DATE
);

-- Tabel Penggunaan Paket
CREATE TABLE penggunaan_paket (
    id_penggunaan VARCHAR(10) PRIMARY KEY,
    id_pelanggan VARCHAR(10),
    id_paket VARCHAR(10),
    tanggal_mulai DATE,
    tanggal_berakhir DATE,
    jumlah_penggunaan INT,
    status VARCHAR(15),
    sisa_kunjungan INT,
    total_diskon INT,
    catatan TEXT,
    FOREIGN KEY (id_pelanggan) REFERENCES pelanggan(id_pelanggan),
    FOREIGN KEY (id_paket) REFERENCES paket_layanan(id_paket)
);
