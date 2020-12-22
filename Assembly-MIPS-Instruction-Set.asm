				# ------Prezime i ime : Dimitrievski Gabriel ------#
	
.data
 prvVektor: .space 80   #deklariranje i ogranicuvanje na nizite na max dolzina 20
 vtorVektor: .space 80  #Pishuvame 80 bidejki 1 int = 4bits (20x4=80)
 indeks: .word 181225 
.text
main:	#main funkcija

#Pocenata memoriska adresa:
li $v0, 5 #Mu dozvoluvam na korisnikot da vnese vrednost od tastatura
syscall
move $s7, $v0# ja stavam vrednosta shto ja vnel korisnikot vo $s7 da bide pocetna adresa
	

#Skeniranje na goleminata na vektorot
li $v0, 5 #Skeniram nova vrednost za da znam do kade da odat ciklusite 
#while_za_prv_vektor i #while_za_vtor_vektor
syscall
move $t4,$v0  # ja stavam vrednosta od v0 vo t4
addi $t3,$zero, 4 #stavam vo t3 da imam 4 za da ja pomnozam goleminata x4 
mult $t4,$t3 #mnozenje na t4 i t3
mflo $t2 #rezultatot si go stavam vo t2

addi $t1,$zero,0 #brojac=0
while_za_prv_vektor:
beq $t1,$t2,while1_kraj#na pocetokot brojacot e nula i odi se dodeka ne e ednakvo so t2
li $v0,5 #Vrenuvanje na vrednosti za vektorot
syscall
move $t0,$v0
sw $t0,prvVektor($t1) #od t0 ja stavam vrednosta na soodvetno mesto vo vektorot spored brojacot
addi $t1,$t1,4 #brojac=brojac+4
j while_za_prv_vektor #se povtoruva ciklusot dodeka ne zavrshi
while1_kraj:

addi $t1,$zero,0 #istiot brojac samo sega za vtoriot vektor
#Vnesuvanje na vtoriot vektor od tastatura
#Postapkata e istata kako i kaj vnesuvanjeto na prviot vektor
while_za_vtor_vektor:
beq $t1,$t2,while2_kraj
li $v0,5
syscall
move $t0,$v0
sw $t0, vtorVektor($t1)
addi $t1,$t1,4
j while_za_vtor_vektor
while2_kraj:

addi $t1,$zero,0 #povtorno go stavam istiot brojac na 0

jal procedura # Povik na procedura za presmetka na skalren proizvod i zbir na

li $v0, 1
move $a0,$t9    # Pecatenje na skalaren proizvod 
syscall

lhu $s1, indeks # Poslednite 16 bita od indeksot gi stavam vo $s1

li $v0, 10 #povikuvanje na krajot na programata (end of main function)
syscall #system call

#procedurata treba da bide nadvor od main 
procedura:
addi $t9,$zero,0 # t9 kje bide za skalaren proizvod
skalaren_proizvod_i_zbir:
beq $t1,$t2,while3_kraj
lw $t6, prvVektor($t1) #gi zemam clen po clen od dvete nizi (0 so 0, pa 1 so 1...)
lw $t7, vtorVektor($t1)
add $s3, $t6, $t7
sw $s3, ($s7) # stavanje na memoriska lokacija procitana od tastatura
mult $t6,$t7 #gi mnozam t6 i t7 i rezultatot go stavam vo t8
mflo $t8
addi  $t1,$t1,4
addi  $s7,$s7,4 #zgolemuvanje za 4 na memoriska lokacija od procitana za na naredeno mesto da se stavi sledniot broj
add $t9,$t9,$t8 
j skalaren_proizvod_i_zbir
while3_kraj:
jr $ra # Vrakanje nazad vo tekot na programta od kaj sto e povikana procedurata 
