import SwiftUI

struct ZoneView: View {
    var date: Date
    var abbr: String
    var offset: String
    
    var color: Color {
        abbr == "CDT" || abbr == "CST" || abbr == "CET" || abbr == "CEST" ? Color.primary : Color.secondary
    }
    
    var body: some View {
        GridRow {
            Text(date.emoji(in: abbr)).contentTransition(.identity)
            Text(abbr).font(.none).foregroundStyle(color).contentTransition(.identity)
            Text(date.time24(in: abbr)).font(.largeTitle).lineLimit(1).contentTransition(.identity)
            VStack(alignment: .trailing) {
                Text(date.hour12(in: abbr)).font(.callout).contentTransition(.identity)
                Text(offset).font(.footnote).contentTransition(.identity)
            }.foregroundStyle(color)
            Text(country(abbr))
        }
    }
    
    func country(_ abbr: String) -> String {
        switch abbr {
        case TimeZone.pacificAbbr, TimeZone.centralAbbr, TimeZone.easternAbbr:
            return "🇺🇸"
        default:
            return "🇪🇺"
        }
    }
}

struct ZonesView: View {
    var body: some View {
        TimelineView(.everyMinute) { context in
            ScrollView {
                Text("Time Zones").font(.largeTitle).padding()
                Grid {
                    ZoneView(date: Date(), abbr: TimeZone.pacificAbbr, offset: TimeZone.pacificOffset)
                    Divider()
                    ZoneView(date: Date(), abbr: TimeZone.centralAbbr, offset: TimeZone.centralOffset)
                    Divider()
                    ZoneView(date: Date(), abbr: TimeZone.easternAbbr, offset: TimeZone.easternOffset)
                    Divider()
                    ZoneView(date: Date(), abbr: TimeZone.universalAbbr, offset: TimeZone.universalOffset)
                    Divider()
                    ZoneView(date: Date(), abbr: TimeZone.centralEuropeAbbr, offset: TimeZone.centralEuropeOffset)
                    Divider()
                    ZoneView(date: Date(), abbr: TimeZone.easternEuropeAbbr, offset: TimeZone.easternEuropeOffset)
                }
            
                
                HStack(alignment: .top) {
                    VStack {
                        Image(systemName: "moon").font(.title3)
                        VStack(alignment: .leading) {
                            Text("00")
                            Text("12 am")
                        }.padding(4).background(.tertiary).clipShape(UnevenRoundedRectangle(bottomTrailingRadius: 8, topTrailingRadius: 8))
                    }
                    VStack {
                        Image(systemName: "sunrise").font(.title3)
                        VStack {
                            Text("01:00 - 11:00")
                            Text("1 - 11 am")
                        }.padding(4)
                    }
                    VStack {
                        Image(systemName: "sun.max").font(.title3)
                        VStack {
                            Text("12:00")
                            Text("12 pm")
                        }.padding(4).background(.tertiary).clipShape(RoundedRectangle(cornerSize: CGSize(width: 8, height: 8)))
                    }
                    VStack {
                        Image(systemName: "sunset").font(.title3)
                        VStack {
                            Text("13:00 - 23:00")
                            Text("1 - 11 pm")
                        }.padding(4)
                    }
                    VStack {
                        Image(systemName: "moon").font(.title3)
                        VStack(alignment: .trailing) {
                            Text("24")
                            Text("12 am")
                        }.padding(4).background(.tertiary).clipShape(UnevenRoundedRectangle(topLeadingRadius: 8, bottomLeadingRadius: 8))
                    }
                }.font(.footnote).padding(.top, 30)
            }
        }
    }
}


#Preview {
    ZonesView()
}
