////
////  ViewController.swift
////  23456
////
////  Created by بندر عبيد ثاري الرشيدي on 22/03/1443 AH.
////
//
//import UIKit
//
//class ViewController: UIViewController {
////var bbb = []
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//    }
//
//
//}
//struct Item {
//
//    var title: String
//    var time: String
//    var priority: String
//    var isComplete: Bool
//
//    mutating func setComplete() {
//        isComplete = true
//    }
//}
//
//class List {
//    var tasks = [Item]()
//
//    func create(task:Item){
//        tasks.append(task)
//
//    }
//    func read(){
//        var status = ""
//        for item in self.tasks {
//            if item.isComplete == true {
//                status = "Complate"
//            } else {
//                status = "Not complate"
//            }
//            print("Task: \(item.title) .. \(item.time) .. \(status)")
//        }
//        print("\n\n")
//    }
//
//    func updateTitle(index: Int ,newText: String){
//        tasks[index].title = newText
//
//    }
//
//
//    func remove(index: Int){
//        tasks.remove(at: index)
//    }
//}
//
//var task1 = Item(title: "Go To Work", time: "9:00", priority: "High",isComplete : true )
//var task2 = Item(title: "Go To Mosq", time: "12:00", priority: "High", isComplete : true)
//var task3 = Item(title: "Go To Shopping", time: "4:00", priority: "middle", isComplete : false)
//var task4 = Item(title: "Go To Gym", time: "6:00", priority: "middle" , isComplete : false)
//var task5 = Item(title: "Do The Homework", time: "8:00", priority: "High", isComplete : false)
//var task6 = Item(title: "Go To Sleep", time: "11:00", priority: "High",isComplete : true )
//
//var myList = List()
//myList.create(task: task1)
//myList.create(task: task2)
//myList.create(task: task3)
//myList.create(task: task4)
//myList.create(task: task5)
//myList.create(task: task6)
//myList.read()
//
//
//myList.updateTitle(index: 0, newText: "go to libery")
//myList.read()
//
//
//myList.remove(index: 0)
//myList.read()
//
