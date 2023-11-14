*** Settings ***
Library             AppiumLibrary
Resource            ../Keywords/common.robot
Test Setup          Open App Balance
Test Teardown       Tear Down

*** Test Cases ***
LG_01: KIỂM TRA CHỨC NĂNG ĐĂNG NHẬP
    When Click "Đăng Nhập" button
    Then Show validation text in "Tên đăng nhập" field with "Đây là trường bắt buộc!"
    And Show validation text in "Mật khẩu" field with "Đây là trường bắt buộc!"

    When Enter "password" in "Mật khẩu" with "_RANDOM_"
    And Click "Đăng Nhập" button
    Then Show validation text in "Tên đăng nhập" field with "Đây là trường bắt buộc!"

    When Enter "email" in "Tên đăng nhập" with "_RANDOM_"
    When Enter "password" in "Mật khẩu" with "${empty}"
    And Click "Đăng Nhập" button
    Then Show validation text in "Mật khẩu" field with "Đây là trường bắt buộc!"

    When Enter "text" in "Tên đăng nhập" with "_RANDOM_"
    And Enter "password" in "Mật khẩu" with "_RANDOM_"
    And Click "Đăng Nhập" button
    Then Show validation text in "Tên đăng nhập" field with "Vui lòng nhập địa chỉ email hợp lệ!"

    When Enter "email" in "Tên đăng nhập" with "_RANDOM_"
    And Enter "password" in "Mật khẩu" with "Nhat@01101999"
    And Click "Đăng Nhập" button
    Then Display popup with "Thất bại"
    And User look message "Tài khoản chưa được tạo hoặc chưa được kích hoạt." popup

    When Enter "email" in "Tên đăng nhập" with "minhminh@getnada.com"
    And Enter "password" in "Mật khẩu" with "_RANDOM_"
    And Click "Đăng Nhập" button
    Then Display popup with "Thất bại"
    And User look message "Tài khoản hoặc mật khẩu không đúng, vui lòng thử lại" popup

    When Enter "email" in "Tên đăng nhập" with "_RANDOM_"
    And Enter "password" in "Mật khẩu" with "_RANDOM_"
    And Click "Đăng Nhập" button
    Then Display popup with "Thất bại"
    And User look message "Tài khoản chưa được tạo hoặc chưa được kích hoạt." popup

    When Enter "email" in "Tên đăng nhập" with "_RANDOM_"
    And Enter "password" in "Mật khẩu" with "_RANDOM_"
    Then User look "Mật khẩu" field with type password is "true"
    And Show password in "Mật khẩu"
    Then User look "Mật khẩu" field with type password is "false"

    When Enter "email" in "Tên đăng nhập" with "minhminh@getnada.com"
    And Enter "password" in "Mật khẩu" with "Nhat@01101999"
    And Click "Đăng Nhập" button
    Then Verify login successful user "Store" with "Chào mừng bạn đã đến với BALANCE!"

    When Enter "email" in "Tên đăng nhập" with "ha@getnada.com"
    And Enter "password" in "Mật khẩu" with "Nhat@01101999"
    And Click "Đăng Nhập" button
    Then Verify login successful user "Store" with "Chào mừng bạn đã đến với BALANCE!"

