*** Settings ***
Resource            ../keywords/common.robot
Test Setup          Preconditions
Test Teardown       Tear Down

*** Test Cases ***
####===============================ĐIỀU HƯỚNG ĐẾN TRANG TẠO MỚI SẢN PHẨM NON-BALANCE============================================
Create_Non-Balance_Product_01: Kiểm tra có thể điều hướng đến trang tạo mới sản phẩm non-balance
    [Tags]    @Test_Store_Create_Non-Balance_Product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra có thể điều hướng đến trang tạo mới sản phẩm non-balance
    When Click "Quản lý hàng hóa" menu
    And Click "Sản phẩm" sub menu
    And Click "Non-Balance" tab button
    And Click "Thêm mới" button
    And Select category in "Danh mục chính" with "Thời trang nữ"
    And Select category in "Danh mục cấp 1" with "Váy"
    And Click "Tiếp theo" button
    Then User look title "Quản Lý Hàng Hóa"
    And User look contains title is "Thêm sản phẩm"

##============================VERIFY VALIDATION TEXT=================================================================
Create_Non-Balance_Product_02: Kiểm tra Validation Text khi không bỏ trống all field
    [Tags]    @Test_Store_Create_Non-Balance_Product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text khi không bỏ trống all field
    When Go to create non-balance product page
    And Click "Lưu" button
    Then Required message "Tên sản phẩm" displayed under "Đây là trường bắt buộc!" field
    And Required message "Nhà cung cấp" displayed under "Đây là trường bắt buộc!" field
    And Required message "Xuất xứ" displayed under "Đây là trường bắt buộc!" field
    And Required message "Thuế nhập" displayed under "Đây là trường bắt buộc!" field
    And Required message "Thuế bán" displayed under "Đây là trường bắt buộc!" field
    And Required message "Đơn vị cơ bản" displayed under "Đây là trường bắt buộc!" field
    And Required message "Giá nhập (VND)" displayed under "Đây là trường bắt buộc!" field

Create_Non-Balance_Product_03: Kiểm tra Validation Text khi không bỏ trường "Tên sản phẩm"
    [Tags]    @Test_Store_Create_Non-Balance_Product    @Test_by_Hồ_Văn_Nhật
    [Documentation]
    When Go to create non-balance product page
    And Enter "text" in "Tên sản phẩm" with "${EMPTY}"
    And Click in "Thương hiệu" field
    Then Required message "Tên sản phẩm" displayed under "Đây là trường bắt buộc!" field

Create_Non-Balance_Product_04: Kiểm tra Validation Text khi không bỏ trường "Nhà cung cấp"
    [Tags]    @Test_Store_Create_Non-Balance_Product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text khi không bỏ trường "Nhà cung cấp"
    When Go to create non-balance product page
    And Click select "Nhà cung cấp" with "Văn Nhật Store Non-Balance"
    And Delete text in "Nhà cung cấp" field
    Then Required message "Nhà cung cấp" displayed under "Đây là trường bắt buộc!" field

Create_Non-Balance_Product_05: Kiểm tra Validation Text khi không bỏ trường "Xuất xứ"
    [Tags]    @Test_Store_Create_Non-Balance_Product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text khi không bỏ trường "Xuất xứ"
    When Go to create non-balance product page
    And Enter "text" in "Xuất xứ" with "${EMPTY}"
    And Click in "Mã vạch (CH)" field
    Then Required message "Xuất xứ" displayed under "Đây là trường bắt buộc!" field

Create_Non-Balance_Product_06: Kiểm tra Validation Text khi nhập "Mã vạch (CH)" không hợp lệ và lớn hơn 13 ký tự
    [Tags]    @Test_Store_Create_Non-Balance_Product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text khi nhập "Mã vạch (CH)" không hợp lệ và lớn hơn 13 ký tự
    When Go to create non-balance product page
    And Enter "text" in "Mã vạch (CH)" with "_RANDOM_"
    And Click select in "Thuế nhập" field
    Then Required message "Mã vạch (CH)" field displayed under "Vui lòng nhập chỉ nhập số!"
    And Required message "Mã vạch (CH)" field displayed under "Vui lòng nhập tối đa 13 ký tự."

Create_Non-Balance_Product_07: Kiểm tra Validation Text khi nhập "Mã vạch (CH)" không hợp lệ và nhỏ hơn 13 ký tự
    [Tags]    @Test_Store_Create_Non-Balance_Product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text khi nhập "Mã vạch (CH)" không hợp lệ và nhỏ hơn 13 ký tự
    When Go to create non-balance product page
    And Enter "text" in "Mã vạch (CH)" with "hovannhat"
    And Click select in "Thuế nhập" field
    Then Required message "Mã vạch (CH)" displayed under "Vui lòng nhập chỉ nhập số!" field

Create_Non-Balance_Product_08: Kiểm tra Validation Text khi nhập "Mã vạch (CH)" lớn hơn 13 ký tự số
    [Tags]    @Test_Store_Create_Non-Balance_Product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text khi nhập "Mã vạch (CH)" lớn hơn 13 ký tự số
    When Go to create non-balance product page
    And Enter "Barcode_invalid" in "Mã vạch (CH)" with "_RANDOM_"
    And Click select in "Thuế nhập" field
    Then Required message "Mã vạch (CH)" displayed under "Vui lòng nhập tối đa 13 ký tự." field

