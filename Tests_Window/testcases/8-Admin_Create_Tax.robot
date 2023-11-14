*** Settings ***
Resource            ../keywords/common.robot

Test Setup          Preconditions
Test Teardown       Tear Down


*** Test Cases ***
###********************************CREATE TAX====================================================================
###==============================NAVIGATE TO CREATE TAX PAGE=====================================================
Create_Tax_01: Kiểm tra có thể điều hướng thành công đến trang tạo mới thuế
  [Tags]    @Test_Create_Tax    @Test_by_Hồ_Văn_Nhật
  [Documentation]     Kiểm tra có thể điều hướng thành công đến trang tạo mới thuế
  When Click "Quản lý hàng hóa" menu
  And Click "Thuế" sub menu
  And Click "Thêm thuế" button
  Then User look title "Thuế"
  And User look contains title is "Thêm mới thuế"

###===============================VALIDATION TEXT================================================================
Create_Tax_02: Kiểm tra Validation text khi bỏ trống trường "Loại thuế"
  [Tags]    @Test_Create_Tax    @Test_by_Hồ_Văn_Nhật
  [Documentation]     Kiểm tra Validation text khi bỏ trống trường "Loại thuế"
  When Go to create tax page
  And Enter "text" in "Loại thuế" with "${empty}"
  And Click in "Thuế suất (%)" field
  Then Required message "Loại thuế" displayed under "Đây là trường bắt buộc!" field

Create_Tax_03: Kiểm tra Validation text khi bỏ trống trường "Thuế suất"
  [Tags]    @Test_Create_Tax    @Test_by_Hồ_Văn_Nhật
  [Documentation]     Kiểm tra Validation text khi bỏ trống trường "Thuế suất"
  When Go to create tax page
  And Enter "Thuế suất" in "Thuế suất (%)" with "${empty}"
  And Click in "Loại thuế" field
  Then Required message "Thuế suất (%)" displayed under "Đây là trường bắt buộc!" field

Create_Tax_04: Kiểm tra Validation text khi nhập trường "Thuế suất" lớn hơn 999%
  [Tags]    @Test_Create_Tax    @Test_by_Hồ_Văn_Nhật
  [Documentation]     Kiểm tra Validation text khi nhập trường "Thuế suất" lớn hơn 999%
  When Go to create tax page
  And Enter "Tax > 999%" in "Thuế suất (%)" with "_RANDOM_"
  And Click in "Loại thuế" field
  Then Required message "Thuế suất (%)" displayed under "Chỉ chấp nhận giá trị từ 0 đến 999" field

Create_Tax_05: Kiểm tra Validation text khi nhập trường "Thuế suất" nhỏ hơn 0%
  [Tags]    @Test_Create_Tax    @Test_by_Hồ_Văn_Nhật
  [Documentation]     Kiểm tra Validation text khi nhập trường "Thuế suất" nhỏ hơn 0%
  When Go to create tax page
  And Enter "Tax < 0%" in "Thuế suất (%)" with "_RANDOM_"
  And Click in "Loại thuế" field
  Then Required message "Thuế suất (%)" displayed under "Chỉ chấp nhận giá trị từ 0 đến 999" field

Create_Tax_06: Kiểm tra Validation text khi nhập "Mô tả" quá 500 ký tự
  [Tags]    @Test_Create_Tax    @Test_by_Hồ_Văn_Nhật
  [Documentation]     Kiểm tra Validation text khi nhập "Mô tả" quá 500 ký tự
  When Go to create tax page
  And Enter "word" in textarea "Mô tả" with "_RANDOM_"
  And Click in "Loại thuế" field
  Then Required message "Mô tả" displayed under "Chỉ được nhập tối đa 500 kí tự" field

