% mergeSort function
mergeSort([], []).  %an empty list
mergeSort([X], [X]).  %a single list
mergeSort(List, Sorted) :-
    List = [_,_|_],  %list with two elements
    split(List, L1, L2), 
    mergeSort(L1, Sorted1),  %sorting the first half
    mergeSort(L2, Sorted2),  %sorting the second half
    merge(Sorted1, Sorted2, Sorted). 

% split function
split([], [], []). 
split([X], [X], []). 
split([X,Y|Rest], [X|L1], [Y|L2]) :-
    split(Rest, L1, L2).  %recursively spliting the list into two halves.

% merge function
merge([], L, L).  %merging an empty list with any other list results in the other list.
merge(L, [], L).  %merging any list with an empty list results in the other list.
merge([X|L1], [Y|L2], [X|Merged]) :-
    X =< Y,  %if X is less than or equal to Y, X comes first in the merged list.
    merge(L1, [Y|L2], Merged). 
merge([X|L1], [Y|L2], [Y|Merged]) :-
    X > Y,  %if X is greater than Y, Y comes first in the merged list.
    merge([X|L1], L2, Merged).