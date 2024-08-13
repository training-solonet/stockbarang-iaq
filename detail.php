<?php 
require 'function.php';
require 'cek.php';

$idbarang = $_GET['id'];

$get = mysqli_query($conn, "SELECT * FROM stock WHERE idbarang='$idbarang'");
$fetch = mysqli_fetch_array($get);

$nama = $fetch['namabarang'];
$deskripsi = $fetch['deskripsi'];
$stock = $fetch['stock'];
$image = $fetch['image'];

?>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Detail Barang</title>
        <link href="css/styles.css" rel="stylesheet" />
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script>
        <style>
            body {
                background-color: #f4f4f4;
            }
            .zoomable {
                width: 250px;
                transition: transform 0.3s ease-in-out;
            }
            .zoomable:hover {
                transform: scale(1.2);
            }
            .card {
                box-shadow: 0 4px 8px rgba(0,0,0,0.1);
                border-radius: 10px;
            }
            .table th, .table td {
                vertical-align: middle;
            }
            .table-responsive {
                border-radius: 10px;
                overflow: hidden;
            }   
            .thead-secondary {
                background-color: #f4f4f4; 
                color: black; 
            }
        </style>
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <a class="navbar-brand" href="index.php">StockPedia.</a>
            <button class="btn btn-link btn-sm order-1 order-lg-0" id="sidebarToggle" href="#"><i class="fas fa-bars"></i></button>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Fitur</div>
                            <a class="nav-link" href="index.php">
                                <div class="sb-nav-link-icon"><i class="fas fa-table mr-1"></i></div>
                                Stock Barang
                            </a>
                            <a class="nav-link" href="masuk.php">
                                <div class="sb-nav-link-icon"><i class="fas fa-arrow-right mr-1"></i></div>
                                Barang Masuk
                            </a>
                            <a class="nav-link" href="keluar.php">
                                <div class="sb-nav-link-icon"><i class="fas fa-arrow-left mr-1"></i></div>
                                Barang Keluar
                            </a>
                            <a class="nav-link" href="peminjaman.php">       
                                <div class="sb-nav-link-icon"><i class="fas fa-handshake mr-1"></i></div>
                                Peminjaman Barang
                            </a>
                            <a class="nav-link" href="admin.php">
                                <div class="sb-nav-link-icon"><i class="fas fa-user mr-1"></i></div>
                                Kelola Admin
                            </a>
                            <br><br>
                            <a class="nav-link" href="logout.php">
                                Logout
                            </a>
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as</div>
                        Ifkar AQ
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid">
                    <h1 class="mt-4">
                    <h1 class="mt-4">
                        <a href="index.php" class="btn btn-dark mb-2"><i class="fas fa-arrow-left"></i></a>
                        <span class="ml-2">Detail Barang</span>
                    </h1><br>
                        <div class="card mb-4">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col"><h2><?=$nama?></h2></div>
                                </div>
                                <br><br>
                                <div class="row">
                                    <div class="col text-center">
                                        <?php
                                        if ($image == null) {
                                            echo 'No Photo';
                                        } else {
                                            echo '<img src="images/'.$image.'" class="zoomable img-fluid">';
                                        }
                                        ?>
                                    </div>
                                </div>
                                <br><br>                             
                                <div class="row">
                                <div class="col-md-6">
                                    <div class="card">
                                        <div class="card-body">
                                            <h5 class="card-title">Deskripsi</h5>
                                            <p class="card-text"><?=$deskripsi?></p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="card">
                                        <div class="card-body">
                                            <h5 class="card-title">Stock</h5>
                                            <p class="card-text"><?=$stock?></p>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        <br>
                        <h2>Barang Masuk</h2>
                        <br>
                        <div class="card mb-4">
                            <div class="card-header bg-success text-white">
                                <i class="fas fa-arrow-right mr-1"></i>
                                Data Tabel Barang Masuk
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead class="thead-secondary">
                                            <tr>
                                                <th>No</th>
                                                <th>Tanggal</th>
                                                <th>Penerima</th>
                                                <th>Quantity</th>  
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php
                                            $ambildatamasuk = mysqli_query($conn, "SELECT m.tanggal, m.penerima, m.qty FROM masuk m WHERE m.idbarang='$idbarang'");
                                            $i = 1;
                                            while ($fetch = mysqli_fetch_array($ambildatamasuk)) {
                                                $tanggal = $fetch['tanggal'];
                                                $penerima = $fetch['penerima'];
                                                $quantity = $fetch['qty'];
                                            ?>
                                            <tr>
                                                <td><?=$i++;?></td>
                                                <td><?=$tanggal;?></td>
                                                <td><?=$penerima;?></td>
                                                <td><?=$quantity;?></td>
                                            </tr>
                                            <?php
                                            }
                                            ?>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        
                        <br>
                        <h2>Barang Keluar</h2>
                        <br>
                        <div class="card mb-4">
                            <div class="card-header bg-danger text-white">
                                <i class="fas fa-arrow-left mr-1"></i>
                                Data Tabel Barang Keluar
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead class="thead-secondary">
                                            <tr>
                                                <th>No</th>
                                                <th>Tanggal</th>
                                                <th>Pengirim</th>
                                                <th>Quantity</th>  
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php
                                            $ambildatamasuk = mysqli_query($conn, "SELECT m.tanggal, m.pengirim, m.qty FROM keluar m WHERE m.idbarang='$idbarang'");
                                            $i = 1;
                                            while ($fetch = mysqli_fetch_array($ambildatamasuk)) {
                                                $tanggal = $fetch['tanggal'];
                                                $pengirim = $fetch['pengirim'];
                                                $quantity = $fetch['qty'];
                                            ?>
                                            <tr>
                                                <td><?=$i++;?></td>
                                                <td><?=$tanggal;?></td>
                                                <td><?=$pengirim;?></td>
                                                <td><?=$quantity;?></td>
                                            </tr>
                                            <?php
                                            }
                                            ?>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/datatables-demo.js"></script>
    </body>
</html>
