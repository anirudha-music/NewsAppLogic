//
//  ViewController.swift
//  CollectionView-Demo
//
//  Created by Anirudha on 25/04/17.
//  Copyright © 2017 Anirudha Mahale. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var CV: UICollectionView!
    
    enum cellType {
        case News
        case Advt
        case Poll
    }
    
    struct News {
        let id: String
        let type: cellType
        let news: String?
        let heading: String?
        let updatedDate: String?
        
        let question: String?
        let option1: String?
        let option2: String?
        let option3: String?
        let option4: String?
        
        let advt: String?
        
        init(id: String, type: cellType, news: String? = nil, heading: String? = nil, updatedOn: String? = nil, question: String? = nil, option1: String? = nil, option2: String? = nil, option3: String? = nil, option4: String? = nil, advt: String? = nil) {
            self.id = id
            self.type = type
            self.news = news
            self.heading = heading
            self.updatedDate = updatedOn
            self.question = question
            self.option1 = option1
            self.option2 = option2
            self.option3 = option3
            self.option4 = option4
            self.advt = advt
        }
    }
    
    var data = [News]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pollData = News(id: "poll1", type: .Poll, question: "How are you?", option1: "Fine", option2: "Awesome", option3: "Great", option4: "Very Happy")
        configureData(news: newsData)
    }
    
    var newsData = [
        News(id: "news1", type: .News, news: "This is description of news 1", heading: "heading of news 1", updatedOn: "2017-04-26T08:20:09.907Z"),
        News(id: "news2", type: .News, news: "This is description of news 2", heading: "heading of news 2", updatedOn: "2017-04-26T08:21:09.907Z"),
        News(id: "news3", type: .News, news: "This is description of news 3", heading: "heading of news 3", updatedOn: "2017-04-26T08:22:09.907Z"),
        News(id: "news4", type: .News, news: "This is description of news 4", heading: "heading of news 4", updatedOn: "2017-04-26T08:23:09.907Z"),
        News(id: "news5", type: .News, news: "This is description of news 5", heading: "heading of news 1", updatedOn: "2017-04-26T08:20:09.907Z")
    ]
    
    var advtData = [News]()
    
    var pollData: News?
    
    var ads_count = 0
    // func to configure data for the app.
    func configureData(news: [News]? = nil) {
        var tempData = [News]()
        
        tempData.append(contentsOf: data)
        
        if let newsArray = news {
            tempData.append(contentsOf: newsArray)
        }
        
        if advtData.count > 0 {
            for ads in advtData[ads_count ... (advtData.count - 1)] {
                if tempData.indices.contains(5*(ads_count+1)) {
                    ads_count += 1
                    tempData.insert(ads, at: (5*ads_count))
                }
            }
        }
        if let pol = pollData {
            if tempData.indices.contains(8) {
                tempData.insert(pol, at: 8)
            } else {
                tempData.append(pol)
            }
            pollData = nil
        }
        
        data = tempData
        CV.reloadData()
    }
    
    @IBAction func addNews(_ sender: Any) {
        let temp = [
            News(id: "news6", type: .News, news: "This is description of news 6", heading: "heading of news 2", updatedOn: "2017-04-26T08:21:09.907Z"),
            News(id: "news7", type: .News, news: "This is description of news 7", heading: "heading of news 3", updatedOn: "2017-04-26T08:22:09.907Z"),
            News(id: "news8", type: .News, news: "This is description of news 8", heading: "heading of news 4", updatedOn: "2017-04-26T08:23:09.907Z"),
            News(id: "news9", type: .News, news: "This is description of news 9", heading: "heading of news 1", updatedOn: "2017-04-26T08:20:09.907Z"),
            News(id: "news10", type: .News, news: "This is description of news 10", heading: "heading of news 2", updatedOn: "2017-04-26T08:21:09.907Z"),
            News(id: "news11", type: .News, news: "This is description of news 11", heading: "heading of news 3", updatedOn: "2017-04-26T08:22:09.907Z"),
            News(id: "news12", type: .News, news: "This is description of news 12", heading: "heading of news 4", updatedOn: "2017-04-26T08:23:09.907Z")
        ]
        configureData(news: temp)
    }
    
    @IBAction func addAdvt(_ sender: Any) {
        let temp = [
            News(id: "advt1", type: .Advt, advt: "This is ad of iPhone 10SE"),
            News(id: "advt1", type: .Advt, advt: "This is ad of iPhone 11SE")
        ]
        advtData.append(contentsOf: temp)
        configureData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch data[indexPath.row].type {
        case .News:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsCollectionViewCell", for: indexPath) as! NewsCollectionViewCell
            cell.newsLabel.text = data[indexPath.row].news ?? ""
            return cell
            
        case .Advt:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AdvtCollectionViewCell", for: indexPath) as! AdvtCollectionViewCell
            cell.advtLabel.text = data[indexPath.row].advt ?? ""
            return cell
            
        case .Poll:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PollCollectionViewCell", for: indexPath) as! PollCollectionViewCell
            cell.questionLabel.text = data[indexPath.row].question ?? ""
            cell.optional1Label.text = data[indexPath.row].option1 ?? ""
            cell.optional2Label.text = data[indexPath.row].option2 ?? ""
            cell.optional3Label.text = data[indexPath.row].option3 ?? ""
            cell.optional4Label.text = data[indexPath.row].option4 ?? ""
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}
