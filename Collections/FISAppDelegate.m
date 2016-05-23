//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

-(NSArray *)arrayBySortingArrayAscending:(NSArray *)array{
    
    NSSortDescriptor *sortArrayAsc = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
    NSArray *ascArray = [array sortedArrayUsingDescriptors:@[sortArrayAsc]];
    
    return ascArray;
}



-(NSArray *)arrayBySortingArrayDescending:(NSArray *)array{
    
    NSSortDescriptor *sortArrayDesc = [NSSortDescriptor sortDescriptorWithKey:nil ascending:NO];
    NSArray *descArray = [array sortedArrayUsingDescriptors:@[sortArrayDesc]];
    
    return descArray;
}



-(NSArray *)arrayBySwappingFirstObjectWithLastObjectInArray:(NSArray *)array{
    
    NSMutableArray *swap = [[NSMutableArray alloc] init];
    
    NSString *firstObject = array[0];
    NSString *lastObject = [array lastObject];
    
    //the following method inputs everything into a new array ... refer to alternate method for a more efficient/elegant option
    for(NSUInteger i=0; i<[array count]; i++){
        if(i==0){
            [swap addObject:lastObject];
        }
        else if (i==([array count]-1)){
            [swap addObject:firstObject];
        }
        else{
            [swap addObject:array[i]];
        }
    }
    
    return swap;
    //ALTERNATE METHOD: after saving objects to strings, remove objects from the array and insert them in their swapped positions
}



-(NSArray *)arrayByReversingArray:(NSArray *)array{
    
    NSMutableArray *reversed = [[NSMutableArray alloc] init];
    
    for(NSUInteger i=[array count]; i>0; i--){
        NSUInteger index = i-1; //need to establish this index b/c there would otherwise be an error of going over the limit of the array. setting i=[array count]-1 doesn't really work in this case either b/c it doesn't get to add in the last object of the array.
        [reversed addObject:array[index]];
    }
    
    return reversed;
}



-(NSString *)stringInBasicLeetFromString:(NSString *)string{
    
    NSDictionary *leetValues = @{ @"a" : @"4",
                                  @"s" : @"5",
                                  @"i" : @"1",
                                  @"l" : @"1",
                                  @"e" : @"3",
                                  @"t" : @"7" };
    
    NSMutableArray *leetString = [[NSMutableArray alloc] init];
    
    //takes the string and puts each character into the leetString mutable array declared above
    for(NSUInteger i=0; i<[string length]; i++){
        NSString *character = [string substringWithRange:NSMakeRange(i, 1)];
        //substringWithRange: Returns a string object containing the characters of the receiver that lie within a given range.
        //NSMakeRange: Creates a new NSRange from the specified values. (location, length)
        //in this case, it is location i with length one b/c you are extracting 1 character from the string through each iteration of the for loop
        [leetString addObject:character];
    }
    
    for(NSUInteger i=0; i<[leetString count]; i++){
        if([[leetValues allKeys] containsObject:leetString[i]]){ //if dictionary keys contains character in leetString array created above, then redefine the character according to the dictionary's value for the character's key
            leetString[i] = [leetValues valueForKey:leetString[i]];
        }
    }
    
    NSString *finalLeetString = [leetString componentsJoinedByString:@""];
    
    return finalLeetString;
}



-(NSArray *)splitArrayIntoNegativesAndPositives:(NSArray *)array{
    
    NSMutableArray *positive = [[NSMutableArray alloc] init];
    NSMutableArray *negative = [[NSMutableArray alloc] init];
    
    for(NSUInteger i=0; i<[array count]; i++){
        if([array[i] integerValue] >= 0){
            [positive addObject:array[i]];
        }
        else{
            [negative addObject:array[i]];
        }
    }
    
    return @[negative, positive];
}



-(NSArray *)namesOfHobbitsInDictionary:(NSDictionary *)hobbitNames{
    //return an array containing the keys from the given dictionary whose value is "hobbit"
    
    NSArray *namesOfHobbits = [hobbitNames allKeysForObject:@"hobbit"];
    
    //for(NSString *middleEarthFolk in [hobbitNames allKeys]){
    //    if([middleEarthFolk valueForKey:@"hobbit"]){
    //        [namesOfHobbits addObject:middleEarthFolk];
    //    }
    // } //this gives an error about key-value coding compliance
    return namesOfHobbits;
}



