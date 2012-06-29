coffeescript-spec demo
======================

Пример тестирования классов на CoffeeScript с помощью Spec.

Установка
---------

Устанавливаем Node.js (это JavaScript на сервере).

После установки появляется менеджер пакетов `npm`


Устанавливаем модуль компилирования CoffeeScript `coffee-script`:

    npm install -g coffee-script

Устанавливаем модуль тестирования `jasmine`:

    npm install jasmine-node -g


Папки
-----

Создадим папки `lib` и `spec` - в первой будут классы CoffeeScript
во второй спецификиция класса.


Тестирование
----------------

Для тестирования запускается команда `jasmin-node`:

    jasmine-node --coffee .


Будут найдены все файлы, и если они содержат спецификации - тогда
они будут выполнены.

Параметр `--coffee` - указыает, что файлы будут в формате CoffeeScript - и их надо 
будет компилировать (это будет выполнено "на лету"), далее идёт описание папки
где надо смотреть спецификации - мы указали "." - то есть с текущей папки.


Спецификация
------------


Создадим в папке `spec` файл `ball_spec.coffee`:

    describe "Тестирование Объекта", ->
      it "тест истины", ->
        expect(true).toBeTruthy()



Теперь находясь в папке `spec` выполним тестирование:

    jasmine-node --coffee .


В консоли увидим:

    ...>jasmine-node --coffee .
    .

    Finished in 0.028 seconds
    1 test, 1 assertion, 0 failures


Теперь изменим условие `true` на `false`:

    describe "Тестирование Объекта", ->
      it "тест истины", ->
        expect(false).toBeTruthy()


И опять запустим тест, и на этот раз увидим в консоли:

    ...>jasmine-node --coffee .
    F

    Failures:

      1) тест истины
       Message:
         Expected false to be truthy.
    ...
    Finished in 0.277 seconds
    1 test, 1 assertion, 1 failure


Отметим, что для win машины - автоматически работает подсветка консоли и русский (utf-8) шрифт.

Меняем на:

    describe "Тестирование Объекта", ->
      it "тест истины", ->
        expect(false).toBeFalsy()


И теперь тест проходит.


Формат спецификации
-------------------

Теперь подробнее.

Название файла где описаны спецификации должно оканчиваться на `_spec`,
в нашем примере это - `ball_spec.coffee`. Иначе тест не будет найден.

В файле есть "блоки" - `describe` и `it`.

Первый `describe` - это просто группировочный.

Второй `it` - содержит какой либо тест.

В нашем примере это было:

    expect(true).toBeTruthy()

Здесь:

    expect(...).toBeTruthy()

Это конструкция модуля тестирования Jasmine. Она проверяет
что содержимое expect() - ожидаемо равно некому условию,
в нашем примере - `toBeTruthy()` - то есть булевому значению "истина".

`toBeTruthy` - называется "матчер" (matcher), и есть целый набор для 
выполнения тестирования:

    // The 'toBe' matcher compares with ===
    .toBe(...)
    .not.toBe(true)

    .toEqual(...)

    .toMatch(/bar/)

    .toBeDefined()
    .not.toBeDefined()

    .toBeUndefined()
    .toBeNull()

    .toBeTruthy()
    .toBeFalsy()

    .toContain(...)
    .toBeLessThan(...)
    .toBeGreaterThan(...)


Матчеры можно посмотреть здесь:

* http://pivotal.github.com/jasmine/
* https://github.com/pivotal/jasmine/wiki/Matchers

В CoffeeScript, мы заменям формат JavaScript:

    describe("A spec", function() {
      it("test", function() {
        expect(true).toBeTruthy();
      });
    });

На CoffeeScript:

    describe "A spec", ->
      it "test", ->
        expect(true).toBeTruthy()


При этом кода, чисто математически - становится меньше на 30%, при этом не 
теряя функциональности -- соответственно повышается читаемость.


Автотестирование
----------------

Можно стартовать в режиме ожидания изменения файлов - и по факту изменения 
файлов в папке - прогонять тестирование.


Например для win машины, находясь в папке `spec`:

    start jasmine-node --coffee . --autotest


Консоль будет открыта в новом окне - она прогонит первый тест, и будет ожидать
изменения файлов.

Можем проверить - изменить файл `spec/ball_spec.coffee` - сохранить
и в консоли должен будет запуститься заново тест.

Автотестирование удобно когда идёт разработа "тест-в-начале" - когда пишется
спецификация на функцию/класс - и после этого происходит реализация - то тех пор
пока тест не заработает.

При этом так как при добавлении каждого нового функционала будут прогоняться все
прошлы тесты - то можно гарантировать что работа класса не нарушается после
добавления новых функций.

