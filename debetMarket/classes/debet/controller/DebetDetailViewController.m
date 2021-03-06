//
//  DebetDetailViewController.m
//  debetMarket
//
//  Created by 罗海波 on 2017/10/25.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "DebetDetailViewController.h"
#import "UIImageView+WebCache.h"
#import "HSGenderPickerVC.h"
#import "AppTableViewCell.h"

@interface DebetDetailViewController ()<HSGenderPickerVCDelegate>

/**图像*/
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UITableViewCell *dibucell;

/**标签*/
@property (weak, nonatomic) IBOutlet UILabel *nameLable;
/**标签1*/
@property (weak, nonatomic) IBOutlet UILabel *firstLable;
/**标签2*/
@property (weak, nonatomic) IBOutlet UILabel *secondLable;

/**标签3*/
@property (weak, nonatomic) IBOutlet UILabel *thirdLable;


/**贷款标签*/
@property (weak, nonatomic) IBOutlet UILabel *daikuanLable;
/**贷款范围*/
@property (weak, nonatomic) IBOutlet UILabel *daikuanMoney;
/**贷款范围右侧*/
@property (weak, nonatomic) IBOutlet UILabel *daikuanMoneyRight;
/**分期*/
@property (weak, nonatomic) IBOutlet UILabel *fenqiLable;
/**分期范围*/
@property (weak, nonatomic) IBOutlet UILabel *fenqifanwei;
/**分期天数*/
@property (weak, nonatomic) IBOutlet UILabel *fenqiDay;
/**每日应还钱*/
@property (weak, nonatomic) IBOutlet UILabel *dayBackMoneyLable;
/**每日应还钱标签*/
@property (weak, nonatomic) IBOutlet UILabel *dayBackMoneyTitleLable;
/**每日rate*/
@property (weak, nonatomic) IBOutlet UILabel *rateLable;
/**每日rate标签*/
@property (weak, nonatomic) IBOutlet UILabel *dayRateTitleLable;

/**最快放款时间*/
@property (weak, nonatomic) IBOutlet UILabel *fastDayLable;
/**最快放款时间标签*/
@property (weak, nonatomic) IBOutlet UILabel *fastDayLableTitle;

/**申请材料*/
@property (weak, nonatomic) IBOutlet UILabel *shengqinlable;
/**基本信息*/
@property (weak, nonatomic) IBOutlet UILabel *foutFirstLable;
/**身份信息*/
@property (weak, nonatomic) IBOutlet UILabel *fourSecondLable;
/**工作信息*/
@property (weak, nonatomic) IBOutlet UILabel *fourThreeLable;
/**运营商验证*/
@property (weak, nonatomic) IBOutlet UILabel *fourFourLable;
/**立即申请*/
@property (weak, nonatomic) IBOutlet UIButton *lijishengqing;


@property (weak, nonatomic) IBOutlet UITableViewCell *itemCell;

@property(nonatomic,strong) NSMutableArray * lableArray;

@property(nonatomic,strong) NSArray * moneyArray;
@property(nonatomic,strong) NSArray *dayArray;
@property(nonatomic,assign) int current;


@property(nonatomic,strong) NSArray * titleArray;
@property(nonatomic,strong) NSArray * imagesArray;


@property (weak, nonatomic) IBOutlet UIView *view1;

@property (weak, nonatomic) IBOutlet UIView *view2;
@property (weak, nonatomic) IBOutlet UIView *view3;
@property (weak, nonatomic) IBOutlet UIView *view4;
@property (weak, nonatomic) IBOutlet UIView *view5;
@property (weak, nonatomic) IBOutlet UIView *view6;
@property (weak, nonatomic) IBOutlet UIView *view7;

@property (nonatomic,strong) NSArray * viewArray;
@end

@implementation DebetDetailViewController





- (NSArray *)viewArray{
    
    if (_viewArray == nil) {
        _viewArray = @[_view1,_view2,_view3,_view4,_view5,_view6,_view7];
    }
    return _viewArray;
}


- (NSArray *)titleArray{
    
    if (_titleArray == nil) {
        _titleArray = @[@"基本信息",@"身份信息",@"工作信息",@"运营商验证",@"电商验证",@"授权征信查询",@"联系人信息"];
    }
    
    return _titleArray;
}