###=================================ERROR MESSAGE=============================================================
Create_Tax_07: Kiểm tra tạo mới thuế không thành công khi nhập "Loại thuế" đã tồn tại
  [Tags]    @Test_Create_Tax    @Test_by_Hồ_Văn_Nhật
  [Documentation]     Kiểm tra tạo mới thuế không thành công khi nhập "Loại thuế" đã tồn tại
  When Go to create tax page
  And Enter "text" in "Loại thuế" with "Thuế môi trường"
  And Enter "%" in "Thuế suất (%)" with "_RANDOM_"
  And Enter "paragraph" in textarea "Mô tả" with "_RANDOM_"
  And Click "Lưu" button
  Then User look message "Đã có tên loại thuế trong hệ thống." popup

Create_Tax_08: Kiểm tra xóa thuế không thanh công khi đã có sản phẩm sử dụng thuế
  [Tags]    @Test_Create_Tax    @Test_by_Hồ_Văn_Nhật
  [Documentation]     Kiểm tra xóa thuế không thanh công khi đã có sản phẩm sử dụng thuế
  When Go to list tax page
  And Delete tax with "Thuế môi trường"
  Then User look message "Đã có sản phẩm sử dụng thuế." popup

###=================================CREATE TAX SUCCESSFULL=============================================================
Create_Tax_09: Kiểm tra tạo mới thuế thành công khi không nhập mô tả
  [Tags]    @Test_Create_Tax    @Test_by_Hồ_Văn_Nhật
  [Documentation]     Kiểm tra tạo mới thuế thành công khi không nhập mô tả
  When Go to create tax page
  And Enter "test name" in "Loại thuế" with "_RANDOM_"
  And Enter "%" in "Thuế suất (%)" with "_RANDOM_"
  And Click "Lưu" button
  Then User look message "Lưu thuế thành công." popup
  And Click on the "Xóa" button in the "Loại thuế" table line
  Then User look message "Xoá thuế thành công." popup

Create_Tax_10: Kiểm tra tạo mới thuế thành công khi nhập đầy đủ thông tin
  [Tags]    @Test_Create_Tax    @Test_by_Hồ_Văn_Nhật
  [Documentation]     Kiểm tra tạo mới thuế thành công khi nhập đầy đủ thông tin
  When Go to create tax page
  And Enter "test name" in "Loại thuế" with "_RANDOM_"
  And Enter "%" in "Thuế suất (%)" with "_RANDOM_"
  And Enter "test name" in textarea "Mô tả" with "_RANDOM_"
  And Click "Lưu" button
  Then User look message "Lưu thuế thành công." popup
  And Click on the "Xóa" button in the "Loại thuế" table line
  Then User look message "Xoá thuế thành công." popup

##===============================VIEW LIST OF TAX==========================================================
Create_Tax_11: Kiểm tra hiển thị thành công danh sách "Thuế" đã tạo
  [Tags]    @Test_Create_Tax    @Test_by_Hồ_Văn_Nhật
  [Documentation]     Kiểm tra hiển thị thành công danh sách "Thuế" đã tạo
  When Go to list tax page
  Then Show list of Taxs

Create_Tax_12: Kiểm tra tìm kiếm "Thuế" thành công khi nhập "Loại thuế" hợp lệ
  [Tags]    @Test_Create_Tax    @Test_by_Hồ_Văn_Nhật
  [Documentation]     Kiểm tra tìm kiếm "Thuế" thành công khi nhập "Loại thuế" hợp lệ
  When Go to list tax page
  And Search "text" in "Tìm kiếm" with "Thuế Thương mại điện tử"
  Then Show list of Taxs

Create_Tax_13: Kiểm tra tìm kiếm "Thuế" thành công khi nhập "Thuế suất(%)" hợp lệ
  [Tags]    @Test_Create_Tax    @Test_by_Hồ_Văn_Nhật
  [Documentation]       Kiểm tra tìm kiếm "Thuế" thành công khi nhập "Thuế suất(%)" hợp lệ
  When Go to list tax page
  And Search "text" in "Tìm kiếm" with "59"
  Then Show list of Taxs

