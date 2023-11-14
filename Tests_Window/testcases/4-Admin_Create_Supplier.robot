*** Settings ***
Resource            ../keywords/common.robot

Test Setup          Preconditions
Test Teardown       Tear Down

*** Test Cases ***

## ============================================NAVIGATE CREATE SUPPLIER PAGE=====================================================
Create_Supplier_01: Kiểm tra có thể điều hướng đến trang tạo mới nhà cung cấp
    [Tags]    @Test_create_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra có thể điều hướng đến trang tạo mới nhà cung cấp
    And Click "Quản lý nhà cung cấp" menu
    And Click "Thêm nhà cung cấp" button
    Then User look title "Quản Lý Nhà Cung Cấp"
    And User look contains title is "Thêm nhà cung cấp"

#=========================VALIDATION TEXT========================================================
Create_Supplier_02: Kiểm tra Validation Text khi không nhập thông tin nào cả
    [Tags]    @Test_create_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation Text tất cả các trường khi nhấn vào nút "Lưu"
    When Go to create supplier page
    And Click "Lưu" button
    Then Required message "Tên nhà cung cấp" displayed under "Xin vui lòng nhập tên nhà cung cấp" field
    And Required message "Tỉnh/Thành phố" displayed under "Xin vui lòng chọn tỉnh/thành phố" field
    And Required message "Quận/Huyện" displayed under "Xin vui lòng chọn quận/huyện" field
    And Required message "Phường/Xã" displayed under "Xin vui lòng chọn phường/xã" field
    And Required message "Địa chỉ cụ thể" displayed under "Xin vui lòng nhập địa chỉ cụ thể" field
    And Required message "Họ tên đại diện" displayed under "Xin vui lòng nhập họ và tên đại diện" field
    And Required message "Số điện thoại đại diện" displayed under "Xin vui lòng nhập số điện thoại đại diện" field
    And Required message "Email đại diện" displayed under "Xin vui lòng nhập email đại diện" field

Create_Supplier_03: Kiểm tra Validation Text khi bỏ trống trường "Tên nhà cung cấp"
    [Tags]    @Test_create_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation Text khi bỏ trống trường "Tên nhà cung cấp"
    When Go to create supplier page
    And Enter "text" in "Tên nhà cung cấp" with "${empty}"
    And Click in "Số fax" field
    Then Required message "Tên nhà cung cấp" displayed under "Xin vui lòng nhập tên nhà cung cấp" field

Create_Supplier_04: Kiểm tra Validation Text trường "Số fax" khi nhập sai định dạng số fax và nhỏ hơn 8 ký tự
    [Tags]    @Test_create_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation Text trường "Số fax" khi nhập sai định dạng số fax và nhỏ hơn 8 ký tự
    When Go to create supplier page
    And Enter "text" in "Số fax" with "abcdef"
    And Click in "Tên nhà cung cấp" field
    Then Required message "Số fax" field displayed under "Xin vui lòng chỉ nhập số"
    And Required message "Số fax" field displayed under "Xin vui lòng nhập tối thiểu 8 ký tự số"

Create_Supplier_05: Kiểm tra Validation Text trường "Số fax" khi nhập sai định dạng số fax và lớn hơn 12 ký tự
    [Tags]    @Test_create_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation Text trường "Số fax" khi nhập sai định dạng số fax và lớn hơn 12 ký tự
    When Go to create supplier page
    And Enter "text" in "Số fax" with "_RANDOM_"
    And Click in "Tên nhà cung cấp" field
    Then Required message "Số fax" field displayed under "Xin vui lòng chỉ nhập số"
    And Required message "Số fax" field displayed under "Xin vui lòng nhập tối đa 12 ký tự số"

Create_Supplier_06: Kiểm tra Validation Text trường "Số fax" khi nhập số fax nhỏ hơn 8 ký tự số
    [Tags]    @Test_create_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation Text trường "Số fax" khi nhập số fax nhỏ hơn 8 ký tự số
    When Go to create supplier page
    And Enter "fax_7" in "Số fax" with "_RANDOM_"
    And Click in "Tên nhà cung cấp" field
    Then Required message "Số fax" displayed under "Xin vui lòng nhập tối thiểu 8 ký tự số" field

Create_Supplier_07: Kiểm tra Validation Text trường "Số fax" khi nhập số fax lớn hơn 12 ký tự số
    [Tags]    @Test_create_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation Text trường "Số fax" khi nhập số fax lớn hơn 12 ký tự số
    When Go to create supplier page
    And Enter "fax_invalid" in "Số fax" with "_RANDOM_"
    And Click in "Tên nhà cung cấp" field
    Then Required message "Số fax" displayed under "Xin vui lòng nhập tối đa 12 ký tự số" field

Create_Supplier_08: Kiểm tra Validation Text khi bỏ trống trường "Tỉnh/Thành phố"
    [Tags]    @Test_create_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation Text khi bỏ trống trường "Tỉnh/Thành phố"
    When Go to create supplier page
    And Click select "Tỉnh/Thành phố" with "Tỉnh Thừa Thiên Huế"
    And Delete text in "Tỉnh/Thành phố" field
    Then Required message "Tỉnh/Thành phố" displayed under "Xin vui lòng chọn tỉnh/thành phố" field

