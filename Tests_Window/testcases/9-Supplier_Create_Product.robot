*** Settings ***
Resource            ../keywords/common.robot
Test Setup          Preconditions
Test Teardown       Tear Down

*** Test Cases ***
#####===============================ĐIỀU HƯỚNG ĐẾN TRANG TẠO MỚI SẢN PHẨM============================================
Create_Product_01: Kiểm tra có thể điều hướng đến trang tạo mới sản phẩm
    [Tags]    @Test_create_product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra có thể điều hướng đến trang tạo mới sản phẩm
    When Click "Quản lý hàng hóa" menu
    And Click "Sản phẩm" sub menu
    And Click "Thêm sản phẩm" button
    And Select category in "Danh mục chính" with "Thời trang nữ"
    And Select category in "Danh mục cấp 1" with "Váy"
    And Click "Tiếp theo" button
    Then User look title "Quản Lý Hàng Hóa"
    And User look contains title is "Thêm sản phẩm"

####============================VERIFY VALIDATION TEXT=================================================================
Create_Product_02: Kiểm tra Validation Text khi không bỏ trống all field
    [Tags]    @Test_create_product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text khi không bỏ trống all field
    When Go to create product page
    And Click "Lưu" button
    Then Required message "Tên sản phẩm" displayed under "Đây là trường bắt buộc!" field
    And Required message "Xuất xứ" displayed under "Đây là trường bắt buộc!" field
    And Required message "Thuế nhập" displayed under "Đây là trường bắt buộc!" field
    And Required message "Thuế bán" displayed under "Đây là trường bắt buộc!" field
    And Required message "Đơn vị cơ bản" displayed under "Đây là trường bắt buộc!" field

Create_Product_03: Kiểm tra Validation Text khi không bỏ trống trường "Tên sản phẩm"
    [Tags]    @Test_create_product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text khi không bỏ trống trường "Tên sản phẩm"
    When Go to create product page
    And Enter "text" in "Tên sản phẩm" with "${EMPTY}"
    And Click in "Thương hiệu" field
    Then Required message "Tên sản phẩm" displayed under "Đây là trường bắt buộc!" field

Create_Product_04: Kiểm tra Validation Text khi không bỏ trống trường "Xuất xứ"
    [Tags]    @Test_create_product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text khi không bỏ trống trường "Xuất xứ"
    When Go to create product page
    And Enter "text" in "Xuất xứ" with "${EMPTY}"
    And Click in "Thương hiệu" field
    Then Required message "Xuất xứ" displayed under "Đây là trường bắt buộc!" field

Create_Product_05: Kiểm tra Validation Text khi không bỏ trống trường "Thuế nhập"
    [Tags]    @Test_create_product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text khi không bỏ trống trường "Thuế nhập"
    When Go to create product page
    And Click select "Thuế nhập" with "Thuế môi trường - 10%"
    And Delete text in "Thuế nhập" field
    Then Required message "Thuế nhập" displayed under "Đây là trường bắt buộc!" field

Create_Product_06: Kiểm tra Validation Text khi không bỏ trống trường "Thuế bán"
    [Tags]    @Test_create_product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text khi không bỏ trống trường "Thuế bán"
    When Go to create product page
    And Click select "Thuế nhập" with "Thuế môi trường - 10%"
    And Click select "Thuế bán" with "Thuế môi trường - 10%"
    And Delete text in "Thuế bán" field
    Then Required message "Thuế bán" displayed under "Đây là trường bắt buộc!" field

Create_Product_07: Kiểm tra Validation Text khi không bỏ trống trường "Đơn vị cơ bản"
    [Tags]    @Test_create_product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text khi không bỏ trống trường "Đơn vị cơ bản"
    When Go to create product page
    And Enter "text" in "Đơn vị cơ bản" with "${empty}"
    And Click in "Thương hiệu" field
    Then Required message "Đơn vị cơ bản" displayed under "Đây là trường bắt buộc!" field

Create_Product_08: Kiểm tra Validation Text khi nhập "Mã vạch" không hợp lệ và lớn hơn 13 ký tự
    [Tags]    @Test_create_product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text khi nhập "Mã vạch" không hợp lệ và lớn hơn 13 ký tự
    When Go to create product page
    And Enter "text" in "Mã vạch" with "_RANDOM_"
    And Click in "Thương hiệu" field
    Then Required message "Mã vạch" field displayed under "Vui lòng nhập chỉ nhập số!"
    And Required message "Mã vạch" field displayed under "Vui lòng nhập tối đa 13 ký tự."

Create_Product_09: Kiểm tra Validation Text khi nhập "Mã vạch" không hợp lệ và nhỏ hơn 13 ký tự
    [Tags]    @Test_create_product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text khi nhập "Mã vạch" không hợp lệ và nhỏ hơn 13 ký tự
    When Go to create product page
    And Enter "text" in "Mã vạch" with "hovannhat"
    And Click in "Thương hiệu" field
    Then Required message "Mã vạch" displayed under "Vui lòng nhập chỉ nhập số!" field

Create_Product_10: Kiểm tra Validation Text khi nhập "Mã vạch" lớn hơn 13 ký tự số
    [Tags]    @Test_create_product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text khi nhập "Mã vạch" lớn hơn 13 ký tự số
    When Go to create product page
    And Enter "Barcode_invalid" in "Mã vạch" with "_RANDOM_"
    And Click in "Thương hiệu" field
    Then Required message "Mã vạch" displayed under "Vui lòng nhập tối đa 13 ký tự." field

Create_Product_11: Kiểm tra Validation Text khi nhập "Mô tả sản phẩm" quá 2000 ký tự
    [Tags]    @Test_create_product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text khi nhập "Mô tả sản phẩm" quá 2000 ký tự
    When Go to create product page
    And Enter "2000 word" in textarea "Mô tả sản phẩm" with "_RANDOM_"
    And Click in "Thương hiệu" field
    Then Required message "Mô tả sản phẩm" displayed under "Chỉ được nhập tối đa 2000 ký tự!" field

###================================ERROR MESSAGE WITH "THÊM GIÁ" BUTTON================================================================##
Create_Product_12: Kiểm tra error message khi không nhập thông tin bảng giá
    [Tags]    @Test_create_product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra hiển thị thông báo lỗi khi không nhập thông tin bảng giá sản phẩm
    When Go to create product page
    And Click "Thêm giá" button
    Then User look message "Vui lòng nhập thông tin bảng giá" popup

Create_Product_13: Kiểm tra error message khi nhập "Số lượng tối thiểu" bằng 0
    [Tags]    @Test_create_product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra hiển thị thông báo lỗi khi nhập "Số lượng tối thiểu" bằng 0
    When Go to create product page
    And Enter "number" in "Số lượng tối thiểu" field with "0"
    And Click "Thêm giá" button
    Then User look message "Vui lòng nhập số lượng tối thiểu lớn hơn 0" popup

