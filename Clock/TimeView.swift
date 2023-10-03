import SwiftUI

struct TimeView: View {
    let hours = 0...24
    @State private var hour = 12
    
    let zones = [
        TimeZone.pacificAbbr,
        TimeZone.centralAbbr,
        TimeZone.easternAbbr,
        TimeZone.universalAbbr,
        TimeZone.centralEuropeAbbr,
        TimeZone.easternEuropeAbbr
    ]
    @State private var zone = TimeZone.universalAbbr
    
    func utc() -> Date {
        let date = Date()
        let minute = 0 // Calendar.current.component(.minute, from: date)
        let adjusted = Calendar.current.date(bySettingHour: hour, minute: minute, second: 0, of: date)!
        let zoneOffset = TimeZone(abbreviation: zone)!.secondsFromGMT()
        let utc = Calendar.current.date(byAdding: .second, value: -1*zoneOffset, to: adjusted)!
        return utc
    }
    
    func local() -> Date {
        let date = utc()
        let adjusted = Calendar.current.date(byAdding: .second, value: Calendar.current.timeZone.secondsFromGMT(), to: date)!
        return adjusted
    }
    
    var body: some View {
        VStack(spacing: 36) {
            VStack(spacing: 16) {
                /*
                HStack {
                    Text(utc(), style: .time)
                    Text("UTC")
                }.foregroundStyle(.secondary)
                */
                Text(local(), style: .time).font(.largeTitle)
            }
            VStack {
                HStack {
                    Picker("Hour", selection: $hour) {
                        ForEach(hours, id: \.self) {
                            Text(hourLabel($0))
                        }
                    }
                    Picker("Time Zone", selection: $zone) {
                        ForEach(zones, id: \.self) {
                            Text($0)
                        }
                    }
                }
            }
        }
    }
    
    private func hourLabel(_ hour: Int) -> String {
        return Locale.current.hourCycle == .zeroToEleven || Locale.current.hourCycle == .oneToTwelve
            ? "\(hour12(hour)) - \(hour24(hour))"
            : "\(hour24(hour)) - \(hour12(hour))"
    }
    
    private func hour24(_ hour: Int) -> String {
        switch hour {
        case 0...9:
            return "0\(hour):00"
        default:
            return "\(hour):00"
        }
    }
    
    private func hour12(_ hour: Int) -> String {
        switch hour {
        case 0:
            return "12 AM"
        case 1...11:
            return "\(hour) AM"
        case 12:
            return "12 PM"
        case 13...23:
            return "\(hour-12) PM"
        case 24:
            return "12 AM"
        default:
            return ""
        }
    }
}

#Preview {
    TimeView()
}
