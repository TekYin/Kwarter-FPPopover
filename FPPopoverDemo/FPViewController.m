//
//  FPViewController.m
//  FPPopoverDemo
//
//  Created by Alvise Susmel on 4/13/12.
//  Copyright (c) 2012 Fifty Pixels Ltd. All rights reserved.
//

#import "FPViewController.h"
#import "DemoTableController.h"
#import "FPPopoverController.h"
#import "FPDemoTableViewController.h"

@implementation FPViewController

@synthesize noArrow = _noArrow;
@synthesize transparentPopover;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

//iOS6 implementation of the rotation
- (NSUInteger)supportedInterfaceOrientations {
    //All orientations
    return UIInterfaceOrientationMaskAll;
}

- (IBAction)popover:(id)sender {

    popover = nil;
    
    //the controller we want to present as a popover
    DemoTableController *controller = [[DemoTableController alloc] initWithStyle:UITableViewStylePlain];
    controller.delegate = self;
    popover = [[FPPopoverController alloc] initWithViewController:controller];
    popover.tint = FPPopoverDefaultTint;
    
    
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        popover.contentSize = CGSizeMake(300, 500);
    }
    else {
        popover.contentSize = CGSizeMake(200, 300);
    }
    if(sender == transparentPopover)
    {
        popover.alpha = 0.5;
    }
    
    if(sender == _noArrow) {
        //no arrow
        popover.arrowDirection = FPPopoverNoArrow;
        [popover presentPopoverFromPoint: CGPointMake(self.view.center.x, self.view.center.y - popover.contentSize.height/2)];
    }
    else {
        //sender is the UIButton view
        popover.arrowDirection = FPPopoverArrowDirectionAny;
        [popover presentPopoverFromView:sender];
    }
}

- (IBAction)noArrow:(id)sender {
    [self popover:sender];
}

- (void)presentedNewPopoverController:(FPPopoverController *)newPopoverController 
          shouldDismissVisiblePopover:(FPPopoverController*)visiblePopoverController {
    [visiblePopoverController dismissPopoverAnimated:YES];
}

- (IBAction)topLeft:(id)sender {
    [self popover:sender];
}

- (IBAction)topCenter:(id)sender {
    [self popover:sender];
}

- (IBAction)topRight:(id)sender {
    [self popover:sender];
}

- (IBAction)lt:(id)sender {
    [self popover:sender];
}

- (IBAction)rt:(id)sender {
    [self popover:sender];
}

- (IBAction)midLeft:(id)sender {
    [self popover:sender];
}

- (IBAction)midCenter:(id)sender {
    [self popover:sender];
}
- (IBAction)midRight:(id)sender {
    [self popover:sender];
}

- (IBAction)bottomLeft:(id)sender {
    [self popover:sender];
}

- (IBAction)bottomCenter:(id)sender {
    [self popover:sender];
}

- (IBAction)bottomRight:(id)sender {
    [self popover:sender];
}

- (IBAction)navControllerPopover:(id)sender {
    popover = nil;
    
    //the controller we want to present as a popover
    DemoTableController *controller = [[DemoTableController alloc] initWithStyle:UITableViewStylePlain];
    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:controller];
    controller = nil;

    popover = [[FPPopoverController alloc] initWithViewController:nc];
    popover.tint = FPPopoverDefaultTint;
    popover.contentSize = CGSizeMake(300, 500);
    [popover presentPopoverFromView:sender];
}

- (IBAction)goToTableView:(id)sender {
    FPDemoTableViewController *controller = [[FPDemoTableViewController alloc] initWithStyle:UITableViewStylePlain];
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)selectedTableRow:(NSUInteger)rowNum {
    NSLog(@"SELECTED ROW %d",rowNum);
    [popover dismissPopoverAnimated:YES];
}

@end
