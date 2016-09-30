import Foundation
import UIKit

class ModelList{
    
    var itemList:[ModelDetail] = []
    var sampleList = [ "apple" : [ "description" : "青森産とか長野県産とかあるね。", "img" : "apple.png" ],
                       "orange": [ "description" : "地中海性気候で出荷される",      "img": "orange.png"],
                       "lemon":  [ "description" : "かぼすじゃねー",              "img": "lemon.png"],
                       "melon":  [ "description" : "入院した時の手土産といえばこれ", "img": "melon.png"],
                       "banana": [ "description" : "そんなバナナ",                "img": "banana.png"]
                      ]
    
    init() {
        for ( key, value ) in sampleList {
            let model               = ModelDetail()
            model.detailTitle       = key
            model.detailDescription = value[ "description" ]
            model.detailImage       = UIImage( named:value[ "img" ]! )
            model.detailCreateDatetime = NSDate()
            itemList.append( model )
        }
    }
        
    func getList() -> Array<ModelDetail> {
        return itemList
    }
    
    func delItem( delNo : Int ) -> Array<ModelDetail> {
        itemList.removeAtIndex( delNo )
        return itemList;
    }

    func getNextItemPos( item_no : Int )-> Int {
        if ( itemList.count <= item_no + 1 ){
        print( String(format:"getNextItemPos itemlist.count:%d", itemList.count ))
            return 0
        }
        return item_no + 1
    }
    
    func getPrevItemPos( item_no : Int )-> Int {
        if ( 0 > item_no - 1 ){
            return itemList.count - 1
        }
        return item_no - 1
    }


    func getItem( item_no : Int ) -> ModelDetail {
        return itemList[ item_no ]
    }
}