Create_Non-Balance_Product_09: Kiểm tra Validation Text khi không bỏ trường "Thuế nhập"
    [Tags]    @Test_Store_Create_Non-Balance_Product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text khi không bỏ trường "Thuế nhập"
    When Go to create non-balance product page
    And Click select "Thuế nhập" with "1% - 1%"
    And Delete text in "Thuế nhập" field
    Then Required message "Thuế nhập" displayed under "Đây là trường bắt buộc!" field

Create_Non-Balance_Product_10: Kiểm tra Validation Text khi không bỏ trường "Thuế bán"
    [Tags]    @Test_Store_Create_Non-Balance_Product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text khi không bỏ trường "Thuế bán"
    When Go to create non-balance product page
    And Click select "Thuế bán" with "1% - 1%"
    And Delete text in "Thuế bán" field
    Then Required message "Thuế bán" displayed under "Đây là trường bắt buộc!" field

Create_Non-Balance_Product_11: Kiểm tra Validation Text khi bỏ trống trường "Đơn vị cơ bản"
    [Tags]    @Test_Store_Create_Non-Balance_Product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text khi bỏ trống trường "Đơn vị cơ bản"
    When Go to create non-balance product page
    And Enter "text" in "Đơn vị cơ bản" with "${EMPTY}"
    And Click in "Giá nhập (VND)" field
    Then Required message "Đơn vị cơ bản" displayed under "Đây là trường bắt buộc!" field

Create_Non-Balance_Product_12: Kiểm tra Validation Text khi bỏ trống trường "Giá nhập (VND)"
    [Tags]    @Test_Store_Create_Non-Balance_Product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text khi bỏ trống trường "Giá nhập (VND)"
    When Go to create non-balance product page
    And Enter "text" in "Giá nhập (VND)" with "${EMPTY}"
    And Click in "Đơn vị cơ bản" field
    Then Required message "Giá nhập (VND)" displayed under "Đây là trường bắt buộc!" field

Create_Non-Balance_Product_13: Kiểm tra Validation Text khi nhập "Mô tả sản phẩm" quá 2000 ký tự
    [Tags]    @Test_Store_Create_Non-Balance_Product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text khi nhập "Mô tả sản phẩm" quá 2000 ký tự
    When Go to create non-balance product page
    And Enter "2000 word" in textarea "Mô tả sản phẩm" with "_RANDOM_"
    And Click select in "Thuế nhập" field
    Then Required message "Mô tả sản phẩm" displayed under "Chỉ được nhập tối đa 2000 ký tự!" field

##==============================ERROR MESSAGE==================================================
Create_Non-Balance_Product_14: Kiểm tra hiển thị thông báo lỗi khi upload hình ảnh sai định dạng
    [Tags]    @Test_Store_Create_Non-Balance_Product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra hiển thị thông báo lỗi khi upload hình ảnh sai định dạng
    When Go to create non-balance product page
    And Upload file in "Ảnh sản phẩm chính" with "sản phẩm non-balance.xlsx"
    Then User look message "Định dạng file không hợp lệ. Vui lòng chỉ tải lên file ảnh có định dạng jpg/jpeg/png." popup

Create_Non-Balance_Product_15: Kiểm tra hiển thị thông báo lỗi khi không tải ảnh sản phẩm lên
    [Tags]    @Test_Store_Create_Non-Balance_Product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra hiển thị thông báo lỗi khi không tải ảnh sản phẩm lên
    When Go to create non-balance product page
    And Enter all information
    And Click "Lưu" button
    Then User look message "Hình ảnh không được để trống." popup

Create_Non-Balance_Product_16: Kiểm tra hiển thị thông báo lỗi khi không tải ảnh sản phẩm chính lên
    [Tags]    @Test_Store_Create_Non-Balance_Product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra hiển thị thông báo lỗi khi không tải ảnh sản phẩm chính lên
    When Go to create non-balance product page
    And Upload file in "Ảnh sản phẩm phụ 1" field with "vay1.jpg"
    And Upload file in "Ảnh sản phẩm phụ 2" field with "vay2.jpg"
    And Upload file in "Ảnh sản phẩm phụ 3" field with "vay3.jpg"
    And Enter all information
    And Click "Lưu" button
    Then User look message "Sản phẩm phải có hình ảnh chính." popup

##================================CREATE PRODUCT SUCCESSFULLY==============================================
Create_Non-Balance_Product_17: Kiểm tra tạo mới sản phẩm non-balance thành công
    [Tags]    @Test_Store_Create_Non-Balance_Product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra tạo mới sản phẩm non-balance thành công
    When Go to create non-balance product page
    And Upload all image
    And Enter all information
    And Click "Lưu" button
    Then User look message "Tạo sản phẩm thành công." popup
    And Select Non-Balance Product need to delete
    And Click "Xóa" button
    And Click Verify To Action
    Then User look message "Xóa sản phẩm thành công." popup

Create_Non-Balance_Product_18: Kiểm tra tạo mới sản phẩm non-balance thành công khi không nhập "Mã vạch"
    [Tags]    @Test_Store_Create_Non-Balance_Product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra tạo mới sản phẩm non-balance thành công khi không nhập "Mã vạch"
    When Go to create non-balance product page
    And Upload all image
    And Enter default information
    And Enter "paragraph" in textarea "Mô tả sản phẩm" with "_RANDOM_"
    And Click "Lưu" button
    Then User look message "Tạo sản phẩm thành công." popup
    And Select Non-Balance Product need to delete
    And Click "Xóa" button
    And Click Verify To Action
    Then User look message "Xóa sản phẩm thành công." popup

