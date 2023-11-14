*** Settings ***
Resource            ../keywords/common.robot

Test Setup          Setup
Test Teardown       Tear Down


*** Test Cases ***
##===============================ĐIỀU HƯỚNG ĐẾN TRANG THÔNG TIN CÁ NHÂN=================================================
PRO_01: Kiểm tra có thể điều hướng đến trang thông tin cá nhân
  [Tags]    @Test_Update_Profile   @Test_by_Hồ_Văn_Nhật
  [Documentation]   Kiểm tra có thể điều hướng đến trang thông tin cá nhân
  When Login to Admin
  And Click Avatar
  And Click Profile with "Thông tin cá nhân"
  Then User look title "Thông Tin Cá Nhân"
  And User look contains title is "Thông tin cá nhân"

###==============================VALIDATION TEXT TAB THÔNG TIN CÁ NHÂN=================================
PRO_02: Kiểm tra Validation text khi bỏ trống trường "Họ và tên"
  [Tags]    @Test_Update_Profile   @Test_by_Hồ_Văn_Nhật
  [Documentation]   Kiểm tra Validation text khi bỏ trống trường "Họ và tên"
  When Go to profile page with "Admin"
  And Enter "text" in "Họ và tên" with "${empty}"
  And Click in "Email" field
  Then Required message "Họ và tên" displayed under "Xin vui lòng nhập tên người dùng" field

PRO_03: Kiểm tra Validation text trường "Họ và tên" khi nhập họ và tên không hợp lệ
  [Tags]    @Test_Update_Profile   @Test_by_Hồ_Văn_Nhật
  [Documentation]   Kiểm tra Validation text trường "Họ và tên" khi nhập họ và tên không hợp lệ
  When Go to profile page with "Admin"
  And Enter "text" in "Họ và tên" with "_RANDOM_"
  And Click in "Email" field
  Then Required message "Họ và tên" displayed under "Xin vui lòng chỉ nhập chữ" field

PRO_04: Kiểm tra Validation text trường "Email" khi không nhập Email
  [Tags]    @Test_Update_Profile   @Test_by_Hồ_Văn_Nhật
  [Documentation]   Kiểm tra Validation text trường "Email" khi không nhập Email
  When Go to profile page with "Admin"
  And Enter "email" in "Email" with "${empty}"
  And Click in "Họ và tên" field
  Then Required message "Email" displayed under "Xin vui lòng nhập email" field

PRO_05: Kiểm tra Validation text trường "Email" khi nhập sai định dạng Email
  [Tags]    @Test_Update_Profile   @Test_by_Hồ_Văn_Nhật
  [Documentation]   Kiểm tra Validation text trường "Email" khi nhập sai định dạng Email
  When Go to profile page with "Admin"
  And Enter "text" in "Email" with "_RANDOM_"
  And Click in "Họ và tên" field
  Then Required message "Email" displayed under "Vui lòng nhập địa chỉ email hợp lệ!" field

PRO_06: Kiểm tra Validation text trường "Số điện thoại" khi không nhập Số điện thoại
  [Tags]    @Test_Update_Profile   @Test_by_Hồ_Văn_Nhật
  [Documentation]   Kiểm tra Validation text trường "Số điện thoại" khi không nhập Số điện thoại
  When Go to profile page with "Admin"
  And Enter "phone" in "Số điện thoại" with "${empty}"
  And Click in "Họ và tên" field
  Then Required message "Số điện thoại" displayed under "Xin vui lòng nhập số điện thoại người dùng" field

PRO_07: Kiểm tra Validation text trường "Số điện thoại" khi nhập sai định dạng số điện thoại và nhỏ hơn 8 ký tự
    [Tags]    @Test_Update_Profile        @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation text trường "Số điện thoại" khi nhập sai định dạng số điện thoại và nhỏ hơn 8 ký tự
    When Go to profile page with "Admin"
    And Enter "text" in "Số điện thoại" with "abcdef"
    And Click in "Họ và tên" field
    Then Required message "Số điện thoại" field displayed under "Xin vui lòng chỉ nhập số"
    And Required message "Số điện thoại" field displayed under "Xin vui lòng nhập tối thiểu 8 ký tự số"

