//
//  ViewController.m
//  MapDemo
//
//  Created by MagicianQuentin on 2023/3/4.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>

@interface ViewController ()<MKMapViewDelegate>

@property (nonatomic, strong) MKMapView *mapView;

@property (nonatomic, strong) CLLocationManager *locationManager;

@property (nonatomic, strong) CLGeocoder *geocoder;

@property (nonatomic, strong) MKPointAnnotation *pointAnnotation;

@property (nonatomic, strong) NSMutableArray *availableMaps;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.mapView = [[MKMapView alloc] initWithFrame:self.view.frame];
    self.mapView.delegate = self;
    
    self.mapView.mapType = MKMapTypeStandard;
    self.mapView.showsUserLocation = YES;
    self.mapView.showsScale = YES;
    self.mapView.showsTraffic = YES;
    self.mapView.showsCompass = YES;
    
    self.mapView.userTrackingMode = MKUserTrackingModeFollowWithHeading;
    self.view = self.mapView;
    
    self.locationManager = [[CLLocationManager alloc] init];
    [self.locationManager requestWhenInUseAuthorization];
    self.geocoder = [[CLGeocoder alloc] init];
    
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = 30.189845;
    coordinate.longitude = 120.187883;
    self.pointAnnotation = [[MKPointAnnotation alloc] init];
    self.pointAnnotation.title = @"奶茶 刘若英";
    self.pointAnnotation.subtitle = @"原来你也在这里 盛大开演";
    self.pointAnnotation.coordinate = coordinate;
    [self.mapView addAnnotation:self.pointAnnotation];
    
    self.availableMaps = [NSMutableArray array] ;
    [self getAvailableMaps];
}

#pragma mark - MKMapViewDelegate

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    [self.geocoder reverseGeocodeLocation:userLocation.location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if (placemarks.count > 0)
        {
            CLPlacemark *placemark = placemarks[0];
            userLocation.title = @"当前位置";
            userLocation.subtitle = [NSString stringWithFormat:@"%@ %@", placemark.locality, placemark.thoroughfare];

        }
    }];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{

    if([annotation isKindOfClass:[MKPointAnnotation class]])
    {
        NSString *pointAnnotationIdentifier= @"pointAnnotationIdentifier";
        MKAnnotationView * annotationView = [self.mapView dequeueReusableAnnotationViewWithIdentifier:pointAnnotationIdentifier];
        if(!annotationView)
        {
            annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:pointAnnotationIdentifier];
            
            UIButton *testButton = [[UIButton alloc] init];
            [testButton setBackgroundColor:[UIColor orangeColor]];
            [testButton setTitle:@"go" forState:UIControlStateNormal];
            testButton.frame = CGRectMake(0, 0, 50, 50);
            [testButton addTarget:self action:@selector(go:) forControlEvents:UIControlEventTouchUpInside];
            
            annotationView.rightCalloutAccessoryView = testButton;
        }
        annotationView.annotation = self.pointAnnotation;
        annotationView.canShowCallout = YES;
        return annotationView;
    }

    return nil;
}

- (void)getAvailableMaps {
    [self.availableMaps removeAllObjects];
    
    CLLocationCoordinate2D coordinateStart = CLLocationCoordinate2DMake(30.19, 120.19);
    CLLocationCoordinate2D coordinateEnd = CLLocationCoordinate2DMake(30.23, 120.15);
    
    if([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"baidumap://"]])
    {
        NSString * urlString = [NSString stringWithFormat:@"baidumap://map/direction?origin=latlng:%f,%f|name:我的位置&destination=latlng:%f,%f|name:目的地&mode=driving",coordinateStart.latitude,coordinateStart.longitude,coordinateEnd.latitude,coordinateEnd.longitude];
                                                        
        NSDictionary *dict = @{@"name" : @"百度地图", @"url" : urlString};
        [self.availableMaps addObject:dict];
    }
}

#pragma mark - goto

- (void)go:(id)sender
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"选择导航" message:@"选择你要的导航服务" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *alert1 = [UIAlertAction actionWithTitle:@"系统导航" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        CLLocationCoordinate2D locationEnd = CLLocationCoordinate2DMake(31.18, 121.43);
        MKPlacemark *placeMark = [[MKPlacemark alloc] initWithCoordinate:locationEnd];
        MKMapItem *toLocation = [[MKMapItem alloc] initWithPlacemark:placeMark];
        
        MKMapItem *currentLocation = [MKMapItem mapItemForCurrentLocation];
        [MKMapItem openMapsWithItems:@[toLocation, currentLocation] launchOptions:@{
            MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving,
            MKLaunchOptionsShowsTrafficKey:@YES
        }];
    }];
    [alertController addAction:alert1];
    
    for (NSDictionary *dict in self.availableMaps) {
        UIAlertAction *alert2 = [UIAlertAction actionWithTitle:[NSString stringWithFormat:@"使用%@导航", dict[@"name"]] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSString *string = dict[@"url"];
            NSURL *url = [NSURL URLWithString:[string stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]]];
            [[UIApplication sharedApplication] openURL:url];
        }];
        [alertController addAction:alert2];
    }
    
    UIAlertAction *alert3 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alertController addAction:alert3];
    
    [self presentViewController:alertController animated:YES completion:^{
        
    }];
    
}

@end
