*** Settings ***
Resource            ../keywords/common.robot

Test Setup          Preconditions
Test Teardown       Tear Down

*** Variables ***
${Mã vạch sản phẩm}     1378293822111
${Tên sản phẩm}         Điện thoại
${change_product}       POSTR123720231016005
${pay_order}            POSTR123720231013017

*** Test Cases ***
####***********************************--THÊM SẢN PHẨM VÀO GIỎ HÀNG--*********************************************************
Add_Product_To_Cart_01: Xác minh rằng có thể điều hướng thành công đến trang "Đặt hàng"
    [Tags]    @Test_Add_Product_To_Cart     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh rằng có thể điều hướng thành công đến trang "Đặt hàng"
    When Click "Đặt hàng" menu
    Then User look title "Nhập Hàng"
    And User look contains title is "Sản phẩm"

###---------------------------------ERROR MESSAGE----------------------------------------------------------------------
Add_Product_To_Cart_02: Xác minh hiển thị thông báo lỗi khi không nhập "Số lượng" sản phẩm cần thêm vào giỏ hàng
    [Tags]    @Test_Add_Product_To_Cart     @Test_by_Hồ_Văn_Nhật
    [Documentation]       Xác minh hiển thị thông báo lỗi khi không nhập "Số lượng" sản phẩm cần thêm vào giỏ hàng
    When Click "Đặt hàng" menu
    And Select Product Add To Cart
    And Enter "number" in "Số lượng cần đặt hàng" with "${empty}"
    And Click 'Thêm vào giỏ hàng' button
    Then User look message "Xin mời bạn nhập số lượng." popup

Add_Product_To_Cart_03: Xác minh hiển thị thông báo lỗi khi nhập "Số lượng" sản phẩm cần thêm vào giỏ hàng bằng 0
    [Tags]    @Test_Add_Product_To_Cart     @Test_by_Hồ_Văn_Nhật
    [Documentation]       Xác minh hiển thị thông báo lỗi khi nhập "Số lượng" sản phẩm cần thêm vào giỏ hàng bằng 0
    When Click "Đặt hàng" menu
    And Select Product Add To Cart
    And Enter "number" in "Số lượng cần đặt hàng" with "0"
    And Click 'Thêm vào giỏ hàng' button
    Then User look message "Số lượng sản phẩm phải lớn hơn 0." popup

Add_Product_To_Cart_04: Xác minh hiển thị thông báo lỗi khi nhập "Số lượng" sản phẩm cần thêm vào giỏ hàng nhỏ hơn "Số lượng tối thiểu"
    [Tags]    @Test_Add_Product_To_Cart     @Test_by_Hồ_Văn_Nhật
    [Documentation]       Xác minh hiển thị thông báo lỗi khi nhập "Số lượng" sản phẩm cần thêm vào giỏ hàng nhỏ hơn "Số lượng tối thiểu"
    When Click "Đặt hàng" menu
    And Search "Mã vạch" in "Theo mã vạch, tên sản phẩm" with "${Mã vạch sản phẩm}"
    And Click on "Thêm vào giỏ hàng" button
    And Enter "number invalid" in "Số lượng cần đặt hàng" with "_RANDOM_"
    And Click 'Thêm vào giỏ hàng' button
    Then User look message "Sản phẩm chưa đạt số lượng tối thiểu" popup

Add_Product_To_Cart_05: Xác minh hiển thị thông báo lỗi khi nhập "Số lượng" sản phẩm cần thêm vào giỏ hàng lớn hơn 999999
    [Tags]    @Test_Add_Product_To_Cart     @Test_by_Hồ_Văn_Nhật
    [Documentation]       Xác minh hiển thị thông báo lỗi khi nhập "Số lượng" sản phẩm cần thêm vào giỏ hàng lớn hơn 999999
    When Click "Đặt hàng" menu
    And Select Product Add To Cart
    And Enter "number > 999999" in "Số lượng cần đặt hàng" with "_RANDOM_"
    And Click 'Thêm vào giỏ hàng' button
    Then User look message "Vui lòng nhập tối đa 999999" popup

Add_Product_To_Cart_06: Xác minh hiển thị thông báo lỗi khi thêm sản phẩm khác nhà cung cấp
    [Tags]    @Test_Add_Product_To_Cart     @Test_by_Hồ_Văn_Nhật
    [Documentation]       Xác minh hiển thị thông báo lỗi khi thêm sản phẩm khác nhà cung cấp
    When Click "Đặt hàng" menu
    And Search "Mã vạch" in "Theo mã vạch, tên sản phẩm" with "4155763811"
    And Click on "Thêm vào giỏ hàng" button
    And Enter "number valid" in "Số lượng cần đặt hàng" with "_RANDOM_"
    And Click 'Thêm vào giỏ hàng' button
    Then User look message "Thêm sản phẩm vào giỏ hàng thành công." popup
    And Search "Mã vạch" in "Theo mã vạch, tên sản phẩm" with "45732465657"
    And Click on "Thêm vào giỏ hàng" button
    And Enter "number valid" in "Số lượng cần đặt hàng" with "_RANDOM_"
    And Click 'Thêm vào giỏ hàng' button
    Then User look message "Sản phẩm khác nhà cung cấp." popup
    When Click on "Cart" icon on the top-right
    And Delete products added to cart
    Then User look message "Xoá sản phẩm trong giỏ hàng thành công." popup

