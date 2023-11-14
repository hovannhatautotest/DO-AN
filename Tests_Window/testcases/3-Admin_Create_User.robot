*** Settings ***
Resource            ../keywords/common.robot

Test Setup          Setup
Test Teardown       Tear Down

*** Test Cases ***

### ============================================NAVIGATE CREATE USER PAGE=====================================================
Create_User_01: Kiểm tra có thể điều hướng đến trang tạo mới người dùng
    [Tags]    @Test_create_user    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra có thể điều hướng đến trang tạo mới người dùng
    Login to Admin
    And Click "Quản lý người dùng" menu
    And Click "Thêm quản trị viên" button
    Then User look title "Quản Lý Người Dùng"
    And User look contains title is "Thêm người dùng"

### =====================================================VALIDATION TEXT=====================================================
Create_User_02: Kiểm tra Validation text khi không nhập thông tin nào cả
    [Tags]    @Test_create_user         @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation text khi không nhập thông tin nào cả
    When Go to page create user
    And Click "Lưu" button
    Then Required message "Họ và tên" displayed under "Xin vui lòng nhập tên người dùng" field
    And Required message "Email" displayed under "Xin vui lòng nhập email người dùng" field
    And Required message "Số điện thoại" displayed under "Xin vui lòng nhập số điện thoại người dùng" field

Create_User_03: Kiểm tra Validation text tại trường "Họ và tên" khi bỏ trống Họ và tên
    [Tags]    @Test_create_user         @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation text tại trường "Họ và tên" khi bỏ trống Họ và tên
    When Go to page create user
    And Enter "text" in "Họ và tên" with "${empty}"
    And Click in "Email" field
    Then Required message "Họ và tên" displayed under "Xin vui lòng nhập tên người dùng" field

Create_User_04: Kiểm tra Validation text tại trường "Họ và tên" khi nhập sai định dạng Họ và tên
    [Tags]    @Test_create_user         @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation text tại trường "Họ và tên" khi nhập sai định dạng Họ và tên
    When Go to page create user
    And Enter "number" in "Họ và tên" with "_RANDOM_"
    And Click in "Email" field
    Then Required message "Họ và tên" displayed under "Xin vui lòng chỉ nhập chữ" field

Create_User_05: Kiểm tra Validation text tại trường "Email" khi không nhập email
    [Tags]    @Test_create_user         @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation text tại trường "Email" khi không nhập email
    When Go to page create user
    And Enter "text" in "Email" with "${empty}"
    And Click in "Họ và tên" field
    Then Required message "Email" displayed under "Xin vui lòng nhập email người dùng" field

Create_User_06: Kiểm tra Validation text tại trường "Email" khi nhập sai định dạng email
    [Tags]    @Test_create_user         @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation text tại trường "Email" khi nhập sai định dạng email
    When Go to page create user
    And Enter "text" in "Email" with "_RANDOM_"
    And Click in "Họ và tên" field
    Then Required message "Email" displayed under "Vui lòng nhập địa chỉ email hợp lệ!" field

Create_User_07: Kiểm tra Validation text tại trường "Số điện thoại" khi không nhập Số điện thoại
    [Tags]    @Test_create_user         @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation text tại trường "Số điện thoại" khi không nhập Số điện thoại
    When Go to page create user
    And Enter "text" in "Số điện thoại" with "${empty}"
    And Click in "Họ và tên" field
    Then Required message "Số điện thoại" displayed under "Xin vui lòng nhập số điện thoại người dùng" field

Create_User_08: Kiểm tra Validation text tại trường "Số điện thoại" khi nhập sai định dạng số điện thoại và nhỏ hơn 8 ký tự
    [Tags]    @Test_create_user         @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation text tại trường "Số điện thoại" khi nhập sai định dạng số điện thoại và nhỏ hơn 8 ký tự
    When Go to page create user
    And Enter "text" in "Số điện thoại" with "abcdef"
    And Click in "Họ và tên" field
    Then Required message "Số điện thoại" field displayed under "Xin vui lòng chỉ nhập số"
    And Required message "Số điện thoại" field displayed under "Xin vui lòng nhập tối thiểu 8 ký tự số"

