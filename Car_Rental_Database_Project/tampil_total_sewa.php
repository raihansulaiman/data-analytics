<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>
    Daftar Menu
</title>
<link href="https://getbootstrap.com/docs/4.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://getbootstrap.com/docs/4.0/assets/css/docs.min.css" rel="stylesheet">

</head>
<body>
  <div class="container">
    <?php
    include 'config.php';
    if(isset($_POST['submitted'])){
      $nama=$_POST['nama'];
      $val=$nama;
      $sql="select sum(tot_harga) as total from sewa where no_pel='$nama'";
      $hasil=mysqli_query($con,$sql);
      if (!$hasil) {
          echo "SQLSTATE error: " . mysqli_sqlstate($con);
          echo "<br>";
          echo "SQLSTATE error: " . mysqli_error($con);
          exit;
      }
      $data=mysqli_fetch_array($hasil);
      $jumlah=$data['total'];
      $q="select * from pelanggan where no_pel='$nama'";
      $h=mysqli_query($con,$q);
      $d=mysqli_fetch_array($h);
      $nama=$d['nama_pel'];
    }
     ?>
    <div class="row" style="margin-top:50px">
      <div class="col">

      </div>
      <div class="col">

          <div class="form-group">
            <form method="post" action="">
              <div class="form-group">
                Pilih nama pelanggan :
                <select name="nama">
                  <option value="<?php echo $val; ?>" selected><?php echo $nama; ?></option>
                  <?php
                      $q="select * from pelanggan";
                      $h=mysqli_query($con,$q);
                      while($row=mysqli_fetch_array($h)){
                          echo '<option value="'. $row['no_pel'].'">'.$row['nama_pel'].'</option>';
                      }
                   ?>

                </select>
              </div>
              Total harga sewa yang pernah dibayarkan oleh <?php echo $nama; ?> adalah
              <?php echo $jumlah; ?>
              <input type="hidden" name="submitted" value="1"/><br/><br/><br/>
              <button type="submit" class="btn btn-primary">Hitung</button>
            </form>
            <div style="margin-top:50px">
                <a href="daftar_isi.php"><< Kembali ke menu utama</a>
            </div>
          </div>
      </div>
      <div class="col">

      </div>
    </div>
  </div>


</body>
</html>
