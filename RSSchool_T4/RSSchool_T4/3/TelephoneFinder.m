#import "TelephoneFinder.h"

@implementation TelephoneFinder
- (NSArray <NSString*>*)findAllNumbersFromGivenNumber:(NSString*)number {
    NSCharacterSet* notDigits = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
       if ([number rangeOfCharacterFromSet:notDigits].location != NSNotFound) {
           return nil;
       }
    NSMutableArray *result = [[NSMutableArray alloc] init];
     for (int i = 0; i < [number length]; i++) {
   
        unichar digit = [number characterAtIndex:i];
        NSString *rrr = [NSString stringWithFormat:@"%C", digit];
        NSArray *array = [self neighbours:rrr];
         for (NSString *string in array) {
                         [result addObject:[number stringByReplacingCharactersInRange:NSMakeRange(i, 1) withString:string]];
        }
        
 
    }
    
    return result;

}

-(NSArray*)neighbours:(NSString*)number{
 
    switch (number.integerValue) {
        case 0:
            return @[@"8"];
            break;
        case 1:
            return @[@"2",@"4"];
            break;
        case 2:
            return @[@"1",@"3",@"5"];
            break;
        case 3:
            return @[@"2",@"6"];
            break;
        case 4:
            return @[@"1",@"5",@"7"];
            break;
        case 5:
            return @[@"2",@"4",@"6",@"8"];
            break;
        case 6:
            return @[@"3",@"5",@"9"];
            break;
        case 7:
            return @[@"4",@"8"];
            break;
        case 8:
            return @[@"5",@"7",@"9",@"0"];
            break;
        case 9:
            return @[@"6",@"8"];
            break;
            
        default:
            return nil;
            break;
    }
}

@end
