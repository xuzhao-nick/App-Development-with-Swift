import Foundation
import UIKit
/*
 Key paths essentially let us reference any instance property as a separate value. As such, they can be passed around, used in expressions, and enable a piece of code to get or set a property without actually knowing which exact property its working with.
 
 Key paths come in three main variants:
 
 KeyPath: Provides read-only access to a property.
 WritableKeyPath: Provides readwrite access to a mutable property with value semantics (so the instance in question also needs to be mutable for writes to be allowed).
 ReferenceWritableKeyPath: Can only be used with reference types (such as instances of a class), and provides readwrite access to any mutable property.
 */


struct Article {
  let id: UUID
  let source: URL
  let title: String
  let body: String
}
let articles = [
  Article(id: UUID.init(), source: URL.init(string: "https://jamesclear.com/new-habit")!, title: "How Long Does it Actually Take to Form a New Habit? (Backed by Science)", body: "Maxwell Maltz was a plastic surgeon in the 1950s when he began noticing a strange pattern among his patients."),
  Article(id: UUID.init(), source: URL.init(string: "https://jamesclear.com/habit-triggers")!, title: "The 5 Triggers That Make New Habits Stick", body: """
    The Habit Loop
    The image below shows the habit loop and how these four factors work together to build new habits.
    """),
  Article(id: UUID.init(), source: URL.init(string: "https://jamesclear.com/habit-stacking")!, title: "How to Build New Habits by Taking Advantage of Old Ones", body: """
    In 2007, researchers at Oxford University started peering into the brains of newborn babies. What they found was surprising.
    After comparing the newborn brains to the normal adult human, the researchers realized that the average adult had 41 percent fewer neurons than the average newborn.
    """)
  
  
]
let articleIDs = articles.map{$0.id}
print(articleIDs)
let articalSources = articles.map{$0.source}
print(articalSources)

articles[0][keyPath: \.id]

struct Cat {
    let name: String
    var color: String
}

let enchilada = Cat(name: "Enchilada", color: "Brown")
let name = enchilada[keyPath: \.name]

extension Sequence {
  func map<T>(_ keyPath: KeyPath<Element, T>) -> [T] {
    return map { $0[keyPath: keyPath]}
  }
}

let articleIDs1 = articles.map(\.id)
print(articleIDs1)
let titles = articles.map(\.title)
print(titles)
let list = articles.sorted{ $0.title < $1.title }
let titles1 = list.map(\.title)
print(titles1)

extension Sequence {
  func sorted<T: Comparable>(by keyPath: KeyPath<Element, T>) -> [Element] {
    return sorted { a, b in
      return a[keyPath: keyPath] < b[keyPath: keyPath]
    }
  }
}

let list1 = articles.sorted(by: \.title)
print(list1.map(\.title))


struct Song {
  let name: String
  let artistName: String
  let image: UIImage?
}

struct PlayList {
  let title: String
  let authorName: String
  let artwork: UIImage?
}

struct CellConfigurator<Model> {
  let titleKeyPath: KeyPath<Model, String>
  let subtitleKeyPath: KeyPath<Model, String>
  let imageKeyPath: KeyPath<Model, UIImage?>
  
  func configure(_ cell: UITableViewCell, for model: Model) {
    cell.textLabel?.text = model[keyPath: titleKeyPath]
    cell.detailTextLabel?.text = model[keyPath: subtitleKeyPath]
    cell.imageView?.image = model[keyPath: imageKeyPath]
  }
}

let songCellConfigurator = CellConfigurator<Song>(titleKeyPath: \.name, subtitleKeyPath: \.artistName, imageKeyPath: \.image)

let playlistCellConfigurator = CellConfigurator<PlayList>(titleKeyPath: \.title, subtitleKeyPath: \.authorName, imageKeyPath: \.artwork)



