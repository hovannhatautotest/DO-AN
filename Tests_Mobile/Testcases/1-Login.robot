*** Settings ***
Library             AppiumLibrary
Resource            ../Keywords/common.robot
Test Setup          Open App Balance
Test Teardown       Tear Down

*** Test Cases ***
####***************************************LOGIN************************************************************************
####======================================VERIFY VALIDATION TEXT======================================================
LG_01: Kiểm tra validation text khi bỏ trống trường "Tên đăng nhập"
    [Tags]    Test_Login    Validation Text
    [Documentation]   Kiểm tra validation text khi bỏ trống trường "Tên đăng nhập"
    When Enter "password" in "Mật khẩu" with "_RANDOM_"
    And Click "Đăng Nhập" button
    Then Show validation text in "Tên đăng nhập" field with "Đây là trường bắt buộc!"

LG_02: Kiểm tra validation text khi bỏ trống trường "Mật khẩu"
    [Tags]    Test_Login    Validation Text
    [Documentation]   Kiểm tra validation text khi bỏ trống trường "Mật khẩu"
    When Enter "email" in "Tên đăng nhập" with "_RANDOM_"
    And Click "Đăng Nhập" button
    Then Show validation text in "Mật khẩu" field with "Đây là trường bắt buộc!"

LG_03: Kiểm tra validation text khi bỏ trống trường "Tên đăng nhập và ""Mật khẩu"
    [Tags]    Test_Login    Validation Text
    [Documentation]   Kiểm tra validation text khi bỏ trống trường "Tên đăng nhập và ""Mật khẩu"
    When Enter "email" in "Tên đăng nhập" with "${empty}"
    When Enter "password" in "Mật khẩu" with "${empty}"
    When Click "Đăng Nhập" button
    Then Show validation text in "Tên đăng nhập" field with "Đây là trường bắt buộc!"
    And Show validation text in "Mật khẩu" field with "Đây là trường bắt buộc!"

LG_04: Kiểm tra validation text khi nhập "Tên đăng nhập" sai định dạng email
    [Tags]    Test_Login    Validation Text
    [Documentation]   Kiểm tra validation text khi nhập "Tên đăng nhập" sai định dạng email
    When Enter "text" in "Tên đăng nhập" with "_RANDOM_"
    And Enter "password" in "Mật khẩu" with "_RANDOM_"
    When Click "Đăng Nhập" button
    Then Show validation text in "Tên đăng nhập" field with "Vui lòng nhập địa chỉ email hợp lệ!"

###=============================================ERROR MESSAGE============================================================
LG_05: Kiểm tra hiển thị thông báo lỗi khi nhập sai "Tên đăng nhập"
    [Tags]    Test_Login    Error Message
    [Documentation]   Kiểm tra hiển thị thông báo lỗi khi nhập sai "Tên đăng nhập"
    When Enter "email" in "Tên đăng nhập" with "_RANDOM_"
    And Enter "password" in "Mật khẩu" with "Nhat@01101999"
    And Click "Đăng Nhập" button
    Then Display popup with "Thất bại"
    And User look message "Tài khoản chưa được tạo hoặc chưa được kích hoạt." popup

LG_06: Kiểm tra hiển thị thông báo lỗi khi nhập sai "Mật khẩu"
    [Tags]    Test_Login    Error Message
    [Documentation]   Kiểm tra hiển thị thông báo lỗi khi nhập sai "Mật khẩu"
    When Enter "email" in "Tên đăng nhập" with "minhminh@getnada.com"
    And Enter "password" in "Mật khẩu" with "_RANDOM_"
    And Click "Đăng Nhập" button
    Then Display popup with "Thất bại"
    And User look message "Tài khoản hoặc mật khẩu không đúng, vui lòng thử lại" popup

