import WidgetKit
import SwiftUI
import AppIntents

struct UnitedStatesView : View {
    @Environment(\.widgetFamily) var family
    var entry: ClockEntry
    
    var body: some View {
        Grid(verticalSpacing: 8) {
            if family == .systemSmall {
                GridRow {
                    Text(entry.date.emoji(in: TimeZone.pacificAbbr)).contentTransition(.identity)
                    Text(entry.date.emoji(in: TimeZone.centralAbbr)).contentTransition(.identity)
                    Text(entry.date.emoji(in: TimeZone.easternAbbr)).contentTransition(.identity)
                }
                GridRow {
                    Text(entry.date.hour12(in: TimeZone.pacificAbbr)).contentTransition(.identity)
                    Text(entry.date.hour12(in: TimeZone.centralAbbr)).contentTransition(.identity)
                    Text(entry.date.hour12(in: TimeZone.easternAbbr)).contentTransition(.identity)
                }.font(.caption).foregroundStyle(.secondary)
            }
            GridRow {
                Text(entry.date.time24(in: TimeZone.pacificAbbr)).lineLimit(1).contentTransition(.identity)
                Text(entry.date.time24(in: TimeZone.centralAbbr)).lineLimit(1).contentTransition(.identity)
                Text(entry.date.time24(in: TimeZone.easternAbbr)).lineLimit(1).contentTransition(.identity)
            }.font(.footnote)
            GridRow {
                Text(TimeZone.pacificAbbr).contentTransition(.identity)
                Text(TimeZone.centralAbbr).contentTransition(.identity)
                Text(TimeZone.easternAbbr).contentTransition(.identity)
            }.font(.caption).foregroundStyle(.secondary)
        }
    }
}

struct UnitedStatesWidget: Widget {
    let kind: String = "UnitedStatesWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
                    if #available(iOS 17.0, *) {
                        UnitedStatesView(entry: entry)
                            .containerBackground(.fill.tertiary, for: .widget)
                    } else {
                        UnitedStatesView(entry: entry)
                            .padding()
                            .background()
                    }
                }
        .supportedFamilies([.systemSmall, .accessoryRectangular])
        .configurationDisplayName("United States")
        .description("Time in common America time zones")
    }
}

#Preview(as: .systemSmall) {
    UnitedStatesWidget()
} timeline: {
    ClockEntry(date: .now)
    ClockEntry(date: Calendar.current.date(byAdding: .hour, value: 1, to: Date())!)
    ClockEntry(date: Calendar.current.date(byAdding: .hour, value: 6, to: Date())!)
    ClockEntry(date: Calendar.current.date(byAdding: .hour, value: 12, to: Date())!)
}