###-----------------------------------------SUCCESSFUL MESSAGE---------------------------------------------------------
Add_Product_To_Cart_07: Xác minh hiển thị Successful Message khi thêm sản phẩm vào giỏ hàng thành công
    [Tags]    @Test_Add_Product_To_Cart     @Test_by_Hồ_Văn_Nhật
    [Documentation]       Xác minh hiển thị thông báo lỗi khi nhập "Số lượng" sản phẩm cần thêm vào giỏ hàng bằng 0
    When Click "Đặt hàng" menu
    And Select Product Add To Cart
    And Enter "number valid" in "Số lượng cần đặt hàng" with "_RANDOM_"
    And Click 'Thêm vào giỏ hàng' button
    Then User look message "Thêm sản phẩm vào giỏ hàng thành công." popup
    When Click on "Cart" icon on the top-right
    And Delete products added to cart
    Then User look message "Xoá sản phẩm trong giỏ hàng thành công." popup

###--------------------------------------VIEW LIST OF PRODUCT----------------------------------------------------------
Add_Product_To_Cart_08: Xác minh hiển thị danh sách sản phẩm
    [Tags]    @Test_Add_Product_To_Cart     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh hiển thị danh sách sản phẩm
    When Click "Đặt hàng" menu
    And Scroll down "100" times
    Then Show list of products

Add_Product_To_Cart_09: Xác minh hiển thị danh sách sản phẩm khi tìm kiếm với "Mã vạch" hợp lệ
    [Tags]    @Test_Add_Product_To_Cart     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh hiển thị danh sách sản phẩm khi tìm kiếm với "Mã vạch" hợp lệ
    When Click "Đặt hàng" menu
    And Search "Mã vạch" in "Theo mã vạch, tên sản phẩm" with "${Mã vạch sản phẩm}"
    Then Show list of products

Add_Product_To_Cart_10: Xác minh hiển thị danh sách sản phẩm khi tìm kiếm với "Tên sản phẩm" hợp lệ
    [Tags]    @Test_Add_Product_To_Cart     @Test_by_Hồ_Văn_Nhật
    [Documentation]       Xác minh hiển thị danh sách sản phẩm khi tìm kiếm với "Tên sản phẩm" hợp lệ
    When Click "Đặt hàng" menu
    And Search "Tên sản phẩm" in "Theo mã vạch, tên sản phẩm" with "${Tên sản phẩm}"
    Then Show list of products

Add_Product_To_Cart_11: Xác minh hiển thị danh sách sản phẩm khi tìm kiếm với "Mã vạch" không hợp lệ
    [Tags]    @Test_Add_Product_To_Cart     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh hiển thị danh sách sản phẩm khi tìm kiếm với "Mã vạch" không hợp lệ
    When Click "Đặt hàng" menu
    And Search "Barcode_valid" in "Theo mã vạch, tên sản phẩm" with "_RANDOM_"
    Then No product are display

Add_Product_To_Cart_12: Xác minh hiển thị danh sách sản phẩm khi tìm kiếm với "Từ khóa" không hợp lệ
    [Tags]    @Test_Add_Product_To_Cart     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh hiển thị danh sách sản phẩm khi tìm kiếm với "Từ khóa" không hợp lệ
    When Click "Đặt hàng" menu
    And Search "text" in "Theo mã vạch, tên sản phẩm" with "_RANDOM_"
    Then No product are display

Add_Product_To_Cart_13: Xác minh hiển thị danh sách sản phẩm của "Siêu thị Big C Huế"
    [Tags]    @Test_Add_Product_To_Cart     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh hiển thị danh sách sản phẩm của "Siêu thị Big C Huế"
    When Click "Đặt hàng" menu
    And Click select in "Chọn nhà cung cấp" with "Siêu thị Big C Huế"
    And Scroll down "5" times
    Then Show list of products

Add_Product_To_Cart_14: Xác minh hiển thị danh sách sản phẩm của "Nhà cung cấp Ben"
    [Tags]    @Test_Add_Product_To_Cart     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh hiển thị danh sách sản phẩm của "Nhà cung cấp Ben"
    When Click "Đặt hàng" menu
    And Click select in "Chọn nhà cung cấp" with "Nhà cung cấp Ben"
    And Scroll down "5" times
    Then Show list of products

Add_Product_To_Cart_15: Xác minh hiển thị danh sách sản phẩm của "Nhà cung cấp uat test 3"
    [Tags]    @Test_Add_Product_To_Cart     @Test_by_Hồ_Văn_Nhật
    [Documentation]       Xác minh hiển thị danh sách sản phẩm của "Nhà cung cấp uat test 3"
    When Click "Đặt hàng" menu
    And Click select in "Chọn nhà cung cấp" with "Nhà cung cấp uat test 3"
    Then Show list of products

###*****************************************TRANG "GIỎ HÀNG"***************************************************************
###______________________________________________CREATE ODER______________________________________________________________
Create_Order_01: Xác minh rằng có thể điều hướng thành công đến trang "Giỏ hàng"
    [Tags]    @Test_Create_Order     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh rằng có thể điều hướng thành công đến trang "Giỏ hàng"
    When Click "Đặt hàng" menu
    And Click on "Cart" icon on the top-right
    Then User look title "Giỏ Hàng"
    And User look contains title is "Chi tiết Giỏ hàng"