Create_User_09: Kiểm tra Validation text tại trường "Số điện thoại" khi nhập sai định dạng số điện thoại và lớn hơn 12 ký tự
    [Tags]    @Test_create_user         @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation text tại trường "Số điện thoại" khi nhập sai định dạng số điện thoại và lớn hơn 12 ký tự
    When Go to page create user
    And Enter "text" in "Số điện thoại" with "_RANDOM_"
    And Click in "Họ và tên" field
    Then Required message "Số điện thoại" field displayed under "Xin vui lòng chỉ nhập số"
    And Required message "Số điện thoại" field displayed under "Xin vui lòng nhập tối đa 12 ký tự số"

Create_User_10: Kiểm tra Validation text tại trường "Số điện thoại" khi nhập Số điện thoại nhỏ hơn 8 ký tự
    [Tags]    @Test_create_user         @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation text tại trường "Số điện thoại" khi nhập Số điện thoại nhỏ hơn 8 ký tự
    When Go to page create user
    And Enter "phone_7" in "Số điện thoại" with "_RANDOM_"
    And Click in "Họ và tên" field
    Then Required message "Số điện thoại" displayed under "Xin vui lòng nhập tối thiểu 8 ký tự số" field

Create_User_11: Kiểm tra Validation text tại trường "Số điện thoại" khi nhập Số điện thoại lớn hơn 12 ký tự
    [Tags]    @Test_create_user         @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation text tại trường "Số điện thoại" khi nhập Số điện thoại lớn hơn 12 ký tự
    When Go to page create user
    And Enter "phone_invalid" in "Số điện thoại" with "_RANDOM_"
    And Click in "Họ và tên" field
    Then Required message "Số điện thoại" displayed under "Xin vui lòng nhập tối đa 12 ký tự số" field

Create_User_12: Kiểm tra Validation text tại trường "Số điện thoại" khi nhập sai định dạng Số điện thoại và lớn hơn 8 ký tự nhưng nhỏ hơn 12 ký tự
    [Tags]    @Test_create_user         @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation text tại trường "Số điện thoại" khi nhập sai định dạng Số điện thoại và lớn hơn 8 ký tự nhưng nhỏ hơn 12 ký tự
    When Go to page create user
    And Enter "text" in "Số điện thoại" with "Hồ Văn Nhật"
    And Click in "Họ và tên" field
    Then Required message "Số điện thoại" displayed under "Xin vui lòng chỉ nhập số" field

Create_User_13: Kiểm tra Validation text tại trường "Ghi chú" khi nhập quá 500 kí tự
    [Tags]    @Test_create_user         @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation text tại trường "Ghi chú" khi nhập quá 500 kí tự
    When Go to page create user
    And Enter "word" in textarea "Ghi chú" with "_RANDOM_"
    And Click in "Họ và tên" field
    Then Required message "Ghi chú" displayed under "Chỉ được nhập tối đa 500 kí tự" field

##=====================================================ERROR MESSAGE=====================================================
Create_User_14: Kiểm tra error message khi tạo mới người dùng có "Email" đã tồn tại trên hệ thống
    [Tags]    @Test_create_user         @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra error message khi tạo mới người dùng có "Email" đã tồn tại trên hệ thống
    When Go to page create user
    And Enter "fullname" in "Họ và tên" with "_RANDOM_"
    And Enter "Email" in "Email" with "admin_balan@getnada.com"
    And Enter "phone" in "Số điện thoại" with "_RANDOM_"
    And Click "Lưu" button
    Then User look message "Email đã được đăng ký trước đó." popup

Create_User_15: Kiểm tra error message khi tạo mới người dùng có "Số điện thoại" đã tồn tại trên hệ thống
    [Tags]    @Test_create_user         @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra error message khi tạo mới người dùng có "Số điện thoại" đã tồn tại trên hệ thống
    When Go to page create user
    And Enter "fullname" in "Họ và tên" with "_RANDOM_"
    And Enter "Email" in "Email" with "_RANDOM_"
    And Enter "phone" in "Số điện thoại" with "0941225407"
    And Click "Lưu" button
    Then User look message "Số điện thoại đã được đăng ký trước đó." popup

 ##=====================================================CREATE USER SUCCESSFULLY=====================================================
Create_User_16: Kiểm tra tạo mới người dùng thành công
    [Tags]    @Test_create_user         @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra tạo mới người dùng thành công
    When Go to page create user
    And Enter "fullname" in "Họ và tên" with "Phan Hữu Hoàng Long"
    And Enter "Email" in "Email" with "_RANDOM_"
    And Enter "phone" in "Số điện thoại" with "_RANDOM_"
    And Enter "text" in textarea "Ghi chú" with "Phan Hữu Hoàng Long"
    And Click "Lưu" button
    Then User look message "Thêm quản trị viên thành công" popup
    And User look title "Quản Lý Người Dùng"

