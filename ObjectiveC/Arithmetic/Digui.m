//
//  main.m
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-3-27.
//  Copyright (c) 2013年 zhnews. All rights reserved.
//

#import <Foundation/Foundation.h>

#warning 把代码拷贝到main.m文件, 然后把"main_digui"改为"main"即可运行
int main_digui(int argc, const char * argv[])
{
    
    @autoreleasepool {
        
        int number = Foo(30);
        NSLog(@"%d",number);
        
        int jc = factorial(5);
        NSLog(@"%d",jc);
        
        int jc2 = jiecheng(5);
        NSLog(@"%d",jc2);
        
        int h = hoop(5);
        NSLog(@"%d",h);
        
        int h2 = hoop2(5);
        NSLog(@"%d",h2);
        
    }
    return 0;
}

// 递归算法。例：一列数的规则如下: 1、1、2、3、5、8、13、21、34...... 求第30位数是多少。
int Foo(int i)
{
    if (i <= 0)
        return 0;
    else if(i > 0 && i <= 2)
        return 1;
    else return Foo(i - 1) + Foo(i - 2);
}

// 阶乘
int factorial(int n) {
    if(n == 0) {
        return 1;
    }
    return n * factorial(n-1);
}

// 循环 == 阶乘
int jiecheng(int n) {
    int t = 1;
    for(int i = 1; i <= n; i++) {
        t = t * i;
    }
    return t;
}

//（1）一只青蛙一次可以跳上 1 级台阶，也可以跳上 2 级。求该青蛙跳上一个 n 级的台阶总共有多少种跳法?
int hoop(int n)
{
    if(n < 0)
        return 0;
    else if(n == 0)
        return 1;
    else
        return hoop(n-2) + hoop(n-1);
}

//（2）一只青蛙一次可以跳上1级台阶，也可以跳上 2 级……它也可以跳上 n 级，此时该青蛙跳上一个 n 级的台阶总共有多少种跳法？
int hoop2(int n)
{
    int m,i;
    m = 0;
    if(n < 0)
    {
        m = 0;
    }
    else if(n == 0)
    {
        m = 1;
    }
    else
    {
        for(i = n-1; i >= 0; i--)
        {
            m += hoop2(i);
        }
    }
    return m;
}
