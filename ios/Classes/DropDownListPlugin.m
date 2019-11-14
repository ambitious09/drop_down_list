#import "DropDownListPlugin.h"
#import <drop_down_list/drop_down_list-Swift.h>

@implementation DropDownListPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftDropDownListPlugin registerWithRegistrar:registrar];
}
@end
