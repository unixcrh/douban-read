#import "ReadBookDetailView.h"


@implementation ReadBookDetailView {
    UIButton *reading;
    UIButton *wishButton;
    UIButton *deleteButton;
}

- (void)addButtonsWithPositionY:(float)positionY {
    reading = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [reading setFrame:CGRectMake(30, positionY + 40, 70, 40)];
    [reading setTitle:@"在读" forState:UIControlStateNormal];
    [reading addTarget:target action:@selector(reading) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:reading];

    wishButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [wishButton setFrame:CGRectMake(130, positionY+ 40, 70, 40)];
    [wishButton setTitle:@"想读" forState:UIControlStateNormal];
    [wishButton addTarget:target action:@selector(wishRead) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:wishButton];

    deleteButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [deleteButton setFrame:CGRectMake(230, positionY+ 40, 70, 40)];
    [deleteButton setTitle:@"删除" forState:UIControlStateNormal];
    [deleteButton addTarget:target action:@selector(delete) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:deleteButton];
}


@end