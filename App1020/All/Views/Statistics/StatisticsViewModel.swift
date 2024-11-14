//
//  StatisticsViewModel.swift
//  App1020
//
//  Created by IGOR on 11/11/2024.
//

import SwiftUI
import CoreData

final class StatisticsViewModel: ObservableObject {
    
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
    
    @Published var gName: String = ""
    @Published var gAchName: String = ""
    @Published var gDescr: String = ""

    @Published var goals: [GoalModel] = []
    @Published var selectedGoal: GoalModel?

    func addGoal() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "GoalModel", into: context) as! GoalModel

        loan.gName = gName
        loan.gAchName = gAchName
        loan.gDescr = gDescr

        CoreDataStack.shared.saveContext()
    }

    func fetchGoals() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<GoalModel>(entityName: "GoalModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.goals = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.goals = []
        }
    }
}