Create_Supplier_09: Kiểm tra Validation Text khi bỏ trống trường "Quận/Huyện"
    [Tags]    @Test_create_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation Text khi bỏ trống trường "Quận/Huyện"
    When Go to create supplier page
    And Click select "Tỉnh/Thành phố" with "Tỉnh Thừa Thiên Huế"
    And Click select "Quận/Huyện" with "Thành phố Huế"
    And Delete text in "Quận/Huyện" field
    Then Required message "Quận/Huyện" displayed under "Xin vui lòng chọn quận/huyện" field

Create_Supplier_10: Kiểm tra Validation Text khi bỏ trống trường "Phường/Xã"
    [Tags]    @Test_create_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation Text khi bỏ trống trường "Phường/Xã"
    When Go to create supplier page
    And Click select "Tỉnh/Thành phố" with "Tỉnh Thừa Thiên Huế"
    And Click select "Quận/Huyện" with "Thành phố Huế"
    And Click select "Phường/Xã" with "Phường Tây Lộc"
    And Delete text in "Phường/Xã" field
    Then Required message "Phường/Xã" displayed under "Xin vui lòng chọn phường/xã" field

Create_Supplier_11: Kiểm tra Validation Text khi bỏ trống trường "Địa chỉ cụ thể"
    [Tags]    @Test_create_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation Text khi bỏ trống trường "Địa chỉ cụ thể"
    When Go to create supplier page
    And Enter "text" in "Địa chỉ cụ thể" with "${empty}"
    And Click in "Họ tên đại diện" field
    Then Required message "Địa chỉ cụ thể" displayed under "Xin vui lòng nhập địa chỉ cụ thể" field

Create_Supplier_12: Kiểm tra Validation text khi bỏ trống trường "Họ tên đại diện"
    [Tags]    @Test_create_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation text khi bỏ trống trường "Họ tên đại diện"
    When Go to create supplier page
    And Enter "text" in "Họ tên đại diện" with "${empty}"
    And Click in "Số điện thoại đại diện" field
    Then Required message "Họ tên đại diện" displayed under "Xin vui lòng nhập họ và tên đại diện" field

Create_Supplier_13: Kiểm tra Validation text tại trường "Họ tên đại diện" khi nhập Họ tên đại diện không hợp lệ
    [Tags]    @Test_create_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation text tại trường "Họ tên đại diện" khi nhập Họ tên đại diện không hợp lệ
    When Go to create supplier page
    And Enter "text" in "Họ tên đại diện" with "_RANDOM_"
    And Click in "Số điện thoại đại diện" field
    Then Required message "Họ tên đại diện" displayed under "Vui lòng chỉ nhập chữ" field

Create_Supplier_14: Kiểm tra Validation Text trường khi bỏ trống trường "Số điện thoại"
    [Tags]    @Test_create_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation Text trường khi bỏ trống trường "Số điện thoại"
    When Go to create supplier page
    And Enter "text" in "Số điện thoại đại diện" with "${empty}"
    And Click in "Email đại diện" field
    Then Required message "Số điện thoại đại diện" displayed under "Xin vui lòng nhập số điện thoại đại diện" field

Create_Supplier_15: Kiểm tra Validation Text trường "Số điện thoại đại diện" khi nhập sai định dạng số điện thoại và nhỏ hơn 8 ký tự
    [Tags]    @Test_create_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation Text trường "Số điện thoại đại diện" khi nhập sai định dạng số điện thoại và nhỏ hơn 8 ký tự
    When Go to create supplier page
    And Enter "text" in "Số điện thoại đại diện" with "abcdef"
    And Click in "Email đại diện" field
    Then Required message "Số điện thoại đại diện" field displayed under "Xin vui lòng chỉ nhập số"
    And Required message "Số điện thoại đại diện" field displayed under "Xin vui lòng nhập tối thiểu 8 ký tự số"

Create_Supplier_16: Kiểm tra Validation Text trường "Số điện thoại đại diện" khi nhập sai định dạng số điện thoại và lớn hơn 12 ký tự
    [Tags]    @Test_create_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation Text trường "Số điện thoại đại diện" khi nhập sai định dạng số điện thoại và lớn hơn 12 ký tự
    When Go to create supplier page
    And Enter "text" in "Số điện thoại đại diện" with "_RANDOM_"
    And Click in "Email đại diện" field
    Then Required message "Số điện thoại đại diện" field displayed under "Xin vui lòng chỉ nhập số"
    And Required message "Số điện thoại đại diện" field displayed under "Xin vui lòng nhập tối đa 12 ký tự số"

Create_Supplier_17: Kiểm tra Validation Text trường "Số điện thoại đại diện" khi số điện thoại nhỏ hơn 8 ký tự số
    [Tags]    @Test_create_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation Text trường "Số điện thoại đại diện" khi số điện thoại nhỏ hơn 8 ký tự số
    When Go to create supplier page
    And Enter "phone_7" in "Số điện thoại đại diện" with "_RANDOM_"
    And Click in "Email đại diện" field
    Then Required message "Số điện thoại đại diện" displayed under "Xin vui lòng nhập tối thiểu 8 ký tự số" field

Create_Supplier_18: Kiểm tra Validation Text trường "Số điện thoại đại diện" khi số điện thoại lớn hơn 12 ký tự số
    [Tags]    @Test_create_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation Text trường "Số điện thoại đại diện" khi số điện thoại lớn hơn 12 ký tự số
    When Go to create supplier page
    And Enter "phone_invalid" in "Số điện thoại đại diện" with "_RANDOM_"
    And Click in "Email đại diện" field
    Then Required message "Số điện thoại đại diện" displayed under "Xin vui lòng nhập tối đa 12 ký tự số" field

