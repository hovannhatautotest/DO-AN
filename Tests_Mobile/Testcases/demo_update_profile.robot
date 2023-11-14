*** Settings ***
Resource            ../Keywords/common.robot
Test Setup          Preconditions
Test Teardown       Tear Down

*** Variables ***
${USER_STORE}          minhminh@getnada.com
${USER_SUPPLIER}       ha@getnada.com
${PASSWORD}            Nhat@01101999

*** Test Cases ***
PRO_01: TEST CHỨC NĂNG CẬP NHẬT THÔNG TIN CÁ NHÂN
    And Go to "update profile" page
    Then User look title with "Thông tin cá nhân"
    swipe     333     1254      0       600       100
    And Enter "text" in "Họ và tên" field with "${empty}"
    And Click "Lưu" button
    Then Show validation text in "Họ và tên" field with "Xin vui lòng nhập tên người dùng"

    And Enter "number" in "Họ và tên" field with "_RANDOM_"
    And Click "Lưu" button
    Then Show validation text in "Họ và tên" field with "Xin vui lòng chỉ nhập chữ"
    And Click "Hủy thao tác" button

    And Enter "email" in "Email" field with "${empty}"
    And Click "Lưu" button
    Then Show validation text in "Email" field with "Xin vui lòng nhập email"

    And Enter "text" in "Email" field with "_RANDOM_"
    And Click "Lưu" button
    Then Show validation text in "Email" field with "Vui lòng nhập địa chỉ email hợp lệ!"
    And Click "Hủy thao tác" button

    And Enter "phone" in "Số điện thoại" field with "${empty}"
    And Click "Lưu" button
    Then Show validation text in "Số điện thoại" field with "Xin vui lòng nhập số điện thoại người dùng"

    And Enter "7 character" in "Số điện thoại" field with "_RANDOM_"
    And Click "Lưu" button
    Then Show validation text in "Số điện thoại" field with "Xin vui lòng chỉ nhập số"
    And Show validation text in "Số điện thoại" field with "Xin vui lòng nhập tối thiểu 8 ký tự số"

    And Enter "> 12 character" in "Số điện thoại" field with "_RANDOM_"
    And Click "Lưu" button
    Then Show validation text in "Số điện thoại" field with "Xin vui lòng chỉ nhập số"
    And Show validation text in "Số điện thoại" field with "Xin vui lòng nhập tối đa 12 ký tự số"

    And Enter "phone_7" in "Số điện thoại" field with "_RANDOM_"
    And Click "Lưu" button
    Then Show validation text in "Số điện thoại" field with "Xin vui lòng nhập tối thiểu 8 ký tự số"

    And Enter "phone > 12 number" in "Số điện thoại" field with "_RANDOM_"
    And Click "Lưu" button
    Then Show validation text in "Số điện thoại" field with "Xin vui lòng nhập tối đa 12 ký tự số"

    And Enter "text" in "Số điện thoại" field with "Hồ Văn Nhật"
    And Click "Lưu" button
    Then Show validation text in "Số điện thoại" field with "Xin vui lòng chỉ nhập số"
    And Click "Hủy thao tác" button

    And Enter "> 500 character" in "Ghi chú" field with "_RANDOM_"
    And Click "Lưu" button
    Then Show validation text in "Ghi chú" field with "Chỉ được nhập tối đa 500 kí tự"
    And Click "Hủy thao tác" button

    And Enter "email" in "Email" field with "ha@getnada.com"
    And Click "Lưu" button
    Then Display popup with "Thất bại"
    And User look message "Số điện thoại hoặc email đã tồn tại trong hệ thống." popup
    And Click "Hủy thao tác" button

    And Enter "phone" in "Số điện thoại" field with "097899900"
    And Click "Lưu" button
    Then Display popup with "Thất bại"
    And User look message "Số điện thoại hoặc email đã tồn tại trong hệ thống." popup
    And Click "Hủy thao tác" button

    And Enter "name" in "Họ và tên" field with "Nguyễn Minh Minh"
    And Enter "email" in "Email" field with "minhminh1@getnada.com"
    And Enter "phone" in "Số điện thoại" field with "0968876897"
    And Click "Lưu" button
    Then Display popup with "Thành công"
    And User look message "Bạn đã thay đổi thông tin thành công, Vui lòng đăng nhập lại !" popup
    And Logout Account
    When Enter "email" in "Tên đăng nhập" field with "minhminh1@getnada.com"
    And Enter "password" in "Mật khẩu" field with "${PASSWORD}"
    And Click "Đăng Nhập" button
    And Go to "update profile" page
    And Enter "email" in "Email" field with "minhminh@getnada.com"
    And Click "Lưu" button
    Then Display popup with "Thành công"
    And User look message "Bạn đã thay đổi thông tin thành công, Vui lòng đăng nhập lại !" popup
    And Logout Account

