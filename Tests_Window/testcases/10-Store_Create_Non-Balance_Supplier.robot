*** Settings ***
Resource            ../keywords/common.robot

Test Setup          Preconditions
Test Teardown       Tear Down

*** Variables ***
${edit_nonbalance}      SPL1361
${Mã NCC}    	          SPL1355
${Tên nhà cung cấp}    Văn Nhật Store Non-Balance
${Tên quản lý}         Đoàn Thị Trà My
${Số điện thoại}       0941225407
${Số fax}              0941225407
${Email}              nonsupplier@gmail.com

*** Test Cases ***

###============================================NAVIGATE CREATE SUPPLIER PAGE=====================================================
Create_Non-Balance_Supplier_01: Kiểm tra có thể điều hướng đến trang tạo mới nhà cung cấp Non-Balance
    [Tags]    @Test_Create_Non-Balance_Supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra có thể điều hướng đến trang tạo mới nhà cung cấp Non-Balance
    And Click "Quản lý NCC" menu
    And Click "Non-Balance" tab button
    And Click "Thêm nhà cung cấp" button
    Then User look title "Quản Lý Nhà Cung Cấp"
    And User look contains title is "Thêm nhà cung cấp"

###=========================VALIDATION TEXT========================================================
Create_Non-Balance_Supplier_02: Kiểm tra Validation Text khi không nhập thông tin nào cả
    [Tags]    @Test_Create_Non-Balance_Supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text khi không nhập thông tin nào cả
    When Go to create non-balance supplier page
    And Click "Lưu" button
    Then Required message "Tên nhà cung cấp" displayed under "Xin vui lòng nhập tên nhà cung cấp" field
    And Required message "Email đại diện" displayed under "Xin vui lòng nhập email" field
    And Required message "Họ tên đại diện" displayed under "Xin vui lòng nhập họ và tên quản lý" field
    And Required message "Số điện thoại đại diện" displayed under "Xin vui lòng nhập số điện thoại đại diện" field
    And Required message "Tỉnh/Thành phố" displayed under "Xin vui lòng chọn tỉnh/thành phố" field
    And Required message "Quận/Huyện" displayed under "Xin vui lòng chọn quận/huyện" field
    And Required message "Phường/Xã" displayed under "Xin vui lòng chọn phường/xã" field
    And Required message "Địa chỉ cụ thể" displayed under "Xin vui lòng nhập địa chỉ cụ thể" field

Create_Non-Balance_Supplier_03: Kiểm tra Validation Text khi bỏ trống trường "Tên nhà cung cấp"
    [Tags]    @Test_Create_Non-Balance_Supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text khi bỏ trống trường "Tên nhà cung cấp"
    When Go to create non-balance supplier page
    And Enter "text" in "Tên nhà cung cấp" with "${EMPTY}"
    And Click in "Email đại diện" field
    Then Required message "Tên nhà cung cấp" displayed under "Xin vui lòng nhập tên nhà cung cấp" field

Create_Non-Balance_Supplier_04: Kiểm tra Validation Text khi bỏ trống trường "Email đại diện"
    [Tags]    @Test_Create_Non-Balance_Supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text khi bỏ trống trường "Email đại diện"
    When Go to create non-balance supplier page
    And Enter "text" in "Email đại diện" with "${EMPTY}"
    And Click in "Họ tên đại diện" field
    Then Required message "Email đại diện" displayed under "Xin vui lòng nhập email" field

Create_Non-Balance_Supplier_05: Kiểm tra Validation Text trường "Email đại diện" khi nhập sai định dạng email
    [Tags]    @Test_Create_Non-Balance_Supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text trường "Email đại diện" khi nhập sai định dạng email
    When Go to create non-balance supplier page
    And Enter "text" in "Email đại diện" with "_RANDOM_"
    And Click in "Họ tên đại diện" field
    Then Required message "Email đại diện" displayed under "Vui lòng nhập địa chỉ email hợp lệ!" field

Create_Non-Balance_Supplier_06: Kiểm tra Validation text khi bỏ trống trường "Họ tên đại diện"
    [Tags]    @Test_Create_Non-Balance_Supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation text khi bỏ trống trường "Họ tên đại diện"
    When When Go to create non-balance supplier page
    And Enter "text" in "Họ tên đại diện" with "${EMPTY}"
    And Click in "Số điện thoại đại diện" field
    Then Required message "Họ tên đại diện" displayed under "Xin vui lòng nhập họ và tên quản lý" field

Create_Non-Balance_Supplier_07: Kiểm tra Validation text tại trường "Họ tên đại diện" khi nhập Họ tên đại diện không hợp lệ
    [Tags]    @Test_Create_Non-Balance_Supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation text tại trường "Họ tên đại diện" khi nhập Họ tên đại diện không hợp lệ
    When When Go to create non-balance supplier page
    And Enter "text" in "Họ tên đại diện" with "_RANDOM_"
    And Click in "Số điện thoại đại diện" field
    Then Required message "Họ tên đại diện" displayed under "Vui lòng chỉ nhập chữ" field

Create_Non-Balance_Supplier_08: Kiểm tra Validation Text trường khi bỏ trống trường "Số điện thoại"
    [Tags]    @Test_Create_Non-Balance_Supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text trường khi bỏ trống trường "Số điện thoại"
    When Go to create non-balance supplier page
    And Enter "text" in "Số điện thoại đại diện" with "${EMPTY}"
    And Click in "Số fax" field
    Then Required message "Số điện thoại đại diện" displayed under "Xin vui lòng nhập số điện thoại đại diện" field

