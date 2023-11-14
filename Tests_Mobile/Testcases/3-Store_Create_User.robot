*** Settings ***
Resource            ../Keywords/common.robot
Test Setup          Preconditions
Test Teardown       Logout Account

*** Variables ***

*** Test Cases ***
CRU 01: Kiểm tra có thể điều hướng đến trang tạo mới người dùng tạo bởi cửa hàng
    [Tags]    Test_Store_Create_User   Navigate_to_create_user_page
    [Documentation]   Kiểm tra có thể điều hướng đến trang tạo mới người dùng tạo bởi cửa hàng
    When Click "Quản lý người dùng" menu
    And Click "Thêm quản trị viên" button
    Then User look title with "Thêm người dùng"
    And User look content with "Thông tin người dùng"

CRU 02: Kiểm tra validation text khi bỏ trống trường "Cửa hàng/Chi nhánh"
    [Tags]    Test_Store_Create_User   Validation Text
    [Documentation]   Kiểm tra validation text khi bỏ trống trường "Cửa hàng/Chi nhánh"
    When Go to create user page
    And Click select in "Cửa hàng/chi nhánh" field with "Cửa hàng Minh Minh"
    And Delete text in "Cửa hàng/chi nhánh" field
    Then Show validation text in "Cửa hàng/chi nhánh" field with "Xin vui lòng chọn cửa hàng/chi nhánh"

CRU 03: Kiểm tra validation text khi không nhập "Họ và tên"
    [Tags]    Test_Store_Create_User   Validation Text
    [Documentation]   Kiểm tra validation text khi không nhập "Họ và tên"
    When Go to create user page
    And Enter "fullname" in "Họ và tên" field with "${empty}"
    And Click in "Email" field
    Then Show validation text in "Họ và tên" field with "Xin vui lòng nhập tên người dùng"

CRU 04: Kiểm tra validation text khi nhập "Họ và tên" sai định dạng
    [Tags]    Test_Store_Create_User   Validation Text
    [Documentation]   Kiểm tra validation text khi nhập "Họ và tên" sai định dạng
    When Go to create user page
    And Enter "phone" in "Họ và tên" field with "_RANDOM_"
    And Click in "Email" field
    Then Show validation text in "Họ và tên" field with "Xin vui lòng chỉ nhập chữ"

CRU 05: Kiểm tra validation text khi bỏ trống trường "Email"
    [Tags]    Test_Store_Create_User   Validation Text
    [Documentation]   Kiểm tra validation text khi bỏ trống trường "Email"
    When Go to create user page
    And Enter "email" in "Email" field with "${empty}"
    And Click in "Họ và tên" field
    Then Show validation text in "Email" field with "Xin vui lòng nhập email người dùng"

CRU 06: Kiểm tra validation text khi nhập "Email" sai định dạng
    [Tags]    Test_Store_Create_User   Validation Text
    [Documentation]   Kiểm tra validation text khi nhập "Email" sai định dạng
    When Go to create user page
    And Enter "text" in "Email" field with "_RANDOM_"
    And Click in "Họ và tên" field
    Then Show validation text in "Email" field with "Vui lòng nhập địa chỉ email hợp lệ!"

CRU 07: Kiểm tra validation text khi bỏ trống trường "Số điện thoại"
    [Tags]    Test_Store_Create_User   Validation Text
    [Documentation]   Kiểm tra validation text khi bỏ trống trường "Số điện thoại"
    When Go to create user page
    And Enter "phone" in "Số điện thoại" field with "${empty}"
    And Click in "Họ và tên" field
    Then Show validation text in "Số điện thoại" field with "Xin vui lòng nhập số điện thoại người dùng"

CRU 08: Kiểm tra Validation text tại trường "Số điện thoại" khi nhập sai định dạng số điện thoại và nhỏ hơn 8 ký tự
    [Tags]    Test_Store_Create_User   Validation Text
    [Documentation]   Kiểm tra Validation text tại trường "Số điện thoại" khi nhập sai định dạng số điện thoại và nhỏ hơn 8 ký tự
    When Go to create user page
    And Enter "phone" in "Số điện thoại" field with "abcdefg"
    And Click in "Họ và tên" field
    Then Show validation text in "Số điện thoại" field with "Xin vui lòng chỉ nhập số"
    And Show validation text in "Số điện thoại" field with "Xin vui lòng nhập tối thiểu 8 ký tự số"

