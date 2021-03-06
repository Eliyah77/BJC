#!/usr/bin/perl

# Tableau de correspondance numéro->nom des livres
require('var-livres.pl');

# Variables
my $name = 'martin_1744';
my $src = '../TXT/'.$name.'.txt';
my $dst = '../TXT/'.$name;

# Ouvrir fichier source
open(SRC, $src);

while($ligne = <SRC>) {
	# Découpage de chaque éléments de la ligne en cours
	@ligne = split(/\s/, $ligne);

	# Si on travaille sur un nouveau livre
	if($numLivre != $ligne[0]) {
		# Premier élément, numéro du livre
		$numLivre = shift(@ligne);
		$numLivre = $1 if($numLivre =~ /^(\d{2})/);

		# Fermeture des précédants fichiers de sortie
		close(LIVRE);
		#close(COMMENTAIRES);
		# Ouverture des fichiers sortie correspondants au livre en cours
		print("> ".$dst."/".$numLivre."-".$livre{$numLivre}.".txt\n");
		open(LIVRE, "> ".$dst."/".$numLivre."-".$livre{$numLivre}.".txt");
		open(COMMENTAIRES, "> ".$dst."/".$numLivre."-".$livre{$numLivre}."-commentaires.txt");
	} else {
		# Suppression premier élément
		shift(@ligne);
	}

	# Deuxième élément, numéro du chapitre
	$numChapitre = shift(@ligne);
	# Troisième élément, numéro du verset
	$numVerset = shift(@ligne);
	# Concaténation du reste, texte du verset
	$verset = join(' ', @ligne);

	# Écriture de la ligne
	print(LIVRE "${numChapitre}:${numVerset} ${verset}\n");
	#print(COMMENTAIRES "#${numChapitre}:${numVerset}\n");
}

# Fermer fichier de sortie
close(LIVRE);
close(COMMENTAIRES);
# Fermer fichier source
close(SRC);
