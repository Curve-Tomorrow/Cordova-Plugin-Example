/********* MathCalculator.m Cordova Plugin Implementation *******/

#import <Cordova/CDV.h>

@interface MathCalculator : CDVPlugin {
  // Member variables go here.
}

- (void)add:(CDVInvokedUrlCommand*)command;
- (void)subtract:(CDVInvokedUrlCommand*)command;
- (void)takePicture:(CDVInvokedUrlCommand*)command;

@end

@implementation MathCalculator
- (void)add:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSNumber* param1 = [[command.arguments objectAtIndex:0] valueForKey:@"param1"];
    NSNumber* param2 = [[command.arguments objectAtIndex:0] valueForKey:@"param2"];
    if(param1 >=0 && param2 >= 0) // changed here
    {
    NSString* total = [NSString stringWithFormat: @"%@", @([param1 intValue] + [param2 intValue])];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:total];
    }else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)subtract:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSNumber* param1 = [[command.arguments objectAtIndex:0] valueForKey:@"param1"];
    NSNumber* param2 = [[command.arguments objectAtIndex:0] valueForKey:@"param2"];
    if(param1 >=0 && param2 >= 0) // changed here
    {
    NSString* total = [NSString stringWithFormat: @"%@", @([param1 intValue] - [param2 intValue])];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:total];
    }else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)takePicture:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    // UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    // picker.delegate = self;
    // picker.allowsEditing = YES;
    // picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    // //[self presentViewController:picker animated:YES completion:NULL];
    // [self.viewController presentViewController:picker animated:YES completion:^{}];

    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"Success open camera"];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)imagePickerController:(UIImagePickerController* )picker didFinishPickingMediaWithInfo:(NSDictionary* )info {

    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    //    self.imageView.image = chosenImage;
    NSLog(chosenImage);
    [picker dismissViewControllerAnimated:YES completion:NULL];

}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:NULL];
}
@end
