*** Settings ***
Resource            ../keywords/common.robot
Test Setup          Setup
Test Teardown       Tear Down

*** Variables ***
${email_reset_password}      hoangdieu1810@gmail.com
${email khôi phục}          routes.auth.reset-password.Recovery Email

*** Test Cases ***
###***************************************LOGIN************************************************************************
###======================================VERIFY VALIDATION TEXT======================================================
LG_01: Kiểm tra đăng nhập không thành công khi bỏ trống trường "Tên đăng nhập"
    [Tags]    @Test_Login    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra đăng nhập không thành công khi bỏ trống trường "Tên đăng nhập"
    When Enter "text" in "Mật khẩu" with "_RANDOM_"
    And Click "Đăng Nhập" button
    Then Required message "Tên đăng nhập" displayed under "This is a required field!" field

LG_02: Kiểm tra đăng nhập không thành công khi bỏ trống trường "Mật khẩu"
    [Tags]    @Test_Login    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra đăng nhập không thành công khi bỏ trống trường "Mật khẩu"
    When Enter "email" in "Tên đăng nhập" with "_RANDOM_"
    And Click "Đăng Nhập" button
    Then Required message "Mật khẩu" displayed under "This is a required field!" field

LG_03: Kiểm tra đăng nhập không thành công khi bỏ trống cả "Tên đăng nhập" và "Mật khẩu"
    [Tags]    @Test_Login    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra đăng nhập không thành công khi bỏ trống cả "Tên đăng nhập" và "Mật khẩu"
    When Click "Đăng Nhập" button
    Then Required message "Tên đăng nhập" displayed under "This is a required field!" field
    And Required message "Mật khẩu" displayed under "This is a required field!" field

LG_04: Kiểm tra đăng nhập không thành công khi nhập "Tên đăng nhập" sai định dạng email
    [Tags]    @Test_Login    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra đăng nhập không thành công khi nhập "Tên đăng nhập" sai định dạng email
    When Enter "text" in "Tên đăng nhập" with "_RANDOM_"
    And Enter "text" in "Mật khẩu" with "${empty}"
    Then Required message "Tên đăng nhập" displayed under "Please enter a valid email address!" field

##=============================================ERROR MESSAGE============================================================
LG_05: Kiểm tra đăng nhập không thành công khi nhập sai "Tên đăng nhập"
    [Tags]    @Test_Login    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra đăng nhập không thành công khi nhập sai "Tên đăng nhập"
    When Enter "email" in "Tên đăng nhập" with "_RANDOM_"
    And Enter "text" in "Mật khẩu" with "Ari123456#"
    And Click "Đăng Nhập" button
    Then User look message "Tài khoản chưa được tạo hoặc chưa được kích hoạt." popup

LG_06: Kiểm tra đăng nhập không thành công khi nhập sai "Mật khẩu"
    [Tags]    @Test_Login    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra đăng nhập không thành công khi nhập sai "Mật khẩu"
    When Enter "email" in "Tên đăng nhập" with "admin_balan@getnada.com"
    And Enter "test name" in "Mật khẩu" with "_RANDOM_"
    And Click "Đăng Nhập" button
    Then User look message "Tài khoản hoặc mật khẩu không đúng, vui lòng thử lại" popup

LG_07: Kiểm tra đăng nhập không thành công khi nhập sai cả Tên đăng nhập và Mật khẩu
    [Tags]    @Test_Login    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra đăng nhập không thành công khi nhập sai cả Tên đăng nhập và Mật khẩu
    When Enter "email" in "Tên đăng nhập" with "_RANDOM_"
    And Enter "text" in "Mật khẩu" with "_RANDOM_"
    And Click "Đăng Nhập" button
    Then User look message "Tài khoản chưa được tạo hoặc chưa được kích hoạt." popup

LG_08: Kiểm tra đăng nhập không thành công khi tài khoản đã bị hủy kích hoạt
    [Tags]    @Test_Login    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra đăng nhập không thành công khi tài khoản đã bị hủy kích hoạt
    When Enter "email" in "Tên đăng nhập" with "lehuyen@getnada.com"
    And Enter "text" in "Mật khẩu" with "_RANDOM_"
    And Click "Đăng Nhập" button
    Then User look message "Tài khoản bị hủy kích hoạt, vui lòng liên hệ quản trị viên để giải quyết. Xin lỗi vì sự bất tiện này." popup

