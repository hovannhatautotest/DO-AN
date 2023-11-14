*** Settings ***
Resource            ../Keywords/common.robot
Test Setup          Preconditions
Test Teardown       Tear Down

*** Variables ***
${USER_STORE}          minhminh@getnada.com
${USER_SUPPLIER}       ha@getnada.com
${PASSWORD}            Nhat@01101999

*** Test Cases ***
####===============================ĐIỀU HƯỚNG ĐẾN TRANG THÔNG TIN CÁ NHÂN=================================================
PRO_01: Kiểm tra có thể điều hướng đến trang chỉnh sửa thông tin cá nhân
    [Tags]    Test_Update_Profile   Navigate_to_update_profile
    [Documentation]   Kiểm tra có thể điều hướng đến trang chỉnh sửa thông tin cá nhân
    And Go to "update profile" page
    Then User look title with "Thông tin cá nhân"

####==============================VALIDATION TEXT TAB THÔNG TIN CÁ NHÂN=================================
PRO_02: Kiểm tra Validation text khi bỏ trống trường "Họ và tên"
    [Tags]    Test_Update_Profile   Validation Text
    [Documentation]   Kiểm tra Validation text khi bỏ trống trường "Họ và tên"
    And Go to "update profile" page
    And Enter "text" in "Họ và tên" field with "${empty}"
    And Click "Lưu" button
    Then Show validation text in "Họ và tên" field with "Xin vui lòng nhập tên người dùng"

PRO_03: Kiểm tra Validation text trường "Họ và tên" khi nhập họ và tên không hợp lệ
    [Tags]    Test_Update_Profile   Validation Text
    [Documentation]   Kiểm tra Validation text trường "Họ và tên" khi nhập họ và tên không hợp lệ
    And Go to "update profile" page
    And Enter "number" in "Họ và tên" field with "_RANDOM_"
    And Click "Lưu" button
    Then Show validation text in "Họ và tên" field with "Xin vui lòng chỉ nhập chữ"

PRO_04: Kiểm tra Validation text trường "Email" khi không nhập Email
    [Tags]    Test_Update_Profile   Validation Text
    [Documentation]   Kiểm tra Validation text trường "Email" khi không nhập Email
    And Go to "update profile" page
    And Enter "email" in "Email" field with "${empty}"
    And Click "Lưu" button
    Then Show validation text in "Email" field with "Xin vui lòng nhập email"

PRO_05: Kiểm tra Validation text trường "Email" khi nhập sai định dạng Email
    [Tags]    Test_Update_Profile   Validation Text
    [Documentation]   Kiểm tra Validation text trường "Email" khi nhập sai định dạng Email
    And Go to "update profile" page
    And Enter "text" in "Email" field with "_RANDOM_"
    And Click "Lưu" button
    Then Show validation text in "Email" field with "Vui lòng nhập địa chỉ email hợp lệ!"

PRO_06: Kiểm tra Validation text trường "Số điện thoại" khi không nhập Số điện thoại
    [Tags]    Test_Update_Profile   Validation Text
    [Documentation]   Kiểm tra Validation text trường "Số điện thoại" khi không nhập Số điện thoại
    And Go to "update profile" page
    And Enter "phone" in "Số điện thoại" field with "${empty}"
    And Click "Lưu" button
    Then Show validation text in "Số điện thoại" field with "Xin vui lòng nhập số điện thoại người dùng"

PRO_07: Kiểm tra Validation text trường "Số điện thoại" khi nhập sai định dạng số điện thoại và nhỏ hơn 8 ký tự
    [Tags]    Test_Update_Profile   Validation Text
    [Documentation]   Kiểm tra Validation text trường "Số điện thoại" khi nhập sai định dạng số điện thoại và nhỏ hơn 8 ký tự
    And Go to "update profile" page
    And Enter "7 character" in "Số điện thoại" field with "_RANDOM_"
    And Click "Lưu" button
    Then Show validation text in "Số điện thoại" field with "Xin vui lòng chỉ nhập số"
    And Show validation text in "Số điện thoại" field with "Xin vui lòng nhập tối thiểu 8 ký tự số"