###-------------------------------------VALIDATION TEXT----------------------------------------------------------------
Create_Order_02: Xác minh validation text khi bỏ trống trường nhập "Số lượng"
    [Tags]    @Test_Create_Order     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh validation text khi bỏ trống trường nhập "Số lượng"
    When Go to cart page
    And Enter "number" in "Nhập số lượng" field with "${empty}"
    Then Show validation text in "Nhập số lượng" field with "Số lượng là bắt buộc"
    And Delete products added to cart
    Then User look message "Xoá sản phẩm trong giỏ hàng thành công." popup

Create_Order_03: Xác minh validation text khi nhập "Số lượng" nhỏ hơn "Số lượng tối thiểu"
    [Tags]    @Test_Create_Order     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh validation text khi nhập "Số lượng" nhỏ hơn "Số lượng tối thiểu"
    When Go to cart page
    And Enter "number" in "Nhập số lượng" field with "0"
    Then Show validation text in "Nhập số lượng" field with "Vui lòng nhập lớn hơn hoặc bằng số lượng tối thiểu"
    And Delete products added to cart
    Then User look message "Xoá sản phẩm trong giỏ hàng thành công." popup

##------------------------------------------ERROR MESSAGE---------------------------------------------------------------
Create_Order_04: Xác minh hiển thị thông báo lỗi khi nhập "Số lượng" lơn hơn 999999
    [Tags]    @Test_Create_Order     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh hiển thị thông báo lỗi khi nhập "Số lượng" lơn hơn 999999
    When Go to cart page
    And Enter "number > 999999" in "Nhập số lượng" field with "_RANDOM_"
    Then User look message "Số lượng không được vượt quá 999999" popup
    And Delete products added to cart
    Then User look message "Xoá sản phẩm trong giỏ hàng thành công." popup

Create_Order_05: Xác minh hiển thị thông báo lỗi khi nhập sai voucher khuyến mãi
    [Tags]    @Test_Create_Order     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh hiển thị thông báo lỗi khi nhập sai voucher khuyến mãi
    When Go to cart page
    And Enter "Mã voucher" in "Voucher" field with "_RANDOM_"
    Then User look message "Không tìm thấy thông tin voucher với mã đã chọn!" popup
    And Delete products added to cart
    Then User look message "Xoá sản phẩm trong giỏ hàng thành công." popup

Create_Order_06: Xác minh hiển thị thông báo lỗi khi nhập voucher khuyến mãi đã hết số lượng
    [Tags]    @Test_Create_Order     @Test_by_Hồ_Văn_Nhật
    [Documentation]       Xác minh hiển thị thông báo lỗi khi nhập voucher khuyến mãi đã hết số lượng
    When Go to cart page
    And Enter "Mã voucher" in "Voucher" field with "Voucher332"
    Then User look message "Số lượng voucher đã hết, vui lòng nhập mã voucher khác!" popup
    And Delete products added to cart
    Then User look message "Xoá sản phẩm trong giỏ hàng thành công." popup

Create_Order_07: Xác minh hiển thị thông báo lỗi khi nhập voucher khuyến mãi đã hết hạn sử dụng
    [Tags]    @Test_Create_Order     @Test_by_Hồ_Văn_Nhật
    [Documentation]       Xác minh hiển thị thông báo lỗi khi nhập voucher khuyến mãi đã hết hạn sử dụng
    When Go to cart page
    And Enter "Mã voucher" in "Voucher" field with "Voucher03"
    Then User look message "Voucher chưa đến đợt khuyến mãi hoặc đã hết hạn sử dụng, vui lòng nhập mã voucher khác!" popup
    And Delete products added to cart
    Then User look message "Xoá sản phẩm trong giỏ hàng thành công." popup

###----------------------------------------SUCCESSFUL MESSAGE----------------------------------------------------------
Create_Order_08: Xác minh có thể lấy được mã voucher thành công
    [Tags]    @Test_Create_Order     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh có thể lấy được mã voucher thành công
    When Go to cart page
    And Enter "Mã voucher" in "Voucher" field with "Voucher535"
    Then User look message "Lấy thông tin voucher thành công." popup
    And Delete products added to cart
    Then User look message "Xoá sản phẩm trong giỏ hàng thành công." popup

Create_Order_09: Xác minh đặt hàng thanh công khi không nhập mã voucher
    [Tags]    @Test_Create_Order     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh đặt hàng thanh công khi không nhập mã voucher
    When Go to cart page
    And Click "Đặt hàng" button
    Then User look message "Đặt hàng thành công! Đơn hàng của bạn sẽ được gửi đến nhà cung cấp." popup
    And User look title "Quản Lý Đơn Hàng"
    And User look contains title is "Quản lý đơn hàng"

Create_Order_10: Xác minh đặt hàng thanh công với "Mã Voucher" hợp lệ
    [Tags]    @Test_Create_Order     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh đặt hàng thanh công với "Mã Voucher" hợp lệ
    When Go to cart page
    And Enter "Mã voucher" in "Voucher" field with "Voucher535"
    Then User look message "Lấy thông tin voucher thành công." popup
    And Click "Đặt hàng" button
    Then User look message "Đặt hàng thành công! Đơn hàng của bạn sẽ được gửi đến nhà cung cấp." popup
    And User look title "Quản Lý Đơn Hàng"
    And User look contains title is "Quản lý đơn hàng"

