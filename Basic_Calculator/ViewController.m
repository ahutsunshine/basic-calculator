//
//  ViewController.m
//  Basic_Calculator
//
//  Copyright © 2016年 ustc. All rights reserved.
//

#import "ViewController.h"
#import "Calculate.h"

@interface ViewController ()
@property (strong,nonatomic)Calculate *calculate;
@property (weak, nonatomic) IBOutlet UITextField *inputResult;
@property int flag;
@end

@implementation ViewController

-(Calculate *)calculator{
    if(!_calculate){
        _calculate=[[Calculate alloc]init];
    }
    return _calculate;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.calculate=[[Calculate alloc]init];
}
/** 基本输入数字和操作符在同一个事件进行处理*/
- (IBAction)touchViewExpression:(UIButton *)sender {
    
    if([self.inputResult.text length]!=0&&_flag==1){
        NSString *ch=[[sender titleLabel] text];
        if([ch isEqualToString:@"("]||[ch isEqualToString:@"×"]
           ||[ch isEqualToString:@"÷"]
           ||[ch isEqualToString:@"+"]
           ||[ch isEqualToString:@"-"]
           ||[ch isEqualToString:@")"]){
            self.inputResult.text=@"暂不支持连续运算";
            self.calculator.input=nil;
            _flag=1;
            return;
        }else{
            self.inputResult.text=nil;
            self.calculator.input=nil;
            _flag=0;
        }
    }
    
    //这种处理的原因是对x ÷进行实际运算的替换* /，但显示仍然是x +
    if([[[sender titleLabel] text] isEqualToString:@"×"]){
        [self.calculator.input appendString:@"*"];
    }else if([[[sender titleLabel] text] isEqualToString:@"÷"]){
        [self.calculator.input appendString:@"/"];
    }else{
        [self.calculator.input appendString:[[sender titleLabel] text]];
    }
    NSMutableString *originalString=[NSMutableString stringWithString:self.inputResult.text];
    [originalString appendString:[[sender titleLabel] text]];
    self.inputResult.text=originalString;
}
/** 清空输出框数据以及存储的数据*/
- (IBAction)clearInputExpression:(UIButton *)sender {
    self.inputResult.text=nil;
    self.calculator.input=nil;
    _flag=0;
}
/** 删除输入数字的最后一个字符*/
- (IBAction)deleteExpressionLastNumber:(UIButton *)sender {
    NSInteger length=[self.calculator.input length];
    if(length>0){
        [self.calculator.input deleteCharactersInRange:NSMakeRange(length-1, 1)];
        //一定也要对输入框中的表达式进行处理，因为input里面的× ÷和显示的* /不同
        NSMutableString *delResultString=[NSMutableString stringWithString:self.inputResult.text];
        [delResultString deleteCharactersInRange:NSMakeRange(length-1, 1)];
        NSLog(@"deleteResult=%@",self.calculator.input);
        self.inputResult.text=delResultString;
    }
}

/** 核心操作 计算结果*/
- (IBAction)calculateExpression:(UIButton *)sender {
    //标志为1，表明已经按了=键，计算了结果，下次再输入其他表达式会先清空数据
    _flag=1;
    if([self.inputResult.text length]==0){
        self.inputResult.text=@"Error input!";
        return;
    }
    
    NSMutableString *calculateResult=[NSMutableString stringWithString:self.calculator.input];
    [calculateResult appendString:[[sender titleLabel] text]];
    self.inputResult.text=[self.calculator ExpressionCalculate:calculateResult];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
