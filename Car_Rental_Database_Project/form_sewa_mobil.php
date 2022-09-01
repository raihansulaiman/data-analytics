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
  <h3>Input Data Penyewaan Mobil</h3>
</div>

    <?php
    include 'config.php';
    if(isset($_POST['submitted'])){
      $kode_sewa=$_POST['kode_sewa'];
      $no_pel=$_POST['no_pel'];
      //$dt=explode("/",$_POST['tanggal_sewa']);
      //$tanggal=$dt[2].'-'.$dt[0].'-'.$dt[1];
      $tanggal=$_POST['tanggal_sewa'];
      $mobil[1]=$_POST['mobil1'];
      $hrg_sewa1=gethargasewa($con,$mobil[1]);
      $mobil[2]=$_POST['mobil2'];
      $hrg_sewa2=gethargasewa($con,$mobil[2]);
      $total_harga_sewa=$hrg_sewa1+$hrg_sewa2;
      if(isset($mobil[1]) and isset($mobil[2])){
          $totmobil=2;
      } else {
          if($mobil[1]=="" && $mobil[2]==""){
              $totmobil=0;
          } else {
              $totmobil=1;
          }
      }

      if($mobil[1]<>"" or $mobil[2]<>""){
          $sql="insert into sewa(kode_sewa,no_pel,tgl_sewa,tot_mobil,tot_harga)values('$kode_sewa','$no_pel','$tanggal','$totmobil','$total_harga_sewa')";
          $hasil=mysqli_query($con,$sql);
          if (!$hasil) {
              //echo "SQLSTATE error: " . mysqli_sqlstate($con);
              //echo "<br>";
              //echo "SQLSTATE error: " . mysqli_error($con);
              //exit;
              pesan_gagal('Maaf, data gagal disimpan.');
          } else {

            if(isset($mobil[1]) and isset($mobil[2])){

                for($i=1;$i<=2;$i++){
                    $sql2="insert into detailsewa(kode_sewa,kode_mobil)values('$kode_sewa','$mobil[$i]')";
                    $hasil2=mysqli_query($con,$sql2);
                }

            } else {
                if($mobil[1]=="" && $mobil[2]==""){
                    echo 'mobil tdk ada yg dipilih';
                } else {

                    if($mobil[1]<>""){
                        $sql3="insert into detailsewa(kode_sewa,kode_mobil)values('$kode_sewa','$mobil[1]')";
                        $hasil3=mysqli_query($con,$sql3);

                    }
                    if($mobil[2]<>""){
                        $sql4="insert into detailsewa(kode_sewa,kode_mobil)values('$kode_sewa','$mobil[2]')";
                        $hasil4=mysqli_query($con,$sql4);

                    }

                }
            }
            $mobil1=getmerkmobil($con,$mobil[1]);
            $mobil2=getmerkmobil($con,$mobil[2]);
            pesan_sukses('Data berhasil disimpan.');

          }
      } else {
        pesan_gagal('Mobil harus dipilih tidak boleh kosong!');
      }

    }
     ?>
    <div class="row" style="margin-top:50px">
      <div class="col">

      </div>
      <div class="col">

        <form name="form1" method="POST" action="">
              <div class="form-group">
               <label class="control-label col-sm-10" for="email">Nama Customer:</label>
               <div class="col-sm-10">
                 <select name="no_pel" id="no_pel">
                   <option selected><?php echo getnamapelanggan($con,$no_pel); ?></option>
                   <?php
                       $q="select * from pelanggan";
                       $h=mysqli_query($con,$q);
                       while($row=mysqli_fetch_array($h)){
                           echo '<option value="'. $row['no_pel'].'">'.$row['nama_pel'].'</option>';
                       }
                    ?>

                 </select>
               </div>
              </div>
              <div class="form-group">
               <label class="control-label col-sm-10" for="pwd">Kode Sewa:</label>
               <div class="col-sm-10">
                 <input name="kode_sewa" id="kode_sewa" type="text" class="form-control" placeholder="Enter Rent Code" value="<?php echo $kode_sewa; ?>">
               </div>
              </div>
              <div class="form-group">
               <label class="control-label col-sm-10" for="pwd">Tanggal Sewa:</label>
               <div class="col-sm-10">
                 <input type="date" name="tanggal_sewa" id="tanggal_sewa" class="form-control" id="datepicker" placeholder="Enter Rent Date" value="<?php echo $tanggal; ?>">
               </div>
              </div>
              <div class="form-group">
               <label class="control-label col-sm-10" for="pwd">Mobil 1:</label>
               <div class="col-sm-10">
                 <select name="mobil1" id="mobil1">
                   <option selected><?php echo $mobil1; ?></option>
                   <?php
                       $q="select * from armada";
                       $h=mysqli_query($con,$q);
                       while($row=mysqli_fetch_array($h)){
                           echo '<option value="'. $row['kode_mobil'].'">'.$row['merk_mobil'].'</option>';
                       }
                    ?>

                 </select>
               </div>

               <label class="control-label col-sm-10" for="pwd">Mobil 2:</label>
               <div class="col-sm-10">
                 <select name="mobil2" id="mobil2">
                   <option selected><?php echo $mobil2; ?></option>
                   <?php
                       $q="select * from armada";
                       $h=mysqli_query($con,$q);
                       while($row=mysqli_fetch_array($h)){
                           echo '<option value="'. $row['kode_mobil'].'">'.$row['merk_mobil'].'</option>';
                       }
                    ?>

                 </select>
               </div>
               <?php if($total_harga_sewa>0){
                   echo '<label class="control-label col-sm-10" for="pwd">Total harga sewa:</label>
                   <div class="col-sm-10">
                     <input name="total_sewa" type="text" class="form-control" value="'.$total_harga_sewa.'">
                   </div>
                  ';
                } ?>
                </div>
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