Create_Non-Balance_Product_19: Kiểm tra tạo mới sản phẩm non-balance thành công khi không nhập "Mô tả sản phẩm"
    [Tags]    @Test_Store_Create_Non-Balance_Product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra tạo mới sản phẩm non-balance thành công khi không nhập "Mô tả sản phẩm"
    When Go to create non-balance product page
    And Upload all image
    And Enter default information
    And Enter "Barcode_valid" in "Mã vạch (CH)" with "_RANDOM_"
    And Click "Lưu" button
    Then User look message "Tạo sản phẩm thành công." popup
    And Select Non-Balance Product need to delete
    And Click "Xóa" button
    And Click Verify To Action
    Then User look message "Xóa sản phẩm thành công." popup

##===================ĐIỀU HƯỚNG ĐẾN TRANG "QUẢN LÝ HÀNG HÓA" TỪ TRANG "TẠO MỚI SẢN PHẨM NON-BALANCE"============================================
Create_Non-Balance_Product_20: Kiểm tra có thể điều hướng đến trang quản lý sản phẩm non-balance thành công
    [Tags]    @Test_Store_Create_Non-Balance_Product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra có thể điều hướng đến trang quản lý sản phẩm non-balance thành công
    When Go to create non-balance product page
    And Click "Trở về" button
    And Click "Trở về" button
    And Click "Trở về" button
    And Click "Trở về" button
    Then User look title "Quản Lý Hàng Hóa"
    And User look contains title is "Quản lý sản phẩm"

##=====================================VIEW LIST OF NON-BALANCE PRODUCT=====================================================
Create_Non-Balance_Product_21: Kiểm tra hiển thị thành công danh sách tất cả sản phẩm
    [Tags]    @Test_Store_Create_Non-Balance_Product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra hiển thị thành công danh sách tất cả sản phẩm
    When Go to list non-balance product page
    And Increase the number of products displayed with "40"
    Then Show list of "Non-Balance Products"

Create_Non-Balance_Product_22: Kiểm tra hiển thị thành công danh sách sản phẩm theo nhà cung cấp
    [Tags]    @Test_Store_Create_Non-Balance_Product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra hiển thị thành công danh sách sản phẩm theo nhà cung cấp
    When Go to list non-balance product page
    And Increase the number of products displayed with "40"
    And Filter product in "Chọn nhà cung cấp" with "Văn Nhật Store Non-Balance"
    Then Show list of "Non-Balance Products"

Create_Non-Balance_Product_23: Kiểm tra hiển thị thành công danh sách sản phẩm theo danh mục chính
    [Tags]    @Test_Store_Create_Non-Balance_Product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra hiển thị thành công danh sách sản phẩm theo danh mục chính
    When Go to list non-balance product page
    And Increase the number of products displayed with "40"
    And Filter product in "Danh mục chính" with "Thịt"
    Then Show list of "Non-Balance Products"

Create_Non-Balance_Product_24: Kiểm tra hiển thị thành công danh sách sản phẩm theo danh mục cấp 1
    [Tags]    @Test_Store_Create_Non-Balance_Product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra hiển thị thành công danh sách sản phẩm theo danh mục cấp 1
    When Go to list non-balance product page
    And Increase the number of products displayed with "40"
    And Filter product in "Danh mục chính" with "Thịt"
    And Filter product in "Danh mục cấp 1" with "Bò"
    Then Show list of "Non-Balance Products"

Create_Non-Balance_Product_25: Kiểm tra hiển thị thành công danh sách sản phẩm theo danh mục cấp 2
    [Tags]    @Test_Store_Create_Non-Balance_Product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra hiển thị thành công danh sách sản phẩm theo danh mục cấp 2
    When Go to list non-balance product page
    And Filter product in "Danh mục chính" with "Shopee"
    And Filter product in "Danh mục cấp 1" with "Consumer Electronics"
    And Filter product in "Danh mục cấp 2" with "Tivi Box"
    Then Show list of "Non-Balance Products"

Create_Non-Balance_Product_26: Kiểm tra có thể xem danh sách sản phẩm Non-Balance trang kế tiếp, trước trước, trang cuối cùng, trang đầu tiên
    [Tags]    @Test_Store_Create_Non-Balance_Product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra có thể xem danh sách sản phẩm Non-Balance trang kế tiếp, trước trước, trang cuối cùng, trang đầu tiên
    When Go to list non-balance product page
    And Click ">" to "next" page
    Then Show list of "Non-Balance Products"
    And Click "<" to "prev" page
    Then Show list of "Non-Balance Products"
    And Click ">>" to "next_all" page
    Then Show list of "Non-Balance Products"
    And Click "<<" to "prev_all" page
    Then Show list of "Non-Balance Products"

