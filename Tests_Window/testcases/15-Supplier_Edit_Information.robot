*** Settings ***
Resource            ../keywords/common.robot

Test Setup          Preconditions
Test Teardown       Tear Down

*** Test Cases ***

##=========================ĐIỀU HƯỚNG ĐẾN TRANG "CHỈNH SỬA THÔNG TIN NHÀ CUNG CẤP"========================================================
Edit_Supplier_01: Kiểm tra có thể điều hướng đến trang chỉnh sửa thông tin nhà cung cấp
    [Tags]    @Test_edit_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra có thể điều hướng đến trang chỉnh sửa thông tin nhà cung cấp
    When Click "Quản lý nhà cung cấp" menu
    And Click "Thông tin NCC" sub menu
    Then User look title "Thông Tin NCC"
    And User look contains title is "Thông tin nhà cung cấp"

#==================================VALIDATION TEXT==========================================================
Edit_Supplier_02: Kiểm tra Validation Text trường "Tên nhà cung cấp" khi bỏ trống Tên nhà cung cấp
    [Tags]    @Test_edit_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation Text trường "Tên nhà cung cấp" khi bỏ trống Tên nhà cung cấp
    When Go to edit supplier page
    When Enter "text" in "Tên nhà cung cấp" with "${EMPTY}"
    And Click in "Số fax" field
    Then Required message "Tên nhà cung cấp" displayed under "Xin vui lòng nhập tên nhà cung cấp" field

Edit_Supplier_03: Kiểm tra Validation Text trường "Số fax" khi nhập sai định dạng và nhỏ hơn 8 ký tự
    [Tags]    @Test_edit_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation Text trường "Số fax" khi nhập sai định dạng và nhỏ hơn 8 ký tự
    When Go to edit supplier page
    When Enter "text" in "Số fax" with "abcdef"
    And Click in "Tên nhà cung cấp" field
    Then Required message "Số fax" field displayed under "Xin vui lòng chỉ nhập số"
    And Required message "Số fax" field displayed under "Xin vui lòng nhập tối thiểu 8 ký tự số"

Edit_Supplier_04: Kiểm tra Validation Text trường "Số fax" khi nhập sai định dạng và lớn hơn 12 ký tự
    [Tags]    @Test_edit_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation Text trường "Số fax" khi nhập sai định dạng và lớn hơn 12 ký tự
    When Go to edit supplier page
    When Enter "text" in "Số fax" with "_RANDOM_"
    And Click in "Tên nhà cung cấp" field
    Then Required message "Số fax" field displayed under "Xin vui lòng chỉ nhập số"
    And Required message "Số fax" field displayed under "Xin vui lòng nhập tối đa 12 ký tự số"

Edit_Supplier_05: Kiểm tra Validation Text trường "Số fax" khi số fax nhỏ hơn 8 ký tự
    [Tags]    @Test_edit_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation Text trường "Số fax" khi số fax nhỏ hơn 8 ký tự
    When Go to edit supplier page
    When Enter "fax_7" in "Số fax" with "_RANDOM_"
    And Click in "Tên nhà cung cấp" field
    Then Required message "Số fax" displayed under "Xin vui lòng nhập tối thiểu 8 ký tự số" field

Edit_Supplier_06: Kiểm tra Validation Text trường "Số fax" khi số fax lớn hơn 12 ký tự
    [Tags]    @Test_edit_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation Text trường "Số fax" khi số fax lớn hơn 12 ký tự
    When Go to edit supplier page
    When Enter "fax_invalid" in "Số fax" with "_RANDOM_"
    And Click in "Tên nhà cung cấp" field
    Then Required message "Số fax" displayed under "Xin vui lòng nhập tối đa 12 ký tự số" field

Edit_Supplier_07: Kiểm tra Validation text tại trường "Tỉnh/Thành phố" khi bỏ trống Tỉnh/Thành phố
    [Tags]    @Test_edit_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation text tại trường "Tỉnh/Thành phố" khi bỏ trống Tỉnh/Thành phố
    When Go to edit supplier page
    And Delete text in "Tỉnh/Thành phố" field
    Then Required message "Tỉnh/Thành phố" displayed under "Xin vui lòng chọn tỉnh/thành phố" field

