//
//  SampleDataSource.swift
//  XYSelector
//
//  Created by dengyuchao on 16/4/7.
//  Copyright © 2016年 dengyuchao. All rights reserved.
//

import UIKit

class SampleDataSource: NSObject {
    
    var imageDataSource: [SelectorDataModel] = []
    var titleOnlyDataSource: [SelectorDataModel] = []
    
    let data1 = SelectorDataModel(textArray: ["我晒支付宝账单表示：我有很多钱，全花完了", "我晒滴滴/Uber账单表示：我是娇嫩的加班狗", "我晒飞行里程表示：高端商务人士见过伐？", "我晒飞行里程表示：高端商务人士见过伐？", "我晒书单表示：别问，书名表状态。", "我晒发出的红包表示：I'm rich"], isMultipleSelection: true, title: "这些晒出来的账单都在表达什么？", imageUrls: ["http://www.qdaily.com/system/options/options/64973/mobMediumPc2/64973.jpg?1460000055", "http://www.qdaily.com/system/options/options/63522/paperMediumPc2/63522.jpg?1459656028", "http://www.qdaily.com/system/options/options/63526/paperMediumPc2/63526.jpg?1459656110", "http://www.qdaily.com/system/options/options/63495/mobMediumPc2/63495.jpg?1459653354", "http://www.qdaily.com/system/options/options/62410/paperMediumPc2/62410.jpg?1459237912", "http://www.qdaily.com/system/options/options/60423/mobMediumPc2/60423.jpg?1458619108"], isSelectedArray: nil)
    
    let data2 = SelectorDataModel(textArray: ["Soylent 营养粉来代替吃饭","养了一个扫地机器人当宠物","智能助眠灯+香薰水氧机","厨房备有智能料理称重设备", "iPad Pro + 苹果笔", "能帮你买东西的智能语音中控"], isMultipleSelection: true, title: "如何智能化你的生活让你更像一个中产阶级？", imageUrls: ["http://www.qdaily.com/system/papers/papershows/869/indexLargePc2/869.jpg?1459834652", "http://www.qdaily.com/system/articles/articleshows/24715/relatedMediumPc2/24715.jpg?1459325481", "http://www.qdaily.com/system/options/options/59253/paperMediumPc2/59253.png?1458220378", "http://www.qdaily.com/system/articles/articleshows/24966/indexMediumPc2/24966.jpg?1459830509", "http://www.qdaily.com/system/articles/articleshows/25048/indexMediumPc2/25048.jpg?1459929721", "http://www.qdaily.com/system/articles/articleshows/25091/indexMediumPc2/25091.jpg?1459994181"], isSelectedArray: nil)
    
    let data3 = SelectorDataModel(textArray: ["求好评已经到了烦人的地步？", "你有玩栽的经历吗？", "你极其反感房产中介吗？", "你出去吃饭都要晒图吗？", "你拍照必须美颜吗？", "你每个月网购支出多吗？"], isMultipleSelection: false, title: "高比格的作", imageUrls: ["http://www.qdaily.com/system/articles/articleshows/25034/indexMediumPc2/25034.jpg?1459920141", "http://www.qdaily.com/system/articles/articleshows/25036/indexMediumPc2/25036.jpg?1459922101", "http://www.qdaily.com/system/articles/articleshows/25030/indexMediumPc2/25030.jpg?1459916428", "http://www.qdaily.com/system/articles/articleshows/24987/indexMediumPc2/24987.jpg?1459843965", "http://www.qdaily.com/system/articles/articleshows/25028/indexMediumPc2/25028.jpg?1459916363", "http://www.qdaily.com/system/articles/articleshows/25016/indexMediumPc2/25016.jpg?1459903086"], isSelectedArray: nil)
    
