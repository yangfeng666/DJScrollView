## DJScrollView
*实现能自动滑动的scrollView

## 支持哪些控件的刷新
* `UIScrollView`

## 如何使用MJRefresh
* cocoapods导入：`pod 'DJScrollView'`
* 手动导入：
* 将`DJScrollView`文件夹中的所有文件拽入项目中
* 导入主头文件：`#import "DJScrollView.h"`

DJScrollView * scrollView = [[DJScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width) animationDuration:4.0];
[self.view addSubview:scrollView];
self.imagesArray = @[@"tab1.png", @"tab2.png", @"tab3.png", @"tab4.png"];
scrollView.adsArray = self.imagesArray;
