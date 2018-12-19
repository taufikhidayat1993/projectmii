<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
    
    if ( ! function_exists('no_payment'))
    {
        function no_payment($no_po,$tanggal)
        {
            $pisah = explode("/",$tanggal);        
            $bulan = romawi_bulan($pisah[1]);
            
            return 'VP-'.$no_po.'-MII-'.$bulan.'-'.substr($pisah[2],-2);
        }
    }