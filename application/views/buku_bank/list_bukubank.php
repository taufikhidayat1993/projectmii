                               <tr>
                                <td></td>
                                <td></td>
                          
                                 <td>Saldo tanggal 30 Nov 2018</td>
                                 <td></td>
                                 <td></td>
                                 <td><?php echo $saldo->saldo; ?></td>
                              </tr>
															   <?php
                                 $saldo=$saldo->saldo;
															   foreach($list_bukubank as $row){																   
																   echo"<tr>
                                   <td>".$row->tanggal."</td>
                                   <td id='kode_po'>".$row->source_no."</td>
                                   <td id='total_po'>".$row->nama_source." ".$row->source_no."</td>
                                    <td id='ppn'>".number_format($row->debet)."</td>
                                    <td id='ppn'>".number_format($row->kredit)."</td>
                                   <td>".number_format($saldo+($row->debet-$row->kredit))."</td>
                                  
                                   </tr>";
$saldo=$saldo+($row->debet-$row->kredit);

															   }
															   
															   ?>