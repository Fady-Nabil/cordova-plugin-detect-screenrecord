   /********* screenshot.m Cordova Plugin Implementation *******/

    #import "detect-screenshot.h"
    #import <Cordova/CDV.h>

    @implementation screenshot
    - (void)pluginInitialize
    {
            BOOL isCaptured = [[UIScreen mainScreen] isCaptured];
            if(isCaptured){
                if ([self.webView respondsToSelector:@selector(stringByEvaluatingJavaScriptFromString:)]) {
                    // UIWebView
                    [self.webView performSelectorOnMainThread:@selector(stringByEvaluatingJavaScriptFromString:) withObject:@"cordova.fireDocumentEvent('screenrecordstart');" waitUntilDone:NO];
                } else if ([self.webView respondsToSelector:@selector(evaluateJavaScript:completionHandler:)]) {
                    // WKWebView
                    [self.webView performSelector:@selector(evaluateJavaScript:completionHandler:) withObject:@"cordova.fireDocumentEvent('screenrecordstart');" withObject:nil];
                } else {
                    // cordova lib version is > 4
                    [self.commandDelegate evalJs:@"cordova.fireDocumentEvent('screenrecordstart');" ];
                }
            }else{
                if ([self.webView respondsToSelector:@selector(stringByEvaluatingJavaScriptFromString:)]) {
                    // UIWebView
                    [self.webView performSelectorOnMainThread:@selector(stringByEvaluatingJavaScriptFromString:) withObject:@"cordova.fireDocumentEvent('screenrecordstop');" waitUntilDone:NO];
                } else if ([self.webView respondsToSelector:@selector(evaluateJavaScript:completionHandler:)]) {
                    // WKWebView
                    [self.webView performSelector:@selector(evaluateJavaScript:completionHandler:) withObject:@"cordova.fireDocumentEvent('screenrecordstop');" withObject:nil];
                } else {
                    // cordova lib version is > 4
                    [self.commandDelegate evalJs:@"cordova.fireDocumentEvent('screenrecordstop');" ];
                }
            }
        }
       
    }

    @end
