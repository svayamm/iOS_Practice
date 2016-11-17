//
//  CollisionCategories.swift
//  SDStarter
//
//  Created by Svayam Mishra on 17/11/2016.
//  Copyright © 2016 Larry Heimann. All rights reserved.
//

import Foundation

struct CollisionCategories{
    static let Invader : UInt32 = 0x1 << 0
    static let Player: UInt32 = 0x1 << 1
    static let InvaderBullet: UInt32 = 0x1 << 2
    static let PlayerBullet: UInt32 = 0x1 << 3
    static let EdgeBody: UInt32 = 0x1 << 4
}