###=================================EDIT NON-BALANCE PRODUCT==============================================================
Edit_Non-Balance_Product_01: Kiểm tra có thể điều hướng đến trang chỉnh sửa sản phẩm non-balance thành công
    [Tags]    @Test_Store_Edit_Non-Balance_Product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra có thể điều hướng đến trang chỉnh sửa sản phẩm non-balance thành công
    When Click "Quản lý hàng hóa" menu
    And Click "Sản phẩm" sub menu
    And Click "Non-Balance" tab button
    And Select Non-Balance Product need to edit
    And Click "Chỉnh sửa" button
    Then User look title "Quản Lý Hàng Hóa"
    And User look contains title is "Chỉnh sửa sản phẩm"

##============================VERIFY VALIDATION TEXT=================================================================
Edit_Non-Balance_Product_02: Kiểm tra Validation Text khi không bỏ trống trường "Tên sản phẩm"
    [Tags]    @Test_Store_Edit_Non-Balance_Product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text khi không bỏ trống trường "Tên sản phẩm"
    When Go to edit non-balance product page
    And Enter "text" in "Tên sản phẩm" with "${EMPTY}"
    And Click in "Thương hiệu" field
    Then Required message "Tên sản phẩm" displayed under "Đây là trường bắt buộc!" field

Edit_Non-Balance_Product_03: Kiểm tra Validation Text khi không bỏ trống trường "Nhà cung cấp"
    [Tags]    @Test_Store_Edit_Non-Balance_Product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text khi không bỏ trống trường "Nhà cung cấp"
    When Go to edit non-balance product page
    And Delete text in "Nhà cung cấp" field
    Then Required message "Nhà cung cấp" displayed under "Đây là trường bắt buộc!" field

Edit_Non-Balance_Product_04: Kiểm tra Validation Text khi không bỏ trống trường "Xuất xứ"
    [Tags]    @Test_Store_Edit_Non-Balance_Product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text khi không bỏ trống trường "Xuất xứ"
    When Go to edit non-balance product page
    And Enter "text" in "Xuất xứ" with "${EMPTY}"
    And Click in "Mã vạch (CH)" field
    Then Required message "Xuất xứ" displayed under "Đây là trường bắt buộc!" field

Edit_Non-Balance_Product_05: Kiểm tra Validation Text khi không bỏ trống trường "Thuế nhập"
    [Tags]    @Test_Store_Edit_Non-Balance_Product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text khi không bỏ trống trường "Thuế nhập"
    When Go to edit non-balance product page
    And Delete text in "Thuế nhập" field
    Then Required message "Thuế nhập" displayed under "Đây là trường bắt buộc!" field

Edit_Non-Balance_Product_06: Kiểm tra Validation Text khi không bỏ trống trường "Thuế bán"
    [Tags]    @Test_Store_Edit_Non-Balance_Product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text khi không bỏ trống trường "Thuế bán"
    When Go to edit non-balance product page
    And Delete text in "Thuế bán" field
    Then Required message "Thuế bán" displayed under "Đây là trường bắt buộc!" field

Edit_Non-Balance_Product_07: Kiểm tra Validation Text khi không bỏ trống trường "Đơn vị cơ bản"
    [Tags]    @Test_Store_Edit_Non-Balance_Product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text khi không bỏ trống trường "Đơn vị cơ bản"
    When Go to edit non-balance product page
    And Enter "text" in "Đơn vị cơ bản" with "${EMPTY}"
    And Click in "Giá nhập (VND)" field
    Then Required message "Đơn vị cơ bản" displayed under "Đây là trường bắt buộc!" field

Edit_Non-Balance_Product_08: Kiểm tra Validation Text khi không bỏ trống trường "Giá nhập (VND)"
    [Tags]    @Test_Store_Edit_Non-Balance_Product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text khi không bỏ trống trường "Giá nhập (VND)"
    When Go to edit non-balance product page
    And Enter "text" in "Giá nhập (VND)" with "${EMPTY}"
    And Click in "Đơn vị cơ bản" field
    Then Required message "Giá nhập (VND)" displayed under "Đây là trường bắt buộc!" field

Edit_Non-Balance_Product_09: Kiểm tra Validation Text khi nhập "Mã vạch (CH)" không hợp lệ và lớn hơn 13 ký tự
    [Tags]    @Test_Store_Edit_Non-Balance_Product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text khi nhập "Mã vạch (CH)" không hợp lệ và lớn hơn 13 ký tự
    When Go to edit non-balance product page
    And Enter "text" in "Mã vạch (CH)" with "_RANDOM_"
    And Click select in "Thuế nhập" field
    Then Required message "Mã vạch (CH)" field displayed under "Vui lòng nhập chỉ nhập số!"
    And Required message "Mã vạch (CH)" field displayed under "Vui lòng nhập tối đa 13 ký tự."

Edit_Non-Balance_Product_10: Kiểm tra Validation Text khi nhập "Mã vạch (CH)" không hợp lệ và nhỏ hơn 13 ký tự
    [Tags]    @Test_Store_Edit_Non-Balance_Product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text khi nhập "Mã vạch (CH)" không hợp lệ và nhỏ hơn 13 ký tự
    When Go to edit non-balance product page
    And Enter "fullname" in "Mã vạch (CH)" with "hovannhat"
    And Click select in "Thuế nhập" field
    Then Required message "Mã vạch (CH)" displayed under "Vui lòng nhập chỉ nhập số!" field

