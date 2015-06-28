% Autor:
% Data: 12/06/2015

:-dynamic at/2.
:-dynamic sala_ocupada/1.
:-dynamic data_show_ligado/1.
:-dynamic computador_ligado/1.
:-dynamic ar_ligado/1.
:-dynamic luzes_ligado/1.
:-dynamic ar_ajustado/1.

at(bruno,rua).
at(aline,rua).
at(john,rua).
at(aura,rua).
aula(aline,a,9,11).  %posso usar numero? no predicado, posso.
aula(bruno,b,11,13).
aula(john,a,14,16).  %em um periodo maior que 1 hora os eletronicos serao desligados.
aula(aura,a,11,13).  %depois da aula da aline vem a aula da aura

%gostos de cada professor.
ar_condicionado(bruno).
data_show(john).
data_show(aline).
data_show(aura).
computador(aline).
computador(bruno).
luzes(bruno).
luzes(john).
luzes(aline).
luzes(aura).

emsala(Professor):- at(Professor,rua),aula(Professor,Sala,_,_),sala_ocupada(Sala),write_ln('sala ocupada'),!.            %se um professor estiver em sala, outro não pode entrar!
emsala(Professor):- at(Professor,rua),aula(Professor,Sala,_,_), write_ln('professor chegou em sala'),retract(at(Professor,rua)),assert(at(Professor,Sala)),assert(sala_ocupada(Sala)),findall(_,prepara_sala(Professor),_).


prepara_sala(X) :-  data_show(X),aula(X,Sala,_,_),prepara_data_show(Sala).                 %se o professor gosta de datashow e ele nao está ligado, liga.
prepara_sala(X) :- ar_condicionado(X),aula(X,Sala,_,_),prepara_ar(Sala).
prepara_sala(X) :- computador(X),aula(X,Sala,_,_),prepara_computador(Sala).
prepara_sala(X) :- aula(X,Sala,_,_),prepara_luzes(Sala).

prepara_data_show(Sala) :- data_show_ligado(Sala),write_ln('data show mantido ligado'),!.
prepara_data_show(Sala) :- not(data_show_ligado(Sala)),write_ln('ligar datashow'), assert(data_show_ligado(Sala)).
prepara_ar(Sala) :- ar_ligado(Sala),write_ln('ar mantido ligado'),!.
prepara_ar(Sala) :- not(ar_ligado(Sala)),write_ln('ligar ar condicionado'), assert(ar_ligado(Sala)).
prepara_computador(Sala) :- computador_ligado(Sala),write_ln('computador mantido ligado'),!.
prepara_computador(Sala) :- not(computador_ligado(Sala)),write_ln('ligar computador'), assert(computador_ligado(Sala)).
prepara_luzes(Sala) :- luzes_ligado(Sala),write_ln('luzes mantidas ligadas'),!.
prepara_luzes(Sala) :- not(luzes_ligado(Sala)),write_ln('ligar as luzes'), assert(luzes_ligado(Sala)).


termino_aula(Professor):- aula(Professor,Sala,_,F),aula(Outro,Sala,F,_),retract(sala_ocupada(Sala)),retract(at(Professor,Sala)),assert(at(Professor,rua)),findall(_,prepara_termino_aula(Outro),_). %se esta sala vai ser usada em breve, prepara_sala para o proximo professor(Y).
%se nao haverá aula em breve, desliga tudo que estiver ligado.
termino_aula(Professor):- aula(Professor,Sala,_,_),retract(sala_ocupada(Sala)),retract(at(Professor,Sala)),assert(at(Professor,rua)),findall(_,desliga_tudo(Sala),_).

%analisa o q pode ser desligado ou mantido ligado conforme o gosto do proximo professor a usar a sala.
prepara_termino_aula(Professor) :- aula(Professor,Sala,_,_),data_show(Professor),prepara_data_show(Sala).
prepara_termino_aula(Professor) :- aula(Professor,Sala,_,_),not(data_show(Professor)),data_show_ligado(Sala),desliga_data_show(Sala).
prepara_termino_aula(Professor) :- aula(Professor,Sala,_,_),ar_condicionado(Professor),prepara_ar(Sala).
prepara_termino_aula(Professor) :- aula(Professor,Sala,_,_),not(ar_condicionado(Professor)),ar_ligado(Sala),desliga_ar(Sala).
prepara_termino_aula(Professor) :- aula(Professor,Sala,_,_),computador(Professor),prepara_computador(Sala).
prepara_termino_aula(Professor) :- aula(Professor,Sala,_,_),not(computador(Professor)),computador_ligado(Sala),desliga_computador(Sala).
prepara_termino_aula(Professor) :- aula(Professor,Sala,_,_),luzes(Professor),prepara_luzes(Sala).
prepara_termino_aula(Professor) :- aula(Professor,Sala,_,_),not(luzes(Professor)),luzes_ligado(Sala),desliga_luzes(Sala).

desliga_tudo(Sala) :- desliga_data_show(Sala).
desliga_tudo(Sala) :- desliga_ar(Sala).
desliga_tudo(Sala) :- desliga_computador(Sala).
desliga_tudo(Sala) :- desliga_luzes(Sala).
desliga_data_show(Sala) :- retract(data_show_ligado(Sala)),assert(data_show_desligado(Sala)),write_ln('desligar data show').
desliga_ar(Sala) :- retract(ar_ligado(Sala)),assert(ar_desligado(Sala)),write_ln('desligar ar').
desliga_computador(Sala) :- retract(computador_ligado(Sala)),assert(computador_desligado(Sala)),write_ln('desligar computador').
desliga_luzes(Sala) :- retract(luzes_ligado(Sala)),assert(luzes_desligado(Sala)),write_ln('desligar luzes').