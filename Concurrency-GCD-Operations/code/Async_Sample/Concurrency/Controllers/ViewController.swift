//
//  ViewController.swift
//  Concurrency
//
//  Created by Grace Njoroge on 07/06/2020.
//  Copyright © 2020 Grace. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  private let cellID = "cellID"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupTableView()
    updateTable()
  }
  
  private func updateTable() {
    do {
      try self.fetchedhResultController.performFetch()
    } catch let error  {
      print("Fetch Error: \(error)")
    }
    let service = APIHelper()
    service.getDataWith { (result) in
      switch result {
      case .Success(let data):
        self.clearData()
        self.saveInCoreDataWith(array: data)
      }
    }
  }
  
  private func setupTableView() {
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(PhotoCell.self, forCellReuseIdentifier: cellID)
  }

  
  private func createPhotoEntityFrom(dictionary: [String: AnyObject]) -> NSManagedObject? {
    let context = CoreDataStack.sharedInstance.persistentContainer.viewContext
    if let photoEntity = NSEntityDescription.insertNewObject(forEntityName: "Photo", into: context) as? Photo {
      photoEntity.authorName = dictionary["author"] as? String
      let mediaDictionary = dictionary["media"] as? [String: AnyObject]
      photoEntity.imageUrl = mediaDictionary?["m"] as? String
      return photoEntity
    }
    return nil
  }
  
  private func saveInCoreDataWith(array: [[String: AnyObject]]) {
    _ = array.map{self.createPhotoEntityFrom(dictionary: $0)}
    do {
      try CoreDataStack.sharedInstance.persistentContainer.viewContext.save()
    } catch let error {
      print(error)
    }
  }
  
  private func clearData() {
      do {
          let context = CoreDataStack.sharedInstance.persistentContainer.viewContext
          let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Photo")
          do {
              let objects  = try context.fetch(fetchRequest) as? [NSManagedObject]
              _ = objects.map{$0.map{context.delete($0)}}
              CoreDataStack.sharedInstance.saveContext()
          } catch let error {
              print("Delete Error: \(error)")
          }
      }
  }
  
  lazy var fetchedhResultController: NSFetchedResultsController<NSFetchRequestResult> = {
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: String(describing: Photo.self))
    fetchRequest.sortDescriptors = [NSSortDescriptor(key: "authorName", ascending: true)]
    let fetchReqController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: CoreDataStack.sharedInstance.persistentContainer.viewContext, sectionNameKeyPath: nil, cacheName: nil)
    fetchReqController.delegate = self
    return fetchReqController
  }()
  
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! PhotoCell
    if let photo = fetchedhResultController.object(at: indexPath) as? Photo {
        cell.setPhotoCellWith(photo: photo)
    }
    return cell
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if let count = fetchedhResultController.sections?.first?.numberOfObjects {
        return count
    }
    return 0
  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return view.frame.width + 100
  }
}

extension ViewController: NSFetchedResultsControllerDelegate {
  func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
    switch type {
    case .insert:
      self.tableView.insertRows(at: [newIndexPath!], with: .automatic)
    case .delete:
      self.tableView.deleteRows(at: [indexPath!], with: .automatic)
    default:
      break
    }
  }
  func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
    self.tableView.endUpdates()
  }
  
  func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
    tableView.beginUpdates()
  }
}