##=============================================LOGIN SUCCESSFULLY=======================================================
LG_09: Kiểm tra đăng nhập thành công tài khoản Admin
    [Tags]    @Test_Login    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra đăng nhập thành công tài khoản Admin
    When Login to Admin
    Then User look title "Tra Cứu Dữ Liệu"
    And User look dashboard "BALANCE"
    And Check Welcome Message Text Is "Chào mừng bạn đã đến với BALANCE!"
    And User look menu "Quản lý kho"
    And User look menu "Quản lý kết nối"
    And User look menu "Quản lý người dùng"
    And User look menu "Quản lý hàng hóa"
    And User look menu "Quản lý nhà cung cấp"
    And User look menu "Quản lý cửa hàng"
    And User look menu "Quản lý doanh thu"
    And User look menu "Cấu hình chung"

LG_10: Kiểm tra đăng nhập thành công tài khoản Store
    [Tags]    @Test_Login    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra đăng nhập thành công tài khoản Store
    When Login to Store
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

LG_11: Kiểm tra đăng nhập thành công tài khoản Supplier
    [Tags]    @Test_Login    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra đăng nhập thành công tài khoản Supplier
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

LG_12: Kiểm tra đăng nhập thành công bằng phím Enter
    [Tags]    @Test_Login    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra đăng nhập thành công bằng phím Enter
    When Enter "email" in "Tên đăng nhập" with "test_admin@gmail.com"
    And Enter "text" in "Mật khẩu" with "Nhat@01101999"
    And Enter at "Mật khẩu" field to Login
    Then User look title "Tra Cứu Dữ Liệu"

## ========================================DISPLAY PASSWORD=========================================================
LG_13: Kiểm tra có thể hiển thị mật khẩu dưới dạng text
    [Tags]    @Test_Login    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra có thể hiển thị mật khẩu dưới dạng text
    When Enter "text" in "Mật khẩu" with "_RANDOM_"
    And Click "Eye" icon to display password
    Then User look "Mật khẩu" field with type "text"

## -===============================================RELOAD PAGE=====================================================
LG_14: Kiểm tra thông tin nhập sẽ bị xóa sau khi reload trang web
    [Tags]    @Test_Login    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra thông tin nhập sẽ bị xóa sau khi reload trang web
    When Enter "email" in "Tên đăng nhập" with "_RANDOM_"
    And Enter "text" in "Mật khẩu" with "_RANDOM_"
    And Reload Page
    Then User look "Tên đăng nhập" field empty
    And User look "Mật khẩu" field empty

####*********************************FORGOT PASSWORD====================================================================
##==========================================NAVIGATE FORGOT PASSWORD====================================================
LG_15: Kiểm tra chuyển hướng đến trang Quên mật khẩu
    [Tags]    @Test_Login    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra chuyển hướng đến trang Quên mật khẩu
    When Click "Quên mật khẩu?" link
    Then User look title "titles.Forgot Password"
    And User look contains title is "Quên Mật Khẩu"

##=================================VALIDATION TEXT FORGOT PASSWORD========================================================
LG_16: Kiểm tra quên mật khẩu không thành công khi không nhập email
    [Tags]    @Test_Login    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra quên mật khẩu không thành công khi không nhập email
    When Navigate to forgot password page
    And Click "Lấy mã OTP" button
    Then Required message "${email khôi phục}" displayed under "This is a required field!" field

LG_17: Kiểm tra quên mật khẩu không thành công khi nhập sai định dạng email
    [Tags]    @Test_Login    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra quên mật khẩu không thành công khi nhập sai định dạng email
    When Navigate to forgot password page
    And Enter "text" in "${email khôi phục}" with "_RANDOM_"
    And Click "Lấy mã OTP" button
    Then Required message "${email khôi phục}" displayed under "Please enter a valid email address!" field

##========================================ERROR MESSAGE FORGOT PASSWORD PAGE============================================
LG_18: Kiểm tra quên mật khẩu không thành công khi nhập email không tồn tại trên hệ thống
    [Tags]    @Test_Login    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra quên mật khẩu không thành công khi nhập email không tồn tại trên hệ thống
    When Navigate to forgot password page
    And Enter "email" in "${email khôi phục}" with "_RANDOM_"
    And Click "Lấy mã OTP" button
    Then User look message "Địa chỉ email không tồn tại, vui lòng thử địa chỉ email khác." popup

