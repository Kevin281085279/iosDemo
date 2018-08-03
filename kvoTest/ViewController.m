//
//  ViewController.m
//  kvoTest
//
//  Created by Monph on 2018/8/1.
//  Copyright © 2018年 Monph. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import <objc/message.h>
#import <objc/runtime.h>
#import "UIButton+Click.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    Person *p1 = [[Person alloc] init];
//    [self outCount];
    [self kvoAction];
    self.ceshiBtn.cs_acceptEventInterval = 2;
}

- (void)outCount
{
    unsigned int outCount = 0;
    Ivar *ivars = class_copyIvarList([Person class], &outCount);
    for (int i = 0; i < outCount; i++) {
        Ivar ivar = ivars[i];
        const char *name = ivar_getName(ivar);
        const char *type = ivar_getTypeEncoding(ivar);
        NSLog(@"成员变量名：%s 成员变量类型：%s",name,type);
    }
    free(ivars);

}

- (void)kvoAction
{
    id p1 = objc_msgSend(objc_getClass("Person"),sel_registerName("alloc"));
    objc_msgSend(p1, sel_registerName("init"));
    Person *p2 = [[Person alloc] init];

    //    NSLog(@"%p\n%p",p1,p2);
    //    NSLog(@"before\n%s\n%s",object_g    etClassName(p1),object_getClassName(p2));


    [p1 addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];

    //    NSLog(@"after\n%s\n%s",object_getClassName(p1),object_getClassName(p2));
    //    NSLog(@"%p\n%p",p1,p2);

    ((Person*)p1).name = @"dzd";
    [p1 setValue:@"999" forKey:@"name"];

    p2.name = @"123";
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    NSLog(@"change=========%@",change);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)ceshiAction:(id)sender {
    NSDate *now = [NSDate date];
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    format.dateFormat = @"HH:mm:ss";
    NSString *time = [format stringFromDate:now];
    NSLog(@"===\n%@",time);
}
@end
