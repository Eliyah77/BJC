#!/usr/bin/perl

# Modules
use strict;
use warnings;
use XML::Simple;
use Data::Dumper;
# UTF8
use open ":encoding(utf8)";
use open IN => ":encoding(utf8)", OUT => ":utf8";

# Array : num => bookname
my %livre = (
	"01" => "Genese",
	"02" => "Exode",
	"03" => "Levitique",
	"04" => "Nombres",
	"05" => "Deuteronome",
	"06" => "Josue",
	"07" => "Juges",
	"08" => "Ruth",
	"09" => "1 Samuel",
	"10" => "2 Samuel",
	"11" => "1 Rois",
	"12" => "2 Rois",
	"13" => "1 Chroniques",
	"14" => "2 Chroniques",
	"15" => "Esdras",
	"16" => "Nehemie",
	"17" => "Esther",
	"18" => "Job",
	"19" => "Psaumes",
	"20" => "Proverbes",
	"21" => "Ecclesiaste",
	"22" => "Cantique des Cantiques",
	"23" => "Esaie",
	"24" => "Jeremie",
	"25" => "Lamentations",
	"26" => "Ezechiel",
	"27" => "Daniel",
	"28" => "Osee",
	"29" => "Joel",
	"30" => "Amos",
	"31" => "Abdias",
	"32" => "Jonas",
	"33" => "Michee",
	"34" => "Nahum",
	"35" => "Habacuc",
	"36" => "Sophonie",
	"37" => "Aggee",
	"38" => "Zacharie",
	"39" => "Malachie",
	"40" => "Matthieu",
	"41" => "Marc",
	"42" => "Luc",
	"43" => "Jean",
	"44" => "Actes",
	"45" => "Romains",
	"46" => "1 Corinthiens",
	"47" => "2 Corinthiens",
	"48" => "Galates",
	"49" => "Ephesiens",
	"50" => "Philippiens",
	"51" => "Colossiens",
	"52" => "1 Thessaloniciens",
	"53" => "2 Thessaloniciens",
	"54" => "1 Timothee",
	"55" => "2 Timothee",
	"56" => "Tite",
	"57" => "Philemon",
	"58" => "Hebreux",
	"59" => "Jacques",
	"60" => "1 Pierre",
	"61" => "2 Pierre",
	"62" => "1 Jean",
	"63" => "2 Jean",
	"64" => "3 Jean",
	"65" => "Jude",
	"66" => "Apocalypse"
);

# Variables
my $name = 'bjc_2014';
my $src = '../osis/'.$name.'.xml';
my $dst = '../tex/'.$name;

# Check if destination folder doesn't exists
if (! -d $dst) {
	# Then create it
	`mkdir -p $dst`;
}

# Read XML file
my $bible = XMLin($src, ForceArray => 1);

print Dumper($bible);

#~ foreach my $book ( @{ $bible->{osisText} } ) {
	#~ #
#~ }

foreach my $test (keys %{$bible->{osisText}}) {
	print $test . ' is ' . $bible->{osisText} . "\n";
}
