import Foundation

extension DateFormatter {
    func string(for date: Date, in abbr: String) -> String {
        self.timeZone = TimeZone(abbreviation: abbr)
        return self.string(from: date)
    }
    
    static let time24: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter
    }()
    
    static let hour12: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "h a"
        return formatter
    }()
    
    static let hour24: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "H"
        return formatter
    }()
}

extension Date {
    func time24(in abbr: String) -> String {
        DateFormatter.time24.string(for: self, in: abbr)
    }
    
    func hour12(in abbr: String) -> String {
        DateFormatter.hour12.string(for: self, in: abbr)
    }
    
    func hour24(in abbr: String) -> String {
        DateFormatter.hour24.string(for: self, in: abbr)
    }
    
    func emoji(in abbr: String) -> String {
        let hour = Int(self.hour24(in: abbr)) ?? 0
        switch hour {
        case 8..<12: return "☕️"
        case 12..<18: return "☀️"
        case 18..<23: return "🍿"
        default: return "😴"
        }
    }
}

extension TimeZone {
    static let isSummer = TimeZone.current.isDaylightSavingTime()
    
    static let pacificAbbr = isSummer ? "PDT" : "PST"
    static let pacificOffset = isSummer ? "-7hr" : "-8hr"
    
    static let centralAbbr = isSummer ? "CDT" : "CST"
    static let centralOffset = isSummer ? "-5hr" : "-6hr"
    
    static let easternAbbr = isSummer ? "EDT" : "EST"
    static let easternOffset = isSummer ? "-4hr" : "-5hr"
    
    static let universalAbbr = "UTC"
    static let universalOffset = "0hr"
    
    static let centralEuropeAbbr = isSummer ? "CEST" : "CET"
    static let centralEuropeOffset = isSummer ? "+2hr" : "+1hr"
    
    static let easternEuropeAbbr = isSummer ? "EEST" : "EET"
    static let easternEuropeOffset = isSummer ? "+3hr" : "+2hr"
    
}

extension Locale {
    var isTwelveHour: Bool {
        Locale.current.hourCycle == .oneToTwelve || Locale.current.hourCycle == .zeroToEleven
    }
}