PRO_08: Kiểm tra Validation text trường "Số điện thoại" khi nhập sai định dạng số điện thoại và lớn hơn 12 ký tự
    [Tags]    Test_Update_Profile   Validation Text
    [Documentation]   Kiểm tra Validation text trường "Số điện thoại" khi nhập sai định dạng số điện thoại và lớn hơn 12 ký tự
    And Go to "update profile" page
    And Enter "> 12 character" in "Số điện thoại" field with "_RANDOM_"
    And Click "Lưu" button
    Then Show validation text in "Số điện thoại" field with "Xin vui lòng chỉ nhập số"
    And Show validation text in "Số điện thoại" field with "Xin vui lòng nhập tối đa 12 ký tự số"

PRO_09: Kiểm tra Validation text trường "Số điện thoại" khi nhập Số điện thoại nhỏ hơn 8 ký tự
    [Tags]    Test_Update_Profile   Validation Text
    [Documentation]   Kiểm tra Validation text trường "Số điện thoại" khi nhập Số điện thoại nhỏ hơn 8 ký tự
    And Go to "update profile" page
    And Enter "phone_7" in "Số điện thoại" field with "_RANDOM_"
    And Click "Lưu" button
    Then Show validation text in "Số điện thoại" field with "Xin vui lòng nhập tối thiểu 8 ký tự số"

PRO_10: Kiểm tra Validation text trường "Số điện thoại" khi nhập Số điện thoại lớn hơn 12 ký tự
    [Tags]    Test_Update_Profile   Validation Text
    [Documentation]   Kiểm tra Validation text trường "Số điện thoại" khi nhập Số điện thoại lớn hơn 12 ký tự
    And Go to "update profile" page
    And Enter "phone > 12 number" in "Số điện thoại" field with "_RANDOM_"
    And Click "Lưu" button
    Then Show validation text in "Số điện thoại" field with "Xin vui lòng nhập tối đa 12 ký tự số"

PRO_11: Kiểm tra Validation text trường "Số điện thoại" khi nhập sai định dạng Số điện thoại và lớn hơn 8 ký tự nhưng nhỏ hơn 12 ký tự
    [Tags]    Test_Update_Profile   Validation Text
    [Documentation]   Kiểm tra Validation text trường "Số điện thoại" khi nhập sai định dạng Số điện thoại và lớn hơn 8 ký tự nhưng nhỏ hơn 12 ký tự
    And Go to "update profile" page
    And Enter "text" in "Số điện thoại" field with "Hồ Văn Nhật"
    And Click "Lưu" button
    Then Show validation text in "Số điện thoại" field with "Xin vui lòng chỉ nhập số"

PRO_12: Kiểm tra Validation text trường "Ghi chú" khi nhập quá 500 kí tự
    [Tags]    Test_Update_Profile   Validation Text
    [Documentation]   Kiểm tra Validation text trường "Ghi chú" khi nhập quá 500 kí tự
    And Go to "update profile" page
    And Enter "> 500 character" in "Ghi chú" field with "_RANDOM_"
    And Click "Lưu" button
    Then Show validation text in "Ghi chú" field with "Chỉ được nhập tối đa 500 kí tự"

####============================================ERROR MESSAGE TAB THÔNG TIN CÁ NHÂN===================================================================
PRO_13: Kiểm tra hiển thị thông báo lỗi khi chỉnh sửa thông tin cá nhân với "Email" đã tồn tại trên hệ thống
    [Tags]    Test_Update_Profile   Error Message
    [Documentation]   Kiểm tra hiển thị thông báo lỗi khi chỉnh sửa thông tin cá nhân với "Email" đã tồn tại trên hệ thống
    And Go to "update profile" page
    And Enter "email" in "Email" field with "ha@getnada.com"
    And Click "Lưu" button
    Then Display popup with "Thất bại"
    And User look message "Số điện thoại hoặc email đã tồn tại trong hệ thống." popup

PRO_14: Kiểm tra hiển thị thông báo lỗi khi chỉnh sửa thông tin cá nhân với "Số điện thoại" đã tồn tại trên hệ thống
    [Tags]    Test_Update_Profile   Error Message
    [Documentation]   Kiểm tra hiển thị thông báo lỗi khi chỉnh sửa thông tin cá nhân với "Số điện thoại" đã tồn tại trên hệ thống
    And Go to "update profile" page
    And Enter "phone" in "Số điện thoại" field with "097899900"
    And Click "Lưu" button
    Then Display popup with "Thất bại"
    And User look message "Số điện thoại hoặc email đã tồn tại trong hệ thống." popup

