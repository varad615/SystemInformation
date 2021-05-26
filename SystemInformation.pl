use System::Info;
use strict; use warnings;
use PDF::Create;
 
my $si = System::Info->new; 
printf "Hostname: %s\n", $si->host;
printf "Number of CPU's: %s\n", $si->ncpu;
printf "Processor type: %s\n", $si->cpu_type; 
printf "Processor description: %s\n", $si->cpu;      
printf "OS and version: %s\n", $si->os;
printf "CPU speed:  %s\n", $si->cpu =~ s{^.*\b([0-9.]+)\s*[A-Z]Hz.*}{$1}r;

my $pdf = PDF::Create->new(
    'filename'     => 'SystemInfo.pdf',
    'Author'       => 'Varad GUndap',
    'Title'        => 'System Information',
    'CreationDate' => [ localtime ]
);
 
my $root = $pdf->new_page('MediaBox' => $pdf->get_page_size('A4'));
 
my $page1 = $root->new_page;
 
my $font = $pdf->font('BaseFont' => 'Helvetica');

my $toc = $pdf->new_outline('Title' => 'Title Page', 'Destination' => $page1);
 
$page1->stringc($font, 40, 306, 426, 'System Information');
$page1->stringc($font, 20, 306, 396, 'My System Configuration');
$page1->stringc($font, 20, 306, 300, '');
 
my $page2 = $root->new_page;

$page2->string($font, 30, 50, 725, "Operating System");
$page2->string($font, 20, 50, 700, $si->os);

$page2->string($font, 30, 50, 625, "Host Name");
$page2->string($font, 20, 50, 600, $si->host);

$page2->string($font, 30, 50, 525, "Number of CPUs");
$page2->string($font, 20, 50, 500, $si->ncpu);

$page2->string($font, 30, 50, 425, "Processor type");
$page2->string($font, 20, 50, 400, $si->cpu_type);

$page2->string($font, 30, 50, 325, "Processor description");
$page2->string($font, 20, 50, 300, $si->cpu);
 

$toc->new_outline('Title' => 'Second Page', 'Destination' => $page2);
 
# Close the file and create the PDF
$pdf->close;

printf " \n ";
printf "================================================================ \n";
printf "Press 1 to get more detailed information about your System:\n";
print "Press 0 to EXIT the program.\n";
my $num = <>;
print "$num";
if( $num == 0 ){
    print("Thank You For Using The System Information Program. \nWe hope it was helpful. \n ")
}else{
    system("hardinfo");
}
