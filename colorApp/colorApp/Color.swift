import UIKit

class Color: Equatable {
    static func == (lhs: Color, rhs: Color) -> Bool {
        lhs.red == rhs.red && lhs.green == rhs.green && lhs.blue == rhs.blue && lhs.alpha == rhs.alpha
    }
    
    var red: CGFloat
    var green: CGFloat
    var blue: CGFloat
    var alpha:CGFloat
    
    init(red: Float, green: Float, blue: Float, alpha: Float) {
        self.red = CGFloat(red)
        self.green = CGFloat(green)
        self.blue = CGFloat(blue)
        self.alpha = CGFloat(alpha)
    }
    
    func setRed(red: Float) {
        self.red = CGFloat(red)
    }
    
    func setGreen(green: Float) {
        self.green = CGFloat(green)
    }
    
    func setBlue(blue: Float) {
        self.blue = CGFloat(blue)
    }
    
    func getColor() -> UIColor {
        let color = UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1.0)
        return color
    }
    
    func getValueRed() -> String {
        let valueRed = "\(Int(round(red)))"
        return valueRed
    }
    
    func getValueGreen() -> String {
        let valueGreen = "\(Int(round(green)))"
        return valueGreen
    }
    
    func getValueBlue() -> String {
        let valueBlue = "\(Int(round(blue)))"
        return valueBlue
    }
}
