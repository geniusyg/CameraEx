//
//  ViewController.m
//  CameraEx
//
//  Created by SDT-1 on 2014. 1. 16..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imgv;

@end

@implementation ViewController
- (IBAction)takePicture:(id)sender {
	if(![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"오류" message:@"카메라 안됨" delegate:nil cancelButtonTitle:@"확인" otherButtonTitles:nil];
		[alert show];
		return;
	}
	
	UIImagePickerController *ipc = [[UIImagePickerController alloc] init];
	ipc.delegate = self;
	ipc.allowsEditing = YES;
	ipc.sourceType = UIImagePickerControllerSourceTypeCamera;
	[self presentModalViewController:ipc animated:YES];
}
- (IBAction)getImage:(id)sender {
	UIImagePickerController *ipc = [[UIImagePickerController alloc] init];
	ipc.delegate = self;
	ipc.allowsEditing = YES;
	ipc.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
	[self presentModalViewController:ipc animated:YES];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
	UIImage *edited = [info objectForKey:UIImagePickerControllerEditedImage];
	UIImage *original = [info objectForKey:UIImagePickerControllerOriginalImage];
	
	UIImage *using = (nil == edited) ? original : edited;
	self.imgv.image = using;
	
	[picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
