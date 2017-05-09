

#import "UIImage+UIImgNamed_Hack.h"

@implementation UIImage (UIImgNamed_Hack)

+ (UIImage*)imageNamedover:(NSString*)name
{

    return [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@", [[NSBundle mainBundle] bundlePath], name]];
    ;
}
@end
