%Имя: Акондзо Жордани Лади Гаэл
%Группа: НКНбд01-21
%Студ. билет: 1032215649
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
    length : (A*) -> integer N.
    sum_elem : (real* List) -> real Sum.
    min_elem : (real* List) -> real Min.
    max_elem : (real* List) -> real Max.

clauses
    length([]) = 0.
    length([_ | T]) = length(T) + 1.

    sum_elem([]) = 0.
    sum_elem([H | T]) = sum_elem(T) + H.

    min_elem([H | T]) = Min :-
        Min = math::min(H, min_elem(T)).
    min_elem([H]) = H.

    max_elem([H | T]) = Max :-
        Max = math::max(H, max_elem(T)).
    max_elem([H]) = H.

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
        TotalCost = sum_elem(Prices).

class predicates
    numberOfComponents : (componentType Type) -> integer Count.
clauses
    numberOfComponents(Type) = Count :-
        Components = [ Comp || component(Comp, _, Type, _, _) ],
        Count = length(Components).

class predicates
    averagePrice : (componentType Type) -> real AvgPrice.
clauses
    averagePrice(Type) = AvgPrice :-
        Prices =
            [ Price ||
                component(Identifier, _, Type, _, _),
                product(Identifier, Price)
            ],
        TotalPrice = sum_elem(Prices),
        Count = length(Prices),
        AvgPrice = TotalPrice / Count.

class predicates
    minPrice : (componentType Type) -> real MinPrice.
    maxPrice : (componentType Type) -> real MaxPrice.

clauses
    minPrice(Type) = MinPrice :-
        Prices =
            [ Price ||
                component(Identifier, _, Type, _, _),
                product(Identifier, Price)
            ],
        MinPrice = min_elem(Prices).
    maxPrice(Type) = MaxPrice :-
        Prices =
            [ Price ||
                component(Identifier, _, Type, _, _),
                product(Identifier, Price)
            ],
        MaxPrice = max_elem(Prices).

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
        writef("The total cost of the finished PC is: %.2f\n", TotalCost),
        fail.

    run() :-
        CPUCount = numberOfComponents(cpu),
        writef("Number of CPUs: %\n", CPUCount),
        fail.

    run() :-
        MinPrice = minPrice(cpu),
        writef("CPU Min Price: %.2f\n", MinPrice),
        fail.

    run() :-
        MaxPrice = maxPrice(cpu),
        writef("CPU Max Price: %.2f\n", MaxPrice),
        fail.

    run() :-
        CPUAvgPrice = averagePrice(cpu),
        writef("CPU Average Price: %.2f\n", CPUAvgPrice),
        fail.

    run().

end implement main

goal
    console::runUtf8(main::run).