###===================================UPDATE PROFILE SUCCESSFULLY===============================================
PRO_15: Kiểm tra hiển thị thông báo khi cập nhật thông tin cá nhân thành công
    [Tags]    Test_Update_Profile   Successful Message
    [Documentation]   Kiểm tra hiển thị thông báo khi cập nhật thông tin cá nhân thành công
    And Go to "update profile" page
    And Enter "name" in "Họ và tên" field with "Nguyễn Minh Minh"
    And Enter "email" in "Email" field with "minhminh1@getnada.com"
    And Enter "phone" in "Số điện thoại" field with "0968876897"
    And Click "Lưu" button
    Then Display popup with "Thành công"
    And User look message "Bạn đã thay đổi thông tin thành công, Vui lòng đăng nhập lại !" popup
    And Click "Lưu" button
    Then Display popup with "Thất bại"
    And User look message "Phiên đăng nhập đã hết hạn. Vui lòng đăng nhập lại!" popup
    When Update profile with email is "minhminh@getnada.com"

PRO_16: Kiểm tra có thể "Hủy thao tác" thành công khi thay đổi thông tin cá nhân
    [Tags]    Test_Update_Profile   Hủy thao tác
    [Documentation]   Kiểm tra có thể "Hủy thao tác" thành công khi thay đổi thông tin cá nhân
    And Go to "update profile" page
    And Enter "fullname" in "Họ và tên" field with "_RANDOM_"
    And Enter "email" in "Email" field with "_RANDOM_"
    And Enter "phone" in "Số điện thoại" field with "_RANDOM_"
    And Click "Hủy thao tác" button
    Then User look in "Họ và tên" field with 'Nguyễn Minh Minh'
    And User look in "Email" field with 'minhminh@getnada.com'
    And User look in "Số điện thoại" field with '0968876897'
    And User look in "Ghi chú" field with '${empty}'

###CHANGE PASSWORD###
*** Test Cases ***
ChangePassword_01: Kiểm tra Validation text khi không nhập thông tin cả
    [Tags]    Test_Change_Password   Validation Text
    [Documentation]   Kiểm tra Validation text khi không nhập thông tin cả
    When Login to Store
    And Go to "change password" page
    And Click "Đổi mật khẩu" button
    Then Show validation text in "Mật khẩu hiện tại" field with "Đây là trường bắt buộc!"
    And Show validation text in "Mật khẩu mới" field with "Đây là trường bắt buộc!"
    And Show validation text in "Xác nhận mật khẩu" field with "Đây là trường bắt buộc!"

ChangePassword_02: Kiểm tra Validation text trường "Mật khẩu mới" khi nhập mật khẩu mới nhỏ hơn 8 ký tự
    [Tags]    Test_Change_Password   Validation Text
    [Documentation]   Kiểm tra Validation text trường "Mật khẩu mới" khi nhập mật khẩu mới nhỏ hơn 8 ký tự
    When Login to Store
    And Go to change password page
    And Enter "password" in "Mật khẩu hiện tại" field with "_RANDOM_"
    And Enter "password" in "Mật khẩu mới" field with "User001"
    And Enter "password" in "Xác nhận mật khẩu" field with "User001"
    And Click "Đổi mật khẩu" button
    Then Show validation text in "Mật khẩu mới" field with "Mật khẩu yêu cầu có 8 ký tự trở lên"

ChangePassword_03: Kiểm tra Validation text khi nhập trường "Mật khẩu mới" và "Xác nhận mật khẩu" chứa khoảng trắng
    [Tags]    Test_Change_Password   Validation Text
    [Documentation]   Kiểm tra Validation text khi nhập trường "Mật khẩu mới" và "Xác nhận mật khẩu" chứa khoảng trắng
    When Login to Store
    And Go to "change password" page
    And Enter "password" in "Mật khẩu hiện tại" field with "_RANDOM_"
    And Enter "password" in "Mật khẩu mới" field with "Hồ Văn Nhật"
    And Enter "password" in "Xác nhận mật khẩu" field with "Hồ Văn Nhật"
    And Click "Đổi mật khẩu" button
    Then Show validation text in "Mật khẩu mới" field with "Mật khẩu không được có khoảng trắng"
    And Show validation text in "Xác nhận mật khẩu" field with "Mật khẩu không được có khoảng trắng"

