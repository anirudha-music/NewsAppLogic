//
//  NewsCollectionViewCell.swift
//  CollectionView-Demo
//
//  Created by Anirudha on 25/04/17.
//  Copyright © 2017 Anirudha Mahale. All rights reserved.
//

import UIKit

class NewsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var newsLabel: UILabel!
}

class AdvtCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var advtLabel: UILabel!
}

class PollCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var optional1Label: UILabel!
    @IBOutlet weak var optional2Label: UILabel!
    @IBOutlet weak var optional3Label: UILabel!
    @IBOutlet weak var optional4Label: UILabel!
}
