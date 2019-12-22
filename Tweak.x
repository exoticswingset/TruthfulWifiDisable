@interface CCUILabeledRoundButton
@property (nonatomic, copy, readwrite) NSString *title;
@end

@interface SBWiFiManager
-(id)sharedInstance;
-(void)setWiFiEnabled:(BOOL)enabled;
-(bool)wiFiEnabled;
@end

%hook CCUILabeledRoundButton
-(void)buttonTapped:(id)arg1 {
  %orig;

  if ([self.title isEqualToString:[[NSBundle bundleWithPath:@"/System/Library/ControlCenter/Bundles/ConnectivityModule.bundle"] localizedStringForKey:@"CONTROL_CENTER_STATUS_WIFI_NAME" value:@"CONTROL_CENTER_STATUS_WIFI_NAME" table:@"Localizable"]] || [self.title isEqualToString:[[NSBundle bundleWithPath:@"/System/Library/ControlCenter/Bundles/ConnectivityModule.bundle"] localizedStringForKey:@"CONTROL_CENTER_STATUS_WLAN_NAME" value:@"CONTROL_CENTER_STATUS_WLAN_NAME" table:@"Localizable"]]) {
    SBWiFiManager *wiFiManager = (SBWiFiManager *)[%c(SBWiFiManager) sharedInstance];
    BOOL enabled = [wiFiManager wiFiEnabled];

    if(enabled) {
        [wiFiManager setWiFiEnabled:NO];
    }
  }
}
%end