Edit_Non-Balance_Product_11: Kiểm tra Validation Text khi nhập "Mã vạch (CH)" lớn hơn 13 ký tự số
    [Tags]    @Test_Store_Edit_Non-Balance_Product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text khi nhập "Mã vạch (CH)" lớn hơn 13 ký tự số
    When Go to edit non-balance product page
    And Enter "Barcode_invalid" in "Mã vạch (CH)" with "_RANDOM_"
    And Click select in "Thuế nhập" field
    Then Required message "Mã vạch (CH)" displayed under "Vui lòng nhập tối đa 13 ký tự." field

Edit_Non-Balance_Product_12: Kiểm tra Validation Text khi nhập "Mô tả sản phẩm" quá 2000 ký tự
    [Tags]    @Test_Store_Edit_Non-Balance_Product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text khi nhập "Mô tả sản phẩm" quá 2000 ký tự
    When Go to edit non-balance product page
    And Enter "2000 word" in textarea "Mô tả sản phẩm" with "_RANDOM_"
    And Click select in "Thuế nhập" field
    Then Required message "Mô tả sản phẩm" displayed under "Chỉ được nhập tối đa 2000 ký tự!" field

Edit_Non-Balance_Product_13: Kiểm tra Validation Text khi nhập bỏ trống trường "Đơn vị"
    [Tags]    @Test_Store_Edit_Non-Balance_Product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text khi nhập bỏ trống trường "Đơn vị"
    When Go to edit non-balance product page
    And Click "Thêm đơn vị" button
    And Enter "text" in "Đơn vị" field with "${EMPTY}"
    And Enter "text" in "Giá trị quy đổi" field with "${EMPTY}"
    Then Required message in "Đơn vị" field displayed under with "Đây là trường bắt buộc."

Edit_Non-Balance_Product_14: Kiểm tra Validation Text khi nhập bỏ trống trường "Giá trị quy đổi"
    [Tags]    @Test_Store_Edit_Non-Balance_Product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text khi nhập bỏ trống trường "Giá trị quy đổi"
    When Go to edit non-balance product page
    And Click "Thêm đơn vị" button
    And Enter "text" in "Giá trị quy đổi" field with "${EMPTY}"
    And Enter "text" in "Đơn vị" field with "${EMPTY}"
    Then Required message in "Giá trị quy đổi" field displayed under with "Đây là trường bắt buộc."

Edit_Non-Balance_Product_15: Kiểm tra Validation Text khi nhập bỏ trống trường "Giá bán (VND)"
    [Tags]    @Test_Store_Edit_Non-Balance_Product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text khi nhập bỏ trống trường "Giá bán (VND)"
    When Go to edit non-balance product page
    And Click "Thêm đơn vị" button
    And Enter "text" in "Giá bán (VNĐ)" field with "${EMPTY}"
    And Enter "text" in "Giá trị quy đổi" field with "${EMPTY}"
    Then Required message in "Giá bán (VNĐ)" field displayed under with "Đây là trường bắt buộc."

##==============================ERROR MESSAGE==================================================
Edit_Non-Balance_Product_16: Kiểm tra hiển thị thông báo lỗi khi chỉnh sửa ảnh sản phẩm sai định dạng hình ảnh
    [Tags]    @Test_Store_Edit_Non-Balance_Product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra hiển thị thông báo lỗi khi chỉnh sửa ảnh sản phẩm sai định dạng hình ảnh
    When Go to edit non-balance product page
    And Delete the main product image
    And Upload file in "Ảnh sản phẩm chính" with "sản phẩm non-balance.xlsx"
    Then User look message "Định dạng file không hợp lệ. Vui lòng chỉ tải lên file ảnh có định dạng jpg/jpeg/png." popup

Edit_Non-Balance_Product_17: Kiểm tra hiển thị thông báo lỗi khi sản phẩm không có hình ảnh chính
    [Tags]    @Test_Store_Edit_Non-Balance_Product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra hiển thị thông báo lỗi khi sản phẩm không có hình ảnh chính
    When Go to edit non-balance product page
    And Delete the main product image
    And Click "Lưu" button
    Then User look message "Sản phẩm phải có hình ảnh chính." popup

Edit_Non-Balance_Product_18: Kiểm tra hiển thị thông báo lỗi khi sản phẩm không có hình ảnh nào
    [Tags]    @Test_Store_Edit_Non-Balance_Product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra hiển thị thông báo lỗi khi sản phẩm không có hình ảnh nào
    When Go to edit non-balance product page
    And Delete all product image
    And Click "Lưu" button
    Then User look message "Hình ảnh không được để trống." popup

Edit_Non-Balance_Product_19: Kiểm tra hiển thị thông báo lỗi khi bỏ trống trường "Giá bán (VND)"
    [Tags]    @Test_Store_Edit_Non-Balance_Product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra hiển thị thông báo lỗi khi bỏ trống trường "Giá bán (VND)"
    When Go to edit non-balance product page
    And Enter "cost" in "Giá bán (VND)" field with "${EMPTY}"
    And Click "Lưu" button
    Then User look message "Giá bán (VND) là bắt buộc." popup

Edit_Non-Balance_Product_20: Kiểm tra hiển thị thông báo lỗi khi không nhập "Đơn vị"
    [Tags]    @Test_Store_Edit_Non-Balance_Product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra hiển thị thông báo lỗi khi không nhập "Đơn vị"
    When Go to edit non-balance product page
    And Enter "cost" in "Giá bán (VND)" field with "_RANDOM_"
    And Click "Thêm đơn vị" button
    And Enter "test name" in "Giá trị quy đổi" field with "_RANDOM_"
    And Enter "cost" in "Giá bán (VNĐ)" field with "_RANDOM_"
    And Enter "Barcode_valid" in "Mã vạch (CH)" field with "_RANDOM_"
    And Click "Lưu" button
    Then User look message "Đơn vị là bắt buộc." popup

