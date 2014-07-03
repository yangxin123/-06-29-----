// 屏幕高度
#define kScreenWidth self.view.bounds.size.width
#define kScreenHeight self.view.bounds.size.height

// 判断是否为iphone5
#define isIphone5 ([UIScreen mainScreen].bounds.size.height == 568)

// 日志输出
#ifdef DEBUG
#define WBLog(...) NSLog(__VA_ARGS__)
#else
#define WBLog(...)
#endif

// Dock栏高度
#define kDockHeight 44

// 沙盒Documents路径
#define docDirPath \
NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0]

