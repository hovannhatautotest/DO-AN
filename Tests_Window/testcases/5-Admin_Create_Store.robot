*** Settings ***
Resource            ../keywords/common.robot
Test Setup          Preconditions
Test Teardown       Tear Down

*** Test Cases ***
##=========================ĐIỀU HƯỚNG ĐẾN TRANG "THÊM CỬA HÀNG"========================================================
Create_Store_01: Kiểm tra có thể điều hướng đến trang thêm mới cửa hàng
    [Tags]    @Test_create_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra có thể điều hướng đến trang thêm mới cửa hàng
    When Click "Quản lý cửa hàng" menu
    And Click "Thêm cửa hàng" button
    Then User look title "Quản Lý Cửa Hàng"
    And User look contains title is "Thêm cửa hàng"

#=========================VALIDATION TEXT IN "THÊM CỬA HÀNG" PAGE========================================================
Create_Store_02: Kiểm tra Validation Text khi không nhập thông tin nào cả
    [Tags]    @Test_create_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation Text khi không nhập thông tin nào cả
    When Go to create store page
    And Click "Lưu" button
    Then Required message "Tên cửa hàng" displayed under "Xin vui lòng nhập tên cửa hàng" field
    And Required message "Tỉnh/Thành phố" displayed under "Xin vui lòng chọn tỉnh/thành phố" field
    And Required message "Quận/Huyện" displayed under "Xin vui lòng chọn quận/huyện" field
    And Required message "Phường/Xã" displayed under "Xin vui lòng chọn phường/xã" field
    And Required message "Địa chỉ cụ thể" displayed under "Xin vui lòng nhập địa chỉ cụ thể" field
    And Required message "Họ tên đại diện" displayed under "Xin vui lòng nhập họ tên đại diện" field
    And Required message "Số điện thoại đại diện" displayed under "Xin vui lòng nhập số điện thoại đại diện" field
    And Required message "Email đại diện" displayed under "Xin vui lòng nhập email đại diện" field

Create_Store_03: Kiểm tra Validation Text trường "Số fax" khi nhập sai định dạng số fax và nhỏ hơn 8 ký tự
    [Tags]    @Test_create_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text trường "Số fax" khi nhập sai định dạng số fax và nhỏ hơn 8 ký tự
    When Go to create store page
    And Enter "text" in "Số fax" with "abcdef"
    And Click in "Tên cửa hàng" field
    Then Required message "Số fax" field displayed under "Xin vui lòng chỉ nhập số"
    And Required message "Số fax" field displayed under "Xin vui lòng nhập tối thiểu 8 ký tự số"

Create_Store_04: Kiểm tra Validation Text trường "Số fax" khi nhập sai định dạng số fax và lớn hơn 12 ký tự
    [Tags]    @Test_create_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text trường "Số fax" khi nhập sai định dạng số fax và lớn hơn 12 ký tự
    When Go to create store page
    And Enter "text" in "Số fax" with "_RANDOM_"
    And Click in "Tên cửa hàng" field
    Then Required message "Số fax" field displayed under "Xin vui lòng chỉ nhập số"
    And Required message "Số fax" field displayed under "Xin vui lòng nhập tối đa 12 ký tự số"

Create_Store_05: Kiểm tra Validation Text trường "Số fax" khi số fax nhỏ hơn 8 ký tự số
    [Tags]    @Test_create_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation Text trường "Số fax" khi số fax nhỏ hơn 8 ký tự số
    When Go to create store page
    And Enter "fax_7" in "Số fax" with "_RANDOM_"
    And Click in "Tên cửa hàng" field
    Then Required message "Số fax" displayed under "Xin vui lòng nhập tối thiểu 8 ký tự số" field

Create_Store_06: Kiểm tra Validation Text trường "Số fax" khi số fax lớn hơn 12 ký tự số
    [Tags]    @Test_create_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation Text trường "Số fax" khi số fax lớn hơn 12 ký tự số
    When Go to create store page
    And Enter "fax_invalid" in "Số fax" with "_RANDOM_"
    And Click in "Tên cửa hàng" field
    Then Required message "Số fax" displayed under "Xin vui lòng nhập tối đa 12 ký tự số" field

Create_Store_07: Kiểm tra Validation Text khi bỏ trống trường "Tỉnh/Thành phố"
    [Tags]    @Test_create_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation Text khi bỏ trống trường "Tỉnh/Thành phố"
    When Go to create store page
    And Click select "Tỉnh/Thành phố" with "Tỉnh Thừa Thiên Huế"
    And Delete text in "Tỉnh/Thành phố" field
    Then Required message "Tỉnh/Thành phố" displayed under "Xin vui lòng chọn tỉnh/thành phố" field

Create_Store_08: Kiểm tra Validation Text khi bỏ trống trường "Quận/Huyện"
    [Tags]    @Test_create_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation Text khi bỏ trống trường "Quận/Huyện"
    When Go to create store page
    And Click select "Tỉnh/Thành phố" with "Tỉnh Thừa Thiên Huế"
    And Click select "Quận/Huyện" with "Thành phố Huế"
    And Delete text in "Quận/Huyện" field
    Then Required message "Quận/Huyện" displayed under "Xin vui lòng chọn quận/huyện" field

Create_Store_09: Kiểm tra Validation Text khi bỏ trống trường "Phường/Xã"
    [Tags]    @Test_create_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation Text khi bỏ trống trường "Phường/Xã"
    When Go to create store page
    And Click select "Tỉnh/Thành phố" with "Tỉnh Thừa Thiên Huế"
    And Click select "Quận/Huyện" with "Thành phố Huế"
    And Click select "Phường/Xã" with "Phường Tây Lộc"
    And Delete text in "Phường/Xã" field
    Then Required message "Phường/Xã" displayed under "Xin vui lòng chọn phường/xã" field

Create_Store_10: Kiểm tra Validation Text khi bỏ trống trường "Địa chỉ cụ thể"
    [Tags]    @Test_create_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation Text khi bỏ trống trường "Địa chỉ cụ thể"
    When Go to create store page
    And Enter "text" in "Địa chỉ cụ thể" with "${empty}"
    And Click in "Họ tên đại diện" field
    Then Required message "Địa chỉ cụ thể" displayed under "Xin vui lòng nhập địa chỉ cụ thể" field

