//
//  Department+CoreDataProperties.swift
//  CD_One_To_Many_Relationship
//
//  Created by Haaris Iqubal on 1/8/22.
//
//

import Foundation
import CoreData


extension Department {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Department> {
        return NSFetchRequest<Department>(entityName: "Department")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var departmentToEmployee: Set<Employee>?
    
    public var employee: [Employee]{
        let setOfEmployee = departmentToEmployee
        return setOfEmployee!.sorted{
            $0.id > $1.id
        }
    }

}

// MARK: Generated accessors for departmentToEmployee
extension Department {

    @objc(addDepartmentToEmployeeObject:)
    @NSManaged public func addToDepartmentToEmployee(_ value: Employee)

    @objc(removeDepartmentToEmployeeObject:)
    @NSManaged public func removeFromDepartmentToEmployee(_ value: Employee)

    @objc(addDepartmentToEmployee:)
    @NSManaged public func addToDepartmentToEmployee(_ values: NSSet)

    @objc(removeDepartmentToEmployee:)
    @NSManaged public func removeFromDepartmentToEmployee(_ values: NSSet)

}

extension Department : Identifiable {

}
