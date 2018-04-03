//
//  person.m
//  消息转发机制
//
//  Created by wqf on 2018/4/3.
//  Copyright © 2018年 wqf. All rights reserved.
//
/**
 //消息转发
 - (id)forwardingTargetForSelector:(SEL)aSelector OBJC_AVAILABLE(10.5, 2.0, 9.0, 1.0, 2.0);
 //标准的消息转发
 - (void)forwardInvocation:(NSInvocation *)anInvocation OBJC_SWIFT_UNAVAILABLE("");
 - (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector OBJC_SWIFT_UNAVAILABLE("");
 //动态方法解析
 + (BOOL)resolveClassMethod:(SEL)sel OBJC_AVAILABLE(10.5, 2.0, 9.0, 1.0, 2.0);
 + (BOOL)resolveInstanceMethod:(SEL)sel OBJC_AVAILABLE(10.5, 2.0, 9.0, 1.0, 2.0);
 */


#import "Person.h"
#import "Animal.h"
#import <objc/message.h>
@implementation Person
+(BOOL)resolveInstanceMethod:(SEL)sel
{
//    if(sel == @selector(run)){
//        class_addMethod(self, sel, (IMP)runNew, "v@:");
//        return YES;
//    }else
    return [super resolveInstanceMethod:sel];
}
void runNew(id self,SEL _cmd){
    NSLog(@"%@",NSStringFromSelector(_cmd));
}


-(id)forwardingTargetForSelector:(SEL)aSelector
{
    return [super forwardingTargetForSelector:aSelector];
//    return [[animal alloc] init];
}
//标准的消息转发
-(void)forwardInvocation:(NSInvocation *)anInvocation
{
    Animal * ani = [[Animal alloc] init];
    if ([ani respondsToSelector:anInvocation.selector]) {
        [anInvocation invokeWithTarget:ani];
    }else{
        return [super forwardInvocation:anInvocation];
    }
}
//生成一个方法签名
-(NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    //转化成字符串
    NSString * sel = NSStringFromSelector(aSelector);
    //判断转发
    if ([sel isEqualToString:@"run"]) {
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    }
    return [super methodSignatureForSelector:aSelector];
}
-(void)doesNotRecognizeSelector:(SEL)aSelector
{
    NSLog(@"not have selector %@",NSStringFromSelector(aSelector));
}
@end
