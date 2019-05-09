//
//  BMRequestUrl.swift
//  Simple_swift
//
//  Created by iosdev on 2017/12/15.
//  Copyright © 2017年 gezhenrong. All rights reserved.
//

import UIKit

/// 服务器地址
let BASE_URL = "http://api.liwushuo.com/"

//单品
let Simple_Url =  BASE_URL + "v2/items"

//首页头部
let Home_TitleUrl = BASE_URL + "v2/channels/preset"

//首页    //http://api.liwushuo.com/v2/channels/100/items?ad=2&gender=1&generation=1&limit=20&offset=0
var HomeData_Url =  BASE_URL + "v2/channels/"

//banner数据   http://api.liwushuo.com/v2/banners?channel=iOS
var Banners_Url =  BASE_URL + "v2/banners?channel=iOS"

//banner按钮数据  http://api.liwushuo.com/v2/promotions?gender=1&generation=1
var BanBtn_Url =  BASE_URL + "v2/promotions?gender=1&generation=1"


//分类
var Category_Url = BASE_URL + "v1/channel_groups/all"

//专题v1/channels/items
var Collections_Url = BASE_URL + "v1/collections"

//专题  查看全部
var CollectionsLookAll_Url = BASE_URL + "v1/collections"

//风格  查看
var StyleCategory_Url = BASE_URL + "v1/channels/"

//礼物 分类
var Categories_Url = BASE_URL + "v2/item_categories/tree?"

//选礼神器 内容
var Choose_List = BASE_URL + "v2/search/item_by_type"

//选礼神器 标题及展示标签
var Choose_Filter = BASE_URL + "v2/search/item_filter?"


