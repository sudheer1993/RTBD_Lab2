//
//  ViewController.h
//  Lab2
//
//  Created by Gourishetty, Sudheer (UMKC-Student) on 9/9/15.
//  Copyright (c) 2015 Gourishetty, Sudheer (UMKC-Student). All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import <SpeechKit/SpeechKit.h>
@interface ViewController : UIViewController <UITextFieldDelegate, SpeechKitDelegate, SKRecognizerDelegate>

@property (strong, nonatomic) SKRecognizer* voiceSearch;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIButton *recordButton;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

- (IBAction)recordButtonTapped:(id)sender;
@property (strong, nonatomic) SKVocalizer* vocalizer;
@property BOOL isSpeaking;
@end