CRU 09: Kiểm tra Validation text tại trường "Số điện thoại" khi nhập sai định dạng số điện thoại và lớn hơn 12 ký tự
    [Tags]    Test_Store_Create_User   Validation Text
    [Documentation]   Kiểm tra Validation text tại trường "Số điện thoại" khi nhập sai định dạng số điện thoại và lớn hơn 12 ký tự
    When Go to create user page
    And Enter "text" in "Số điện thoại" field with "_RANDOM_"
    And Click in "Họ và tên" field
    Then Show validation text in "Số điện thoại" field with "Xin vui lòng chỉ nhập số"
    And Show validation text in "Số điện thoại" field with "Xin vui lòng nhập tối đa 12 ký tự số"

CRU 10: Kiểm tra Validation text tại trường "Số điện thoại" khi nhập Số điện thoại nhỏ hơn 8 ký tự
    [Tags]    Test_Store_Create_User   Validation Text
    [Documentation]   Kiểm tra Validation text tại trường "Số điện thoại" khi nhập Số điện thoại nhỏ hơn 8 ký tự
    When Go to create user page
    And Enter "phone_7" in "Số điện thoại" field with "_RANDOM_"
    And Click in "Họ và tên" field
    Then Show validation text in "Số điện thoại" field with "Xin vui lòng nhập tối thiểu 8 ký tự số"

CRU 11: Kiểm tra Validation text tại trường "Số điện thoại" khi nhập Số điện thoại lớn hơn 12 ký tự
    [Tags]    Test_Store_Create_User   Validation Text
    [Documentation]   Kiểm tra Validation text tại trường "Số điện thoại" khi nhập Số điện thoại lớn hơn 12 ký tự
    When Go to create user page
    And Enter "phone_invalid" in "Số điện thoại" field with "_RANDOM_"
    And Click in "Họ và tên" field
    Then Show validation text in "Số điện thoại" field with "Xin vui lòng nhập tối đa 12 ký tự số"

CRU 12: Kiểm tra Validation text tại trường "Số điện thoại" khi nhập sai định dạng Số điện thoại và lớn hơn 8 ký tự nhưng nhỏ hơn 12 ký tự
    [Tags]    Test_Store_Create_User   Validation Text
    [Documentation]   Kiểm tra Validation text tại trường "Số điện thoại" khi nhập sai định dạng Số điện thoại và lớn hơn 8 ký tự nhưng nhỏ hơn 12 ký tự
    When Go to create user page
    And Enter "text" in "Số điện thoại" field with "_RANDOM_"
    And Click in "Họ và tên" field
    Then Show validation text in "Số điện thoại" field with "Xin vui lòng chỉ nhập số"

CRU 13: Kiểm tra Validation text tại trường "Ghi chú" khi nhập quá 500 kí tự
    [Tags]    Test_Store_Create_User   Validation Text
    [Documentation]   Kiểm tra Validation text tại trường "Ghi chú" khi nhập quá 500 kí tự
    When Go to create user page
    And Enter "word" in "Ghi chú" field with "_RANDOM_"
    And Click in "Họ và tên" field
    Then Show validation text in "Ghi chú" field with "Chỉ được nhập tối đa 500 kí tự"

CRU 14: Kiểm tra hiển thị thông báo lỗi khi tạo mới người dùng có "Email" đã tồn tại trên hệ thống
    [Tags]    Test_Store_Create_User   Error Message
    [Documentation]   Kiểm tra hiển thị thông báo lỗi khi tạo mới người dùng có "Email" đã tồn tại trên hệ thống
    When Go to create user page
    And Click select in "Cửa hàng/chi nhánh" field with "Cửa hàng Minh Minh"
    And Enter "fullname" at "Họ và tên" field with "_RANDOM_"
    And Enter "email" at "Email" field with "minhminh@getnada.com"
    And Enter "phone" at "Số điện thoại" field with "_RANDOM_"
    And Enter "paragraph" at "Ghi chú" field with "_RANDOM_"
    And Click "Lưu" button
    Then Display popup with "Thất bại"
    And User look message "Email đã được đăng ký trước đó." popup