-(NSArray *)stringsBeginningWithAInArray:(NSArray *)array{
    //should return an array containing the strings from the given array begin with the letter "a".
    
    NSMutableArray *wordsStartingWithA = [[NSMutableArray alloc] init];
    
    for (NSString *words in array){
        if([[words lowercaseString] hasPrefix:@"a"]){
            [wordsStartingWithA addObject:words];
        }
    }
    
    return wordsStartingWithA;
}



-(NSInteger)sumOfIntegersInArray:(NSArray *)integers{
    
    NSInteger sum = 0;
    
    for (NSString *number in integers){
        sum += [number integerValue];
    }
    return sum;
}



-(NSArray *)arrayByPluralizingStringsInArray:(NSArray *)pluralStrings{
    
    NSMutableArray *pluralWords = [[NSMutableArray alloc] init];
    
    for(NSString *singular in pluralStrings){
        NSString *plural = [singular copy];
        if([singular hasSuffix:@"e"] || [singular hasSuffix:@"d"]){
            plural = [plural stringByAppendingString:@"s"]; //need to make sure to redefine "plural", otherwise, the word will not change to plural form
        }
        else if([singular hasPrefix:@"b"]){
            plural = [plural stringByAppendingString:@"es"];
        }
        else if([singular hasPrefix:@"o"]){
            plural = [plural stringByAppendingString:@"en"];
        }
        else if([singular containsString:@"oo"]){
            plural = [plural stringByReplacingOccurrencesOfString:@"oo" withString:@"ee"];
        }
        else if([singular hasSuffix:@"us"]){
            plural = [plural stringByReplacingOccurrencesOfString:@"us" withString:@"i"];
        }
        else if([singular hasSuffix:@"um"]){
            plural = [plural stringByReplacingOccurrencesOfString:@"um" withString:@"a"];
        }
        
        [pluralWords addObject:plural];
    }
    
    return pluralWords;
}



-(NSDictionary *)countsOfWordsInString:(NSString *)string{
    
    NSMutableDictionary *wordCount = [[NSMutableDictionary alloc] init];
    NSArray *punctuation = @[@".", @",", @"-", @";"];
    NSString *mString = [string mutableCopy];
    
    //remove punctuation, make it lowercase, and add modified word to array
    for (NSUInteger i=0; i < [punctuation count]; i++){
        if([mString containsString:punctuation[i]]){
            mString = [[mString stringByReplacingOccurrencesOfString:punctuation[i] withString:@""] lowercaseString];
        }
    }
    
    NSArray *stringArray = [mString componentsSeparatedByString:@" "]; //cannot nest this part into the above for/if loops. has to be separate. otherwise it adds the entire string in and results are weird.
    
    //place words in dictionary along with word count
    for(NSString *word in stringArray){
        NSNumber *count = @1; //initialize count for words to 1
        if([[wordCount allKeys] containsObject:word]){
            count = @([wordCount[word] integerValue] + 1); //convert to integer value to do math and convert back to NSNumber to add into dictionary
            wordCount[word] = count;
        }
        else {
            [wordCount setObject:count forKey:word];
        }
    }
    
    return wordCount;
}



-(NSDictionary *)songsGroupedByArtistFromArray:(NSArray *)array{
    
    NSMutableDictionary *filteredSongsAndArtists = [[NSMutableDictionary alloc] init];
    
    for (NSString *artistAndSong in array){
        NSArray *separatedArtistAndSong = [artistAndSong componentsSeparatedByString:@" - "];
        NSString *artist = separatedArtistAndSong[0];
        NSString *song = separatedArtistAndSong[1];
        
        //if the dictionary contains a key for the artist, add song; if not, make a new key for the artist and a mutable array for the value which includes the song
        if ([[filteredSongsAndArtists allKeys] containsObject:artist]){
            [filteredSongsAndArtists[artist] addObject:song];
        }
        else {
            filteredSongsAndArtists[artist] = [@[song] mutableCopy];
        }
    }
    
    //alphabetize song values in the dictionary per artist.
    for(NSArray *artist in [filteredSongsAndArtists allKeys]){
        NSSortDescriptor *sortSongs = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
        NSArray *alphabetizedSongs = [filteredSongsAndArtists[artist] sortedArrayUsingDescriptors:@[sortSongs]];        filteredSongsAndArtists[artist] = alphabetizedSongs; //redefine the value for the key in the dictionary to the alphabetized array of songs.
    }
    
    return filteredSongsAndArtists;
}






