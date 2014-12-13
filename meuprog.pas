program prog555;
uses crt;
var
opcao:String;
procedure modoastavel;
var
ra,rb,c1,i:real;
op:string;
begin
i:=0;
while i=0 do
begin
clrscr;
writeln('                       î VCC           ');
writeln('             RA        |               ');
writeln('           /\/\/\------|__ _ __ _ _    ');
writeln('          |            |          |    ');
writeln('          |   ||= = = = = = =||   |    ');
writeln('          /---||7      8   4 ||---|    ');
writeln('      RB  \   ||             ||        ');
writeln('          /   ||             ||        ');
writeln('          \---||6    555    3||---SAIDA');
writeln('          |   ||             ||        ');
writeln('          |---||2          5 ||---|    ');
writeln('          |   ||      1      ||   |    ');
writeln('        __|__ ||= = = = = = =|| __|__  ');
writeln('        _____ C1       |        _____  ');
writeln('          |            |          | 10 ');
writeln('          |____________|__________| nf ');
writeln('                     __|__             ');
writeln('                      ___ GND          ');
writeln('                       _               ');
writeln('Digite o valor do capacitor(uF):       ');
readln(c1);
writeln('Digite o valor de RA(k ohms):   ');
readln(ra);
writeln('Digite o valor de RB(k ohms):   ');
readln(rb);
if (ra>=1)and(rb>=1)and(ra<=10000)and (rb<=10000)then
begin
clrscr;
writeln('                  î VCC           ');
writeln('           ',ra:2:1,'    |               ','Frequência é:',1.44/(((ra+(2*rb))*c1)):5:2,'  Khz');
writeln('      /\/\/\------|__ _ __ _ _    ', 'Tempo em nível alto do pulso',(0.693*((ra+rb)*c1)):5:2,'ms');
writeln('     |            |          |    ','Tempo em nivel baixo do pulso',(0.693*rb*c1):5:2,'ms');
writeln('     |   ||= = = = = = =||   |    ','Periodo é:',((0.693*((ra+rb)*c1))+(0.693*rb*c1)):5:2);
writeln('     /---||7      8   4 ||---|    ');
writeln('  ',rb:2:1,'\   ||             ||        ');
writeln('     /   ||             ||        ');
writeln('     \---||6    555    3||---SAIDA');
writeln('     |   ||             ||        ');
writeln('     |---||2          5 ||---|    ');
writeln('     |   ||      1      ||   |    ');
writeln('   __|__ ||= = = = = = =|| __|__  ');
writeln('   _____ ',c1:5:2,'    |        _____  ');
writeln('     |            |          | 10 ');
writeln('     |____________|__________| nf ');
writeln('                __|__             ');
writeln('                 ___ GND          ');
writeln('                  _               ');
writeln('') ;
writeln('Deseja fazer outro?(s/n)');
readln(op);
 if op='s'then
 i:=0 else if op='n'then
 i:=1
 end
 else
 begin
 writeln('valores invalidos');
 writeln('Deseja fazer outro?(s/n)');
readln(op);
 if op='s'then
 i:=0 else if op='n'then
 i:=1
 end;
 end;
end;
procedure modomono;
var
r,c,cont:real;
op:char;
begin
cont:=0;
while cont=0 do
begin
clrscr;
writeln('                       î VCC            ');
writeln('              R        |                ');
writeln('           /\/\/\------|__ _ __ _ _     ');
writeln('           |           |           |    ');
writeln('           |  ||= = = = = = =||    |    ');
writeln('           ---||7      8   4 ||----|    ');
writeln('           |  ||             ||         ');
writeln('           |  ||             ||         ');
writeln('           |--||6    555    3||---SAIDA' );
writeln('           |  ||             ||         ');
writeln('  Disparo--)--||2          5 ||---|     ');
writeln('           |  ||      1      ||   |     ');
writeln('           |  ||= = = = = = =|| __|__   ');
writeln('         __|__         |         _____  ');
writeln('       C _____         |          | 10  ');
writeln('           |___________|__________| nf  ');
writeln('                     __|__              ');
writeln('                      ___ GND           ');
writeln('                       _                ');
writeln('Digite o valor de R(ohm)                ');
readln(r);
writeln('Digite o valor do capacitor(F)          ');
readln(c);
if(r>=10)and(r<=10000)then
begin
clrscr;
writeln('                        î VCC           ');
writeln('     ',r:2:2,'ohm','         |                ');
writeln('           /\/\/\------ |__ _ __ _ _     ');
writeln('           |            |          |    ');
writeln('           |  ||= = = = = = =||    |    ');
writeln('           ---||7      8   4 ||----|    ');
writeln('           |  ||             ||         ');
writeln('           |  ||             ||         ');
writeln('           |--||6   555    3 ||---SAIDA' );
writeln('           |  ||             ||         ');
writeln('  Disparo--)--||2          5 ||---|     ');
writeln('           |  ||      1      ||   |     ');
writeln('           |  ||= = = = = = =|| __|__   ');
writeln('         __|__         |        _____   ');
writeln('    ',c:2:2,'F','_____         |          | 10  ');
writeln('           |___________|__________| nf  ');
writeln('                     __|__              ');
writeln('                      ___ GND           ');
writeln('                       _                ');
writeln('');
writeln('Temporização é:',(1.1*r*c):5:2,'segundos');
writeln('Deseja calcular outro?(s/n)');
readln(op);
if op='s'
then cont:=0 else
cont:=1;
end
else
begin
writeln('valor invalido de resistor');
writeln('Deseja calcular outro?(s/n)');
readln(op);
if op='s'
then cont:=0 else
cont:=1;
end;
end;
end;








begin
opcao:='0';
while opcao<>'3' do
begin
clrscr;
gotoxy(30,26);
writeln('By Skin(D3Iaut2)');
gotoxy(0,0);
writeln('Progama para calculos do multivibrador 555                         Versão 3.0');
gotoxy(4,4);
writeln('               Bem vindo ao menu de opções escolha sua opção:');
writeln('                                                     ');
writeln('                                     |              ');
writeln('                                     |              ');
writeln('                            ||= = = = = = =||       ');
writeln('                         ---||7      8   4 ||---    ');
writeln('                            ||             ||       ');
writeln('                         ---||6            ||       ');
writeln('                            ||    555    3 ||---    ');
writeln('                            ||             ||       ');
writeln('                         ---||2          5 ||---    ');
writeln('                            ||      1      ||       ');
writeln('                            ||= = = = = = =||       ');
writeln('                                    |               ');
writeln('                                    |               ');
writeln('                                                    ');
writeln('              1-Modo Astável,2-Modo Monoestável,3-fim do programa');
gotoxy(37,21);
readln(opcao);
CASE opcao OF
'1': modoastavel  ;
'2': modomono  ;
'3':break  ;
else
gotoxy(37,22);
writeln('Numero invalido');
delay(500);
END;

end;


end.