CRU 15: Kiểm tra hiển thị thông báo lỗi khi tạo mới người dùng có "Số điện thoại" đã tồn tại trên hệ thống
    [Tags]    Test_Store_Create_User   Error Message
    [Documentation]   Kiểm tra hiển thị thông báo lỗi khi tạo mới người dùng có "Số điện thoại" đã tồn tại trên hệ thống
    When Go to create user page
    And Click select in "Cửa hàng/chi nhánh" field with "Cửa hàng Minh Minh"
    And Enter "fullname" at "Họ và tên" field with "_RANDOM_"
    And Enter "email" at "Email" field with "_RANDOM_"
    And Enter "phone" at "Số điện thoại" field with "0968876897"
    And Enter "paragraph" at "Ghi chú" field with "_RANDOM_"
    And Click "Lưu" button
    Then Display popup with "Thất bại"
    And User look message "Số điện thoại đã được đăng ký trước đó." popup

CRU 16: Kiểm tra hiển thị thông báo khi tạo mới người dùng thành công
    [Tags]    Test_Store_Create_User   Success Message
    [Documentation]   Kiểm tra hiển thị thông báo khi tạo mới người dùng thành công
    When Go to create user page
    And Click select in "Cửa hàng/chi nhánh" field with "Cửa hàng Minh Minh"
    And Enter "fullname" at "Họ và tên" field with "_RANDOM_"
    And Enter "Email" at "Email" field with "_RANDOM_"
    And Enter "phone" at "Số điện thoại" field with "_RANDOM_"
    And Enter "paragraph" at "Ghi chú" field with "_RANDOM_"
    And Click "Lưu" button
    Then Display popup with "Thành công"
    And User look message "Tạo người dùng mới thành công." popup

*** Test Cases ***
EDU 01: Kiểm tra có thể điều hướng đến trang chỉnh sửa thông tin người dùng
    [Tags]    Test_Store_Edit_User   Navigate_to_edit_user_page
    [Documentation]   Kiểm tra có thể điều hướng đến trang chỉnh sửa thông tin người dùng
    When Click "Quản lý người dùng" menu
    And Select user need to edit
    Then User look title with "Chỉnh sửa người dùng"
    And User look content with "Thông tin người dùng"

EDU 02: Kiểm tra validation text khi không nhập "Họ và tên"
    [Tags]    Test_Store_Edit_User   Validation Text
    [Documentation]   Kiểm tra validation text khi không nhập "Họ và tên"
    When Go to edit user page
    And Enter "fullname" in "Họ và tên" field with "${empty}"
    And Click in "Số điện thoại" field
    Then Show validation text in "Họ và tên" field with "Xin vui lòng nhập tên người dùng"

EDU 04: Kiểm tra validation text khi nhập "Họ và tên" sai định dạng
    [Tags]    Test_Store_Edit_User   Validation Text
    [Documentation]   Kiểm tra validation text khi nhập "Họ và tên" sai định dạng
    When Go to edit user page
    And Enter "phone" at "Họ và tên" field with "_RANDOM_"
    And Click "Lưu" button
    Then Show validation text in "Họ và tên" field with "Xin vui lòng chỉ nhập chữ"

EDU 07: Kiểm tra validation text khi bỏ trống trường "Số điện thoại"
    [Tags]    Test_Store_Edit_User   Validation Text
    [Documentation]   Kiểm tra validation text khi bỏ trống trường "Số điện thoại"
    When Go to edit user page
    And Enter "phone" at "Số điện thoại" field with "${empty}"
    And Click "Lưu" button
    Then Show validation text in "Số điện thoại" field with "Xin vui lòng nhập số điện thoại người dùng"

EDU 08: Kiểm tra Validation text tại trường "Số điện thoại" khi nhập sai định dạng số điện thoại và nhỏ hơn 8 ký tự
    [Tags]    Test_Store_Edit_User   Validation Text
    [Documentation]   Kiểm tra Validation text tại trường "Số điện thoại" khi nhập sai định dạng số điện thoại và nhỏ hơn 8 ký tự
    When Go to edit user page
    And Enter "phone" at "Số điện thoại" field with "abcdefg"
    And Click "Lưu" button
    Then Show validation text in "Số điện thoại" field with "Xin vui lòng chỉ nhập số"
    And Show validation text in "Số điện thoại" field with "Xin vui lòng nhập tối thiểu 8 ký tự số"

