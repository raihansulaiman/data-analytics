SUPPLYING COFFEE PROCESS
Goritma coffee memiliki supplier biji kopi roastery sendiri yaitu Javanica Coffee and Roastery yang berlokasi di Jalan BKR kota Bandung. Dikarenakan kuota Goritma Coffee yang terbilang masih kecil dan masih berada di awal karir yaitu buka pada tanggal 8 Januari 2020 maka sistem pengadaan bahan baku masih langsung dilakukan oleh pegawai Goritma coffee yang akan mengontak supplier dan mereka sendiri yang mengambil biji kopi ke supplier tersebut. Tetapi apabila Javanica coffee and Roastery tidak dapat memenuhi pesanan bahan baku pada saat dibutuhkan maka Goritma Coffee akan mengambil alternative lain dengan mencari bahan baku kepada supplier lain tetapi hanya untuk sementara waktu karena adanya perbedaan kualitas biji kopi roastery dari supplier lain dengan Javanica walaupun hanya ada sedikit perbedaan.

ORDERING COFFEE PROCESS
Cara pemesanan order di Goritma Coffee yaitu pelanggan langsung menuju kasir kemudian memilih pesanan yang diinginkan kemudian kasir akan menginput pesanan menggunakan aplikasi yang bernama ‘kasir’ dan aplikasi secara otomatis menyimpan data-data pesanan pelanggan. Setelah pesanan selesai terinput, kasir akan memproses pembayaran kemudian setelah pelanggan selesai membayar, orderan akan diproses. Saat pesanan diproses, pelanggan dipersilahkan duduk dan menunggu pesanan. Kemudian setelah pesanan selesai, pesanan akan diantar langsung oleh pegawai ke tempat duduk pelanggan.
Rekap pembayaran di Goritma Coffee sudah secara otomatis dilakukan oleh aplikasi ‘kasir’ ini. Data rekap berupa pengeluaran, apa yang telah terjual, dan produk apa yang paling sering dipesan oleh pelanggan pada bulan itu. 

BUSINESS RULES
ENTITAS:
1	Pelanggan
2	Menu 
3	Produk_Kopi
4	Warehouse
5	Supplier
6	Pegawai
7	Humas
8	Kasir

3.2 ATRIBUT
Pelanggan: 
•	Id_pelanggan		VARCHAR		(50)	NOT NULL	PK
•	Nama			      VARCHAR		(50)	NOT NULL
•	No_HP			      INT			  (12)	NULL

Pegawai :
•	Id_Pegawai		VARCHAR		(50)	NOT NULL	PK
•	Nama			    VARCHAR		(50)	NOT NULL
•	Gender		  	ENUM			(2)	NOT NULL
•	No_Telp	    	VARCHAR		(12)	NOT NULL

Supplier:
•	Id_supplier		  VARCHAR		(50)	NOT NULL	PK
•	Nama Supplier	  VARCHAR		(50)	NOT NULL
•	Id_Produk_Kopi	VARCHAR		(50)	NOT NULL	
•	Jumlah			    INT			(3)	NOT NULL	

Produk_Kopi:
•	Id_Produk_Kopi		VARCHAR	(50)	NOT NULL	PK
•	Nama_Produk_Kopi	VARCHAR	(50)	NOT NULL

Warehouse
•	Id_Warehouse		  VARCHAR		(50)	NOT NULL	PK
•	Id_Produk_Kopi	  VARCHAR		(50)	NOT NULL	FK
•	Nama_Produk_Kopi	VARCHAR		(50)	NOT NULL
•	Jumlah			      INT			(10)	NOT NULL

Menu
•	Id_Menu		        VARCHAR	(50)	NOT NULL	PK
•	Nama_Produk_Kopi	VARCHAR	(50)	NOT NULL	
•	Harga			        VARCHAR	(50)	NOT NULL	

Humas:
•	NIP_Humas		VARCHAR	(50)	NOT NULL	PK
•	Nama			  VARCHAR	(50)	NOT NULL

Kasir:
•	NIP_Kasir		VARCHAR	(50)	NOT NULL	PK
•	Nama			  VARCHAR	(50)	NOT NULL