- (NSArray *)imagesArray{
    if (_imagesArray == nil) {
        _imagesArray = @[@"jbxx",@"sfxx",@"gzxx",@"sjyz",@"dsyz",@"zxcx",@"lxrxx"];
    }
    return _imagesArray;
}



- (NSMutableArray *)lableArray{
    if (_lableArray == nil) {
        
        _lableArray = [NSMutableArray array];
    }
    return _lableArray;
}

- (void)setupInit{
    
    _dibucell.separatorInset = UIEdgeInsetsMake(0, KScreenWidth, 0, 0);
    self.iconView.layer.cornerRadius = 5;
    self.iconView.layer.masksToBounds = YES;
    
    self.nameLable.font = kAdaptedFontSize(18);
    self.firstLable.font = kAdaptedFontSize(13);
    self.secondLable.font = kAdaptedFontSize(13);
    self.thirdLable.font = kAdaptedFontSize(13);

    [self.lableArray addObject:self.firstLable];
    [self.lableArray addObject:self.secondLable];
    [self.lableArray addObject:self.thirdLable];

    self.daikuanLable.font = kAdaptedFontSize(18);
    self.daikuanMoney.font = kAdaptedFontSize(16);
    self.daikuanMoneyRight.font = kAdaptedFontSize(16);
    
    self.fenqiLable.font = kAdaptedFontSize(18);
    self.fenqifanwei.font = kAdaptedFontSize(16);
    self.fenqiDay.font = kAdaptedFontSize(16);

    self.dayBackMoneyLable.font = kAdaptedFontSize(18);
    self.dayBackMoneyTitleLable.font = kAdaptedFontSize(16);
  
    self.rateLable.font = kAdaptedFontSize(18);
    self.dayRateTitleLable.font = kAdaptedFontSize(16);
    
    self.fastDayLable.font = kAdaptedFontSize(18);
    self.fastDayLableTitle.font = kAdaptedFontSize(16);
    
    self.shengqinlable.font = kAdaptedFontSize(18);
    self.foutFirstLable.font = kAdaptedFontSize(18);
    self.fourSecondLable.font = kAdaptedFontSize(18);
    self.fourThreeLable.font = kAdaptedFontSize(18);
    self.fourFourLable.font = kAdaptedFontSize(18);

    self.lijishengqing.layer.cornerRadius = 5;
    self.lijishengqing.layer.masksToBounds = YES;
    
    self.tableView.contentInset = UIEdgeInsetsMake(-30, 0, 0, 0);
    
    [self.itemCell setSeparatorInset:UIEdgeInsetsMake(0, MAXFLOAT, 0, 0)];
//    self.itemCell.separatorStyle = UITableViewCellSeparatorStyleNone;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = _model.name;
    
    AppDelegate * delegate = (AppDelegate *) [UIApplication sharedApplication].delegate;
    delegate.currentVC = self;

    UserInfo * unUserInfo = [NSKeyedUnarchiver unarchiveObjectWithFile:KeyedArchive(@"userInfo")];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 500;
    [self setupInit];
    
    
//    LWLog(@"%@",[self.model mj_keyValues]);
    
    NSMutableDictionary * parame  = [NSMutableDictionary dictionary];
    parame[@"projectId"] = self.model.loanId;
    parame[@"userId"] = unUserInfo == nil ? @(0) : unUserInfo.userId;
    LWLog(@"%@",parame);
   
    [HTNetworkingTool HTNetworkingToolPost:@"project/detail" parame:parame isHud:YES success:^(id json) {
        LWLog(@"%@",[json description]);
        if ([[json objectForKey:@"resultCode"] integerValue] == 2000) {
            HomeListModel * model = [HomeListModel mj_objectWithKeyValues:[json objectForKey:@"data"]];
            [self setupInit:model];
            
        }
    } failure:^(NSError *error) {
        LWLog(@"%@",[error description]);
    }];
}


- (NSString *)getRang:(NSString *)money{
    
    if (money.length > 5) {
        int rang = [money intValue] / 10000;
        return [NSString stringWithFormat:@"%d万",rang];
    }
    return money;
}