Create_Tax_14: Kiểm tra tìm kiếm "Thuế" thành công khi nhập "Mô tả" hợp lệ
  [Tags]    @Test_Create_Tax    @Test_by_Hồ_Văn_Nhật
  [Documentation]     Kiểm tra tìm kiếm "Thuế" thành công khi nhập "Mô tả" hợp lệ
  When Go to list tax page
  And Search "text" in "Tìm kiếm" with "Rau củ dùng trong siêu thị"
  Then Show list of Taxs

Create_Tax_15: Kiểm tra tìm kiếm "Thuế" không thành công khi nhập "Từ khóa" hợp lệ
  [Tags]    @Test_Create_Tax    @Test_by_Hồ_Văn_Nhật
  [Documentation]     Kiểm tra tìm kiếm "Thuế" không thành công khi nhập "Từ khóa" hợp lệ
  When Go to list tax page
  And Search "text" in "Tìm kiếm" with "_RANDOM_"
  Then No Tax are shown

Create_Tax_16: Kiểm tra có thể xem danh sách thuế trang kế tiếp, trước trước, trang cuối cùng, trang đầu tiên
    [Tags]    @Test_Create_Tax    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra có thể xem danh sách thuế trang kế tiếp, trước trước, trang cuối cùng, trang đầu tiên
    When Go to list tax page
    And Click ">" to "next" page
    Then Show list of Taxs
    And Click "<" to "prev" page
    Then Show list of Taxs
    And Click ">>" to "next_all" page
    Then Show list of Taxs
    And Click "<<" to "prev_all" page
    Then Show list of Taxs

##********************************EDIT TAX******************************************************************
##===============================NAVIGATE TO EDIT TAX PAGE==================================================
Edit_Tax_01: Kiểm tra Validation text trường "Loại thuế" khi bỏ trống loại thuế
  [Tags]    @Test_Edit_Tax    @Test_by_Hồ_Văn_Nhật
  [Documentation]     Kiểm tra Validation text trường "Loại thuế" khi bỏ trống loại thuế
  When Go to list tax page
  And Click on the "Sửa" button in the "Loại thuế" table line
  Then User look title "Thuế"
  And User look contains title is "Chỉnh sửa thuế"

##================================VALIDATION TEXT EDIT TAX==================================================
Edit_Tax_02: Kiểm tra Validation text trường "Loại thuế" khi bỏ trống loại thuế
  [Tags]    @Test_Edit_Tax    @Test_by_Hồ_Văn_Nhật
  [Documentation]     Kiểm tra Validation text trường "Loại thuế" khi bỏ trống loại thuế
  When Go to edit tax page
  And Enter "text" in "Loại thuế" with "${empty}"
  And Click in "Thuế suất (%)" field
  Then Required message "Loại thuế" displayed under "Đây là trường bắt buộc!" field

Edit_Tax_03: Kiểm tra Validation text trường "Thuế suất (%)" khi bỏ trống thuế suất
  [Tags]    @Test_Edit_Tax    @Test_by_Hồ_Văn_Nhật
  [Documentation]     Kiểm tra Validation text trường "Thuế suất (%)" khi bỏ trống thuế suất
  When Go to edit tax page
  And Enter "Tax" in "Thuế suất (%)" with "${empty}"
  And Click in "Loại thuế" field
  Then Required message "Thuế suất (%)" displayed under "Đây là trường bắt buộc!" field

Edit_Tax_04: Kiểm tra Validation text trường "Thuế suất (%)" khi nhập thuế suất lớn hơn 999%
  [Tags]    @Test_Edit_Tax    @Test_by_Hồ_Văn_Nhật
  [Documentation]   Kiểm tra Validation text trường "Thuế suất (%)" khi nhập thuế suất lớn hơn 999%
  When Go to edit tax page
  And Enter "Tax > 999%" in "Thuế suất (%)" with "_RANDOM_"
  And Click in "Loại thuế" field
  Then Required message "Thuế suất (%)" displayed under "Chỉ chấp nhận giá trị từ 0 đến 999" field