Create_Store_11: Kiểm tra Validation text khi bỏ trống trường "Họ tên đại diện"
    [Tags]    @Test_create_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation text khi bỏ trống trường "Họ tên đại diện"
    When Go to create store page
    And Enter "text" in "Họ tên đại diện" with "${empty}"
    And Click in "Số điện thoại đại diện" field
    Then Required message "Họ tên đại diện" displayed under "Xin vui lòng nhập họ tên đại diện" field

Create_Store_12: Kiểm tra Validation text tại trường "Họ tên đại diện" khi nhập Họ tên đại diện không hợp lệ
    [Tags]    @Test_create_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation text tại trường "Họ tên đại diện" khi nhập Họ tên đại diện không hợp lệ
    When Go to create store page
    And Enter "text" in "Họ tên đại diện" with "_RANDOM_"
    And Click in "Số điện thoại đại diện" field
    Then Required message "Họ tên đại diện" displayed under "Vui lòng chỉ nhập chữ" field

Create_Store_13: Kiểm tra Validation Text khi bỏ trống trường "Số điện thoại đại diện"
    [Tags]    @Test_create_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation Text khi bỏ trống trường "Số điện thoại đại diện"
    When Go to create store page
    And Enter "text" in "Số điện thoại đại diện" with "${empty}"
    And Click in "Email đại diện" field
    Then Required message "Số điện thoại đại diện" displayed under "Xin vui lòng nhập số điện thoại đại diện" field

Create_Store_14: Kiểm tra Validation Text trường "Số điện thoại đại diện" khi nhập sai định dạng số điện thoại và nhỏ hơn 8 ký tự
    [Tags]    @Test_create_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text trường "Số điện thoại đại diện" khi nhập sai định dạng số điện thoại và nhỏ hơn 8 ký tự
    When Go to create store page
    And Enter "text" in "Số điện thoại đại diện" with "abcdef"
    And Click in "Email đại diện" field
    Then Required message "Số điện thoại đại diện" field displayed under "Xin vui lòng chỉ nhập số"
    And Required message "Số điện thoại đại diện" field displayed under "Xin vui lòng nhập tối thiểu 8 ký tự số"

Create_Store_15: Kiểm tra Validation Text trường "Số điện thoại đại diện" khi nhập sai định dạng số điện thoại và lớn hơn 12 ký tự
    [Tags]    @Test_create_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text trường "Số điện thoại đại diện" khi nhập sai định dạng số điện thoại và lớn hơn 12 ký tự
    When Go to create store page
    And Enter "text" in "Số điện thoại đại diện" with "_RANDOM_"
    And Click in "Email đại diện" field
    Then Required message "Số điện thoại đại diện" field displayed under "Xin vui lòng chỉ nhập số"
    And Required message "Số điện thoại đại diện" field displayed under "Xin vui lòng nhập tối đa 12 ký tự số"

Create_Store_16: Kiểm tra Validation Text trường "Số điện thoại đại diện" khi số điện thoại nhỏ hơn 8 ký tự số
    [Tags]    @Test_create_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation Text trường "Số điện thoại đại diện" khi số điện thoại nhỏ hơn 8 ký tự số
    When Go to create store page
    And Enter "phone_7" in "Số điện thoại đại diện" with "_RANDOM_"
    And Click in "Email đại diện" field
    Then Required message "Số điện thoại đại diện" displayed under "Xin vui lòng nhập tối thiểu 8 ký tự số" field

Create_Store_17: Kiểm tra Validation Text trường "Số điện thoại đại diện" khi số điện thoại lớn hơn 12 ký tự số
    [Tags]    @Test_create_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text trường "Số điện thoại đại diện" khi số điện thoại lớn hơn 12 ký tự số
    When Go to create store page
    And Enter "phone_invalid" in "Số điện thoại đại diện" with "_RANDOM_"
    And Click in "Email đại diện" field
    Then Required message "Số điện thoại đại diện" displayed under "Xin vui lòng nhập tối đa 12 ký tự số" field

Create_Store_18: Kiểm tra Validation Text khi bỏ trống trường "Email đại diện"
    [Tags]    @Test_create_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text khi bỏ trống trường "Email đại diện"
    When Go to create store page
    And Enter "text" in "Email đại diện" with "${empty}"
    And Click in "Số điện thoại đại diện" field
    Then Required message "Email đại diện" displayed under "Xin vui lòng nhập email đại diện" field

Create_Store_19: Kiểm tra Validation Text trường "Email đại diện" khi nhập sai định dạng email
    [Tags]    @Test_create_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text trường "Email đại diện" khi nhập sai định dạng email
    When Go to create store page
    And Enter "text" in "Email đại diện" with "_RANDOM_"
    And Click in "Số điện thoại đại diện" field
    Then Required message "Email đại diện" displayed under "Vui lòng nhập địa chỉ email hợp lệ!" field

Create_Store_20: Kiểm tra Validation Text trường "Ghi chú" khi nhập ghi chú quá 500 ký tự
    [Tags]    @Test_create_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]     iểm tra Validation Text trường "Ghi chú" khi nhập ghi chú quá 500 ký tự
    When Go to create store page
    And Enter "word" in textarea "Ghi chú" with "_RANDOM_"
    And Click in "Số điện thoại đại diện" field
    Then Required message "Ghi chú" displayed under "Chỉ được nhập tối đa 500 kí tự" field

##=================================VALIDATION TEXT IN KIOTVIET================================================================================
Create_Store_21: Kiểm tra Validation Text trường "client_id" khi không nhập client_id
    [Tags]    @Test_create_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text trường "client_id" khi không nhập client_id
    When Go to create store page
    And Click switch "Kết nối KiotViet" to be activated
    And Enter "text" in "client_id" with "${empty}"
    And Click in "client_secret" field
    Then Required message "client_id" displayed under "Xin vui lòng nhập client_id" field

