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
      $jenis=$_POST['jenis'];
      $sql="select sum(jml_mobil) as total from armada where jenis_mobil='" .$jenis. "' group by jenis_mobil";
      $hasil=mysqli_query($con,$sql);
      if (!$hasil) {
    echo "SQLSTATE error: " . mysqli_sqlstate($con);
    echo "<br>";
    echo "SQLSTATE error: " . mysqli_error($con);
    exit;
}
    $data=mysqli_fetch_array($hasil);
    $jumlah=$data['total'];



    }
     ?>
    <div class="row" style="margin-top:50px">
      <div class="col">

      </div>
      <div class="col">

          <div class="form-group">
            <form method="post" action="">
              <div class="form-group">
                Pilih jenis mobil :
                <select name="jenis">
                  <option selected><?php echo $jenis; ?></option>
                  <?php
                      $q="select jenis_mobil from tipemobil";
                      $h=mysqli_query($con,$q);
                      while($row=mysqli_fetch_array($h)){
                          echo '<option value="'. $row['jenis_mobil'].'">'.$row['jenis_mobil'].'</option>';
                      }
                   ?>

                </select>
              </div>
              Jumlah mobil dengan jenis <?php echo $jenis; ?> adalah <?php echo $jumlah; ?>
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