Create_Non-Balance_Supplier_09: Kiểm tra Validation Text trường "Số điện thoại đại diện" khi nhập sai định dạng số điện thoại và nhỏ hơn 8 ký tự
    [Tags]    @Test_Create_Non-Balance_Supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text trường "Số điện thoại đại diện" khi nhập sai định dạng số điện thoại và nhỏ hơn 8 ký tự
    When Go to create non-balance supplier page
    And Enter "text" in "Số điện thoại đại diện" with "abcdef"
    And Click in "Số fax" field
    Then Required message "Số điện thoại đại diện" field displayed under "Xin vui lòng chỉ nhập số"
    And Required message "Số điện thoại đại diện" field displayed under "Xin vui lòng nhập tối thiểu 8 ký tự số"

Create_Non-Balance_Supplier_10: Kiểm tra Validation Text trường "Số điện thoại đại diện" khi nhập sai định dạng số điện thoại và lớn hơn 12 ký tự
    [Tags]    @Test_Create_Non-Balance_Supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text trường "Số điện thoại đại diện" khi nhập sai định dạng số điện thoại và lớn hơn 12 ký tự
    When Go to create non-balance supplier page
    And Enter "text" in "Số điện thoại đại diện" with "_RANDOM_"
    And Click in "Số fax" field
    Then Required message "Số điện thoại đại diện" field displayed under "Xin vui lòng chỉ nhập số"
    And Required message "Số điện thoại đại diện" field displayed under "Xin vui lòng nhập tối đa 12 ký tự số"

Create_Non-Balance_Supplier_11: Kiểm tra Validation Text trường "Số điện thoại đại diện" khi số fax nhỏ hơn 8 ký tự số
    [Tags]    @Test_Create_Non-Balance_Supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text trường "Số điện thoại đại diện" khi số fax nhỏ hơn 8 ký tự số
    When Go to create non-balance supplier page
    And Enter "phone_7" in "Số điện thoại đại diện" with "_RANDOM_"
    And Click in "Số fax" field
    Then Required message "Số điện thoại đại diện" displayed under "Xin vui lòng nhập tối thiểu 8 ký tự số" field

Create_Non-Balance_Supplier_12: Kiểm tra Validation Text trường "Số điện thoại đại diện" khi số fax lớn hơn 12 ký tự số
    [Tags]    @Test_Create_Non-Balance_Supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text trường "Số điện thoại đại diện" khi số fax lớn hơn 12 ký tự số
    When Go to create non-balance supplier page
    And Enter "phone_invalid" in "Số điện thoại đại diện" with "_RANDOM_"
    And Click in "Số fax" field
    Then Required message "Số điện thoại đại diện" displayed under "Xin vui lòng nhập tối đa 12 ký tự số" field

Create_Non-Balance_Supplier_13: Kiểm tra Validation Text trường "Số fax" khi nhập sai định dạng số fax và nhỏ hơn 8 ký tự
    [Tags]    @Test_Create_Non-Balance_Supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text trường "Số fax" khi nhập sai định dạng số fax và nhỏ hơn 8 ký tự
    When Go to create non-balance supplier page
    And Enter "text" in "Số fax" with "abcdef"
    And Click select in "Tỉnh/Thành phố"
    Then Required message "Số fax" field displayed under "Xin vui lòng chỉ nhập số"
    And Required message "Số fax" field displayed under "Xin vui lòng nhập tối thiểu 8 ký tự số"

Create_Non-Balance_Supplier_14: Kiểm tra Validation Text trường "Số fax" khi nhập sai định dạng số fax và lớn hơn 12 ký tự
    [Tags]    @Test_Create_Non-Balance_Supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text trường "Số fax" khi nhập sai định dạng số fax và lớn hơn 12 ký tự
    When Go to create non-balance supplier page
    And Enter "text" in "Số fax" with "_RANDOM_"
    And Click select in "Tỉnh/Thành phố"
    Then Required message "Số fax" field displayed under "Xin vui lòng chỉ nhập số"
    And Required message "Số fax" field displayed under "Xin vui lòng nhập tối đa 12 ký tự số"

Create_Non-Balance_Supplier_15: Kiểm tra Validation Text trường "Số fax" khi số fax nhỏ hơn 8 ký tự số
    [Tags]    @Test_Create_Non-Balance_Supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text trường "Số fax" khi số fax nhỏ hơn 8 ký tự số
    When Go to create non-balance supplier page
    And Enter "fax_7" in "Số fax" with "_RANDOM_"
    And Click select in "Tỉnh/Thành phố"
    Then Required message "Số fax" displayed under "Xin vui lòng nhập tối thiểu 8 ký tự số" field

Create_Non-Balance_Supplier_16: Kiểm tra Validation Text trường "Số fax" khi số fax lớn hơn 12 ký tự số
    [Tags]    @Test_Create_Non-Balance_Supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text trường "Số fax" khi số fax lớn hơn 12 ký tự số
    When Go to create non-balance supplier page
    And Enter "fax_invalid" in "Số fax" with "_RANDOM_"
    And Click select in "Tỉnh/Thành phố"
    Then Required message "Số fax" displayed under "Xin vui lòng nhập tối đa 12 ký tự số" field

Create_Non-Balance_Supplier_17: Kiểm tra Validation Text khi bỏ trống trường "Tỉnh/Thành phố"
    [Tags]    @Test_Create_Non-Balance_Supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text khi bỏ trống trường "Tỉnh/Thành phố"
    When Go to create non-balance supplier page
    And Click select "Tỉnh/Thành phố" with "Tỉnh Thừa Thiên Huế"
    And Delete text in "Tỉnh/Thành phố" field
    Then Required message "Tỉnh/Thành phố" displayed under "Xin vui lòng chọn tỉnh/thành phố" field

