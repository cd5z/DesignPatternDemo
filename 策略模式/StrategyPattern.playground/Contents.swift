//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//基本实现
protocol Strategy {
    func algorithmInterface()
}

class ConcreateStrategyA: Strategy {
    func algorithmInterface() {
        print("算法A实现")
    }
}

class ConcreateStragegyB: Strategy {
    func algorithmInterface() {
        print("算法B实现")
    }
}

class ConcreateStrategyC: Strategy {
    func algorithmInterface() {
        print("算法C实现")
    }
}

class Context {
    var strategy:Strategy
    
    init (strategy: Strategy) {
        self.strategy = strategy
    }
    
    func contextInterface() {
        strategy.algorithmInterface()
    }
}

let context = Context(strategy: ConcreateStrategyA())
context.contextInterface()
// print: "算法A实现"


//收银场景

protocol CashProtocol {
    func acceptCash(money: Double) -> Double
}

//正常收费
class CashNormal: CashProtocol {
    func acceptCash(money: Double) -> Double {
        return money
    }
}

//打折
class CashRebate: CashProtocol {
    private var moneyRebate = 1.0
    init(moneyRebate: Double) {
        self.moneyRebate = moneyRebate
    }
    
    func acceptCash(money: Double) -> Double {
        return money * moneyRebate
    }
}

//返利
class CashReturn: CashProtocol {
    private var moneyCondition = 0.0
    private var moneyReturn = 0.0
    init(moneyCondition: Double, moneyReturn: Double) {
        self.moneyCondition = moneyCondition
        self.moneyReturn = moneyReturn
    }
    
    func acceptCash(money: Double) -> Double {
        var result = money
        if money >= moneyCondition {
            result = money - floor(money / moneyCondition) * moneyReturn
        }
        return result
    }
}

class CashContext {
    var cs:CashProtocol?
    
    init(type: String) {
        switch type {
        case "正常收费":
            cs = CashNormal()
        case "打八折":
            cs = CashRebate(moneyRebate: 0.8)
        case "满300返100":
            cs = CashReturn(moneyCondition: 300, moneyReturn: 100)
        default:
            return
        }
    }
    
    func getResult(money: Double) -> Double {
        return cs!.acceptCash(money)
    }
}


var cashContext = CashContext(type: "打八折")
let totalPrice = cashContext.getResult(10000)
print(totalPrice)

cashContext = CashContext(type: "满300返100")
let totalPrice2 = cashContext.getResult(10000)





