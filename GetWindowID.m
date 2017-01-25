#include <Cocoa/Cocoa.h>
#include <CoreGraphics/CGWindow.h>

int main(int argc, char **argv)
{
  NSArray *windows = (NSArray *)CGWindowListCopyWindowInfo(kCGWindowListExcludeDesktopElements,kCGNullWindowID);
  for (NSDictionary *window in windows) {
    NSString* ownerName = [window objectForKey:(NSString *)kCGWindowOwnerName];
    if (![ownerName isEqualToString:[NSString stringWithUTF8String:argv[1]]]) {
      continue;
    }
    NSString* windowName = [window objectForKey:(NSString *)kCGWindowName];
    if (windowName == nil) {
      continue;
    }
    if (argc > 2) {
      if (![windowName isEqualToString:[NSString stringWithUTF8String:argv[2]]]) {
        continue;
      }
    }
    printf("%d\n", [[window objectForKey:(NSString *)kCGWindowNumber] intValue]);
    break;
  }
  return 0;
}