Create_User_17: Kiểm tra có thể điều hướng đến trang danh sách người dùng từ trang Tạo mới người dùng
    [Tags]    @Test_create_user         @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra có thể điều hướng đến trang danh sách người dùng từ trang Tạo mới người dùng
    When Go to page create user
    And Click "Trở về" button
    Then User look title "Quản Lý Người Dùng"
    And User look contains title is "Quản lý người dùng"

###-----------------------------------------RELOAD PAGE---------------------------------------------------##
Create_User_18: Kiểm tra thông tin nhập sẽ bị xóa sau khi reload trang web
    [Tags]    @Test_create_user         @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra thông tin nhập sẽ bị xóa sau khi reload trang web
    When Go to page create user
    And Enter "fullname" in "Họ và tên" with "_RANDOM_"
    And Enter "Email" in "Email" with "_RANDOM_"
    And Enter "phone" in "Số điện thoại" with "_RANDOM_"
    And Enter "text" in textarea "Ghi chú" with "_RANDOM_"
    And Reload Page
    Then User look "Họ và tên" field empty
    And User look "Email" field empty
    And User look "Số điện thoại" field empty
    And User look textarea "Ghi chú" field empty

#-------------------------------------VIEW LIST OF USER--------------------------------------------------------------------------------------
Create_User_19: Kiểm tra hiển thị thành công danh sách người dùng đã tạo
    [Tags]    @Test_create_user         @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra hiển thị thành công danh sách người dùng đã tạo
    When Go to page list user
    Then Show list of "users"

Create_User_20: Kiểm tra việc tìm kiếm thành công khi nhập "Mã người dùng" hợp lệ vào thanh tìm kiếm
    [Tags]    @Test_create_user         @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra việc tìm kiếm thành công khi nhập "Mã người dùng" hợp lệ vào thanh tìm kiếm
    When Go to page list user
    And Search "text" in "Tìm kiếm" with "${SEARCH_NAME_CODE}"
    Then Show list of "users"

Create_User_21: Kiểm tra việc tìm kiếm thành công khi nhập "Họ và tên" hợp lệ vào thanh tìm kiếm
    [Tags]    @Test_create_user         @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra việc tìm kiếm thành công khi nhập "Họ và tên" hợp lệ vào thanh tìm kiếm
    When Go to page list user
    And Search "text" in "Tìm kiếm" with "${SEARCH_FULLNAME}"
    Then Show list of "users"

Create_User_22: Kiểm tra việc tìm kiếm thành công khi nhập "Email" hợp lệ vào thanh tìm kiếm
    [Tags]    @Test_create_user         @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra việc tìm kiếm thành công khi nhập "Email" hợp lệ vào thanh tìm kiếm
    When Go to page list user
    And Search "email" in "Tìm kiếm" with "${SEARCH_EMAIL}"
    Then Show list of "users"

Create_User_23: Kiểm tra việc tìm kiếm thành công khi nhập "Số điện thoại" hợp lệ vào thanh tìm kiếm
    [Tags]    @Test_create_user         @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra việc tìm kiếm thành công khi nhập "Số điện thoại" hợp lệ vào thanh tìm kiếm
    When Go to page list user
    And Search "phone" in "Tìm kiếm" with "${SEARCH_PHONE}"
    Then Show list of "users"

Create_User_24: Kiểm tra việc tìm kiếm thành công khi nhập "Vai trò" hợp lệ vào thanh tìm kiếm
    [Tags]    @Test_create_user         @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra việc tìm kiếm thành công khi nhập "Vai trò" hợp lệ vào thanh tìm kiếm
    When Go to page list user
    And Search "text" in "Tìm kiếm" with "Quản trị viên"
    Then Show list of "users"

Create_User_25: Kiểm tra việc tìm kiếm thành công khi nhập "Vai trò" hợp lệ vào thanh tìm kiếm
    [Tags]    @Test_create_user         @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra việc tìm kiếm thành công khi nhập "Vai trò" hợp lệ vào thanh tìm kiếm
    When Go to page list user
    And Search "text" in "Tìm kiếm" with "Đại diện cửa hàng"
    Then Show list of "users"

