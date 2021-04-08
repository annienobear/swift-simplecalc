print("Welcome to the UW Calculator Playground")

func calculate(_ args: [String]) -> Int {
    switch args.last {
    case "count":
        return args.count - 1
    case "avg":
        if args.count == 1 {return 0}
        var total = 0
        for index in 0...(args.count - 1) {
            total += Int(args[index]) ?? 0
        }
        return total/(args.count - 1)
    case "fact":
        if args.count == 1 {return 0}
        let num = Int(args[0]) ?? 0
        var count = 1
        var total = 1
        while count <= num {
            total *= count
            count += 1
        }
        return total
    default:
        let numA = Int(args[0]) ?? 0
        let numB = Int(args[2]) ?? 0
        switch args[1] {
        case "+":
            return numA + numB
        case "-":
            return numA - numB
        case "*":
            return numA * numB
        case "/":
            return numA / numB
        case "%":
            return numA % numB
        default:
            return -1
        }
    }
}


func calculate(_ arg: String) -> Int {
    let lis = arg.split(separator: " ")
    var input: [String] = []
    for item in lis {
        input.append(String(item))
    }
    return calculate(input)
 }

// -------------------------------------------
// All of these expressions should return true
// if you have implemented calculate() correctly
//
calculate(["2", "+", "2"]) == 4
calculate(["4", "+", "4"]) == 8
calculate(["2", "-", "2"]) == 0
calculate(["2", "*", "2"]) == 4
calculate(["2", "/", "2"]) == 1
calculate(["2", "%", "2"]) == 0

calculate(["1", "2", "3", "count"]) == 3
calculate(["1", "2", "3", "4", "5", "count"]) == 5
calculate(["count"]) == 0

calculate(["1", "2", "3", "4", "5", "avg"]) == 3
    // 15 / 5 = 3
calculate(["2", "2", "4", "4", "avg"]) == 3
    // 12 / 4 = 3
calculate(["2", "avg"]) == 2
    // 2 / 1 = 2
calculate(["avg"]) == 0
    // 0 / 0 = 0 (not really, but it's an edge case

calculate(["0", "fact"]) == 1
calculate(["1", "fact"]) == 1
calculate(["2", "fact"]) == 2 // 2*1
calculate(["5", "fact"]) == 120 // 5*4*3*2*1
calculate(["fact"]) == 0

calculate("2 + 2") == 4
calculate("2 * 2") == 4
calculate("2 - 2") == 0
calculate("2 / 2") == 1

calculate("1 2 3 4 5 count") == 5
calculate("1 2 3 4 5 avg") == 3
calculate("5 fact") == 120

// -------------------------------------------
// These are extra credit tests; commented out
// uncomment them to turn them on for evaluation

// Implement calculate([String]) and calculate(String)
// to handle negative numbers

calculate(["2", "+", "-2"]) == 0
calculate(["2", "-", "-2"]) == 4
calculate(["2", "*", "-2"]) == -4
calculate(["2", "/", "-2"]) == -1
calculate(["-5", "%", "2"]) == -1

calculate(["1", "-2", "3", "-2", "5", "avg"]) == 1

calculate("2 + -2") == 0
calculate("2 * -2") == -4
calculate("2 - -2") == 4
calculate("-2 / 2") == -1

calculate("1 -2 3 -4 5 count") == 5

 
// Implement calculate([String]) and calculate(String)
// to use floating-point values


func calculate(_ args: [String]) -> Double {
    switch args.last {
    case "count":
        return Double(args.count - 1)
    case "avg":
        if Double(args.count) == 1.0 {return 0.0}
        var total = 0.0
        for index in 0...(args.count - 1) {
            total += Double(args[index]) ?? 0
        }
        return total/Double((args.count - 1))
    case "fact":
        if Double(args.count) == 1.0 {return 0.0}
        let num = Double(args[0]) ?? 0
        var count = 1.0
        var total = 1.0
        while count <= num {
            total *= count
            count += 1.0
        }
        return total
    default:
        let numA = Double(args[0]) ?? 0
        let numB = Double(args[2]) ?? 0
        switch args[1] {
        case "+":
            return numA + numB
        case "-":
            return numA - numB
        case "*":
            return numA * numB
        case "/":
            return numA / numB
        case "%":
            return numA.truncatingRemainder(dividingBy: numB)
        default:
            return -1
        }
    }
}
func calculate(_ arg: String) -> Double {
    let lis = arg.split(separator: " ")
    var input: [String] = []
    for item in lis {
        input.append(String(item))
    }
    return calculate(input)
}

calculate(["2.0", "+", "2.0"]) == 4.0
calculate([".5", "+", "1.5"]) == 2.0
calculate(["12.0", "-", "12.0"]) == 0.0
calculate(["2.5", "*", "2.5"]) == 6.25
calculate(["2.0", "/", "2.0"]) == 1.0
calculate(["2.0", "%", "2.0"]) == 0.0
calculate("1.0 2.0 3.0 4.0 5.0 count") == 5