#=====================================FORGOT PASSWORD SUCCESSFUL=======================================================
LG_19: Kiểm tra điều hướng thành công đến trang nhập mã OTP khi quên mật khẩu thành công
    [Tags]    @Test_Login    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra điều hướng thành công đến trang nhập mã OTP khi quên mật khẩu thành công
    When Navigate to forgot password page
    And Enter "email" in "${email khôi phục}" with "${email_reset_password}"
    And Click "Lấy mã OTP" button
    Then User lok button with "Gửi OTP"
    And User look text with "Vui lòng nhập mã OTP đã gửi đến email của bạn"

##***************************************ENTER OTP*********************************************************************
##========================================VALIDATION TEXT OTP PAGE=====================================================
LG_20: Kiểm tra Validation text trường "Mã OTP" khi bỏ trống mã OTP
    [Tags]    @Test_Login    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation text trường "Mã OTP" khi bỏ trống mã OTP
    When Navigate to enter OTP page
    When Click "Gửi OTP" button
    Then Required message "Mã OTP" displayed under "This is a required field!" field

###============================ERROR MESSAGE ENTER OTP PAGE=============================================================
LG_21: Kiểm tra hiển thị thông báo lỗi khi nhập sai mã OTP
    [Tags]    @Test_Login    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra error message khi nhập sai mã OTP
    When Navigate to enter OTP page
    And Enter "otp" in "Mã OTP" with "_RANDOM_"
    And Click "Gửi OTP" button
    Then User look message "Mã OTP sai hoặc hết thời hạn sử dụng." popup

####======================================NAVIGATE TO CHANGE PASSWORD SUCCESSFULL=========================================
LG_22: Kiểm tra có thể điều hướng đến trang thay đổi mật khẩu thành công khi nhập đúng mã OTP
    [Tags]    @Test_Change_Password    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra có thể điều hướng đến trang thay đổi mật khẩu thành công khi nhập đúng mã OTP
    When Navigate to enter OTP page
    And Enter "otp" in "Mã OTP" with "123456"
    And Click "Gửi OTP" button
    Then User look title "Reset Password"
    And User look contains title is "Đặt Lại Mật Khẩu"

###****************************************CHANGE PASSWORD**************************************************************
###======================================VALIDATION TEXT CHANGE PASSWORD PAGE============================================
LG_23: Kiểm tra Validation text khi không nhập cả "Mật khẩu" và "Xác nhận mật khẩu"
    [Tags]    @Test_Change_Password     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation text khi không nhập cả "Mật khẩu" và "Xác nhận mật khẩu"
    When Go to change password page
    And Click "Đổi mật khẩu" button
    Then Required message "Mật khẩu" displayed under "This is a required field!" field
    And Required message "Xác nhận mật khẩu" displayed under "This is a required field!" field

LG_24: Kiểm tra Validation text khi không nhập "Mật khẩu"
    [Tags]    @Test_Change_Password     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation text khi không nhập "Mật khẩu"
    When Go to change password page
    And Enter "password" in "Mật khẩu" with "${empty}"
    And Click in "Xác nhận mật khẩu" field
    Then Required message "Mật khẩu" displayed under "This is a required field!" field

LG_25: Kiểm tra Validation text khi nhập "Mật khẩu" nhỏ hơn 8 ký tự
    [Tags]    @Test_Change_Password     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation text khi nhập "Mật khẩu" nhỏ hơn 8 ký tự
    When Go to change password page
    And Enter "7 character" in "Mật khẩu" with "_RANDOM_"
    And Click in "Xác nhận mật khẩu" field
    Then Required message "Mật khẩu" displayed under "Mật khẩu yêu cầu có 8 ký tự trở lên" field

LG_26: Kiểm tra Validation text khi nhập "Mật khẩu" chứa khoảng trắng
    [Tags]    @Test_Change_Password     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation text khi nhập "Mật khẩu" chứa khoảng trắng
    When Go to change password page
    And Enter "text" in "Mật khẩu" with "_RANDOM_"
    And Click in "Xác nhận mật khẩu" field
    Then Required message "Mật khẩu" displayed under "Mật khẩu không được có khoảng trắng" field

LG_27: Kiểm tra Validation text khi nhập "Mật khẩu" chưa đúng yêu cầu về bảo mật
    [Tags]    @Test_Change_Password     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation text khi nhập "Mật khẩu" chưa đúng yêu cầu về bảo mật
    When Go to change password page
    And Enter "number" in "Mật khẩu" with "_RANDOM_"
    And Click in "Xác nhận mật khẩu" field
    Then Required message "Mật khẩu" displayed under "Mật khẩu yêu cầu có 8 ký tự trở lên, có ít nhất 1 chữ hoa, 1 chữ thường, 1 chữ số và 1 kí tự đặc biệt" field