Edit_Tax_05: Kiểm tra Validation text trường "Thuế suất (%)" khi nhập thuế suất nhỏ hơn 0%
  [Tags]    @Test_Edit_Tax    @Test_by_Hồ_Văn_Nhật
  [Documentation]       Kiểm tra Validation text trường "Thuế suất (%)" khi nhập thuế suất nhỏ hơn 0%
  When Go to edit tax page
  And Enter "Tax < 0%" in "Thuế suất (%)" with "_RANDOM_"
  And Click in "Loại thuế" field
  Then Required message "Thuế suất (%)" displayed under "Chỉ chấp nhận giá trị từ 0 đến 999" field

Edit_Tax_06: Kiểm tra Validation text trường "Mô tả" khi nhập mô tả quá 500 ký tự
  [Tags]    @Test_Edit_Tax    @Test_by_Hồ_Văn_Nhật
  [Documentation]     Kiểm tra Validation text trường "Mô tả" khi nhập mô tả quá 500 ký tự
  When Go to edit tax page
  And Enter "word" in textarea "Mô tả" with "_RANDOM_"
  And Click in "Loại thuế" field
  Then Required message "Mô tả" displayed under "Chỉ được nhập tối đa 500 kí tự" field

###==========================ERROR MESSAGE WHEN EDIT TAX========================================================================
Edit_Tax_07: Kiểm tra chỉnh sửa "Thuế" không thành công khi nhập "Loại thuế" đã tồn tại
  [Tags]    @Test_Edit_Tax    @Test_by_Hồ_Văn_Nhật
  [Documentation]     Kiểm tra chỉnh sửa "Thuế" không thành công khi nhập "Loại thuế" đã tồn tại
  When Go to edit tax page
  And Enter "text" in "Loại thuế" with "Thuế môi trường"
  And Click "Lưu" button
  Then User look message "Đã có tên loại thuế trong hệ thống." popup

##================================EDIT TAX SUCCESSFULL=============================================================================
Edit_Tax_08: Kiểm tra chỉnh sửa "Thuế" thành công khi thay đổi "Loại thuế"
  [Tags]    @Test_Edit_Tax    @Test_by_Hồ_Văn_Nhật
  [Documentation]       Kiểm tra chỉnh sửa "Thuế" thành công khi thay đổi "Loại thuế"
  When Go to edit tax page
  And Enter "test name" in "Loại thuế" with "_RANDOM_"
  And Click "Lưu" button
  Then User look message "Chỉnh sửa thuế thành công." popup

Edit_Tax_09: Kiểm tra chỉnh sửa "Thuế" thành công khi thay đổi "Thuế suất (%)"
  [Tags]    @Test_Edit_Tax    @Test_by_Hồ_Văn_Nhật
  [Documentation]       Kiểm tra chỉnh sửa "Thuế" thành công khi thay đổi "Thuế suất (%)"
  When Go to edit tax page
  And Enter "Tax valid" in "Thuế suất (%)" with "_RANDOM_"
  And Click "Lưu" button
  Then User look message "Chỉnh sửa thuế thành công." popup

Edit_Tax_10: Kiểm tra chỉnh sửa "Thuế" thành công khi thay đổi "Mô tả"
  [Tags]    @Test_Edit_Tax    @Test_by_Hồ_Văn_Nhật
  [Documentation]       Kiểm tra chỉnh sửa "Thuế" thành công khi thay đổi "Mô tả"
  When Go to edit tax page
  And Enter "paragraph" in textarea "Mô tả" with "_RANDOM_"
  And Click "Lưu" button
  Then User look message "Chỉnh sửa thuế thành công." popup

