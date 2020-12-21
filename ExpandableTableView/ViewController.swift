//
//  ViewController.swift
//  ExpandableTableView
//
//  Created by Subroto Mohonto on 20/12/20.
//  Copyright © 2020 subroto training. All rights reserved.
//

import UIKit

struct cellData
{
    var opened = Bool()
    var title = String()
    var sectionData = [String]()
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {


    var tableViewData = [cellData]()
    override func viewDidLoad() {
        super.viewDidLoad()
       
        tableViewData = [cellData(opened: false, title: "Title1", sectionData: ["Cell1","Cell2","Cell3"]),
                         cellData(opened: false, title: "Title2", sectionData: ["Cell1","Cell2","Cell4"]),
                         cellData(opened: false, title: "Title3", sectionData: ["Cell1"]),
                         cellData(opened: false, title: "Title4", sectionData: ["Cell1","Cell2","Cell5"])
        ]
    }
    func numberOfSections(in tableView: UITableView) -> Int {
         return tableViewData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableViewData[section].opened == true
        {
            return tableViewData[section].sectionData.count+1
        }else{
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0
        {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell")else { return UITableViewCell()}
            cell.textLabel?.text = tableViewData[indexPath.section].title
             return cell
        }else {
                   guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell")else { return UITableViewCell()}
            cell.textLabel?.text = tableViewData[indexPath.section].sectionData[indexPath.row-1]
             return cell
               }
       
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(tableViewData[indexPath.section].opened == true)
        {
            tableViewData[indexPath.section].opened = false
            let sections = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(sections, with: .none)
            
        }else{
            tableViewData[indexPath.section].opened = true
            let sections = IndexSet.init(integer: indexPath.section)
                       tableView.reloadSections(sections, with: .none)
        }
    }

}

