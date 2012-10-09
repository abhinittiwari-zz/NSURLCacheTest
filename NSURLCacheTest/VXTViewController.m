//
//  VXTViewController.m
//  NSURLCacheTest
//
//  Created by Abhinit Tiwari on 09/10/12.
//  Copyright (c) 2012 Abhinit Tiwari. All rights reserved.
//

#import "VXTViewController.h"

@interface VXTViewController () {
}

@property (nonatomic, strong) NSURLConnection *connection;

@end

@implementation VXTViewController
@synthesize connection;

- (void) sendRequest {
    //Create and send the network request
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://www.google.co.in/images/srpr/logo3w.png"]];
    self.connection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:NO];
    [self.connection start];
    NSLog(@"initWithURL:");
}


- (void) sendRequest:(UIButton*) sender {
    
    NSURLRequestCachePolicy policy = [sender tag];

    switch (policy) {
        case NSURLRequestReloadIgnoringCacheData: {
            NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://www.google.co.in/images/srpr/logo3w.png"]
                                                          cachePolicy:NSURLRequestReloadIgnoringCacheData
                                                      timeoutInterval:20.0];
            self.connection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:NO];
            [self.connection start];

            NSLog(@"NSURLRequestReloadIgnoringCacheData");
            break;
        }
        case NSURLRequestReloadIgnoringLocalAndRemoteCacheData: {
            NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://www.google.co.in/images/srpr/logo3w.png"]
                                                          cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData
                                                      timeoutInterval:20.0];
            self.connection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:NO];
            [self.connection start];
            NSLog(@"NSURLRequestReloadIgnoringLocalAndRemoteCacheData");
            break;
        }
        case NSURLRequestReloadRevalidatingCacheData: {
            NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://www.google.co.in/images/srpr/logo3w.png"]
                                                          cachePolicy:NSURLRequestReloadRevalidatingCacheData
                                                      timeoutInterval:20.0];
            self.connection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:NO];
            [self.connection start];
            
            NSLog(@"NSURLRequestReloadRevalidatingCacheData");            
            break;
        }
        case NSURLRequestReturnCacheDataDontLoad: {
            NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://www.google.co.in/images/srpr/logo3w.png"]
                                                          cachePolicy:NSURLRequestReturnCacheDataDontLoad
                                                      timeoutInterval:20.0];
            self.connection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:NO];
            [self.connection start];
            
            NSLog(@"NSURLRequestReturnCacheDataDontLoad");            
            break;
        }
        case NSURLRequestReturnCacheDataElseLoad: {
            NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://www.google.co.in/images/srpr/logo3w.png"]
                                                          cachePolicy:NSURLRequestReturnCacheDataElseLoad
                                                      timeoutInterval:20.0];
            self.connection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:NO];
            [self.connection start];
            
            NSLog(@"NSURLRequestReturnCacheDataElseLoad");            
            break;
        }
        case NSURLRequestUseProtocolCachePolicy: {
            NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://www.google.co.in/images/srpr/logo3w.png"]
                                                          cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                      timeoutInterval:20.0];
            self.connection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:NO];
            [self.connection start];
            
            NSLog(@"NSURLRequestUseProtocolCachePolicy");            
            break;
        }

        default:
            NSLog(@"ENTERED DEFAULT");
            break;
    }
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSURLCache *newCache = [[NSURLCache alloc] initWithMemoryCapacity:1024 * 1024 diskCapacity:1024 * 1024 * 10 diskPath:nil];
    [NSURLCache setSharedURLCache:newCache];

    
    CGPoint center = self.view.center;
    
    UIButton *sendButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [sendButton setTitle:@"initWithURL" forState:UIControlStateNormal];
    [sendButton addTarget:self action:@selector(sendRequest) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sendButton];
    [sendButton sizeToFit];
    
    center.y = 55;
    sendButton.center = center;

    UIButton *send1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [send1 setTitle:@"NSURLRequestReloadIgnoringCacheData" forState:UIControlStateNormal];
    [send1 addTarget:self action:@selector(sendRequest:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:send1];
    send1.tag = NSURLRequestReloadIgnoringCacheData;
    [send1 sizeToFit];
    center.y += 55;
    send1.center = center;

    UIButton *send2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [send2 setTitle:@"NSURLRequestReloadIgnoringLocalAndRemoteCacheData" forState:UIControlStateNormal];
    [send2 addTarget:self action:@selector(sendRequest:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:send2];
    send2.tag = NSURLRequestReloadIgnoringLocalAndRemoteCacheData;
    [send2 sizeToFit];
    center.y += 55;
    send2.center = center;
    
    UIButton *send4 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [send4 setTitle:@"NSURLRequestReloadRevalidatingCacheData" forState:UIControlStateNormal];
    [send4 addTarget:self action:@selector(sendRequest:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:send4];
    send4.tag = NSURLRequestReloadRevalidatingCacheData;    
    [send4 sizeToFit];
    center.y += 55;
    send4.center = center;
    
    UIButton *send5 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [send5 setTitle:@"NSURLRequestReturnCacheDataDontLoad" forState:UIControlStateNormal];
    [send5 addTarget:self action:@selector(sendRequest:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:send5];
    send5.tag = NSURLRequestReturnCacheDataDontLoad;    
    [send5 sizeToFit];
    center.y += 55;
    send5.center = center;
  
    UIButton *send6 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [send6 setTitle:@"NSURLRequestReturnCacheDataElseLoad" forState:UIControlStateNormal];
    [send6 addTarget:self action:@selector(sendRequest:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:send6];
    send6.tag = NSURLRequestReturnCacheDataElseLoad;    
    [send6 sizeToFit];
    center.y += 55;
    send6.center = center;
    
    UIButton *send7 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [send7 setTitle:@"NSURLRequestUseProtocolCachePolicy" forState:UIControlStateNormal];
    [send7 addTarget:self action:@selector(sendRequest:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:send7];
    send7.tag = NSURLRequestUseProtocolCachePolicy;    
    [send7 sizeToFit];
    center.y += 55;
    send7.center = center;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - NSURLConnectionDelegate
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"%s", __PRETTY_FUNCTION__);
}


#pragma mark - NSURLConnectionDataDelegate

- (NSURLRequest *)connection:(NSURLConnection *)connection willSendRequest:(NSURLRequest *)request redirectResponse:(NSURLResponse *)response {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    return request;
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
//    NSLog(@"%s", __PRETTY_FUNCTION__);
}

- (void)connection:(NSURLConnection *)connection   didSendBodyData:(NSInteger)bytesWritten
 totalBytesWritten:(NSInteger)totalBytesWritten
totalBytesExpectedToWrite:(NSInteger)totalBytesExpectedToWrite{
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

- (NSCachedURLResponse *)connection:(NSURLConnection *)connection willCacheResponse:(NSCachedURLResponse *)cachedResponse{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    return cachedResponse;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSLog(@"%s", __PRETTY_FUNCTION__);
}


#pragma mark - NSURLConnectionDownloadDelegate

//- (void)connection:(NSURLConnection *)connection didWriteData:(long long)bytesWritten totalBytesWritten:(long long)totalBytesWritten expectedTotalBytes:(long long) expectedTotalBytes {
//    NSLog(@"%s", __PRETTY_FUNCTION__);
//}
//
//- (void)connectionDidResumeDownloading:(NSURLConnection *)connection totalBytesWritten:(long long)totalBytesWritten expectedTotalBytes:(long long) expectedTotalBytes {
//    NSLog(@"%s", __PRETTY_FUNCTION__);
//}
//
//- (void)connectionDidFinishDownloading:(NSURLConnection *)connection destinationURL:(NSURL *) destinationURL {
//    NSLog(@"%s", __PRETTY_FUNCTION__);
//}

@end