Edit_Supplier_08: Kiểm tra Validation text tại trường "Quận/Huyện" khi bỏ trống Quận/Huyện
    [Tags]    @Test_edit_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation text tại trường "Quận/Huyện" khi bỏ trống Quận/Huyện
    When Go to edit supplier page
    And Delete text in "Quận/Huyện" field
    Then Required message "Quận/Huyện" displayed under "Xin vui lòng chọn quận/huyện" field

Edit_Supplier_09: Kiểm tra Validation text tại trường "Phường/Xã" khi bỏ trống Phường/Xã
    [Tags]    @Test_edit_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation text tại trường "Phường/Xã" khi bỏ trống Phường/Xã
    When Go to edit supplier page
    And Delete text in "Phường/Xã" field
    Then Required message "Phường/Xã" displayed under "Xin vui lòng chọn phường/xã" field

Edit_Supplier_10: Kiểm tra Validation text khi bỏ trống trường "Địa chỉ cụ thể"
    [Tags]    @Test_edit_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation text khi bỏ trống trường "Địa chỉ cụ thể"
    When Go to edit supplier page
    And Enter "text" in "Địa chỉ cụ thể" with "${EMPTY}"
    And Click in "Họ tên đại diện" field
    Then Required message "Địa chỉ cụ thể" displayed under "Xin vui lòng nhập địa chỉ cụ thể" field

Edit_Supplier_11: Kiểm tra Validation text tại trường "Họ tên đại diện" khi bỏ trống Họ tên đại diện
    [Tags]    @Test_edit_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation text tại trường "Họ tên đại diện" khi bỏ trống Họ tên đại diện
    When Go to edit supplier page
    And Enter "text" in "Họ tên đại diện" with "${EMPTY}"
    And Click in "Số điện thoại đại diện" field
    Then Required message "Họ tên đại diện" displayed under "Xin vui lòng nhập họ và tên đại diện" field

Edit_Supplier_12: Kiểm tra Validation text tại trường "Họ tên đại diện" khi nhập Họ tên đại diện không hợp lệ
    [Tags]    @Test_edit_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation text tại trường "Họ tên đại diện" khi nhập Họ tên đại diện không hợp lệ
    When Go to edit supplier page
    And Enter "text" in "Họ tên đại diện" with "_RANDOM_"
    And Click in "Số điện thoại đại diện" field
    Then Required message "Họ tên đại diện" displayed under "Vui lòng chỉ nhập chữ" field

Edit_Supplier_13: Kiểm tra Validation Text trường "Số điện thoại đại diện" khi bỏ trống số điện thoại
    [Tags]    @Test_edit_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation Text trường "Số điện thoại đại diện" khi bỏ trống số điện thoại
    When Go to edit supplier page
    And Enter "phone" in "Số điện thoại đại diện" with "${EMPTY}"
    And Click in "Email đại diện" field
    Then Required message "Số điện thoại đại diện" displayed under "Xin vui lòng nhập số điện thoại đại diện" field

Edit_Supplier_14: Kiểm tra Validation Text trường "Số điện thoại đại diện" khi nhập sai định dạng và nhỏ hơn 8 ký tự
    [Tags]    @Test_edit_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation Text trường "Số điện thoại đại diện" khi nhập sai định dạng và nhỏ hơn 8 ký tự
    When Go to edit supplier page
    And Enter "text" in "Số điện thoại đại diện" with "abcdef"
    And Click in "Email đại diện" field
    Then Required message "Số điện thoại đại diện" field displayed under "Xin vui lòng chỉ nhập số"
    And Required message "Số điện thoại đại diện" field displayed under "Xin vui lòng nhập tối thiểu 8 ký tự số"

Edit_Supplier_15: Kiểm tra Validation Text trường "Số điện thoại đại diện" khi nhập sai định dạng và lớn hơn 12 ký tự
    [Tags]    @Test_edit_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation Text trường "Số điện thoại đại diện" khi nhập sai định dạng và lớn hơn 12 ký tự
    When Go to edit supplier page
    And Enter "text" in "Số điện thoại đại diện" with "_RANDOM_"
    And Click in "Email đại diện" field
    Then Required message "Số điện thoại đại diện" field displayed under "Xin vui lòng chỉ nhập số"
    And Required message "Số điện thoại đại diện" field displayed under "Xin vui lòng nhập tối đa 12 ký tự số"