    let data4 = SelectorDataModel(textArray: ["你喜欢影视改编的手游吗？", "你讨厌那种教你做人的人么？", "你想吐槽你的办公室吗？", "你喜欢倾诉吗？","你习惯性失眠吗？","你还在坚持梦想吗？"], isMultipleSelection: false, title: "内心强大，处事不惊，不以物喜不以己悲", imageUrls: ["http://www.qdaily.com/system/articles/articleshows/24975/indexMediumPc2/24975.jpg?1459834011", "http://www.qdaily.com/system/articles/articleshows/24977/indexMediumPc2/24977.jpg?1459835278", "http://www.qdaily.com/system/articles/articleshows/24976/indexMediumPc2/24976.jpg?1459834748", "http://www.qdaily.com/system/articles/articleshows/24950/indexMediumPc2/24950.jpg?1459815685", "http://www.qdaily.com/system/articles/articleshows/24919/indexMediumPc2/24919.jpg?1459778323", "http://www.qdaily.com/system/articles/articleshows/24940/indexMediumPc2/24940.jpg?1459787269"], isSelectedArray: nil)
    
    let data5 = SelectorDataModel(textArray: ["一月，新的一年做新的自己", "二月，单身汪吃巧克力/咸汤圆自尽", "三月，十个海子全部复活之欢庆女生/神节", "四月，我不过愚人节，我只怀念哥哥", "五月，赫本在人间也会得“五月病”因为她劳动节没出去玩", "六月，大家一起撕试卷骂王后雄吧", "七月，喜欢狮子座的100个理由","八月，# MJ forever ##异地恋节快乐#","九月，学生党们幸福的暑假结束了","十月，国庆节朋友圈游世界你准备好了吗","十一月，保护光棍，保卫信用卡","十二月，圣诞老人的身世每年都是迷"], isMultipleSelection: true, title: "你都如何从社交网络感知节气变换？",  imageUrls: ["http://www.qdaily.com/system/articles/articleshows/24927/indexMediumPc2/24927.jpg?1459780428", "http://www.qdaily.com/system/articles/articleshows/24772/indexMediumPc2/24772.jpg?1459399802", "http://www.qdaily.com/system/articles/articleshows/24875/indexMediumPc2/24875.jpg?1459525796", "http://www.qdaily.com/system/articles/articleshows/24857/indexMediumPc2/24857.jpg?1459492858", "http://www.qdaily.com/system/articles/articleshows/24850/indexMediumPc2/24850.jpg?1459486977", "http://www.qdaily.com/system/articles/articleshows/24813/indexMediumPc2/24813.jpg?1459425919", "http://www.qdaily.com/system/articles/articleshows/24779/indexMediumPc2/24779.jpg?1459410419", "http://www.qdaily.com/system/articles/articleshows/24778/indexMediumPc2/24778.jpg?1459402607", "http://www.qdaily.com/system/articles/articleshows/24719/indexMediumPc2/24719.jpg?1459337916", "http://www.qdaily.com/system/articles/articleshows/24572/indexMediumPc2/24572.jpg?1459149877", "http://www.qdaily.com/system/articles/articleshows/24554/indexMediumPc2/24554.jpg?1459136167", "http://www.qdaily.com/system/articles/articleshows/24555/indexMediumPc2/24555.jpg?1459136711"], isSelectedArray: nil)
    
    let titleData1 = SelectorDataModel(textArray: ["香蕉", "苹果", "菠萝", "西瓜", "榴莲", "樱桃"], isMultipleSelection: false, title: "Choose your favorite fruit", imageUrls: nil, isSelectedArray: nil)
    let titleData2 = SelectorDataModel(textArray: ["篮球", "足球", "乒乓球", "羽毛球", "游泳", "骑行", "滑雪"], isMultipleSelection: false, title: "Choose your favorite sports", imageUrls: nil, isSelectedArray: nil)
    
    override init() {
        super.init()
        imageDataSource.append(data1)
        imageDataSource.append(data2)
        imageDataSource.append(data3)
        imageDataSource.append(data4)
        imageDataSource.append(data5)
        
        titleOnlyDataSource.append(titleData1)
        titleOnlyDataSource.append(titleData2)
    }
}