Edit_Non-Balance_Product_21: Kiểm tra hiển thị thông báo lỗi khi không nhập "Giá trị quy đổi"
    [Tags]    @Test_Store_Edit_Non-Balance_Product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra hiển thị thông báo lỗi khi không nhập "Giá trị quy đổi"
    When Go to edit non-balance product page
    And Enter "cost" in "Giá bán (VND)" field with "_RANDOM_"
    And Click "Thêm đơn vị" button
    And Enter "test name" in "Đơn vị" field with "_RANDOM_"
    And Enter "cost" in "Giá bán (VNĐ)" field with "_RANDOM_"
    And Enter "Barcode_valid" in "Mã vạch (CH)" field with "_RANDOM_"
    And Click "Lưu" button
    Then User look message "Đơn vị là bắt buộc." popup

Edit_Non-Balance_Product_22: Kiểm tra hiển thị thông báo lỗi khi không nhập "Giá bán (VNĐ)"
    [Tags]    @Test_Store_Edit_Non-Balance_Product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra error message khi không nhập "Giá bán (VND)"
    When Go to edit non-balance product page
    And Enter "cost" in "Giá bán (VND)" field with "_RANDOM_"
    And Click "Thêm đơn vị" button
    And Enter "test name" in "Đơn vị" field with "_RANDOM_"
    And Enter "test name" in "Giá trị quy đổi" field with "_RANDOM_"
    And Enter "Barcode_valid" in "Mã vạch (CH)" field with "_RANDOM_"
    And Click "Lưu" button
    Then User look message "Đơn vị là bắt buộc." popup

#================================EDIT NON-BALANCE PRODUCT SUCCESSFULLY==============================================
Edit_Non-Balance_Product_23: Kiểm tra chỉnh sửa sản phẩm non-balance thành công khi thay đổi thông tin sản phẩm non-balance
    [Tags]    @Test_Store_Edit_Non-Balance_Product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra chỉnh sửa sản phẩm non-balance thành công khi thay đổi thông tin sản phẩm non-balance
    When Go to edit non-balance product page
    And Enter edit information
    And Click "Lưu" button
    Then User look message "Chỉnh sửa sản phẩm thành công." popup

Edit_Non-Balance_Product_24: Kiểm tra chỉnh sửa sản phẩm non-balance thành công khi thay đổi giá sản phẩm non-balance
    [Tags]    @Test_Store_Edit_Non-Balance_Product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra chỉnh sửa sản phẩm non-balance thành công khi thay đổi giá sản phẩm non-balance
    When Go to edit non-balance product page
    And Enter "cost" in "Giá bán (VND)" field with "_RANDOM_"
    And Click "Lưu" button
    Then User look message "Chỉnh sửa sản phẩm thành công." popup

Edit_Non-Balance_Product_25: Kiểm tra chỉnh sửa sản phẩm non-balance thành công khi thay đổi danh mục sản phẩm non-balance
    [Tags]    @Test_Store_Edit_Non-Balance_Product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra chỉnh sửa sản phẩm non-balance thành công khi thay đổi danh mục sản phẩm non-balance
    When Go to edit non-balance product page
    And Click icon edit when change category
    And Change category
    And Click "Lưu" button
    Then User look message "Chỉnh sửa sản phẩm thành công." popup

##================================BACK TO LIST NON-BALANCE PRODUCT PAGE FROM EDIT NON-BALANCE PRODUCT PAGE======================================================
Edit_Non-Balance_Product_26: Kiểm tra điều hướng đến trang danh sách sản phẩm từ trang chỉnh sửa sản phẩm non-balance
    [Tags]    @Test_Store_Edit_Non-Balance_Product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra điều hướng đến trang danh sách sản phẩm từ trang chỉnh sửa sản phẩm non-balance
    When Go to edit non-balance product page
    And Click "Trở về" button
    Then User look title "Quản Lý Hàng Hóa"
    And User look contains title is "Quản lý sản phẩm"

###============================BACK TO LIST PRODUCT PAGE FROM DETAIL INFORMATION NON-BALANCE PRODUCT PAGE=================================================
Edit_Non-Balance_Product_27: Kiểm tra điều hướng đến trang danh sách sản phẩm từ trang thông tin sản phẩm non-balance khi nhấn nút "Trở về"
    [Tags]    @Test_Store_Edit_Non-Balance_Product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra điều hướng đến trang danh sách sản phẩm từ trang thông tin sản phẩm non-balance khi nhấn nút "Trở về"
    When Go to detail information product page
    And Click "Trở về" button
    Then User look title "Quản Lý Hàng Hóa"
    And User look contains title is "Quản lý sản phẩm"

Edit_Non-Balance_Product_28: Kiểm tra điều hướng đến trang danh sách sản phẩm từ trang thông tin sản phẩm non-balance khi nhấn nút "←"
    [Tags]    @Test_Store_Edit_Non-Balance_Product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra điều hướng đến trang danh sách sản phẩm từ trang thông tin sản phẩm non-balance khi nhấn nút "←"
    When Go to detail information product page
    And Click "←" button
    Then User look title "Quản Lý Hàng Hóa"
    And User look contains title is "Quản lý sản phẩm"