###CHANGE PASSWORD###
*** Test Cases ***
ChangePassword_01: TEST CHỨC NĂNG THAY ĐỔI MẬT KHẨU
    And Go to "change password" page
    Then User look title with "Thông tin cá nhân"
    swipe     333     1254      0       600       100

    And Click "Đổi mật khẩu" button
    Then Show validation text in "Mật khẩu hiện tại" field with "Đây là trường bắt buộc!"
    And Show validation text in "Mật khẩu mới" field with "Đây là trường bắt buộc!"
    And Show validation text in "Xác nhận mật khẩu" field with "Đây là trường bắt buộc!"

    And Enter "password" in "Mật khẩu hiện tại" field with "_RANDOM_"
    And Enter "password" in "Mật khẩu mới" field with "User001"
    And Enter "password" in "Xác nhận mật khẩu" field with "User001"
    And Click "Đổi mật khẩu" button
    Then Show validation text in "Mật khẩu mới" field with "Mật khẩu yêu cầu có 8 ký tự trở lên"

    And Enter "password" in "Mật khẩu mới" field with "Hồ Văn Nhật"
    And Enter "password" in "Xác nhận mật khẩu" field with "Hồ Văn Nhật"
    And Click "Đổi mật khẩu" button
    Then Show validation text in "Mật khẩu mới" field with "Mật khẩu không được có khoảng trắng"
    And Show validation text in "Xác nhận mật khẩu" field with "Mật khẩu không được có khoảng trắng"

    And Enter "password" in "Mật khẩu mới" field with "hovannhat"
    And Enter "password" in "Xác nhận mật khẩu" field with "hovannhat"
    And Click "Đổi mật khẩu" button
    Then Show validation text in "Mật khẩu mới" field with "Mật khẩu yêu cầu có 8 ký tự trở lên, có ít nhất 1 chữ hoa, 1 chữ thường, 1 chữ số và 1 kí tự đặc biệt"
    And Show validation text in "Xác nhận mật khẩu" field with "Mật khẩu yêu cầu có 8 ký tự trở lên, có ít nhất 1 chữ hoa, 1 chữ thường, 1 chữ số và 1 kí tự đặc biệt"

    And Enter "password" in "Mật khẩu hiện tại" field with "_RANDOM_"
    And Enter "password" in "Mật khẩu mới" field with "_RANDOM_"
    And Enter "password" in "Xác nhận mật khẩu" field with "_RANDOM_"
    And Click "Đổi mật khẩu" button
    Then Show validation text in "Xác nhận mật khẩu" field with "Xác nhận mật khẩu không chính xác"

    And Enter "password" in "Mật khẩu mới" field with "Nhat@011019999"
    And Enter "password" in "Xác nhận mật khẩu" field with "Nhat@011019999"
    And Click "Đổi mật khẩu" button
    Then Display popup with "Thất bại"
    And User look message "Mật khẩu nhập không đúng." popup

    And Enter "password" in "Mật khẩu hiện tại" field with "Nhat@01101999"
    And Enter "password" in "Mật khẩu mới" field with "Nhat@01101999"
    And Enter "password" in "Xác nhận mật khẩu" field with "Nhat@01101999"
    And Click "Đổi mật khẩu" button
    Then Display popup with "Thất bại"
    And User look message "Mật khẩu trùng với mật khẩu hiện tại." popup

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

    And Click "Hủy thao tác" button
    Then User look in "Mật khẩu hiện tại" field with '${empty}'
    And User look in "Mật khẩu mới" field with '${empty}'
    And User look in "Xác nhận mật khẩu" field with '${empty}'

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
    When Logout Account

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

Logout Account
    ${element}=               set variable          //android.widget.Image[@text="profile_pic"]
    wait until page contains element                ${element}      ${BROWSER_TIMEOUT}
    click element                                   ${element}
    sleep                               0.5
    click element at coordinates        ${X_logout}     ${Y_logout}