EDU 09: Kiểm tra Validation text tại trường "Số điện thoại" khi nhập sai định dạng số điện thoại và lớn hơn 12 ký tự
    [Tags]    Test_Store_Edit_User   Validation Text
    [Documentation]   Kiểm tra Validation text tại trường "Số điện thoại" khi nhập sai định dạng số điện thoại và lớn hơn 12 ký tự
    When Go to edit user page
    And Enter "text" at "Số điện thoại" field with "_RANDOM_"
    And Click "Lưu" button
    Then Show validation text in "Số điện thoại" field with "Xin vui lòng chỉ nhập số"
    And Show validation text in "Số điện thoại" field with "Xin vui lòng nhập tối đa 12 ký tự số"

EDU 10: Kiểm tra Validation text tại trường "Số điện thoại" khi nhập Số điện thoại nhỏ hơn 8 ký tự
    [Tags]    Test_Store_Edit_User   Validation Text
    [Documentation]   Kiểm tra Validation text tại trường "Số điện thoại" khi nhập Số điện thoại nhỏ hơn 8 ký tự
    When Go to edit user page
    And Enter "phone_7" at "Số điện thoại" field with "_RANDOM_"
    And Click "Lưu" button
    Then Show validation text in "Số điện thoại" field with "Xin vui lòng nhập tối thiểu 8 ký tự số"

EDU 11: Kiểm tra Validation text tại trường "Số điện thoại" khi nhập Số điện thoại lớn hơn 12 ký tự
    [Tags]    Test_Store_Edit_User   Validation Text
    [Documentation]   Kiểm tra Validation text tại trường "Số điện thoại" khi nhập Số điện thoại lớn hơn 12 ký tự
    When Go to edit user page
    And Enter "phone_invalid" at "Số điện thoại" field with "_RANDOM_"
    And Click "Lưu" button
    Then Show validation text in "Số điện thoại" field with "Xin vui lòng nhập tối đa 12 ký tự số"

EDU 12: Kiểm tra Validation text tại trường "Số điện thoại" khi nhập sai định dạng Số điện thoại và lớn hơn 8 ký tự nhưng nhỏ hơn 12 ký tự
    [Tags]    Test_Store_Edit_User   Validation Text
    [Documentation]   Kiểm tra Validation text tại trường "Số điện thoại" khi nhập sai định dạng Số điện thoại và lớn hơn 8 ký tự nhưng nhỏ hơn 12 ký tự
    When Go to edit user page
    And Enter "text" at "Số điện thoại" field with "_RANDOM_"
    And Click "Lưu" button
    Then Show validation text in "Số điện thoại" field with "Xin vui lòng chỉ nhập số"

EDU 13: Kiểm tra Validation text tại trường "Ghi chú" khi nhập quá 500 kí tự
    [Tags]    Test_Store_Edit_User   Validation Text
    [Documentation]   Kiểm tra Validation text tại trường "Ghi chú" khi nhập quá 500 kí tự
    When Go to edit user page
    And Enter "word" at "Ghi chú" field with "_RANDOM_"
    And Click "Lưu" button
    Then Show validation text in "Ghi chú" field with "Chỉ được nhập tối đa 500 kí tự"

EDU 14: Kiểm tra hiển thị thông báo lỗi khi tạo mới người dùng có "Số điện thoại" đã tồn tại trên hệ thống
    [Tags]    Test_Store_Edit_User   Error Message
    [Documentation]   Kiểm tra hiển thị thông báo lỗi khi tạo mới người dùng có "Số điện thoại" đã tồn tại trên hệ thống
    When Go to edit user page
    And Enter "phone" at "Số điện thoại" field with "0968876897"
    And Click "Lưu" button
    Then Display popup with "Thất bại"
    And User look message "Cập nhật thất bại." popup

