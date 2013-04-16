#import <Foundation/Foundation.h>

@class DOUBook;
@class BookDetailViewController;

@interface BookDetailView : UIView{
    DOUBook *book;
    BookDetailViewController *target;
    UIButton *finishReadingButton;
    UIButton *readingButton;
    UIButton *wishButton;
}
- (id)initWithBook:(DOUBook *)theBook andTarget:(BookDetailViewController *)theTarget;

- (void)addButtonsWithPositionY:(float)positionY;

- (void)showImage:(UIImage *)image;

- (UIButton *)createButton:(CGFloat)positionX positionY:(CGFloat)positionY title:(NSString *)title action:(SEL)action;

- (void)showSummary;
@end