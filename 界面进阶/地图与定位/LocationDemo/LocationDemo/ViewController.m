//
//  ViewController.m
//  LocationDemo
//
//  Created by MagicianQuentin on 2023/3/4.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface ViewController ()<CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong) CLGeocoder *geocoder;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 150, 50)];
    [button setTitle:@"goto setting" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor orangeColor];
    [button addTarget:self action:@selector(gotoSetting:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    
    if (![CLLocationManager locationServicesEnabled]) {
        NSLog(@"Location Service is Off");
        return;
    }
    
    [self.locationManager requestWhenInUseAuthorization];
    [self startMonitorLocation];
}

- (void)startMonitorLocation
{
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    self.locationManager.distanceFilter = 50;
    [self.locationManager startUpdatingLocation];
}

- (void)stopMonitorlocation
{
    [self.locationManager stopUpdatingLocation];
}

#pragma mark - location
- (void)locationManagerDidChangeAuthorization:(CLLocationManager *)manager
{
    if (@available(iOS 14.0, *)) {
        NSLog(@"AuthorizationStatus : %d", manager.authorizationStatus);
    } else {
        // Fallback on earlier versions
    }
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    NSLog(@"AuthorizationStatus : %d", status);
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    CLLocation *location = locations.firstObject;
    NSLog(@"Location update! %@", [NSString stringWithFormat:@"latitude: %f, latitude: %f", location.coordinate.latitude, location.coordinate.longitude]);
    
    if (!self.geocoder) {
        self.geocoder = [[CLGeocoder alloc] init];
    }
    
    [self.geocoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        for (CLPlacemark *placemark in placemarks) {
            NSLog(@"name=%@,locality=%@ country=%@", placemark.name, placemark.locality, placemark.country);
        }
    }];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    switch (error.code) {
        case kCLErrorDenied:
            [self stopMonitorlocation];
            break;
        case kCLErrorLocationUnknown:
            [self stopMonitorlocation];
        default:
            break;
    }
}

#pragma mark - button
- (void)gotoSetting:(id)sender
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
}

@end
