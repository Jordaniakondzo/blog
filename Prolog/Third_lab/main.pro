% Copyright

implement main
    open core, stdio, file

domains
    componentType = cpu; gpu; ram; motherboard; storage; powerSupply.
    brand = intel; amd; nvidia; asus; corsair; samsung.

class facts - componentsDB
    component : (integer Identifier, string Name, componentType Type, brand Brand, string ProductionDate) nondeterm.
    connectionInterface : (integer Component, string Interface) nondeterm.
    slots : (integer Component, string Slot) nondeterm.
    product : (integer Component, real Price) nondeterm.
    member : (integer Component, integer* ComponentList) nondeterm.

class predicates
    availableComponents : (componentType Type) nondeterm.
clauses
    availableComponents(Type) :-
        component(Identifier, Name, Type, Brand, ProductionDate),
        writef("Component: % (ID: %) - %, %, Produced: %\n", Name, Identifier, Type, Brand, ProductionDate).

class predicates
    totalCostOfPC : (integer* ComponentList) -> real TotalCost.
clauses
    totalCostOfPC(ComponentList) = TotalCost :-
        Prices =
            [ Price ||
                member(Component, ComponentList),
                product(Component, Price)
            ],
        TotalCost = sum(Prices).

class predicates
    sum : (real* Numbers) -> real Sum.
clauses
    sum([]) = 0.
    sum([Head | Tail]) = Sum :-
        Sum = Head + sum(Tail).

class predicates
    minMaxAvg : (real* Numbers, real Min, real Max, real Avg).
clauses
    minMaxAvg(Numbers, Min, Max, Avg) :-
        Min = min(Numbers),
        Max = max(Numbers),
        Avg = sum(Numbers) / list::length(Numbers).

class predicates
    min : (real* Numbers) -> real Min.
clauses
    min([Head | Tail]) = Min :-
        Min = list::foldl(min_, Tail, Head).

class predicates
    max : (real* Numbers) -> real Max.
clauses
    max([Head | Tail]) = Max :-
        Max = list::foldl(max_, Tail, Head).

class predicates
    min_ : (real A, real B) -> real Min.
clauses
    min_(A, B) = Min :-
        Min = if A < B then A else B end if.

class predicates
    max_ : (real A, real B) -> real Max.
clauses
    max_(A, B) = Max :-
        Max = if A > B then A else B end if.

clauses
    run() :-
        write("Welcome to the Computer Components program!\n"),
        fail.

    run() :-
        consult("First.txt", componentsDB),
        fail.

    run() :-
        availableComponents(cpu),
        fail.

    run() :-
        ComponentList = [1, 2, 3, 4, 5, 6],
        TotalCost = totalCostOfPC(ComponentList),
        writef("The cost of the finished PC is: %.2f\n", TotalCost),
        fail.

    run() :-
        Prices = [ Price || product(_, Price) ],
        minMaxAvg(Prices, Min, Max, Avg),
        writef("Minimum price: %.2f\n", Min),
        writef("Maximum price: %.2f\n", Max),
        writef("Average price: %.2f\n", Avg),
        fail.

    run() :-
        write("The components are: \n"),
        fail.

    run() :-
        member(1, [1, 2, 3, 4, 5, 6]),
        write("Component 1: Intel Core i7-9700K\n"),
        fail.

    run() :-
        member(2, [1, 2, 3, 4, 5, 6]),
        write("Component 2: NVIDIA GeForce RTX 3080\n"),
        fail.

    run() :-
        member(3, [1, 2, 3, 4, 5, 6]),
        write("Component 3: Corsair Vengeance LPX16GB\n"),
        fail.

    run() :-
        member(4, [1, 2, 3, 4, 5, 6]),
        write("Component 4: ASUS ROG Strix Z390-E\n"),
        fail.

    run() :-
        member(5, [1, 2, 3, 4, 5, 6]),
        write("Component 5: Samsung 970 EVO 1TB\n"),
        fail.

    run() :-
        member(6, [1, 2, 3, 4, 5, 6]),
        write("Component 6: Corsair RM850x\n"),
        fail.

    run().

end implement main

goal
    console::runUtf8(main::run).