LG_07: Kiểm tra hiển thị thông báo lỗi khi nhập sai "Tên đăng nhập" và "Mật khẩu"
    [Tags]    Test_Login    Error Message
    [Documentation]   Kiểm tra hiển thị thông báo lỗi khi nhập sai "Tên đăng nhập" và "Mật khẩu"
    When Enter "email" in "Tên đăng nhập" with "_RANDOM_"
    And Enter "password" in "Mật khẩu" with "_RANDOM_"
    And Click "Đăng Nhập" button
    Then Display popup with "Thất bại"
    And User look message "Tài khoản chưa được tạo hoặc chưa được kích hoạt." popup

###=============================================LOGIN SUCCESSFULLY=======================================================
LG_08: Kiểm tra đăng nhập thành công tài khoản "Store"
    [Tags]    Test_Login    Successful Message
    [Documentation]   Kiểm tra đăng nhập thành công tài khoản "Store"
    When Enter "email" in "Tên đăng nhập" with "minhminh@getnada.com"
    And Enter "password" in "Mật khẩu" with "Nhat@01101999"
    And Click "Đăng Nhập" button
    Then Verify login successful user "Store" with "Chào mừng bạn đã đến với BALANCE!"
#
LG_09: Kiểm tra đăng nhập thành công tài khoản "Supplier"
    [Tags]    Test_Login    Successful Message
    [Documentation]   Kiểm tra đăng nhập thành công tài khoản "Supplier"
    When Enter "email" in "Tên đăng nhập" with "ha@getnada.com"
    And Enter "password" in "Mật khẩu" with "Nhat@01101999"
    And Click "Đăng Nhập" button
    Then Verify login successful user "Store" with "Chào mừng bạn đã đến với BALANCE!"

##========================================DISPLAY PASSWORD=========================================================
LG_10: Kiểm tra có thể hiển thị mật khẩu dưới dạng text
    [Tags]    Test_Login    Display Password
    [Documentation]     Kiểm tra có thể hiển thị mật khẩu dưới dạng text
    When Enter "email" in "Tên đăng nhập" with "_RANDOM_"
    And Enter "password" in "Mật khẩu" with "_RANDOM_"
    Then User look "Mật khẩu" field with type password is "true"
    And Show password in "Mật khẩu"
    Then User look "Mật khẩu" field with type password is "false"

#FORGOT PASSWORD#
*** Test Cases ***
ForgotPassword_01: Kiểm tra có thể điều hướng đến trang "Quên mật khẩu"
    [Tags]    Test_ForgotPassword
    [Documentation]   Kiểm tra thông tin đăng nhập sẽ không còn khi làm mới trang web
    When Click link "Quên mật khẩu?"
    Then User look title with "Quên Mật Khẩu"
    And User look content with "Vui lòng nhập e-mail của bạn. Mã xác minh OTP sẽ được gửi cho bạn"

ForgotPassword_02: Kiểm tra validation text khi không nhập "Email khôi phục"
    [Tags]    Test_ForgotPassword    Validation Text
    [Documentation]   Kiểm tra validation text khi không nhập "Email khôi phục"
    When Click link "Quên mật khẩu?"
    And Enter "email" in "Email khôi phục" with "${empty}"
    And Click "Lấy mã OTP" button
    Then Show validation text in "Email khôi phục" field with "Đây là trường bắt buộc!"

ForgotPassword_03: Kiểm tra validation text khi nhập "Email khôi phục" sai định dạng email
    [Tags]    Test_ForgotPassword    Validation Text
    [Documentation]   Kiểm tra validation text khi nhập "Email khôi phục" sai định dạng email
    When Click link "Quên mật khẩu?"
    And Enter "text" in "Email khôi phục" with "_RANDOM_"
    And Click "Lấy mã OTP" button
    Then Show validation text in "Email khôi phục" field with "Vui lòng nhập địa chỉ email hợp lệ!"

ForgotPassword_04: Kiểm tra hiển thị thông báo lỗi khi nhập "Email khôi phục" không tồn tại trên hệ thống
    [Tags]    Test_ForgotPassword    Error Message
    [Documentation]   Kiểm tra hiển thị thông báo lỗi khi nhập "Email khôi phục" không tồn tại trên hệ thống
    When Click link "Quên mật khẩu?"
    And Enter "email" in "Email khôi phục" with "_RANDOM_"
    And Click "Lấy mã OTP" button
    Then Display popup with "Thất bại"
    And User look message "Địa chỉ email không tồn tại, vui lòng thử địa chỉ email khác." popup