Create_Store_22: Kiểm tra Validation Text trường "client_secret" khi không nhập client_secret
    [Tags]    @Test_create_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text trường "client_secret" khi không nhập client_secret
    When Go to create store page
    And Click switch "Kết nối KiotViet" to be activated
    And Enter "text" in "client_secret" with "${empty}"
    And Click in "client_id" field
    Then Required message "client_secret" displayed under "Xin vui lòng nhập client_secret" field

Create_Store_23: Kiểm tra Validation Text trường "retailer" khi không nhập retailer
    [Tags]    @Test_create_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text trường "retailer" khi không nhập retailer
    When Go to create store page
    And Click switch "Kết nối KiotViet" to be activated
    And Enter "text" in "retailer" with "${empty}"
    And Click in "client_id" field
    Then Required message "retailer" displayed under "Xin vui lòng nhập retailer" field

Create_Store_24: Kiểm tra Validation Text trường "branchId" không nhập branchId
    [Tags]    @Test_create_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text trường "branchId" không nhập branchId
    When Go to create store page
    And Click switch "Kết nối KiotViet" to be activated
    And Click "Lưu" button
    Then Required message "branchId" displayed under "Xin vui lòng nhập tên cửa hàng" field

##=================================ERROR MESSAGE===============================================================================================
Create_Store_25: Kiểm tra Error Message khi tạo mới Store với Số fax đã được đăng kí trước đó
    [Tags]    @Test_create_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra hiển thị thông báo lỗi khi tạo mới Store với Số fax đã được đăng kí trước đó
    When Go to create store page
    And Enter default information
    And Enter "fax_valid" in "Số fax" with "6868686868"
    And Enter "phone" in "Số điện thoại đại diện" with "_RANDOM_"
    And Enter "Email" in "Email đại diện" with "_RANDOM_"
    And Click "Lưu" button
    Then User look message "Số Fax đã được đăng kí trước đó." popup

Create_Store_26: Kiểm tra Error Message khi tạo mới Store với Số điện thoại đã được đăng kí trước đó
    [Tags]    @Test_create_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra hiển thị thông báo lỗi khi tạo mới Store với Số điện thoại đã được đăng kí trước đó
    When Go to create store page
    And Enter default information
    And Enter "fax_valid" in "Số fax" with "_RANDOM_"
    And Enter "phone" in "Số điện thoại đại diện" with "6868686868"
    And Enter "Email" in "Email đại diện" with "_RANDOM_"
    And Click "Lưu" button
    Then User look message "Số điện thoại đã được đăng ký trước đó." popup

Create_Store_27: Kiểm tra Error Message khi tạo mới Store với Email đã được đăng kí trước đó
    [Tags]    @Test_create_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm hiển thị thông báo lỗi khi tạo mới Store với Email đã được đăng kí trước đó
    When Go to create store page
    And Enter default information
    And Enter "fax_valid" in "Số fax" with "_RANDOM_"
    And Enter "phone" in "Số điện thoại đại diện" with "_RANDOM_"
    And Enter "Email" in "Email đại diện" with "kalazeeshan@example.net"
    And Click "Lưu" button
    Then User look message "Email đã được đăng ký trước đó." popup

Create_Store_28: Kiểm tra Error Message kết nối KiotViet khi không nhập client_id
    [Tags]    @Test_create_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm hiển thị thông báo lỗi kết nối KiotViet khi không nhập client_id
    When Go to create store page
    And Click switch "Kết nối KiotViet" to be activated
    And Enter "text" in "client_secret" with "_RANDOM_"
    And Enter "text" in "retailer" with "_RANDOM_"
    And Click "Lấy DS chi nhánh" button
    Then User look message "clientId là bắt buộc" popup

Create_Store_29: Kiểm tra Error Message kết nối KiotViet khi không nhập client_secret
    [Tags]    @Test_create_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra hiển thị thông báo lỗi kết nối KiotViet khi không nhập client_secret
    When Go to create store page
    And Click switch "Kết nối KiotViet" to be activated
    And Enter "text" in "client_id" with "_RANDOM_"
    And Enter "text" in "retailer" with "_RANDOM_"
    And Click "Lấy DS chi nhánh" button
    Then User look message "client_secret là bắt buộc" popup

Create_Store_30: Kiểm tra Error Message kết nối KiotViet khi không nhập retailer
    [Tags]    @Test_create_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra hiển thị thông báo lỗi kết nối KiotViet khi không nhập retailer
    When Go to create store page
    And Click switch "Kết nối KiotViet" to be activated
    And Enter "text" in "client_id" with "_RANDOM_"
    And Enter "text" in "client_secret" with "_RANDOM_"
    And Click "Lấy DS chi nhánh" button
    Then User look message "retailer là bắt buộc" popup

Create_Store_31: Kiểm tra Error Message khi Không tìm thấy kết nối với kiot-viet
    [Tags]    @Test_create_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra hiển thị thông báo lỗi khi Không tìm thấy kết nối với kiot-viet
    When Go to create store page
    And Click switch "Kết nối KiotViet" to be activated
    And Enter "text" in "client_id" with "_RANDOM_"
    And Enter "text" in "client_secret" with "_RANDOM_"
    And Enter "text" in "retailer" with "_RANDOM_"
    And Click "Lấy DS chi nhánh" button
    Then User look message "Không tìm thấy kết nối với kiot-viet" popup

##=========================================CREATE STORE SUCCESSFULLY=====================================================================
Create_Store_32: Kiểm tra Successfully Message tạo mới cửa hàng thành công
    [Tags]    @Test_create_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Successfully Message tạo mới cửa hàng thành công
    When Go to create store page
    And Enter default information
    And Enter "fax_valid" in "Số fax" with "_RANDOM_"
    And Enter "phone" in "Số điện thoại đại diện" with "_RANDOM_"
    And Enter "Email" in "Email đại diện" with "_RANDOM_"
    And Enter "paragraph" in textarea "Ghi chú" with "Cửa hàng số 1 Việt Nam"
    And Click "Lưu" button
    Then User look message "Tạo cửa hàng thành công." popup