PRO_08: Kiểm tra Validation text trường "Số điện thoại" khi nhập sai định dạng số điện thoại và lớn hơn 12 ký tự
    [Tags]    @Test_Update_Profile        @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation text trường "Số điện thoại" khi nhập sai định dạng số điện thoại và lớn hơn 12 ký tự
    When Go to profile page with "Admin"
    And Enter "text" in "Số điện thoại" with "_RANDOM_"
    And Click in "Họ và tên" field
    Then Required message "Số điện thoại" field displayed under "Xin vui lòng chỉ nhập số"
    And Required message "Số điện thoại" field displayed under "Xin vui lòng nhập tối đa 12 ký tự số"

PRO_09: Kiểm tra Validation text trường "Số điện thoại" khi nhập Số điện thoại nhỏ hơn 8 ký tự
    [Tags]    @Test_Update_Profile        @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation text trường "Số điện thoại" khi nhập Số điện thoại nhỏ hơn 8 ký tự
    When Go to profile page with "Admin"
    And Enter "phone_7" in "Số điện thoại" with "_RANDOM_"
    And Click in "Họ và tên" field
    Then Required message "Số điện thoại" displayed under "Xin vui lòng nhập tối thiểu 8 ký tự số" field

PRO_10: Kiểm tra Validation text trường "Số điện thoại" khi nhập Số điện thoại lớn hơn 12 ký tự
    [Tags]    @Test_Update_Profile        @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation text trường "Số điện thoại" khi nhập Số điện thoại lớn hơn 12 ký tự
    When Go to profile page with "Admin"
    And Enter "phone_invalid" in "Số điện thoại" with "_RANDOM_"
    And Click in "Họ và tên" field
    Then Required message "Số điện thoại" displayed under "Xin vui lòng nhập tối đa 12 ký tự số" field

PRO_11: Kiểm tra Validation text trường "Số điện thoại" khi nhập sai định dạng Số điện thoại và lớn hơn 8 ký tự nhưng nhỏ hơn 12 ký tự
    [Tags]    @Test_Update_Profile        @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation text trường "Số điện thoại" khi nhập sai định dạng Số điện thoại và lớn hơn 8 ký tự nhưng nhỏ hơn 12 ký tự
    When Go to profile page with "Admin"
    And Enter "text" in "Số điện thoại" with "Hồ Văn Nhật"
    And Click in "Họ và tên" field
    Then Required message "Số điện thoại" displayed under "Xin vui lòng chỉ nhập số" field

PRO_12: Kiểm tra Validation text trường "Ghi chú" khi nhập quá 500 kí tự
    [Tags]    @Test_Update_Profile        @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation text trường "Ghi chú" khi nhập quá 500 kí tự
    When Go to profile page with "Admin"
    And Enter "word" in textarea "Ghi chú" with "_RANDOM_"
    And Click in "Họ và tên" field
    Then Required message "Ghi chú" displayed under "Chỉ được nhập tối đa 500 kí tự" field

##============================================ERROR MESSAGE TAB THÔNG TIN CÁ NHÂN===================================================================
PRO_13: Kiểm tra hiển thị thông báo lỗi khi chỉnh sửa thông tin cá nhân với email đã tồn tại trên hệ thống
    [Tags]    @Test_Update_Profile        @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra hiển thị thông báo lỗi khi chỉnh sửa thông tin cá nhân với email đã tồn tại trên hệ thống
    When Go to profile page with "Admin"
    And Enter "email" in "Email" with "conheohong@mailinator.com"
    And Click "Lưu" button
    Then User look message "Số điện thoại hoặc email đã tồn tại trong hệ thống." popup

PRO_14: Kiểm tra hiển thị thông báo lỗi khi chỉnh sửa thông tin cá nhân với số điện thoại đã tồn tại trên hệ thống
    [Tags]    @Test_Update_Profile        @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra hiển thị thông báo lỗi khi chỉnh sửa thông tin cá nhân với số điện thoại đã tồn tại trên hệ thống
    When Go to profile page with "Admin"
    And Enter "phone" in "Số điện thoại" with "0941225407"
    And Click "Lưu" button
    Then User look message "Số điện thoại hoặc email đã tồn tại trong hệ thống." popup

