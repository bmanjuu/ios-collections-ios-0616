//  FISAppDelegate.h

#import <UIKit/UIKit.h>

@interface FISAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;


-(NSArray *)arrayBySortingArrayAscending:(NSArray *)array;
-(NSArray *)arrayBySortingArrayDescending:(NSArray *)array;
-(NSArray *)arrayBySwappingFirstObjectWithLastObjectInArray:(NSArray *)array; 
-(NSArray *)arrayByReversingArray:(NSArray *)array;
-(NSString *)stringInBasicLeetFromString:(NSString *)string;
-(NSArray *)splitArrayIntoNegativesAndPositives:(NSArray *)array;
-(NSArray *)namesOfHobbitsInDictionary:(NSDictionary *)hobbitNames;
-(NSArray *)stringsBeginningWithAInArray:(NSArray *)array;
-(NSInteger)sumOfIntegersInArray:(NSArray *)integers;
-(NSArray *)arrayByPluralizingStringsInArray:(NSArray *)pluralStrings;
-(NSDictionary *)countsOfWordsInString:(NSString *)string;
-(NSDictionary *)songsGroupedByArtistFromArray:(NSArray *)array; 


@end
