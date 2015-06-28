% Autor:
% Data: 27/06/2015


convidado(colonel_mustard).
convidado(professor_plum).
convidado(miss_scarlett).
convidado(ms_green).
vitima(mr_boddy).

caso(mr_boddy,ms_green).                                       �
caso(ms_green,mr_boddy).
caso(mr_boddy,miss_scarlett).
caso(miss_scarlett,mr_boddy).

casado(professor_plum,ms_green).
casado(ms_green,professor_plum).
rico(mr_boddy).
ambicioso(colonel_mustard).

possiveis_assasinatos(X,Y) :- odeia(X,Y) ; ambiciona(X,Y).
odeia(X,Y):- casado(X,Z),caso(Y,Z).
ambiciona(X,Y) :- ambicioso(X),not(rico(X)),rico(Y).
disposto_a_matar(X,Y) :- ambicioso(X),not(rico(X)),rico(Y).

%solu��o para achar um �nico culpado
matou(X,Y) :- disposto_a_matar(X,Y),possiveis_assasinatos(X,Y).