##===================================UPDATE PROFILE SUCCESSFULLY===============================================
PRO_15: Kiểm tra cập nhật thông tin cá nhân thành công khi thay đổi "Họ và tên"
    [Tags]    @Test_Update_Profile        @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra cập nhật thông tin cá nhân thành công khi thay đổi "Họ và tên"
    When Go to profile page with "User1"
    And Enter "fullname" in "Họ và tên" with "_RANDOM_"
    And Click "Lưu" button
    Then User look message "" popup

PRO_16: Kiểm tra cập nhật thông tin cá nhân thành công khi thay đổi "Email"
    [Tags]    @Test_Update_Profile        @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra cập nhật thông tin cá nhân thành công khi thay đổi "Email"
    When Go to profile page with "User1"
    And Enter "email" in "Email" with "_RANDOM_"
    And Click "Lưu" button
    Then User look message "Bạn đã thay đổi thông tin thành công, Vui lòng đăng nhập lại !" popup

PRO_17: Kiểm tra cập nhật thông tin cá nhân thành công khi thay đổi "Số điện thoại"
    [Tags]    @Test_Update_Profile        @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra cập nhật thông tin cá nhân thành công khi thay đổi "Số điện thoại"
    When Go to profile page with "User2"
    And Enter "phone" in "Số điện thoại" with "_RANDOM_"
    And Click "Lưu" button
    Then User look message "" popup

PRO_18: Kiểm tra cập nhật thông tin cá nhân thành công khi thay đổi "Ghi chú"
    [Tags]    @Test_Update_Profile        @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra cập nhật thông tin cá nhân thành công khi thay đổi "Ghi chú"
    When Go to profile page with "User2"
    And Enter "text" in textarea "Ghi chú" with "_RANDOM_"
    And Click "Lưu" button
    Then User look message "" popup

PRO_19: Kiểm tra có thể hủy thao tác thành công khi thay đổi thông tin cá nhân
    [Tags]    @Test_Update_Profile        @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra có thể hủy thao tác thành công khi thay đổi thông tin cá nhân
    When Go to profile page with "User3"
    And Enter "fullname" in "Họ và tên" with "_RANDOM_"
    And Enter "email" in "Email" with "_RANDOM_"
    And Enter "phone" in "Số điện thoại" with "_RANDOM_"
    And Enter "text" in textarea "Ghi chú" with "_RANDOM_"
    And Click "Hủy thao tác" button
    Then User look in "Họ và tên" with "Usertest"
    And User look in "Email" with "user_test_03@gmail.com"
    And User look in "Số điện thoại" with "0125487952"
    And User look in textarea "Ghi chú" with "Đây là user"

##*******************************CHANGE PASSWORD=================================================
###==============================VALIDATION TEXT TAB ĐỔI MẬT KHẨU=================================
PRO_20: Kiểm tra Validation text khi không nhập thông tin cả
    [Tags]    @Test_Change_Password        @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation text khi không nhập thông tin cả
    When Go to change password page with "Admin"
    And Click "Đổi mật khẩu" button
    Then Required message "Mật khẩu hiện tại" displayed under "Đây là trường bắt buộc!" field
    And Required message "Mật khẩu mới" displayed under "Đây là trường bắt buộc!" field
    And Required message "Xác nhận mật khẩu" displayed under "Đây là trường bắt buộc!" field

PRO_21: Kiểm tra Validation text trường "Mật khẩu mới" khi nhập mật khẩu mới nhỏ hơn 8 ký tự
    [Tags]    @Test_Change_Password        @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation text trường "Mật khẩu mới" khi nhập mật khẩu mới nhỏ hơn 8 ký tự
    When Go to change password page with "Admin"
    And Enter "phone_7" in "Mật khẩu mới" with "_RANDOM_"
    And Click in "Mật khẩu hiện tại" field
    And Required message "Mật khẩu mới" displayed under "Mật khẩu yêu cầu có 8 ký tự trở lên" field

