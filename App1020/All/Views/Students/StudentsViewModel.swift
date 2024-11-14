//
//  StudentsViewModel.swift
//  App1020
//
//  Created by IGOR on 09/11/2024.
//

import SwiftUI
import CoreData

final class StudentsViewModel: ObservableObject {

    @Published var isAdd: Bool = false
    @Published var isDetail: Bool = false
    @Published var isDelete: Bool = false
    @Published var isAddRecord: Bool = false
    
    @Published var sports: [String] = ["Swimming", "Gymnastics", "Soccer", "Basketball"]
    @Published var currentSport = ""

    @Published var stName: String = ""
    @Published var stAge: String = ""
    @Published var stType: String = ""
    @Published var stStudents: String = ""

    @Published var students: [StudModel] = []
    @Published var selectedStud: StudModel?

    func addStud() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "StudModel", into: context) as! StudModel

        loan.stName = stName
        loan.stAge = stAge
        loan.stType = stType
        loan.stStudents = stStudents

        CoreDataStack.shared.saveContext()
    }

    func fetchStuds() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<StudModel>(entityName: "StudModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.students = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.students = []
        }
    }
}
