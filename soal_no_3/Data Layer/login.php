<?php
// File: login.php

// Memasukkan file koneksi.php untuk melakukan koneksi ke database
require_once('koneksi.php');

// Menangani request HTTP POST
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Ambil data yang dikirim melalui request
    $username = $_POST['username'];
    $password = $_POST['password'];

    // Membuat prepared statement untuk menjalankan query login
    $stmt = $conn->prepare("SELECT * FROM user WHERE username = ? AND password = ?");
    $stmt->bind_param("ss", $username, $password);
    $stmt->execute();

    // Mendapatkan hasil query sebagai array asosiatif
    $result = $stmt->get_result()->fetch_assoc();

    if ($result) {
        // Jika login berhasil, kirimkan response dengan kode 200 (OK)
        http_response_code(200);
        echo json_encode(array('message' => 'Login berhasil.'));
    } else {
        // Jika login gagal, kirimkan response dengan kode 401 (Unauthorized)
        http_response_code(401);
        echo json_encode(array('message' => 'Username atau password salah.'));
    }
} else {
    // Jika request HTTP bukan POST, kirimkan response dengan kode 405 (Method Not Allowed)
    http_response_code(405);
    echo json_encode(array('message' => 'Metode request tidak diizinkan.'));
}

// Menutup koneksi ke database
mysqli_close($conn);
?>