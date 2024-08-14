import UIKit

//함수, 메서드

func sayhello() {
    print("안녕하세요")
    print("반갑습니다")

}

sayhello()

struct Cat {
    let name: String //property
    let age: Int // property
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func cry() { //method
        print("야옹야옹")
    }
}

let 야옹이 = Cat(name: "뚱냥이", age: 5)
야옹이.cry()

// 파라미터, 리턴값
print("--------파라미터(Parameter)---------")
func add(number1: Int, numebr2: Int) -> Int {
    return (number1 + numebr2)
}

let 합 = add(number1: 10, numebr2: 20)
print(합)

print(add(number1: 1, numebr2: 3))

// (10 + 20) + 5
print(add(number1: add(number1: 10, numebr2: 20), numebr2: 5))