Create_Supplier_19: Kiểm tra Validation Text khi bỏ trống trường "Email đại diện"
    [Tags]    @Test_create_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation Text khi bỏ trống trường "Email đại diện"
    When Go to create supplier page
    And Enter "Email" in "Email đại diện" with "${empty}"
    And Click in "Số điện thoại đại diện" field
    Then Required message "Email đại diện" displayed under "Xin vui lòng nhập email đại diện" field

Create_Supplier_20: Kiểm tra Validation Text trường "Email đại diện" khi nhập sai định dạng email
    [Tags]    @Test_create_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation Text trường "Email đại diện" khi nhập sai định dạng email
    When Go to create supplier page
    And Enter "text" in "Email đại diện" with "_RANDOM_"
    And Click in "Số điện thoại đại diện" field
    Then Required message "Email đại diện" displayed under "Vui lòng nhập địa chỉ email hợp lệ!" field

Create_Supplier_21: Kiểm tra Validation Text trường "Ghi chú" khi nhập ghi chú quá 500 ký tự
    [Tags]    @Test_create_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation Text trường "Ghi chú" khi nhập ghi chú quá 500 ký tự
    When Go to create supplier page
    And Enter "word" in textarea "Ghi chú" with "_RANDOM_"
    And Click in "Số điện thoại đại diện" field
    Then Required message "Ghi chú" displayed under "Chỉ được nhập tối đa 500 kí tự" field

##=================================ERROR MESSAGE===============================================================================================
Create_Supplier_22: Kiểm tra Error Message khi tạo mới nhà cung cấp với "Số fax" đã được đăng kí trước đó
    [Tags]    @Test_create_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Error Message khi tạo mới nhà cung cấp với "Số fax" đã được đăng kí trước đó
    When Go to create supplier page
    And Enter "fullname" in "Tên nhà cung cấp" with "_RANDOM_"
    And Enter "fax_valid" in "Số fax" with "0900129112"
    And Click select "Tỉnh/Thành phố" with "Tỉnh Thừa Thiên Huế"
    And Click select "Quận/Huyện" with "Huyện Phú Vang"
    And Click select "Phường/Xã" with "Xã Phú An"
    And Enter "text" in "Địa chỉ cụ thể" with "_RANDOM_"
    And Enter "fullname" in "Họ tên đại diện" with "_RANDOM_"
    And Enter "phone" in "Số điện thoại đại diện" with "_RANDOM_"
    And Enter "Email" in "Email đại diện" with "_RANDOM_"
    And Click "Lưu" button
    Then User look message "Số Fax đã được đăng kí trước đó." popup

Create_Supplier_23: Kiểm tra Error Message khi tạo mới nhà cung cấp với Số điện thoại đã được đăng kí trước đó
    [Tags]    @Test_create_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Error Message khi tạo mới nhà cung cấp với Số điện thoại đã được đăng kí trước đó
    When Go to create supplier page
    And Enter "fullname" in "Tên nhà cung cấp" with "_RANDOM_"
    And Enter "fax_valid" in "Số fax" with "_RANDOM_"
    And Click select "Tỉnh/Thành phố" with "Tỉnh Thừa Thiên Huế"
    And Click select "Quận/Huyện" with "Huyện Phú Vang"
    And Click select "Phường/Xã" with "Xã Phú An"
    And Enter "text" in "Địa chỉ cụ thể" with "_RANDOM_"
    And Enter "fullname" in "Họ tên đại diện" with "_RANDOM_"
    And Enter "phone" in "Số điện thoại đại diện" with "0987433121"
    And Enter "Email" in "Email đại diện" with "_RANDOM_"
    And Click "Lưu" button
    Then User look message "Số điện thoại đã được đăng ký trước đó." popup

Create_Supplier_24: Kiểm tra Error Message khi tạo mới nhà cung cấp với Email đã được đăng kí trước đó
    [Tags]    @Test_create_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Error Message khi tạo mới nhà cung cấp với Email đã được đăng kí trước đó
    When Go to create supplier page
    And Enter "fullname" in "Tên nhà cung cấp" with "_RANDOM_"
    And Enter "fax_valid" in "Số fax" with "_RANDOM_"
    And Click select "Tỉnh/Thành phố" with "Tỉnh Thừa Thiên Huế"
    And Click select "Quận/Huyện" with "Huyện Phú Vang"
    And Click select "Phường/Xã" with "Xã Phú An"
    And Enter "text" in "Địa chỉ cụ thể" with "_RANDOM_"
    And Enter "fullname" in "Họ tên đại diện" with "_RANDOM_"
    And Enter "phone" in "Số điện thoại đại diện" with "_RANDOM_"
    And Enter "Email" in "Email đại diện" with "htxhoabinh@getndata.com"
    And Click "Lưu" button
    Then User look message "Email đã được đăng ký trước đó." popup

