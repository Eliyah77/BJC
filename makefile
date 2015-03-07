# options de compilation
XELATEX ?= cd tex/ ; xelatex --output-directory=../pdf/

# Toutes
all: martin_1744 bjc_imprim bjc_imprim_123x180 bjc_internet

# Martin 1774
martin_1744: pdf/martin_1744.pdf

pdf/martin_1744.pdf: tex/martin_1744.tex tex/martin_1744/*.tex
	$(XELATEX) martin_1744
	$(XELATEX) martin_1744
	$(XELATEX) martin_1744

# BJC format eco imprim
bjc_imprim_123x180: pdf/bjc_imprim_123x180.pdf

pdf/bjc_imprim_123x180.pdf: tex/bjc_imprim_123x180.tex tex/bjc_2014/*.tex tex/bjc_2014/annexes/*.tex
	$(XELATEX) bjc_imprim_123x180
	$(XELATEX) bjc_imprim_123x180
	$(XELATEX) bjc_imprim_123x180

# BJC format imprim
bjc_imprim: pdf/bjc_imprim.pdf

pdf/bjc_imprim_tmp.pdf: tex/bjc_imprim_tmp.tex tex/bjc_2014/*.tex tex/bjc_2014/annexes/*.tex
	$(XELATEX) bjc_imprim_tmp
	$(XELATEX) bjc_imprim_tmp
	$(XELATEX) bjc_imprim_tmp

pdf/bjc_imprim.pdf: pdf/bjc_imprim_tmp.pdf pdf/annexes/*.pdf pdf/annexes/couleurs/*.pdf
	pdftk pdf/bjc_imprim_tmp.pdf \
		cat 1-r26 \
		output pdf/bjc_imprim_cut.pdf
	pdftk \
		pdf/entetes/1_* \
		pdf/entetes/2_* \
		pdf/entetes/3_* \
		pdf/entetes/4_* \
		pdf/entetes/5_* \
		pdf/entetes/6_* \
		pdf/bjc_imprim_cut.pdf \
		pdf/annexes/10_* \
		pdf/annexes/11_* \
		pdf/annexes/12_* \
		pdf/annexes/13_* \
		pdf/annexes/14_* \
		pdf/annexes/15_* \
		pdf/annexes/16_* \
		pdf/annexes/17_* \
		pdf/annexes/18_* \
		pdf/annexes/19_* \
		pdf/annexes/20_* \
		pdf/annexes/21_* \
		pdf/annexes/22_* \
		pdf/annexes/23_* \
		pdf/annexes/24_* \
		pdf/annexes/25_* \
		pdf/annexes/26_* \
		pdf/annexes/27_* \
		pdf/annexes/28_* \
		pdf/annexes/29_* \
		pdf/annexes/30_* \
		pdf/annexes/31_* \
		pdf/annexes/32_* \
		pdf/annexes/33_* \
		pdf/annexes/34_* \
		cat output pdf/bjc_imprim.pdf
	rm pdf/bjc_imprim_cut.pdf

# BJC format internet
bjc_internet: pdf/bjc_internet.pdf

pdf/bjc_internet_tmp.pdf: tex/bjc_internet_tmp.tex tex/bjc_2014/*.tex tex/bjc_2014/annexes/*.tex
	$(XELATEX) bjc_internet_tmp
	$(XELATEX) bjc_internet_tmp
	$(XELATEX) bjc_internet_tmp

pdf/bjc_internet.pdf: pdf/bjc_internet_tmp.pdf pdf/annexes/*.pdf pdf/annexes/couleurs/*.pdf
	pdftk pdf/bjc_internet_tmp.pdf \
		cat 1-r21 \
		output pdf/bjc_internet_cut.pdf
	pdftk \
		pdf/entetes/1_* \
		pdf/entetes/2_* \
		pdf/entetes/3_* \
		pdf/entetes/4_* \
		pdf/entetes/5_* \
		pdf/entetes/6_* \
		pdf/bjc_internet_cut.pdf \
		pdf/annexes/1_* \
		pdf/annexes/2_* \
		pdf/annexes/3_* \
		pdf/annexes/4_* \
		pdf/annexes/5_* \
		pdf/annexes/6_* \
		pdf/annexes/7_* \
		pdf/annexes/8_* \
		pdf/annexes/9_* \
		pdf/annexes/10_* \
		pdf/annexes/11_* \
		pdf/annexes/12_* \
		pdf/annexes/13_* \
		pdf/annexes/14_* \
		pdf/annexes/15_* \
		pdf/annexes/16_* \
		pdf/annexes/17_* \
		pdf/annexes/18_* \
		pdf/annexes/19_* \
		pdf/annexes/20_* \
		cat output pdf/bjc_internet.pdf
	rm pdf/bjc_internet_cut.pdf

# supprime les fichiers généré par xelatex
clean: pdf/*.aux pdf/*.log pdf/*.out pdf/*.toc
	rm -rf pdf/*.aux
	rm -rf pdf/*.log
	rm -rf pdf/*.out
	rm -rf pdf/*.toc