ChangePassword_04: Kiểm tra Validation text trường "Mật khẩu mới" khi nhập mật khẩu mới không đủ độ bảo mật
    [Tags]    Test_Change_Password   Validation Text
    [Documentation]   Kiểm tra Validation text trường "Mật khẩu mới" khi nhập mật khẩu mới không đủ độ bảo mật
    When Login to Store
    And Go to "change password" page
    And Enter "password" in "Mật khẩu hiện tại" field with "_RANDOM_"
    And Enter "password" in "Mật khẩu mới" field with "hovannhat"
    And Enter "password" in "Xác nhận mật khẩu" field with "hovannhat"
    And Click "Đổi mật khẩu" button
    Then Show validation text in "Mật khẩu mới" field with "Mật khẩu yêu cầu có 8 ký tự trở lên, có ít nhất 1 chữ hoa, 1 chữ thường, 1 chữ số và 1 kí tự đặc biệt"

ChangePassword_05: Kiểm tra Validation text trường "Xác nhận mật khẩu" khi nhập xác nhận mật khẩu không đủ độ bảo mật
    [Tags]    Test_Change_Password   Validation Text
    [Documentation]   Kiểm tra Validation text trường "Xác nhận mật khẩu" khi nhập xác nhận mật khẩu không đủ độ bảo mật
    When Login to Store
    And Go to "change password" page
    And Enter "password" in "Xác nhận mật khẩu" field with "hovannhat"
    And Click "Đổi mật khẩu" button
    Then Show validation text in "Xác nhận mật khẩu" field with "Mật khẩu yêu cầu có 8 ký tự trở lên, có ít nhất 1 chữ hoa, 1 chữ thường, 1 chữ số và 1 kí tự đặc biệt"

ChangePassword_06: Kiểm tra Validation text trường "Xác nhận mật khẩu" khi nhập xác nhận mật khẩu không chính xác
    [Tags]    Test_Change_Password   Validation Text
    [Documentation]   Kiểm tra Validation text trường "Xác nhận mật khẩu" khi nhập xác nhận mật khẩu không đủ độ bảo mật
    When Login to Store
    And Go to "change password" page
    And Enter "password" in "Mật khẩu hiện tại" field with "_RANDOM_"
    And Enter "password" in "Mật khẩu mới" field with "_RANDOM_"
    And Enter "password" in "Xác nhận mật khẩu" field with "_RANDOM_"
    And Click "Đổi mật khẩu" button
    Then Show validation text in "Xác nhận mật khẩu" field with "Xác nhận mật khẩu không chính xác"

###=============================ERROR MESSAGE TAB ĐỔI MẬT KHẨU==========================================
ChangePassword_07: Kiểm tra hiển thị thông báo lỗi khi nhập "Mật khẩu hiện tại" không chính xác
    [Tags]    Test_Change_Password   Error Message
    [Documentation]   Kiểm tra hiển thị thông báo lỗi khi nhập "Mật khẩu hiện tại" không chính xác
    When Login to Store
    And Go to "change password" page
    And Enter "password" in "Mật khẩu hiện tại" field with "_RANDOM_"
    And Enter "password" in "Mật khẩu mới" field with "Nhat@011019999"
    And Enter "password" in "Xác nhận mật khẩu" field with "Nhat@011019999"
    And Click "Đổi mật khẩu" button
    Then Display popup with "Thất bại"
    And User look message "Mật khẩu nhập không đúng." popup

ChangePassword_08: Kiểm tra hiển thị thông báo lỗi khi nhập "Mật khẩu mới" trùng với "Mật khẩu hiện tại"
    [Tags]    Test_Change_Password   Error Message
    [Documentation]   Kiểm tra hiển thị thông báo lỗi khi nhập "Mật khẩu mới" trùng với "Mật khẩu hiện tại"
    When Login to Store
    And Go to "change password" page
    And Enter "password" in "Mật khẩu hiện tại" field with "Nhat@01101999"
    And Enter "password" in "Mật khẩu mới" field with "Nhat@01101999"
    And Enter "password" in "Xác nhận mật khẩu" field with "Nhat@01101999"
    And Click "Đổi mật khẩu" button
    Then Display popup with "Thất bại"
    And User look message "Mật khẩu trùng với mật khẩu hiện tại." popup

