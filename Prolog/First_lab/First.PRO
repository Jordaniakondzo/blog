% ФИО: Акондзо Жордани Лади Гаэл
% Группа : НКНбд-01-21
% Вариант 9

% комплектующее: (id, название, тип, марка, дата производства)

% Facts about components
component(component1, motherboard, type1, brand1, '2021-01-01').
component(component2, cpu, type2, brand2, '2021-02-01').
component(component3, ram, type3, brand3, '2021-03-01').
component(component4, storage, type4, brand4, '2021-04-01').
component(component5, power_supply, type5, brand5, '2021-05-01').

% Facts about connection interfaces
connection_interface(component1, interface1).
connection_interface(component2, interface2).
connection_interface(component3, interface3).
connection_interface(component4, interface4).
connection_interface(component5, interface5).

% Facts about slots
slots(component1, interface1).
slots(component2, interface2).
slots(component3, interface3).
slots(component4, interface4).
slots(component5, interface5).

% Facts about products
product(component1, 200).
product(component2, 300).
product(component3, 100).
product(component4, 150).
product(component5, 80).

