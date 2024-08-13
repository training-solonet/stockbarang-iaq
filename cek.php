<?php 
// jika belum login akan diarahkan ke login.php
if(isset($_SESSION['log'])){

} else {
    header('location: login.php');
}
?>