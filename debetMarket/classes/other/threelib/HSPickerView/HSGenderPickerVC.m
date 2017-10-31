//
//  HSGenderPickerVC.m
//  HSPickerViewDemo
//
//  Created by husong on 2017/10/27.
//  Copyright © 2017年 husong. All rights reserved.
//

#import "HSGenderPickerVC.h"

@interface HSGenderPickerVC ()

@end

@implementation HSGenderPickerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pickerTitle = self.titleUnit;
    self.definesPresentationContext = YES;
    self.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    
//    self.genderArray = @[@[@"男",@"女"]];
    self.currentGender = _genderArray[0][0];
    self.dataArray = _genderArray;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    self.currentGender = self.genderArray[0][row];
}

#pragma mark - privateMethods

-(void)cancleAction{
    [super cancleAction];
}
-(void)ensureAction{
    [super ensureAction];
    
    if ([self.delegate respondsToSelector:@selector(genderPicker:selectedGernder:)]) {
        [self.delegate genderPicker:self selectedGernder:_currentGender];
    }
    
}


@end