Create_Product_14: Kiểm tra error message khi nhập "Số lượng tối thiểu" nhỏ hơn "Số lượng tối thiểu" vừa tạo
    [Tags]    @Test_create_product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra hiển thị thông báo lỗi khi nhập "Số lượng tối thiểu" nhỏ hơn "Số lượng tối thiểu" vừa tạo
    When Go to create product page
    And Enter "number" in "Số lượng tối thiểu" field with "10"
    And Click "Thêm giá" button
    And Enter "number" in "Thêm số lượng tối thiểu" field with "1"
    And Click "Thêm giá" button
    Then User look message "Số lượng tối thiểu phải lớn hơn số lượng vừa tạo" popup

###==============================ERROR MESSAGE WITH "LƯU" BUTTON==================================================
Create_Product_15: Kiểm tra error message khi upload ảnh sản phẩm sai định dạng
    [Tags]    @Test_create_product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra hiển thị thông báo lỗi khi upload ảnh sản phẩm sai định dạng
    When Go to create product page
    And Upload file in "Ảnh chính" with "sản phẩm non-balance.xlsx"
    Then User look message "Định dạng file không hợp lệ. Vui lòng chỉ tải lên file ảnh có định dạng jpg/jpeg/png." popup

Create_Product_16: Kiểm tra error message khi không tải ảnh sản phẩm lên
    [Tags]    @Test_create_product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra hiển thị thông báo lỗi khi không tải ảnh sản phẩm lên
    When Go to create product page
    And Enter default information
    And Click "Lưu" button
    Then User look message "Hình ảnh không được để trống." popup

Create_Product_17: Kiểm tra error message khi không tải ảnh sản phẩm chính lên
    [Tags]    @Test_create_product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra hiển thị thông báo lỗi khi không tải ảnh sản phẩm chính lên
    When Go to create product page
    And Upload file in "Ảnh phụ sản phẩm 1" field with "vay1.jpg"
    And Upload file in "Ảnh phụ sản phẩm 2" field with "vay2.jpg"
    And Upload file in "Ảnh phụ sản phẩm 3" field with "vay3.jpg"
    And Enter default information
    And Click "Lưu" button
    Then User look message "Sản phẩm phải có hình ảnh chính." popup

Create_Product_18: Kiểm tra error message khi không nhập "Chủng loại giá"
    [Tags]    @Test_create_product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra hiển thị thông báo lỗi khi không nhập "Chủng loại giá"
    When Go to create product page
    And Upload all image
    And Enter default information
    And Click "Lưu" button
    Then User look message "Chủng loại giá là bắt buộc." popup

Create_Product_19: Kiểm tra error message khi không nhập "Số lượng tối thiểu"
    [Tags]    @Test_create_product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra hiển thị thông báo lỗi khi không nhập "Số lượng tối thiểu"
    When Go to create product page
    And Upload all image
    And Enter default information
    And Enter "test name" in "Chủng loại giá" field with "_RANDOM_"
    And Click "Lưu" button
    Then User look message "Số lượng tối thiểu là bắt buộc." popup

Create_Product_20: Kiểm tra error message khi không nhập "Giá bán"
    [Tags]    @Test_create_product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra hiển thị thông báo lỗi khi không nhập "Giá bán"
    When Go to create product page
    And Upload all image
    And Enter default information
    And Enter "test name" in "Chủng loại giá" field with "_RANDOM_"
    And Enter "cost" in "Số lượng tối thiểu" field with "_RANDOM_"
    And Click "Lưu" button
    Then User look message "Giá bán là bắt buộc." popup

Create_Product_21: Kiểm tra error message khi không nhập "Chiết khấu cố định"
    [Tags]    @Test_create_product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra hiển thị thông báo lỗi khi không nhập "Chiết khấu cố định"
    When Go to create product page
    And Upload all image
    And Enter default information
    And Enter "Bảng giá dành cho cửa hàng"
    And Click "Lưu" button
    Then User look message "Chiết khấu cố định là bắt buộc." popup

Create_Product_22: Kiểm tra error message khi không nhập "Doanh thu" theo "Chiết khấu linh động theo %"
    [Tags]    @Test_create_product    @Test_by_Hồ_Văn_Nhật
    [Documentation]      Kiểm tra hiển thị thông báo lỗi khi không nhập "Doanh thu" theo "Chiết khấu linh động theo %"
    When Go to create product page
    And Upload all image
    And Enter default information
    And Enter "Bảng giá dành cho cửa hàng"
    And Click checked radio "Chiết khấu linh động"
    And Click "Lưu" button
    Then User look message "Doanh thu là bắt buộc." popup

Create_Product_23: Kiểm tra error message khi không nhập "Chiết khấu theo doanh thu (%)" theo "Chiết khấu linh động theo %"
    [Tags]    @Test_create_product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra hiển thị thông báo lỗi khi không nhập "Chiết khấu theo doanh thu (%)" theo "Chiết khấu linh động theo %"
    When Go to create product page
    And Upload all image
    And Enter default information
    And Enter "Bảng giá dành cho cửa hàng"
    And Click checked radio "Chiết khấu linh động"
    And Enter "cost" in "Doanh thu (VNĐ)" field with "_RANDOM_"
    And Click "Lưu" button
    Then User look message "Chiết khấu theo doanh thu (%) là bắt buộc." popup

Create_Product_24: Kiểm tra error message khi không nhập "Doanh thu" theo "Chiết khấu linh động theo số tiền"
    [Tags]    @Test_create_product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra hiển thị thông báo lỗi khi không nhập "Doanh thu" theo "Chiết khấu linh động theo số tiền"
    When Go to create product page
    And Upload all image
    And Enter default information
    And Enter "Bảng giá dành cho cửa hàng"
    And Click checked radio "Chiết khấu linh động"
    And Click checked radio "Chiết khấu theo số tiền"
    And Click "Lưu" button
    Then User look message "Doanh thu là bắt buộc." popup

Create_Product_25: Kiểm tra error message khi không nhập "Số tiền chiết khấu (VNĐ)" theo "Chiết khấu linh động theo số tiền"
    [Tags]    @Test_create_product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra hiển thị thông báo lỗi khi không nhập "Số tiền chiết khấu (VNĐ)" theo "Chiết khấu linh động theo số tiền"
    When Go to create product page
    And Upload all image
    And Enter default information
    And Enter "Bảng giá dành cho cửa hàng"
    And Click checked radio "Chiết khấu linh động"
    And Click checked radio "Chiết khấu theo số tiền"
    And Enter "cost" in "Doanh thu (VNĐ)" field with "_RANDOM_"
    And Click "Lưu" button
    Then User look message "Số tiền chiết khấu (VNĐ) là bắt buộc." popup

Create_Product_26: Kiểm tra error message khi tạo sản phẩm với "Chủng loại giá" không hợp lệ
    [Tags]    @Test_create_product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra hiển thị thông báo lỗi khi tạo sản phẩm với "Chủng loại giá" không hợp lệ
    When Go to create product page
    And Upload all image
    And Enter default information
    And Enter "test name" in "Chủng loại giá" field with "Create_Product_28: Praesentium iste exercitationem."
    And Enter "cost" in "Số lượng tối thiểu" field with "_RANDOM_"
    And Enter "cost" in "Giá bán (VND)" field with "_RANDOM_"
    And Enter "%" in "Đề nghị chiết khấu cố định" field with "_RANDOM_"
    And Click "Lưu" button
    Then User look message "Thêm sản phẩm thất bại." popup

