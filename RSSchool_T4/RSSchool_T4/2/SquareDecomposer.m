#import "SquareDecomposer.h"

@implementation SquareDecomposer
- (NSArray <NSNumber*>*)decomposeNumber:(NSNumber*)number {
     NSMutableArray<NSNumber*> *result = [NSMutableArray arrayWithObject: number];

        long summ = 0;
        while ([result count] != 0) {
            long point = [result lastObject].longValue;
            [result removeLastObject];
            summ += pow(point, 2);

            for (long i = point - 1; i > 0; i--) {
                if (summ - (pow(i, 2)) >= 0) {
                    summ -= pow(i, 2);
                    [result addObject: @(i)];
                    if (summ == 0) {
                        return [result sortedArrayUsingSelector: @selector(compare:)];
                    }
                }
            }

        }

        return nil;
    }
@end