Create_Non-Balance_Supplier_18: Kiểm tra Validation Text khi bỏ trống trường "Quận/Huyện"
    [Tags]    @Test_Create_Non-Balance_Supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text khi bỏ trống trường "Quận/Huyện"
    When Go to create non-balance supplier page
    And Click select "Tỉnh/Thành phố" with "Tỉnh Thừa Thiên Huế"
    And Click select "Quận/Huyện" with "Thành phố Huế"
    And Delete text in "Quận/Huyện" field
    Then Required message "Quận/Huyện" displayed under "Xin vui lòng chọn quận/huyện" field

Create_Non-Balance_Supplier_19: Kiểm tra Validation Text khi bỏ trống trường "Phường/Xã"
    [Tags]    @Test_Create_Non-Balance_Supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text khi bỏ trống trường "Phường/Xã"
    When Go to create non-balance supplier page
    And Click select "Tỉnh/Thành phố" with "Tỉnh Thừa Thiên Huế"
    And Click select "Quận/Huyện" with "Thành phố Huế"
    And Click select "Phường/Xã" with "Phường Tây Lộc"
    And Delete text in "Phường/Xã" field
    Then Required message "Phường/Xã" displayed under "Xin vui lòng chọn phường/xã" field

Create_Non-Balance_Supplier_20: Kiểm tra Validation Text khi bỏ trống trường "Địa chỉ cụ thể"
    [Tags]    @Test_Create_Non-Balance_Supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text khi bỏ trống trường "Địa chỉ cụ thể"
    When Go to create non-balance supplier page
    And Enter "text" in "Địa chỉ cụ thể" with "${EMPTY}"
    And Click in textarea "Ghi chú" field
    Then Required message "Địa chỉ cụ thể" displayed under "Xin vui lòng nhập địa chỉ cụ thể" field

Create_Non-Balance_Supplier_21: Kiểm tra Validation Text trường "Ghi chú" khi nhập ghi chú quá 500 ký tự
    [Tags]    @Test_Create_Non-Balance_Supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text trường "Ghi chú" khi nhập ghi chú quá 500 ký tự
    When Go to create non-balance supplier page
    And Enter "word" in textarea "Ghi chú" with "_RANDOM_"
    And Click in "Địa chỉ cụ thể" field
    Then Required message "Ghi chú" displayed under "Chỉ được nhập tối đa 500 kí tự" field

###=================================ERROR MESSAGE===============================================================================================
Create_Non-Balance_Supplier_22: Kiểm tra Error Message khi tạo mới nhà cung cấp Non-Balance với "Email" đã được đăng kí trước đó
    [Tags]    @Test_Create_Non-Balance_Supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra hiển thị thông báo lỗi khi tạo mới nhà cung cấp Non-Balance với "Email" đã được đăng kí trước đó
    When Go to create non-balance supplier page
    And Enter "test name" in "Tên nhà cung cấp" with "_RANDOM_"
    And Enter "email" in "Email đại diện" with "nonsupplier@gmail.com"
    And Enter "fullname" in "Họ tên đại diện" with "_RANDOM_"
    And Enter "phone" in "Số điện thoại đại diện" with "_RANDOM_"
    And Enter "fax_valid" in "Số fax" with "_RANDOM_"
    And Enter "Địa chỉ nhà cung cấp"
    And Click "Lưu" button
    Then User look message "Email đã được đăng ký trước đó." popup

Create_Non-Balance_Supplier_23: Kiểm tra Error Message khi tạo mới nhà cung cấp Non-Balance với "Số điện thoại" đã được đăng kí trước đó
    [Tags]    @Test_Create_Non-Balance_Supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra hiển thị thông bao lỗi khi tạo mới nhà cung cấp Non-Balance với "Số điện thoại" đã được đăng kí trước đó
    When Go to create non-balance supplier page
    And Enter "test name" in "Tên nhà cung cấp" with "_RANDOM_"
    And Enter "Email" in "Email đại diện" with "_RANDOM_"
    And Enter "fullname" in "Họ tên đại diện" with "_RANDOM_"
    And Enter "phone" in "Số điện thoại đại diện" with "0941225407"
    And Enter "fax_valid" in "Số fax" with "_RANDOM_"
    And Enter "Địa chỉ nhà cung cấp"
    And Click "Lưu" button
    Then User look message "Số điện thoại đã được đăng ký trước đó." popup

Create_Non-Balance_Supplier_24: Kiểm tra Error Message khi tạo mới nhà cung cấp Non-Balance với "Số fax" đã được đăng kí trước đó
    [Tags]    @Test_Create_Non-Balance_Supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra hiển thị thông báo lỗi khi tạo mới nhà cung cấp Non-Balance với "Số fax" đã được đăng kí trước đó
    When Go to create non-balance supplier page
    And Enter "text" in "Tên nhà cung cấp" with "_RANDOM_"
    And Enter "Email" in "Email đại diện" with "_RANDOM_"
    And Enter "fullname" in "Họ tên đại diện" with "_RANDOM_"
    And Enter "phone" in "Số điện thoại đại diện" with "_RANDOM_"
    And Enter "fax_valid" in "Số fax" with "0941225407"
    And Enter "Địa chỉ nhà cung cấp"
    And Click "Lưu" button
    Then User look message "Số Fax đã được đăng kí trước đó." popup