####================================BACK TO LIST TAX PAGE===========================================================
Edit_Tax_11: Kiểm tra điều hướng đến trang danh sách thuế đã tạo thành công từ trang tạo mới thuế
  [Tags]    @Test_Edit_Tax    @Test_by_Hồ_Văn_Nhật
  [Documentation]     Kiểm tra điều hướng đến trang danh sách thuế đã tạo thành công từ trang tạo mới thuế
  When Go to create tax page
  And Click "Huỷ" button
  Then User look title "Thuế"
  And User look contains title is "Quản lý thuế"

Edit_Tax_12: Kiểm tra điều hướng đến trang danh sách thuế đã tạo thành công từ trang chỉnh sửa thuế
  [Tags]    @Test_Edit_Tax    @Test_by_Hồ_Văn_Nhật
  [Documentation]     Kiểm tra điều hướng đến trang danh sách thuế đã tạo thành công từ trang chỉnh sửa thuế
  When Go to edit tax page
  And Click "Huỷ" button
  Then User look title "Thuế"
  And User look contains title is "Quản lý thuế"

*** Keywords ***
Preconditions
  Set Browser Timeout         ${BROWSER_TIMEOUT}
  New Browser                 ${BROWSER}  headless=${HEADLESS}
  New Page                    ${URL_DEFAULT}
  ${STATE}                    Evaluate  json.loads('''{}''')  json
  Login to Admin

Go to ${name} tax page
  When Click "Quản lý hàng hóa" menu
  And Click "Thuế" sub menu
  IF  '${name}' == 'create'
      And Click "Thêm thuế" button
  ELSE IF  '${name}' == 'edit'
      And Click on the "Sửa" button in the "Loại thuế" table line
  END
  Sleep         ${SHOULD_TIMEOUT}

Delete tax with "${tax}"
  Search "Thuế" in "Tìm kiếm" with "Thuế môi trường"
  ${element}        Get Element      //td[contains(text(),'${tax}')]/..//span//button[contains(@class, "ml-4")]
  Wait Until Element Is Visible       ${element}
  Click               ${element}
  Click Confirm To Action

Create tax successfull
  And Enter "test name" in "Loại thuế" with "_RANDOM_"
  And Enter "%" in "Thuế suất (%)" with "_RANDOM_"
  And Click "Lưu" button
  Then User look message "Lưu thuế thành công." popup

Click on the "${text}" button in the "${name}" table line
  Wait Until Element Spin
  ${elements}        Get Elements      //span//button[contains(@class, "")]
  IF  '${text}' == "Sửa"
    ${element}      Set Variable        ${elements}[0]
  ELSE IF  '${text}' == "Xóa"
    ${element}      Set Variable        ${elements}[1]
  END
  Click       ${element}
  Click Confirm To Action

Show list of Taxs
    Wait Until Element Spin
    Sleep               1
    ${elements}=        Get Elements        xpath=//*[contains(@class, "ant-table-row")]
    Run Keyword If    ${elements}     Display     ${elements}
    ...    ELSE    Log To Console     Không tồn tại Thuế nào!
Display
    [Arguments]       ${elements}
    Log To Console    *************************--DANH SÁCH THUẾ--**************************
    Wait Until Element Is Visible         ${elements}[0]
    ${count}=           Set Variable        1
    ${stt}=             Set Variable        1

    FOR  ${i}  IN  @{elements}
       ${Loại thuế}              Get Text            //tbody/tr[${count}]/td[2]
       ${Thuế suất}              Get Text            //tbody/tr[${count}]/td[3]
       ${Mô tả}                  Get Text            //tbody/tr[${count}]/td[4]
       Log To Console    ${stt}. Loại thuế: ${Loại thuế} | Thuế suất: ${Thuế suất}% | Mô tả: ${Mô tả}
       Log To Console    ===================================================================================================================
       ${count}=    Evaluate    ${count} + 1
       ${stt}=    Evaluate    ${stt} + 1
    END
    ${total}=    Evaluate    ${count} - 1
    Log To Console    Tổng số lượng Thuế là: ${total}