##==============================ĐIỀU HƯỚNG ĐẾN TRANG "QUẢN LÝ CỬA HÀNG" TỪ TRANG "TẠO MỚI CỬA HÀNG"============================================
Create_Store_33: Kiểm tra có thể điều hướng đến trang danh sách cửa hàng khi click "Trở về" button từ trang tạo mới cửa hàng
    [Tags]    @Test_create_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra có thể điều hướng đến trang danh sách cửa hàng khi click "Trở về" button từ trang tạo mới cửa hàng
    When Go to create store page
    And Click "Trở về" button
    Then User look title "Quản Lý Cửa Hàng"
    And User look contains title is "Quản lý cửa hàng"

#=====================================VIEW LIST OF STORE=====================================================
Create_Store_34: Kiểm tra hiển thị thành công danh sách cửa hàng đã tạo
    [Tags]    @Test_create_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra hiển thị thành công danh sách cửa hàng đã tạo
    When Go to list store page
    Then Show list of "Stores"

Create_Store_35: Kiểm tra việc tìm kiếm thành công khi nhập "Mã cửa hàng" hợp lệ vào thanh tìm kiếm
    [Tags]    @Test_create_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra việc tìm kiếm thành công khi nhập "Mã cửa hàng" hợp lệ vào thanh tìm kiếm
    When Go to list store page
    And Search "text" in "Tìm kiếm" with "STR1209"
    Then Show list of "Stores"

Create_Store_36: Kiểm tra việc tìm kiếm thành công khi nhập "Tên cửa hàng" hợp lệ vào thanh tìm kiếm
    [Tags]    @Test_create_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra việc tìm kiếm thành công khi nhập "Tên cửa hàng" hợp lệ vào thanh tìm kiếm
    When Go to list store page
    And Search "text" in "Tìm kiếm" with "LAN ANH"
    Then Show list of "Stores"

Create_Store_37: Kiểm tra việc tìm kiếm thành công khi nhập "Tỉnh/Thành phố" hợp lệ vào thanh tìm kiếm
    [Tags]    @Test_create_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra việc tìm kiếm thành công khi nhập "Tỉnh/Thành phố" hợp lệ vào thanh tìm kiếm
    When Go to list store page
    And Search "text" in "Tìm kiếm" with "Thành Phố Hồ Chí Minh"
    Then Show list of "Stores"

Create_Store_38: Kiểm tra việc tìm kiếm thành công khi nhập "Quận/Huyện" hợp lệ vào thanh tìm kiếm
    [Tags]    @Test_create_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra việc tìm kiếm thành công khi nhập "Quận/Huyện" hợp lệ vào thanh tìm kiếm
    When Go to list store page
    And Search "text" in "Tìm kiếm" with "Quận Ba Đình"
    Then Show list of "Stores"

Create_Store_39: Kiểm tra việc tìm kiếm thành công khi nhập "Phường/Xã" hợp lệ vào thanh tìm kiếm
    [Tags]    @Test_create_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra việc tìm kiếm thành công khi nhập "Phường/Xã" hợp lệ vào thanh tìm kiếm
    When Go to list store page
    And Search "text" in "Tìm kiếm" with "Phường Vĩnh Phúc"
    Then Show list of "Stores"

Create_Store_40: Kiểm tra việc tìm kiếm thành công khi nhập "Loại cửa hàng" là "Cửa hàng chính"
    [Tags]    @Test_create_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra việc tìm kiếm thành công khi nhập "Loại cửa hàng" là "Cửa hàng chính"
    When Go to list store page
    And Search "text" in "Tìm kiếm" with "Cửa hàng chính"
    Then Show list of "Stores"

Create_Store_41: Kiểm tra việc tìm kiếm thành công khi nhập "Loại cửa hàng" là "Cửa hàng chi nhánh"
    [Tags]    @Test_create_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra việc tìm kiếm thành công khi nhập "Loại cửa hàng" là "Cửa hàng chi nhánh"
    When Go to list store page
    And Search "text" in "Tìm kiếm" with "Cửa hàng chi nhánh"
    Then Show list of "Stores"

Create_Store_42: Kiểm tra việc tìm kiếm thành công khi nhập "Người đại diện" hợp lệ vào thanh tìm kiếm
    [Tags]    @Test_create_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra việc tìm kiếm thành công khi nhập "Người đại diện" hợp lệ vào thanh tìm kiếm
    When Go to list store page
    And Search "text" in "Tìm kiếm" with "Nguyễn Thị Lan Anh"
    Then Show list of "Stores"

Create_Store_43: Kiểm tra việc tìm kiếm thành công khi nhập "Số điện thoại" hợp lệ vào thanh tìm kiếm
    [Tags]    @Test_create_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra việc tìm kiếm thành công khi nhập "Số điện thoại" hợp lệ vào thanh tìm kiếm
    When Go to list store page
    And Search "text" in "Tìm kiếm" with "0335745554"
    Then Show list of "Stores"

Create_Store_44: Kiểm tra việc tìm kiếm không thành công khi nhập "Mã cửa hàng" không hợp lệ vào thanh tìm kiếm
    [Tags]    @Test_create_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra việc tìm kiếm không thành công khi nhập "Mã cửa hàng" không hợp lệ vào thanh tìm kiếm
    When Go to list store page
    And Search "name code" in "Tìm kiếm" with "_RANDOM_"
    Then No store are shown

Create_Store_45: Kiểm tra việc tìm kiếm không thành công khi nhập "Số điện thoại" không hợp lệ vào thanh tìm kiếm
    [Tags]    @Test_create_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra việc tìm kiếm không thành công khi nhập "Số điện thoại" không hợp lệ vào thanh tìm kiếm
    When Go to list store page
    And Search "phone" in "Tìm kiếm" with "_RANDOM_"
    Then No store are shown

Create_Store_46: Kiểm tra việc tìm kiếm không thành công khi nhập "Keyword" không hợp lệ vào thanh tìm kiếm
    [Tags]    @Test_create_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra việc tìm kiếm không thành công khi nhập "Keyword" không hợp lệ vào thanh tìm kiếm
    When Go to list store page
    And Search "text" in "Tìm kiếm" with "_RANDOM_"
    Then No store are shown

