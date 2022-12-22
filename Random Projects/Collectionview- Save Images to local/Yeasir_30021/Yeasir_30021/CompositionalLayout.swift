
import Foundation

import UIKit

enum CollectionLayoutGroupType{
    case horizontal
    case vertical
}

struct  CollectionVL{
    
    static func createItem(
        height: NSCollectionLayoutDimension,
        width: NSCollectionLayoutDimension,
        spacing: CGFloat) -> NSCollectionLayoutItem{
            
            let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: width  , heightDimension: height))
            item.contentInsets = NSDirectionalEdgeInsets(top: spacing, leading: spacing, bottom: spacing, trailing: spacing)
            
            return item
        }
    
    
    static func createGroup(
        height: NSCollectionLayoutDimension,
        width: NSCollectionLayoutDimension,
        alignment: CollectionLayoutGroupType,
        items: [NSCollectionLayoutItem]) -> NSCollectionLayoutGroup{
            
            switch alignment{
            case .horizontal:
                return NSCollectionLayoutGroup.horizontal(
                    layoutSize: NSCollectionLayoutSize(
                        widthDimension: width,
                        heightDimension: height),
                    subitems: items)
                
            case .vertical:
                return NSCollectionLayoutGroup.vertical(
                    layoutSize: NSCollectionLayoutSize(
                        widthDimension: width,
                        heightDimension: height),
                    subitems: items)
            }
            
    }
}
