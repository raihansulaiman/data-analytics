<?php
$con=mysqli_connect('localhost','root','','sewamobil');
if (!$con)
  {
  die(mysqli_error($con));
  }

function gethargasewa($con,$kode_mobil){
$sql="select * from armada A,tipemobil T where (A.jenis_mobil=T.jenis_mobil) and A.kode_mobil='$kode_mobil'";
$hasil=mysqli_query($con,$sql);
$data=mysqli_fetch_array($hasil);
$val=$data['harga_sewa'];
return $val;
}

function getnamapelanggan($con,$nopel){
  $sql="select * from pelanggan where no_pel='$nopel'";
  $hasil=mysqli_query($con,$sql);
  $data=mysqli_fetch_array($hasil);
  $val=$data['nama_pel'];
  return $val;
}

function getmerkmobil($con,$kode_mobil){
  $sql="select * from armada where kode_mobil='$kode_mobil'";
  $hasil=mysqli_query($con,$sql);
  $data=mysqli_fetch_array($hasil);
  $val=$data['merk_mobil'];
  return $val;
}

function pesan_sukses($s){
  echo '<div class="alert alert-success alert-dismissible">
  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  <strong>'.$s.'</strong>.
</div>';
}

function pesan_gagal($s){
  echo '<div class="alert alert-danger alert-dismissible">
  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  <strong>'.$s.'</strong>.
</div>';
}

function getnilaisewa($con,$kode_sewa){
  $sql="select * from sewa where kode_sewa='$kode_sewa'";
  $hasil=mysqli_query($con,$sql);
  $data=mysqli_fetch_array($hasil);
  $val=$data['tot_harga'];
  return $val;
}
?>