Create_User_26: Kiểm tra việc tìm kiếm thành công khi nhập "Vai trò" hợp lệ vào thanh tìm kiếm
    [Tags]    @Test_create_user         @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra việc tìm kiếm thành công khi nhập "Vai trò" hợp lệ vào thanh tìm kiếm
    When Go to page list user
    And Search "text" in "Tìm kiếm" with "Đại diện NCC"
    Then Show list of "users"

Create_User_27: Kiểm tra việc tìm kiếm không thành công khi nhập "Mã người dùng" không hợp lệ vào thanh tìm kiếm
    [Tags]    @Test_create_user         @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra việc tìm kiếm không thành công khi nhập "Mã người dùng" không hợp lệ vào thanh tìm kiếm
    When Go to page list user
    And Search "name code" in "Tìm kiếm" with "_RANDOM_"
    Then No users are shown

Create_User_28: Kiểm tra việc tìm kiếm không thành công khi nhập "Họ và tên" không hợp lệ vào thanh tìm kiếm
    [Tags]    @Test_create_user         @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra việc tìm kiếm không thành công khi nhập "Họ và tên" không hợp lệ vào thanh tìm kiếm
    When Go to page list user
    And Search "fullname" in "Tìm kiếm" with "_RANDOM_"
    Then No users are shown

Create_User_29: Kiểm tra việc tìm kiếm không thành công khi nhập "Email" không hợp lệ vào thanh tìm kiếm
    [Tags]    @Test_create_user         @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra việc tìm kiếm không thành công khi nhập "Email" không hợp lệ vào thanh tìm kiếm
    When Go to page list user
    And Search "email" in "Tìm kiếm" with "_RANDOM_"
    Then No users are shown

Create_User_30: Kiểm tra việc tìm kiếm không thành công khi nhập "Số điện thoại" không hợp lệ vào thanh tìm kiếm
    [Tags]    @Test_create_user         @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra việc tìm kiếm không thành công khi nhập "Số điện thoại" không hợp lệ vào thanh tìm kiếm
    When Go to page list user
    And Search "phone" in "Tìm kiếm" with "_RANDOM_"
    Then No users are shown

Create_User_31: Kiểm tra có thể xem danh sách trang kế tiếp, trước trước, trang cuối cùng, trang đầu tiên
    [Tags]    @Test_create_user         @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra có thể xem danh sách trang kế tiếp, trước trước, trang cuối cùng, trang đầu tiên
    When Go to page list user
    And Click ">" to "next" page
    Then Show list of "users"
    And Click "<" to "prev" page
    Then Show list of "users"
    And Click ">>" to "next_all" page
    Then Show list of "users"
    And Click "<<" to "prev_all" page
    Then Show list of "users"

### ============================================NAVIGATE EDIT USER PAGE=====================================================
Edit_User_01: Kiểm tra có thể điều hướng đến trang chỉnh sửa người dùng
    [Tags]    @Test_edit_user    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra có thể điều hướng đến trang chỉnh sửa người dùng
    Login to Admin
    And Click "Quản lý người dùng" menu
    And Select User need to edit
    Then User look title "Quản Lý Người Dùng"
    And User look contains title is "Chỉnh sửa người dùng"

## =====================================================VALIDATION TEXT=====================================================
Edit_User_02: Kiểm tra Validation text tại trường Họ và tên khi bỏ trong Họ và tên
    [Tags]    @Test_edit_user         @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation text tại trường Họ và tên khi bỏ trong Họ và tên
    When Go to page edit user
    And Enter "text" in "Họ và tên" with "${empty}"
    And Click in "Số điện thoại" field
    Then Required message "Họ và tên" displayed under "Xin vui lòng nhập tên người dùng" field

Edit_User_03: Kiểm tra Validation text tại trường Họ và tên khi nhập sai định dạng Họ và tên
    [Tags]    @Test_edit_user         @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation text tại trường Họ và tên khi nhập sai định dạng Họ và tên
    When Go to page edit user
    And Enter "number" in "Họ và tên" with "_RANDOM_"
    And Click in "Số điện thoại" field
    Then Required message "Họ và tên" displayed under "Xin vui lòng chỉ nhập chữ" field

Edit_User_04: Kiểm tra Validation text tại trường Số điện thoại khi không nhập Số điện thoại
    [Tags]    @Test_edit_user         @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation text tại trường Số điện thoại khi không nhập Số điện thoại
    When Go to page edit user
    And Enter "text" in "Số điện thoại" with "${empty}"
    And Click in "Họ và tên" field
    Then Required message "Số điện thoại" displayed under "Xin vui lòng nhập số điện thoại người dùng" field

