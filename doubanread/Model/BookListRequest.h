#import <Foundation/Foundation.h>


@interface BookListRequest : NSObject
- (id)initWithDelegate:(id)aDelegate;

- (void)retrieveBooks:(NSString *)status;

- (void)retrieveNewBooks:(NSString *)status;

- (void)retrieveMoreBooks:(NSString *)status withStartPoint:(int)startPoint;

- (void)searchBooks:(NSString *)key;
@end