###================================CREATE PRODUCT SUCCESSFULLY==============================================
Create_Product_27: Kiểm tra tạo mới sản phẩm với "Chiết khấu cố định" thành công
    [Tags]    @Test_create_product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra tạo mới sản phẩm với chiết khấu cố định thành công
    When Go to create product page
    And Upload all image
    And Enter default information
    And Enter "Bảng giá dành cho cửa hàng"
    And Enter "paragraph" in textarea "Mô tả sản phẩm" with "Sản phẩm của Vebo.tv"
    And Enter "%" in "Đề nghị chiết khấu cố định" field with "_RANDOM_"
    And Click "Lưu" button
    Then User look message "Sản phẩm đã được gửi đến quản trị viên để phê duyệt." popup
    And Select product need to delete
    And Click "Xóa sản phẩm" button
    And Click "Đồng ý" button
    Then User look message "Xóa sản phẩm thành công." popup

Create_Product_28: Kiểm tra tạo mới sản phẩm với Chiết khấu linh động - Chiết khấu theo % thành công
    [Tags]    @Test_create_product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra tạo mới sản phẩm với Chiết khấu linh động - Chiết khấu theo % thành công
    When Go to create product page
    And Upload all image
    And Enter default information
    And Enter "Bảng giá dành cho cửa hàng"
    And Enter "paragraph" in textarea "Mô tả sản phẩm" with "Sản phẩm của Vebo.tv"
    And Click checked radio "Chiết khấu linh động"
    And Enter "cost" in "Doanh thu (VNĐ)" field with "_RANDOM_"
    And Enter "%" in "Chiết khấu theo doanh thu (%)" field with "_RANDOM_"
    And Click "Lưu" button
    Then User look message "Sản phẩm đã được gửi đến quản trị viên để phê duyệt." popup
    And Select product need to delete
    And Click "Xóa sản phẩm" button
    And Click "Đồng ý" button
    Then User look message "Xóa sản phẩm thành công." popup

Create_Product_29: Kiểm tra tạo mới sản phẩm với Chiết khấu linh động - Chiết khấu theo số tiền thành công
    [Tags]    @Test_create_product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra tạo mới sản phẩm với Chiết khấu linh động - Chiết khấu theo số tiền thành công
    When Go to create product page
    And Upload all image
    And Enter default information
    And Enter "Bảng giá dành cho cửa hàng"
    And Enter "paragraph" in textarea "Mô tả sản phẩm" with "Sản phẩm của Vebo.tv"
    And Click checked radio "Chiết khấu linh động"
    And Click checked radio "Chiết khấu theo số tiền"
    And Enter "cost" in "Doanh thu (VNĐ)" field with "_RANDOM_"
    And Enter "cost" in "Số tiền chiết khấu (VNĐ)" field with "_RANDOM_"
    And Click "Lưu" button
    Then User look message "Sản phẩm đã được gửi đến quản trị viên để phê duyệt." popup
    And Select product need to delete
    And Click "Xóa sản phẩm" button
    And Click "Đồng ý" button
    Then User look message "Xóa sản phẩm thành công." popup

Create_Product_30: Kiểm tra tạo mới sản phẩm với chiết khấu cố định thành công khi không nhập "Mô tả sản phẩm"
    [Tags]    @Test_create_product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra tạo mới sản phẩm với chiết khấu cố định thành công khi không nhập "Mô tả sản phẩm"
    When Go to create product page
    And Upload all image
    And Enter default information
    And Enter "Bảng giá dành cho cửa hàng"
    And Enter "%" in "Đề nghị chiết khấu cố định" field with "_RANDOM_"
    And Click "Lưu" button
    Then User look message "Sản phẩm đã được gửi đến quản trị viên để phê duyệt." popup
    And Select product need to delete
    And Click "Xóa sản phẩm" button
    And Click "Đồng ý" button
    Then User look message "Xóa sản phẩm thành công." popup

Create_Product_31: Kiểm tra tạo mới sản phẩm với Chiết khấu linh động - Chiết khấu theo % thành công khi không nhập "Mô tả sản phẩm"
    [Tags]    @Test_create_product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra tạo mới sản phẩm với Chiết khấu linh động - Chiết khấu theo % thành công khi không nhập "Mô tả sản phẩm"
    When Go to create product page
    And Upload all image
    And Enter default information
    And Enter "Bảng giá dành cho cửa hàng"
    And Click checked radio "Chiết khấu linh động"
    And Enter "cost" in "Doanh thu (VNĐ)" field with "_RANDOM_"
    And Enter "%" in "Chiết khấu theo doanh thu (%)" field with "_RANDOM_"
    And Click "Lưu" button
    Then User look message "Sản phẩm đã được gửi đến quản trị viên để phê duyệt." popup
    And Select product need to delete
    And Click "Xóa sản phẩm" button
    And Click "Đồng ý" button
    Then User look message "Xóa sản phẩm thành công." popup

Create_Product_32: Kiểm tra tạo mới sản phẩm với Chiết khấu linh động - Chiết khấu theo số tiền thành công khi không nhập "Mô tả sản phẩm"
    [Tags]    @Test_create_product    @Test_by_Hồ_Văn_Nhật
    [Documentation]    Kiểm tra tạo mới sản phẩm với Chiết khấu linh động - Chiết khấu theo số tiền thành công khi không nhập "Mô tả sản phẩm"
    When Go to create product page
    And Upload all image
    And Enter default information
    And Enter "Bảng giá dành cho cửa hàng"
    And Click checked radio "Chiết khấu linh động"
    And Click checked radio "Chiết khấu theo số tiền"
    And Enter "cost" in "Doanh thu (VNĐ)" field with "_RANDOM_"
    And Enter "cost" in "Số tiền chiết khấu (VNĐ)" field with "_RANDOM_"
    And Click "Lưu" button
    Then User look message "Sản phẩm đã được gửi đến quản trị viên để phê duyệt." popup
    And Select product need to delete
    And Click "Xóa sản phẩm" button
    And Click "Đồng ý" button
    Then User look message "Xóa sản phẩm thành công." popup

###=====================================VIEW LIST OF PRODUCT=====================================================
Create_Product_33: Kiểm tra hiển thị thành công danh sách tất cả sản phẩm
    [Tags]    @Test_create_product    @Test_by_Hồ_Văn_Nhật
    [Documentation]       Kiểm tra hiển thị thành công danh sách tất cả sản phẩm
    When Go to list product page
    And Filter product in "Trạng thái" with "Tất cả"
    Then Show list of "Products"

Create_Product_34: Kiểm tra hiển thị thành công danh sách sản phẩm "Đang bán"
    [Tags]    @Test_create_product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra hiển thị thành công danh sách sản phẩm "Đang bán"
    When Go to list product page
    And Filter product in "Trạng thái" with "Đang bán"
    Then Show list of "Products"

