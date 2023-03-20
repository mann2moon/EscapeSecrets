//
//  Home.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 28.02.23.
//

import SwiftUI



struct Home: View {
    
    @State var selectedTab = 1
    @StateObject var jobViewModel: JobListViewModel = JobListViewModel()
    @StateObject var flightViewModel: FlightSearchViewModel = FlightSearchViewModel()
    @StateObject var reiseZieleModel: ReiseAuswahlViewModel = ReiseAuswahlViewModel()
    var body: some View {
        ZStack{
            Image("BG 1")
                .resizable()
                .ignoresSafeArea()
                .frame(maxHeight: .infinity)
            TabView {
                
                HomeRow(reiseViewModel: ReiseAuswahlViewModel())
                    .tabItem {
                        VStack {
                            VStack {
                                Image(systemName: "house.fill")
                                Text("Home")
                                
                            }
                            
                            
                        }
                    }.tag(1)
                
                MultiBookingView(viewModel: FlightSearchViewModel())
                    .tabItem {
                        VStack {
                            VStack {
                                Image(systemName: "airplane.departure")
                                Text("Flightsearch")
                            }
                            
                        }
                    }.tag(2)
                JobRow(viewModel: JobListViewModel())
                    .tabItem {
                        VStack {
                            VStack {
                                Image(systemName: "graduationcap.fill")
                                Text("Job")
                            }
                            
                        }
                    }.tag(3)
                CreateProfilView()
                    .tabItem {
                        VStack {
                            VStack {
                                Image(systemName: "person.crop.circle")
                                Text("MyProfil")
                            }
                            
                            
                        }
                    }.tag(4)
            }
            .background(Color(#colorLiteral(red: 0.2370265722, green: 0.2096630931, blue: 0.5778520703, alpha: 1)))
            
        }

    }
    
        struct Home_Previews: PreviewProvider {
            static var previews: some View {
                Home().environmentObject(AuthService())
                    .previewInterfaceOrientation(.portrait)
                
            }
        }
        
    }

