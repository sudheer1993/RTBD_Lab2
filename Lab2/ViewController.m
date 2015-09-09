//
//  ViewController.m
//  Lab2
//
//  Created by Gourishetty, Sudheer (UMKC-Student) on 9/9/15.
//  Copyright (c) 2015 Gourishetty, Sudheer (UMKC-Student). All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
const unsigned char SpeechKitApplicationKey[] = {0x17, 0xa8, 0x0d, 0x1e, 0xae, 0x30, 0x03, 0x08, 0xef, 0x70, 0x65, 0x55, 0xe2, 0xa3, 0x0b, 0x0d, 0xe4, 0x66, 0x74, 0x0e, 0x2b, 0x27, 0xb2, 0x4c, 0x9a, 0x0b, 0x3e, 0xee, 0x4d, 0x3e, 0xcf, 0x64, 0xe6, 0xdd, 0x83, 0x95, 0x0d, 0x86, 0x9d, 0xfd, 0xf6, 0x02, 0x52, 0xd8, 0xa6, 0x5d, 0xe6, 0x8a, 0xc4, 0x5a, 0x98, 0xef, 0x81, 0x4a, 0x3c, 0x1b, 0x56, 0x7a, 0x09, 0xa3, 0xb8, 0xd8, 0x08, 0x9f};
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [SpeechKit setupWithID:@"NMDPTRIAL_gourishetty_sudheer4_gmail_com20150908174707"
                      host:@"sandbox.nmdp.nuancemobility.net"
                      port:443
                    useSSL:NO
                  delegate:nil];
    
    // Set earcons to play
    SKEarcon* earconStart	= [SKEarcon earconWithName:@"earcon_listening.wav"];
    SKEarcon* earconStop	= [SKEarcon earconWithName:@"earcon_done_listening.wav"];
    SKEarcon* earconCancel	= [SKEarcon earconWithName:@"earcon_cancel.wav"];
    
    [SpeechKit setEarcon:earconStart forType:SKStartRecordingEarconType];
    [SpeechKit setEarcon:earconStop forType:SKStopRecordingEarconType];
    [SpeechKit setEarcon:earconCancel forType:SKCancelRecordingEarconType];
    // Do any additional setup after loading the view, typically from a nib.
    self.messageLabel.text = @"Tap on the mic";
    self.activityIndicator.hidden = YES;
    
    self.textField.returnKeyType = UIReturnKeySearch;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
# pragma mark - SKRecognizer Delegate Methods

- (void)recognizerDidBeginRecording:(SKRecognizer *)recognizer {
    self.messageLabel.text = @"Listening..";
}

- (void)recognizerDidFinishRecording:(SKRecognizer *)recognizer {
    self.messageLabel.text = @"Done Listening..";
}
- (void)recognizer:(SKRecognizer *)recognizer didFinishWithResults:(SKRecognition *)results {
    long numOfResults = [results.results count];
    
    if (numOfResults > 0) {
        // update the text of text field with best result from SpeechKit
        self.textField.text = [results firstResult];
    }
    
    self.recordButton.selected = !self.recordButton.isSelected;
    
    if (self.voiceSearch) {
        [self.voiceSearch cancel];
    }
}

# pragma mark - Textfield Delegate Method and Method to handle Button Touch-up Event

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if ([self.textField isFirstResponder]) {
        [self.textField resignFirstResponder];
    }
    
    return YES;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    if ([self.textField isFirstResponder]) {
        [self.textField resignFirstResponder];
    }
}
- (void)recognizer:(SKRecognizer *)recognizer didFinishWithError:(NSError *)error suggestion:(NSString *)suggestion {
    self.recordButton.selected = NO;
    self.messageLabel.text = @"Connection error";
    self.activityIndicator.hidden = YES;
    
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                    message:[error localizedDescription]
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

#pragma mark - when record button is tapped
- (IBAction)recordButtonTapped:(id)sender {
    
        self.recordButton.selected = !self.recordButton.isSelected;
        
        // This will initialize a new speech recognizer instance
        if (self.recordButton.isSelected) {
            self.voiceSearch = [[SKRecognizer alloc] initWithType:SKSearchRecognizerType
                                                        detection:SKShortEndOfSpeechDetection
                                                         language:@"en_US"
                                                         delegate:self];
        }
        
        // This will stop existing speech recognizer processes
        else {
            if (self.voiceSearch) {
                [self.voiceSearch stopRecording];
                [self.voiceSearch cancel];
            }
        }
    



}
@end