Create_Order_11: Xác minh đặt hàng thanh công khi không áp dụng thuế
    [Tags]    @Test_Create_Order     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh đặt hàng thanh công khi không áp dụng thuế
    When Go to cart page
    And Click select on "Thuế" with "Không áp dụng thuế"
    And Click "Đặt hàng" button
    Then User look message "Đặt hàng thành công! Đơn hàng của bạn sẽ được gửi đến nhà cung cấp." popup
    And User look title "Quản Lý Đơn Hàng"
    And User look contains title is "Quản lý đơn hàng"

Create_Order_12: Xác minh đặt hàng thanh công khi thêm voucher và không áp dụng thuế
    [Tags]    @Test_Create_Order     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh đặt hàng thanh công khi thêm voucher và không áp dụng thuế
    When Go to cart page
    And Click select on "Thuế" with "Không áp dụng thuế"
    And Enter "Mã voucher" in "Voucher" field with "Voucher535"
    Then User look message "Lấy thông tin voucher thành công." popup
    And Click "Đặt hàng" button
    Then User look message "Đặt hàng thành công! Đơn hàng của bạn sẽ được gửi đến nhà cung cấp." popup
    And User look title "Quản Lý Đơn Hàng"
    And User look contains title is "Quản lý đơn hàng"

###______________________________________________EDIT ORDER______________________________________________________________
Edit_Order_01: Xác minh điều hướng thành công đến trang "Chỉnh sửa đơn hàng"
    [Tags]    @Test_Edit_Order     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh đặt hàng thanh công khi thêm voucher và không áp dụng thuế
    When Click "Quản lý kho" menu
    And Click "Quản lý đơn hàng" sub menu
    And Select order need to edit
    And Click on "Chỉnh sửa" button
    Then User look title "Chỉnh Sửa Đơn Hàng"
    And User look contains title is "Chỉnh sửa đơn hàng"

####------------------------------------VALIDATION TEXT-----------------------------------------------------------------
Edit_order_02: Xác minh validation text khi bỏ trống trường nhập "Số lượng"
    [Tags]    @Test_Edit_Order     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh validation text khi bỏ trống trường nhập "Số lượng"
    When Go to edit order page
    And Enter "number" in "Nhập SL" field with "${empty}"
    Then Show validation text in "Số lượng" field with "Số lượng là bắt buộc"

Edit_order_03: Xác minh validation text khi nhập "Số lượng" bằng 0
    [Tags]    @Test_Edit_Order     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh validation text khi nhập "Số lượng" bằng 0
    When Go to edit order page
    And Enter "number" in "Nhập SL" field with "0"
    Then Show validation text in "Số lượng" field with "Vui lòng nhập giá trị lớn hơn 0"

Edit_order_04: Xác minh validation text khi nhập "Số lượng" lớn hơn 999999
    [Tags]    @Test_Edit_Order     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh validation text khi nhập "Số lượng" lớn hơn 999999
    When Go to edit order page
    And Enter "number > 999999" in "Nhập SL" field with "_RANDOM_"
    Then Show validation text in "Số lượng" field with "Số lượng không được vượt quá 999999"

####----------------------------------ERROR MESSAGE-------------------------------------------------------------------
Edit_order_05: Xác minh hiển thị thông báo lỗi khi nhập sai voucher khuyến mãi
    [Tags]    @Test_Edit_Order     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh hiển thị thông báo lỗi khi nhập sai voucher khuyến mãi
    When Go to edit order page
    And Enter "Mã voucher" in "Vouchers" field with "_RANDOM_"
    Then User look message "Không tìm thấy thông tin voucher với mã đã chọn!" popup

Edit_order_06: Xác minh hiển thị thông báo lỗi khi nhập voucher khuyến mãi đã đủ số lượng
    [Tags]    @Test_Edit_Order    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh hiển thị thông báo lỗi khi nhập voucher khuyến mãi đã đủ số lượng
    When Go to edit order page
    And Enter "Mã voucher" in "Vouchers" field with "Voucher797"
    Then User look message "Số lượng voucher đã hết, vui lòng nhập mã voucher khác!" popup

Edit_order_07: Xác minh hiển thị thông báo lỗi khi nhập voucher khuyến mãi đã hết hạn sử dụng
    [Tags]    @Test_Edit_Order    @Test_by_Hồ_Văn_Nhật
    [Documentation]       Xác minh hiển thị thông báo lỗi khi nhập voucher khuyến mãi đã hết hạn sử dụng
    When Go to edit order page
    And Enter "Mã voucher" in "Vouchers" field with "Voucher01"
    Then User look message "Voucher chưa đến đợt khuyến mãi hoặc đã hết hạn sử dụng, vui lòng nhập mã voucher khác!" popup

Edit_order_08: Xác minh hiển thị thông báo lỗi khi đơn hàng không có sản phẩm
    [Tags]    @Test_Edit_Order    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh hiển thị thông báo lỗi khi đơn hàng không có sản phẩm
    When Go to edit order page
    When Delete products added to cart
    And Click on "Lưu" button
    Then User look message "Vui lòng thêm sản phẩm" popup

