:- consult('studentKB').
slot(Day,Slot,Code):-
    day_schedule(Day,L),slot_Number(0,Slot,Day,Code,L).

slot_Number(Acc, Slot, Day, Code, [H|T]):-
	\+member(Code,H),Acc1 is Acc +1,slot_Number(Acc1, Slot, Day, Code, T).
slot_Number(Acc, Acc1, Day, Code, [H|T]):-
	member(Code,H), Acc1 is Acc +1.
slot_Number(_,_,_,[]):-
fail.

sched1(Student, L):-
    setof(slot(Day, Slot, Code),sched2(Day,Student, Code, Slot), L).
sched2(Day,Student, Code, Slot):-
    studies(Student, Code), slot(Day,Slot,Code).
no_clashes(Slots)