###=========================================CREATE NON-BALANCE SUPPLIER SUCCESSFULLY=====================================================================
Create_Non-Balance_Supplier_25: Kiểm tra Successfully Message tạo mới nhà cung cấp Non-Balance thành công
    [Tags]    @Test_Create_Non-Balance_Supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Successfully Message tạo mới nhà cung cấp Non-Balance thành công
    When Go to create non-balance supplier page
    And Enter "Tên nhà cung cấp" in "Tên nhà cung cấp" with "Nhà cung cấp áo dài"
    And Enter "Email" in "Email đại diện" with "_RANDOM_"
    And Enter "fullname" in "Họ tên đại diện" with "Nguyễn Thị Lan Anh"
    And Enter "phone" in "Số điện thoại đại diện" with "_RANDOM_"
    And Enter "fax_valid" in "Số fax" with "_RANDOM_"
    And Enter "Địa chỉ nhà cung cấp"
    And Enter "paragraph" in textarea "Ghi chú" with "Chuyên cung cấp áo dài truyền thống, áo dài học sinh, áo dài lễ hội."
    And Click "Lưu" button
    Then User look message "Tạo nhà cung cấp thành công." popup

###===================ĐIỀU HƯỚNG ĐẾN TRANG "QUẢN LÝ NHÀ CUNG CẤP NON-BALANCE" TỪ TRANG "TẠO MỚI NHÀ CUNG CẤP NON-BALANCE"============================================
Create_Non-Balance_Supplier_26: Kiểm tra có thể điều hướng đến trang danh sách nhà cung cấp Non-Balance thành công
    [Tags]    @Test_Create_Non-Balance_Supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra có thể điều hướng đến trang danh sách nhà cung cấp Non-Balance thành công
    When Go to create non-balance supplier page
    And Click "Trở về" button
    Then User look title "Quản Lý NCC Bởi Cửa Hàng"
    And User look contains title is "Quản lý nhà cung cấp"

###=====================================VIEW LIST OF SUPPLIER=====================================================
Create_Non-Balance_Supplier_27: Kiểm tra hiển thị thành công danh sách nhà cung cấp đã tạo
    [Tags]    @Test_Create_Non-Balance_Supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra hiển thị thành công danh sách nhà cung cấp đã tạo
    When Go to list Non-Balance Supplier page
    Then Show list of "Non-Balance Suppliers"

Create_Non-Balance_Supplier_28: Kiểm tra việc tìm kiếm thành công khi nhập "Mã NCC" hợp lệ vào thanh tìm kiếm
    [Tags]    @Test_Create_Non-Balance_Supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra việc tìm kiếm thành công khi nhập "Mã NCC" hợp lệ vào thanh tìm kiếm
    When Go to list Non-Balance Supplier page
    And Search "text" in "Tìm kiếm" with "${Mã NCC}"
    Then Show list of "Non-Balance Suppliers"

Create_Non-Balance_Supplier_29: Kiểm tra việc tìm kiếm thành công khi nhập "Tên nhà cung cấp" hợp lệ vào thanh tìm kiếm
    [Tags]    @Test_Create_Non-Balance_Supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra việc tìm kiếm thành công khi nhập "Tên nhà cung cấp" hợp lệ vào thanh tìm kiếm
    When Go to list Non-Balance Supplier page
    And Search "text" in "Tìm kiếm" with "${Tên nhà cung cấp}"
    Then Show list of "Non-Balance Suppliers"

Create_Non-Balance_Supplier_30: Kiểm tra việc tìm kiếm thành công khi nhập "Tên quản lý" hợp lệ vào thanh tìm kiếm
    [Tags]    @Test_Create_Non-Balance_Supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra việc tìm kiếm thành công khi nhập "Tên quản lý" hợp lệ vào thanh tìm kiếm
    When Go to list Non-Balance Supplier page
    And Search "text" in "Tìm kiếm" with "${Tên quản lý}"
    Then Show list of "Non-Balance Suppliers"

Create_Non-Balance_Supplier_31: Kiểm tra việc tìm kiếm thành công khi nhập "Số điện thoại" hợp lệ vào thanh tìm kiếm
    [Tags]    @Test_Create_Non-Balance_Supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra việc tìm kiếm thành công khi nhập "Số điện thoại" hợp lệ vào thanh tìm kiếm
    When Go to list Non-Balance Supplier page
    And Search "text" in "Tìm kiếm" with "${Số điện thoại}"
    Then Show list of "Non-Balance Suppliers"

Create_Non-Balance_Supplier_32: Kiểm tra việc tìm kiếm không thành công khi nhập "Mã NCC" không hợp lệ vào thanh tìm kiếm
    [Tags]    @Test_Create_Non-Balance_Supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]       Kiểm tra việc tìm kiếm không thành công khi nhập "Mã NCC" không hợp lệ vào thanh tìm kiếm
    When Go to list Non-Balance Supplier page
    And Search "name code" in "Tìm kiếm" with "_RANDOM_"
    Then No Non-Balance Supplier are shown

Create_Non-Balance_Supplier_33: Kiểm tra việc tìm kiếm không thành công khi nhập "Số điện thoại" không hợp lệ vào thanh tìm kiếm
    [Tags]    @Test_Create_Non-Balance_Supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra việc tìm kiếm không thành công khi nhập "Số điện thoại" không hợp lệ vào thanh tìm kiếm
    When Go to list Non-Balance Supplier page
    And Search "phone" in "Tìm kiếm" with "_RANDOM_"
    Then No Non-Balance Supplier are shown

Create_Non-Balance_Supplier_34: Kiểm tra việc tìm kiếm không thành công khi nhập "Keyword" không hợp lệ vào thanh tìm kiếm
    [Tags]    @Test_Create_Non-Balance_Supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]      Kiểm tra việc tìm kiếm không thành công khi nhập "Keyword" không hợp lệ vào thanh tìm kiếm
    When Go to list Non-Balance Supplier page
    And Search "text" in "Tìm kiếm" with "_RANDOM_"
    Then No Non-Balance Supplier are shown