###=======================================NAVIGATE TO DETAIL INFORMATION PRODUCT PAGE===============================================================
Edit_Non-Balance_Product_29: Kiểm tra điều hướng đến trang thông tin chi tiết sản phẩm non-balance thành công
    [Tags]    @Test_Store_Edit_Non-Balance_Product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra điều hướng đến trang thông tin chi tiết sản phẩm non-balance thành công
    When Go to list non-balance product page
    And Select Non-Balance Product need to edit
    Then User look title "Quản Lý Hàng Hóa"
    And User look contains title is "Sản phẩm"

*** Keywords ***
Preconditions
  Set Browser Timeout         ${BROWSER_TIMEOUT}
  New Browser                 ${BROWSER}  headless=${HEADLESS}
  New Page                    ${URL_DEFAULT}
  ${STATE}                    Evaluate  json.loads('''{}''')  json
  Login to Store

Go to detail information product page
  When Go to list non-balance product page
  And Select Non-Balance Product need to edit

Go to ${text} non-balance product page
  When Click "Quản lý hàng hóa" menu
  And Click "Sản phẩm" sub menu
  And Click "Non-Balance" tab button
  IF  '${text}' == 'edit'
     And Select Non-Balance Product need to edit
     And Click "Chỉnh sửa" button
  ELSE IF   '${text}' == 'create'
     And Click "Thêm mới" button
     And Select category in "Danh mục chính" with "Thời trang nữ"
     And Select category in "Danh mục cấp 1" with "Váy"
     And Click "Tiếp theo" button
  END

Get Element Form Item By Label
  [Arguments]               ${name}                           ${xpath}=${EMPTY}
  [Return]            xpath=//*[contains(text(),'${name}')]/..${xpath}

Get Categoty By Name
    [Arguments]               ${name}                           ${xpath}=${EMPTY}
    [Return]            xpath=//h1[contains(text(),'${name}')]/..${xpath}

Select category in "${name}" with "${text}"
  ${element}       Get Categoty By Name       ${name}         //div[contains(text(),'${text}')]
  Wait Until Element Is Visible     ${element}
  Click     ${element}

Change category
  And Select category in "Danh mục chính" with "Thể thao"
  And Select category in "Danh mục cấp 1" with "Bóng đá"
  And Select category in "Danh mục cấp 2" with "Áo đấu"
  And Click "Tiếp theo" button

Click Verify To Action
    ${element}      Set Variable        xpath=//button[contains(text(),'Đồng ý')]
    Click           ${element}

Delete the main product image
  Click       //i[@class="las la-times text-right hover:scale-150 text-xl"]

Delete all product image
  Delete the main product image
  ${element}      Get Elements      //i[@class="las la-times text-right hover:scale-150 text-base"]
  FOR   ${temp}   IN    @{element}
      Click       ${element}[0]
  END

Enter "${type}" in "${name}" field with "${text}"
  ${text}=                  Get Random Text                   ${type}                       ${text}
  IF  '${name}' == 'Đơn vị'
    ${elements}=              Get Elements        //input[@placeholder="Nhập giá trị"]
    ${element}=     Set Variable    ${elements}[0]
  ELSE IF  '${name}' == 'Giá trị quy đổi'
    ${elements}=              Get Elements        //input[@placeholder="Nhập giá trị"]
    ${element}=     Set Variable    ${elements}[1]
  ELSE IF  '${name}' == 'Giá bán (VND)'
    ${element}=     Get Element Form Item By Label      ${name}     //input[contains(@class, "ant-input")]
  ELSE IF  '${name}' == 'Giá bán (VNĐ)'
    ${elements}=              Get Elements        //input[@placeholder="Nhập giá trị"]
    ${element}=     Set Variable    ${elements}[2]
  ELSE IF  '${name}' == 'Mã vạch (CH)'
    ${elements}=              Get Elements        //input[@placeholder="Nhập giá trị"]
    ${element}=     Set Variable    ${elements}[3]
  END
  Wait Until Element Is Visible     ${element}
  Clear Text                ${element}
  Fill Text                 ${element}                        ${text}                       True

Enter ${text} information
  And Enter "test name" in "Tên sản phẩm" with "_RANDOM_"
  And Enter "test name" in "Thương hiệu" with "_RANDOM_"
  And Click select "Nhà cung cấp" with "Văn Nhật Store Non-Balance"
  And Enter "test name" in "Xuất xứ" with "_RANDOM_"
  IF  '${text}' == 'all' or '${text}' == 'edit'
    And Enter "Barcode_valid" in "Mã vạch (CH)" with "_RANDOM_"
  END
  And Click select "Thuế nhập" with "Thuế môi trường - 10%"
  And Click select "Thuế bán" with "Thuế môi trường - 10%"
  IF  '${text}' == 'all' or '${text}' == 'edit'
    And Enter "paragraph" in textarea "Mô tả sản phẩm" with "_RANDOM_"
  END
  IF  '${text}' == 'all' or '${text}' == 'default'
    And Enter "test name" in "Đơn vị cơ bản" with "_RANDOM_"
    And Enter "cost" in "Giá nhập (VND)" with "_RANDOM_"
  END

