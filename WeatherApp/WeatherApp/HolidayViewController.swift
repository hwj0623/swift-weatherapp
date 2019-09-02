//
//  HolidayViewController.swift
//  WeatherApp
//
//  Created by hw on 30/08/2019.
//  Copyright © 2019 hwj. All rights reserved.
//

import UIKit

class HolidayViewController: UIViewController {
    private var holidayList: HolidayList!
    @IBOutlet weak var holidayTableView: UITableView!
    
    func configureModel(holidayList: HolidayList) {
        self.holidayList = holidayList
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension HolidayViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let format = { (count: Int) in
            return count
        }
        let count = holidayList.receiveTableViewCountFormat(format: format)
        return  count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell  = tableView.dequeueReusableCell(withIdentifier: "HolidayCustomCell") as? HolidayTableViewCell else {
            
            return HolidayTableViewCell()
        }
        let format = { (date: String, subtitle: String ) in
            cell.dateLabel.text = date
            cell.subtitleLabel.text = subtitle
        }
        holidayList.receiveTableViewContentFormat(format: format, rowAt: indexPath.row)
        cell.backgroundView = UIImageView.init(image: UIImage.init(named: "weather-rainny.png"))
        cell.backgroundView?.contentMode = .scaleAspectFill

        
        return cell
    }
}