Create_Non-Balance_Supplier_35: Kiểm tra có thể xem danh sách nhà cung cấp Non-Balance trang kế tiếp, trước trước, trang cuối cùng, trang đầu tiên
    [Tags]    @Test_Create_Non-Balance_Supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra có thể xem danh sách nhà cung cấp Non-Balance trang kế tiếp, trước trước, trang cuối cùng, trang đầu tiên
    When Go to list Non-Balance Supplier page
    And Click ">" to "next" page
    Then Show list of "Non-Balance Suppliers"
    And Click "<" to "prev" page
    Then Show list of "Non-Balance Suppliers"
    And Click ">>" to "next_all" page
    Then Show list of "Non-Balance Suppliers"
    And Click "<<" to "prev_all" page
    Then Show list of "Non-Balance Suppliers"

###=========================ĐIỀU HƯỚNG ĐẾN TRANG "CHỈNH SỬA THÔNG TIN NHÀ CUNG CẤP"========================================================
Edit_Non-Balance_Supplier_01: Kiểm tra có thể điều hướng đến trang chỉnh sửa thông tin nhà cung cấp
    [Tags]    @Test_Edit_Non-Balance_Supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra có thể điều hướng đến trang chỉnh sửa thông tin nhà cung cấp
    When Click "Quản lý NCC" menu
    And Click "Non-Balance" tab button
    And Select Non-Balance Supplier need to edit
    Then User look title "Quản Lý Nhà Cung Cấp"
    And User look contains title is "Chi tiết nhà cung cấp"

###==================================VALIDATION TEXT==========================================================
Edit_Non-Balance_Supplier_02: Kiểm tra Validation Text khi bỏ trống trường "Tên nhà cung cấp"
    [Tags]    @Test_Edit_Non-Balance_Supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text khi bỏ trống trường "Tên nhà cung cấp"
    When Go to edit non-balance supplier page
    And Enter "text" in "Tên nhà cung cấp" with "${EMPTY}"
    And Click in "Email đại diện" field
    Then Required message "Tên nhà cung cấp" displayed under "Xin vui lòng nhập tên nhà cung cấp" field

Edit_Non-Balance_Supplier_03: Kiểm tra Validation Text khi bỏ trống trường "Email đại diện"
    [Tags]    @Test_Edit_Non-Balance_Supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text khi bỏ trống trường "Email đại diện"
    When Go to edit non-balance supplier page
    And Enter "text" in "Email đại diện" with "${EMPTY}"
    And Click in "Họ tên đại diện" field
    Then Required message "Email đại diện" displayed under "Xin vui lòng nhập email" field

Edit_Non-Balance_Supplier_04: Kiểm tra Validation Text trường "Email đại diện" khi nhập sai định dạng email
    [Tags]    @Test_Edit_Non-Balance_Supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text trường "Email đại diện" khi nhập sai định dạng email
    When Go to edit non-balance supplier page
    And Enter "text" in "Email đại diện" with "_RANDOM_"
    And Click in "Họ tên đại diện" field
    Then Required message "Email đại diện" displayed under "Vui lòng nhập địa chỉ email hợp lệ!" field

Edit_Non-Balance_Supplier_05: Kiểm tra Validation text khi bỏ trống trường "Họ tên đại diện"
    [Tags]    @Test_Edit_Non-Balance_Supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation text khi bỏ trống trường "Họ tên đại diện"
    When Go to edit non-balance supplier page
    And Enter "text" in "Họ tên đại diện" with "${EMPTY}"
    And Click in "Số điện thoại đại diện" field
    Then Required message "Họ tên đại diện" displayed under "Xin vui lòng nhập họ và tên quản lý" field

Edit_Non-Balance_Supplier_06: Kiểm tra Validation text tại trường "Họ tên đại diện" khi nhập Họ tên đại diện không hợp lệ
    [Tags]    @Test_Edit_Non-Balance_Supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation text tại trường "Họ tên đại diện" khi nhập Họ tên đại diện không hợp lệ
    When Go to edit non-balance supplier page
    And Enter "text" in "Họ tên đại diện" with "_RANDOM_"
    And Click in "Số điện thoại đại diện" field
    Then Required message "Họ tên đại diện" displayed under "Vui lòng chỉ nhập chữ" field

Edit_Non-Balance_Supplier_07: Kiểm tra Validation Text trường khi bỏ trống trường "Số điện thoại"
    [Tags]    @Test_Edit_Non-Balance_Supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text trường khi bỏ trống trường "Số điện thoại"
    When Go to edit non-balance supplier page
    And Enter "text" in "Số điện thoại đại diện" with "${EMPTY}"
    And Click in "Số fax" field
    Then Required message "Số điện thoại đại diện" displayed under "Xin vui lòng nhập số điện thoại đại diện" field

Edit_Non-Balance_Supplier_08: Kiểm tra Validation Text trường "Số điện thoại đại diện" khi nhập sai định dạng số điện thoại và nhỏ hơn 8 ký tự
    [Tags]    @Test_Edit_Non-Balance_Supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text trường "Số điện thoại đại diện" khi nhập sai định dạng số điện thoại và nhỏ hơn 8 ký tự
    When Go to edit non-balance supplier page
    And Enter "text" in "Số điện thoại đại diện" with "abcdef"
    And Click in "Số fax" field
    Then Required message "Số điện thoại đại diện" field displayed under "Xin vui lòng chỉ nhập số"
    And Required message "Số điện thoại đại diện" field displayed under "Xin vui lòng nhập tối thiểu 8 ký tự số"