#==============================CHANGE PASSWORD SUCCESSFULLY=========================================
ChangePassword_09: Kiểm tra hiển thị thông báo khi thay đổi mật khẩu thành công
    [Tags]    Test_Change_Password   Successful Message
    [Documentation]   Kiểm tra hiển thị thông báo khi thay đổi mật khẩu thành công
    When Login to Store
    And Go to "change password" page
    And Enter "password" in "Mật khẩu hiện tại" field with "Nhat@01101999"
    And Enter "password" in "Mật khẩu mới" field with "Nhat@011019999"
    And Enter "password" in "Xác nhận mật khẩu" field with "Nhat@011019999"
    And Click "Đổi mật khẩu" button
    Then Display popup with "Thành công"
    And User look message "Đổi mật khẩu thành công!" popup
    When Enter "password" in "Mật khẩu hiện tại" field with "Nhat@011019999"
    And Enter "password" in "Mật khẩu mới" field with "Nhat@01101999"
    And Enter "password" in "Xác nhận mật khẩu" field with "Nhat@01101999"
    And Click "Đổi mật khẩu" button
    Then Display popup with "Thành công"
    And User look message "Đổi mật khẩu thành công!" popup

ChangePassword_10: Kiểm tra có thể thực hiện "Hủy thao tác" thành công
    [Tags]    Test_Change_Password   Hủy thao tác
    [Documentation]   Kiểm tra có thể thực hiện "Hủy thao tác" thành công
    When Login to Store
    And Go to "change password" page
    And Enter "password" in "Mật khẩu hiện tại" field with "_RANDOM_"
    And Enter "password" in "Mật khẩu mới" field with "_RANDOM_"
    And Enter "password" in "Xác nhận mật khẩu" field with "_RANDOM_"
    And Click "Hủy thao tác" button
    Then User look in "Mật khẩu hiện tại" field with '${empty}'
    And User look in "Mật khẩu mới" field with '${empty}'
    And User look in "Xác nhận mật khẩu" field with '${empty}'

ChangePassword_11: Kiểm tra có thể xem được mật khẩu tại các trường
    [Tags]    Test_Change_Password   Show password
    [Documentation]   Kiểm tra có thể xem được mật khẩu tại các trường
    When Login to Store
    And Go to "change password" page
    And Enter "password" in "Mật khẩu hiện tại" field with "Nhat@01101999"
    And User look "Mật khẩu hiện tại" field with type password is "true"
    And Show password in "Mật khẩu hiện tại"
    Then User look "Mật khẩu hiện tại" field with type password is "false"
    And Enter "password" in "Mật khẩu mới" field with "Nhat@011019999"
    And User look "Mật khẩu mới" field with type password is "true"
    And Show password in "Mật khẩu mới"
    And User look "Mật khẩu mới" field with type password is "false"
    And Enter "password" in "Xác nhận mật khẩu" field with "Nhat@011019999"
    And User look "Xác nhận mật khẩu" field with type password is "true"
    And Show password in "Xác nhận mật khẩu"
    Then User look "Xác nhận mật khẩu" field with type password is "false"

*** Keywords ***
Preconditions
    Open App Balance
    Login to Store

Go to "${name}" page
    ${element}=               set variable          //android.widget.Image[@text="profile_pic"]
    wait until page contains element                ${element}      ${BROWSER_TIMEOUT}
    click element                                   ${element}
    sleep           1
    IF  '${name}' == 'update profile'
        click element at coordinates        ${X_profile}     ${Y_profile}
    ELSE IF  '${name}' != 'update profile'
        click element at coordinates        ${X_changePassword}     ${Y_changePassword}
    END
#    swipe     333     1254      0       600       100

Enter "${type}" in "${name}" field with "${text}"
    ${text}=                  Get Random Text                   ${type}                       ${text}
    IF  '${name}' == 'Tên đăng nhập' or '${name}' == 'Email'
        ${id}            set variable                      email
    ELSE IF  '${name}' == 'Mật khẩu'
        ${id}            set variable                     password
    ELSE IF  '${name}' == 'Họ và tên'
        ${id}            set variable                      name
    ELSE IF  '${name}' == 'Số điện thoại'
        ${id}            set variable                      phoneNumber
    ELSE IF  '${name}' == 'Ghi chú'
        ${id}            set variable                     note
    ELSE IF  '${name}' == 'Mật khẩu hiện tại'
        ${id}            set variable                      password
    ELSE IF  '${name}' == 'Mật khẩu mới'
        ${id}            set variable                      passwordNew
    ELSE IF  '${name}' == 'Xác nhận mật khẩu'
        ${id}            set variable                      passwordComfirm
    END
    ${element}=               set variable          //android.widget.EditText[@resource-id="${id}"]
    wait until page contains element          ${element}        ${BROWSER_TIMEOUT}
    clear text                ${element}
    input text                ${element}                        ${text}

