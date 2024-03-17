let daysmonths = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31] // кол-во дней в месяцах


let monthsyear = ["Январь", "Февраль", "Март", "Апрель", "Май", "Июнь", "Июль", "Август", "Сентябрь", "Октябрь", "Ноябрь", "Декабрь"] // название месяцов в году


for days in daysmonths {
    print(days)
}                                             // кол-во дней в месяцах


for index in 0..<12 {
    print("\(monthsyear[index]): \(daysmonths[index]) дней")
}                                             // название месяца + количество дней


let monthtuples = [("Январь", 31), ("Февраль", 28), ("Март", 31), ("Апрель", 30), ("Май", 31), ("Июнь", 30), ("Июль", 31), ("Август", 31), ("Сентябрь", 30), ("Октябрь", 31), ("Ноябрь", 30), ("Декабрь", 31)]
                                              // массив кортежей с параметрами: имя месяца, кол-во дней

for tuple in monthtuples {
    print("\(tuple.0): \(tuple.1) дней")
}                                             // кортежи с параметрами: имя месяца, кол-во дней


for index in stride(from: 11, through: 0, by: -1) {
    print(daysmonths[index])
}                                             // количества дней в каждом месяце в обратном порядке


let thatMonth = 6
let thatDay = 15
var allDays = 0
for month in 0..<thatMonth {
    allDays += daysmonths[month]
}
allDays += thatDay

print("До \(thatDay).\(thatMonth+1) - \(allDays) дней")
                                             // количества дней до произвольной даты от начала года
