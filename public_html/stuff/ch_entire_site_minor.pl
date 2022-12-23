$newdir = "c:\\Websites\\TattooShops\\shops9-11-14";
$olddir = "c:\\Websites\\TattooShops\\shops";
opendir(DIR, "$olddir") or die "can't open DIR\n";
@states = readdir(DIR);
@states = sort @states;
close DIR;
$savedplace = 0;
foreach $state (@states) {
   next if ($state eq "." or $state eq "..");
   findstatename();
  $mkdir = `mkdir $newdir\\$state`;
   undef $mkdir;
  opendir (STATE, "$olddir\\$state") or die "can't open state dir\n";
  @files = readdir STATE;
  foreach $file(@files) {
     next if ($file eq "." || $file eq "..");
     open (FILE, "$olddir\\$state\\$file") 
			or die "can't open city file: $file\n";
     open (FILEOUT, ">$newdir\\$state\\$file")
			or die "can't open output file: $file\n";
     while ($line = <FILE>) {
           if ($line =~ /anrdoezrs.net\/click-7524095-10793836/) {
             $line = qq|    <td rowspan="2"><a href="http://www.anrdoezrs.net/click-7192508-10793836" target="_top">
    <img src="http://www.ftjcfx.com/image-7192508-10793836" width="468" height="60" alt="15% Off Custom Temporary Tattoos" border="0"/></a>
|;
	     print FILEOUT "$line";
	     $line = <FILE>; $line = <FILE>;
           }
	   elsif ($line =~ /placeholder-7894055/) {
	     $line = qq|<br><br><a href="http://www.anrdoezrs.net/click-7192508-11816443" target="_top">
<img src="http://www.awltovhc.com/image-7192508-11816443" width="300" height="250" alt="Licensed Temporary Tattoos" border="0"/></a>
|;
	   }
           print FILEOUT "$line";
      }
      close FILE;
      close FILEOUT;
  }
  closedir STATE;
}  

sub findstatename {
   open (STATEFILE, "..\\..\\statelist") or die ("can't open statelist\n");
   while ($stateline = <STATEFILE>) {
      if ($stateline =~ /^$state ([A-Z][A-Z]) (\S+)\s+/) {
         $stabbrev = $1;
         $fullstatename = $2;
         $fullstatename =~ s/-/ /;
         $lcstabbrev = lc $stabbrev;
         $citiesfilename = $lcstabbrev . "cities.htm"; # may need to use this var if the changes don't effect the 'list of cities' files
         last;
      }
   }
   close STATEFILE;
}