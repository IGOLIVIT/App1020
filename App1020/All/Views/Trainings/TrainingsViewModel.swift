//
//  TrainingsViewModel.swift
//  App1020
//
//  Created by IGOR on 11/11/2024.
//

import SwiftUI
import CoreData

final class TrainingsViewModel: ObservableObject {
    
    @AppStorage("totSes") var totSes: Int = 0
    @AppStorage("time") var time: Int = 0
    
    @Published var isAdd: Bool = false
    @Published var isDetail: Bool = false
    @Published var isDelete: Bool = false
    @Published var isGroups: Bool = false
    
    @Published var days: [String] = ["Sat", "Sun", "Mon", "Tue", "Wed", "Thu", "Fri"]
    @Published var currentDay = ""
    @Published var dayForAdd = ""

    @Published var gNameForAdd = ""
    
    @Published var trGroup: String = ""
    @Published var trDay: String = ""
    @Published var trPName: String = ""
    @Published var trPDur: String = ""
    @Published var trPEx: String = ""

    @Published var trainings: [TrainModel] = []
    @Published var selectedTrain: TrainModel?

    func addTrain() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "TrainModel", into: context) as! TrainModel

        loan.trGroup = trGroup
        loan.trDay = trDay
        loan.trPName = trPName
        loan.trPDur = trPDur
        loan.trPEx = trPEx

        CoreDataStack.shared.saveContext()
    }

    func fetchTrains() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<TrainModel>(entityName: "TrainModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.trainings = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.trainings = []
        }
    }
}