##=========================================CREATE SUPPLIER SUCCESSFULLY=====================================================================
Create_Supplier_25: Kiểm tra Successfully Message tạo mới nhà cung cấp thành công
    [Tags]    @Test_create_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Successfully Message tạo mới nhà cung cấp thành công
    When Go to create supplier page
    And Enter "text" in "Tên nhà cung cấp" with "Công ty cổ phần Apple Việt Nam - Chi nhánh Hồ Chí Minh Cơ sở 1"
    And Enter "fax_valid" in "Số fax" with "_RANDOM_"
    And Click select "Tỉnh/Thành phố" with "Thành phố Hồ Chí Minh"
    And Click select "Quận/Huyện" with "Quận Bình Thạnh"
    And Click select "Phường/Xã" with "Phường 13"
    And Enter "number" in "Địa chỉ cụ thể" with "_RANDOM_"
    And Enter "fullname" in "Họ tên đại diện" with "Nguyễn Thị Ánh Viên"
    And Enter "phone" in "Số điện thoại đại diện" with "_RANDOM_"
    And Enter "Email" in "Email đại diện" with "_RANDOM_"
    And Enter "paragraph" in textarea "Ghi chú" with "Công ty cổ phần Apple Việt Nam - Chi nhánh Hồ Chí Minh Cơ sở 1"
    And Click "Lưu" button
    Then User look message "Tạo nhà cung cấp thành công." popup

##===================ĐIỀU HƯỚNG ĐẾN TRANG "QUẢN LÝ NHÀ CUNG CẤP" TỪ TRANG "TẠO MỚI NHÀ CUNG CẤP"============================================
Create_Supplier_26: Kiểm tra có thể điều hướng đến trang danh sách nhà cung cấp thành công
    [Tags]    @Test_create_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra có thể điều hướng đến trang danh sách nhà cung cấp thành công
    When Go to create supplier page
    And Click "Trở về" button
    Then User look title "Quản Lý Nhà Cung Cấp"
    And User look contains title is "Quản lý nhà cung cấp"

#=====================================VIEW LIST OF SUPPLIER=====================================================
Create_Supplier_27: Kiểm tra hiển thị thành công danh sách nhà cung cấp đã tạo
    [Tags]    @Test_create_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra hiển thị thành công danh sách nhà cung cấp đã tạo
    When Go to list supplier page
    Then Show list of "Suppliers"

Create_Supplier_28: Kiểm tra việc tìm kiếm thành công khi nhập "Mã NCC" hợp lệ vào thanh tìm kiếm
    [Tags]    @Test_create_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra việc tìm kiếm thành công khi nhập "Mã NCC" hợp lệ vào thanh tìm kiếm
    When Go to list supplier page
    And Search "text" in "Tìm kiếm" with "SPL1222"
    Then Show list of "Suppliers"

Create_Supplier_29: Kiểm tra việc tìm kiếm thành công khi nhập "Tên nhà cung cấp" hợp lệ vào thanh tìm kiếm
    [Tags]    @Test_create_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra việc tìm kiếm thành công khi nhập "Tên nhà cung cấp" hợp lệ vào thanh tìm kiếm
    When Go to list supplier page
    And Search "text" in "Tìm kiếm" with "Siêu thị Big C Huế"
    Then Show list of "Suppliers"

Create_Supplier_30: Kiểm tra việc tìm kiếm thành công khi nhập "Tỉnh/Thành phố" hợp lệ vào thanh tìm kiếm
    [Tags]    @Test_create_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra việc tìm kiếm thành công khi nhập "Tỉnh/Thành phố" hợp lệ vào thanh tìm kiếm
    When Go to list supplier page
    And Search "text" in "Tìm kiếm" with "Thành Phố Hồ Chí Minh"
    Then Show list of "Suppliers"

Create_Supplier_31: Kiểm tra việc tìm kiếm thành công khi nhập "Quận/Huyện" hợp lệ vào thanh tìm kiếm
    [Tags]    @Test_create_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra việc tìm kiếm thành công khi nhập "Quận/Huyện" hợp lệ vào thanh tìm kiếm
    When Go to list supplier page
    And Search "text" in "Tìm kiếm" with "Thành phố Thủ Đức"
    Then Show list of "Suppliers"

Create_Supplier_32: Kiểm tra việc tìm kiếm thành công khi nhập "Phường/Xã" hợp lệ vào thanh tìm kiếm
    [Tags]    @Test_create_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra việc tìm kiếm thành công khi nhập "Phường/Xã" hợp lệ vào thanh tìm kiếm
    When Go to list supplier page
    And Search "text" in "Tìm kiếm" with "Phường Tăng Nhơn Phú B"
    Then Show list of "Suppliers"

Create_Supplier_33: Kiểm tra việc tìm kiếm thành công khi nhập "Người đại diện" hợp lệ vào thanh tìm kiếm
    [Tags]    @Test_create_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra việc tìm kiếm thành công khi nhập "Người đại diện" hợp lệ vào thanh tìm kiếm
    When Go to list supplier page
    And Search "text" in "Tìm kiếm" with "Hồ Văn Nhật"
    Then Show list of "Suppliers"

Create_Supplier_34: Kiểm tra việc tìm kiếm thành công khi nhập "Số điện thoại" hợp lệ vào thanh tìm kiếm
    [Tags]    @Test_create_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra việc tìm kiếm thành công khi nhập "Số điện thoại" hợp lệ vào thanh tìm kiếm
    When Go to list supplier page
    And Search "text" in "Tìm kiếm" with "0359659906"
    Then Show list of "Suppliers"

