<?php 
$no=1;
foreach ($list as  $row) {
	?>


<tr><td><?php echo $no; ?></td>
	<td> <input type="text" class="form-control" name="kode_barang[]" value="<?php echo $row->nama_barang; ?>" id="kode_barang" placeholder="Ketik Kode / Nama Barang"><div id="hasil_pencarian"></div></td>
	<td><input type="text" class="form-control input-xsmall " name="kode[]" value="<?php echo $row->kode_barang; ?>" id="kode" readonly=""></td>
	
	<td><input type="text" class="form-control input-xsmall" id="jumlah_order" value="<?php echo $row->qty; ?>"  name="jumlah_order[]" onkeypress="return check_int(event)"></td>
	<td><input type="hidden" name="satuan[]" value="<?php echo $row->satuan; ?>"><span><?php echo $row->nama_satuan; ?></span></td><td><input type="text" class="form-control input-xsmall" id="harga" value="<?php echo $row->harga; ?>" name="harga[]" onkeypress="return check_int(event)"></td>
	<td><input type="hidden" class="form-control input-xsmall" id="subtotal" value="<?php echo $row->harga*$row->qty;?>" name="subtotal[]" onkeypress="return check_int(event)"><span><?php echo rupiah($row->harga*$row->qty); ?></span></td>
	<td><input type="hidden" name="account[]" value="<?php echo $row->kode_account; ?>"><button class="btn btn-default" id="HapusBaris"><i class="fa fa-times" style="color:red;"></i></button></td></tr>
	<?php
	$no++;
}
?>