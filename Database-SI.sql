-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 15 Apr 2023 pada 08.16
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_spk_aslab`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_alternatif`
--

CREATE TABLE `tb_alternatif` (
  `id_alternatif` int(8) NOT NULL,
  `nama_alternatif` varchar(40) NOT NULL,
  `alamat_alternatif` varchar(50) NOT NULL,
  `email` varchar(40) NOT NULL,
  `no_hp` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_hasilnormalisasi`
--

CREATE TABLE `tb_hasilnormalisasi` (
  `id_hasilnormalisasi` int(8) NOT NULL,
  `id_alternatif` int(8) NOT NULL,
  `id_kriteria` int(8) NOT NULL,
  `id_normalisasi` int(8) NOT NULL,
  `nilai_normalisasi` int(2) NOT NULL,
  `total_bobot` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_kriteria`
--

CREATE TABLE `tb_kriteria` (
  `id_kriter` int(8) NOT NULL,
  `nama_kriteria` varchar(30) NOT NULL,
  `keterangan` varchar(50) NOT NULL,
  `bobot` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_normalisasi`
--

CREATE TABLE `tb_normalisasi` (
  `id_normalisasi` int(8) NOT NULL,
  `id_penilaianalternatif` int(8) NOT NULL,
  `jenis_kriteria` varchar(20) NOT NULL,
  `keterangan` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_penilaianalternatif`
--

CREATE TABLE `tb_penilaianalternatif` (
  `id_nilai` int(8) NOT NULL,
  `id_user` int(8) NOT NULL,
  `id_alternatif` int(8) NOT NULL,
  `id_kriteria` int(8) NOT NULL,
  `nilai_kriteria` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_perangkingan`
--

CREATE TABLE `tb_perangkingan` (
  `id_perangkingan` int(8) NOT NULL,
  `id_alternatif` int(8) NOT NULL,
  `id_preferensi` int(8) NOT NULL,
  `rank` int(2) NOT NULL,
  `nilai_total` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_preferensi`
--

CREATE TABLE `tb_preferensi` (
  `id_preferensi` int(8) NOT NULL,
  `id_alternatif` int(8) NOT NULL,
  `id_hasilnormalisasi` int(8) NOT NULL,
  `nilai_preferensi` int(2) NOT NULL,
  `total_nilai` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_user`
--

CREATE TABLE `tb_user` (
  `id_user` int(8) NOT NULL,
  `nama_user` varchar(40) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `no_hp` varchar(20) NOT NULL,
  `role` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_alternatif`
--
ALTER TABLE `tb_alternatif`
  ADD PRIMARY KEY (`id_alternatif`);

--
-- Indeks untuk tabel `tb_hasilnormalisasi`
--
ALTER TABLE `tb_hasilnormalisasi`
  ADD PRIMARY KEY (`id_hasilnormalisasi`),
  ADD KEY `id_alternatif` (`id_alternatif`),
  ADD KEY `id_kriteria` (`id_kriteria`),
  ADD KEY `id_normalisasi` (`id_normalisasi`);

--
-- Indeks untuk tabel `tb_kriteria`
--
ALTER TABLE `tb_kriteria`
  ADD PRIMARY KEY (`id_kriter`);

--
-- Indeks untuk tabel `tb_normalisasi`
--
ALTER TABLE `tb_normalisasi`
  ADD PRIMARY KEY (`id_normalisasi`),
  ADD KEY `id_penilaianalternatif` (`id_penilaianalternatif`);

--
-- Indeks untuk tabel `tb_penilaianalternatif`
--
ALTER TABLE `tb_penilaianalternatif`
  ADD PRIMARY KEY (`id_nilai`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_alternatif` (`id_alternatif`),
  ADD KEY `id_kriteria` (`id_kriteria`);

--
-- Indeks untuk tabel `tb_perangkingan`
--
ALTER TABLE `tb_perangkingan`
  ADD PRIMARY KEY (`id_perangkingan`),
  ADD KEY `id_alternatif` (`id_alternatif`),
  ADD KEY `id_preferensi` (`id_preferensi`);

--
-- Indeks untuk tabel `tb_preferensi`
--
ALTER TABLE `tb_preferensi`
  ADD PRIMARY KEY (`id_preferensi`),
  ADD KEY `id_alternatif` (`id_alternatif`),
  ADD KEY `id_hasilnormalisasi` (`id_hasilnormalisasi`);

--
-- Indeks untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_alternatif`
--
ALTER TABLE `tb_alternatif`
  MODIFY `id_alternatif` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_hasilnormalisasi`
--
ALTER TABLE `tb_hasilnormalisasi`
  MODIFY `id_hasilnormalisasi` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_kriteria`
--
ALTER TABLE `tb_kriteria`
  MODIFY `id_kriter` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_normalisasi`
--
ALTER TABLE `tb_normalisasi`
  MODIFY `id_normalisasi` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_penilaianalternatif`
--
ALTER TABLE `tb_penilaianalternatif`
  MODIFY `id_nilai` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_perangkingan`
--
ALTER TABLE `tb_perangkingan`
  MODIFY `id_perangkingan` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_preferensi`
--
ALTER TABLE `tb_preferensi`
  MODIFY `id_preferensi` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id_user` int(8) NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_hasilnormalisasi`
--
ALTER TABLE `tb_hasilnormalisasi`
  ADD CONSTRAINT `tb_hasilnormalisasi_ibfk_1` FOREIGN KEY (`id_alternatif`) REFERENCES `tb_alternatif` (`id_alternatif`),
  ADD CONSTRAINT `tb_hasilnormalisasi_ibfk_2` FOREIGN KEY (`id_kriteria`) REFERENCES `tb_kriteria` (`id_kriter`),
  ADD CONSTRAINT `tb_hasilnormalisasi_ibfk_3` FOREIGN KEY (`id_normalisasi`) REFERENCES `tb_normalisasi` (`id_normalisasi`);

--
-- Ketidakleluasaan untuk tabel `tb_normalisasi`
--
ALTER TABLE `tb_normalisasi`
  ADD CONSTRAINT `tb_normalisasi_ibfk_1` FOREIGN KEY (`id_penilaianalternatif`) REFERENCES `tb_penilaianalternatif` (`id_nilai`);

--
-- Ketidakleluasaan untuk tabel `tb_penilaianalternatif`
--
ALTER TABLE `tb_penilaianalternatif`
  ADD CONSTRAINT `tb_penilaianalternatif_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `tb_user` (`id_user`),
  ADD CONSTRAINT `tb_penilaianalternatif_ibfk_2` FOREIGN KEY (`id_alternatif`) REFERENCES `tb_alternatif` (`id_alternatif`),
  ADD CONSTRAINT `tb_penilaianalternatif_ibfk_3` FOREIGN KEY (`id_kriteria`) REFERENCES `tb_kriteria` (`id_kriter`);

--
-- Ketidakleluasaan untuk tabel `tb_perangkingan`
--
ALTER TABLE `tb_perangkingan`
  ADD CONSTRAINT `tb_perangkingan_ibfk_1` FOREIGN KEY (`id_alternatif`) REFERENCES `tb_alternatif` (`id_alternatif`),
  ADD CONSTRAINT `tb_perangkingan_ibfk_2` FOREIGN KEY (`id_preferensi`) REFERENCES `tb_preferensi` (`id_preferensi`);

--
-- Ketidakleluasaan untuk tabel `tb_preferensi`
--
ALTER TABLE `tb_preferensi`
  ADD CONSTRAINT `tb_preferensi_ibfk_1` FOREIGN KEY (`id_alternatif`) REFERENCES `tb_alternatif` (`id_alternatif`),
  ADD CONSTRAINT `tb_preferensi_ibfk_2` FOREIGN KEY (`id_hasilnormalisasi`) REFERENCES `tb_hasilnormalisasi` (`id_hasilnormalisasi`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