Create_Supplier_35: Kiểm tra việc tìm kiếm không thành công khi nhập "Mã NCC" không hợp lệ vào thanh tìm kiếm
    [Tags]    @Test_create_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra việc tìm kiếm không thành công khi nhập "Mã NCC" không hợp lệ vào thanh tìm kiếm
    When Go to list supplier page
    And Search "name code" in "Tìm kiếm" with "_RANDOM_"
    Then No Supplier are shown

Create_Supplier_36: Kiểm tra việc tìm kiếm không thành công khi nhập "Số điện thoại" không hợp lệ vào thanh tìm kiếm
    [Tags]    @Test_create_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra việc tìm kiếm không thành công khi nhập "Số điện thoại" không hợp lệ vào thanh tìm kiếm
    When Go to list supplier page
    And Search "phone" in "Tìm kiếm" with "_RANDOM_"
    Then No Supplier are shown

Create_Supplier_37: Kiểm tra việc tìm kiếm không thành công khi nhập "Keyword" không hợp lệ vào thanh tìm kiếm
    [Tags]    @Test_create_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra việc tìm kiếm không thành công khi nhập "Keyword" không hợp lệ vào thanh tìm kiếm
    When Go to list supplier page
    And Search "text" in "Tìm kiếm" with "_RANDOM_"
    Then No Supplier are shown

Create_Supplier_38: Kiểm tra có thể xem danh sách nhà cung cấp trang kế tiếp, trước trước, trang cuối cùng, trang đầu tiên
    [Tags]    @Test_create_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra có thể xem danh sách nhà cung cấp trang kế tiếp, trước trước, trang cuối cùng, trang đầu tiên
    When Go to list supplier page
    And Click ">" to "next" page
    Then Show list of "Suppliers"
    And Click "<" to "prev" page
    Then Show list of "Suppliers"
    And Click ">>" to "next_all" page
    Then Show list of "Suppliers"
    And Click "<<" to "prev_all" page
    Then Show list of "Suppliers"

##=========================ĐIỀU HƯỚNG ĐẾN TRANG "CHỈNH SỬA THÔNG TIN NHÀ CUNG CẤP"========================================================
Edit_Supplier_01: Kiểm tra có thể điều hướng đến trang chỉnh sửa thông tin nhà cung cấp
    [Tags]    @Test_edit_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra có thể điều hướng đến trang chỉnh sửa thông tin nhà cung cấp
    When Click "Quản lý nhà cung cấp" menu
    And Select Supplier need to edit
    Then User look title "Quản Lý Nhà Cung Cấp"
    And User look contains title is "Chi tiết nhà cung cấp"
    And User look tab menu "Thông tin nhà cung cấp"
    And User look tab menu "Danh sách hàng hóa"
    And User look tab menu "Quản lý đơn hàng"
    And User look tab menu "Doanh thu"
    And User look tab menu "Chiết khấu"
    And User look tab menu "Hợp đồng"

#==================================VALIDATION TEXT==========================================================
Edit_Supplier_02: Kiểm tra Validation Text trường "Tên nhà cung cấp" khi bỏ trống Tên nhà cung cấp
    [Tags]    @Test_edit_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation Text trường "Tên nhà cung cấp" khi bỏ trống Tên nhà cung cấp
    When Go to edit supplier page
    When Enter "text" in "Tên nhà cung cấp" with "${empty}"
    And Click in "Số fax" field
    Then Required message "Tên nhà cung cấp" displayed under "Xin vui lòng nhập tên nhà cung cấp" field

Edit_Supplier_03: Kiểm tra Validation Text trường "Số fax" khi nhập sai định dạng và nhỏ hơn 8 ký tự
    [Tags]    @Test_edit_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation Text trường "Số fax" khi nhập sai định dạng và nhỏ hơn 8 ký tự
    When Go to edit supplier page
    When Enter "text" in "Số fax" with "abcdef"
    And Click in "Tên nhà cung cấp" field
    Then Required message "Số fax" field displayed under "Xin vui lòng chỉ nhập số"
    And Required message "Số fax" field displayed under "Xin vui lòng nhập tối thiểu 8 ký tự số"

Edit_Supplier_04: Kiểm tra Validation Text trường "Số fax" khi nhập sai định dạng và lớn hơn 12 ký tự
    [Tags]    @Test_edit_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation Text trường "Số fax" khi nhập sai định dạng và lớn hơn 12 ký tự
    When Go to edit supplier page
    When Enter "text" in "Số fax" with "_RANDOM_"
    And Click in "Tên nhà cung cấp" field
    Then Required message "Số fax" field displayed under "Xin vui lòng chỉ nhập số"
    And Required message "Số fax" field displayed under "Xin vui lòng nhập tối đa 12 ký tự số"

Edit_Supplier_05: Kiểm tra Validation Text trường "Số fax" khi số fax nhỏ hơn 8 ký tự
    [Tags]    @Test_edit_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation Text trường "Số fax" khi số fax nhỏ hơn 8 ký tự
    When Go to edit supplier page
    When Enter "fax_7" in "Số fax" with "_RANDOM_"
    And Click in "Tên nhà cung cấp" field
    Then Required message "Số fax" displayed under "Xin vui lòng nhập tối thiểu 8 ký tự số" field

