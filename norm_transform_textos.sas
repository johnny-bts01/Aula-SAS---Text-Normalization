/*LEFT - Move os espaços brancos para o final da palavra, alinhando o texto à esquerda.*/
data funcao_left;
	texto='   Decisão Improcendente';
	funcao_left=left(texto) || "*";
run;

/*RIGHT - Move os espaços brancos para o começo da palavra, alinhando o texto à direita.*/
data funcao_right;
	texto='Decisão Improcendente    ';
	funcao_right='*'||right(texto);
run;

/*TRIM - Aparar o texto, remove os espaços em branco no final da palavra*/
data funcao_trim;
	texto='Decisao Improcedente        ';
	funcao_trim=trim(texto)||"*";
run;

/*Combinando trim com left*/
data funcao_trim_left;
	texto='    Decisao Improcedente        ';
	funcao_trim_left='*'||trim(left(texto))||'*';
run;

/*A função STRIP também remove espaço no início e no final da palavra*/
data funcao_strip;
	texto='    Decisao Improcedente        ';
	funcao_strip='*'||strip(texto)||'*';
run;

/*CATX Concatena com algum operador de delimitação*/
data funcao_catx;
	texto1 = 'Info1';
	texto2 = 'Info2';
	texto3 = 'Info3';
	
	sep = '/';
	
	concatenado = cat(texto1,texto2,texto3);
	concatenado_delimitado = catx(sep,texto1,texto2,texto3);
run;

/*UPPERCASE, lowercase e Propcase*/
data textos;
	input textos $1-20;
	datalines;
	um texto
	UM OUTRO TEXTO
	maIS UM Texto
	TExto NUMERO quatro
	;
	run;
	
data trata_textos;
	set textos;
	UPPER_CASE = upcase(textos); /*todos os caracteres maiúsculos*/
	LOWER_CASE = lowcase(textos); /*todos os caracteres minúsculos*/
	PROPER_CASE = propcase(textos); /*somente a primeira letra de cada palavra maiúscula*/
run; 

/*retorna a posição de um caracter específico*/
data funcao_find;
	texto = "Testa texto";	
	funcao_find = find(texto,"a");
	
	/*Procura a próxima letra "a" a partir do 4º caracter*/
	funcao_find_pos = find(texto,"a",4); 
run;

/*retorna o tamanho total da palavra - ignora espaços no final*/
data funcao_length;
	texto = "ABDCEF";
	funcao_length = length(texto);
run;

/*Tabelas de exemplo*/

data numeros;
	infile datalines delimiter="*";
	length nr1 6. nr2 6.;
	input nr1 nr2;
	cards;
	.*100
	78*.
	;
	run;
	
/*Retorna o primeiro valor não nulo ou não vazio.*/
data funcao_coalesce;
	set numeros;
	valor_escolhido_nr = coalesce(nr1,nr2);
run;


/*Retorna o texto de uma palavra através de uma posição inicial e seu tamanho esperado.*/
data funcao_substr;
	texto = "07.02.0xx.000xxxxx5/18";
	funcao_substr = substr(texto,11,10);
	miolo_dossie = input(funcao_substr,10.);
run;

data funcao_compress;
	texto = "abcd12 3.478 .789/111";
	compress1 = compress(texto);
	compress2 = compress(texto,'.');
	compress3 = compress(texto,' ./');
	compress4 = compress(texto,' ./','a');
run;


/*Combinação de funções - 2 caracteres depois da barra*/
data textos;
	input textos $1-20;
	datalines;
	1245/12
	1546/115456456
	785456/19
	48/1478979879878789789
	;
	run;

data caracteres_barra;
	set textos;
	nr = substr(textos,find(textos,'/')+1,2);
run;

data nomes;
	input nomes $1-30;
	datalines;
	Da 1silva, joao
	da co00sta, maria
	de freitas,luiz
	dias0000454000,gilberto
	olivei10ra,marcos77
	;
	run;
	
data trata_nomes;
	set nomes;
	tamanho =  length(nomes);
	final_virgula = find(nomes,',')+1;
	nome_apos_virgula = compress(substr(nomes,final_virgula,(tamanho-final_virgula)+1),,'d');
	sobrenome = compress(substr(nomes,1,final_virgula-2),,'d');
	nome_tratado = propcase(cat(strip(nome_apos_virgula),strip(sobrenome)));
run;



	
