//
//  File.swift
//  TempleFlashcards
//
//  Created by Victor Lazaro on 10/9/17.
//  Copyright © 2017 Victor Lazaro. All rights reserved.
//

import Foundation

class TempleData {
    
    static let sharedInstance = TempleData()
    
    let temples = [
                   Temple(filename: "aba-nigeria-temple-lds-273999-mobile.jpg", name: "Aba Nigeria", dedicatedDate: "Aug. 7, 2005"),
                   Temple(filename: "accra-ghana-temple-lds-249027-mobile.jpg", name: "Accra Ghana", dedicatedDate: "Jan. 11, 2004"),
                   Temple(filename: "albuquerque-temple-lds-137885-mobile.jpg", name: "Albuquerque New Mexico", dedicatedDate: "Mar. 5, 2000"),
                   Temple(filename: "anchorage-temple-lds-253274-mobile.jpg", name: "Anchorage Alaska", dedicatedDate: "Jan. 9, 1999"),
                   Temple(filename: "apia-samoa-temple-lds-460475-mobile.jpg", name: "Apia Samoa", dedicatedDate: "Aug. 5, 1983"),
                   Temple(filename: "asuncion-paraguay-temple-lds-298372-mobile.jpg", name: "Asunción Paraguay", dedicatedDate: "May. 19, 2002"),
                   Temple(filename: "atlanta-georgia-temple-sunset-1218213-mobile.jpg", name: "Atlanta Georgia", dedicatedDate: "Jun. 1, 1983"),
                   Temple(filename: "baton-rouge-temple-lds-1078084-mobile.jpg", name: "Baton Rouge Louisiana", dedicatedDate: "Jul. 16, 2000"),
                   Temple(filename: "bern-switzerland-temple-lds-653038-mobile.jpg", name: "Bern Switzerland", dedicatedDate: "Sep. 11, 1955"),
                   Temple(filename: "billings-temple-lds-946466-mobile.jpg", name: "Billings Montana", dedicatedDate: "Nov. 20, 1999"),
                   Temple(filename: "birmingham-temple-lds-130170-mobile.jpg", name: "Birmingham Alabama", dedicatedDate: "Sep. 3, 2000"),
                   Temple(filename: "bismarck-temple-lds-408056-mobile.jpg", name: "Bismarck North Dakota", dedicatedDate: "Sep. 19, 1999"),
                   Temple(filename: "bogota-colombia-mormon-temple-856490-mobile.jpg", name: "Bogotá Colombia", dedicatedDate: "Apr. 24, 1999"),
                   Temple(filename: "boise-temple-lds-39439-mobile.jpg", name: "Boise Idaho", dedicatedDate: "May. 25, 1984"),
                   Temple(filename: "boston-temple-lds-945541-mobile.jpg", name: "Boston Massachusetts", dedicatedDate: "Oct. 1, 2000"),
                   Temple(filename: "bountiful-temple-766491-mobile.jpg", name: "Bountiful Utah", dedicatedDate: "Jan. 8, 1995"),
                   Temple(filename: "brigham-city-utah-temple-dedication-day-1027033-mobile.jpg", name: "Brigham City Utah", dedicatedDate: "Sep. 23, 2012"),
                   Temple(filename: "brisbane-australia-temple-lds-745088-mobile.jpg", name: "Brisbane Australia", dedicatedDate: "Jun. 15, 2003"),
                   Temple(filename: "buenos-aires-argentina-temple-lds-82744-mobile.jpg", name: "Buenos Aires Argentina", dedicatedDate: "Jan. 17, 1986"),
                   Temple(filename: "calgary-alberta-temple-before-open-house-1033408-mobile.jpg", name: "Calgary Alberta", dedicatedDate: "Oct. 28, 2012"),
                   Temple(filename: "campinas-brazil-temple-lighted-1029894-mobile.jpg", name: "Campinas Brazil", dedicatedDate: "May. 17, 2002"),
                   Temple(filename: "cardston-alberta-temple-lds-782043-mobile.jpg", name: "Cardston Alberta", dedicatedDate: "Aug. 26, 1923"),
                   Temple(filename: "cebu-philippines-temple-lds-852837-mobile.jpg", name: "Cebu City Philippines", dedicatedDate: "Jun. 13, 2010"),
                   Temple(filename: "chicago-temple-lds-885844-mobile.jpg", name: "Chicago Illinois", dedicatedDate: "Aug. 9, 1985"),
                   Temple(filename: "ciudad-juarez-mexico-temple-lds-126122-mobile.jpg", name: "Ciudad Juárez Mexico", dedicatedDate: "Feb. 26, 2000"),
                   Temple(filename: "colonia-juarez-mexico-temple-lds-1039762-mobile.jpg", name: "Colonia Juárez Chihuahua Mexico", dedicatedDate: "Mar. 6, 1999"),
                   Temple(filename: "columbia-river-temple-lds-761262-mobile.jpg", name: "Columbia River Washington", dedicatedDate: "Nov. 18, 2001"),
                   Temple(filename: "columbia-temple-lds-83400-mobile.jpg", name: "Columbia South Carolina", dedicatedDate: "Oct. 16, 1999"),
                   Temple(filename: "columbus-temple-lds-406110-mobile.jpg", name: "Columbus Ohio", dedicatedDate: "Sep. 4, 1999"),
                   Temple(filename: "copenhagen-denmark-temple-895949-mobile.jpg", name: "Copenhagen Denmark", dedicatedDate: "May. 23, 2004"),
                   Temple(filename: "cordoba-argentina-temple-rendering-780527-mobile.jpg", name: "Córdoba Argentina", dedicatedDate: "In Construction"),
                   Temple(filename: "curitiba-brazil-temple-lds-851199-mobile.jpg", name: "Curitiba Brazil", dedicatedDate: "Jun. 1, 2008"),
                   Temple(filename: "dallas-temple-lds-850748-mobile.jpg", name: "Dallas Texas", dedicatedDate: "Oct. 19, 1984"),
                   Temple(filename: "denver-temple-lds-999518-mobile.jpg", name: "Denver Colorado", dedicatedDate: "Oct. 24, 1986"),
                   Temple(filename: "detroit-temple-lds-837623-mobile.jpg", name: "Detroit Michigan", dedicatedDate: "Oct. 23, 1999"),
                   Temple(filename: "draper-utah-lds-temple-1079449-mobile.jpg", name: "Draper Utah", dedicatedDate: "Mar. 20, 2009"),
                   Temple(filename: "helsinki-finland-temple-lds-354503-mobile.jpg", name: "Helsinki Finland", dedicatedDate: "Oct. 22, 2006"),
                   Temple(filename: "kyiv-ukraine-temple-lds-774302-mobile.jpg", name: "Kyiv Ukraine", dedicatedDate: "Aug. 29, 2010"),
                   Temple(filename: "hawaii-temple-761091-mobile.jpg", name: "Laie Hawaii", dedicatedDate: "Nov. 27, 1919"),
                   Temple(filename: "madrid-spain-temple-954939-mobile.jpg", name: "Madrid Spain", dedicatedDate: "Mar. 19, 1999"),
                   Temple(filename: "mexico-city-temple-lds-591669-mobile.jpg", name: "Mexico City Mexico", dedicatedDate: "Dec. 2, 1983")
    ]
    
    private init() {}
    
    public func shuffle() -> [Temple] {
        var copy = temples
        var newTemples: [Temple] = []
        while copy.count > 0 {
            let index = Int(arc4random()) % copy.count
            newTemples.append(copy[index])
            copy.remove(at: index)
        }
        return newTemples
    }
}
