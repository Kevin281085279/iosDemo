//
//  Person.m
//  kvoTest
//
//  Created by Monph on 2018/8/1.
//  Copyright © 2018年 Monph. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)setName:(NSString *)name{
    _name = [name copy];
    NSLog(@"%@",name);
}

- (void)willChangeValueForKey:(NSString *)key{
    NSLog(@"willChangeValueForKey - begin");
    [super willChangeValueForKey:key];
    NSLog(@"willChangeValueForKey - end");
}

- (void)didChangeValueForKey:(NSString *)key
{
    NSLog(@"didChangeValueForKey - begin");
    [super didChangeValueForKey:key];
    NSLog(@"didChangeValueForKey - end");
}

@end