Create_Store_47: Kiểm tra có thể xem danh sách cửa hàng trang kế tiếp, trước trước, trang cuối cùng, trang đầu tiên
    [Tags]    @Test_create_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]       Kiểm tra có thể xem danh sách cửa hàng chính trang kế tiếp, trước trước, trang cuối cùng, trang đầu tiên
    When Go to list store page
    And Click ">" to "next" page
    Then Show list of "Stores"
    And Click "<" to "prev" page
    Then Show list of "Stores"
    And Click ">>" to "next_all" page
    Then Show list of "Stores"
    And Click "<<" to "prev_all" page
    Then Show list of "Stores"

##=========================ĐIỀU HƯỚNG ĐẾN TRANG "CHỈNH SỬA THÔNG TIN THÊM CỬA HÀNG"========================================================
Edit_Store_01: Kiểm tra có thể điều hướng đến trang chỉnh sửa thông tin cửa hàng
    [Tags]    @Test_edit_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra có thể điều hướng đến trang chỉnh sửa thông tin cửa hàng
    When Click "Quản lý cửa hàng" menu
    And Select Store need to edit
    Then User look title "Quản Lý Cửa Hàng"
    And User look contains title is "Thông tin cửa hàng"
    And User look tab menu "Thông tin cửa hàng"
    And User look tab menu "Danh sách hàng hóa"
    And User look tab menu "Danh sách chi nhánh"
    And User look tab menu "Quản lý NCC"
    And User look tab menu "Doanh thu"
    And User look tab menu "Quản lý kho"

##==================================VALIDATION TEXT==========================================================
Edit_Store_02: Kiểm tra Validation Text trường "Tên cửa hàng" khi bỏ trống Tên cửa hàng
    [Tags]    @Test_edit_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text trường "Tên cửa hàng" khi bỏ trống Tên cửa hàng
    When Go to edit store page
    And Enter "text" in "Tên cửa hàng" with "${empty}"
    And Click in "Số fax" field
    Then Required message "Tên cửa hàng" displayed under "Xin vui lòng nhập tên cửa hàng" field

Edit_Store_03: Kiểm tra Validation Text trường "Số fax" khi nhập sai định dạng số fax và nhỏ hơn 8 ký tự
    [Tags]    @Test_edit_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text trường "Số fax" khi nhập sai định dạng số fax và nhỏ hơn 8 ký tự
    When Go to edit store page
    And Enter "text" in "Số fax" with "abcdef"
    And Click in "Tên cửa hàng" field
    Then Required message "Số fax" field displayed under "Xin vui lòng chỉ nhập số"
    And Required message "Số fax" field displayed under "Xin vui lòng nhập tối thiểu 8 ký tự số"

Edit_Store_04: Kiểm tra Validation Text trường "Số fax" khi nhập sai định dạng số fax và lớn hơn 12 ký tự
    [Tags]    @Test_edit_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text trường "Số fax" khi nhập sai định dạng số fax và lớn hơn 12 ký tự
    When Go to edit store page
    And Enter "text" in "Số fax" with "_RANDOM_"
    And Click in "Tên cửa hàng" field
    Then Required message "Số fax" field displayed under "Xin vui lòng chỉ nhập số"
    And Required message "Số fax" field displayed under "Xin vui lòng nhập tối đa 12 ký tự số"

Edit_Store_05: Kiểm tra Validation Text trường "Số fax" khi số fax nhỏ hơn 8 ký tự số
    [Tags]    @Test_edit_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text trường "Số fax" khi số fax nhỏ hơn 8 ký tự số
    When Go to edit store page
    And Enter "fax_7" in "Số fax" with "_RANDOM_"
    And Click in "Tên cửa hàng" field
    Then Required message "Số fax" displayed under "Xin vui lòng nhập tối thiểu 8 ký tự số" field

Edit_Store_06: Kiểm tra Validation Text trường "Số fax" khi số fax lớn hơn 12 ký tự số
    [Tags]    @Test_edit_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text trường "Số fax" khi số fax lớn hơn 12 ký tự số
    When Go to edit store page
    And Enter "fax_invalid" in "Số fax" with "_RANDOM_"
    And Click in "Tên cửa hàng" field
    Then Required message "Số fax" displayed under "Xin vui lòng nhập tối đa 12 ký tự số" field

Edit_Store_07: Kiểm tra Validation Text khi bỏ trống trường "Tỉnh/Thành phố"
    [Tags]    @Test_edit_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation Text khi bỏ trống trường "Tỉnh/Thành phố"
    When Go to edit store page
    And Delete text in "Tỉnh/Thành phố" field
    Then Required message "Tỉnh/Thành phố" displayed under "Xin vui lòng chọn tỉnh/thành phố" field

Edit_Store_08: Kiểm tra Validation Text khi bỏ trống trường "Quận/Huyện"
    [Tags]    @Test_edit_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation Text khi bỏ trống trường "Quận/Huyện"
    When Go to edit store page
    And Delete text in "Quận/Huyện" field
    Then Required message "Quận/Huyện" displayed under "Xin vui lòng chọn quận/huyện" field

Edit_Store_09: Kiểm tra Validation Text khi bỏ trống trường "Phường/Xã"
    [Tags]    @Test_edit_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation Text khi bỏ trống trường "Phường/Xã"
    When Go to edit store page
    And Delete text in "Phường/Xã" field
    Then Required message "Phường/Xã" displayed under "Xin vui lòng chọn phường/xã" field

Edit_Store_10: Kiểm tra Validation Text khi bỏ trống trường "Địa chỉ cụ thể"
    [Tags]    @Test_edit_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation Text khi bỏ trống trường "Địa chỉ cụ thể"
    When Go to edit store page
    And Enter "text" in "Địa chỉ cụ thể" with "${empty}"
    And Click in "Họ tên đại diện" field
    Then Required message "Địa chỉ cụ thể" displayed under "Xin vui lòng nhập địa chỉ cụ thể" field

Edit_Store_11: Kiểm tra Validation text khi bỏ trống trường "Họ tên đại diện"
    [Tags]    @Test_edit_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation text khi bỏ trống trường "Họ tên đại diện"
    When Go to edit store page
    And Enter "text" in "Họ tên đại diện" with "${empty}"
    And Click in "Số điện thoại đại diện" field
    Then Required message "Họ tên đại diện" displayed under "Xin vui lòng nhập họ tên đại diện" field