Create_Product_35: Kiểm tra hiển thị thành công danh sách sản phẩm "Chờ xác nhận"
    [Tags]    @Test_create_product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra hiển thị thành công danh sách sản phẩm "Chờ xác nhận"
    When Go to list product page
    And Filter product in "Trạng thái" with "Chờ xác nhận"
    Then Show list of "Products"

Create_Product_36: Kiểm tra hiển thị thành công danh sách sản phẩm bị "Từ chối"
    [Tags]    @Test_create_product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra hiển thị thành công danh sách sản phẩm bị "Từ chối"
    When Go to list product page
    And Filter product in "Trạng thái" with "Từ chối"
    Then Show list of "Products"

Create_Product_37: Kiểm tra hiển thị thành công danh sách sản phẩm "Hết hàng"
    [Tags]    @Test_create_product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra hiển thị thành công danh sách sản phẩm "Hết hàng"
    When Go to list product page
    And Filter product in "Trạng thái" with "Hết hàng"
    Then Show list of "Products"

Create_Product_38: Kiểm tra hiển thị thành công danh sách sản phẩm "Ngừng bán"
    [Tags]    @Test_create_product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra hiển thị thành công danh sách sản phẩm "Ngừng bán"
    When Go to list product page
    And Filter product in "Trạng thái" with "Ngừng bán"
    Then Show list of "Products"

Create_Product_39: Kiểm tra hiển thị thành công danh sách sản phẩm "Đã hủy"
    [Tags]    @Test_create_product    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra hiển thị thành công danh sách sản phẩm "Đã hủy"
    When Go to list product page
    And Filter product in "Trạng thái" with "Đã hủy"
    Then Show list of "Products"

Create_Product_40: Kiểm tra hiển thị thành công danh sách sản phẩm theo "Danh mục chính"
    [Tags]    @Test_create_product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra hiển thị thành công danh sách sản phẩm theo "Danh mục chính"
    When Go to list product page
    And Filter product in "Trạng thái" with "Tất cả"
    And Filter product in "Danh mục chính" with "Shopee"
    Then Show list of "Products"

Create_Product_41: Kiểm tra hiển thị thành công danh sách sản phẩm theo "Danh mục cấp 1"
    [Tags]    @Test_create_product    @Test_by_Hồ_Văn_Nhật
    [Documentation]       Kiểm tra hiển thị thành công danh sách sản phẩm theo "Danh mục cấp 1"
    When Go to list product page
    And Filter product in "Trạng thái" with "Tất cả"
    And Filter product in "Danh mục chính" with "Shopee"
    And Filter product in "Danh mục cấp 1" with "Consumer Electronics"
    Then Show list of "Products"

Create_Product_42: Kiểm tra hiển thị thành công danh sách sản phẩm theo "Danh mục cấp 2"
    [Tags]    @Test_create_product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra hiển thị thành công danh sách sản phẩm theo "Danh mục cấp 2"
    When Go to list product page
    And Filter product in "Trạng thái" with "Tất cả"
    And Filter product in "Danh mục chính" with "Shopee"
    And Filter product in "Danh mục cấp 1" with "Consumer Electronics"
    And Filter product in "Danh mục cấp 2" with "Tivi Box"
    Then Show list of "Products"

Create_Product_43: Kiểm tra có thể xem danh sách sản phẩm trang kế tiếp, trước trước, trang cuối cùng, trang đầu tiên
    [Tags]    @Test_create_product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra có thể xem danh sách sản phẩm trang kế tiếp, trước trước, trang cuối cùng, trang đầu tiên
    When Go to list product page
    And Click ">" to "next_page" page
    Then Show list of "Products"
    And Click "<" to "previous_page" page
    Then Show list of "Products"
    And Click ">>" to "next_all" page
    Then Show list of "Products"
    And Click "<<" to "prev_all" page
    Then Show list of "Products"

###=================================EDIT PRODUCT==============================================================
Edit_Product_01: Kiểm tra có thể điều hướng đến trang chỉnh sửa sản phẩm thành công
    [Tags]    @Test_edit_product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     iểm tra có thể điều hướng đến trang chỉnh sửa sản phẩm thành công
    When Click "Quản lý hàng hóa" menu
    And Click "Sản phẩm" sub menu
    And Select Product need to edit
    And Click "Chỉnh sửa thông tin" button
    Then User look title "Quản Lý Hàng Hóa"
    And User look contains title is "Chỉnh sửa sản phẩm"

###============================VERIFY VALIDATION TEXT=================================================================
Edit_Product_02: Kiểm tra Validation Text khi không bỏ trống trường "Tên sản phẩm"
  [Tags]    @Test_edit_product    @Test_by_Hồ_Văn_Nhật
  [Documentation]     Kiểm tra Validation Text khi không bỏ trống trường "Tên sản phẩm"
  When Go to edit product page
  And Enter "text" in "Tên sản phẩm" with "${EMPTY}"
  And Click in "Thương hiệu" field
  Then Required message "Tên sản phẩm" displayed under "Đây là trường bắt buộc!" field

Edit_Product_03: Kiểm tra Validation Text khi không bỏ trống trường "Xuất xứ"
    [Tags]    @Test_edit_product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text khi không bỏ trống trường "Xuất xứ"
    When Go to edit product page
    And Enter "text" in "Xuất xứ" with "${EMPTY}"
    And Click in "Thương hiệu" field
    Then Required message "Xuất xứ" displayed under "Đây là trường bắt buộc!" field

Edit_Product_04: Kiểm tra Validation Text khi không bỏ trống trường "Thuế nhập"
    [Tags]    @Test_edit_product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text khi không bỏ trống trường "Thuế nhập"
    When Go to edit product page
    And Delete text in "Thuế nhập" field
    Then Required message "Thuế nhập" displayed under "Đây là trường bắt buộc!" field

Edit_Product_05: Kiểm tra Validation Text khi không bỏ trống trường "Thuế bán"
    [Tags]    @Test_edit_product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text khi không bỏ trống trường "Thuế bán"
    When Go to edit product page
    And Delete text in "Thuế bán" field
    Then Required message "Thuế bán" displayed under "Đây là trường bắt buộc!" field

Edit_Product_06: Kiểm tra Validation Text khi không bỏ trống trường "Đơn vị cơ bản"
    [Tags]    @Test_edit_product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text khi không bỏ trống trường "Đơn vị cơ bản"
    When Go to edit product page
    And Enter "text" in "Đơn vị cơ bản" with "${EMPTY}"
    And Click in "Thương hiệu" field
    Then Required message "Đơn vị cơ bản" displayed under "Đây là trường bắt buộc!" field