PRO_22: Kiểm tra Validation text trường "Mật khẩu mới" khi nhập mật khẩu mới chứa khoảng trắng
    [Tags]    @Test_Change_Password        @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation text trường "Mật khẩu mới" khi nhập mật khẩu mới chứa khoảng trắng
    When Go to change password page with "Admin"
    And Enter "text" in "Mật khẩu mới" with "_RANDOM_"
    And Click in "Mật khẩu hiện tại" field
    And Required message "Mật khẩu mới" displayed under "Mật khẩu không được có khoảng trắng" field

PRO_23: Kiểm tra Validation text trường "Mật khẩu mới" khi nhập mật khẩu mới không đủ độ bảo mật
    [Tags]    @Test_Change_Password        @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation text trường "Mật khẩu mới" khi nhập mật khẩu mới không đủ độ bảo mật
    When Go to change password page with "Admin"
    And Enter "text" in "Mật khẩu mới" with "hovannhat"
    And Click in "Mật khẩu hiện tại" field
    And Required message "Mật khẩu mới" displayed under "Mật khẩu yêu cầu có 8 ký tự trở lên, có ít nhất 1 chữ hoa, 1 chữ thường, 1 chữ số và 1 kí tự đặc biệt" field

PRO_24: Kiểm tra Validation text trường "Xác nhận mật khẩu" khi nhập xác nhận mật khẩu chứa khoảng trắng
    [Tags]    @Test_Change_Password        @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation text trường "Xác nhận mật khẩu" khi nhập xác nhận mật khẩu chứa khoảng trắng
    When Go to change password page with "Admin"
    And Enter "text" in "Xác nhận mật khẩu" with "_RANDOM_"
    And Click in "Mật khẩu hiện tại" field
    And Required message "Xác nhận mật khẩu" displayed under "Mật khẩu không được có khoảng trắng" field

PRO_25: Kiểm tra Validation text trường "Xác nhận mật khẩu" khi nhập xác nhận mật khẩu không đủ độ bảo mật
    [Tags]    @Test_Change_Password        @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation text trường "Xác nhận mật khẩu" khi nhập xác nhận mật khẩu không đủ độ bảo mật
    When Go to change password page with "Admin"
    And Enter "text" in "Xác nhận mật khẩu" with "hovannhat"
    And Click in "Mật khẩu hiện tại" field
    And Required message "Xác nhận mật khẩu" displayed under "Mật khẩu yêu cầu có 8 ký tự trở lên, có ít nhất 1 chữ hoa, 1 chữ thường, 1 chữ số và 1 kí tự đặc biệt" field

PRO_26: Kiểm tra Validation text trường "Xác nhận mật khẩu" khi nhập xác nhận mật khẩu không chính xác
    [Tags]    @Test_Change_Password        @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation text trường "Xác nhận mật khẩu" khi nhập xác nhận mật khẩu không chính xác
    When Go to change password page with "Admin"
    And Enter "text" in "Mật khẩu mới" with "Nhat@01101999"
    And Enter "text" in "Xác nhận mật khẩu" with "Hovannhat@01101999"
    And Click in "Mật khẩu hiện tại" field
    And Required message "Xác nhận mật khẩu" displayed under "Xác nhận mật khẩu không chính xác" field

##=============================ERROR MESSAGE TAB ĐỔI MẬT KHẨU==========================================
PRO_27: Kiểm tra hiển thị thông báo lỗi khi nhập mật khẩu hiện tại không đúng
    [Tags]    @Test_Change_Password        @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra hiển thị thông báo lỗi khi nhập mật khẩu hiện tại không đúng
    When Go to change password page with "Admin"
    And Enter "password" in "Mật khẩu hiện tại" with "_RANDOM_"
    And Enter "password" in "Mật khẩu mới" with "Nhat@01101999"
    And Enter "password" in "Xác nhận mật khẩu" with "Nhat@01101999"
    And Click "Đổi mật khẩu" button
    Then User look message "Mật khẩu nhập không đúng." popup