Edit_Store_12: Kiểm tra Validation text tại trường "Họ tên đại diện" khi nhập Họ tên đại diện không hợp lệ
    [Tags]    @Test_edit_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation text tại trường "Họ tên đại diện" khi nhập Họ tên đại diện không hợp lệ
    When Go to edit store page
    And Enter "text" in "Họ tên đại diện" with "_RANDOM_"
    And Click in "Số điện thoại đại diện" field
    Then Required message "Họ tên đại diện" displayed under "Vui lòng chỉ nhập chữ" field

Edit_Store_13: Kiểm tra Validation Text khi bỏ trống trường "Số điện thoại đại diện"
    [Tags]    @Test_edit_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation Text khi bỏ trống trường "Số điện thoại đại diện"
    When Go to edit store page
    And Enter "text" in "Số điện thoại đại diện" with "${empty}"
    And Click in "Email đại diện" field
    Then Required message "Số điện thoại đại diện" displayed under "Xin vui lòng nhập số điện thoại đại diện" field

Edit_Store_14: Kiểm tra Validation Text trường "Số điện thoại đại diện" khi nhập sai định dạng số điện thoại và nhỏ hơn 8 ký tự
    [Tags]    @Test_edit_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation Text trường "Số điện thoại đại diện" khi nhập sai định dạng số điện thoại và nhỏ hơn 8 ký tự
    When Go to edit store page
    And Enter "text" in "Số điện thoại đại diện" with "abcdef"
    And Click in "Email đại diện" field
    Then Required message "Số điện thoại đại diện" field displayed under "Xin vui lòng chỉ nhập số"
    And Required message "Số điện thoại đại diện" field displayed under "Xin vui lòng nhập tối thiểu 8 ký tự số"

Edit_Store_15: Kiểm tra Validation Text trường "Số điện thoại đại diện" khi nhập sai định dạng số điện thoại và lớn hơn 12 ký tự
    [Tags]    @Test_edit_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation Text trường "Số điện thoại đại diện" khi nhập sai định dạng số điện thoại và lớn hơn 12 ký tự
    When Go to edit store page
    And Enter "text" in "Số điện thoại đại diện" with "_RANDOM_"
    And Click in "Email đại diện" field
    Then Required message "Số điện thoại đại diện" field displayed under "Xin vui lòng chỉ nhập số"
    And Required message "Số điện thoại đại diện" field displayed under "Xin vui lòng nhập tối đa 12 ký tự số"

Edit_Store_16: Kiểm tra Validation Text trường "Số điện thoại đại diện" khi số điện thoại nhỏ hơn 8 ký tự số
    [Tags]    @Test_edit_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation Text trường "Số điện thoại đại diện" khi số điện thoại nhỏ hơn 8 ký tự số
    When Go to edit store page
    And Enter "phone_7" in "Số điện thoại đại diện" with "_RANDOM_"
    And Click in "Email đại diện" field
    Then Required message "Số điện thoại đại diện" displayed under "Xin vui lòng nhập tối thiểu 8 ký tự số" field

Edit_Store_17: Kiểm tra Validation Text trường "Số điện thoại đại diện" khi số điện thoại lớn hơn 12 ký tự số
    [Tags]    @Test_edit_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation Text trường "Số điện thoại đại diện" khi số điện thoại lớn hơn 12 ký tự số
    When Go to edit store page
    And Enter "phone_invalid" in "Số điện thoại đại diện" with "_RANDOM_"
    And Click in "Email đại diện" field
    Then Required message "Số điện thoại đại diện" displayed under "Xin vui lòng nhập tối đa 12 ký tự số" field

Edit_Store_18: Kiểm tra Validation Text khi bỏ trống trường "Email đại diện"
    [Tags]    @Test_edit_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation Text khi bỏ trống trường "Email đại diện"
    When Go to edit store page
    And Enter "text" in "Email đại diện" with "${empty}"
    And Click in "Số điện thoại đại diện" field
    Then Required message "Email đại diện" displayed under "Xin vui lòng nhập email đại diện" field

Edit_Store_19: Kiểm tra Validation Text trường "Email đại diện" khi nhập sai định dạng email
    [Tags]    @Test_edit_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation Text trường "Email đại diện" khi nhập sai định dạng email
    When Go to edit store page
    And Enter "text" in "Email đại diện" with "_RANDOM_"
    And Click in "Số điện thoại đại diện" field
    Then Required message "Email đại diện" displayed under "Vui lòng nhập địa chỉ email hợp lệ!" field

Edit_Store_20: Kiểm tra Validation Text trường "Ghi chú" khi nhập ghi chú quá 500 ký tự
    [Tags]    @Test_edit_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation Text trường "Ghi chú" khi nhập ghi chú quá 500 ký tự
    When Go to edit store page
    And Enter "word" in textarea "Ghi chú" with "_RANDOM_"
    And Click in "Số điện thoại đại diện" field
    Then Required message "Ghi chú" displayed under "Chỉ được nhập tối đa 500 kí tự" field

Edit_Store_21: Kiểm tra Validation Text trường "client_id" khi không nhập client_id
    [Tags]    @Test_edit_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation Text trường "client_id" khi không nhập client_id
    When Go to edit store page
    And Click switch "Kết nối KiotViet" to be activated
    And Enter "text" in "client_id" with "${empty}"
    And Click in "client_secret" field
    Then Required message "client_id" displayed under "Xin vui lòng nhập client_id" field

Edit_Store_22: Kiểm tra Validation Text trường "client_secret" khi không nhập client_secret
    [Tags]    @Test_edit_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation Text trường "client_secret" khi không nhập client_secret
    When Go to edit store page
    And Click switch "Kết nối KiotViet" to be activated
    And Enter "text" in "client_secret" with "${empty}"
    And Click in "client_id" field
    Then Required message "client_secret" displayed under "Xin vui lòng nhập client_secret" field

