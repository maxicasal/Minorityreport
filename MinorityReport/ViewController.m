
#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *thePreCogs;
@property (weak, nonatomic) IBOutlet UILabel *theFuture;
@property CGPoint originalCenter;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.originalCenter = self.theFuture.center;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)onDrag:(UIPanGestureRecognizer *)panGesture{
    CGPoint point= [panGesture locationInView:self.view];
    self.theFuture.center = point;
  
    if (panGesture.state == UIGestureRecognizerStateEnded) {
        [UIView animateWithDuration:1.0 animations:^{
            self.theFuture.center = self.originalCenter;
        }];
    }else {
        if (CGRectContainsPoint(self.thePreCogs.frame, point)) {
            self.theFuture.backgroundColor = [UIColor redColor];
            self.theFuture.text=@"A fictious and incriminating future";
            [self.theFuture sizeToFit];
        }
    }
}

@end