Edit_Product_07: Kiểm tra Validation Text khi nhập "Mã vạch" không hợp lệ và lớn hơn 13 ký tự
    [Tags]    @Test_edit_product    @Test_by_Hồ_Văn_Nhật
    [Documentation]       Kiểm tra Validation Text khi nhập "Mã vạch" không hợp lệ và lớn hơn 13 ký tự
    When Go to edit product page
    And Enter "text" in "Mã vạch" with "_RANDOM_"
    And Click in "Thương hiệu" field
    Then Required message "Mã vạch" field displayed under "Vui lòng nhập chỉ nhập số!"
    And Required message "Mã vạch" field displayed under "Vui lòng nhập tối đa 13 ký tự."

Edit_Product_08: Kiểm tra Validation Text khi nhập "Mã vạch" không hợp lệ và nhỏ hơn 13 ký tự
    [Tags]    @Test_edit_product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text khi nhập "Mã vạch" không hợp lệ và nhỏ hơn 13 ký tự
    When Go to edit product page
    And Enter "fullname" in "Mã vạch" with "hovannhat"
    And Click in "Thương hiệu" field
    Then Required message "Mã vạch" displayed under "Vui lòng nhập chỉ nhập số!" field

Edit_Product_09: Kiểm tra Validation Text khi nhập "Mã vạch" lớn hơn 13 ký tự số
    [Tags]    @Test_edit_product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text khi nhập "Mã vạch" lớn hơn 13 ký tự số
    When Go to edit product page
    And Enter "Barcode_invalid" in "Mã vạch" with "_RANDOM_"
    And Click in "Thương hiệu" field
    Then Required message "Mã vạch" displayed under "Vui lòng nhập tối đa 13 ký tự." field

Edit_Product_10: Kiểm tra Validation Text khi nhập "Mô tả sản phẩm" quá 2000 ký tự
    [Tags]    @Test_edit_product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text khi nhập "Mô tả sản phẩm" quá 2000 ký tự
    When Go to edit product page
    And Enter "2000 word" in textarea "Mô tả sản phẩm" with "_RANDOM_"
    And Click in "Thương hiệu" field
    Then Required message "Mô tả sản phẩm" displayed under "Chỉ được nhập tối đa 2000 ký tự!" field

Edit_Product_11: Kiểm tra Validation Text khi bỏ trống Trạng thái sản phẩm
    [Tags]    @Test_edit_product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text khi bỏ trống Trạng thái sản phẩm
    When Go to edit product page
    And Delete text in "Trạng thái sản phẩm" field
    Then Required message "Trạng thái sản phẩm" displayed under "Đây là trường bắt buộc!" field

###================================ERROR MESSAGE WITH "THÊM GIÁ" BUTTON================================================================##
Edit_Product_12: Kiểm tra error message khi không nhập "Số lượng tối thiểu"
    [Tags]    @Test_edit_product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra hiển thị thông báo lỗi khi không nhập "Số lượng tối thiểu"
    When Go to edit product page
    And Enter "number" in "Số lượng tối thiểu" field with "${empty}"
    And Click "Thêm giá" button
    Then User look message "Số lượng tối thiểu phải lớn hơn số lượng vừa tạo" popup

Edit_Product_13: Kiểm tra error message khi nhập "Số lượng tối thiểu" bằng 0
    [Tags]    @Test_edit_product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra hiển thị thông báo lỗi khi nhập "Số lượng tối thiểu" bằng 0
    When Go to edit product page
    And Enter "number" in "Số lượng tối thiểu" field with "0"
    And Click "Thêm giá" button
    Then User look message "Vui lòng nhập số lượng tối thiểu lớn hơn 0" popup

Edit_Product_14: Kiểm tra error message khi nhập "Số lượng tối thiểu" nhỏ hơn "Số lượng tối thiểu" vừa tạo
    [Tags]    @Test_edit_product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra hiển thị thông báo lỗi khi nhập "Số lượng tối thiểu" nhỏ hơn "Số lượng tối thiểu" vừa tạo
    When Go to edit product page
    And Enter "number" in "Số lượng tối thiểu" field with "10"
    And Click "Thêm giá" button
    And Enter "number" in "Thêm số lượng tối thiểu" field with "1"
    And Click "Thêm giá" button
    Then User look message "Số lượng tối thiểu phải lớn hơn số lượng vừa tạo" popup

###==============================ERROR MESSAGE WITH "LƯU" BUTTON==================================================
Edit_Product_15: Kiểm tra error message khi chỉnh sửa ảnh sản phẩm sai định dạng hình ảnh
    [Tags]    @Test_edit_product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra hiển thị thông báo lỗi khi chỉnh sửa ảnh sản phẩm sai định dạng hình ảnh
    When Go to edit product page
    And Delete the main product image
    And Upload file in "Ảnh sản phẩm chính" with "sản phẩm non-balance.xlsx"
    Then User look message "Định dạng file không hợp lệ. Vui lòng chỉ tải lên file ảnh có định dạng jpg/jpeg/png." popup

Edit_Product_16: Kiểm tra error message khi sản phẩm không có hình ảnh nào
    [Tags]    @Test_edit_product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra hiển thị thông báo lỗi khi sản phẩm không có hình ảnh nào
    When Go to edit product page
    And Delete all product image
    And Click "Lưu" button
    Then User look message "Hình ảnh không được để trống." popup

Edit_Product_17: Kiểm tra error message khi sản phẩm không có hình ảnh chính
    [Tags]    @Test_edit_product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra hiển thị thông báo lỗi khi sản phẩm không có hình ảnh chính
    When Go to edit product page
    And Delete the main product image
    And Click "Lưu" button
    Then User look message "Sản phẩm phải có hình ảnh chính." popup

Edit_Product_18: Kiểm tra error message khi không nhập chủng loại giá
    [Tags]    @Test_edit_product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra hiển thị thông báo lỗi khi không nhập chủng loại giá
    When Go to edit product page
    And Enter "text" in "Chủng loại giá" field with "${EMPTY}"
    And Click "Lưu" button
    Then User look message "Chủng loại giá là bắt buộc." popup

Edit_Product_19: Kiểm tra error message khi không nhập số lượng tối thiểu
    [Tags]    @Test_edit_product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra hiển thị thông báo lỗi khi không nhập số lượng tối thiểu
    When Go to edit product page
    And Enter "number" in "Số lượng tối thiểu" field with "${EMPTY}"
    And Click "Lưu" button
    Then User look message "Số lượng tối thiểu là bắt buộc." popup

Edit_Product_20: Kiểm tra error message khi không nhập giá bán
    [Tags]    @Test_edit_product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra hiển thị thông báo lỗi khi không nhập giá bán
    When Go to edit product page
    And Enter "number" in "Giá bán (VND)" field with "${EMPTY}"
    And Click "Lưu" button
    Then User look message "Giá bán là bắt buộc." popup

Edit_Product_21: Kiểm tra error message khi không nhập "Chiết khấu cố định"
    [Tags]    @Test_edit_product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra hiển thị thông báo lỗi khi không nhập Chiết khấu cố định
    When Go to edit product page
    And Click checked radio "Chiết khấu cố định"
    And Enter "%" in "Đề nghị chiết khấu cố định" field with "${EMPTY}"
    And Click "Lưu" button
    Then User look message "Chiết khấu cố định là bắt buộc." popup

