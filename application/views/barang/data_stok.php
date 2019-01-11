<?php

foreach ($list as $key) {
$QTY_BALANCE=$key->QTY_BALANCE;
echo'<tr>                                                   
     <td>'.$key->TRANS_DATE.'</td>
     <td>'.$key->TRANS_ID.'</td>
      <td>'.$key->TRANS_DESCRIPTION.'</td>
     <td>'.$key->QTY_IN.'</td>
     <td>'.$key->QTY_OUT.'</td>
     <td>'.$QTY_BALANCE.'</td>                             
    </tr>';
$QTY_BALANCE=$key->QTY_BALANCE+$QTY_BALANCE;
}
?>                                               