Edit_Supplier_16: Kiểm tra Validation Text trường "Số điện thoại đại diện" khi số số điện thoại nhỏ hơn 8 ký tự
    [Tags]    @Test_edit_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation Text trường "Số điện thoại đại diện" khi số số điện thoại nhỏ hơn 8 ký tự
    When Go to edit supplier page
    And Enter "phone_7" in "Số điện thoại đại diện" with "_RANDOM_"
    And Click in "Email đại diện" field
    Then Required message "Số điện thoại đại diện" displayed under "Xin vui lòng nhập tối thiểu 8 ký tự số" field

Edit_Supplier_17: Kiểm tra Validation Text trường "Số điện thoại đại diện" khi số điện thoại lớn hơn 12 ký tự
    [Tags]    @Test_edit_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation Text trường "Số điện thoại đại diện" khi số điện thoại lớn hơn 12 ký tự
    When Go to edit supplier page
    And Enter "phone_invalid" in "Số điện thoại đại diện" with "_RANDOM_"
    And Click in "Email đại diện" field
    Then Required message "Số điện thoại đại diện" displayed under "Xin vui lòng nhập tối đa 12 ký tự số" field

Edit_Supplier_18: Kiểm tra Validation Text trường "Email đại diện" khi nhập sai định dạng email
    [Tags]    @Test_edit_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation Text trường "Email đại diện" khi nhập sai định dạng email
    When Go to edit supplier page
    And Enter "text" in "Email đại diện" with "_RANDOM_"
    And Click in "Số điện thoại đại diện" field
    Then Required message "Email đại diện" displayed under "Vui lòng nhập địa chỉ email hợp lệ!" field

Edit_Supplier_19: Kiểm tra Validation Text trường "Ghi chú" khi nhập ghi chú quá 500 ký tự
    [Tags]    @Test_edit_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Validation Text trường "Ghi chú" khi nhập ghi chú quá 500 ký tự
    When Go to edit supplier page
    And Enter "word" in textarea "Ghi chú" with "_RANDOM_"
    And Click in "Số điện thoại đại diện" field
    Then Required message "Ghi chú" displayed under "Chỉ được nhập tối đa 500 kí tự" field

##=================================ERROR MESSAGE===============================================================================================
Edit_Supplier_20: Kiểm tra Error Message khi chỉnh sửa nhà cung cấp với Số fax đã được đăng kí trước đó
    [Tags]    @Test_edit_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Error Message khi chỉnh sửa nhà cung cấp với Số fax đã được đăng kí trước đó
    When Go to edit supplier page
    When Enter "fax_valid" in "Số fax" with "0900129112"
    And Click "Lưu" button
    Then User look message "Số Fax đã được đăng kí trước đó." popup

Edit_Supplier_21: Kiểm tra Error Message khi chỉnh sửa nhà cung cấp với Số điện thoại đã được đăng kí trước đó
    [Tags]    @Testcase Failed
    [Documentation]   Kiểm tra Error Message khi chỉnh sửa nhà cung cấp với Số điện thoại đã được đăng kí trước đó
    When Go to edit supplier page
    When Enter "phone" in "Số điện thoại đại diện" with "0977855888"
    And Click "Lưu" button
    Then User look message "Số điện thoại đã được đăng ký trước đó." popup

Edit_Supplier_22: Kiểm tra Error Message khi chỉnh sửa nhà cung cấp với Email đã được đăng kí trước đó
    [Tags]    @Test_edit_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra Error Message khi chỉnh sửa nhà cung cấp với Email đã được đăng kí trước đó
    When Go to edit supplier page
    And Enter "email" in "Email đại diện" with "htxhoabinh@getndata.com"
    And Click "Lưu" button
    Then User look message "Email này đã tồn tại, vui lòng nhập email khác." popup