// ////////////////////////////////////////////////////////////////////////////////////////////////////////
// below contains code from my first pass of the collections lab



/*
 -(NSArray *)arrayBySortingArrayAscending:(NSArray *)array{
 
 NSSortDescriptor *sortArrayAsc = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
 NSArray *sortedArrayAsc = [array sortedArrayUsingDescriptors:@[sortArrayAsc]];
 
 return sortedArrayAsc;
 }
 
 
 
 -(NSArray *)arrayBySortingArrayDescending:(NSArray *)array{
 
 NSSortDescriptor *sortArrayDesc = [NSSortDescriptor sortDescriptorWithKey:nil ascending:NO];
 NSArray *sortedArrayDesc = [array sortedArrayUsingDescriptors:@[sortArrayDesc]];
 
 return sortedArrayDesc;
 }
 
 
 
 -(NSArray *)arrayBySwappingFirstObjectWithLastObjectInArray:(NSArray *)array{
 
 NSMutableArray *swap = [array mutableCopy];
 NSUInteger lastIndex = [array count]-1;
 [swap exchangeObjectAtIndex:0 withObjectAtIndex:lastIndex];
 
 return swap;
 
 }
 
 
 
 -(NSArray *)arrayByReversingArray:(NSArray *)array{
 NSMutableArray *reversed = [[NSMutableArray alloc] init];
 for (NSUInteger i = 0; i < [array count]; i++){
 [reversed insertObject:array[i] atIndex:0];
 }
 //ALTERNATE METHOD: NSArray *reversed = [[array reverseObjectEnumerator] allObjects];
 return reversed;
 }
 
 
 -(NSString *)stringInBasicLeetFromString:(NSString *)string{
 
 NSMutableArray *mStringCharacters = [[NSMutableArray alloc] initWithCapacity:[string length]];
 for (NSUInteger i = 0; i <[string length]; i++){
 NSString *character = [NSString stringWithFormat:@"%c", [string characterAtIndex:i]];
 [mStringCharacters addObject:character];
 }
 
 for (NSUInteger i = 0; i < [mStringCharacters count]; i++){
 if ([mStringCharacters[i] isEqualToString: @"a"]){
 mStringCharacters[i] = @"4";
 }
 else if ([mStringCharacters[i] isEqualToString: @"s"]){
 mStringCharacters[i] = @"5";
 }
 else if ([mStringCharacters[i] isEqualToString: @"i"]){
 mStringCharacters[i] = @"1";
 }
 else if ([mStringCharacters[i] isEqualToString: @"l"]){
 mStringCharacters[i] = @"1";
 }
 else if ([mStringCharacters[i] isEqualToString: @"e"]){
 mStringCharacters[i] = @"3";
 }
 else if ([mStringCharacters[i] isEqualToString: @"t"]){
 mStringCharacters[i] = @"7";
 }
 }
 
 NSString* leetString = [mStringCharacters componentsJoinedByString:@""];
 
 return leetString;
 
 //ALTERNATE (BETTER!!) METHOD: make a dictionary with key-value pairs of things to replace and then loop through the dictionary to replace characters using stringbyreplacing occurrences of string with string method. this makes the code readable and easier to modify
 }
 
 
 -(NSArray *)splitArrayIntoNegativesAndPositives:(NSArray *)array{
 
 NSMutableArray *mArray = [[NSMutableArray alloc] init];
 
 NSMutableArray *positiveArray = [[NSMutableArray alloc] init];
 NSMutableArray *negativeArray = [[NSMutableArray alloc] init];
 
 for (NSUInteger i = 0; i < [array count]; i ++){
 if ([array[i] integerValue] >= 0){
 [positiveArray addObject:array[i]];
 }
 else {
 [negativeArray addObject:array[i]];
 }
 }
 
 [mArray addObject:negativeArray];
 [mArray addObject:positiveArray];
 
 return mArray; //ALTERNATE METHOD: return @[negativeArray, positiveArray];
 }
 
 
 
 -(NSArray *)namesOfHobbitsInDictionary:(NSDictionary *)hobbitNames{
 
 NSArray *hobbitNamesArray = [hobbitNames allKeysForObject:@"hobbit"];
 
 return hobbitNamesArray;
 }
 
 
 
 -(NSArray *)stringsBeginningWithAInArray:(NSArray *)array{
 NSPredicate *stringBeginsWithA = [NSPredicate predicateWithFormat:@"self BEGINSWITH[cd] 'a'"];
 NSArray *arrayForStringBeginsWithA = [array filteredArrayUsingPredicate:stringBeginsWithA];
 return arrayForStringBeginsWithA;
 }
 
 
 -(NSInteger)sumOfIntegersInArray:(NSArray *)integers{
 
 NSInteger sum = 0;
 
 for(NSUInteger i = 0; i<[integers count]; i++){
 sum += [integers[i] integerValue];
 }
 
 return sum;
 }
 
 
 -(NSArray *)arrayByPluralizingStringsInArray:(NSArray *)pluralStrings{
 NSMutableArray *plural = [[NSMutableArray alloc] init];
 
 for(NSString* singularWord in pluralStrings){
 NSString *pluralWord = [singularWord mutableCopy];
 if([singularWord hasPrefix:@"b"]){
 pluralWord = [pluralWord stringByAppendingString:@"es"];
 }
 else if ([singularWord hasPrefix:@"o"]){
 pluralWord = [pluralWord stringByAppendingString:@"en"];
 }
 else if ([singularWord hasSuffix:@"ius"]){
 pluralWord = [pluralWord stringByReplacingOccurrencesOfString:@"ius" withString:@"ii"];
 }
 else if ([singularWord hasSuffix:@"ium"]){
 pluralWord = [pluralWord stringByReplacingOccurrencesOfString:@"ium" withString:@"ia"];
 }
 else if ([singularWord isEqualToString:@"foot"]){
 pluralWord = [pluralWord stringByReplacingOccurrencesOfString:@"oo" withString:@"ee"];
 }
 else {
 pluralWord = [pluralWord stringByAppendingString:@"s"];
 }
 [plural addObject:pluralWord];
 }
 
 return plural;
 }
 
 
 
 -(NSDictionary *)countsOfWordsInString:(NSString *)string{
 
 NSMutableDictionary *wordCount = [[NSMutableDictionary alloc] init];
 NSArray *punctuation = @[@".", @",", @"-", @";"];
 NSString *mString = [string mutableCopy];
 
 //remove punctuation
 for (NSUInteger i=0; i < [punctuation count]; i++){
 if([mString containsString:punctuation[i]]){
 mString = [[mString stringByReplacingOccurrencesOfString:punctuation[i] withString:@""] lowercaseString];
 }
 }
 
 //loop through word, count occurrences, and input in dictionary
 NSArray *placeWordsInArray = [[mString componentsSeparatedByString:@" "] mutableCopy];
 for (NSString *word in placeWordsInArray){
 NSInteger count = 1;
 if([[wordCount allKeys] containsObject:word]){
 // count++; (this stops counting after 2, even if more occurrences come up, so changed it to how it is on line 202)
 // NSNumber *numberCount = @(count);
 count = [wordCount[word] integerValue] + 1;
 wordCount[word] = @(count);
 }
 else{
 [wordCount setObject:@(1) forKey:word]; //make sure you are inputting an NSNumber and not a string!!
 }
 }
 
 return wordCount;
 }
 
 
 -(NSDictionary *)songsGroupedByArtistFromArray:(NSArray *)array{
 NSMutableDictionary *songsAndArtists = [[NSMutableDictionary alloc] init];
 
 for (NSString *groupSongsAndArtists in array){
 NSArray *artistAndSong = [groupSongsAndArtists componentsSeparatedByString:@" - "];
 NSString *artist = artistAndSong[0];
 NSString *song = artistAndSong[1];
 
 if([[songsAndArtists allKeys] containsObject:artist]){
 [songsAndArtists[artist] addObject:song];
 }
 else {
 songsAndArtists[artist] = [@[song]mutableCopy];
 }
 }
 
 for (NSArray *artist in [songsAndArtists allKeys]){
 NSSortDescriptor *sortSongs = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
 NSArray *songsPerArtist = [songsAndArtists[artist] sortedArrayUsingDescriptors:@[sortSongs]];
 songsAndArtists[artist] = songsPerArtist;
 }
 
 return songsAndArtists;
 }
 */


@end
