import SwiftUI

struct AboutView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Clock Widgets").font(.largeTitle)
                
                Text("I wish to have digital clock widget, with time zone abbreviations, clear separation of a.m. and p.m. and without built in purshases.")
                   
                Text("This app was build exactly for that so give its widget(s) a try.").bold()
                
                Text("Widget(s) in this app are opinionated, so there is nothing to configure and as result it will behave same way everywhere.")
                Text("In case if you want new widget, have ideas or features requests scroll down to contribution section.")
                
                Text("Time Zones").font(.title)
                
                Text("United States 🇺🇸").font(.title2)
                Text("There are four main timze zones in United Stated, despite it actually have all of them from -12 to +12.")
                                
                Text("Winter ❄️").bold()
                HStack {
                    VStack(alignment: .leading) {
                        Text("Pacific Standard Time")
                        Text("Mountain Standard Time")
                        Text("Central Standard Time")
                        Text("Eastern Standard Time")
                    }
                    VStack(alignment: .leading) {
                        Text("PST").bold()
                        Text("MST").bold()
                        Text("CST").bold()
                        Text("EST").bold()
                    }
                    VStack(alignment: .leading) {
                        Text("-8hr")
                        Text("-7hr")
                        Text("-6hr")
                        Text("-5hr")
                    }
                }
                
                Text("Summer ☀️").bold()
                HStack {
                    VStack(alignment: .leading) {
                        Text("Pacific Daylight Time")
                        Text("Mountain Daylight Time")
                        Text("Central Daylight Time")
                        Text("Eastern Daylight Time")
                    }
                    VStack(alignment: .leading) {
                        Text("PDT").bold()
                        Text("MDT").bold()
                        Text("CDT").bold()
                        Text("EDT").bold()
                    }
                    VStack(alignment: .leading) {
                        Text("-7hr")
                        Text("-6hr")
                        Text("-5hr")
                        Text("-4hr")
                    }
                }
                
                
                Text("Europe 🇪🇺").font(.title2)
                Text("Technically Europe is quite small place, so there is not much here 🤷‍♂️")
                
                Text("Winter ❄️").bold()
                HStack {
                    VStack(alignment: .leading) {
                        Text("Central European Time")
                        Text("Eastern European Time")
                    }
                    VStack(alignment: .leading) {
                        Text("CET").bold()
                        Text("EET").bold()
                    }
                    VStack(alignment: .leading) {
                        Text("+1hr")
                        Text("+2hr")
                    }
                }
                
                Text("Summer ☀️").bold()
                HStack {
                    VStack(alignment: .leading) {
                        Text("Central European Summer Time")
                        Text("Eastern European Summer Time")
                    }
                    VStack(alignment: .leading) {
                        Text("CEST").bold()
                        Text("EEST").bold()
                    }
                    VStack(alignment: .leading) {
                        Text("+2hr")
                        Text("+3hr")
                    }
                }
                
                Text("Time zones above used in very first widget as most common ones. Aka you may reveice an invitation to webinar at 2p.m. EST but it will be really rare to receive an invitation to Alaska or China time zone 🤔").foregroundStyle(.secondary)
                
                
                Text("Hour formats").font(.title)
                
                Text("I always forget meaning of AM/PM abbreviations so here is short sample:")
                
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
                }.font(.footnote)
                
                
                Text("Open Source").font(.title)
                
                Link(destination: URL(string: "https://github.com/mac2000/clock")!) { Text("http://github.com/mac200/clock") }

                Text("Sources are published under MIT license. Which means you are free to do whatever you want with this app.")
                
                Text("Contributing").font(.title)
                
                Text("In case you have some ideas and can implement them - just do it 💪")
                Text("For thouse who are not programming but still wish some additions just ping me")
                
                Link(destination: URL(string: "mailto:marchenko.alexandr@gmail.com")!) { Text("marchenko.alexandr@gmail.com") }
                 
                Text("Manifest").font(.title)
                
                VStack(alignment: .leading) {
                    Text("- Keep it Simple")
                    Text("- No app purchases")
                    Text("- No ads")
                    Text("- Allow new widgets")
                }
                
            }.padding()
        }
    }
}

#Preview {
    AboutView()
}
