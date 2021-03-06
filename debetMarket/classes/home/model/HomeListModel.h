//
//  HomeListModel.h
//  debetMarket
//
//  Created by 罗海波 on 2017/10/23.
//  Copyright © 2017年 HT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeListModel : NSObject

@property(nonatomic,copy) NSString * applicationMaterial;
@property(nonatomic,assign) int  applyType;
@property(nonatomic,copy) NSString * applyUrl;
@property(nonatomic,copy) NSString *  categories;
@property(nonatomic,copy) NSString * contacter;
@property(nonatomic,strong) NSNumber *  createTime;
@property(nonatomic,copy) NSString * deadline;
@property(nonatomic,strong) NSNumber * deadlineUnit;
@property(nonatomic,copy) NSString * desc;
@property(nonatomic,copy) NSString * enableMoney;
@property(nonatomic,strong) NSNumber * fastestGetTime;
@property(nonatomic,strong) NSNumber * loanId;
@property(nonatomic,copy) NSString * interestRate;
@property(nonatomic,assign) int isDelete;
@property(nonatomic,assign) int  isHot;
@property(nonatomic,assign) int isNew;
@property(nonatomic,copy) NSString * logo;
@property(nonatomic,strong) NSNumber * maxMoney;
@property(nonatomic,copy) NSString * name;
@property(nonatomic,copy) NSString * phone;
@property(nonatomic,copy) NSString * tag;
@property(nonatomic,assign) int topSortNum;


@end