Edit_Supplier_06: Kiểm tra Validation Text trường "Số fax" khi số fax lớn hơn 12 ký tự
    [Tags]    @Test_edit_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation Text trường "Số fax" khi số fax lớn hơn 12 ký tự
    When Go to edit supplier page
    When Enter "fax_invalid" in "Số fax" with "_RANDOM_"
    And Click in "Tên nhà cung cấp" field
    Then Required message "Số fax" displayed under "Xin vui lòng nhập tối đa 12 ký tự số" field

Edit_Supplier_07: Kiểm tra Validation text tại trường "Tỉnh/Thành phố" khi bỏ trống Tỉnh/Thành phố
    [Tags]    @Test_edit_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation text tại trường "Tỉnh/Thành phố" khi bỏ trống Tỉnh/Thành phố
    When Go to edit supplier page
    And Delete text in "Tỉnh/Thành phố" field
    Then Required message "Tỉnh/Thành phố" displayed under "Xin vui lòng chọn tỉnh/thành phố" field

Edit_Supplier_08: Kiểm tra Validation text tại trường "Quận/Huyện" khi bỏ trống Quận/Huyện
    [Tags]    @Test_edit_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation text tại trường "Quận/Huyện" khi bỏ trống Quận/Huyện
    When Go to edit supplier page
    And Delete text in "Quận/Huyện" field
    Then Required message "Quận/Huyện" displayed under "Xin vui lòng chọn quận/huyện" field

Edit_Supplier_09: Kiểm tra Validation text tại trường "Phường/Xã" khi bỏ trống Phường/Xã
    [Tags]    @Test_edit_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation text tại trường "Phường/Xã" khi bỏ trống Phường/Xã
    When Go to edit supplier page
    And Delete text in "Phường/Xã" field
    Then Required message "Phường/Xã" displayed under "Xin vui lòng chọn phường/xã" field

Edit_Supplier_10: Kiểm tra Validation text khi bỏ trống trường "Địa chỉ cụ thể"
    [Tags]    @Test_edit_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation text khi bỏ trống trường "Địa chỉ cụ thể"
    When Go to edit supplier page
    And Enter "text" in "Địa chỉ cụ thể" with "${empty}"
    And Click in "Họ tên đại diện" field
    Then Required message "Địa chỉ cụ thể" displayed under "Xin vui lòng nhập địa chỉ cụ thể" field

Edit_Supplier_11: Kiểm tra Validation text tại trường "Họ tên đại diện" khi bỏ trống Họ tên đại diện
    [Tags]    @Test_edit_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation text tại trường "Họ tên đại diện" khi bỏ trống Họ tên đại diện
    When Go to edit supplier page
    And Enter "text" in "Họ tên đại diện" with "${empty}"
    And Click in "Số điện thoại đại diện" field
    Then Required message "Họ tên đại diện" displayed under "Xin vui lòng nhập họ và tên đại diện" field

Edit_Supplier_12: Kiểm tra Validation text tại trường "Họ tên đại diện" khi nhập Họ tên đại diện không hợp lệ
    [Tags]    @Test_edit_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation text tại trường "Họ tên đại diện" khi nhập Họ tên đại diện không hợp lệ
    When Go to edit supplier page
    And Enter "text" in "Họ tên đại diện" with "_RANDOM_"
    And Click in "Số điện thoại đại diện" field
    Then Required message "Họ tên đại diện" displayed under "Vui lòng chỉ nhập chữ" field

Edit_Supplier_13: Kiểm tra Validation Text trường "Số điện thoại đại diện" khi bỏ trống số điện thoại
    [Tags]    @Test_edit_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation Text trường "Số điện thoại đại diện" khi bỏ trống số điện thoại
    When Go to edit supplier page
    And Enter "phone" in "Số điện thoại đại diện" with "${empty}"
    And Click in "Email đại diện" field
    Then Required message "Số điện thoại đại diện" displayed under "Xin vui lòng nhập số điện thoại đại diện" field

Edit_Supplier_14: Kiểm tra Validation Text trường "Số điện thoại đại diện" khi nhập sai định dạng và nhỏ hơn 8 ký tự
    [Tags]    @Test_edit_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation Text trường "Số điện thoại đại diện" khi nhập sai định dạng và nhỏ hơn 8 ký tự
    When Go to edit supplier page
    And Enter "text" in "Số điện thoại đại diện" with "abcdef"
    And Click in "Email đại diện" field
    Then Required message "Số điện thoại đại diện" field displayed under "Xin vui lòng chỉ nhập số"
    And Required message "Số điện thoại đại diện" field displayed under "Xin vui lòng nhập tối thiểu 8 ký tự số"

Edit_Supplier_15: Kiểm tra Validation Text trường "Số điện thoại đại diện" khi nhập sai định dạng và lớn hơn 12 ký tự
    [Tags]    @Test_edit_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation Text trường "Số điện thoại đại diện" khi nhập sai định dạng và lớn hơn 12 ký tự
    When Go to edit supplier page
    And Enter "text" in "Số điện thoại đại diện" with "_RANDOM_"
    And Click in "Email đại diện" field
    Then Required message "Số điện thoại đại diện" field displayed under "Xin vui lòng chỉ nhập số"
    And Required message "Số điện thoại đại diện" field displayed under "Xin vui lòng nhập tối đa 12 ký tự số"

