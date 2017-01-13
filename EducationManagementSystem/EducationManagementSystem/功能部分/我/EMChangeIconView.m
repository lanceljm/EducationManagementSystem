//
//  EMChangeIconView.m
//  EducationManagementSystem
//
//  Created by ljm on 2017/1/11.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import "EMChangeIconView.h"
#import "EMIconChangeInfo.h"
#import <MBProgressHUD.h>
#import "EMBaseInfoLabel.h"

@interface EMChangeIconView ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property(nonatomic,strong)EMIconChangeInfo *changeIconImage;

@property(nonatomic,strong)EMBaseInfoLabel *name;
@property(nonatomic,strong)EMBaseInfoLabel *telephone;
@property(nonatomic,strong)EMBaseInfoLabel *postion;
@property(nonatomic,strong)EMBaseInfoLabel *classWithGarde;

@end

@implementation EMChangeIconView

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.tabBarController.tabBar.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupUI];
}

-(void)setupUI {
    [self setNavi];
    [self.view addSubview:self.changeIconImage];
    
    UILabel *baseLabel = [[UILabel alloc]initWithFrame:AAdaptionRect(30, 300 + 20, 150, 28)];
    baseLabel.text = @"基础信息";
    baseLabel.textColor = [UIColor cz_colorWithHex:0x1e1e1e];
    baseLabel.font = AAFont(28);
    [self.view addSubview:baseLabel];
    
    [self.view addSubview:self.name];
    [self.view addSubview:self.telephone];
    [self.view addSubview:self.postion];
    [self.view addSubview:self.classWithGarde];
    
}

-(void)setNavi {
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, 0, 40, 40);
    [leftBtn setTitle:@"" forState:UIControlStateNormal];
    [leftBtn setImage:[UIImage imageNamed:@"arrow"] forState:UIControlStateNormal];
    leftBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -40, 0, 0);
    [leftBtn addTarget:self action:@selector(dismissVC) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *btn = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = btn;
}

-(void)dismissVC {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -- getters
-(EMIconChangeInfo *)changeIconImage {
    if (!_changeIconImage) {
//        __weak typeof(self)weakself = self;
        _changeIconImage = [[EMIconChangeInfo alloc]initWithFrame:AAdaptionRect(0, 64*2 + 32, kBaseWidth, 146)  withBtnBlock:^(id sender) {
            //修改头像
            UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"选择图像" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
                [alertVC addAction:[UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    //判断是否有相机
                    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
                    //拍照
                    UIImagePickerController *imagePicker = [[UIImagePickerController alloc]init];
                    imagePicker.delegate = self;
                    imagePicker.allowsEditing = YES;
                    imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
                    [self presentViewController:imagePicker animated:YES completion:nil];
                    }else {
                        NSLog(@"该设备没有相机");
                        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
                        hud.mode = MBProgressHUDModeAnnularDeterminate;
                        hud.label.text = @"该设备没有相机";
                        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                            hud.hidden = YES;
                        });
                    }
                }]];
    
            [alertVC addAction:[UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                //相册
                UIImagePickerController *imagePicker = [[UIImagePickerController alloc]init];
                imagePicker.delegate = self;
                imagePicker.allowsEditing = YES;
                imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                [self presentViewController:imagePicker animated:YES completion:nil];
                
            }]];
            [alertVC addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                //取消
            }]];
            [self presentViewController:alertVC animated:YES completion:nil];
        }];

    }
    return _changeIconImage;
}

-(EMBaseInfoLabel *)name {
    if (!_name) {
//        NSDictionary *userInfo = [[NSUserDefaults standardUserDefaults] objectForKey:@"UserInfo"];
        _name = [[EMBaseInfoLabel alloc]initWithFrame:AAdaptionRect(0, CGRectGetMaxY(self.changeIconImage.frame)/AAdaptionWidth() + 68, kBaseWidth, 100) withTitle:@"姓名" withContent:USER_INFO[@"staffName"]];
    }
    return _name;
}

-(EMBaseInfoLabel *)telephone {
    if (!_telephone) {
        _telephone = [[EMBaseInfoLabel alloc]initWithFrame:AAdaptionRect(0, CGRectGetMaxY(self.name.frame)/AAdaptionWidth(), kBaseWidth, 100) withTitle:@"电话" withContent:USER_INFO[@"staffTelphone"]];
    }
    return _telephone;
}
    
-(EMBaseInfoLabel *)postion {
    if (!_postion) {
        _postion = [[EMBaseInfoLabel alloc]initWithFrame:AAdaptionRect(0, CGRectGetMaxY(self.telephone.frame)/AAdaptionWidth(), kBaseWidth, 100) withTitle:@"职务" withContent:USER_INFO[@"staffPost"]];
    }
    return _postion;
}
    
-(EMBaseInfoLabel *)classWithGarde {
    if (!_classWithGarde) {
        NSString *classSub = [USER_INFO[@"staffYear"] substringToIndex:4];
        NSString *classString = [NSString stringWithFormat:@"%@届%@班",classSub,USER_INFO[@"staffId"]];
        _classWithGarde = [[EMBaseInfoLabel alloc]initWithFrame:AAdaptionRect(0, CGRectGetMaxY(self.postion.frame)/AAdaptionWidth(), kBaseWidth, 100) withTitle:@"班级" withContent:classString];
    }
    return _classWithGarde;
}

//保存相册的图片到本地
-(void)saveImage:(UIImage *)currentImage withName:(NSString *)imageName {
    NSData *imageData = UIImageJPEGRepresentation(currentImage, 1);
    //获取沙盒目录
    NSString *fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:imageName];
    //将图片写入文件
    [imageData writeToFile:fullPath atomically:NO];
    
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    //保存图片到本地
    [self saveImage:image withName:@"avator.png"];
    NSString *fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"avator.png"];
    
    UIImage *filePath = [[UIImage alloc]initWithContentsOfFile:fullPath];
    
    NSLog(@"图片：%@",filePath);
    
//    NSString *urlStr = @"http://192.168.0.117/api/staff/setStaffPicture.html";
//    NSDictionary *staffDic = [[NSUserDefaults standardUserDefaults] objectForKey:@"UserInfo"];
    NSDictionary *parm = @{@"staffId":USER_INFO[@"staffId"],@"file":filePath,@"token":USER_INFO[@"token"]};
    NSLog(@"上传需要参数：%@",parm);
    [NetRequest POST:sendIconUrl parameters:parm success:^(id responseObject) {
        NSLog(@"上传头像成功");
    } failture:^(NSError *error) {
        //上传失败
        NSLog(@"头像上传失败");
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
