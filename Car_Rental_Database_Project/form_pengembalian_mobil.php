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
<div style="text-align:center">
  <h3>Input Data Pengembalian Mobil</h3>
</div>

    <?php
    include 'config.php';
    if(isset($_POST['submitted'])){
        $kode_sewa=$_POST['kode_sewa'];
        $tgl_kembali=$_POST['tanggal_kembali'];
        $denda=$_POST['denda'];
        $nilaisewa=getnilaisewa($con,$kode_sewa);
        $nilaidenda=$nilaisewa * $denda/100;
        $sql="update sewa set denda='$nilaidenda',tgl_kembali='$tgl_kembali' where kode_sewa='$kode_sewa'";
        $hasil=mysqli_query($con,$sql);
        if (!$hasil) {
            pesan_gagal('Maaf, data gagal disimpan.');
        } else {
            pesan_sukses('Data berhasil disimpan.');
            $denda=$denda.'%';
        }
    }
     ?>
    <div class="row" style="margin-top:50px">
      <div class="col">

      </div>
      <div class="col">

        <form name="form1" method="POST" action="">

              <div class="form-group">
               <label class="control-label col-sm-10" for="pwd">Kode Sewa:</label>
               <div class="col-sm-10">
                 <input name="kode_sewa" id="kode_sewa" type="text" class="form-control" placeholder="Enter Rent Code" value="<?php echo $kode_sewa; ?>">
               </div>
              </div>
              <div class="form-group">
               <label class="control-label col-sm-10" for="pwd">Tanggal Kembali:</label>
               <div class="col-sm-10">
                 <input type="date" name="tanggal_kembali" id="tanggal_kembali" class="form-control" id="datepicker" placeholder="Enter Rent Date" value="<?php echo $tanggal; ?>">
               </div>
              </div>
              <div class="form-group">
               <label class="control-label col-sm-10" for="pwd">Denda:</label>
               <div class="col-sm-10">
                  <input name="denda" id="denda" type="text" class="form-control" value="<?php echo $denda; ?>">
               </div>
              </div>


               <?php if($nilaidenda>0){
                   echo '<label class="control-label col-sm-10" for="pwd">Total Denda:</label>
                   <div class="col-sm-10">
                     <input name="total_denda" type="text" class="form-control" value="'.$nilaidenda.'">
                   </div>
                  ';
                } ?>

                
              <div class="form-group">
               <div class="col-sm-offset-2 col-sm-10">
                 <input type="hidden" name="submitted" value="1"/>
                 <button type="submit" class="btn btn-success">Entri</button>

               </div>
              </div>
        </form>
        <div style="margin-top:50px">
            <a href="daftar_isi.php"><< Kembali ke menu utama</a>
        </div>
      </div>
      <div class="col">

      </div>
    </div>
  </div>

  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://getbootstrap.com/docs/4.0/dist/js/bootstrap.min.js"></script>

</body>
</html>
