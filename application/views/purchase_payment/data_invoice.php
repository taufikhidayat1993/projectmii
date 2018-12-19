<?php 
$no=1;
foreach ($list as  $row) {
	?>

<tr>

	<td><?php echo $row->inv_no; ?></td>
	<td><?php echo $row->tgl_pi; ?></td>
	<td><?php echo $row->jatuh_tempo; ?></td>
	<td><?php echo $row->total; ?></td>
	<td></td>
	<td><input type="text" class="form-control input-small" id="jml_payment" readonly></td>
	<td><input type="checkbox" id="pay"></td>
</tr>
	<?php
	$no++;
}
?>