Edit_Supplier_16: Kiểm tra Validation Text trường "Số điện thoại đại diện" khi số số điện thoại nhỏ hơn 8 ký tự
    [Tags]    @Test_edit_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation Text trường "Số điện thoại đại diện" khi số số điện thoại nhỏ hơn 8 ký tự
    When Go to edit supplier page
    And Enter "phone_7" in "Số điện thoại đại diện" with "_RANDOM_"
    And Click in "Email đại diện" field
    Then Required message "Số điện thoại đại diện" displayed under "Xin vui lòng nhập tối thiểu 8 ký tự số" field

Edit_Supplier_17: Kiểm tra Validation Text trường "Số điện thoại đại diện" khi số điện thoại lớn hơn 12 ký tự
    [Tags]    @Test_edit_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation Text trường "Số điện thoại đại diện" khi số điện thoại lớn hơn 12 ký tự
    When Go to edit supplier page
    And Enter "phone_invalid" in "Số điện thoại đại diện" with "_RANDOM_"
    And Click in "Email đại diện" field
    Then Required message "Số điện thoại đại diện" displayed under "Xin vui lòng nhập tối đa 12 ký tự số" field

Edit_Supplier_18: Kiểm tra Validation Text trường "Email đại diện" khi nhập sai định dạng email
    [Tags]    @Test_edit_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation Text trường "Email đại diện" khi nhập sai định dạng email
    When Go to edit supplier page
    And Enter "text" in "Email đại diện" with "_RANDOM_"
    And Click in "Số điện thoại đại diện" field
    Then Required message "Email đại diện" displayed under "Vui lòng nhập địa chỉ email hợp lệ!" field

Edit_Supplier_19: Kiểm tra Validation Text trường "Ghi chú" khi nhập ghi chú quá 500 ký tự
    [Tags]    @Test_edit_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation Text trường "Ghi chú" khi nhập ghi chú quá 500 ký tự
    When Go to edit supplier page
    And Enter "word" in textarea "Ghi chú" with "_RANDOM_"
    And Click in "Số điện thoại đại diện" field
    Then Required message "Ghi chú" displayed under "Chỉ được nhập tối đa 500 kí tự" field

##=================================ERROR MESSAGE===============================================================================================
Edit_Supplier_20: Kiểm tra Error Message khi chỉnh sửa nhà cung cấp với Số fax đã được đăng kí trước đó
    [Tags]    @Test_edit_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Error Message khi chỉnh sửa nhà cung cấp với Số fax đã được đăng kí trước đó
    When Go to edit supplier page
    When Enter "fax_valid" in "Số fax" with "0900129112"
    And Click "Lưu" button
    Then User look message "Số Fax đã được đăng kí trước đó." popup

Edit_Supplier_21: Kiểm tra Error Message khi chỉnh sửa nhà cung cấp với Số điện thoại đã được đăng kí trước đó
    [Tags]    @Testcase Failed
    [Documentation]   Kiểm tra Error Message khi chỉnh sửa nhà cung cấp với Số điện thoại đã được đăng kí trước đó
    When Go to edit supplier page
    When Enter "phone" in "Số điện thoại đại diện" with "0977855888"
    And Click "Lưu" button
    Then User look message "Số điện thoại đã được đăng ký trước đó." popup

Edit_Supplier_22: Kiểm tra Error Message khi chỉnh sửa nhà cung cấp với Email đã được đăng kí trước đó
    [Tags]    @Test_edit_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Error Message khi chỉnh sửa nhà cung cấp với Email đã được đăng kí trước đó
    When Go to edit supplier page
    And Enter "email" in "Email đại diện" with "htxhoabinh@getndata.com"
    And Click "Lưu" button
    Then User look message "Email này đã tồn tại, vui lòng nhập email khác." popup

##=======================EDIT SUPPLIER SUCCESSFULLY================================================
Edit_Supplier_23: Kiểm tra chỉnh sửa thông tin nhà cung cấp thành công khi thay đổi Tên nhà cung cấp
    [Tags]    @Test_edit_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra chỉnh sửa thông tin nhà cung cấp thành công khi thay đổi Tên nhà cung cấp
    When Go to edit supplier page
    And Enter "text" in "Tên nhà cung cấp" with "Công ty TNHH Samsung Electronics Việt Nam"
    And Click "Lưu" button
    Then User look message "Chỉnh sửa nhà cung cấp thành công." popup

Edit_Supplier_24: Kiểm tra chỉnh sửa thông tin nhà cung cấp thành công khi thay đổi Số fax
    [Tags]    @Test_edit_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra chỉnh sửa thông tin nhà cung cấp thành công khi thay đổi Số fax
    When Go to edit supplier page
    And Enter "fax_valid" in "Số fax" with "_RANDOM_"
    And Click "Lưu" button
    Then User look message "Chỉnh sửa nhà cung cấp thành công." popup

Edit_Supplier_25: Kiểm tra chỉnh sửa thông tin nhà cung cấp thành công khi thay đổi Địa chỉ cửa hàng
    [Tags]    @Test_edit_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra chỉnh sửa thông tin nhà cung cấp thành công khi thay đổi Địa chỉ cửa hàng
    When Go to edit supplier page
    And Delete text in "Tỉnh/Thành phố" field
    And Click select "Tỉnh/Thành phố" with "Tỉnh Quảng Trị"
    And Click select "Quận/Huyện" with "Thị xã Quảng Trị"
    And Click select "Phường/Xã" with "Xã Hải Lệ"
    And Enter "number" in "Địa chỉ cụ thể" with "_RANDOM_"
    And Click "Lưu" button
    Then User look message "Chỉnh sửa nhà cung cấp thành công." popup

