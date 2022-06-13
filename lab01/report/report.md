---
## Front matter
title: "Очёта по лабораторной работе №1"
subtitle: "НКНбд-02-21"
author: "Акондзо Жордани Лади Гаэл"

## Generic otions
lang: ru-RU
toc-title: "Содержание"

## Bibliography
bibliography: bib/cite.bib
csl: pandoc/csl/gost-r-7-0-5-2008-numeric.csl

## Pdf output format
toc: true # Table of contents
toc-depth: 2
lof: true # List of figures
fontsize: 12pt
linestretch: 1.5
papersize: a4
documentclass: scrreprt
## I18n polyglossia
polyglossia-lang:
  name: russian
  options:
	- spelling=modern
	- babelshorthands=true
polyglossia-otherlangs:
  name: english
## I18n babel
babel-lang: russian
babel-otherlangs: english
## Fonts
mainfont: PT Serif
romanfont: PT Serif
sansfont: PT Sans
monofont: PT Mono
mainfontoptions: Ligatures=TeX
romanfontoptions: Ligatures=TeX
sansfontoptions: Ligatures=TeX,Scale=MatchLowercase
monofontoptions: Scale=MatchLowercase,Scale=0.9
## Biblatex
biblatex: true
biblio-style: "gost-numeric"
biblatexoptions:
  - parentracker=true
  - backend=biber
  - hyperref=auto
  - language=auto
  - autolang=other*
  - citestyle=gost-numeric
## Pandoc-crossref LaTeX customization
figureTitle: "Рис."
listingTitle: "Листинг"
lofTitle: "Список иллюстраций"
lolTitle: "Листинги"
## Misc options
indent: true
header-includes:
  - \usepackage{indentfirst}
  - \usepackage{float} # keep figures where there are in the text
  - \floatplacement{figure}{H} # keep figures where there are in the text
---

# Цель работы

Цель данного работы --- Целью данной работы является приобретение практических навыков установки операционной системы на виртуальную машину, настройки минимально необходимых для дальнейшей работы сервисов.

# Задание

1. Версия ядра Linux (Linux version).

2. Частота процессора (Detected Mhz processor).

3. Модель процессора (CPU0).

4. Объем доступной оперативной памяти (Memory available).

5. Тип обнаруженного гипервизора (Hypervisor detected).

6. Тип файловой системы корневого раздела.

7. Последовательность монтирования файловых систем.

# Ход работы

1. Окно «Свойства» VirtualBox.(рис. [-@fig:001])

![Окно «Свойства» VirtualBox](image/01.png){ #fig:001 width=70% }

2. Создайте новую виртуальную машину :

  - Для этого в VirtualBox выберите Машина Создать. Указал имя виртуальной машины (ваш логин в дисплейном классе), тип операционной системы — Linux, Fedora. (рис. [-@fig:002])
  
  - Указал размер основной памяти виртуальной машины — от 2048 МБ и задал конфигурацию жёсткого диска — загрузочный, VDI (BirtualBox Disk Image), динамический виртуальный диск.  (рис. [-@fig:003])
  
  - Задал размер диска — 80 ГБ (или больше), его расположение — в данном случае /var/tmp/имя_пользователя/fedora.vdi. (рис. [-@fig:004])

![Окно «Имя машины и тип ОС» ](image/02.png){ #fig:002 width=70% }

![Окно «Размер основной памяти, динамический виртуальный диск и жёсткий диск»](image/03.png){ #fig:003 width=70% }

![Окно определения размера виртуального динамического жёсткого диска и его расположения](image/04.png){ #fig:004 width=70% }

  - Окно «Носители» виртуальной машины: выбор образа оптического диска. (рис. [-@fig:005])

![Окно «Носители» виртуальной машины: выбор образа оптического диска](image/05.png){ #fig:005 width=70% }

  - Запустите виртуальную машину, выберите язык интерфейса и перейдите к настройкам установки операционной системы. (рис. [-@fig:006], [-@fig:007])
  
![Окно для выбора язык](image/06.png){ #fig:006 width=70% }

![Окно настройки установки образа ОС](image/07.png){ #fig:007 width=70% }

  - Место установки ОС оставьте без изменения. (рис. [-@fig:008])
  
![Окно настройки установки: место установки](image/08.png){ #fig:008 width=70% }

  - После завершения установки операционной системы корректно перезапустите виртуальную машину. Установите имя и пароль для пользователя. (рис. [-@fig:009], [-@fig:010], [-@fig:011])
  
![Окно конфигурации пользователей](image/09.png){ #fig:009 width=70% }

![Окно конфигурации администратора](image/10.png){ #fig:010 width=70% }

![Установка пароля для пользователя](image/11.png){ #fig:011 width=70% }

  - Войдите в ОС под заданной вами при установке учётной записью. В меню Устройства виртуальной машины подключите образ диска дополнений гостевой ОС, при необходимости введите пароль пользователя root вашей виртуальной ОС. (рис. [-@fig:012])

![Подключение образа диска дополнений гостевой ОС](image/12.png){ #fig:012 width=70% }

3. Получите следующую информацию: 

  - Версия ядра Linux (Linux version). (рис. [-@fig:013])
  
  ![Версия ядра Linux](image/13.png){ #fig:013 width=70% }
  
  - Частота процессора (Detected Mhz processor). (рис. [-@fig:014])
  
  ![Частота процессора](image/14.png){ #fig:014 width=70% }
  
  - Модель процессора (CPU0). (рис. [-@fig:015])
  
  ![Модель процессора](image/15.png){ #fig:015 width=70% }
  
  - Объем доступной оперативной памяти (Memory available). (рис. [-@fig:016])
  
  ![Объем доступной оперативной памяти](image/16.png){ #fig:016 width=70% }
  
  - Тип обнаруженного гипервизора (Hypervisor detected). (рис. [-@fig:017])
  
  ![Тип обнаруженного гипервизора](image/17.png){ #fig:017 width=70% }
  
  - Тип файловой системы корневого раздела. (рис. [-@fig:018])
  
  ![Тип файловой системы корневого раздела](image/18.png){ #fig:018 width=70% }
  
  - Последовательность монтирования файловых систем. (рис. [-@fig:019])
  
  ![Последовательность монтирования файловых систем](image/19.png){ #fig:019 width=70% }

# Выводы

Во время выполнения работы, мы приобрели практических навыков установки операционной системы на виртуальную машину, настройки минимально необходимых для дальнейшей работы сервисов.

::: {#refs}
:::
