//
//  ModelViewControlerProtocolDelegate.swift
//  VKInternship
//
//  Created by Людмила Долонтаева on 5/10/23.
//

import Foundation
import UIKit

protocol ModelViewControlerProtocolDelegate:
    AnyObject,
    UICollectionViewDataSource,
    UICollectionViewDelegateFlowLayout,
    UIScrollViewDelegate {
    var title: String? { get set }
}
