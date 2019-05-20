# 礼物说的项目-swift版

// URL
#define Collection_URL @"http://api.liwushuo.com/v2/collections?limit=6&offset=0"
#define Channel_URL @"http://api.liwushuo.com/v2/channel_groups/all?"
#define SubCategory_URL @"http://api.liwushuo.com/v2/item_categories/tree?"
#define FilterChannel_URL @"http://api.liwushuo.com/v2/search/item_filter?"
#define FilterItem_URL @"http://api.liwushuo.com/v2/search/item_by_type?limit=20&offset=%d"


#define banners_ImgDatasURL @"http://api.liwushuo.com/v2/banners?channel=iOS"
#define promotions_ImgDatasURL @"http://api.liwushuo.com/v2/promotions?gender=1&generation=1"

#define PopItem_URL @"http://api.liwushuo.com/v2/items?gender=1&generation=1&limit=50&offset=0"
#define ItemComment_URL @"http://api.liwushuo.com/v2/items/id/comments?limit=20&offset=0"

# liwushuo

根据平常的经验做的总结，对一些网络请求，UI布局做了封装等做了优化，可以更有效，快速的进行编写代码