Edit_Non-Balance_Supplier_09: Kiểm tra Validation Text trường "Số điện thoại đại diện" khi nhập sai định dạng số điện thoại và lớn hơn 12 ký tự
    [Tags]    @Test_Edit_Non-Balance_Supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text trường "Số điện thoại đại diện" khi nhập sai định dạng số điện thoại và lớn hơn 12 ký tự
    When Go to edit non-balance supplier page
    And Enter "text" in "Số điện thoại đại diện" with "_RANDOM_"
    And Click in "Số fax" field
    Then Required message "Số điện thoại đại diện" field displayed under "Xin vui lòng chỉ nhập số"
    And Required message "Số điện thoại đại diện" field displayed under "Xin vui lòng nhập tối đa 12 ký tự số"

Edit_Non-Balance_Supplier_10: Kiểm tra Validation Text trường "Số điện thoại đại diện" khi số fax nhỏ hơn 8 ký tự số
    [Tags]    @Test_Edit_Non-Balance_Supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text trường "Số điện thoại đại diện" khi số fax nhỏ hơn 8 ký tự số
    When Go to edit non-balance supplier page
    And Enter "phone_7" in "Số điện thoại đại diện" with "_RANDOM_"
    And Click in "Số fax" field
    Then Required message "Số điện thoại đại diện" displayed under "Xin vui lòng nhập tối thiểu 8 ký tự số" field

Edit_Non-Balance_Supplier_11: Kiểm tra Validation Text trường "Số điện thoại đại diện" khi số fax lớn hơn 12 ký tự số
    [Tags]    @Test_Edit_Non-Balance_Supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text trường "Số điện thoại đại diện" khi số fax lớn hơn 12 ký tự số
    When Go to edit non-balance supplier page
    And Enter "phone_invalid" in "Số điện thoại đại diện" with "_RANDOM_"
    And Click in "Số fax" field
    Then Required message "Số điện thoại đại diện" displayed under "Xin vui lòng nhập tối đa 12 ký tự số" field

Edit_Non-Balance_Supplier_12: Kiểm tra Validation Text trường "Số fax" khi nhập sai định dạng số fax và nhỏ hơn 8 ký tự số
    [Tags]    @Test_Edit_Non-Balance_Supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text trường "Số fax" khi nhập sai định dạng số fax và nhỏ hơn 8 ký tự số
    When Go to edit non-balance supplier page
    And Enter "text" in "Số fax" with "abcdef"
    And Click select in "Tỉnh/Thành phố"
    Then Required message "Số fax" field displayed under "Xin vui lòng chỉ nhập số"
    And Required message "Số fax" field displayed under "Xin vui lòng nhập tối thiểu 8 ký tự số"

Edit_Non-Balance_Supplier_13: Kiểm tra Validation Text trường "Số fax" khi nhập sai định dạng số fax và lớn hơn 12 ký tự
    [Tags]    @Test_Edit_Non-Balance_Supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text trường "Số fax" khi nhập sai định dạng số fax và lớn hơn 12 ký tự
    When Go to edit non-balance supplier page
    And Enter "text" in "Số fax" with "_RANDOM_"
    And Click select in "Tỉnh/Thành phố"
    Then Required message "Số fax" field displayed under "Xin vui lòng chỉ nhập số"
    And Required message "Số fax" field displayed under "Xin vui lòng nhập tối đa 12 ký tự số"

Edit_Non-Balance_Supplier_14: Kiểm tra Validation Text trường "Số fax" khi số fax nhỏ hơn 8 ký tự số
    [Tags]    @Test_Edit_Non-Balance_Supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text trường "Số fax" khi số fax nhỏ hơn 8 ký tự số
    When Go to edit non-balance supplier page
    And Enter "fax_7" in "Số fax" with "_RANDOM_"
    And Click select in "Tỉnh/Thành phố"
    Then Required message "Số fax" displayed under "Xin vui lòng nhập tối thiểu 8 ký tự số" field

Edit_Non-Balance_Supplier_15: Kiểm tra Validation Text trường "Số fax" khi số fax lớn hơn 12 ký tự số
    [Tags]    @Test_Edit_Non-Balance_Supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text trường "Số fax" khi số fax lớn hơn 12 ký tự số
    When Go to edit non-balance supplier page
    And Enter "fax_invalid" in "Số fax" with "_RANDOM_"
    And Click select in "Tỉnh/Thành phố"
    Then Required message "Số fax" displayed under "Xin vui lòng nhập tối đa 12 ký tự số" field

Edit_Non-Balance_Supplier_16: Kiểm tra Validation Text khi bỏ trống trường "Tỉnh/Thành phố"
    [Tags]    @Test_Edit_Non-Balance_Supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text khi bỏ trống trường "Tỉnh/Thành phố"
    When Go to edit non-balance supplier page
    And Delete text in "Tỉnh/Thành phố" field
    Then Required message "Tỉnh/Thành phố" displayed under "Xin vui lòng chọn tỉnh/thành phố" field

Edit_Non-Balance_Supplier_17: Kiểm tra Validation Text khi bỏ trống trường "Quận/Huyện"
    [Tags]    @Test_Edit_Non-Balance_Supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text khi bỏ trống trường "Quận/Huyện"
    When Go to edit non-balance supplier page
    And Delete text in "Quận/Huyện" field
    Then Required message "Quận/Huyện" displayed under "Xin vui lòng chọn quận/huyện" field

Edit_Non-Balance_Supplier_18: Kiểm tra Validation Text khi bỏ trống trường "Phường/Xã"
    [Tags]    @Test_Edit_Non-Balance_Supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text khi bỏ trống trường "Phường/Xã"
    When Go to edit non-balance supplier page
    And Delete text in "Phường/Xã" field
    Then Required message "Phường/Xã" displayed under "Xin vui lòng chọn phường/xã" field