Login to Store
    When Enter "email" in "Tên đăng nhập" field with "${USER_STORE}"
    And Enter "password" in "Mật khẩu" field with "${PASSWORD}"
    And Click "Đăng Nhập" button
    Then User look content with "Chào mừng bạn đã đến với BALANCE!"

Show validation text in "${name}" field with "${text}"
    IF  '${name}' == 'Họ và tên'
        ${id}            set variable                      name
    ELSE IF  '${name}' == 'Email'
        ${id}            set variable                      email
    ELSE IF  '${name}' == 'Số điện thoại'
        ${id}            set variable                      phoneNumber
    ELSE IF  '${name}' == 'Ghi chú'
        ${id}            set variable                     note
    ELSE IF  '${name}' == 'Mật khẩu hiện tại'
        ${id}            set variable                      password
    ELSE IF  '${name}' == 'Mật khẩu mới'
        ${id}            set variable                      passwordNew
    ELSE IF  '${name}' == 'Xác nhận mật khẩu'
        ${id}            set variable                      passwordComfirm
    END
    ${element}=     Get Element Form Item By Name     ${name}       //android.widget.EditText[@resource-id="${id}"]/../../..//android.view.View[@text="${text}"]
    wait until page contains element          ${element}        ${BROWSER_TIMEOUT}
    element text should be          ${element}          ${text}

User look in "${name}" field with '${value}'
    IF  '${name}' == 'Họ và tên'
        ${id}            set variable                      name
    ELSE IF  '${name}' == 'Email'
        ${id}            set variable                      email
    ELSE IF  '${name}' == 'Số điện thoại'
        ${id}            set variable                      phoneNumber
    ELSE IF  '${name}' == 'Ghi chú'
        ${id}            set variable                     note
    ELSE IF  '${name}' == 'Mật khẩu hiện tại'
        ${id}            set variable                      password
    ELSE IF  '${name}' == 'Mật khẩu mới'
        ${id}            set variable                      passwordNew
    ELSE IF  '${name}' == 'Xác nhận mật khẩu'
        ${id}            set variable                      passwordComfirm
    END
    ${element}=               set variable          //android.widget.EditText[@resource-id="${id}"]
    wait until page contains element          ${element}        ${BROWSER_TIMEOUT}
    element text should be                    ${element}        ${value}

Show password in "${name}"
    IF  '${name}' == 'Mật khẩu hiện tại'
        ${id}            set variable                      password
    ELSE IF  '${name}' == 'Mật khẩu mới'
        ${id}            set variable                      passwordNew
    ELSE IF  '${name}' == 'Xác nhận mật khẩu'
        ${id}            set variable                      passwordComfirm
    END
    ${element}=               Get Element Form Item By Name     ${name}           //android.widget.EditText[@resource-id="${id}"]/..//android.widget.TextView[@password="false"]
    click element             ${element}

# Kiểm tra mật khẩu có hiển thị hay không khi click icon "eye"
User look "${name}" field with type password is "${type}"
    IF  '${name}' == 'Mật khẩu hiện tại'
        ${id}            set variable                      password
    ELSE IF  '${name}' == 'Mật khẩu mới'
        ${id}            set variable                      passwordNew
    ELSE IF  '${name}' == 'Xác nhận mật khẩu'
        ${id}            set variable                      passwordComfirm
    END
    ${element}=        Get Element Form Item By Name        ${name}        //android.widget.EditText[@resource-id="${id}"]
    wait until page contains element          ${element}    ${BROWSER_TIMEOUT}
    ${password_field_type}=        get element attribute    ${element}        password
    Should Be Equal As Strings        ${password_field_type}            ${type}

Update profile with email is "${text}"
    When Enter "email" in "Tên đăng nhập" field with "minhminh1@getnada.com"
    And Enter "password" in "Mật khẩu" field with "${PASSWORD}"
    And Click "Đăng Nhập" button
    And Go to "update profile" page
    And Enter "email" in "Email" field with "${text}"
    And Click "Lưu" button
    Then Display popup with "Thành công"
    And User look message "Bạn đã thay đổi thông tin thành công, Vui lòng đăng nhập lại !" popup
    And Logout Account