Edit_order_09: Xác minh hiển thị thông báo lỗi khi Điều kiện áp dụng voucher không đủ
    [Tags]    @Test_Edit_Order    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh hiển thị thông báo lỗi khi Điều kiện áp dụng voucher không đủ
    When Go to edit order page
    And Enter "Mã voucher" in "Vouchers" field with "Voucher535"
    Then User look message "Lấy thông tin voucher thành công." popup
    When Delete products added to cart
    Then User look message "Điều kiện áp dụng voucher không đủ, vui lòng kiểm tra lại!" popup

###----------------------------------------SUCCESSFUL MESSAGE----------------------------------------------------------
Edit_order_10: Xác minh chỉnh sửa thành công đơn hàng khi thay đổi voucher khuyến mãi
    [Tags]    @Test_Edit_Order     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh chỉnh sửa thành công đơn hàng khi thay đổi voucher khuyến mãi
    When Go to edit order page
    And Enter "Mã voucher" in "Vouchers" field with "Voucher535"
    Then User look message "Lấy thông tin voucher thành công." popup
    And Click "Lưu" button
    Then User look message "Cập nhật đặt hàng thành công! Đơn hàng của bạn sẽ được gửi đến lại nhà cung cấp." popup

Edit_order_11: Xác minh chỉnh sửa thành công đơn hàng khi thay đổi "Thuế" đơn hàng là "Không áp dụng thuế"
    [Tags]    @Test_Edit_Order    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh chỉnh sửa thành công đơn hàng khi thay đổi "Thuế" đơn hàng là "Không áp dụng thuế"
    When Go to edit order page
    And Click select on "Thuế" with "Không áp dụng thuế"
    And Click "Lưu" button
    Then User look message "Cập nhật đặt hàng thành công! Đơn hàng của bạn sẽ được gửi đến lại nhà cung cấp." popup

Edit_order_12: Xác minh chỉnh sửa thành công đơn hàng khi thay đổi "Thuế" đơn hàng là "Áp dụng thuế"
    [Tags]    @Test_Edit_Order     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh chỉnh sửa thành công đơn hàng khi thay đổi "Thuế" đơn hàng là "Áp dụng thuế"
    When Go to edit order page
    And Click select on "Thuế" with "Áp dụng thuế"
    And Click "Lưu" button
    Then User look message "Cập nhật đặt hàng thành công! Đơn hàng của bạn sẽ được gửi đến lại nhà cung cấp." popup

Edit_order_13: Xác minh chỉnh sửa thành công đơn hàng khi thay đổi sản phẩm
    [Tags]    @Test_Edit_Order     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh chỉnh sửa thành công đơn hàng khi thay đổi sản phẩm
    When Go to change_product order page
    And Delete products added to cart
    And Click on "Thêm sản phẩm" button
    And Add product
    And Enter "%" in "Nhập SL" field with "_RANDOM_"
    And Click "Lưu" button
    Then User look message "Cập nhật đặt hàng thành công! Đơn hàng của bạn sẽ được gửi đến lại nhà cung cấp." popup

####_______________________________________CANCEL ORDER_________________________________________________________________
####---------------------------------------VALIDATION TEXT--------------------------------------------------------------
Cancel_order_01: Xác minh Validation Text khi không nhập "Lý do" là "Khác"
    [Tags]    @Test_Edit_Cancel_Order     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh chỉnh sửa thành công đơn hàng khi thay đổi sản phẩm
    When Go to cancel order page
    And Click on "Đồng ý" button
    Then Show validation text in "Lý do" field with "Hãy điền lý do của bạn !"
#
#####----------------------------------------SUCCESSFUL MESSAGE----------------------------------------------------------
Cancel_order_02: Xác minh hủy đơn hàng thành công với lý do "Khác"
    [Tags]    @Test_Cancel_Order    @Test_by_Hồ_Văn_Nhật
    [Documentation]       Xác minh hủy đơn hàng thành công với lý do "Khác"
    When Go to cancel order page
    And Click select in "Lý do" field with "Khác"
    And Enter "test name" in textarea "Lý do" field with "_RANDOM_"
    And Click on "Đồng ý" button
    Then User look message "Hủy đơn hàng thành công." popup

Cancel_order_03: Xác minh hủy đơn hàng thành công với lý do "Sai địa chỉ"
    [Tags]    @Test_Cancel_Order   @Test_by_Hồ_Văn_Nhật
    [Documentation]       Xác minh hủy đơn hàng thành công với lý do "Sai địa chỉ"
    When Go to cancel order page
    And Click select in "Lý do" field with "Sai địa chỉ"
    And Click on "Đồng ý" button
    Then User look message "Hủy đơn hàng thành công." popup

Cancel_order_04: Xác minh hủy đơn hàng thành công với lý do "Sản phẩm không hợp lệ"
    [Tags]    @Test_Cancel_Order   @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh hủy đơn hàng thành công với lý do "Sản phẩm không hợp lệ"
    When Go to cancel order page
    And Click select in "Lý do" field with "Sản phẩm không hợp lệ"
    And Click on "Đồng ý" button
    Then User look message "Hủy đơn hàng thành công." popup

Cancel_order_05: Xác minh hủy đơn hàng thành công với lý do "Không đủ số lượng"
    [Tags]    @Test_Cancel_Order    @Test_by_Hồ_Văn_Nhật
    [Documentation]       Xác minh hủy đơn hàng thành công với lý do "Không đủ số lượng"
    When Go to cancel order page
    And Click select in "Lý do" field with "Không đủ số lượng"
    And Click on "Đồng ý" button
    Then User look message "Hủy đơn hàng thành công." popup

