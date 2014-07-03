
// .h
#define singleton_Interface(class) + (instancetype)shared##class;


// .m
#define singleton_Implementation(class) \
static class *_intance; \
+ (id)allocWithZone:(struct _NSZone *)zone \
{ \
    static dispatch_once_t predicate; \
    dispatch_once(&predicate, ^{ \
        _intance = [super allocWithZone:zone]; \
    }); \
 \
    return _intance; \
} \
+ (instancetype)shared##class \
{ \
    if (_intance == nil) { \
        _intance = [[self alloc] init]; \
    } \
    return _intance; \
}