Edit_Supplier_26: Kiểm tra chỉnh sửa thông tin nhà cung cấp thành công khi thay đổi Họ tên người đại diện
    [Tags]    @Test_edit_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra chỉnh sửa thông tin nhà cung cấp thành công khi thay đổi Họ tên người đại diện
    When Go to edit supplier page
    And Enter "fullname" in "Họ tên đại diện" with "Lê Dương Bảo Lâm"
    And Click "Lưu" button
    Then User look message "Chỉnh sửa nhà cung cấp thành công." popup

Edit_Supplier_27: Kiểm tra chỉnh sửa thông tin nhà cung cấp thành công khi thay đổi Số điện thoại người đại diện
    [Tags]    @Test_edit_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra chỉnh sửa thông tin nhà cung cấp thành công khi thay đổi Số điện thoại người đại diện
    When Go to edit supplier page
    And Enter "phone" in "Số điện thoại đại diện" with "_RANDOM_"
    And Click "Lưu" button
    Then User look message "Chỉnh sửa nhà cung cấp thành công." popup

Edit_Supplier_28: Kiểm tra chỉnh sửa thông tin nhà cung cấp thành công khi thay đổi Email người đại diện
    [Tags]    @Test_edit_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra chỉnh sửa thông tin nhà cung cấp thành công khi thay đổi Email người đại diện
    When Go to edit supplier page
    And Enter "Email" in "Email đại diện" with "_RANDOM_"
    And Click "Lưu" button
    Then User look message "Chỉnh sửa nhà cung cấp thành công." popup

Edit_Supplier_29: Kiểm tra chỉnh sửa thông tin nhà cung cấp thành công khi thay đổi Ghi chú
    [Tags]    @Test_edit_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra chỉnh sửa thông tin nhà cung cấp thành công khi thay đổi Ghi chú
    When Go to edit supplier page
    And Enter "paragraph" in textarea "Ghi chú" with "Công ty TNHH Samsung Electronics Việt Nam"
    And Click "Lưu" button
    Then User look message "Chỉnh sửa nhà cung cấp thành công." popup

Edit_Supplier_30: Kiểm tra điều hướng đến trang “Quản lý nhà cung cấp” từ trang “Chỉnh sửa nhà cung cấp”
    [Tags]    @Test_edit_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra điều hướng đến trang “Quản lý nhà cung cấp” từ trang “Chỉnh sửa nhà cung cấp”
    When Go to edit supplier page
    And Click "Trở về" button
    Then User look title "Quản Lý Nhà Cung Cấp"
    And User look contains title is "Quản lý nhà cung cấp"

*** Keywords ***
Preconditions
  Set Browser Timeout         ${BROWSER_TIMEOUT}
  New Browser                 ${BROWSER}  headless=${HEADLESS}
  New Page                    ${URL_DEFAULT}
  ${STATE}                    Evaluate  json.loads('''{}''')  json
  Login to Admin

Go to ${name} supplier page
  When Click "Quản lý nhà cung cấp" menu
  IF  '${name}' == 'create'
    And Click "Thêm nhà cung cấp" button
  ELSE IF  '${name}' == 'edit'
    And Select Supplier need to edit
  END

Select Supplier need to edit
    Search "text" in "Tìm kiếm" with "SPL1230"
    ${element}    Set Variable   //td[contains(text(),'SPL1230')]
    Click         ${element}        left        2

User look tab menu "${menu}"
  Element Text Should Be    //div[contains(text(),'${menu}')]     ${menu}

Show list of "Suppliers"
    Wait Until Element Spin
    ${elements}=        Get Elements        xpath=//*[contains(@class, "ant-table-row")]
    Run Keyword If    ${elements}     Display     ${elements}
    ...    ELSE    Log To Console     Không tồn tại nhà cung cấp balance nào!
Display
    [Arguments]    ${name}    ${elements}
    Log To Console      *************************-DANH SÁCH NHÀ CUNG CẤP BALANCE-**************************
    Wait Until Element Is Visible         ${elements}[0]
    ${count}=           Set Variable        1
    ${stt}=             Set Variable        1
    FOR  ${i}  IN  @{elements}
        ${Mã NCC}               Get Text        //tbody/tr[${count}]/td[1]
        ${Tên NCC}              Get Text        //tbody/tr[${count}]/td[2]
        ${Địa chỉ}              Get Text        //tbody/tr[${count}]/td[3]
        ${Người đại diện}       Get Text        //tbody/tr[${count}]/td[4]
        ${Số điện thoại}        Get Text        //tbody/tr[${count}]/td[5]
        ${Trạng thái}           Get Text        //tbody/tr[${count}]/td[6]

        Log To Console    ${stt}. Mã NCC: ${Mã NCC} | Tên nhà cung cấp: ${Tên NCC} | Địa chỉ: ${Địa chỉ} | Người đại diện: ${Người đại diện} | Số điện thoại: ${Số điện thoại} | Trạng thái: ${Trạng thái}
        Log To Console    ================================================================================================================================================================================
        ${count}=    Evaluate    ${count} + 1
        ${stt}=    Evaluate    ${stt} + 1
    END
    ${total}=    Evaluate    ${count} - 1
    Log To Console    Tổng số lượng nhà cung cấp balance là: ${total}
