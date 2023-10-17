import WidgetKit
import SwiftUI
import AppIntents

struct EuropeView : View {
    @Environment(\.widgetFamily) var family
    
    var entry: ClockEntry
    
    var body: some View {
        Grid(verticalSpacing: 8) {
            if family == .systemSmall {
                GridRow {
                    Text(entry.date.emoji(in: TimeZone.universalAbbr)).contentTransition(.identity)
                    Text(entry.date.emoji(in: TimeZone.centralEuropeAbbr)).contentTransition(.identity)
                    Text(entry.date.emoji(in: TimeZone.easternEuropeAbbr)).contentTransition(.identity)
                }
                
                GridRow {
                    Text(entry.date.hour12(in: TimeZone.universalAbbr)).contentTransition(.identity)
                    Text(entry.date.hour12(in: TimeZone.centralEuropeAbbr)).contentTransition(.identity)
                    Text(entry.date.hour12(in: TimeZone.easternEuropeAbbr)).contentTransition(.identity)
                }.font(.caption).foregroundStyle(.secondary)
            }
            GridRow {
                Text(entry.date.time24(in: TimeZone.universalAbbr)).lineLimit(1).contentTransition(.identity)
                Text(entry.date.time24(in: TimeZone.centralEuropeAbbr)).lineLimit(1).contentTransition(.identity)
                Text(entry.date.time24(in: TimeZone.easternEuropeAbbr)).lineLimit(1).contentTransition(.identity)
            }.font(.footnote)
            GridRow {
                Text(TimeZone.universalAbbr).contentTransition(.identity)
                Text(TimeZone.centralEuropeAbbr).contentTransition(.identity)
                Text(TimeZone.easternEuropeAbbr).contentTransition(.identity)
            }.font(.caption).foregroundStyle(.secondary)
        }
    }
}

struct EuropeWidget: Widget {
    let kind: String = "EuropeWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
                    if #available(iOS 17.0, *) {
                        EuropeView(entry: entry)
                            .containerBackground(.fill.tertiary, for: .widget)
                    } else {
                        EuropeView(entry: entry)
                            .padding()
                            .background()
                    }
                }
        .supportedFamilies([.systemSmall, .accessoryRectangular])
        .configurationDisplayName("Europe")
        .description("Time in common Europe time zones")
    }
}

#Preview(as: .systemSmall) {
    EuropeWidget()
} timeline: {
    ClockEntry(date: .now)
    ClockEntry(date: Calendar.current.date(byAdding: .hour, value: 1, to: Date())!)
    ClockEntry(date: Calendar.current.date(byAdding: .hour, value: 6, to: Date())!)
    ClockEntry(date: Calendar.current.date(byAdding: .hour, value: 12, to: Date())!)
}
