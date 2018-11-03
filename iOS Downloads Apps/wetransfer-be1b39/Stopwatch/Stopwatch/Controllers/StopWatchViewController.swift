//
//  ViewController.swift
//  Stopwatch
//
//  Created by Alin Zdurlan on 06/10/2018.
//  Copyright © 2018 Alin Zdurlan. All rights reserved.
//

import UIKit

class StopWatchViewController: UIViewController {
    //MARK: - Outlets
    @IBOutlet private weak var startButton: UIButton!
    @IBOutlet private weak var lapButton: UIButton!
    @IBOutlet private weak var timeLabel: UILabel!
    @IBOutlet private weak var lapsTableView: UITableView!
    
    var timer: Timer!
    var counter = 0.0
    var isStarted = false
    var lapArray: [String]? = []
    var fractions = 0
    var seconds = 0
    var minutes = 0
    var counterString = ""
    
    //MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configureInterface()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        makeStatusBarWhite()
    }
    
    func configureInterface() {
        startButton.layer.cornerRadius = startButton.frame.size.height/2
        lapButton.layer.cornerRadius = lapButton.frame.size.width/2
    }
    
    @objc func timeDidIncrease() {
        fractions += 1
        if fractions == 100 {
            seconds += 1
            fractions = 0
        }
        if seconds == 60 {
            minutes += 1
            seconds = 0
        }
        
        let fractionsString = fractions > 9 ? "\(fractions)" : "0\(fractions)"
        let secondsString = seconds > 9 ? "\(seconds)" : "0\(seconds)"
        let minutesString = minutes > 9 ? "\(minutes)" : "0\(minutes)"
        
        
        counterString = "\(minutesString):\(secondsString),\(fractionsString)"
        timeLabel.text = counterString
    }
    
    func configureAndStartTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(timeDidIncrease), userInfo: nil, repeats: true)
        RunLoop.current.add(timer, forMode: RunLoop.Mode.common)
    }
    
    //MARK: - Actions
    @IBAction func didTapLap(_ sender: Any) {
        if isStarted {
            lapArray?.insert(timeLabel.text!, at: 0)
        } else {
            timeLabel.text = "00:00,00"
            counter = 0
            fractions = 0
            minutes = 0
            seconds = 0
            timer.invalidate()
            lapArray?.removeAll()
            resetStartButton()
            lapButton.setTitle("Lap", for: .normal)
            lapButton.isUserInteractionEnabled = false
            lapButton.alpha = 0.3
        }
        lapsTableView.reloadData()
    }
    
    func resetStartButton() {
        startButton.setTitle("Start", for: .normal)
        startButton.backgroundColor = UIColor(red: 79/255, green: 143/255, blue: 0, alpha: 1)
    }
    
    @IBAction func didTapStart(_ sender: Any) {
        if !isStarted {
            configureAndStartTimer()
            isStarted = true
            startButton.setTitle("Stop", for: .normal)
            startButton.backgroundColor = UIColor.red
            lapButton.setTitle("Lap", for: .normal)
        } else {
            timer.invalidate()
            isStarted = false
            resetStartButton()
            lapButton.setTitle("Reset", for: .normal)
        }
        lapButton.isUserInteractionEnabled = true
        lapButton.alpha = 1
    }
    
}

extension StopWatchViewController: UITableViewDataSource {
    //MARK: Table View Datasource methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lapArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! LapTableViewCell
        let currentLap = lapArray?[indexPath.row]
        cell.lapName = "Lap \((lapArray?.count ?? 0) - indexPath.row)"
        cell.lapTime = currentLap
        cell.selectionStyle = .none
        return cell
    }
    
}

extension StopWatchViewController: UITableViewDelegate {
    //MARK: Table View Delegate methods
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("AM APASAT")
    }
    
}
