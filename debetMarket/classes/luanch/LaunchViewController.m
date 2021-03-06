//
//  LaunchViewController.m
//  HotTechLoan
//
//  Created by 罗海波 on 2017/12/11.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "LaunchViewController.h"
#import <SystemConfiguration/SystemConfiguration.h>
#import <MBProgressHUD.h>

@interface LaunchViewController ()

@property(nonatomic,strong) UIImageView * backImageView;

@end

@implementation LaunchViewController


- (UIImageView *)backImageView{
    if (_backImageView == nil) {
        _backImageView = [[UIImageView alloc] initWithFrame:self.view.frame];
    }
    return _backImageView;
}

- (void)networkStateChange{
    AFNetworkReachabilityManager *ReachabilityManager = [AFNetworkReachabilityManager sharedManager];
    //[ReachabilityManager startMonitoring];
    NSLog(@"manager.isReachable === %d++++++", ReachabilityManager.reachable);
    if (ReachabilityManager.reachable) {
        [self loadInitData];
    }else{
        
        [[HTTool HTToolShare] showAlertWithController:self andTitle:@"错误提示" andMessage:@"当前手机网络状态不可用,请检查网络状态或修改网络权限" conform:^{
            
            NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
            
            if ([[UIApplication sharedApplication] canOpenURL:url]) {
                
                [[UIApplication sharedApplication] openURL:url];
                
            }
            
        } cancle:^{
            
        }];
    }
    
}


- (void)checkNetwork {
    //__block BOOL result;
    AFNetworkReachabilityManager *ReachabilityManager = [AFNetworkReachabilityManager sharedManager];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(networkStateChange) name:AFNetworkingReachabilityDidChangeNotification object:nil];
    [ReachabilityManager startMonitoring];
   
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setImage];
    // Do any additional setup after loading the view.
    
    UILabel * version = [[UILabel alloc] init];
    version.text = [NSString stringWithFormat:@"%@V%@",AppName,AppVersion];
    [self.view addSubview:version];
    
    
    
    
    [self checkNetwork];
    
    
    //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChanged:) name:kReachabilityChangedNotification object:nil];
    
    
    [version mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.bottom.mas_equalTo(self.view.mas_bottom).mas_offset(kAdaptedHeight(-30));;
    }];
    [self loadInitData];
}



- (void)loadInitData {
    
    [HTNetworkingTool HTNetworkingToolPost:@"sys/init" parame:nil isHud:YES success:^(id json) {
        LWLog(@"%@",json);
        BaseInterface * base = [BaseInterface mj_objectWithKeyValues:json];
        if (base.resultCode
             == 2000) {
            
            [[NSUserDefaults standardUserDefaults] setObject:[[json objectForKey:@"data"] objectForKey:@"aboutUrl"] forKey:@"aboutUrl"];
            [[NSUserDefaults standardUserDefaults] setObject:[[json objectForKey:@"data"] objectForKey:@"creditAuthUrl"] forKey:@"creditAuthUrl"];
            [[NSUserDefaults standardUserDefaults] setObject:[[json objectForKey:@"data"] objectForKey:@"regAgreementUrl"] forKey:@"regAgreementUrl"];
            [[NSUserDefaults standardUserDefaults] setObject:[[json objectForKey:@"data"] objectForKey:@"loanProjectProcessUrl"] forKey:@"loanProjectProcessUrl"];
            
            AppDelegate * de = (AppDelegate *) [UIApplication sharedApplication].delegate;
            de.packageType = [[[json objectForKey:@"data"] objectForKey:@"packageType"] intValue];
            HTTabBarController * tab = [[HTTabBarController alloc] init];
            de.window.rootViewController = tab;
        }else{
            [SVProgressHUD showErrorWithStatus:base.resultMsg];
        }
    } failure:^(NSError *error) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self loadInitData];
        });
        LWLog(@"%@",[error description]);
    }];
}

//处理白屏问题
- (void)setImage {
    
    CGSize viewSize = CGSizeMake(KScreenWidth, KScreenHeight);
    NSString *viewOrientation = @"Portrait";    //横屏请设置成 @"Landscape"
    NSString *launchImage = nil;
    NSArray* imagesDict = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"UILaunchImages"];
    if (imagesDict.count) {
        for (NSDictionary* dict in imagesDict)
        {
            
            LWLog(@"%@",dict);
            CGSize imageSize = CGSizeFromString(dict[@"UILaunchImageSize"]);
            if (CGSizeEqualToSize(imageSize, viewSize) && [viewOrientation isEqualToString:dict[@"UILaunchImageOrientation"]])
            {
                launchImage = dict[@"UILaunchImageName"];
            }
        }
        self.backImageView.contentMode = UIViewContentModeScaleAspectFit;
        if(launchImage.length){
            [self.backImageView setImage:[UIImage imageNamed:launchImage]];
        }
        
        [self.view addSubview:self.backImageView];
    }
    
    
}
@end
