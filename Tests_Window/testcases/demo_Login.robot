*** Settings ***
Resource            ../keywords/common.robot
Test Setup          Setup
Test Teardown       Tear Down

*** Variables ***
${email_reset_password}      92t4709016@husc.edu.vn
${email khôi phục}          routes.auth.reset-password.Recovery Email

*** Test Cases ***
TEST CASE 01: TEST CHỨC NĂNG ĐĂNG NHẬP
    When Click "Đăng Nhập" button
    Then Required message "Tên đăng nhập" displayed under "This is a required field!" field
    And Required message "Mật khẩu" displayed under "This is a required field!" field

    When Reload Page
    And Enter "text" in "Mật khẩu" with "_RANDOM_"
    And Click "Đăng Nhập" button
    Then Required message "Tên đăng nhập" displayed under "This is a required field!" field

    When Reload Page
    And Enter "email" in "Tên đăng nhập" with "_RANDOM_"
    And Click "Đăng Nhập" button
    Then Required message "Mật khẩu" displayed under "This is a required field!" field

    When Reload Page
    And Enter "text" in "Tên đăng nhập" with "_RANDOM_"
    And Click in "Mật khẩu" field
    Then Required message "Tên đăng nhập" displayed under "Please enter a valid email address!" field

    When Reload Page
    And Enter "email" in "Tên đăng nhập" with "minhminh@getnada.com"
    And Enter "test name" in "Mật khẩu" with "_RANDOM_"
    And Click "Đăng Nhập" button
    Then User look message "Tài khoản hoặc mật khẩu không đúng, vui lòng thử lại" popup

    When Reload Page
    And Enter "email" in "Tên đăng nhập" with "_RANDOM_"
    And Enter "text" in "Mật khẩu" with "_RANDOM_"
    And Click "Đăng Nhập" button
    Then User look message "Tài khoản chưa được tạo hoặc chưa được kích hoạt." popup

    When Reload Page
    And Login to Store
    Then User look title "Tra Cứu Dữ Liệu"
    And User look dashboard "BALANCE"
    And Check Welcome Message Text Is "Chào mừng bạn đã đến với BALANCE!"
    And User look menu "Đặt hàng"
    And User look menu "Quản lý kho"
    And User look menu "Báo cáo"
    And User look menu "Quản lý kết nối"
    And User look menu "Quản lý người dùng"
    And User look menu "Quản lý hàng hóa"
    And User look menu "Quản lý NCC"
    And User look menu "Quản lý cửa hàng"
    When Logout Account

    When Login to Supplier
    Then User look title "Tra Cứu Dữ Liệu"
    And User look dashboard "BALANCE"
    And Check Welcome Message Text Is "Chào mừng bạn đã đến với BALANCE!"
    And User look menu "Quản lý đơn hàng"
    And User look menu "Quản lý trả hàng"
    And User look menu "Quản lý khuyến mãi"
    And User look menu "Quản lý kết nối"
    And User look menu "Quản lý hàng hóa"
    And User look menu "Quản lý nhà cung cấp"
    When Logout Account

    When Enter "email" in "Tên đăng nhập" with "minhminh@getnada.com"
    And Enter "text" in "Mật khẩu" with "Nhat@01101999"
    And Enter at "Mật khẩu" field to Login
    Then User look title "Tra Cứu Dữ Liệu"
    When Logout Account

    When Enter "text" in "Mật khẩu" with "_RANDOM_"
    And Click "Eye" icon to display password
    Then User look "Mật khẩu" field with type "text"

    When Enter "email" in "Tên đăng nhập" with "_RANDOM_"
    And Enter "text" in "Mật khẩu" with "_RANDOM_"
    And Reload Page
    Then User look "Tên đăng nhập" field empty
    And User look "Mật khẩu" field empty