Edit_Product_22: Kiểm tra error message khi không nhập "Doanh thu" - Chiết khấu linh động theo %
    [Tags]    @Test_edit_product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra hiển thị thông báo lỗi khi không nhập "Doanh thu" - Chiết khấu linh động theo %
    When Go to edit product page
    And Click checked radio "Chiết khấu linh động"
    And Click "Lưu" button
    Then User look message "Doanh thu là bắt buộc." popup

Edit_Product_23: Kiểm tra error message khi không nhập "Chiết khấu theo doanh thu (%)" - Chiết khấu linh động theo %
    [Tags]    @Test_edit_product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra hiển thị thông báo lỗi khi không nhập "Chiết khấu theo doanh thu (%)" - Chiết khấu linh động theo %
    When Go to edit product page
    And Click checked radio "Chiết khấu linh động"
    And Enter "cost" in "Doanh thu (VNĐ)" field with "_RANDOM_"
    And Click "Lưu" button
    Then User look message "Chiết khấu theo doanh thu (%) là bắt buộc." popup

Edit_Product_24: Kiểm tra error message khi không nhập "Doanh thu" - Chiết khấu linh động theo số tiền
    [Tags]    @Test_edit_product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra hiển thị thông báo lỗi khi không nhập "Doanh thu" - Chiết khấu linh động theo số tiền
    When Go to edit product page
    And Click checked radio "Chiết khấu linh động"
    And Click checked radio "Chiết khấu theo số tiền"
    And Click "Lưu" button
    Then User look message "Doanh thu là bắt buộc." popup

Edit_Product_25: Kiểm tra error message khi không nhập "Số tiền chiết khấu (VNĐ)" - Chiết khấu linh động theo số tiền
    [Tags]    @Test_edit_product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra hiển thị thông báo lỗi khi không nhập "Số tiền chiết khấu (VNĐ)" - Chiết khấu linh động theo số tiền
    When Go to edit product page
    And Click checked radio "Chiết khấu linh động"
    And Click checked radio "Chiết khấu theo số tiền"
    And Enter "cost" in "Doanh thu (VNĐ)" field with "_RANDOM_"
    And Click "Lưu" button
    Then User look message "Số tiền chiết khấu (VNĐ) là bắt buộc." popup

Edit_Product_26: Kiểm tra error message khi nhập "Chủng loại giá" không hợp lệ
    [Tags]    @Test_edit_product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra hiển thị thông báo lỗi khi nhập "Chủng loại giá" không hợp lệ
    When Go to edit product page
    And Enter "text" in "Chủng loại giá" field with "Create_Product_28: Praesentium iste exercitationem."
    And Click "Lưu" button
    Then User look message "Chỉnh sửa sản phẩm thất bại" popup

Edit_Product_27: Kiểm tra error message khi thay đổi "Trạng thái sản phẩm" đang bán thành ngưng bán
    [Tags]    @Test_edit_product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra hiển thị thông báo lỗi khi thay đổi "Trạng thái sản phẩm" đang bán thành ngưng bán
    When Go to list product page
    And Select invalid Product need to change status
    And Change status product with "Ngưng bán"
    And Click "Lưu" button
    Then User look message "Sản phẩm bị trùng mã sản phẩm hoặc mã vạch đã có sẵn trên hệ thống." popup

###================================EDIT PRODUCT SUCCESSFULLY==============================================
Edit_Product_28: Kiểm tra chỉnh sửa sản phẩm thành công khi thay đổi thông tin mặc định
    [Tags]    @Test_edit_product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra chỉnh sửa sản phẩm thành công khi thay đổi thông tin mặc định
    When Go to edit product page
    And Delete text in "Thuế nhập" field
    And Delete text in "Thuế bán" field
    And Enter default information
    And Click "Lưu" button
    Then User look message "Sản phẩm được gửi đến quản trị viên để phê duyệt" popup

Edit_Product_29: Kiểm tra chỉnh sửa sản phẩm thành công khi thay đổi thông tin "Giá bán dành cho cửa hàng"
    [Tags]    @Test_edit_product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra chỉnh sửa sản phẩm thành công khi thay đổi thông tin "Giá bán dành cho cửa hàng"
    When Go to edit product page
    And Enter "Bảng giá dành cho cửa hàng"
    And Click "Lưu" button
    Then User look message "Sản phẩm được gửi đến quản trị viên để phê duyệt" popup

Edit_Product_30: Kiểm tra chỉnh sửa sản phẩm thành công khi thay đổi "Chiết khấu linh động - Chiết khấu theo %"
    [Tags]    @Test_edit_product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra chỉnh sửa sản phẩm thành công khi thay đổi "Chiết khấu linh động - Chiết khấu theo %"
    When Go to edit product page
    And Click checked radio "Chiết khấu linh động"
    And Enter "cost" in "Doanh thu (VNĐ)" field with "_RANDOM_"
    And Enter "%" in "Chiết khấu theo doanh thu (%)" field with "_RANDOM_"
    And Click "Lưu" button
    Then User look message "Sản phẩm được gửi đến quản trị viên để phê duyệt" popup

Edit_Product_31: Kiểm tra chỉnh sửa sản phẩm thành công khi thay đổi "Chiết khấu linh động - Chiết khấu theo số tiền"
    [Tags]    @Test_edit_product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra chỉnh sửa sản phẩm thành công khi thay đổi "Chiết khấu linh động - Chiết khấu theo số tiền"
    When Go to edit product page
    And Click checked radio "Chiết khấu linh động"
    And Click checked radio "Chiết khấu theo số tiền"
    And Enter "cost" in "Doanh thu (VNĐ)" field with "_RANDOM_"
    And Enter "cost" in "Số tiền chiết khấu (VNĐ)" field with "_RANDOM_"
    And Click "Lưu" button
    Then User look message "Sản phẩm được gửi đến quản trị viên để phê duyệt" popup

Edit_Product_32: Kiểm tra chỉnh sửa sản phẩm thành công khi thay đổi "Chiết khấu cố định"
    [Tags]    @Test_edit_product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra chỉnh sửa sản phẩm thành công khi thay đổi "Chiết khấu cố định"
    When Go to edit product page
    And Click checked radio "Chiết khấu cố định"
    And Enter "%" in "Đề nghị chiết khấu cố định" field with "_RANDOM_"
    And Click "Lưu" button
    Then User look message "Sản phẩm được gửi đến quản trị viên để phê duyệt" popup

Edit_Product_33: Kiểm tra chỉnh sửa sản phẩm thành công khi thay đổi "Mô tả sản phẩm"
    [Tags]    @Test_edit_product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra chỉnh sửa sản phẩm thành công khi thay đổi "Mô tả sản phẩm"
    When Go to edit product page
    And Enter "paragraph" in textarea "Mô tả sản phẩm" with "_RANDOM_"
    And Click "Lưu" button
    Then User look message "Chỉnh sửa sản phẩm thành công" popup