###**********************************************--"NHẬP HÀNG" PAGE--**************************************************
###---------------------------------------------ERROR MESSAGE----------------------------------------------------------
Receive_Order_01: Xác minh hiển thị thông báo lỗi khi không nhập trường "Nhập hàng"
    [Tags]    @Test_Receive_Order     @Test_by_Hồ_Văn_Nhật
    [Documentation]       Xác minh hiển thị thông báo lỗi khi không nhập trường "Nhập hàng"
    When Go to "Nhập hàng" page
    And Click "Nhập hàng" button
    Then User look message "Vui lòng nhập hàng" popup

Receive_Order_02: Xác minh hiển thị thông báo lỗi khi nhập trường "Nhập hàng" bằng 0
    [Tags]    @Test_Receive_Order     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh hiển thị thông báo lỗi khi nhập trường "Nhập hàng" bằng 0
    When Go to "Nhập hàng" page
    And Enter "number" in "Nhập hàng" field with "0"
    And Click "Nhập hàng" button
    Then User look message "Vui lòng nhập hàng" popup

Receive_Order_03: Xác minh hiển thị thông báo lỗi khi nhập trường "Nhập hàng" lớn hơn số lượng còn lại
    [Tags]    @Test_Receive_Order    @Test_by_Hồ_Văn_Nhật
    [Documentation]       Xác minh hiển thị thông báo lỗi khi nhập trường "Nhập hàng" lớn hơn số lượng còn lại
    When Go to "Nhập hàng" page
    And Enter "Nhập hàng invalid" in "Nhập hàng" field with "_RANDOM_"
    And Click "Nhập hàng" button
    Then User look message "Số lượng nhập vượt quá số lượng đặt hàng." popup

####-----------------------------------SUCCESSFUL MESSAGE---------------------------------------------------------------
Receive_Order_04: Xác minh hiển thị successful message khi nhập hàng thành công
    [Tags]    @Test_Receive_Order    @Test_by_Hồ_Văn_Nhật
    [Documentation]       Xác minh hiển thị successful message khi nhập hàng thành công
    When Go to "Nhập hàng" page
    And Enter "Nhập hàng valid" in "Nhập hàng" field with "_RANDOM_"
    And Click "Nhập hàng" button
    Then User look message "Nhập hàng thành công" popup

####****************************************--"THANH TOÁN" PAGE--*******************************************************
####----------------------------------------VALIDATION TEXT-------------------------------------------------------------
Pay_Order_01: Xác minh validation text khi nhập trường "Nhập hàng" lớn hơn số lượng còn lại
    [Tags]    @Test_Pay_Order     @Test_by_Hồ_Văn_Nhật
    [Documentation]       Xác minh validation text khi nhập trường "Nhập hàng" lớn hơn số lượng còn lại
    When Go to "Thanh toán" page
    And Enter "total invalid" in "Số tiền thanh toán" with "_RANDOM_"
    Then Show validation text in "Số tiền thanh toán" field with "Số tiền nhập không được lớn hơn tổng số tiền cần thanh toán."

####----------------------------------------PAY SUCCESSFUL-------------------------------------------------------------------
Pay_Order_02: Xác minh thanh toán đơn hàng thành công
    [Tags]    @Test_Pay_Order     @Test_by_Hồ_Văn_Nhật
    [Documentation]       Xác minh thanh toán đơn hàng thành công
    When Go to "Thanh toán" page
    And Enter "total valid" in "Số tiền thanh toán" with "_RANDOM_"
    And Click "Xuất phiếu nhập hàng" button
    Then Navite to "Đã giao" tab button

*** Keywords ***
Preconditions
    Set Browser Timeout         ${BROWSER_TIMEOUT}
    New Browser                 ${BROWSER}  headless=${HEADLESS}
    New Page                    ${URL_DEFAULT}
    ${STATE}                    Evaluate  json.loads('''{}''')  json
    Login to Store

Delete Voucher
    And Enter "Mã voucher" in "Vouchers" field with "_RANDOM_"
    Then User look message "Không tìm thấy thông tin voucher với mã đã chọn!" popup

Go to "${name}" page
    When Click "Quản lý kho" menu
    And Click "Quản lý đơn hàng" sub menu
    And Click "Đang giao" tab button
    And Delete date text in "Từ ngày" field
    And Delete date text in "Đến ngày" field
    IF  '${name}' == 'Nhập hàng'
        And Select order need to receive_order
    ELSE IF  '${name}' == 'Thanh toán'
        And Select order need to pay_order
    END

Go to cart page
    When Click "Đặt hàng" menu
    And Add product to cart
    And Click on "Cart" icon on the top-right
    Sleep       0.5

Go to ${name} order page
    When Click "Quản lý kho" menu
    And Click "Quản lý đơn hàng" sub menu
    And Delete date text in "Từ ngày" field
    And Delete date text in "Đến ngày" field
    And Select order need to ${name}
    IF  '${name}' == 'edit' or '${name}' == 'change_product'
        And Click on "Chỉnh sửa" button
        Sleep         0.5
        And Delete Voucher
    ELSE IF  '${name}' == 'cancel'
        And Click on "Hủy đơn hàng" button
    END

