import UIKit

enum ErrorsList: Error {
    case incorrectMovieName
    case ticketsSoldOut
    case notEnoughTickets(count: Int)
    case notEnoughMoneyInWallet(money: Int)
}

class Ticket: CustomStringConvertible {
    
    let price: Int
    var count: Int
    
    var description: String {
        return ("цена билета: \(price), количество билетов: \(count)")
    }
    
    init(price: Int, count: Int) {
        self.price = price
        self.count = count
    }
}

class CinemaTicketsBox: CustomStringConvertible {
    
    var movieList = [
        "Avengers": Ticket(price: 150, count: 50),
        "The Dark Knight": Ticket(price: 100, count: 10),
        "Spider-man: Far from Home": Ticket(price: 90, count: 0)
    ]
    
    var description: String {
        return ("Список фильмов: \(movieList)")
    }
    
    func showMovieList() {
        print(description)
    }
    
    func ticketSale(movieName movie: String, countTickets ticket: Int) throws -> Ticket {
        guard let position = movieList[movie] else { throw ErrorsList.incorrectMovieName}
        guard position.count > 0 else { throw ErrorsList.ticketsSoldOut}
        guard ticket <= position.count else { throw ErrorsList.notEnoughTickets(count: position.count)}
        guard walletMoney >= (position.price * ticket) else { throw ErrorsList.notEnoughMoneyInWallet(money: (position.price * ticket))}
        
        walletMoney -= (position.price * ticket)
        position.count -= ticket
        movieList[movie] = position
        switch ticket {
        case 1: print("Вы приобрели 1 билет на фильм \(movie). В кошельке осталось \(walletMoney) монет.")
        case 2...4: print("Вы приобрели \(ticket) билета на фильм \(movie). В кошельке осталось \(walletMoney) монет.")
        default: print("Вы приобрели \(ticket) билетов на фильм \(movie). В кошельке осталось \(walletMoney) монет.")
        }
        return movieList[movie]!
    }
}

var marchSchedule = CinemaTicketsBox()

marchSchedule.showMovieList()

var walletMoney = 4000

do {
    try marchSchedule.ticketSale(movieName: "Avengers", countTickets: 10)
} catch ErrorsList.incorrectMovieName {
    print("Данного фильма нет в расписании. Проверьте правильность ввода наименования фильма.")
} catch ErrorsList.ticketsSoldOut {
    print("Извините, но все билеты на данный фильм проданы.")
} catch ErrorsList.notEnoughTickets(let count) {
    print("Извините, но на этот фильм нет такого количества билетов. Всего имеется \(count) билетов.")
} catch ErrorsList.notEnoughMoneyInWallet(let money){
    print("К сожалению у вас в кошельке недостаточно денег. Стоимость составляет \(money) монет.")
}


