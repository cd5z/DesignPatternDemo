//: Playground - noun: a place where people can play

import UIKit

//MARK: Simple Factory

class Operation {
    var numberA = 0.0
    var numberB = 0.0
    
    func getResult()->Double{
        let result:Double = 0.0
        return result
    }
    
    
}

class OperationAdd: Operation {
    override func getResult() -> Double {
        return numberA + numberB
    }
}


class OperationSub: Operation {
    override func getResult() -> Double {
        return numberA - numberB
    }
}

class OperationMul: Operation {
    override func getResult() -> Double {
        return numberA * numberB
    }
}

class OperationDiv: Operation {
    override func getResult() -> Double {
        guard numberB != 0 else { print("除数不能为0"); return 0 }
        return numberA / numberB
    }
}


class OperationFactory {
    class func creatOperation(operation:String) -> Operation {
        var oper:Operation = Operation()
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

let oper = OperationFactory.creatOperation("+")

oper.numberA = 1
oper.numberB = 2

let result = oper.getResult()

print(result)