EDU 15: Kiểm tra hiển thị thông báo khi chỉnh sửa người dùng thành công
    [Tags]    Test_Store_Edit_User    Success Message
    [Documentation]   Kiểm tra hiển thị thông báo khi chỉnh sửa người dùng thành công
    When Go to edit user page
    And Enter "fullname" at "Họ và tên" field with "_RANDOM_"
    And Enter "phone" at "Số điện thoại" field with "_RANDOM_"
    And Enter "paragraph" at "Ghi chú" field with "_RANDOM_"
    And Click "Lưu" button
    Then Display popup with "Thành công"

EDU 16: Kiểm tra có thể quay trở lại trang danh sách người dùng khi nhấn nút "Trờ về" từ trang "Tạo mới người dùng"
    [Tags]    Test_Store_Edit_User    Success Message
    [Documentation]   Kiểm tra có thể quay trở lại trang danh sách người dùng khi nhấn nút "Trờ về" từ trang "Tạo mới người dùng"
    When Go to create user page
    And Click "Trở về" button
    Then User look title with "Quản lý người dùng"

EDU 17: Kiểm tra có thể quay trở lại trang danh sách người dùng khi nhấn nút "Trờ về" từ trang "Chỉnh sửa người dùng"
    [Tags]    Test_Store_Edit_User    Success Message
    [Documentation]   Kiểm tra có thể quay trở lại trang danh sách người dùng khi nhấn nút "Trờ về" từ trang "Chỉnh sửa người dùng"
    When Go to edit user page
    And Click "Trở về" button
    Then User look title with "Quản lý người dùng"

*** Keywords ***
Preconditions
    Open App Balance
    Login to Store
    User look content with "Chào mừng bạn đã đến với BALANCE!"

Search "${type}" at "${name}" with "${text}"
    ${element}=               set variable                  //android.view.View[3]/android.view.View[1]/android.widget.EditText
    wait until page contains element          ${element}          ${BROWSER_TIMEOUT}
    clear text                ${element}
    input text                ${element}                        ${text}
    sleep                     2

Select user need to edit
    Search "Mã người dùng" at "Tìm kiếm" with "USR0184"
    click element at coordinates        119        755
    click element at coordinates        119        755

Go to ${name} user page
    When Click "Quản lý người dùng" menu
    IF  '${name}' == 'create'
        And Click "Thêm quản trị viên" button
        sleep     0.5
        swipe     360     1431      0       1120       500
    ELSE IF  '${name}' == 'edit'
        And Select user need to edit
        swipe     360     1431      0       1100       201
    END


Click "${menu}" menu
    Then User look content with "Chào mừng bạn đã đến với BALANCE!"
    click element at coordinates        73        125
    sleep         0.5
    IF  '${menu}' == 'Dashboard'
        click element at coordinates        229        264  #--MENU 1--#
    ELSE IF  '${menu}' == 'Đặt hàng'
        click element at coordinates        229        375  #--MENU 2--#
    ELSE IF  '${menu}' == 'Quản lý kho'
        click element at coordinates        229        488  #--MENU 3--#
    ELSE IF  '${menu}' == 'Báo cáo'
        click element at coordinates        229        610  #--MENU 4--#
    ELSE IF  '${menu}' == 'Quản lý kết nối'
        click element at coordinates        229        723  #--MENU 5--#
    ELSE IF  '${menu}' == 'Quản lý người dùng'
        click element at coordinates        229        842  #--MENU 6--#
    ELSE IF  '${menu}' == 'Quản lý hàng hoá'
        click element at coordinates        229        952  #--MENU 7--#
    ELSE IF  '${menu}' == 'Quản lý NCC'
        click element at coordinates        229        1065  #--MENU 8--#
    ELSE IF  '${menu}' == 'Quản lý cửa hàng'
        click element at coordinates        229        1182  #--MENU 9--#
    END

