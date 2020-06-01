//
//  Extensions.swift
//  LSNFC
//
//  Created by lhs7248 on 2020/5/21.
//  Copyright © 2020 lhs7248. All rights reserved.
//

import Foundation

public extension Date {
    func toString(dateStyle: DateFormatter.Style = .full, timeStyle: DateFormatter.Style = .none) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = dateStyle
        formatter.timeZone = TimeZone(identifier: "Asia/Tokyo")
        formatter.timeStyle = timeStyle
        return formatter.string(from: self)
    }
}

public extension Optional where Wrapped == Date {
    func toString(dateStyle: DateFormatter.Style = .full, timeStyle: DateFormatter.Style = .none) -> String? {
        return self?.toString(dateStyle: dateStyle, timeStyle: timeStyle)
    }
}

public extension UInt8 {
    func toString() -> String {
        var str = String(self, radix: 16).uppercased()
        if str.count == 1 {
            str = "0" + str
        }
        return str
    }
    
    func toHexString() -> String {
        var str = self.toString()
        str = "0x\(str)"
        return str
    }
}

public extension Optional where Wrapped == UInt8 {
    func toHexString() -> String? {
        return self?.toHexString()
    }
}

internal extension UInt8 {
    var data: Data {
        var int8 = self
        return Data(bytes: &int8, count: MemoryLayout<UInt8>.size)
    }
}

public extension UInt16 {
    var data: Data {
        var int16 = self
        return Data(bytes: &int16, count: MemoryLayout<UInt16>.size)
    }
    
    var uint8: [UInt8] {
        return [UInt8(self >> 8), UInt8(self & 0x00ff)]
    }
    
    func toHexString() -> String {
        let bytes = self.uint8
        return "0x" + bytes[0].toString() + bytes[1].toString()
    }
}

public extension String {
    var bytes: [UInt8] {
        var i = self.startIndex
        return (0..<self.count/2).compactMap { _ in
            defer { i = self.index(i, offsetBy: 2) }
            return UInt8(self[i...index(after: i)], radix: 16)
        }
    }
    var hexData: Data {
        return Data(self.bytes)
    }
}

public extension Array {
    func split(count: Int) -> [[Element]] {
        var s: [[Element]] = []
        var i = 0
        while i < self.count {
            var a: [Element] = []
            var j = 0
            while j < count {
                if i < self.count {
                    a.append(self[i])
                }
                i += 1
                j += 1
            }
            s.append(a)
        }
        return s
    }
}

public extension Data {
    var hexString: String {
        return self.map { String(format: "%02X", $0) }.joined()
    }
    

    func toIntReversed(_ startIndex: Int, _ endIndex: Int) -> Int {
         var s = 0
        for (_, i) in (startIndex...endIndex).enumerated() {
             s <<= 8
             s |= Int(self[i]) & 0xFF
        }
        return s
    }
}

public extension Date {
    func stringConvertDate(string:String, dateFormat:String="yyyy-MM-dd HH:mm:ss") -> Date {
            let dateFormatter = DateFormatter.init()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let date = dateFormatter.date(from: string)
            return date!
    }
    func dateConvertString(date:Date, dateFormat:String="yyyy-MM-dd") -> String {
            let timeZone = TimeZone.init(identifier: "UTC")
            let formatter = DateFormatter()
            formatter.timeZone = timeZone
            formatter.locale = Locale.init(identifier: "zh_CN")
            formatter.dateFormat = dateFormat
            let date = formatter.string(from: date)
            return date.components(separatedBy: " ").first!
        
    }
}