Add product
    ${elements}         Get Elements          //*[local-name()='svg' and @class='absolute top-[10px] right-[13px]' and @width=16 and @height=16]
    Click               ${elements}[0]
    Click               //button[@id='add']
    Click on "Đóng" button

Add product to cart
    And Click select in "Chọn nhà cung cấp" with "Siêu thị Big C Huế"
    And Select Product Add To Cart
    And Enter "number valid" in "Số lượng cần đặt hàng" with "_RANDOM_"
    And Click 'Thêm vào giỏ hàng' button
    Then User look message "Thêm sản phẩm vào giỏ hàng thành công." popup

Select Product Add To Cart
    Scroll down "10" times
    ${random}               Get Random Text         number < 12         _RANDOM_
    Sleep                   0.5
    ${elements}             Get Elements           //*[contains(text(),'Thêm vào giỏ hàng')]
    ${element}              Set Variable          ${elements}[${random}]
    Click                   ${element}

Search "${type}" in "${name}" field with "${text}"
    ${text}=                  Get Random Text                   ${type}                       ${text}
    ${element}=               Set Variable        //input[@placeholder="${name}"]
    Clear Text                ${element}
    Fill Text                 ${element}                        ${text}           True
    Wait Until Element Spin
    Sleep                     0.5

Scroll down "${number}" times
    FOR    ${i}    IN RANGE    ${number}
        Scroll To Element     //footer[contains(text(),'Copyright ©2023 ARI Technology Co ., JSC. All righ')]
        Sleep                 ${SHOULD_TIMEOUT}
    END

Delete products added to cart
    Click     //i[@class="las la-trash-alt text-red-600 text-2xl"]

Enter "${type}" in "Số lượng cần đặt hàng" with "${text}"
    ${text}=                              Get Random Text                   ${type}                       ${text}
    ${Số lượng tối thiểu}                 Get Text                          //tbody/tr[2]/td[3]
    ${SL < SLTT}=                         Evaluate              ${Số lượng tối thiểu} - 1
    ${element}=                           Get Element                       //input[contains(@class, "ant-input-number-input")]
    Wait Until Element Is Visible         ${element}
    Clear Text                            ${element}
    IF  '${type}' == 'number valid'
        Fill Text                         ${element}                        ${Số lượng tối thiểu}          True
    ELSE IF  '${type}' == 'number invalid'
        Fill Text                         ${element}                        ${SL < SLTT}                   True
    ELSE IF  '${type}' != 'number valid' and '${type}' != 'number invalid'
        Fill Text                         ${element}                        ${text}                   True
    END

Enter "${type}" in "${name}" field with "${text}"
    ${text}=                              Get Random Text                   ${type}                       ${text}
    IF  '${name}' == 'Voucher' or '${name}' == 'Vouchers'
        ${element}        Get Element       //span[contains(text(),'${name}:')]/..//span/input[contains(@class, "ant-input")]
    ELSE IF  '${name}' == 'Nhập hàng'
        ${element}=                       Get Element                       //input[@placeholder="${name}"]
        ${Còn lại}                        Get Text                          //tbody/tr[2]/td[6]
        ${Còn lại}=                       Evaluate           "${Còn lại}".replace(".", "")
        ${Nhập hàng invalid}              Evaluate          ${Còn lại} + 1
    ELSE IF  '${name}' != 'Voucher' or '${name}' != 'Vouchers'
        ${element}=                        Get Element                       //input[@placeholder="${name}"]
    END
    Wait Until Element Is Visible         ${element}
    Clear Text                            ${element}
    Sleep                                 0.5
    IF    '${type}' == 'Nhập hàng invalid'
        Fill Text                             ${element}                        ${Nhập hàng invalid}         True
    ELSE IF    '${type}' == 'Nhập hàng valid'
        Fill Text                             ${element}                        ${Còn lại}                   True
    ELSE IF    '${type}' != 'Nhập hàng valid'
        Fill Text                             ${element}                        ${text}                     True
    END
    Press Keys                            ${element}                        Enter

Enter "${type}" in "Số tiền thanh toán" with "${text}"
    ${text}=                              Get Random Text                   ${type}                       ${text}
    ${total}                              Get Text                          //*[contains(text(), "Tổng cộng")]/../*[contains(@class, "text-slate-700 font-bold text-base text-right")]
    ${total}=                             Evaluate           "${total}".replace(" VND", "")
    ${total}=                             Evaluate            "${total}".replace(".", "")
    ${total invalid}                      Evaluate             ${total} + 1
    ${element}=                           Get Element                      //div[contains(@class, "ant-input")]//input[contains(@class, "ant-input")]
    Wait Until Element Is Visible         ${element}
    Clear Text                            ${element}
    IF  '${type}' == 'total valid'
        Fill Text                         ${element}                        ${total}              True
    ELSE IF  '${type}' == 'total invalid'
        Fill Text                         ${element}                        ${total invalid}      True
    ELSE IF  '${type}' != 'total valid'
        Fill Text                         ${element}                        ${text}                True
    END

Enter "${type}" in textarea "${name}" field with "${text}"
    ${text}=                  Get Random Text                   ${type}                       ${text}
    ${element}=               Get Element                       //textarea[contains(@class, "ant-input")]
    Clear Text                ${element}
    Fill Text                 ${element}                        ${text}

Click '${name}' button
    ${element}          Get Element           //i/..//*[contains(text(),'${name}')]
    Click               ${element}