Edit_Store_23: Kiểm tra Validation Text trường "retailer" khi không nhập retailer
    [Tags]    @Test_edit_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation Text trường "retailer" khi không nhập retailer
    When Go to edit store page
    And Click switch "Kết nối KiotViet" to be activated
    And Enter "text" in "retailer" with "${empty}"
    And Click in "client_id" field
    Then Required message "retailer" displayed under "Xin vui lòng nhập retailer" field

Edit_Store_24: Kiểm tra Validation Text trường "branchId" không nhập branchId
    [Tags]    @Test_edit_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation Text trường "branchId" không nhập branchId
    When Go to edit store page
    And Click switch "Kết nối KiotViet" to be activated
    And Click "Lưu" button
    Then Required message "branchId" displayed under "Xin vui lòng nhập tên cửa hàng" field

##=================================ERROR MESSAGE===============================================================================================
Edit_Store_25: Kiểm tra Error Message khi chỉnh sửa Store với Số fax đã được đăng kí trước đó
    [Tags]    @Test_edit_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra hiển thị thông báo lỗi khi chỉnh sửa Store với Số fax đã được đăng kí trước đó
    When Go to edit store page
    When Enter "fax_valid" in "Số fax" with "09784378"
    And Click "Lưu" button
    Then User look message "Số Fax đã được đăng kí trước đó." popup

Edit_Store_26: Kiểm tra Error Message khi chỉnh sửa Store với Số điện thoại đã được đăng kí trước đó
    [Tags]    @Testcase Failed
    [Documentation]   Kiểm tra hiển thị thông báo lỗi khi chỉnh sửa Store với Số điện thoại đã được đăng kí trước đó
    When Go to edit store page
    When Enter "phone" in "Số điện thoại đại diện" with "0869667249"
    And Click "Lưu" button
    Then User look message "Số điện thoại đã được đăng ký trước đó." popup

Edit_Store_27: Kiểm tra Error Message khi chỉnh sửa Store với Email đã được đăng kí trước đó
    [Tags]    @Test_edit_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra hiển thị thông báo lỗi khi chỉnh sửa Store với Email đã được đăng kí trước đó
    When Go to edit store page
    And Enter "Email" in "Email đại diện" with "21211tt4375@mail.tdc.edu.vn"
    And Click "Lưu" button
    Then User look message "Email này đã tồn tại, vui lòng nhập email khác." popup

Edit_Store_28: Kiểm tra Error Message kết nối KiotViet khi không nhập client_id
    [Tags]    @Test_edit_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra hiển thị thông báo lỗi kết nối KiotViet khi không nhập client_id
    When Go to edit store page
    And Click switch "Kết nối KiotViet" to be activated
    And Enter "text" in "client_id" with "${empty}"
    And Enter "text" in "client_secret" with "_RANDOM_"
    And Enter "text" in "retailer" with "_RANDOM_"
    And Click "Lấy DS chi nhánh" button
    Then User look message "clientId là bắt buộc" popup

Edit_Store_29: Kiểm tra Error Message kết nối KiotViet khi không nhập client_secret
    [Tags]    @Test_edit_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra hiển thị thông báo lỗi kết nối KiotViet khi không nhập client_secret
    When Go to edit store page
    And Click switch "Kết nối KiotViet" to be activated
    And Enter "text" in "client_id" with "_RANDOM_"
    And Enter "text" in "client_secret" with "${empty}"
    And Enter "text" in "retailer" with "_RANDOM_"
    And Click "Lấy DS chi nhánh" button
    Then User look message "client_secret là bắt buộc" popup

Edit_Store_30: Kiểm tra Error Message kết nối KiotViet khi không nhập retailer
    [Tags]    @Test_edit_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra hiển thị thông báo lỗi kết nối KiotViet khi không nhập retailer
    When Go to edit store page
    And Click switch "Kết nối KiotViet" to be activated
    And Enter "text" in "client_id" with "_RANDOM_"
    And Enter "text" in "client_secret" with "_RANDOM_"
    And Enter "text" in "retailer" with "${empty}"
    And Click "Lấy DS chi nhánh" button
    Then User look message "retailer là bắt buộc" popup

Edit_Store_31: Kiểm tra Error Message khi Không tìm thấy kết nối với kiot-viet
    [Tags]    @Test_edit_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra hiển thị thông báo lỗi khi Không tìm thấy kết nối với kiot-viet
    When Go to edit store page
    And Click switch "Kết nối KiotViet" to be activated
    And Enter "Kết nối với KioViet"
    And Click "Lấy DS chi nhánh" button
    Then User look message "Không tìm thấy kết nối với kiot-viet" popup

###=======================EDIT STORE SUCCESSFULLY================================================
Edit_Store_32: Kiểm tra chỉnh sửa thông tin cửa hàng thành công khi thay đổi "Tên cửa hàng"
    [Tags]    @Test_edit_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra chỉnh sửa thông tin cửa hàng thành công khi thay đổi "Tên cửa hàng"
    When Go to edit store page
    And Enter "text" in "Tên cửa hàng" with "Cửa hàng của Tuyềnn"
    And Click "Lưu" button
    Then User look message "Chỉnh sửa cửa hàng thành công." popup

Edit_Store_33: Kiểm tra chỉnh sửa thông tin cửa hàng thành công khi thay đổi "Số fax"
    [Tags]    @Test_edit_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra chỉnh sửa thông tin cửa hàng thành công khi thay đổi "Số fax"
    When Go to edit store page
    And Enter "fax_valid" in "Số fax" with "_RANDOM_"
    And Click "Lưu" button
    Then User look message "Chỉnh sửa cửa hàng thành công." popup

Edit_Store_34: Kiểm tra chỉnh sửa thông tin cửa hàng thành công khi thay đổi "Địa chỉ cửa hàng"
    [Tags]    @Test_edit_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra chỉnh sửa thông tin cửa hàng thành công khi thay đổi "Địa chỉ cửa hàng"
    When Go to edit store page
    And Delete text in "Tỉnh/Thành phố" field
    And Click select "Tỉnh/Thành phố" with "Thành phố Hà Nội"
    And Click select "Quận/Huyện" with "Quận Ba Đình"
    And Click select "Phường/Xã" with "Phường Phúc Xá"
    And Enter "number" in "Địa chỉ cụ thể" with "1 Đống Đa"
    And Click "Lưu" button
    Then User look message "Chỉnh sửa cửa hàng thành công." popup

