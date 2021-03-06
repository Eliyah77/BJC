#!/usr/bin/perl

# modules
use strict;
use warnings;
use File::Basename;

# variables
my $name = 'bjc';
my $dirname = dirname(__FILE__);
my $src_dir = $dirname.'/../tex/'.$name;
my $dst_file = $dirname.'/../unb/'.$name.'.txt';
my ($src_dh, $src_fh, $dst_fh, $output);
my (@file_list, $src_file, $line, $book, $chapter, $verse, $text);

# liste des fichiers latex source
opendir($src_dh, $src_dir) or die("Impossible d'ouvrir le dossier $src_dir : $!");
while($src_file = readdir($src_dh)) {
	if((-T "$src_dir/$src_file") and ($src_file =~ /\.tex$/)) {
		push(@file_list, $src_file);
	}
}
closedir($src_dh);
# tri de la liste
@file_list = sort({$a cmp $b} @file_list);

# fichier de sortie
open($dst_fh, ">", $dst_file);

# parcours des fichiers
foreach $src_file (@file_list) {
	# ouverture du fichier (un livre)
	open($src_fh, "<", $src_dir."/".$src_file);
	
	# recup numéro de livre
	$book = $src_file;
	$book =~ s/^(\d{2}).*/$1/;
	
	# ajout O(ld) ou N(ew)
	if($book<40) {
		$book=$book.'O';
	}
	else {
		$book=$book.'N';
	}
	
	# parcours du livre
	while($line = <$src_fh>) {
		# pre-formatage ligne
		chomp($line);
		$line =~ s/\\FTNT\{.[^\}]*\}//g;
		$line =~ s/\\TextDial\{(.[^\}]*)\}/\[$1\]/g;
		$line =~ s/~/ /g;
		
		# recup numéro de chaptire
		if($line =~ /^\\Chap/) {
			$chapter = $line;
			$chapter =~ s/^\\Chap\{(\d{1,3})\}/$1/;
		}
		
		# recup numéro de verset et texte du verset
		if(($line =~ /^\\VerseOne/) or ($line =~ /^\\VS/)) {
			$text = $verse = $line;
			if($line =~ /^\\VerseOne/) {
				$verse = "1";
				$text =~ s/^\\VerseOne\{\}(.*)/$1/;
			}
			elsif($line =~ /^\\VS/) {
				$verse =~ s/^\\VS\{(\d{1,3})\}.*/$1/;
				$text =~ s/^\\VS\{\d{1,3}\}(.*)/$1/;
			}
			
			# écrire ligne formatée
			$output = $book."\t".$chapter."\t".$verse."\t".$text."\n";
			print($dst_fh $output);
		}
	}
	
	close($src_fh);
}

close($dst_fh);