ForgotPassword_05: Kiểm tra có thể điều hướng đến trang nhập mã OTP khi nhập "Email khôi phục hợp lệ"
    [Tags]    Test_ForgotPassword    Success Message
    [Documentation]   Kiểm tra có thể điều hướng đến trang nhập mã OTP khi nhập "Email khôi phục hợp lệ"
    When Click link "Quên mật khẩu?"
    And Enter "email" in "Email khôi phục" with "92t4709016@husc.edu.vn"
    And Click "Lấy mã OTP" button
    Then User look content with "Vui lòng nhập e-mail của bạn. Mã xác minh OTP sẽ được gửi cho bạn"

ForgotPassword_06: Kiểm tra validation text khi không nhập "Mã OTP"
    [Tags]    Test_ForgotPassword    Validation Text
    [Documentation]   Kiểm tra validation text khi không nhập "Mã OTP"
    When Click link "Quên mật khẩu?"
    And Enter "email" in "Email khôi phục" with "92t4709016@husc.edu.vn"
    And Click "Lấy mã OTP" button
    And Enter "OTP" in "Mã OTP" with "${empty}"
    And Click "Gửi OTP" button
    Then Show validation text in "Mã OTP" field with "Đây là trường bắt buộc!"

ForgotPassword_07: Kiểm tra hiển thị thông báo lỗi khi nhập "Mã OTP" không hợp lệ
    [Tags]    Test_ForgotPassword    Error Message
    [Documentation]   Kiểm tra hiển thị thông báo lỗi khi nhập "Mã OTP" không hợp lệ
    When Click link "Quên mật khẩu?"
    And Enter "email" in "Email khôi phục" with "92t4709016@husc.edu.vn"
    And Click "Lấy mã OTP" button
    And Enter "phone" in "Mã OTP" with "_RANDOM_"
    And Click "Gửi OTP" button
    Then Display popup with "Thất bại"
    And User look message "Mã OTP sai hoặc hết thời hạn sử dụng." popup

ForgotPassword_08: Kiểm tra có thể điều hướng đến trang thay đổi mật khẩu khi nhập đúng "Mã OTP"
    [Tags]    Test_ForgotPassword    Success Message
    [Documentation]   Kiểm tra có thể điều hướng đến trang thay đổi mật khẩu khi nhập đúng "Mã OTP"
    When Click link "Quên mật khẩu?"
    And Enter "email" in "Email khôi phục" with "92t4709016@husc.edu.vn"
    And Click "Lấy mã OTP" button
    And Enter "OTP" in "Mã OTP" with "123456"
    And Click "Gửi OTP" button
    Then User look title with "Đặt Lại Mật Khẩu"
    And User look content with "Mật khẩu yêu cầu có 8 ký tự trở lên, có ít nhất 1 chữ hoa, 1 chữ thường, 1 chữ số và 1 kí tự đặc biệt."

#CHANGE PASSWORD#
*** Test Cases ***
ChangePassword_01: Kiểm tra Validation text khi không nhập cả "Mật khẩu" và "Xác nhận mật khẩu"
    [Tags]    Test_ChangePassword    Validation Text
    [Documentation]   Kiểm tra Validation text khi không nhập cả "Mật khẩu" và "Xác nhận mật khẩu"
    When Go to change password page
    And Click "Đổi mật khẩu" button
    Then Show validation text in "Mật khẩu" field with "Đây là trường bắt buộc!"
    And Show validation text in "Xác nhận mật khẩu" field with "Đây là trường bắt buộc!"

