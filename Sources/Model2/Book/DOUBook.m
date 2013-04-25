//
//  DOUBook.m
//  DoubanAPIEngine
//
//  Created by Panglv on 12/5/12.
//  Copyright (c) 2012 Douban Inc. All rights reserved.
//

#import "DOUBook.h"

@implementation DOUBook {
}

- (NSString *)rating{
    return [self book][@"rating"][@"average"];
}

- (NSString *)numberOfRaters{
    return [self book][@"rating"][@"numRaters"];
}

- (NSString *)title {
    return [self book][@"title"];
}

- (NSArray *)authors {
    return [self book][@"author"];
}

- (NSString *)author {
    return [[self authors] componentsJoinedByString:@", "];
}

- (NSString *)id {
    return [self book][@"id"];
}

- (NSString *)authorIntro {
    return [self book][@"author_intro"];
}

- (NSString *)publisher {
    return [self book][@"publisher"];
}

- (NSString *)pages{
    return [self book][@"pages"];
}

- (NSString *)price{
    return [self book][@"price"];
}

- (NSString *)publishDate{
    return [self book][@"pubdate"];
}

- (NSString *)myComment{
    return self.dictionary[@"comment"];
}

- (void)setComment:(NSString *)comment {
    self.dictionary[@"comment"] = comment;
}


- (NSString *)myRating{
    return self.dictionary[@"rating"][@"value"];
}

- (NSString *)smallImageUrl {
    if (![self images]) {
        return nil;
    } else {
        return [[self images] objectForKey:@"small"];
    }
}

- (NSString *)mediumImageUrl {
    if (![self images]) {
        return nil;
    } else {
        return [[self images] objectForKey:@"medium"];
    }
}

- (NSDictionary *)images {
    return [[self book] objectForKey:@"images"];
}


- (NSDictionary *)book {
    return [self.dictionary objectForKey:@"book"];
}

- (BookStatus)status {
    NSString *status = self.dictionary[@"status"];
    if ([status isEqualToString:@"wish"]) {
        return WISH;
    } else if ([status isEqualToString:@"reading"]) {
        return READING;
    } else if([status isEqualToString:@"read"]){
        return READ;
    } else{
        return NOTADDED;
    }
}

- (void) setStatus:(BookStatus)theStatus{
    self.dictionary[@"status"] = [self statusToString:theStatus];
}

- (NSString *) statusToString:(BookStatus)theStatus{
    switch(theStatus){
        case WISH:
            return @"wish";
        case READING:
            return @"reading";
        case READ:
            return @"read";
        default:
            return @"";
    }
}
- (BOOL)isEqual:(id)object {
    if (![object isMemberOfClass:[DOUBook class]]){
         return false;
    }

    return [self.id isEqualToString:[(DOUBook *)object id]];
}

@end