- (void)setupInit:(HomeListModel *)model{
    
    [_iconView sd_setImageWithURL:[NSURL URLWithString:model.logo] placeholderImage:[UIImage imageNamed:AppIconName] options:SDWebImageProgressiveDownload];
    _nameLable.text = model.name;
    
    if (model.tag.length) {
        NSArray * tags = [model.tag componentsSeparatedByString:@","];
        NSInteger index = tags.count > 3 ? 3 : tags.count;
        for (int i = 0; i < index; i ++) {
            UILabel * title =  [self.lableArray objectAtIndex:i];
            title.text = [NSString stringWithFormat:@"  %@  ",[tags objectAtIndex:i]];
            title.layer.cornerRadius = self.firstLable.frame.size.height * 0.5;
            title.layer.masksToBounds = YES;
            title.layer.borderWidth = .6;
            title.layer.borderColor = [UIColor lightGrayColor].CGColor;
        }
    }else{
        for (int i = 0; i < self.lableArray.count; i ++) {
            UILabel * title =  [self.lableArray objectAtIndex:i];
            title.text = nil;
        }
    }
    
    NSString * unit ;
    // 0 日利率 1 月利率  2 年利率
    if([model.deadlineUnit intValue] == 0){
        unit = @"天";
    }else if([model.deadlineUnit intValue] == 1){
        unit = @"月";
    }else{
        unit = @"年";
    }
    self.dayBackMoneyTitleLable.text = [NSString stringWithFormat:@"每%@应还",unit];
    if (model.enableMoney.length) {
        
       
        
        
        NSArray * money =  [model.enableMoney componentsSeparatedByString:@","];
        self.moneyArray = [money copy];
        if (money.count == 1) {
            
           _daikuanMoney.text = [NSString stringWithFormat:@"%@元",[self getRang:[money firstObject]]];
        }else{
           _daikuanMoney.text = [NSString stringWithFormat:@"%@ ~ %@元",[self getRang:[money firstObject]],[self getRang:[money lastObject]]];
        }
        _daikuanMoneyRight.text =  [NSString stringWithFormat:@"%@元",[self getRang:[money firstObject]]];
    }else{
        _daikuanMoney.text = @"0 元";
        _daikuanMoneyRight.text = @"0 元";
    }
    
    if (model.deadline.length) {
        NSArray * money =  [model.deadline componentsSeparatedByString:@","];
        self.dayArray = [money copy];
        _fenqifanwei.text = [NSString stringWithFormat:@"%@ ~ %@%@",[money firstObject],[money lastObject],unit];
        _fenqiDay.text = [NSString stringWithFormat:@"%@ %@",[money firstObject],unit];
    }else{
        
        _daikuanMoney.text = [NSString stringWithFormat:@"0 %@",unit];
    }
    
    // 0 日利率 1 月利率  2 年利率
    if([model.deadlineUnit intValue] == 0){
        _dayRateTitleLable.text = @"参考日利率";
    }else if([model.deadlineUnit intValue] == 1){
        _dayRateTitleLable.text = @"参考月利率";
    }else{
        _dayRateTitleLable.text = @"参考年利率";
    }
    _rateLable.text = [NSString stringWithFormat:@" %@ %%",model.interestRate];
    
    
    _fastDayLable.text = [NSString stringWithFormat:@"%@ 天",model.fastestGetTime];
    
    
    LWLog(@"%@-----%@",_daikuanMoneyRight.text,_fenqiDay.text);
    _dayBackMoneyLable.text = [self getMoneyBack:_daikuanMoneyRight.text andDay:_fenqiDay.text withRate:model];
    

    if (model.applicationMaterial.length) {
        NSArray * appArr = [model.applicationMaterial componentsSeparatedByString:@","];
        for (int i = 0; i < appArr.count; i++) {
            UIView * view = [self.viewArray objectAtIndex:i];
            view.hidden = NO;
            for (int j = 0; j < view.subviews.count; j++) {
                UIView * item = [view.subviews objectAtIndex:j];
                if ([item isKindOfClass:[UIImageView class]]) {
                    UIImageView * im = (UIImageView *)item;
                    [im setImage:[UIImage imageNamed:[self.imagesArray objectAtIndex:[[appArr objectAtIndex:i] integerValue]]]];
                }else{
                    UILabel * im = (UILabel *)item;
                    im.text = [self.titleArray objectAtIndex:[[appArr objectAtIndex:i] integerValue]];
                }
            }
        }
    }
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if (indexPath.section == 1) {
        
        if (indexPath.row == 0) {
            _current = 0;
            HSGenderPickerVC *vc = [[HSGenderPickerVC alloc] init];
            vc.titleUnit = @"请选择贷款金额(元)";
            vc.genderArray = [[NSArray alloc] initWithObjects:self.moneyArray, nil];
            vc.delegate = self;
            [self presentViewController:vc animated:YES completion:nil];
            
        }else if(indexPath.row == 1){
            _current = 1;
            HSGenderPickerVC *vc = [[HSGenderPickerVC alloc] init];
            
            NSString * unit ;
            // 0 日利率 1 月利率  2 年利率
            if([self.model.deadlineUnit intValue] == 0){
                unit = @"天";
            }else if([self.model.deadlineUnit intValue] == 1){
                unit = @"月";
            }else{
                unit = @"年";
            }
            
            vc.titleUnit = [NSString stringWithFormat:@"请选择分期时间(%@)",unit];
            vc.delegate = self;
            vc.genderArray = [[NSArray alloc] initWithObjects:self.dayArray, nil];
            [self presentViewController:vc animated:YES completion:nil];
            
        }
    }
    
    
}