Edit_Product_34: Kiểm tra chỉnh sửa sản phẩm thành công khi thay đổi "Danh mục sản phẩm"
    [Tags]    @Test_edit_product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra chỉnh sửa sản phẩm thành công khi thay đổi "Danh mục sản phẩm"
    When Go to edit product page
    And Click icon edit when change category
    And Change category
    And Click "Lưu" button
    Then User look message "Sản phẩm được gửi đến quản trị viên để phê duyệt" popup

Edit_Product_35: Kiểm tra chỉnh sửa sản phẩm thành công khi thay đổi "Ảnh sản phẩm"
    [Tags]    @Test_edit_product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra chỉnh sửa sản phẩm thành công khi thay đổi "Ảnh sản phẩm"
    When Go to edit product page
    And Delete all product image
    And Upload all image
    And Click "Lưu" button
    Then User look message "Sản phẩm được gửi đến quản trị viên để phê duyệt" popup

Edit_Product_36: Kiểm tra chỉnh sửa sản phẩm thành công khi thay đổi "Trạng thái sản phẩm" đang bán thành "Ngưng bán"
    [Tags]    @Test_edit_product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra chỉnh sửa sản phẩm thành công khi thay đổi "Trạng thái sản phẩm" đang bán thành "Ngưng bán"
    When Go to list product page
      And Select valid Product need to change status
    And Change status product with "Ngưng bán"
    And Click "Lưu" button
    Then User look message "Chỉnh sửa sản phẩm thành công" popup

####============================================BACK TO LIST PRODUCT PAGE =====================================================
Edit_Product_37: Kiểm tra có thể điều hướng đến trang quản lý sản phẩm thành công từ trang tạo mới sản phẩm
    [Tags]    @Test_edit_product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra có thể điều hướng đến trang quản lý sản phẩm thành công từ trang tạo mới sản phẩm
    When Go to create product page
    And Click "Trở về" button
    And Click "Trở về" button
    And Click "Trở về" button
    Then User look title "Quản Lý Hàng Hóa"
    And User look contains title is "Quản lý sản phẩm"

Edit_Product_38: Kiểm tra điều hướng đến trang danh sách sản phẩm từ trang chỉnh sửa sản phẩm
    [Tags]    @Test_edit_product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra điều hướng đến trang danh sách sản phẩm từ trang chỉnh sửa sản phẩm
    When Go to edit product page
    And Click "Trở về" button
    Then User look title "Quản Lý Hàng Hóa"
    And User look contains title is "Quản lý sản phẩm"

Edit_Product_39: Kiểm tra điều hướng đến trang danh sách sản phẩm từ trang thông tin sản phẩm khi nhấn nút "Trở về"
    [Tags]    @Test_edit_product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra điều hướng đến trang danh sách sản phẩm từ trang thông tin sản phẩm khi nhấn nút "Trở về"
    When Go to detail information product page
    And Click "Trở về" button
    Then User look title "Quản Lý Hàng Hóa"
    And User look contains title is "Quản lý sản phẩm"

Edit_Product_40: Kiểm tra điều hướng đến trang danh sách sản phẩm từ trang thông tin sản phẩm khi nhấn nút "←"
    [Tags]    @Test_edit_product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra điều hướng đến trang danh sách sản phẩm từ trang thông tin sản phẩm khi nhấn nút "←"
    When Go to detail information product page
    And Click "←" button
    Then User look title "Quản Lý Hàng Hóa"
    And User look contains title is "Quản lý sản phẩm"

###=======================================NAVIGATE TO DETAIL INFORMATION PRODUCT PAGE===============================================================
Edit_Product_41: Kiểm tra điều hướng đến trang thông tin chi tiết sản phẩm thành công
    [Tags]    @Test_edit_product    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra điều hướng đến trang thông tin chi tiết sản phẩm thành công
    When Go to list product page
    And Select Product need to edit
    Then User look title "Quản Lý Hàng Hóa"
    And User look contains title is "Sản phẩm"

*** Keywords ***
Preconditions
  Set Browser Timeout         ${BROWSER_TIMEOUT}
  New Browser                 ${BROWSER}  headless=${HEADLESS}
  New Page                    ${URL_DEFAULT}
  ${STATE}                    Evaluate  json.loads('''{}''')  json
  Login to Supplier

Go to detail information product page
  When Click "Quản lý hàng hóa" menu
  And Click "Sản phẩm" sub menu
  And Select Product need to edit

Go to ${name} product page
  When Click "Quản lý hàng hóa" menu
  And Click "Sản phẩm" sub menu
  IF  '${name}' == 'create'
      And Click "Thêm sản phẩm" button
      And Select category in "Danh mục chính" with "Thời trang nữ"
      And Select category in "Danh mục cấp 1" with "Váy"
      And Click "Tiếp theo" button
  ELSE IF  '${name}' == 'edit'
      And Select Product need to ${name}
      And Click "Chỉnh sửa thông tin" button
  END

Get Categoty By Name
    [Arguments]               ${name}                           ${xpath}=${EMPTY}
    [Return]            xpath=//h1[contains(text(),'${name}')]/..${xpath}

Change category
  And Select category in "Danh mục chính" with "Thể thao"
  And Select category in "Danh mục cấp 1" with "Bóng đá"
  And Select category in "Danh mục cấp 2" with "Áo đấu"
  And Click "Tiếp theo" button

Select category in "${name}" with "${text}"
  ${element}       Get Categoty By Name       ${name}         //div[contains(text(),'${text}')]
  Wait Until Element Is Visible     ${element}
  Click     ${element}

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
  IF  '${name}' == 'Chủng loại giá'
    ${placeholder}=     Set Variable    Nhập loại giá
  ELSE IF  '${name}' != 'Chủng loại giá'
    ${placeholder}=     Set Variable    Nhập giá trị
  END
  IF  '${name}' == 'Chủng loại giá' or '${name}' == 'Số lượng tối thiểu'
    ${elements}=           Get Elements      //tbody/tr[2]//td//input[@placeholder="${placeholder}"]
    ${element}=            Set Variable          ${elements}[0]
  ELSE IF  '${name}' == 'Giá bán (VND)'
    ${elements}=           Get Elements      //tbody/tr[2]//td//input[@placeholder="${placeholder}"]
    ${element}=            Set Variable          ${elements}[1]
  ELSE IF  '${name}' == 'Thêm số lượng tối thiểu'
    ${elements}=           Get Elements      //tbody/tr[3]//td//input[@placeholder="${placeholder}"]
    ${element}=            Set Variable          ${elements}[0]
  ELSE IF  '${name}' == 'Thêm Giá bán (VND)'
    ${elements}=           Get Elements      //tbody/tr[3]//td//input[@placeholder="${placeholder}"]
    ${element}=            Set Variable          ${elements}[1]
  ELSE IF  '${name}' == 'Đề nghị chiết khấu cố định'
    ${element}=            Set Variable          //span[contains(text(),'${name}')]/..//input[contains(@class, "ant-input")]
  ELSE IF  '${name}' == 'Doanh thu (VNĐ)'
    ${elements}=           Get Elements      //tbody/tr[2]//td//input[@placeholder="${placeholder}"]
    ${element}=            Set Variable          ${elements}[2]
  ELSE IF  '${name}' == 'Chiết khấu theo doanh thu (%)' or '${name}' == 'Số tiền chiết khấu (VNĐ)'
    ${elements}=           Get Elements      //tbody/tr[2]//td//input[@placeholder="${placeholder}"]
    ${element}=            Set Variable          ${elements}[3]
  END
  Clear Text                ${element}
  Fill Text                 ${element}                      ${text}                       True

