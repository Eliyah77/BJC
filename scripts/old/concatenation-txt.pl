#!/usr/bin/perl

# Variables
my $name = 'bjc_2014';
my $src = '../txt/BJC/'.$name;
my $dst = '../txt/'.$name.'.txt';

# Ouverture fichier de sortie
open(OUT, "> $dst");

# Liste les élements du dossier '../txt/'
@dirLS=split(/\s/, `ls -d $src/*`);

# Parcours de chaque élément de la liste
foreach(@dirLS) {
	# Récuperation du numéro du livre
	$numLivre = $1 if($_ =~ /(\d{2})/);
	print("$numLivre\t\n");

	# Ouverture et parcours du livre en cours
	open(LIVRE, $_);
	while($ligne = <LIVRE>) {
		# Écriture de la ligne formatée, dans el fichier de sortie
		print(OUT "$numLivre\t$1\t$2\t$3\n") if($ligne =~ /^(\d{1,3}):(\d{1,3})\s(.*)\s$/);
	}
	# Fermeture du fichier de lecture
	close(LIVRE);
}

# Fermeture fichier de sortie
close(OUT);
