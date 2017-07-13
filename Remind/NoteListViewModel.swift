//
//  NoteListViewModel.swift
//  Remind
//
//  Created by Chakery on 2017/7/13.
//  Copyright © 2017年 Chakery. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

class NoteListViewModel: BaseViewModel {
    var datasource = Variable<Datasource<NoteModel>?>(nil)
    
    override init() {
        super.init()
        let datas: [NoteModel] = []
        datasource.value = Datasource<NoteModel>.collection(datas)
    }
}