Click on "Cart" icon on the top-right
    Click       //i[@class="las la-shopping-cart text-4xl text-gray-500 cursor-pointer"]

Click select in "Chọn nhà cung cấp" with "${text}"
    ${element}=               Get Element                       //*[contains(@class, "ant-select-selection-search-input")]
    Clear Text                ${element}
    Fill Text                 ${element}                    ${text}          True
    ${option}=             Get Element            xpath=//*[contains(@class, "ant-select-item-option") and @title="${text}"]
    Wait Until Element Is Visible       ${option}
    Click                               ${option}

Click select in "${name}" field with "${text}"
    ${element}=               Get Element           //select[@id='reason']
    Select Options By         ${element}          label       ${text}

Click select on "${name}" with "${text}"
    Sleep                  1
    ${loại}=               Get Text                       //*[contains(@class, "ant-select-selection-item")]
    ${element}             Get Element                    //*[contains(text(),'${loại}')]
    Wait Until Element Is Visible       ${element}
    Click                  ${element}
    ${element}                Get Element                      //div[contains(text(),'${text}')]
    Wait Until Element Is Visible       ${element}
    Click                               ${element}
    Sleep             ${SHOULD_TIMEOUT}

User look message "${message}" popup
    Element Text Should Be    id=swal2-html-container           ${message}
    ${element}=               Set Variable                      xpath=//button[contains(text(),'×')]
    Wait Until Element Is Visible         ${element}
    Click               ${element}

Click on "${text}" button
    Sleep               0.5
    ${element}          Get Element           //*[contains(text(),'${text}')]
    Click               ${element}

Get Element Form Item By Label
    [Arguments]               ${name}                           ${xpath}=${EMPTY}
    IF  '${name}' == 'Từ ngày' or '${name}' == 'Đến ngày'
        ${element}          Set Variable                  xpath=//*[contains(text(),'${name}')]/../..${xpath}
    ELSE IF  '${name}' != 'Từ ngày'
        ${element}          Set Variable                  xpath=//*[contains(text(),'${name}:')]/..${xpath}
    END
    [Return]            ${element}

Delete date text in "${name}" field
    ${element}=               Get Element Form Item By Label     ${name}            //span[contains(@class, "ant-picker-clear")]
    Wait Until Element Is Visible       ${element}
    Click                               ${element}
    Sleep                               ${SHOULD_TIMEOUT}

Select order need to ${name}
    IF  '${name}' == 'edit' or '${name}' == 'cancel'
        ${element}    Get Element       //tbody/tr[1]/td[1]
    ELSE IF  '${name}' == 'change_product'
        Search "Mã đơn hàng" in "Mã đơn hàng" field with "${change_product}"
        ${element}    Get Element       //tbody/tr[1]/td[1]
    ELSE IF  '${name}' == 'receive_order'
      ${elements}    Get Elements   //td/div[contains(text(),'Chưa nhận hàng')]
      ${element}     Get Element    ${elements}[0]
    ELSE IF  '${name}' == 'pay_order'
      When Search "Mã đơn hàng" in "Mã đơn hàng" field with "${pay_order}"
      ${element}    Get Element       //tbody/tr[1]/td[1]
    END
    Wait Until Element Is Visible     ${element}
    Click         ${element}        left        2

Show validation text in "${name}" field with "${text}"
    ${element}=               Get Element         //*[contains(text(), "${text}")]
    Element Text Should Be              ${element}                ${text}

Show list of products
    Sleep               1
    ${elements}         Get Elements          //li[@class='ant-list-item']
    Log To Console    ${EMPTY}
    Log To Console    *************************--DANH SÁCH SẢN PHẨM--**************************
    ${count}=           Set Variable        0
    ${stt}=             Set Variable        1
    FOR  ${i}  IN  @{elements}
        ${element_tsp}         Get Elements        //div/h4
        ${element_ncc}         Get Elements        //div/h5
        ${element_giá}         Get Elements        //div/span[@class='font-bold text-xl text-teal-900']
        ${Tên sản phẩm}        Get Text            ${element_tsp}[${count}]
        ${Nhà cung cấp}        Get Text            ${element_ncc}[${count}]
        ${Giá}                 Get Text            ${element_giá}[${count}]
        Log To Console    ${stt}. ${Tên sản phẩm} || Nhà cung cấp: ${Nhà cung cấp} || Giá: ${Giá}
        Log To Console    -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
        ${count}=    Evaluate    ${count} + 1
        ${stt}=    Evaluate    ${stt} + 1
    END
    ${total}      Evaluate    ${stt} - 1
    Log To Console    Tổng số lượng sản phẩm là: ${total}

No product are display
    Wait Until Element Spin
    ${element}=    Set Variable    //div[@class="ant-empty-description"]
    Wait Until Element Is Visible    ${element}
    ${text}=    Get Text    ${element}
    Run Keyword If  '${text}' == 'Trống'    Log To Console    Không có sản phẩm nào ứng với từ khóa tìm kiếm

Navite to "${tab}" tab button
    ${element}            Set Variable          xpath=//*[contains(@class, "ant-tabs-tab-btn") and contains(text(), "${tab}")]
    ${text_element}       Get Text          ${element}
    ${matches}=           Get Regexp Matches        ${text_element}         Đã giao
    ${matched_text}=      Set Variable              ${matches[0]}
    Should Be Equal As Strings          ${matched_text}        ${tab}
