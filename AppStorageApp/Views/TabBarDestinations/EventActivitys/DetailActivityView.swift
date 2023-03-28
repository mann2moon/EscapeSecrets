//
//  DetailActivityView.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 28.03.23.
//
import SwiftUI
import MapKit

// Die DetailActivityView repräsentiert die Ansicht einer bestimmten Aktivität, die näher beschrieben wird
struct DetailActivityView: View {

var activity : Activities // Die Aktivität, die in dieser Ansicht dargestellt wird

@EnvironmentObject var tripType : TripTypeViewModel // Die TripType-Umgebung, die die hinzugefügten Aktivitäten enthält

@State var mapRegion : MKCoordinateRegion // Die Region der Karte, die angezeigt wird

// Initialisierungsfunktion
init(activity:Activities){
    self.activity = activity
    self._mapRegion = State(initialValue: MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: activity.latitude, longitude: activity.longitude), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)))
}

// Body-View
var body: some View {

   
        VStack(alignment: .center, spacing:10){
                
                HStack(alignment: .top){
                    // Bild der Aktivität
                    Image(activity.image)
                        .resizable()
                        .frame(width: 400,height: 250)
                        .cornerRadius(15)
                }
                
                // Name der Aktivität
                Text(activity.name)
                    .font(.title)
                    .fontWeight(.black)
                 
                // Beschreibung der Aktivität
                Text(activity.description)
                    .font(.headline)
                    .tracking(-1)
                    .multilineTextAlignment(.leading)
                    .padding()
            
                // Karte mit der angegebenen Region
                Map(coordinateRegion:$mapRegion)
                    .cornerRadius(30)
            
                HStack(alignment: .top){
                    Spacer()
                    
                    // Button, um die Aktivität zur TripType-Umgebung hinzuzufügen
                    Button(action: {
                        tripType.addActivities(newItem: activity)
                    })
                    {
                        RoundedRectangle(cornerRadius: 30)
                            .fill(Color.blue)
                            .frame(width: 120, height: 60)
                            .font(.title)
                            .overlay(HStack{
                                Text("Event Booking")
                                    .fontWeight(.heavy)
                                    .foregroundColor(Color.white)
                            }).padding()
                    }
                    
                    Spacer()
                }
       

    }.edgesIgnoringSafeArea(.top)
}
}

// Preview-Provider
struct DetailExperienceView_Previews: PreviewProvider {
static let tripTide = TripTypeViewModel()
@Namespace static var namespace
static var previews: some View {
DetailActivityView(activity: activities[0])
.environmentObject(tripTide)
}
}
