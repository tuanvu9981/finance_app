## Finance App 

### References
- [Youtube Video URL](https://www.youtube.com/watch?v=9-QFt-cWZV8&t=11s)

### 1. Tại sao để Column trong Stack thì có thể chồng 2 khối lệch vị trí với nhau ?
- **Stack** hiển thị theo phần tử có kích thước lớn nhất trong **children** của nó 
- Trước khi để **Column**
    - thì phần tử có size lớn nhất là **Container**. Nên **Positioned sẽ bị chồng trọn vẹn** bên trong diện tích của Container này 
```
Stack(
	children: [
		Container(),
		Positioned()
    ]
)
```
- Sau khi để **Column**
    - thì phần tử có size lớn nhất là **Column** (do cộng tổng 2 height khác nhau của Positioned và Container lại). Nên **Positioned sẽ được kéo dãn xuống**, chỉ gối đầu 1 phần lên Container
```
Stack(
	children: [
        Column(
            children: [
                Container(),
		        Positioned()       
            ]
        )
    ]
)
``` 

### 2. Tại sao để Row trong Stack thì phần Icon thông báo không căn chỉnh đúng vị trí 
```
Row(
    children:[
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Text(),
                Text()       
            ]
        ),
        ClipRRect(
            child: Container()
        )
    ]
)
```
- Trạng thái ban đầu: phần Column (2 Text) ở vị trí top-left, còn phần ClipRRect liền kề  phần Column ngay theo Row, nhưng lại nằm ở vị trí center theo Column
<p align="center">
    <img src="https://github.com/tuanvu9981/finance_app/blob/master/screenshot/before.png" />
<p>

- Row default:
    - MainAxisAlignment.start
    - CrossAxisAlignment.center 
- Đây là lý do ClipRRect nằm chính giữa dòng như vậy, vì CrossAxis dạng Column 

- Column (2 Text) default: 
    - MainAxisAlignment.start
    - CrossAxisAlignment.center
- Đây là lý do 2 Text nằm bên trong Column hiển thị khác ClipRRect. Nếu coi Column là các hàng được xếp từ trên xuống dưới, thì các phần tử đang nằm ở vị trí start (từ trên xuống dưới). Nếu không có Column, thì 2 Text cũng sẽ nằm giữa dòng như ClipRRect, chịu ảnh hưởng của Row bên ngoài.

```
Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children:[
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Text(),
                Text()       
            ]
        ),
        ClipRRect(
            child: Container()
        )
    ]
)
```
- Trạng thái lúc sau: 2 Text và ClipRRect nằm cùng 1 hàng, được căn chỉnh space-between đẹp mắt 
    - CrossAxisAlignment.start: Đưa ClipRRect lên cùng hàng với Column 2 Text thay vì nằm chính giữa dòng.
    - MainAxisAlignment.spaceBetween: Đưa 2 items ra cách xa nhau, về phía hai bên, sát mép lề padding
<p align="center">
    <img src="https://github.com/tuanvu9981/finance_app/blob/master/screenshot/after.png" />
<p> 

### 3. Biên dịch và tạo file mới với hive 
- a. **Installation**
```
dependencies:
  flutter:
    sdk: flutter

  cupertino_icons: ^1.0.2
  syncfusion_flutter_charts: ^20.2.44
  hive: ^2.2.3
  hive_flutter: ^1.1.0
  intl: ^0.18.0

dev_dependencies:
  flutter_test:
    sdk: flutter
  hive_generator: ^1.1.3
  build_runner: ^2.2.0
```

- b. **Naming rules**
    - **expense_data.dart** will generate a **expense_data.g.dart** file

- c. **Commands**
```
tuanvu81@host81:~/Desktop/finance_app$ flutter packages pub run build_runner build
```