ChangePassword_02: Kiểm tra Validation text khi nhập "Mật khẩu" nhỏ hơn 8 ký tự
    [Tags]    Test_ChangePassword    Validation Text
    [Documentation]   Kiểm tra Validation text khi nhập "Mật khẩu" nhỏ hơn 8 ký tự
    When Go to change password page
    And Enter "7 character" in "Mật khẩu" with "1234567"
    And Enter "password" in "Xác nhận mật khẩu" with "1234567"
    And Click "Đổi mật khẩu" button
    Then Show validation text in "Mật khẩu" field with "Mật khẩu yêu cầu có 8 ký tự trở lên"

ChangePassword_03: Kiểm tra Validation text khi nhập "Mật khẩu" chứa khoảng trắng
    [Tags]    Test_ChangePassword    Validation Text
    [Documentation]   Kiểm tra Validation text khi nhập "Mật khẩu" chứa khoảng trắng
    When Go to change password page
    And Enter "text" in "Mật khẩu" with "Hồ Văn Nhật"
    And Enter "password" in "Xác nhận mật khẩu" with "Hồ Văn Nhật"
    And Click "Đổi mật khẩu" button
    Then Show validation text in "Mật khẩu" field with "Mật khẩu không được có khoảng trắng"

ChangePassword_04: Kiểm tra Validation text khi nhập "Mật khẩu" chưa đúng yêu cầu
    [Tags]    Test_ChangePassword    Validation Text
    [Documentation]   Kiểm tra Validation text khi nhập "Mật khẩu" chứa khoảng trắng
    When Go to change password page
    And Enter "number" in "Mật khẩu" with "hovannhat"
    And Enter "password" in "Xác nhận mật khẩu" with "hovannhat"
    And Click "Đổi mật khẩu" button
    Then Show validation text in "Mật khẩu" field with "Mật khẩu yêu cầu có 8 ký tự trở lên, có ít nhất 1 chữ hoa, 1 chữ thường, 1 chữ số và 1 kí tự đặc biệt"

ChangePassword_05: Kiểm tra Validation text khi nhập "Xác nhận mật khẩu" không trùng với "Mật khẩu"
    [Tags]    Test_ChangePassword    Validation Text
    [Documentation]   Kiểm tra Validation text khi nhập "Xác nhận mật khẩu" không trùng với "Mật khẩu"
    When Go to change password page
    And Enter "password" in "Mật khẩu" with "_RANDOM_"
    And Enter "password" in "Xác nhận mật khẩu" with "_RANDOM_"
    And Click "Đổi mật khẩu" button
    Then Show validation text in "Mật khẩu" field with "Xác nhận mật khẩu không chính xác"
    And Show validation text in "Xác nhận mật khẩu" field with "Xác nhận mật khẩu không chính xác"

ChangePassword_06: Kiểm tra hiển thị thông báo khi thay đổi mật khẩu thành công
    [Tags]    Test_ChangePassword    Successful Message
    [Documentation]   Kiểm tra hiển thị thông báo khi thay đổi mật khẩu thành công
    When Go to change password page
    And Enter "password" in "Mật khẩu" with "Nhat@01101999"
    And Enter "password" in "Xác nhận mật khẩu" with "Nhat@01101999"
    And Click "Đổi mật khẩu" button
    Then Display popup with "Thành Công"
    And User look message "Đổi mật khẩu thành công." popup

ChangePassword_07: Kiểm tra hiển thị "Mật khẩu" và "Xác nhận mật khẩu" dưới dạng text
    [Tags]    Test_ChangePassword    Display Password
    [Documentation]   Kiểm tra hiển thị "Mật khẩu" và "Xác nhận mật khẩu" dưới dạng text
    When Go to change password page
    And Enter "password" in "Mật khẩu" with "Nhat@01101999"
    And Show password in "Mật khẩu"
    Then User look "Mật khẩu" field with type password is "false"
    And Enter "password" in "Xác nhận mật khẩu" with "Nhat@01101999"
    And Show password in "Xác nhận mật khẩu"
    Then User look "Xác nhận mật khẩu" field with type password is "false"

