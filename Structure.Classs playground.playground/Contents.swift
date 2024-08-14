import UIKit

//삼항 연산자, Ternary Operator

let isMember: Bool = true
//1. if문 사용
if isMember == true {
    print("회원입니다.")
} else {
    print("회원이 아닙니다.")
}

print("-------------------")

//2. 삼항 연산자 사용
print(isMember == true ? "회원입니다" : "회원이 아닙니다.")

let fee = (isMember == true ? 1000: 2000)
print("가격: ", fee)
