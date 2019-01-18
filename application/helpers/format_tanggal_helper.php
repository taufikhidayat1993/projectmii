<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
      
    if ( ! function_exists('tgl_indo'))
    {
        function date_indo($tgl)
        {
            $ubah = gmdate($tgl, time()+60*60*8);
			$pisah = explode(" ",$ubah);
            $pecah = explode("-",$pisah[0]);
            $tanggal = $pecah[2];
            $bulan = bulan($pecah[1]);
            $tahun = $pecah[0];
            return $tanggal.' '.$bulan.' '.$tahun.' '.$pisah[1];
        }
    }
    

    if ( ! function_exists('no_po'))
    {
        function no_po($no_po,$tanggal)
        {
            $pisah = explode("/",$tanggal);        
            $bulan = romawi_bulan($pisah[1]);
            
            return 'PO-'.$no_po.'-MII-'.$bulan.'-'.substr($pisah[2],-2);
        }
    }
     if ( ! function_exists('kode_belakang'))
    {
        function kode_belakang($perusahaan,$date,$tahun)
        {       
            $bulan = romawi_bulan($date);
            
            return $perusahaan.'/'.$bulan.'/'.substr($tahun,-2);
        }
    } 
      if ( ! function_exists('no_pi'))
    {
        function no_pi($no_po,$tanggal)
        {
            $pisah = explode("/",$tanggal);        
            $bulan = romawi_bulan($pisah[1]);
            
            return 'PI-'.$no_po.'-MII-'.$bulan.'-'.substr($pisah[2],-2);
        }
    }
        
    if ( ! function_exists('bulan'))
    {
        function bulan($bln)
        {
            switch ($bln)
            {
                case 1:
                    return "Januari";
                    break;
                case 2:
                    return "Februari";
                    break;
                case 3:
                    return "Maret";
                    break;
                case 4:
                    return "April";
                    break;
                case 5:
                    return "Mei";
                    break;
                case 6:
                    return "Juni";
                    break;
                case 7:
                    return "Juli";
                    break;
                case 8:
                    return "Agustus";
                    break;
                case 9:
                    return "September";
                    break;
                case 10:
                    return "Oktober";
                    break;
                case 11:
                    return "November";
                    break;
                case 12:
                    return "Desember";
                    break;
            }
        }
    }
 
    //Format Shortdate
    if ( ! function_exists('shortdate_indo'))
    {
        function shortdate_indo($tgl)
        {
            $ubah = gmdate($tgl, time()+60*60*8);
            $pecah = explode("-",$ubah);
            $tanggal = $pecah[2];
            $bulan = short_bulan($pecah[1]);
            $tahun = $pecah[0];
            return $tanggal.'/'.$bulan.'/'.$tahun;
        }
    }
       if ( ! function_exists('shortdate_uk'))
    {
        function shortdate_uk($tgl)
        {
            $ubah = gmdate($tgl, time()+60*60*8);
            $pecah = explode("/",$ubah);
            $tanggal = $pecah[0];
            $bulan = short_bulan($pecah[1]);
            $tahun = $pecah[2];
            return $tanggal.'-'.$bulan.'-'.$tahun;
        }
    }
  
	 if ( ! function_exists('shortdate_uki'))
    {
        function shortdate_uki($tgl)
        {
 
            $pecah = explode("/",$tgl);
            $tanggal = $pecah[0];
            $bulan = short_bulan($pecah[1]);
            $tahun = $pecah[2];
            return $tahun.'-'.$bulan.'-'.$tanggal;
        }
    }
     if ( ! function_exists('ymd'))
    {
        function ymd($tgl)
        {
 
            $pecah = explode("/",$tgl);
            $tanggal = $pecah[0];
            $bulan = short_bulan($pecah[1]);
            $tahun = $pecah[2];
            return $tahun.'-'.$bulan.'-'.$tanggal;
        }
    }

    if ( ! function_exists('romawi_bulan'))
    {
        function romawi_bulan($bln)
        {
            switch ($bln)
            {
                case 1:
                    return "I";
                    break;
                case 2:
                    return "II";
                    break;
                case 3:
                    return "III";
                    break;
                case 4:
                    return "IV";
                    break;
                case 5:
                    return "V";
                    break;
                case 6:
                    return "VI";
                    break;
                case 7:
                    return "VII";
                    break;
                case 8:
                    return "VIII";
                    break;
                case 9:
                    return "IX";
                    break;
                case 10:
                    return "X";
                    break;
                case 11:
                    return "XI";
                    break;
                case 12:
                    return "XII";
                    break;
            }
        }
    }
    if ( ! function_exists('short_bulan'))
    {
        function short_bulan($bln)
        {
            switch ($bln)
            {
                case 1:
                    return "01";
                    break;
                case 2:
                    return "02";
                    break;
                case 3:
                    return "03";
                    break;
                case 4:
                    return "04";
                    break;
                case 5:
                    return "05";
                    break;
                case 6:
                    return "06";
                    break;
                case 7:
                    return "07";
                    break;
                case 8:
                    return "08";
                    break;
                case 9:
                    return "09";
                    break;
                case 10:
                    return "10";
                    break;
                case 11:
                    return "11";
                    break;
                case 12:
                    return "12";
                    break;
            }
        }
    }
 
    //Format Medium date
    if ( ! function_exists('mediumdate_indo'))
    {
        function mediumdate_indo($tgl)
        {
            $ubah = gmdate($tgl, time()+60*60*8);
            $pecah = explode("-",$ubah);
            $tanggal = $pecah[2];
            $bulan = medium_bulan($pecah[1]);
            $tahun = $pecah[0];
            return $tanggal.'-'.$bulan.'-'.$tahun;
        }
    }
      
    if ( ! function_exists('medium_bulan'))
    {
        function medium_bulan($bln)
        {
            switch ($bln)
            {
                case 1:
                    return "Jan";
                    break;
                case 2:
                    return "Feb";
                    break;
                case 3:
                    return "Mar";
                    break;
                case 4:
                    return "Apr";
                    break;
                case 5:
                    return "Mei";
                    break;
                case 6:
                    return "Jun";
                    break;
                case 7:
                    return "Jul";
                    break;
                case 8:
                    return "Ags";
                    break;
                case 9:
                    return "Sep";
                    break;
                case 10:
                    return "Okt";
                    break;
                case 11:
                    return "Nov";
                    break;
                case 12:
                    return "Des";
                    break;
            }
        }
    }
     
    //Long date indo Format
    if ( ! function_exists('longdate_indo'))
    {
        function longdate_indo($tanggal)
        {
            $ubah = gmdate($tanggal, time()+60*60*8);
            $pecah = explode("-",$ubah);
            $tgl = $pecah[2];
            $bln = $pecah[1];
            $thn = $pecah[0];
            $bulan = bulan($pecah[1]);
      
            $nama = date("l", mktime(0,0,0,$bln,$tgl,$thn));
            $nama_hari = "";
            if($nama=="Sunday") {$nama_hari="Minggu";}
            else if($nama=="Monday") {$nama_hari="Senin";}
            else if($nama=="Tuesday") {$nama_hari="Selasa";}
            else if($nama=="Wednesday") {$nama_hari="Rabu";}
            else if($nama=="Thursday") {$nama_hari="Kamis";}
            else if($nama=="Friday") {$nama_hari="Jumat";}
            else if($nama=="Saturday") {$nama_hari="Sabtu";}
            return $nama_hari.','.$tgl.' '.$bulan.' '.$thn;
        }
    }