*** Keywords ***
Go to change password page
    When Click link "Quên mật khẩu?"
    And Enter "email" in "Email khôi phục" with "92t4709016@husc.edu.vn"
    And Click "Lấy mã OTP" button
    And Enter "OTP" in "Mã OTP" with "123456"
    And Click "Gửi OTP" button

# Nhập giá trị vào trường dữ liệu trên form.
Enter "${type}" in "${name}" with "${text}"
    ${text}=                  Get Random Text                   ${type}                       ${text}
    IF  '${name}' == 'Tên đăng nhập' or '${name}' == 'Email khôi phục'
        ${id}            set variable                      email
    ELSE IF  '${name}' == 'Mật khẩu'
        ${id}            set variable                     password
    ELSE IF  '${name}' == 'Mã OTP'
        ${id}            set variable                     otp
    ELSE IF  '${name}' == 'Xác nhận mật khẩu'
        ${id}            set variable                     passwordComfirm
    END
    ${element}=               set variable          //*[@resource-id="${id}"]
    wait until page contains element          ${element}        ${BROWSER_TIMEOUT}
    clear text                ${element}
    input text                ${element}                        ${text}

Show validation text in "${name}" field with "${text}"
    IF  '${name}' == 'Tên đăng nhập' or '${name}' == 'Email khôi phục'
        ${id}            set variable                      email
    ELSE IF  '${name}' == 'Mật khẩu'
        ${id}            set variable                     password
    ELSE IF  '${name}' == 'Mã OTP'
        ${id}            set variable                     otp
    ELSE IF  '${name}' == 'Xác nhận mật khẩu'
        ${id}            set variable                     passwordComfirm
    END
    IF  '${name}' == 'Mật khẩu' or '${name}' == 'Xác nhận mật khẩu'
        ${element}=     Get Element Form Item By Name     ${name}       //android.widget.EditText[@resource-id="${id}"]/../../..//android.view.View[@text="${text}"]
    ELSE IF  '${name}' != 'Mật khẩu'
        ${element}=     Get Element Form Item By Name     ${name}       //android.widget.EditText[@resource-id="${id}"]/../..//android.view.View[@text="${text}"]
    END
    wait until page contains element          ${element}        ${BROWSER_TIMEOUT}
    element text should be          ${element}          ${text}

# Kiểm tra mật khẩu có hiển thị hay không khi click icon "eye"
User look "${name}" field with type password is "${type}"
    IF  '${name}' == 'Mật khẩu'
        ${id}            set variable                     password
    ELSE IF  '${name}' == 'Xác nhận mật khẩu'
        ${id}            set variable                     passwordComfirm
    END
    ${element}=        Get Element Form Item By Name        ${name}        //android.widget.EditText[@resource-id="${id}"]
    wait until page contains element          ${element}    ${BROWSER_TIMEOUT}
    ${password_field_type}=        get element attribute    ${element}        password
    Should Be Equal As Strings        ${password_field_type}            ${type}

User look in "${name}" field with "${text}"
    IF  '${name}' == 'Tên đăng nhập'
        ${type-text}            set variable                      false
    ELSE IF  '${name}' == 'Mật khẩu'
        ${type-text}            set variable                      true
    END
    ${element}=               Get Element Form Item By Name     ${name}           //android.widget.EditText[@password="${type-text}"]
    wait until page contains element          ${element}        ${BROWSER_TIMEOUT}
    element text should be      ${element}      ${text}

#FORGOT PASSWORD#
User look button with "${text}"
    ${element}=               set variable          //android.widget.Button[@text="${text}"]
    wait until page contains element          ${element}        ${BROWSER_TIMEOUT}
    element text should be                  ${element}          ${text}

Show password in "${name}"
    IF  '${name}' == 'Mật khẩu'
        ${id}            set variable                     password
    ELSE IF  '${name}' == 'Xác nhận mật khẩu'
        ${id}            set variable                     passwordComfirm
    END
    ${element}=               Get Element Form Item By Name     ${name}           //android.widget.EditText[@resource-id="${id}"]/..//android.widget.TextView[@password="false"]
    click element             ${element}