Edit_Non-Balance_Supplier_19: Kiểm tra Validation Text khi bỏ trống trường "Địa chỉ cụ thể"
    [Tags]    @Test_Edit_Non-Balance_Supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text khi bỏ trống trường "Địa chỉ cụ thể"
    When Go to edit non-balance supplier page
    And Enter "text" in "Địa chỉ cụ thể" with "${EMPTY}"
    And Click in textarea "Ghi chú" field
    Then Required message "Địa chỉ cụ thể" displayed under "Xin vui lòng nhập địa chỉ cụ thể" field

Edit_Non-Balance_Supplier_20: Kiểm tra Validation Text trường "Ghi chú" khi nhập ghi chú quá 500 ký tự
    [Tags]    @Test_Edit_Non-Balance_Supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text trường "Ghi chú" khi nhập ghi chú quá 500 ký tự
    When Go to edit non-balance supplier page
    And Enter "word" in textarea "Ghi chú" with "_RANDOM_"
    And Click in "Địa chỉ cụ thể" field
    Then Required message "Ghi chú" displayed under "Chỉ được nhập tối đa 500 kí tự" field

###=================================ERROR MESSAGE===============================================================================================
Edit_Non-Balance_Supplier_21: Kiểm tra Error Message khi chỉnh sửa nhà cung cấp Non-Balance với Email đã được đăng kí trước đó
    [Tags]    @Test_Edit_Non-Balance_Supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra hiển thị thông báo lỗi khi chỉnh sửa nhà cung cấp Non-Balance với "Email" đã được đăng kí trước đó
    When Go to edit Non-Balance Supplier page
    And Enter "email" in "Email đại diện" with "${Email}"
    And Click "Lưu" button
    Then User look message "Email này đã tồn tại, vui lòng nhập email khác." popup

Edit_Non-Balance_Supplier_22: Kiểm tra Error Message khi chỉnh sửa nhà cung cấp Non-Balance với Số điện thoại đã được đăng kí trước đó
    [Tags]    @Testcase Failed
    [Documentation]     Kiểm tra hiển thị thông báo lỗi khi chỉnh sửa nhà cung cấp Non-Balance với "Số điện thoại" đã được đăng kí trước đó
    When Go to edit Non-Balance Supplier page
    When Enter "phone" in "Số điện thoại đại diện" with "${Số điện thoại}"
    And Click "Lưu" button
    Then User look message "Số điện thoại đã được đăng ký trước đó." popup

Edit_Non-Balance_Supplier_23: Kiểm tra Error Message khi chỉnh sửa nhà cung cấp Non-Balance với Số fax đã được đăng kí trước đó
    [Tags]    @Test_Edit_Non-Balance_Supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm trahiển thị thông báo lỗi khi chỉnh sửa nhà cung cấp Non-Balance với "Số fax" đã được đăng kí trước đó
    When Go to edit Non-Balance Supplier page
    When Enter "fax_valid" in "Số fax" with "${Số fax}"
    And Click "Lưu" button
    Then User look message "Số Fax đã được đăng kí trước đó." popup

##=======================EDIT NON-BALANCE SUPPLIER SUCCESSFULLY================================================
Edit_Non-Balance_Supplier_24: Kiểm tra chỉnh sửa thông tin nhà cung cấp Non-Balance thành công khi thay đổi "Tên nhà cung cấp"
    [Tags]    @Test_Edit_Non-Balance_Supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra chỉnh sửa thông tin nhà cung cấp Non-Balance thành công khi thay đổi "Tên nhà cung cấp"
    When Go to edit Non-Balance Supplier page
    And Enter "text" in "Tên nhà cung cấp" with "Nhà cung cấp thiết bị điện tử"
    And Click "Lưu" button
    Then User look message "Chỉnh sửa nhà cung cấp thành công." popup

Edit_Non-Balance_Supplier_25: Kiểm tra chỉnh sửa thông tin nhà cung cấp Non-Balance thành công khi thay đổi "Số fax"
    [Tags]    @Test_Edit_Non-Balance_Supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra chỉnh sửa thông tin nhà cung cấp Non-Balance thành công khi thay đổi "Số fax"
    When Go to edit Non-Balance Supplier page
    And Enter "fax_valid" in "Số fax" with "_RANDOM_"
    And Click "Lưu" button
    Then User look message "Chỉnh sửa nhà cung cấp thành công." popup

Edit_Non-Balance_Supplier_26: Kiểm tra chỉnh sửa thông tin nhà cung cấp Non-Balance thành công khi thay đổi "Địa chỉ cửa hàng"
    [Tags]    @Test_Edit_Non-Balance_Supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra chỉnh sửa thông tin nhà cung cấp Non-Balance thành công khi thay đổi "Địa chỉ cửa hàng"
    When Go to edit Non-Balance Supplier page
    And Delete text in "Tỉnh/Thành phố" field
    And Click select "Tỉnh/Thành phố" with "Tỉnh Quảng Trị"
    And Click select "Quận/Huyện" with "Thị xã Quảng Trị"
    And Click select "Phường/Xã" with "Xã Hải Lệ"
    And Enter "number" in "Địa chỉ cụ thể" with "_RANDOM_"
    And Click "Lưu" button
    Then User look message "Chỉnh sửa nhà cung cấp thành công." popup

Edit_Non-Balance_Supplier_27: Kiểm tra chỉnh sửa thông tin nhà cung cấp Non-Balance thành công khi thay đổi "Họ tên người đại diện"
    [Tags]    @Test_Edit_Non-Balance_Supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra chỉnh sửa thông tin nhà cung cấp Non-Balance thành công khi thay đổi "Họ tên người đại diện"
    When Go to edit Non-Balance Supplier page
    And Enter "fullname" in "Họ tên đại diện" with "Trường Thế Vinh"
    And Click "Lưu" button
    Then User look message "Chỉnh sửa nhà cung cấp thành công." popup

