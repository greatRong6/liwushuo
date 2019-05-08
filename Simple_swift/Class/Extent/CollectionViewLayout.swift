//
//  CollectionViewLayout.swift
//  Simple_swift
//
//  Created by iosdev on 2019/5/5.
//  Copyright © 2019 gezhenrong. All rights reserved.
//
import UIKit


@objc protocol GZRCollectionViewLayoutDelegate : NSObjectProtocol {
    
   func waterFlowLayout(layout : CollectionViewLayout,indexPath : NSIndexPath,itemWidth : CGFloat) -> CGFloat
    @objc optional func columnCountInWaterFlowLayout(layout : CollectionViewLayout) -> Int
    
    @objc optional func columnMarginInWaterFlowLayout(layout : CollectionViewLayout) -> CGFloat
    @objc optional func rowMarginInWaterFlowLayout(layout : CollectionViewLayout) -> CGFloat
    @objc optional func edgeInsetsInWaterFlowLayout(layout : CollectionViewLayout) -> UIEdgeInsets
}



class CollectionViewLayout: UICollectionViewLayout {
    
    weak open var delegate : GZRCollectionViewLayoutDelegate?
    fileprivate let DefaultColumnCount : Int = 2
    fileprivate let DefaultColumnMargin : CGFloat = 10
    fileprivate let DefaultRowMargin : CGFloat = 10
    fileprivate let DefaultEdgeInsets : UIEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10)
    /*懒加载创建存放属性的数组*/
    fileprivate lazy var attrs : [UICollectionViewLayoutAttributes] = []
    fileprivate lazy var columnHeights : [CGFloat] = []
    fileprivate var contentHeight : CGFloat?
    
    fileprivate func columnCount() -> Int {
    if self.delegate != nil && (self.delegate?.responds(to: #selector(self.delegate?.columnCountInWaterFlowLayout(layout:))))!{
        return (self.delegate?.columnCountInWaterFlowLayout!(layout: self))!
        }else{
            return DefaultColumnCount
        }
    }
    
   fileprivate func columnMargin() -> CGFloat {
    if self.delegate != nil && (self.delegate?.responds(to: #selector(self.delegate?.columnMarginInWaterFlowLayout(layout:))))!{
        return (self.delegate?.columnMarginInWaterFlowLayout!(layout: self))!
        }else{
            return DefaultColumnMargin
        }
    }
    
    fileprivate func rowMargin() -> CGFloat {
        if self.delegate != nil && (self.delegate?.responds(to: #selector(self.delegate?.rowMarginInWaterFlowLayout(layout:))))!{
            return (self.delegate?.rowMarginInWaterFlowLayout!(layout: self))!
        }else{
            return DefaultRowMargin
        }
    }
    
    fileprivate func edgeInsets() -> UIEdgeInsets {
        if self.delegate != nil && (self.delegate?.responds(to: #selector(self.delegate?.edgeInsetsInWaterFlowLayout(layout:))))!{
            return (self.delegate?.edgeInsetsInWaterFlowLayout!(layout: self))!
        }else{
            return DefaultEdgeInsets
        }
    }
    
    override func prepare() {
        super.prepare()
        
        if self.collectionView == nil {
            return
        }
        
        self.columnHeights.removeAll()
        self.contentHeight = 0
        
        for  _ in 0 ..< self.columnCount() {
            self.columnHeights.append(self.edgeInsets().top)
        }
        
        self.attrs.removeAll()
        let count : Int = (self.collectionView?.numberOfItems(inSection: 0))!
        let width : CGFloat = (self.collectionView?.frame.size.width)!
        let colMagin = (CGFloat)(self.columnCount() - 1) * self.columnMargin()

        let cellWidth : CGFloat = (width - self.edgeInsets().left - self.edgeInsets().right - colMagin) / CGFloat(self.columnCount())

        for i in 0 ..< count {
            let indexPath : NSIndexPath = NSIndexPath(item: i, section: 0)
            let attr : UICollectionViewLayoutAttributes = UICollectionViewLayoutAttributes(forCellWith: indexPath as IndexPath)
            
            //获取高度
            let cellHeight : CGFloat =  (self.delegate?.waterFlowLayout(layout: self, indexPath: indexPath as NSIndexPath, itemWidth: cellWidth))!

            var minColumnHeight = self.columnHeights[0]
            var minColumn : Int = 0
            for i in 1 ..< self.columnCount() {
                let colHeight = self.columnHeights[i]

                if colHeight < minColumnHeight {
                    minColumnHeight = colHeight
                    minColumn = i
                }
            }
            
            let cellX : CGFloat = self.edgeInsets().left + CGFloat(minColumn) * (self.columnMargin() + cellWidth)
            var cellY = minColumnHeight
            if cellY != self.edgeInsets().top {
                cellY = self.rowMargin() + cellY
            }

            attr.frame = CGRect(x: cellX, y: cellY, width: cellWidth, height: cellHeight)
            let maxY = cellY + cellHeight;

            
            self.columnHeights[minColumn] = maxY
            let maxContentHeight = self.columnHeights[minColumn]
            if CGFloat(self.contentHeight!) < CGFloat(maxContentHeight) {
                self.contentHeight = maxContentHeight
            }
            self.attrs.append(attr)
        }
    }
    
//
//    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
//
//        if collectionView != nil {
//            let attr : UICollectionViewLayoutAttributes = UICollectionViewLayoutAttributes(forCellWith: indexPath as IndexPath)
//            let width : CGFloat = (self.collectionView?.frame.size.width)!
//            let colMagin = (CGFloat)(self.columnCount() - 1) * self.columnMargin()
//
//            let colCount : CGFloat = CGFloat(self.columnCount())
//            let cellWidth : CGFloat = (width - self.edgeInsets().left - self.edgeInsets().right - colMagin) / colCount
//            let cellHeight : CGFloat = (self.delegate?.waterFlowLayout(layout: self, indexPath: indexPath as NSIndexPath, itemWidth: cellWidth))!
//            var minColumn : Int = 0
//            var minColumnHeight = self.columnHeights[0]
//
//            for i in 1 ..< self.columnCount() {
//                let colHeight = self.columnHeights[i]
//                if colHeight < minColumnHeight {
//                    minColumnHeight = colHeight
//                    minColumn = i
//                }
//            }
//
//            let cellX : CGFloat = self.edgeInsets().left + CGFloat(minColumn) * (self.columnMargin() + cellWidth)
//            var cellY = minColumnHeight
//            if cellY != self.edgeInsets().top {
//                cellY = self.rowMargin() + cellY
//            }
//
//            attr.frame = CGRect(x: cellX, y: cellY, width: cellWidth, height: cellHeight)
//            let maxY = cellY + cellHeight;
//            self.columnHeights.append(maxY)
//
//            let maxContentHeight = self.columnHeights[Int(minColumn)]
//            if CGFloat(self.contentHeight!) < CGFloat(maxContentHeight) {
//                self.contentHeight = maxContentHeight
//            }
//            return attr;
//        }
//        return nil
//    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return self.attrs
    }
    
    override var collectionViewContentSize: CGSize{
        get {
            return CGSize(width: 0, height: CGFloat(self.contentHeight!) + CGFloat(self.edgeInsets().bottom))
        }
        set {
            self.collectionViewContentSize = newValue
        }
    }
}