-(void)genderPicker:(HSGenderPickerVC*)genderPicker
    selectedGernder:(NSString*)gender{
    LWLog(@"%@",gender);
    if (_current == 0) {
        
        LWLog(@"%@",gender);
        _daikuanMoneyRight.text = [NSString stringWithFormat:@"%@ 元",gender];
        //[self getMoneyBack:_daikuanMoneyRight.text andDay:_fenqiDay.text withRate:model];
        _dayBackMoneyLable.text = [self getMoneyBack:_daikuanMoneyRight.text andDay:_fenqiDay.text withRate:self.model];
    }else{
        
        _fenqiDay.text =  [NSString stringWithFormat:@"%@ 天",gender];
       
        _dayBackMoneyLable.text = [self getMoneyBack:_daikuanMoneyRight.text andDay:_fenqiDay.text withRate:self.model];
    }
    
    
}


//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//    if (indexPath.section == 2 && indexPath.row == 1) {
//        
//        AppTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"defome"];
//        if (cell == nil) {
//            cell = [[AppTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"defome"];
//        }
//        return cell;
//    }else{
//        return [super tableView:tableView cellForRowAtIndexPath:indexPath];
//    }
////return [super tableView:tableView cellForRowAtIndexPath:indexPath];
//}


//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
//    return 0;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
//    return 0;
//}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)lijishengqing:(id)sender {
    UserInfo * unUserInfo = [NSKeyedUnarchiver unarchiveObjectWithFile:KeyedArchive(@"userInfo")];
    
    LWLog(@"%@",[self.model mj_keyValues]);
    
    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
    dict[@"projectId"] = self.model.loanId;
    [HTNetworkingTool HTNetworkingToolPost:@"project/applyLog" parame:dict isHud:YES success:^(id json) {
        LWLog(@"%@",json);
       
    } failure:^(NSError *error) {
        LWLog(@"%@",[error description]);
    }];
    
    if (self.model.applyUrl.length) {
        PushWebViewController *vc = [[PushWebViewController alloc] init];
        LWLog(@"%@",[self.model mj_keyValues]);
        vc.funUrl = self.model.applyUrl;
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (NSString *) getMoneyBack:(NSString *)money andDay:(NSString *)day withRate:(HomeListModel *)model{
    int inMoney = [money floatValue];
    int inDay = [day floatValue];
    
    
    CGFloat step1 = (10000 * [model.interestRate floatValue] * 0.01 * inMoney) / 10000;
    CGFloat step2 = inMoney * 1.0 / inDay + step1;
    if(inDay == 0){
       return [NSString stringWithFormat:@"0 元"];
    }
    
    return [NSString stringWithFormat:@"%.2f 元",step2];
}


@end