Edit_User_05: Kiểm tra Validation text tại trường Số điện thoại khi nhập sai định dạng số điện thoại và nhỏ hơn 8 ký tự
    [Tags]    @Test_edit_user         @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation text tại trường Số điện thoại khi nhập sai định dạng số điện thoại và nhỏ hơn 8 ký tự
    When Go to page edit user
    And Enter "text" in "Số điện thoại" with "abcdef"
    And Click in "Họ và tên" field
    Then Required message "Số điện thoại" field displayed under "Xin vui lòng chỉ nhập số"
    And Required message "Số điện thoại" field displayed under "Xin vui lòng nhập tối thiểu 8 ký tự số"

Edit_User_06: Kiểm tra Validation text tại trường Số điện thoại khi nhập sai định dạng số điện thoại và lớn hơn 12 ký tự
    [Tags]    @Test_edit_user         @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation text tại trường Số điện thoại khi nhập sai định dạng số điện thoại và lớn hơn 12 ký tự
    When Go to page edit user
    And Enter "text" in "Số điện thoại" with "_RANDOM_"
    And Click in "Họ và tên" field
    Then Required message "Số điện thoại" field displayed under "Xin vui lòng chỉ nhập số"
    And Required message "Số điện thoại" field displayed under "Xin vui lòng nhập tối đa 12 ký tự số"

Edit_User_07: Kiểm tra Validation text tại trường Số điện thoại khi nhập Số điện thoại nhỏ hơn 8 ký tự
    [Tags]    @Test_edit_user         @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation text tại trường Số điện thoại khi nhập Số điện thoại nhỏ hơn 8 ký tự
    When Go to page edit user
    And Enter "phone_7" in "Số điện thoại" with "_RANDOM_"
    And Click in "Họ và tên" field
    Then Required message "Số điện thoại" displayed under "Xin vui lòng nhập tối thiểu 8 ký tự số" field

Edit_User_08: Kiểm tra Validation text tại trường Số điện thoại khi nhập Số điện thoại lớn hơn 12 ký tự
    [Tags]    @Test_edit_user         @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation text tại trường Số điện thoại khi nhập Số điện thoại lớn hơn 12 ký tự
    When Go to page edit user
    And Enter "phone_invalid" in "Số điện thoại" with "_RANDOM_"
    And Click in "Họ và tên" field
    Then Required message "Số điện thoại" displayed under "Xin vui lòng nhập tối đa 12 ký tự số" field

Edit_User_09: Kiểm tra Validation text tại trường Số điện thoại khi nhập sai định dạng Số điện thoại và lớn hơn 8 ký tự nhưng nhỏ hơn 12 ký tự
    [Tags]    @Test_edit_user         @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation text tại trường Số điện thoại khi nhập sai định dạng Số điện thoại và lớn hơn 8 ký tự nhưng nhỏ hơn 12 ký tự
    When Go to page edit user
    And Enter "text" in "Số điện thoại" with "Hồ Văn Nhật"
    And Click in "Họ và tên" field
    Then Required message "Số điện thoại" displayed under "Xin vui lòng chỉ nhập số" field

Edit_User_10: Kiểm tra Validation text tại trường Ghi chú khi nhập quá 500 kí tự
    [Tags]    @Test_edit_user         @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation text tại trường Ghi chú khi nhập quá 500 kí tự
    When Go to page edit user
    And Enter "word" in textarea "Ghi chú" with "_RANDOM_"
    And Click in "Họ và tên" field
    Then Required message "Ghi chú" displayed under "Chỉ được nhập tối đa 500 kí tự" field

# ##=====================================================ERROR MESSAGE=====================================================
Edit_User_11: Kiểm tra error message khi chỉnh sửa người dùng với Số điện thoại đã tồn tại trên hệ thống
    [Tags]    @Test_edit_user         @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra error message khi chỉnh sửa người dùng với Số điện thoại đã tồn tại trên hệ thống
    When Go to page edit user
    And Enter "phone" in "Số điện thoại" with "0941225407"
    And Click "Lưu" button
    Then User look message "Số điện thoại hoặc email đã tồn tại trong hệ thống." popup

