//
//  ResultTableViewDataSource.swift
//  MusicDictionaryIOS
//
//  Created by 林敏生 on 2020/09/26.
//  Copyright © 2020 林敏生. All rights reserved.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift

class RessultTableViewDataSource: NSObject, UITableViewDataSource, RxTableViewDataSourceType {

    private var items: [ArtistsForm] = []


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return items.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        tableView.estimatedRowHeight = 100
        //UITableView.automaticDimensionでcellの高さを可変にする
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.resultTableCell,for: indexPath) else { fatalError("cell")}
        
        let artist = items[indexPath.row]
        cell.name = artist.name
        cell.gender = artist.gender
        cell.lyrics = artist.lyrics
        cell.voice = artist.voice
        cell.length = artist.length
        
        return cell
    }


    func tableView(_ tableView: UITableView, observedEvent: Event<[ArtistsForm]>) {
        Binder(self) { dataSource, element in
            dataSource.items = element
            tableView.reloadData()
            
        }
        .on(observedEvent)
    }
    



}