TEST CASE 02: TEST CHỨC NĂNG LẤY LẠI MẬT KHẨU
    When Click "Quên mật khẩu?" link
    Then User look title "titles.Forgot Password"
    And User look contains title is "Quên Mật Khẩu"

    And Click "Lấy mã OTP" button
    Then Required message "${email khôi phục}" displayed under "This is a required field!" field

    And Enter "text" in "${email khôi phục}" with "_RANDOM_"
    And Click "Lấy mã OTP" button
    Then Required message "${email khôi phục}" displayed under "Please enter a valid email address!" field

    And Enter "email" in "${email khôi phục}" with "_RANDOM_"
    And Click "Lấy mã OTP" button
    Then User look message "Địa chỉ email không tồn tại, vui lòng thử địa chỉ email khác." popup

    When Reload Page
    And Enter "email" in "${email khôi phục}" with "${email_reset_password}"
    And Click "Lấy mã OTP" button
    Then User lok button with "Gửi OTP"
    And User look text with "Vui lòng nhập mã OTP đã gửi đến email của bạn"

    When Click "Gửi OTP" button
    Then Required message "Mã OTP" displayed under "This is a required field!" field

    And Enter "otp" in "Mã OTP" with "_RANDOM_"
    And Click "Gửi OTP" button
    Then User look message "Mã OTP sai hoặc hết thời hạn sử dụng." popup

    When Reload Page
    And Enter "otp" in "Mã OTP" with "123456"
    And Click "Gửi OTP" button
    Then User look title "Reset Password"
    And User look contains title is "Đặt Lại Mật Khẩu"

    And Click "Đổi mật khẩu" button
    Then Required message "Mật khẩu" displayed under "This is a required field!" field
    And Required message "Xác nhận mật khẩu" displayed under "This is a required field!" field

    And Reload Page
    And Enter "password" in "Mật khẩu" with "${empty}"
    And Click in "Xác nhận mật khẩu" field
    Then Required message "Mật khẩu" displayed under "This is a required field!" field

    And Reload Page
    And Enter "7 character" in "Mật khẩu" with "_RANDOM_"
    And Click in "Xác nhận mật khẩu" field
    Then Required message "Mật khẩu" displayed under "Mật khẩu yêu cầu có 8 ký tự trở lên" field

    And Reload Page
    And Enter "text" in "Mật khẩu" with "_RANDOM_"
    And Click in "Xác nhận mật khẩu" field
    Then Required message "Mật khẩu" displayed under "Mật khẩu không được có khoảng trắng" field

    And Reload Page
    And Enter "number" in "Mật khẩu" with "_RANDOM_"
    And Click in "Xác nhận mật khẩu" field
    Then Required message "Mật khẩu" displayed under "Mật khẩu yêu cầu có 8 ký tự trở lên, có ít nhất 1 chữ hoa, 1 chữ thường, 1 chữ số và 1 kí tự đặc biệt" field

    And Reload Page
    And Enter "retype password" in "Xác nhận mật khẩu" with "${empty}"
    And Click in "Mật khẩu" field
    Then Required message "Xác nhận mật khẩu" displayed under "This is a required field!" field

    And Reload Page
    And Enter "password" in "Mật khẩu" with "_RANDOM_"
    And Enter "password" in "Xác nhận mật khẩu" with "_RANDOM_"
    And Click "Đổi mật khẩu" button
    Then Required message "Mật khẩu" displayed under "Xác nhận mật khẩu không chính xác" field
    And Required message "Xác nhận mật khẩu" displayed under "Xác nhận mật khẩu không chính xác" field

    And Reload Page
    And Enter "password" in "Mật khẩu" with "_RANDOM_"
    And Enter "password" in "Xác nhận mật khẩu" with "_RANDOM_"
    And Click "Eye" icon to display password when reset password
    Then User look "Mật khẩu" field with type "text"
    And User look "Xác nhận mật khẩu" field with type "text"

    And Reload Page
    And Enter "password" in "Mật khẩu" with "Nhat@01101999"
    And Enter "retype password" in "Xác nhận mật khẩu" with "Nhat@01101999"
    And Click "Đổi mật khẩu" button
    Then User look message "Đổi mật khẩu thành công." popup
    And User look title "Login"

*** Keywords ***
Click "Eye" icon to display password when reset password
  ${elements}     Get Elements    xpath=//*[contains(@class, 'text-lg')][1]
  FOR  ${element}  IN  @{elements}
      Click     ${element}
  END

User lok button with "${text}"
    ${button}     Get Text      xpath=//button[contains(text(),'${text}')]
    Should Be Equal     ${text}     ${button}

User look text with "${text}"
    Wait Until Element Is Visible         //h5[contains(text(),'Vui lòng nhập mã OTP đã gửi đến email của b')]
    ${text_actual}        Get Text         //h5[contains(text(),'Vui lòng nhập mã OTP đã gửi đến email của b')]
    Should Be Equal       ${text}        ${text_actual}

Logout Account
    ${ELEMENT}    Get Element      //section[@id='dropdown-profile']
    WAIT UNTIL ELEMENT IS VISIBLE     ${ELEMENT}
    Click   ${ELEMENT}
    Sleep     1
    ${ELEMENT}    Get Element      //li[contains(text(), 'Đăng xuất')]
    WAIT UNTIL ELEMENT IS VISIBLE     ${ELEMENT}
    Click   ${ELEMENT}