LG_28: Kiểm tra Validation text khi không nhập "Xác nhận mật khẩu"
    [Tags]    @Test_Change_Password     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation text khi không nhập "Xác nhận mật khẩu"
    When Go to change password page
    And Enter "retype password" in "Xác nhận mật khẩu" with "${empty}"
    And Click in "Mật khẩu" field
    Then Required message "Xác nhận mật khẩu" displayed under "This is a required field!" field

LG_29: Kiểm tra Validation text khi nhập "Xác nhận mật khẩu" không chính xác
    [Tags]    @Test_Change_Password     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation text khi nhập "Xác nhận mật khẩu" không chính xác
    When Go to change password page
    And Enter "password" in "Mật khẩu" with "_RANDOM_"
    And Enter "password" in "Xác nhận mật khẩu" with "_RANDOM_"
    And Click "Đổi mật khẩu" button
    Then Required message "Mật khẩu" displayed under "Xác nhận mật khẩu không chính xác" field
    And Required message "Xác nhận mật khẩu" displayed under "Xác nhận mật khẩu không chính xác" field

####===================================CHANGE PASSWORD SUCCESSFULL=====================================================
LG_30: Kiểm tra successfull message khi thay đổi mật khẩu thành công
    [Tags]    @Test_Change_Password    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra successfull message khi thay đổi mật khẩu thành công
    When Go to change password page
    And Enter "password" in "Mật khẩu" with "Nhat@01101999"
    And Enter "retype password" in "Xác nhận mật khẩu" with "Nhat@01101999"
    And Click "Đổi mật khẩu" button
    Then User look message "Đổi mật khẩu thành công." popup
    And User look title "Login"

###====================================DISPLAY PASSWORD===============================================================
LG_31: Kiểm tra có thể hiển thị trường "Mật khẩu" và "Xác nhận mật khẩu" dưới dạng text
    [Tags]    @Test_Change_Password     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra có thể hiển thị trường "Mật khẩu" và "Xác nhận mật khẩu" dưới dạng text
    When Go to change password page
    And Enter "password" in "Mật khẩu" with "_RANDOM_"
    And Enter "password" in "Xác nhận mật khẩu" with "_RANDOM_"
    And Click "Eye" icon to display password when reset password
    Then User look "Mật khẩu" field with type "text"
    And User look "Xác nhận mật khẩu" field with type "text"

#=====================================BACK TO LOGIN PAGE===============================================================
LG_32: Kiểm tra quay trở lại trang đăng nhập từ trang Quên mật khẩu
    [Tags]    @Test_Login    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra quay trở lại trang đăng nhập từ trang Quên mật khẩu
    When Navigate to forgot password page
    And Click "Quay trở lại Đăng nhập" link
    Then User look title "Login"

LG_33: Kiểm tra quay trở lại trang đăng nhập từ trang Nhập mã OTP
    [Tags]    @Test_Login    @Test_by_Hồ_Văn_Nhật
    [Documentation]       Kiểm tra quay trở lại trang đăng nhập từ trang Nhập mã OTP
    When Navigate to enter OTP page
    And Click "Quay trở lại Đăng nhập" link
    Then User look title "Login"

*** Keywords ***
Go to change password page
  When Click "Quên mật khẩu?" link
  And Enter "email" in "${email khôi phục}" with "${email_reset_password}"
  And Click "Lấy mã OTP" button
  And Enter "otp" in "Mã OTP" with "123456"
  And Click "Gửi OTP" button

Click "Eye" icon to display password when reset password
  ${elements}     Get Elements    xpath=//*[contains(@class, 'text-lg')][1]
  FOR  ${element}  IN  @{elements}
      Click     ${element}
  END

Navigate to forgot password page
    When Click "Quên mật khẩu?" link

Navigate to enter OTP page
  When Navigate to forgot password page
  And Enter "email" in "${email khôi phục}" with "${email_reset_password}"
  And Click "Lấy mã OTP" button
  Sleep       ${SHOULD_TIMEOUT}

User lok button with "${text}"
  ${button}     Get Text      xpath=//button[contains(text(),'${text}')]
  Should Be Equal     ${text}     ${button}

User look text with "${text}"
  Wait Until Element Is Visible         //h5[contains(text(),'Vui lòng nhập mã OTP đã gửi đến email của b')]
  ${text_actual}        Get Text         //h5[contains(text(),'Vui lòng nhập mã OTP đã gửi đến email của b')]
  Should Be Equal       ${text}        ${text_actual}