Select Non-Balance Product need to ${name}
  IF  '${name}' == 'edit'
     ${element}    Get Element   //td[contains(text(),'PRD4968')]
  ELSE IF  '${name}' != 'edit'
     ${element}    Get Element   //tbody/tr[1]/td[1]
  END
  Wait Until Element Is Visible       ${element}
  Click         ${element}        left        2

Increase the number of products displayed with "${number}"
  ${element}=       Set Variable      //span[@class="ant-select-selection-item" and @title="10"]
  Wait Until Element Is Visible       ${element}
  Click       ${element}
  ${element}=       Get Element       //*[contains(@class, "ant-select-item-option-content") and text()='${number}']
  Click       ${element}
  Wait Until Element Spin
  Sleep   ${SHOULD_TIMEOUT}

Filter product in "${name}" with "${text}"
  ${elements}         Get Elements     xpath=//input[@class='ant-select-selection-search-input']
  IF  '${name}' == 'Chọn nhà cung cấp'
    ${element}         Set Variable      ${elements}[0]
  ELSE IF  '${name}' == 'Danh mục chính'
    ${element}        Set Variable      ${elements}[2]
  ELSE IF  '${name}' == 'Danh mục cấp 1'
    ${element}        Set Variable      ${elements}[3]
  ELSE IF  '${name}' == 'Danh mục cấp 2'
    ${element}        Set Variable      ${elements}[4]
  END
  Wait Until Element Is Visible   ${element}
  Clear Text                      ${element}
  Type Text                       ${element}              ${text}
  ${element}=       Set Variable       //div[contains(text(),'${text}')]
  Wait Until Element Is Visible       ${element}
  Click             ${element}

Click select in "${name}" field
  ${element}=               Get Element Form Item By Name     ${name}          //*[contains(@class, "ant-select-show-arrow")]
  Wait Until Element Is Visible    ${element}
  Click                            ${element}

Select file in "${name}" with "${text}"
  ${elements}=                     Get Elements        //span[1]/div[1]/div[1]
  IF  '${name}' == 'Tải ảnh lên từ thiết bị'
      ${element}        Set Variable      ${elements}[0]
  ELSE IF  '${name}' != 'Tải ảnh lên từ thiết bị'
      ${element}        Set Variable      ${elements}[1]
  END
  Wait Until Element Is Visible     ${element}
  Click       ${element}
  Sleep       5

Required message in "${name}" field displayed under with "${text}"
  ${element}=               Set Variable                       //*[contains(@class, "ant-form-item-explain-error")]
  Wait Until Element Is Visible                   ${element}
  Element Text Should Be    ${element}            ${text}

Upload file in "${name}" with "${text}"
  ${element}=                 Get Elements           //input[@type = "file"]
  Upload File By Selector     ${element}[0]          test/upload/${text}
  Sleep     1

Upload file in "${name}" field with "${text}"
  ${element}=                 Get Elements           //input[@type = "file"]
  Upload File By Selector     ${element}[1]          test/upload/${text}
  Sleep     1

Upload all image
  And Upload file in "Ảnh chính sản phẩm" with "vaychinh.jpg"
  And Upload file in "Ảnh phụ sản phẩm 1" with "vay1.jpg"
  And Upload file in "Ảnh phụ sản phẩm 2" with "vay2.jpg"
  And Upload file in "Ảnh phụ sản phẩm 3" with "vay3.jpg"

Click icon edit when change category
    Click       //span[@class='cursor-pointer']

Show list of "Non-Balance Products"
    Wait Until Element Spin
    ${elements}=        Get Elements        xpath=//*[contains(@class, "ant-table-row")]
    Run Keyword If    ${elements}     Display     ${elements}
    ...    ELSE    Log To Console     Không tồn tại sản phẩm non-balance nào!
Display
    [Arguments]    ${name}    ${elements}
    Log To Console      *************************-DANH SÁCH SẢN PHẨM NON-BALANCE-**************************
    Wait Until Element Is Visible         ${elements}[0]
    ${count}=           Set Variable        1
    ${stt}=             Set Variable        1
    FOR  ${i}  IN  @{elements}
        ${Mã sản phẩm}              Get Text            //tbody/tr[${count}]/td[1]
        ${Mã vạch}                  Get Text            //tbody/tr[${count}]/td[2]
        ${Tên sản phẩm}             Get Text            //tbody/tr[${count}]/td[3]
        ${Danh mục}                 Get Text            //tbody/tr[${count}]/td[4]
        ${Nhà cung cấp}               Get Text            //tbody/tr[${count}]/td[5]
        ${Trạng thái}               Get Text            //tbody/tr[${count}]/td[6]
        ${Giá bán của CH}           Get Text            //tbody/tr[${count}]/td[7]
        Log To Console    ${stt}. Mã sản phẩm: ${Mã sản phẩm} | Mã vạch: ${Mã vạch} | Tên sản phẩm: ${Tên sản phẩm} | Danh mục: ${Danh mục} | Nhà cung cấp: ${Nhà cung cấp} | Giá nhập (VND): ${Trạng thái} | Giá bán của CH (VND): ${Giá bán của CH}
        Log To Console    =================================================================================================================================================================================
        ${count}=    Evaluate    ${count} + 1
        ${stt}=    Evaluate    ${stt} + 1
    END
    ${total}=    Evaluate    ${count} - 1
    Log To Console    Tổng số lượng sản phẩm non-balance là: ${total}
