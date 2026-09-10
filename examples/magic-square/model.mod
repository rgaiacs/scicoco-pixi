/* Magic square */

/* By Paola Ferraz - paola.ferraz@gmail.com */


/* Parâmetros */

param n, integer, default 6;
/* Dimensão do quadrado mágico */ 

param s := n*(n^2 + 1)/2;
/* Soma mágica */


/* Conjuntos */

set P := 1..n^2;
/* Conjunto dos números a serem alocados no quadrado mágico */

set T := 1..n;
/* Conjunto da dimensão */

set U{t in T} := ((t-1)*n + 1)..t*n;
/* Conjunto dividindo os n primeiros números de P, os próximos n (de n+1 até 2*n).
Até completar n*n */


/* Variáveis */

var x{i in P, j in P}, binary;
/* x[i,j] = 1 se elemento i está na coluna j, e 0 c.c. 
cada coluna j representa um elemento da matriz mágica, p. e.:
j = 1 -> (1,1)
j = 2 -> (1,2)
.
.
.
j = n - 1 -> (n, n-1)
j = n -> (n,n)

E i representa os números a serem alocados */


/* Retrições */

s.t. a{i in P}: sum{j in P} x[i,j] = 1;

s.t. b{i in P}: sum{j in P} x[j,i] = 1;
/* As restrições a e b impõe a não repetitividade dos elementos a serem alocados */

s.t. c: sum{i in P, j in P} i*x[i,j] = n^2*(n^2 + 1)/2;
/* Quero que a soma de todos os elementos seja n^2*(n^2+1)/2 */


s.t. d{t in T}: sum{i in P, j in U[t]} i * x[i,j] = s;
/* Soma da linhas da matriz mágica deve ser s, a soma mágica */

s.t. e{t in 1..(n-1)}: sum{i in P, j in 1..n} i * x[i, (j-1)*n + t] = s;
/* A soma da colunas da matriz mágica deve ser s */

s.t. f: sum{i in P, j in 1..n} i * x[i, (j-1)*(n+1) + 1] = s;
/* Diagonal principal */

s.t. g: sum{i in P, j in 1..n} i * x[i, j*(n-1) +1] = s;
/* Outra diagonal */
/* As somas das diaginais, individualmente, deve ser s */


solve;

/* Imprime a matriz x - essa matriz não imprime o quadrado mágico, para isso colocamos a matriz x no programa do Matlab (check) */

printf "\n";
printf "Magic sum is %d\n", s;
printf "\n";
for{i in P}
{  for{j in P} printf "%3d", i * x[i,j];
printf "\n";
}
printf "\n";



end;