Enter "${type}" in "${name}" field with "${text}"
    ${text}=                  Get Random Text                   ${type}                       ${text}
    IF  '${name}' == 'Tên đăng nhập' or '${name}' == 'Email'
        ${id}            set variable                      email
    ELSE IF  '${name}' == 'Mật khẩu'
        ${id}            set variable                     password
    ELSE IF  '${name}' == 'Họ và tên'
        ${id}            set variable                      userName
    ELSE IF  '${name}' == 'Số điện thoại'
        ${id}            set variable                      phoneNumber
    ELSE IF  '${name}' == 'Ghi chú'
        ${id}            set variable                     note
    END
    ${element}=               set variable          //android.widget.EditText[@resource-id="${id}"]
    wait until page contains element          ${element}        ${BROWSER_TIMEOUT}
    IF  '${name}' == 'Tên đăng nhập' or '${name}' == 'Mật khẩu'
        clear text                ${element}
        input text                ${element}                        ${text}
    ELSE IF  '${name}' != 'Tên đăng nhập' or '${name}' != 'Mật khẩu'
        click element             ${element}
        clear text                ${element}
        input text                ${element}                        ${text}
        click a point             549     1547
    END

Enter "${type}" at "${name}" field with "${text}"
    ${text}=                  Get Random Text                   ${type}                       ${text}
    IF  '${name}' == 'Tên đăng nhập' or '${name}' == 'Email'
        ${id}            set variable                      email
    ELSE IF  '${name}' == 'Mật khẩu'
        ${id}            set variable                     password
    ELSE IF  '${name}' == 'Họ và tên'
        ${id}            set variable                      userName
    ELSE IF  '${name}' == 'Số điện thoại'
        ${id}            set variable                      phoneNumber
    ELSE IF  '${name}' == 'Ghi chú'
        ${id}            set variable                     note
    END
    ${element}=               set variable          //android.widget.EditText[@resource-id="${id}"]
    wait until page contains element          ${element}        ${BROWSER_TIMEOUT}
    clear text                ${element}
    input text                ${element}                        ${text}

Click in "${name}" field
    IF  '${name}' == 'Họ và tên'
        ${id}            set variable                      userName
    ELSE IF  '${name}' == 'Email'
        ${id}            set variable                      email
    ELSE IF  '${name}' == 'Số điện thoại'
        ${id}            set variable                      phoneNumber
    ELSE IF  '${name}' == 'Ghi chú'
        ${id}            set variable                     note
    ELSE IF  '${name}' == 'Cửa hàng/chi nhánh'
        ${id}            set variable                     subOrgId
    END
    ${element}=               set variable          //android.widget.EditText[@resource-id="${id}"]
    wait until page contains element          ${element}        ${BROWSER_TIMEOUT}
    tap      ${element}
    click a point             549     1547

Click select in "Cửa hàng/chi nhánh" field with "${text}"
    ${element}=               set variable          //android.widget.EditText[@resource-id="subOrgId"]
    click element             ${element}
    clear text                ${element}
    input text                ${element}        ${text}
    click a point             650         1443
    sleep                     0.5
    click a point             549         1547
    sleep                     0.5

Delete text in "Cửa hàng/chi nhánh" field
    click element at coordinates             627         308

Login to Store
    When Enter "email" in "Tên đăng nhập" field with "${USER_STORE}"
    And Enter "password" in "Mật khẩu" field with "${PASSWORD}"
    And Click "Đăng Nhập" button

Show validation text in "${name}" field with "${text}"
    IF  '${name}' == 'Cửa hàng/chi nhánh'
        ${id}            set variable                      subOrgId
    ELSE IF  '${name}' == 'Họ và tên'
        ${id}            set variable                      userName
    ELSE IF  '${name}' == 'Email'
        ${id}            set variable                      email
    ELSE IF  '${name}' == 'Số điện thoại'
        ${id}            set variable                      phoneNumber
    ELSE IF  '${name}' == 'Ghi chú'
        ${id}            set variable                     note
    END
    IF  '${name}' == 'Cửa hàng/chi nhánh'
        ${element}=     Get Element Form Item By Name     ${name}       //android.widget.EditText[@resource-id="${id}"]/../../../../..//android.view.View[@text="${text}"]
    ELSE IF  '${name}' != 'Cửa hàng/chi nhánh'
        ${element}=     Get Element Form Item By Name     ${name}       //android.widget.EditText[@resource-id="${id}"]/../../..//android.view.View[@text="${text}"]
    END
    element text should be          ${element}          ${text}
