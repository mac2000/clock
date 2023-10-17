import WidgetKit
import SwiftUI
import AppIntents

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> ClockEntry {
        ClockEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (ClockEntry) -> ()) {
        completion(ClockEntry(date: Date()))
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<ClockEntry>) -> ()) {
        var entries: [ClockEntry] = []

        let currentDate = Date()
        let hour = Calendar.current.component(.hour, from: currentDate)
        let minute = Calendar.current.component(.minute, from: currentDate)
        let currentMinute = Calendar.current.date(bySettingHour: hour, minute: minute, second: 0, of: currentDate)!
        
        for offset in 0 ..< 10 {
            let entryDate = Calendar.current.date(byAdding: .minute, value: offset, to: currentMinute)!
            let entry = ClockEntry(date: entryDate)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct ClockEntry: TimelineEntry {
    let date: Date
}

struct ClockView : View {
    var entry: ClockEntry
    
    var body: some View {
        HStack(spacing: 0) {
            
            VStack {
                Spacer()
                Text(entry.date.emoji(in: TimeZone.pacificAbbr)).contentTransition(.identity)
                Text(entry.date.hour12(in: TimeZone.pacificAbbr)).font(.footnote).foregroundStyle(.secondary).contentTransition(.identity)
                Spacer()
                Text(entry.date.time24(in: TimeZone.pacificAbbr)).fontWeight(.medium).minimumScaleFactor(0.6).lineLimit(1).contentTransition(.identity)
                Spacer()
                Text(TimeZone.pacificAbbr).font(.footnote).contentTransition(.identity)
                Text(TimeZone.pacificOffset).font(.footnote).foregroundStyle(.secondary).offset(x:-2).contentTransition(.identity)
                Spacer()
            }.frame(maxWidth: .infinity)
            
            VStack {
                Spacer()
                Text(entry.date.emoji(in: TimeZone.centralAbbr)).contentTransition(.identity)
                Text(entry.date.hour12(in: TimeZone.centralAbbr)).font(.footnote).foregroundStyle(.secondary).contentTransition(.identity)
                Spacer()
                Text(entry.date.time24(in: TimeZone.centralAbbr)).fontWeight(.medium).minimumScaleFactor(0.6).lineLimit(1).contentTransition(.identity)
                Spacer()
                Text(TimeZone.centralAbbr).font(.footnote).contentTransition(.identity)
                Text(TimeZone.centralOffset).font(.footnote).foregroundStyle(.secondary).offset(x:-2).contentTransition(.identity)
                Spacer()
            }.frame(maxWidth: .infinity).background(.tertiary.opacity(0.3)).cornerRadius(12)
            
            VStack {
                Spacer()
                Text(entry.date.emoji(in: TimeZone.easternAbbr)).contentTransition(.identity)
                Text(entry.date.hour12(in: TimeZone.easternAbbr)).font(.footnote).foregroundStyle(.secondary).contentTransition(.identity)
                Spacer()
                Text(entry.date.time24(in: TimeZone.easternAbbr)).fontWeight(.medium).minimumScaleFactor(0.6).lineLimit(1).contentTransition(.identity)
                Spacer()
                Text(TimeZone.easternAbbr).font(.footnote).contentTransition(.identity)
                Text(TimeZone.easternOffset).font(.footnote).foregroundStyle(.secondary).offset(x:-2).contentTransition(.identity)
                Spacer()
            }.frame(maxWidth: .infinity)
            
            
            VStack {
                Spacer()
                Text(entry.date.emoji(in: TimeZone.universalAbbr)).contentTransition(.identity)
                Text(entry.date.hour12(in: TimeZone.universalAbbr)).font(.footnote).foregroundStyle(.primary).opacity(0.7).contentTransition(.identity)
                Spacer()
                Text(entry.date.time24(in: TimeZone.universalAbbr)).fontWeight(.medium).minimumScaleFactor(0.6).lineLimit(1).contentTransition(.identity)
                Spacer()
                Text(TimeZone.universalAbbr).font(.footnote).fontWeight(.medium).contentTransition(.identity)
                Text(TimeZone.universalOffset).font(.footnote).foregroundStyle(.primary).opacity(0.7).contentTransition(.identity)
                Spacer()
            }.frame(maxWidth: .infinity).background(.secondary.opacity(0.3)).clipShape(UnevenRoundedRectangle(topLeadingRadius: 12, bottomLeadingRadius: 12))
            
            VStack {
                Spacer()
                Text(entry.date.emoji(in: TimeZone.centralEuropeAbbr)).contentTransition(.identity)
                Text(entry.date.hour12(in: TimeZone.centralEuropeAbbr)).font(.footnote).foregroundStyle(.secondary).contentTransition(.identity)
                Spacer()
                Text(entry.date.time24(in: TimeZone.centralEuropeAbbr)).fontWeight(.medium).minimumScaleFactor(0.6).lineLimit(1).contentTransition(.identity)
                Spacer()
                Text(TimeZone.centralEuropeAbbr).font(.footnote).contentTransition(.identity)
                Text(TimeZone.centralEuropeOffset).font(.footnote).foregroundStyle(.secondary).offset(x:-2).contentTransition(.identity)
                Spacer()
            }.frame(maxWidth: .infinity).background(.tertiary.opacity(0.3)).clipShape(UnevenRoundedRectangle(bottomTrailingRadius: 12, topTrailingRadius: 12))
            
            VStack {
                Spacer()
                Text(entry.date.emoji(in: TimeZone.easternEuropeAbbr)).contentTransition(.identity)
                Text(entry.date.hour12(in: TimeZone.easternEuropeAbbr)).font(.footnote).foregroundStyle(.secondary).contentTransition(.identity)
                Spacer()
                Text(entry.date.time24(in: TimeZone.easternEuropeAbbr)).fontWeight(.medium).minimumScaleFactor(0.6).lineLimit(1).contentTransition(.identity)
                Spacer()
                Text(TimeZone.easternEuropeAbbr).font(.footnote).contentTransition(.identity)
                Text(TimeZone.easternEuropeOffset).font(.footnote).foregroundStyle(.secondary).offset(x:-2).contentTransition(.identity)
                Spacer()
            }.frame(maxWidth: .infinity)
            
        }.frame(maxWidth: .infinity)
    }
}

struct ClockWidget: Widget {
    let kind: String = "ClockWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
                    if #available(iOS 17.0, *) {
                        ClockView(entry: entry)
                            .containerBackground(.fill.tertiary, for: .widget)
                    } else {
                        ClockView(entry: entry)
                            .padding()
                            .background()
                    }
                }
        .supportedFamilies([.systemMedium])
        .configurationDisplayName("Common")
        .description("Time in common time zones")
    }
}

#Preview(as: .systemMedium) {
    ClockWidget()
} timeline: {
    ClockEntry(date: .now)
    ClockEntry(date: Calendar.current.date(byAdding: .hour, value: 1, to: Date())!)
    ClockEntry(date: Calendar.current.date(byAdding: .hour, value: 6, to: Date())!)
    ClockEntry(date: Calendar.current.date(byAdding: .hour, value: 12, to: Date())!)
}