Edit_Non-Balance_Supplier_28: Kiểm tra chỉnh sửa thông tin nhà cung cấp Non-Balance thành công khi thay đổi "Số điện thoại người đại diện"
    [Tags]    @Test_Edit_Non-Balance_Supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra chỉnh sửa thông tin nhà cung cấp Non-Balance thành công khi thay đổi "Số điện thoại người đại diện"
    When Go to edit Non-Balance Supplier page
    And Enter "phone" in "Số điện thoại đại diện" with "_RANDOM_"
    And Click "Lưu" button
    Then User look message "Chỉnh sửa nhà cung cấp thành công." popup

Edit_Non-Balance_Supplier_29: Kiểm tra chỉnh sửa thông tin nhà cung cấp Non-Balance thành công khi thay đổi "Email người đại diện"
    [Tags]    @Test_Edit_Non-Balance_Supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra chỉnh sửa thông tin nhà cung cấp Non-Balance thành công khi thay đổi "Email người đại diện"
    When Go to edit Non-Balance Supplier page
    And Enter "Email" in "Email đại diện" with "_RANDOM_"
    And Click "Lưu" button
    Then User look message "Chỉnh sửa nhà cung cấp thành công." popup

Edit_Non-Balance_Supplier_30: Kiểm tra chỉnh sửa thông tin nhà cung cấp Non-Balance thành công khi thay đổi "Ghi chú"
    [Tags]    @Test_Edit_Non-Balance_Supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra chỉnh sửa thông tin nhà cung cấp Non-Balance thành công khi thay đổi "Ghi chú"
    When Go to edit Non-Balance Supplier page
    And Enter "paragraph" in textarea "Ghi chú" with "Chuyển cung cấp thiết bị điện tử, sửa chữa, lắp đặt thiết bị điện."
    And Click "Lưu" button
    Then User look message "Chỉnh sửa nhà cung cấp thành công." popup

Edit_Non-Balance_Supplier_31: Kiểm tra điều hướng đến trang “Quản lý nhà cung cấp Non-Balance” từ trang “Chỉnh sửa nhà cung cấp Non-Balance”
    [Tags]    @Test_Edit_Non-Balance_Supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra điều hướng đến trang “Quản lý nhà cung cấp Non-Balance” từ trang “Chỉnh sửa nhà cung cấp Non-Balance”
    When Go to edit Non-Balance Supplier page
    And Click "Trở về" button
    Then User look title "Quản Lý NCC Bởi Cửa Hàng"
    And User look contains title is "Quản lý nhà cung cấp"

*** Keywords ***
Preconditions
  Set Browser Timeout         ${BROWSER_TIMEOUT}
  New Browser                 ${BROWSER}  headless=${HEADLESS}
  New Page                    ${URL_DEFAULT}
  ${STATE}                    Evaluate  json.loads('''{}''')  json
  Login to Store

Go to ${name} Non-Balance Supplier page
  When Click "Quản lý NCC" menu
  And Click "Non-Balance" tab button
  IF  '${name}' == 'create'
      And Click "Thêm nhà cung cấp" button
  ELSE IF  '${name}' == 'edit'
      And Select Non-Balance Supplier need to edit
  END

Select Non-Balance Supplier need to edit
    Search "text" in "Tìm kiếm" with "${edit_nonbalance}"
    ${element}    Set Variable   //td[contains(text(),'${edit_nonbalance}')]
    Click         ${element}        left        2

User look tab menu "${menu}"
  Element Text Should Be    //div[contains(text(),'${menu}')]     ${menu}

Click select in "${name}"
    ${element}=               Get Element Form Item By Name     ${name}                       //*[contains(@class, "ant-select-show-arrow")]
    Wait Until Element Is Visible    ${element}
    Click                     ${element}

Enter "Địa chỉ nhà cung cấp"
    And Click select "Tỉnh/Thành phố" with "Tỉnh Thừa Thiên Huế"
    And Click select "Quận/Huyện" with "Huyện Phú Vang"
    And Click select "Phường/Xã" with "Xã Phú An"
    And Enter "text" in "Địa chỉ cụ thể" with "_RANDOM_"

Show list of "Non-Balance Suppliers"
    Wait Until Element Spin
    ${elements}=        Get Elements        xpath=//*[contains(@class, "ant-table-row")]
    Run Keyword If    ${elements}     Display     ${elements}
    ...    ELSE    Log To Console     Không tồn tại nhà cung cấp non-balance nào!
Display
    [Arguments]    ${name}    ${elements}
    Log To Console      *************************-DANH SÁCH NHÀ CUNG CẤP NON-BALANCE-**************************
    Wait Until Element Is Visible         ${elements}[0]
    ${count}=           Set Variable        1
    ${stt}=             Set Variable        1
    FOR  ${i}  IN  @{elements}
        ${Mã NCC}               Get Text        //tbody/tr[${count}]/td[1]
        ${Tên NCC}              Get Text        //tbody/tr[${count}]/td[2]
        ${Địa chỉ}              Get Text        //tbody/tr[${count}]/td[3]
        ${Người đại diện}       Get Text        //tbody/tr[${count}]/td[4]
        ${Số điện thoại}        Get Text        //tbody/tr[${count}]/td[5]
        Log To Console    ${stt}. Mã NCC: ${Mã NCC} | Tên nhà cung cấp: ${Tên NCC} | Địa chỉ: ${Địa chỉ} | Tên quản lý: ${Người đại diện} | Số điện thoại: ${Số điện thoại}
        Log To Console    ================================================================================================================================================================================
        ${count}=    Evaluate    ${count} + 1
        ${stt}=    Evaluate    ${stt} + 1
    END
    ${total}=    Evaluate    ${count} - 1
    Log To Console    Tổng số lượng nhà cung cấp non-balance là: ${total}
