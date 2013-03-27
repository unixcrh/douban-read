#import "BookInfoRequest.h"
#import "DOUQuery.h"
#import "DOUService.h"
#import "DOUBookArray.h"
#import "DOUAPIEngine.h"


@implementation BookInfoRequest {
    id delegate;
}
- (id)initWithDelegate:(id)aDelegate {
    self = [super init];
    if (self) {
        delegate = aDelegate;
    }
    return self;
}

- (void)retrieveBooks:(NSString *)status {
    [self requestBooks:status withDelegateSelector:@selector(bookRequestDidFinish:)];
}

- (void)retrieveNewBooks:(NSString *)status {
    [self requestBooks:status withDelegateSelector:@selector(newBookRequestDidFinish:)];
}

- (void)requestBooks:(NSString *)status withDelegateSelector:(SEL)delegateSelector {
    int userId = [[DOUOAuthStore sharedInstance] userId];
    NSString *subPath = [NSString stringWithFormat:@"/v2/book/user/%d/collections", userId];
    DOUQuery *query = [[DOUQuery alloc] initWithSubPath:subPath parameters:@{@"status" : status, @"count" : @"20"}];

    DOUService *service = [DOUService sharedInstance];
    [service get:query callback:^(DOUHttpRequest *req) {
        NSString *responseString = [req responseString];
        NSLog(@"str:%@", responseString);
        NSError *error = [req doubanError];
        if (!error) {
            DOUBookArray *array = [[DOUBookArray alloc] initWithString:responseString];
            if ([delegate respondsToSelector:delegateSelector]) {
                [delegate performSelector:delegateSelector withObject:[array objectArray]];
            }
        }
    }];
}

- (void)retrieveMoreBooks:(NSString *)status {
    [self requestBooks:status withDelegateSelector:@selector(moreBookRequestDidFinish:)];

}
@end