#FORGOT PASSWORD#
*** Test Cases ***
ForgotPassword_01: KIỂM TRA CHỨC NĂNG QUÊN MẬT KHẨU
    When Click link "Quên mật khẩu?"
    Then User look title with "Quên Mật Khẩu"
    And User look content with "Vui lòng nhập e-mail của bạn. Mã xác minh OTP sẽ được gửi cho bạn"

    When Enter "email" in "Email khôi phục" with "${empty}"
    And Click "Lấy mã OTP" button
    Then Show validation text in "Email khôi phục" field with "Đây là trường bắt buộc!"

    When Enter "text" in "Email khôi phục" with "_RANDOM_"
    And Click "Lấy mã OTP" button
    Then Show validation text in "Email khôi phục" field with "Vui lòng nhập địa chỉ email hợp lệ!"

    When Enter "email" in "Email khôi phục" with "_RANDOM_"
    And Click "Lấy mã OTP" button
    Then Display popup with "Thất bại"
    And User look message "Địa chỉ email không tồn tại, vui lòng thử địa chỉ email khác." popup

    When Enter "email" in "Email khôi phục" with "92t4709016@husc.edu.vn"
    And Click "Lấy mã OTP" button
    Then User look button with "Gửi OTP"

    When Enter "OTP" in "Mã OTP" with "${empty}"
    And Click "Gửi OTP" button
    Then Show validation text in "Mã OTP" field with "Đây là trường bắt buộc!"

    When Enter "phone" in "Mã OTP" with "_RANDOM_"
    And Click "Gửi OTP" button
    Then Display popup with "Thất bại"
    And User look message "Mã OTP sai hoặc hết thời hạn sử dụng." popup

    When Enter "OTP" in "Mã OTP" with "123456"
    And Click "Gửi OTP" button
    Then User look title with "Đặt Lại Mật Khẩu"
    And User look content with "Mật khẩu yêu cầu có 8 ký tự trở lên, có ít nhất 1 chữ hoa, 1 chữ thường, 1 chữ số và 1 kí tự đặc biệt."

    When Click "Đổi mật khẩu" button
    Then Show validation text in "Mật khẩu" field with "Đây là trường bắt buộc!"
    And Show validation text in "Xác nhận mật khẩu" field with "Đây là trường bắt buộc!"

    When Enter "7 character" in "Mật khẩu" with "1234567"
    And Enter "password" in "Xác nhận mật khẩu" with "1234567"
    And Click "Đổi mật khẩu" button
    Then Show validation text in "Mật khẩu" field with "Mật khẩu yêu cầu có 8 ký tự trở lên"

    When Enter "text" in "Mật khẩu" with "Hồ Văn Nhật"
    And Enter "password" in "Xác nhận mật khẩu" with "Hồ Văn Nhật"
    And Click "Đổi mật khẩu" button
    Then Show validation text in "Mật khẩu" field with "Mật khẩu không được có khoảng trắng"

    When Enter "number" in "Mật khẩu" with "hovannhat"
    And Enter "password" in "Xác nhận mật khẩu" with "hovannhat"
    And Click "Đổi mật khẩu" button
    Then Show validation text in "Mật khẩu" field with "Mật khẩu yêu cầu có 8 ký tự trở lên, có ít nhất 1 chữ hoa, 1 chữ thường, 1 chữ số và 1 kí tự đặc biệt"

    When Enter "password" in "Mật khẩu" with "_RANDOM_"
    And Enter "password" in "Xác nhận mật khẩu" with "_RANDOM_"
    And Click "Đổi mật khẩu" button
    Then Show validation text in "Mật khẩu" field with "Xác nhận mật khẩu không chính xác"
    And Show validation text in "Xác nhận mật khẩu" field with "Xác nhận mật khẩu không chính xác"

    When Enter "password" in "Mật khẩu" with "Nhat@01101999"
    And Show password in "Mật khẩu"
    Then User look "Mật khẩu" field with type password is "false"
    And Enter "password" in "Xác nhận mật khẩu" with "Nhat@01101999"
    And Show password in "Xác nhận mật khẩu"
    Then User look "Xác nhận mật khẩu" field with type password is "false"

    When Enter "password" in "Mật khẩu" with "Nhat@01101999"
    And Enter "password" in "Xác nhận mật khẩu" with "Nhat@01101999"
    And Click "Đổi mật khẩu" button
    Then Display popup with "Thành Công"
    And User look message "Đổi mật khẩu thành công." popup

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

Logout Account
    ${element}=               set variable          //android.widget.Image[@text="profile_pic"]
    wait until page contains element                ${element}      ${BROWSER_TIMEOUT}
    click element                                   ${element}
    sleep                               0.5
    click element at coordinates        ${X_logout}     ${Y_logout}

Verify login successful user "${account}" with "${text}"
    ${element}=         set variable        //android.widget.TextView[@text="${text}"]
    wait until page contains element          ${element}        ${BROWSER_TIMEOUT}
    element text should be                  ${element}          ${text}
    Logout Account