PRO_28: Kiểm tra hiển thị thông báo lỗi khi nhập "Mật khẩu mới" trùng với "Mật khẩu hiện tại"
    [Tags]    @Test_Change_Password        @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra hiển thị thông báo lỗi khi nhập "Mật khẩu mới" trùng với "Mật khẩu hiện tại"
    When Go to change password page with "Admin"
    And Enter "text" in "Mật khẩu hiện tại" with "Nhat@01101999"
    And Enter "text" in "Mật khẩu mới" with "Nhat@01101999"
    And Enter "text" in "Xác nhận mật khẩu" with "Nhat@01101999"
    And Click "Đổi mật khẩu" button
    Then User look message "Mật khẩu trùng với mật khẩu hiện tại." popup

##==============================CHANGE PASSWORD SUCCESSFULLY=========================================
PRO_29: Kiểm tra hiển thị thông báo thành công khi thay đổi mật khẩu
    [Tags]    @Test_Change_Password        @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra hiển thị thông báo thành công khi thay đổi mật khẩu
    When Go to change password page with "User2"
    And Enter "password" in "Mật khẩu hiện tại" with "Nhat@01101999"
    And Enter "password" in "Mật khẩu mới" with "Nhat@011019999"
    And Enter "password" in "Xác nhận mật khẩu" with "Nhat@011019999"
    And Click "Đổi mật khẩu" button
    Then User look message "Đổi mật khẩu thành công!" popup

PRO_30: Kiểm tra có thể hủy thao tác thành công khi thay đổi mật khẩu
    [Tags]    @Test_Change_Password        @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra có thể hủy thao tác thành công khi thay đổi mật khẩu
    When Go to change password page with "User3"
    And Enter "password" in "Mật khẩu hiện tại" with "_RANDOM_"
    And Enter "password" in "Mật khẩu mới" with "_RANDOM_"
    And Enter "password" in "Xác nhận mật khẩu" with "_RANDOM_"
    And Click "Hủy thao tác" button
    Then User look in "Mật khẩu hiện tại" with "${empty}"
    And User look in "Mật khẩu mới" with "${empty}"
    And User look in "Xác nhận mật khẩu" with "${empty}"

PRO_31: Kiểm tra có thể hển thị mật khẩu cả 3 trường dưới dạng text
    [Tags]    @Test_Change_Password        @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra có thể hển thị mật khẩu cả 3 trường dưới dạng text
    When Go to change password page with "User3"
    And Enter "email" in "Mật khẩu hiện tại" with "_RANDOM_"
    And Enter "email" in "Mật khẩu mới" with "_RANDOM_"
    And Enter "email" in "Xác nhận mật khẩu" with "_RANDOM_"
    And Click "Eye" icon to display password when change password
    Then User look "Mật khẩu hiện tại" field with type "text"
    And User look "Mật khẩu mới" field with type "text"
    And User look "Xác nhận mật khẩu" field with type "text"

*** Keywords ***
Click Avatar
  ${ELEMENT}    Get Element      //section[@id='dropdown-profile']
  WAIT UNTIL ELEMENT IS VISIBLE     ${ELEMENT}
  Click   ${ELEMENT}

Click Profile with "${name}"
  Sleep       1
  ${ELEMENT}    Get Element      //li[contains(text(), '${name}')]
  WAIT UNTIL ELEMENT IS VISIBLE     ${ELEMENT}
  Click   ${ELEMENT}

Go to profile page with "${account}"
  When Login to ${account}
  And Click Avatar
  And Click Profile with "Thông tin cá nhân"
  Sleep      1

Go to change password page with "${account}"
  When Login to ${account}
  And Click Avatar
  And Click Profile with "Đổi mật khẩu"

User look in "${name}" with "${text}"
  ${element}=               Get Element Form Item By Name     ${name}                       //input[contains(@class, "ant-input")]
  Element Text Should Be    ${element}    ${text}

User look in textarea "${name}" with "${text}"
  ${element}=               Get Element Form Item By Name     ${name}                       //textarea
  Element Text Should Be    ${element}    ${text}

Click "Eye" icon to display password when change password
  ${elements}     Get Elements    xpath=//*[contains(@class, 'text-lg')][1]
  FOR  ${element}  IN  @{elements}
      Click     ${element}
  END
