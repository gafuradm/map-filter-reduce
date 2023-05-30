import Foundation
// делаем расширение класса массива
extension Array {
    // добавляем метод mymap который принимает замыкание operation
    func myMap(operation: (Int) -> (Int)) -> [Int] {
        // добавляем новый массив array
        var array = [Int]()
        // происходит итерация по каждому элементу в массиве
        for i in self {
            // результат каждой операции добавляется в массив
            array.append(operation(i as! Int))
        }
        // выводи массив
        return array
    }
}
// объявляем замыкание operation1
let operation1 = {(a: Int) -> Int in
    a * a
}
// выводим на экран результат
print([1, 2, 3, 4, 5].myMap(operation: operation1))
// делаем расширение класса массива
extension Array {
    // добавляем новый метод myfilter
    // метод myreduce принимает замыкание a
    func myFilter(_ a: (Int) -> Bool) -> [Int] {
        // объявляем массив res
        var res = [Int]()
        // производится итерация по элементам массива
        for i in self {
            // и для каждого элемента i проверяется условие выполняется ли a(i)
            // то есть вызывается замыкание a, переданный в функцию myfilter
            if a(i as! Int) {
                // если условие выполняется то i добавляется в массив res
                res.append(i as! Int)
            }
        }
        // возвращаем массив res
        return res
    }
}
// объявляем массив num
let num = [1, 2, 3, 4, 5]
// объявляем константу even myfilter для массива num
// передавая в качестве аргумента замыкание { $0 % 2 == 0 }
let even = num.myFilter { $0 % 2 == 0 }
// выводим на экран переменную even
print(even)
// делаем расширение класса массива
extension Array {
    // добавляем новый метод myreduce
    // метод myreduce принимает a начальное значение и sum - замыкание
    func myReduce(_ a: Int, sum: (Int, Int) -> Int) -> Int {
        var res = a
        // в цикле происходит итерация по элементам массива начиная со значения a.
        for i in self {
            // здесь мы применяем замыкание sum к текущему значению res
            // и текущему элементу массива i который приводится к типу инт
            // и сохраняет результат в переменной res.
            res = sum(res, i as! Int)
        }
        // выводим на экран res
        return res
    }
}
// объявляем массив arr
let arr = [1, 2, 3, 4, 5]
// вызывается у массива arr метод myreduce с начальным значением 0
// и замыканием которое складывает два числа
let sum = arr.myReduce(0) { $0 + $1 }
// выводим на экран константу sum
print(sum)