##=======================EDIT SUPPLIER SUCCESSFULLY================================================
Edit_Supplier_23: Kiểm tra chỉnh sửa thông tin nhà cung cấp thành công khi thay đổi Tên nhà cung cấp
    [Tags]    @Test_edit_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra chỉnh sửa thông tin nhà cung cấp thành công khi thay đổi Tên nhà cung cấp
    When Go to edit supplier page
    And Enter "text" in "Tên nhà cung cấp" with "Siêu thị Big C Huế"
    And Click "Lưu" button
    Then User look message "Chỉnh sửa nhà cung cấp thành công." popup

Edit_Supplier_24: Kiểm tra chỉnh sửa thông tin nhà cung cấp thành công khi thay đổi Số fax
    [Tags]    @Test_edit_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra chỉnh sửa thông tin nhà cung cấp thành công khi thay đổi Số fax
    When Go to edit supplier page
    And Enter "fax_valid" in "Số fax" with "_RANDOM_"
    And Click "Lưu" button
    Then User look message "Chỉnh sửa nhà cung cấp thành công." popup

Edit_Supplier_25: Kiểm tra chỉnh sửa thông tin nhà cung cấp thành công khi thay đổi Địa chỉ cửa hàng
    [Tags]    @Test_edit_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra chỉnh sửa thông tin nhà cung cấp thành công khi thay đổi Địa chỉ cửa hàng
    When Go to edit supplier page
    And Delete text in "Tỉnh/Thành phố" field
    And Click select "Tỉnh/Thành phố" with "Tỉnh Thừa Thiên Huế"
    And Click select "Quận/Huyện" with "Thành phố Huế"
    And Click select "Phường/Xã" with "Phường Phú Nhuận"
    And Enter "number" in "Địa chỉ cụ thể" with "181 Bà Triệu"
    And Click "Lưu" button
    Then User look message "Chỉnh sửa nhà cung cấp thành công." popup

Edit_Supplier_26: Kiểm tra chỉnh sửa thông tin nhà cung cấp thành công khi thay đổi Họ tên người đại diện
    [Tags]    @Test_edit_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra chỉnh sửa thông tin nhà cung cấp thành công khi thay đổi Họ tên người đại diện
    When Go to edit supplier page
    And Enter "fullname" in "Họ tên đại diện" with "Nguyễn Quốc"
    And Click "Lưu" button
    Then User look message "Chỉnh sửa nhà cung cấp thành công." popup

Edit_Supplier_27: Kiểm tra chỉnh sửa thông tin nhà cung cấp thành công khi thay đổi Số điện thoại người đại diện
    [Tags]    @Test_edit_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra chỉnh sửa thông tin nhà cung cấp thành công khi thay đổi Số điện thoại người đại diện
    When Go to edit supplier page
    And Enter "phone" in "Số điện thoại đại diện" with "_RANDOM_"
    And Click "Lưu" button
    Then User look message "Chỉnh sửa nhà cung cấp thành công." popup

Edit_Supplier_28: Kiểm tra chỉnh sửa thông tin nhà cung cấp thành công khi thay đổi Email người đại diện
    [Tags]    @Test_edit_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra chỉnh sửa thông tin nhà cung cấp thành công khi thay đổi Email người đại diện
    When Go to edit supplier page
    And Enter "Email" in "Email đại diện" with "test_supplier@gmail.com"
    And Click "Lưu" button
    Then User look message "Chỉnh sửa nhà cung cấp thành công." popup

Edit_Supplier_29: Kiểm tra chỉnh sửa thông tin nhà cung cấp thành công khi thay đổi Ghi chú
    [Tags]    @Test_edit_supplier    @Test_by_Hồ_Văn_Nhật
    [Documentation]   Kiểm tra chỉnh sửa thông tin nhà cung cấp thành công khi thay đổi Ghi chú
    When Go to edit supplier page
    And Enter "paragraph" in textarea "Ghi chú" with "_RANDOM_"
    And Click "Lưu" button
    Then User look message "Chỉnh sửa nhà cung cấp thành công." popup

*** Keywords ***
Preconditions
  Set Browser Timeout         ${BROWSER_TIMEOUT}
  New Browser                 ${BROWSER}  headless=${HEADLESS}
  New Page                    ${URL_DEFAULT}
  ${STATE}                    Evaluate  json.loads('''{}''')  json
  Login to Supplier

Go to edit supplier page
  When Click "Quản lý nhà cung cấp" menu
  And Click "Thông tin NCC" sub menu