Enter default information
  And Enter "test name" in "Tên sản phẩm" with "_RANDOM_"
  And Enter "test name" in "Thương hiệu" with "_RANDOM_"
  And Enter "test name" in "Xuất xứ" with "_RANDOM_"
  And Enter "Barcode_valid" in "Mã vạch" with "_RANDOM_"
  And Click select "Thuế nhập" with "Thuế môi trường - 10%"
  And Click select "Thuế bán" with "Thuế môi trường - 10%"
  And Enter "cost" in "Theo tháng" with "_RANDOM_"
  And Enter "cost" in "Theo quý" with "_RANDOM_"
  And Enter "cost" in "Theo năm" with "_RANDOM_"
  And Enter "test name" in "Thị trường xuất khẩu" with "_RANDOM_"
  And Enter "test name" in "Đơn vị cơ bản" with "_RANDOM_"

Enter "Bảng giá dành cho cửa hàng"
  And Enter "fullname" in "Chủng loại giá" field with "Giá bán lẻ"
  And Enter "%" in "Số lượng tối thiểu" field with "_RANDOM_"
  And Enter "cost" in "Giá bán (VND)" field with "_RANDOM_"

Click checked radio "${name}"
  Click     //span[contains(text(),'${name}')]

Select Product need to ${name}
    IF  '${name}' == 'edit'
      And Filter product in "Trạng thái" with "Chờ xác nhận"
      ${element}    Get Element   //td[contains(text(),'PRD5051')]
      Wait Until Element Is Visible     ${element}
      Click         ${element}        left        2
    ELSE IF  '${name}' != 'edit'
      Wait Until Element Is Visible       //tbody/tr[1]/td[1]
      Click         //tbody/tr[1]/td[1]        left        2
    END

Select ${name} Product need to change status
    And Filter product in "Trạng thái" with "Đang bán"
    IF  '${name}' == 'invalid'
        ${element}    Get Element   //td[contains(text(),'PRD4863')]
    ELSE IF  '${name}' == 'valid'
        ${element}    Get Element   //td[contains(text(),'PRD4878')]
    END
    Wait Until Element Is Visible     ${element}
    Click         ${element}        left        2
    And Click "Chỉnh sửa thông tin" button

Increase the number of products displayed with "${number}"
  ${element}=       Set Variable      //span[@class="ant-select-selection-item" and @title="10"]
  Wait Until Element Is Visible       ${element}
  Click       ${element}
  ${element}=       Get Element       //*[contains(@class, "ant-select-item-option-content") and text()='${number}']
  Click       ${element}
  Wait Until Element Spin
  Sleep   ${SHOULD_TIMEOUT}

Filter product in "${name}" with "${text}"
  IF  '${name}' == 'Trạng thái'
    Click             //span[contains(text(),'Đang bán')]
    ${element}         Set Variable       //*[contains(@class, "ant-select-item-option-content") and text()='${text}']
  ELSE IF  '${name}' == 'Danh mục chính'
    ${elements}        Get Element     //input[@class='ant-select-selection-search-input' and @id='rc_select_1']
    Wait Until Element Is Visible     ${elements}
    Clear Text                        ${elements}
    Fill Text                         ${elements}           ${text}       True
    ${element}         Set Variable      //div[contains(text(),'${text}')]
  ELSE IF  '${name}' == 'Danh mục cấp 1'
    ${elements}        Get Element     //input[@class='ant-select-selection-search-input' and @id='rc_select_2']
    Wait Until Element Is Visible     ${elements}
    Clear Text                        ${elements}
    Fill Text                         ${elements}           ${text}       True
    ${element}         Set Variable      //div[contains(text(),'${text}')]
  ELSE IF  '${name}' == 'Danh mục cấp 2'
    ${elements}        Get Element     //input[@class='ant-select-selection-search-input' and @id='rc_select_3']
    Wait Until Element Is Visible     ${elements}
    Clear Text                        ${elements}
    Fill Text                         ${elements}           ${text}         True
    ${element}         Set Variable      //div[contains(text(),'${text}')]
  END
  Wait Until Element Is Visible       ${element}
  Click             ${element}

Click select in "${name}" field
  ${element}=               Get Element Form Item By Name     ${name}          //*[contains(@class, "ant-select-show-arrow")]
  Wait Until Element Is Visible    ${element}
  Click                            ${element}

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

Change status product with "${status}"
    ${element}          Get Elements          //*[contains(@class, "ant-select-selection-search-input")]
    Clear Text          ${element}[0]
    Fill Text           ${element}[0]         ${status}       True
    ${element}         Set Variable       //*[contains(@class, "ant-select-item-option-content") and text()='${status}']
    Wait Until Element Is Visible         ${element}
    Click           ${element}

Show list of "Products"
    Wait Until Element Spin
    ${elements}=        Get Elements        xpath=//*[contains(@class, "ant-table-row")]
    Run Keyword If    ${elements}     Display     ${elements}
    ...    ELSE    Log To Console     Không tồn tại sản phẩm nào!
Display
    [Arguments]    ${name}    ${elements}
    Log To Console      *************************-DANH SÁCH SẢN PHẨM BALANCE-**************************
    Wait Until Element Is Visible         ${elements}[0]
    ${count}=           Set Variable        1
    ${stt}=             Set Variable        1
    FOR  ${i}  IN  @{elements}
        ${Mã sản phẩm}              Get Text            //tbody/tr[${count}]/td[1]
        ${Mã vạch}                  Get Text            //tbody/tr[${count}]/td[2]
        ${Tên sản phẩm}             Get Text            //tbody/tr[${count}]/td[3]
        ${Danh mục}                 Get Text            //tbody/tr[${count}]/td[4]
        ${Giá bán lẻ}               Get Text            //tbody/tr[${count}]/td[5]
        ${Trạng thái}               Get Text            //tbody/tr[${count}]/td[6]
        Log To Console    ${stt}. Mã sản phẩm: ${Mã sản phẩm} | Mã vạch: ${Mã vạch} | Tên sản phẩm: ${Tên sản phẩm} | Danh mục: ${Danh mục} | Giá bán lẻ của NCC: ${Giá bán lẻ} | Trạng thái: ${Trạng thái}        Log To Console    ================================================================================================================================================================================
        Log To Console    =================================================================================================================================================================================
        ${count}=    Evaluate    ${count} + 1
        ${stt}=    Evaluate    ${stt} + 1
    END
    ${total}=    Evaluate    ${count} - 1
    Log To Console    Tổng số lượng sản phẩm balance là: ${total}
