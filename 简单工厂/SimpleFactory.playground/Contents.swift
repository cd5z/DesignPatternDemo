//: Playground - noun: a place where people can play

import UIKit

//MARK: Simple Factory

protocol Operation {
    var numberA: Double {set get}
    var numberB: Double {set get}
    
    func getResult()->Double
}

struct OperationAdd: Operation {
    var numberA = 0.0
    var numberB = 0.0
    
    func getResult() -> Double {
        return numberA + numberB
    }
}


struct OperationSub: Operation {
    var numberA = 0.0
    var numberB = 0.0
    
    func getResult() -> Double {
        return numberA - numberB
    }
}

struct OperationMul: Operation {
    var numberA = 0.0
    var numberB = 0.0
    
    func getResult() -> Double {
        return numberA * numberB
    }
}

struct OperationDiv: Operation {
    var numberA = 0.0
    var numberB = 0.0
    
    func getResult() -> Double {
        guard numberB != 0 else { print("除数不能为0"); return 0 }
        return numberA / numberB
    }
}


struct OperationFactory {
    static func creatOperation(operation:String) -> Operation {
        var oper:Operation = OperationAdd()
        switch operation {
        case "+":
            oper = OperationAdd()
        case "-":
            oper = OperationSub()
        case "*":
            oper = OperationMul()
        case "/":
            oper = OperationDiv()
        default:
            return oper
        }
        return oper
    }
}

var oper = OperationFactory.creatOperation("+")
oper.numberA = 1
oper.numberB = 2

let result = oper.getResult()

print(result)






