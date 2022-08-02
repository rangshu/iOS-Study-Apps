//
//  AlertActionConvertible.swift
//  SearchDaumBlog
//
//  Created by SooRin Kim on 2022/02/27.
//

import UIKit

protocol AlertActionConvertible {
    var title: String { get }
    var style: UIAlertAction.Style { get }
}