##=====================================================EDIT USER SUCCESSFULLY=====================================================
Edit_User_12: Kiểm tra thay đổi thành công thông tin người dùng khi thay đổi "Họ và tên"
    [Tags]    @Test_edit_user         @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra thay đổi thành công thông tin người dùng khi thay đổi "Họ và tên"
    When Go to page edit user
    And Enter "fullname" in "Họ và tên" with "Nguyễn Hữu Hưng Thịnh"
    And Click "Lưu" button
    Then User look message "Lưu người dùng thành công" popup
    And User look title "Quản Lý Người Dùng"
    And User look contains title is "Quản lý người dùng"

Edit_User_13 Kiểm tra thay đổi thành công thông tin người dùng khi thay đổi "Số điện thoại"
    [Tags]    @Test_edit_user         @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra thay đổi thành công thông tin người dùng khi thay đổi "Số điện thoại"
    When Go to page edit user
    And Enter "phone" in "Số điện thoại" with "_RANDOM_"
    And Click "Lưu" button
    Then User look message "Lưu người dùng thành công" popup
    And User look title "Quản Lý Người Dùng"
    And User look contains title is "Quản lý người dùng"

Edit_User_14: Kiểm tra thay đổi thành công thông tin người dùng khi thay đổi "Ghi chú"
    [Tags]    @Test_edit_user         @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra thay đổi thành công thông tin người dùng khi thay đổi "Ghi chú"
    When Go to page edit user
    And Enter "paragraph" in textarea "Ghi chú" with "Nguyễn Hữu Hưng Thịnh"
    And Click "Lưu" button
    Then User look message "Lưu người dùng thành công" popup
    And User look title "Quản Lý Người Dùng"
    And User look contains title is "Quản lý người dùng"

Edit_User_15: Kiểm tra có thể điều hướng đến trang danh sách người dùng từ trang chỉnh sửa người dùng
    [Tags]    @Test_edit_user         @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra có thể điều hướng đến trang danh sách người dùng từ trang chỉnh sửa người dùng
    When Go to page edit user
    And Click "Trở về" button
    Then User look title "Quản Lý Người Dùng"
    And User look contains title is "Quản lý người dùng"

*** Keywords ***
Select User need to edit
    And Search "email" in "Tìm kiếm" with "fateh62@example.net"
    ${element}    Set Variable   //td[contains(text(),'fateh62@example.net')]
    Click         ${element}        left        2

Go to page ${text} user
  Login to Admin
  And Click "Quản lý người dùng" menu
  IF  '${text}' == 'create'
    And Click "Thêm quản trị viên" button
  ELSE IF  '${text}' == 'edit'
    And Select User need to edit
  END

Increase the number of products displayed with "${number}"
  ${element}=       Get Elements      //div[3]//div[contains(@class, "ant-select-selector")]
  Wait Until Element Is Visible       ${element}[1]
  Click       ${element}[1]
  ${element}=       Get Element       //*[contains(@class, "ant-select-item-option-content") and text()='${number}']
  Click       ${element}
  Wait Until Element Spin
  Sleep   ${SHOULD_TIMEOUT}

Show list of "Users"
    Wait Until Element Spin
    ${elements}=        Get Elements        xpath=//*[contains(@class, "ant-table-row")]
    Run Keyword If    ${elements}     Display     ${elements}
    ...    ELSE    Log To Console     Không tồn tại người dùng nào!
Display
    [Arguments]    ${name}    ${elements}
    Log To Console    *************************-DANH SÁCH NGƯỜI DÙNG-**************************
    Wait Until Element Is Visible         ${elements}[0]
    ${count}=           Set Variable        1
    ${stt}=             Set Variable        1
    FOR  ${i}  IN  @{elements}
       ${user_code}    Get Text    //tbody/tr[${count}]/td[1]
       ${fullname}     Get Text    //tbody/tr[${count}]/td[2]
       ${email}        Get Text    //tbody/tr[${count}]/td[3]
       ${phone}        Get Text    //tbody/tr[${count}]/td[4]
       ${role}         Get Text    //tbody/tr[${count}]/td[5]
       Log To Console    ${stt}. Mã người dùng: ${user_code} | Họ và tên: ${fullname} | Email: ${email} | Số điện thoại: ${phone} | Vai trò: ${role}
       Log To Console    ============================================================================================================================================
       ${count}=    Evaluate    ${count} + 1
       ${stt}=    Evaluate    ${stt} + 1
    END
    ${total}=    Evaluate    ${count} - 1
    Log To Console    Tổng số lượng người dùng là: ${total}