Edit_Store_35: Kiểm tra chỉnh sửa thông tin cửa hàng thành công khi thay đổi "Họ tên người đại diện"
    [Tags]    @Test_edit_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra chỉnh sửa thông tin cửa hàng thành công khi thay đổi "Họ tên người đại diện"
    When Go to edit store page
    And Enter "fullname" in "Họ tên đại diện" with "Kiệt Công"
    And Click "Lưu" button
    Then User look message "Chỉnh sửa cửa hàng thành công." popup

Edit_Store_36: Kiểm tra chỉnh sửa thông tin cửa hàng thành công khi thay đổi "Số điện thoại người đại diện"
    [Tags]    @Test_edit_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra chỉnh sửa thông tin cửa hàng thành công khi thay đổi "Số điện thoại người đại diện"
    When Go to edit store page
    And Enter "phone" in "Số điện thoại đại diện" with "_RANDOM_"
    And Click "Lưu" button
    Then User look message "Chỉnh sửa cửa hàng thành công." popup

Edit_Store_37: Kiểm tra chỉnh sửa thông tin cửa hàng thành công khi thay đổi "Email người đại diện"
    [Tags]    @Test_edit_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra chỉnh sửa thông tin cửa hàng thành công khi thay đổi Email người đại diện
    When Go to edit store page
    And Enter "email" in "Email đại diện" with "chstag0002-v2@getnada.com"
    And Click "Lưu" button
    Then User look message "Chỉnh sửa cửa hàng thành công." popup

Edit_Store_38: Kiểm tra chỉnh sửa thông tin cửa hàng thành công khi thay đổi "Ghi chú"
    [Tags]    @Test_edit_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra chỉnh sửa thông tin cửa hàng thành công khi thay đổi Ghi chú
    When Go to edit store page
    And Enter "paragraph" in textarea "Ghi chú" with "Đây là cửa hàng chính của Tuyền"
    And Click "Lưu" button
    Then User look message "Chỉnh sửa cửa hàng thành công." popup

Edit_Store_39: Kiểm tra điều hướng đến trang “Quản lý cửa hàng” từ trang “Chỉnh sửa cửa hàng”
    [Tags]    @Test_edit_main_store    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra điều hướng đến trang “Quản lý cửa hàng” từ trang “Chỉnh sửa cửa hàng”
    When Go to edit store page
    And Click "Trở về" button
    Then User look title "Quản Lý Cửa Hàng"
    And User look contains title is "Quản lý cửa hàng"

*** Keywords ***
Preconditions
  Set Browser Timeout         ${BROWSER_TIMEOUT}
  New Browser                 ${BROWSER}  headless=${HEADLESS}
  New Page                    ${URL_DEFAULT}
  ${STATE}                    Evaluate  json.loads('''{}''')  json
  Login to Admin

Go to ${name} store page
  When Click "Quản lý cửa hàng" menu
  IF  '${name}' == 'create'
     And Click "Thêm cửa hàng" button
  ELSE IF  '${name}' == 'edit'
     And Select Store need to edit
  END

Select Store need to edit
    Search "text" in "Tìm kiếm" with "STR0832"
    ${element}    Set Variable   //td[contains(text(),'STR0832')]
    Click         ${element}        left        2

User look tab menu "${menu}"
  Element Text Should Be    //div[contains(text(),'${menu}')]     ${menu}

Enter default information
  And Enter "text" in "Tên cửa hàng" with "FPT Shop - Cơ sở 1"
  And Click select "Tỉnh/Thành phố" with "Thành phố Hồ Chí Minh"
  And Click select "Quận/Huyện" with "Quận 3"
  And Click select "Phường/Xã" with "Phường Võ Thị Sáu"
  And Enter "text" in "Địa chỉ cụ thể" with "02 Trần Quốc Thảo"
  And Enter "fullname" in "Họ tên đại diện" with "Nguyễn Công Phượng"

Select the newly created "Store"
  Click       //*[contains(@class, "ant-table-row")][1]         left        2

Enter "Kết nối với KioViet"
   And Enter "text" in "client_id" with "${client_id}"
   And Enter "text" in "client_secret" with "${client_secret}"
   And Enter "text" in "retailer" with "${retailer}"

Show list of "Stores"
    Wait Until Element Spin
    ${elements}=        Get Elements        xpath=//*[contains(@class, "ant-table-row")]
    Run Keyword If    ${elements}     Display     ${elements}
    ...    ELSE    Log To Console     Không tồn tại cửa hàng chính nào!
Display
    [Arguments]    ${name}    ${elements}
    Log To Console      *************************-DANH SÁCH CỬA HÀNG CHÍNH-**************************
    Wait Until Element Is Visible         ${elements}[0]
    ${count}=           Set Variable        1
    ${stt}=             Set Variable        1
    FOR  ${i}  IN  @{elements}
        ${store_code}     Get Text      //tbody/tr[${count}]/td[1]
        ${store_name}     Get Text      //tbody/tr[${count}]/td[2]
        ${address}        Get Text      //tbody/tr[${count}]/td[3]
        ${store_type}     Get Text      //tbody/tr[${count}]/td[4]
        ${store_user}     Get Text      //tbody/tr[${count}]/td[5]
        ${phone}          Get Text      //tbody/tr[${count}]/td[6]
        Log To Console    ${stt}. Mã cửa hàng: ${store_code} | Tên cửa hàng: ${store_name} | Địa chỉ: ${address} | Loại cửa hàng: ${store_type} | Người đại diện: ${store_user} | Số điện thoại: ${phone}
        Log To Console    ================================================================================================================================================================================
        ${count}=    Evaluate    ${count} + 1
        ${stt}=    Evaluate    ${stt} + 1
    END
    ${total}=    Evaluate    ${count} - 1
    Log To Console    Tổng số lượng cửa hàng chính là: ${total}
