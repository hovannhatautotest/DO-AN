*** Settings ***
Resource            ../keywords/common.robot

Test Setup          Preconditions
Test Teardown       Tear Down

*** Test Cases ***
###************************* ĐIỀU HƯỚNG ĐẾN TRANG "HỦY HÀNG"*************************************************
Create_Product_Disposal_Balance_01: Xác minh có thể điều huớng đến trang "Hủy hàng" thành công
    [Tags]    @Test_Create_Product_Disposal_Balance     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh có thể điều huớng đến trang "Hủy hàng" thành công
    When Click "Quản lý kho" menu
    And Click "Hủy hàng" sub menu
    And Click "Thêm mới" button
    Then User look title "Hủy Hàng"
    And User look contains title is "Hủy hàng"

###**************************************VALIDATION TEXT****************************************************************
Create_Product_Disposal_Balance_02: Xác minh Validation Text khi bỏ trống trường "Thời gian hủy hàng"
    [Tags]    @Test_Create_Product_Disposal_Balance     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh Validation Text khi bỏ trống trường "Thời gian hủy hàng"
    When Go to create Product Disposal page
    And Delete date text in "Thời gian hủy hàng" field
    Then Required message in "Thời gian hủy hàng" field displayed under with "Thời gian hủy hàng là bắt buộc"

Create_Product_Disposal_Balance_03: Xác minh Validation Text khi bỏ trống trường "Lý do hủy hàng"
    [Tags]    @Test_Create_Product_Disposal_Balance     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh Validation Text khi bỏ trống trường "Lý do hủy hàng"
    When Go to create Product Disposal page
    And Enter "test name" in "Lý do hủy hàng" field with "_RANDOM_"
    And Enter "test name" in "Lý do hủy hàng" field with "${empty}"
    Then Required message in "Lý do hủy hàng" field displayed under with "Lý do hủy hàng là bắt buộc"

Create_Product_Disposal_Balance_04: Xác minh Validation Text khi bỏ trống "Số lượng hủy"
    [Tags]    @Test_Create_Product_Disposal_Balance     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh Validation Text khi bỏ trống "Số lượng"
    When Go to create Product Disposal page
    And Add product with Balance_Supplier is "Siêu thị Big C Huế"
    And Click "Lưu" button
    Then Required message in "Số lượng" field displayed under with "Số lượng là bắt buộc"

Create_Product_Disposal_Balance_05: Xác minh Validation Text khi nhập "Số lượng hủy" bằng 0
    [Tags]    @Test_Create_Product_Disposal_Balance     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh Validation Text khi nhập "Số lượng" bằng 0
    When Go to create Product Disposal page
    And Add product with Balance_Supplier is "Siêu thị Big C Huế"
    And Enter "number" in "Số lượng hủy" field with "0"
    Then Required message in "Số lượng hủy" field displayed under with "Vui lòng nhập số lượng lớn hơn 0"
#
####**************************************ERROR MESSAGE******************************************************************
Create_Product_Disposal_Balance_06: Xác minh hiển thị thông báo lỗi khi nhập "Số lượng hủy" lớn hơn 999999
    [Tags]    @Test_Create_Product_Disposal_Balance     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh hiển thị thông báo lỗi khi nhập "Số lượng hủy" lớn hơn 999999
    When Go to create Product Disposal page
    And Enter "test name" in "Lý do hủy hàng" field with "_RANDOM_"
    And Add product with Balance_Supplier is "Siêu thị Big C Huế"
    And Enter "number > 999999" in "Số lượng hủy" field with "_RANDOM_"
    And Click "Lưu" button
    And Click "Đồng ý" button
    Then User look message "Vui lòng nhập tối đa 999999" popup
#
####**********************************CREATE PRODUCT DISPOSAL SUCCESSFULL**************************************************
Create_Product_Disposal_Balance_07: Xác minh tạo mới đơn "Hủy hàng" thành công với nhà cung cấp Balance
    [Tags]    @Test_Create_Product_Disposal_Balance     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh tạo mới đơn "Hủy hàng" thành công với nhà cung cấp Balance
    When Go to create Product Disposal page
    And Enter "test name" in "Lý do hủy hàng" field with "_RANDOM_"
    And Add product with Balance_Supplier is "Siêu thị Big C Huế"
    And Enter "%" in "Số lượng hủy" field with "_RANDOM_"
    And Click "Lưu" button
    And Click "Đồng ý" button
    Then User look message "Tạo huỷ hàng thành công." popup
    When Select product_disposal need to delete
    And Click "Xóa" button
    And Click Verify To Action
    Then User look message "Xoá huỷ hàng thành công." popup

Create_Product_Disposal_Balance_08: Xác minh tạo mới đơn "Hủy hàng" thành công với nhà cung cấp Non-Balance
    [Tags]    @Test_Create_Product_Disposal_Balance     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh tạo mới đơn "Hủy hàng" thành công với nhà cung cấp Non-Balance
    When Go to create Product Disposal page
    And Enter "test name" in "Lý do hủy hàng" field with "_RANDOM_"
    And Click select in "Đối tác" field with "Non_Balance"
    And Add product with Non-Balance_Supplier is "Nhà cung cấp áo dài"
    And Enter "%" in "Số lượng hủy" field with "_RANDOM_"
    And Click "Lưu" button
    And Click "Đồng ý" button
    Then User look message "Tạo huỷ hàng thành công." popup
    When Select product_disposal need to delete
    And Click "Xóa" button
    And Click Verify To Action
    Then User look message "Xoá huỷ hàng thành công." popup

#####***********************************VIEW LIST OF PRODUCT DISPOSAL*******************************************************
Create_Product_Disposal_Balance_10: Xác minh hiển thị danh sách đơn hủy hàng
    [Tags]    @Test_Create_Product_Disposal_Balance     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh hiển thị danh sách đơn hủy hàng
    When Go to list Product Disposal page
    Then View list of "Product Disposal"

Create_Product_Disposal_Balance_11: Xác minh hiển thị danh sách đơn hủy hàng khi tìm kiếm với "Mã hủy hàng" hợp lệ
    [Tags]    @Test_Create_Product_Disposal_Balance     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh hiển thị danh sách đơn hủy hàng khi tìm kiếm với "Mã hủy hàng" hợp lệ
    When Go to list Product Disposal page
    And Search "Mã hủy hàng" in "Mã hủy hàng" with "DNSTR123720230902001"
    Then View list of "Product Disposal"

Create_Product_Disposal_Balance_12: Xác minh hiển thị danh sách đơn hủy hàng khi tìm kiếm với "Mã hủy hàng" không hợp lệ
    [Tags]    @Test_Create_Product_Disposal_Balance     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh hiển thị danh sách đơn hủy hàng khi tìm kiếm với "Mã hủy hàng" không hợp lệ
    When Go to list Product Disposal page
    And Search "Mã hủy hàng" in "Mã hủy hàng" with "_RANDOM_"
    Then No Product Disposal are shown

Create_Product_Disposal_Balance_13: Xác minh hiển thị danh sách đơn hủy hàng với trang thái "Đang xử lý"
    [Tags]    @Test_Create_Product_Disposal_Balance     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh hiển thị danh sách đơn hủy hàng với trang thái "Đang xử lý"
    When Go to list Product Disposal page
    And Click select in "Chọn trạng thái" field with "Đang xử lý"
    Then View list of "Product Disposal"

Create_Product_Disposal_Balance_14: Xác minh hiển thị danh sách đơn hủy hàng với trang thái "Đã hoàn tất"
    [Tags]    @Test_Create_Product_Disposal_Balance     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh hiển thị danh sách đơn hủy hàng với trang thái "Đã hoàn tất"
    When Go to list Product Disposal page
    And Click select in "Chọn trạng thái" field with "Đã hoàn tất"
    Then View list of "Product Disposal"

Create_Product_Disposal_Balance_17: Xác minh hiển thị danh sách đơn huỷ hàng theo thời gian nhập hàng
    [Tags]    @Test_Create_Product_Disposal_Balance     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh hiển thị danh sách đơn hủy hàng theo thời gian nhập hàng
    When Go to list Product Disposal page
    And Enter date in "Từ ngày" field with "05/06/2023"
    And Enter date in "Đến ngày" field with "02/10/2023"
    Then View list of "Product Disposal"

Create_Product_Disposal_Balance_18: Xác minh rằng có thể xem danh sách đơn hủy hàng trang kế tiếp, trước trước, trang cuối cùng, trang đầu tiên
    [Tags]    @Test_Create_Product_Disposal_Balance         @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh rằng có thể xem danh sách đơn hủy hàng trang kế tiếp, trước trước, trang cuối cùng, trang đầu tiên
    When Go to list Product Disposal page
    And Click ">" to "next" page
    Then View list of "Product Disposal"
    And Click "<" to "prev" page
    Then View list of "Product Disposal"
    And Click ">>" to "next_all" page
    Then View list of "Product Disposal"
    And Click "<<" to "prev_all" page
    Then View list of "Product Disposal"

####********************************ĐIỀU HƯỚNG ĐẾN TRANG CHỈNH SỬA ĐƠN HỦY HÀNG***********************************
Edit_Product_Disposal_Balance_01: Xác minh điều hướng đến trang chỉnh sửa "Nhập Hàng Non-Balance" thành công
    [Tags]    @Test_Edit_Product_Disposal_Balance     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh điều hướng đến trang chỉnh sửa "Nhập Hàng Non-Balance" thành công
    When Go to list Product Disposal page
    And Select product_disposal need to edit
    And Click "Chỉnh sửa" button
    Then User look title "Hủy Hàng"
    And User look contains title is "Hủy hàng"

####==================================EDIT IMPORT GOODS NON-BALANCE=====================================================
####**************************************VALIDATION TEXT****************************************************************
Edit_Product_Disposal_Balance_02: Xác minh Validation Text khi bỏ trống trường "Thời gian hủy hàng"
    [Tags]    @Test_Edit_Product_Disposal_Balance     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh Validation Text khi bỏ trống trường "Thời gian hủy hàng"
    When Go to edit Product Disposal page
    And Delete date text in "Thời gian hủy hàng" field
    Then Required message in "Thời gian hủy hàng" field displayed under with "Thời gian hủy hàng là bắt buộc"

Edit_Product_Disposal_Balance_03: Xác minh Validation Text khi bỏ trống trường "Lý do hủy hàng"
    [Tags]    @Test_Edit_Product_Disposal_Balance     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh Validation Text khi bỏ trống trường "Lý do hủy hàng"
    When Go to edit Product Disposal page
    And Enter "Lý do" in "Lý do hủy hàng" field with "${empty}"
    Then Required message in "Lý do hủy hàng" field displayed under with "Lý do hủy hàng là bắt buộc"

Edit_Product_Disposal_Balance_04: Xác minh Validation Text khi bỏ trống "Số lượng hủy"
    [Tags]    @Test_Edit_Product_Disposal_Balance     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh Validation Text khi bỏ trống "Số lượng"
    When Go to edit Product Disposal page
    And Enter "number" in "Số lượng hủy" field with "${empty}"
    Then Required message in "Số lượng" field displayed under with "Số lượng là bắt buộc"

Edit_Product_Disposal_Balance_05: Xác minh Validation Text khi nhập "Số lượng hủy" bằng 0
    [Tags]    @Test_Edit_Product_Disposal_Balance     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh Validation Text khi nhập "Số lượng" bằng 0
    When Go to edit Product Disposal page
    And Enter "number" in "Số lượng hủy" field with "0"
    Then Required message in "Số lượng hủy" field displayed under with "Vui lòng nhập số lượng lớn hơn 0"

####**************************************ERROR MESSAGE******************************************************************
Edit_Product_Disposal_Balance_06: Xác minh hiển thị thông báo lỗi khi chỉnh sửa "Số lượng hủy" lớn hơn 999999
    [Tags]    @Test_Case_Failed     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh hiển thị thông báo lỗi khi chỉnh sửa "Số lượng hủy" lớn hơn 999999
    When Go to edit Product Disposal page
    And Enter "number > 999999" in "Số lượng hủy" field with "_RANDOM_"
    And Click "Lưu" button
    And Click "Đồng ý" button
    Then User look message "Vui lòng nhập tối đa 999999" popup

####**************************************EDIT PRODUCT DISPOSAL SUCCESSFULL******************************************************************
Edit_Product_Disposal_Balance_07: Xác minh hiển thị thông báo chỉnh sửa thành công khi thay đổi "Thời gian hủy hàng"
    [Tags]    @Test_Edit_Product_Disposal_Balance     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh hiển thị thông báo chỉnh sửa thành công khi thay đổi "Thời gian hủy hàng"
    When Go to edit Product Disposal page
    And Enter date in "Thời gian hủy hàng" field with "_RANDOM_"
    And Click "Lưu" button
    And Click "Đồng ý" button
    Then User look message "Chỉnh sửa huỷ hàng thành công." popup

Edit_Product_Disposal_Balance_08: Xác minh hiển thị thông báo chỉnh sửa thành công khi thay đổi "Lý do hủy hàng"
    [Tags]    @Test_Edit_Product_Disposal_Balance     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh hiển thị thông báo chỉnh sửa thành công khi thay đổi "Lý do hủy hàng"
    When Go to edit Product Disposal page
    And Enter "Lý do" in "Lý do hủy hàng" field with "Khách yêu cầu"
    And Click "Lưu" button
    And Click "Đồng ý" button
    Then User look message "Chỉnh sửa huỷ hàng thành công." popup

Edit_Product_Disposal_Balance_09: Xác minh hiển thị thông báo chỉnh sửa thành công khi thay đổi "Số lượng hủy hàng"
    [Tags]    @Test_Edit_Product_Disposal_Balance     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh hiển thị thông báo chỉnh sửa thành công khi thay đổi "Số lượng hủy hàng"
    When Go to edit Product Disposal page
    And Enter "number" in "Số lượng hủy" field with "1"
    And Click "Lưu" button
    Then User look message "Chỉnh sửa huỷ hàng thành công." popup

Edit_Product_Disposal_Balance_10: Xác minh hiển thị thông báo chỉnh sửa thành công khi thay đổi "Trạng thái đơn hủy hàng"
    [Tags]    @Test_Edit_Product_Disposal_Balance     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh hiển thị thông báo chỉnh sửa thành công khi thay đổi "Trạng thái đơn hủy hàng"
    When Go to list Product Disposal page
    And Select product_disposal need to change_status
    And Click "Xuất phiếu hủy hàng" button
    Then User look message "Tạo phiếu huỷ hàng thành công." popup

*** Keywords ***
Preconditions
  Set Browser Timeout         ${BROWSER_TIMEOUT}
  New Browser                 ${BROWSER}  headless=${HEADLESS}
  New Page                    ${URL_DEFAULT}
  ${STATE}                    Evaluate  json.loads('''{}''')  json
  Login to Store

Enter date in "${name}" field with "${text}"
  ${text}=                  Get Random Text                   dd/mm/yyyy                          ${text}
  ${element}=               Get Element Form Item By Label    ${name}                       //*[contains(@class, "ant-picker-input")]/input
  Click                     ${element}
  Clear Text                ${element}
  Fill Text                 ${element}                        ${text}
  Press Keys                ${element}                        Tab
  Press Keys                ${element}                        Tab

Click on "Thêm sản phẩm" button
    Click     //span[contains(text(),'Thêm sản phẩm')]

Enter "${type}" in "${name}" field with "${text}"
    ${text}=              Get Random Text                   ${type}                       ${text}
    IF  '${name}' == 'Lý do hủy hàng'
        ${element}=               Get Element Form Item By Label      ${name}        //input[contains(@class, "ant-input")]
    ELSE IF  '${name}' != 'Lý do hủy hàng'
        ${element}            Get Element             //input[contains(@class, "ant-input") and @placeholder=" Nhập số lượng"]
    END
    Wait Until Element Is Visible        ${element}
    Clear Text                           ${element}
    Type Text             ${element}     ${text}
    Press Keys            ${element}     Enter

Go to ${name} Product Disposal page
    When Click "Quản lý kho" menu
    And Click "Hủy hàng" sub menu
    And Delete date text in "Từ ngày" field
    And Delete date text in "Đến ngày" field
    IF  '${name}' == 'create'
      And Click "Thêm mới" button
    ELSE IF  '${name}' == 'edit'
      And Select product_disposal need to edit
      And Click "Chỉnh sửa" button
    END
    Sleep        1

Click Verify To Action
    ${elements}         Get Elements        //button[contains(text(),'Xóa')]
    Click               ${elements}[1]

Select product_disposal need to ${name}
    ${element}        Get Elements          //div[contains(text(),'Đang xử lý')]
    Click             ${element}[0]         left          2

Delete date text in "${name}" field
    ${element}=               Get Element Form Item By Label     ${name}            //span[contains(@class, "ant-picker-clear")]
    Wait Until Element Is Visible       ${element}
    Click                               ${element}
    Sleep                               ${SHOULD_TIMEOUT}

Add product with ${name} is "${text}"
    When Click on "Thêm sản phẩm" button
    IF  '${name}' == 'Balance_Supplier'
        And Click select balance supplier with "${text}"
        And Select pruduct with "Iphone 13 pro max" need to Disposal
    ELSE IF  '${name}' == 'Non-Balance_Supplier'
        And Click select Non-balance supplier with "${text}"
        And Select pruduct with "Các mẫu áo dài trung niên in 3D cho các bà, các mẹ - Áo Dài Đan Linh" need to Disposal
    END

    And Click "Thêm" button
    And Click "Đóng" button

Select pruduct with "${product}" need to Disposal
    When Search "product_disposal" in "Tìm kiếm" with "${product}"
    ${element}        Set Variable        //*[contains(@class, 'top-[10px]')]
    Wait Until Element Is Visible         ${element}
    Click                                 ${element}

Click select ${name} supplier with "${text}"
    ${element}        Get Elements      //input[contains(@class, "ant-select-selection-search-input")]
    Clear Text        ${element}[1]
    Sleep             1
    Type Text         ${element}[1]           ${text}
    Sleep             1
    ${element}        Set Variable      xpath=//*[contains(@class, "ant-select-item-option") and @title="${text}"]
    Click             ${element}

Required message in "${name}" field displayed under with "${text}"
    ${element}=               Get Element          //*[contains(text(),'${text}')]
    Wait Until Element Is Visible                   ${element}
    Element Text Should Be                          ${element}            ${text}

# Tìm phần tử trên form dựa trên tên.
Get Element Form Item By Label
  [Arguments]               ${name}                           ${xpath}=${EMPTY}
  IF  '${name}' == 'Từ ngày' or '${name}' == 'Đến ngày'
      ${element}          Set Variable                  xpath=//*[contains(text(),'${name}')]/../..${xpath}
  ELSE IF  '${name}' != 'Từ ngày'
      ${element}          Set Variable                  xpath=//*[contains(text(),'${name}:')]/..${xpath}
  END
  [Return]            ${element}

View list of "${name}"
    Wait Until Element Spin
    ${elements}=        Get Elements        xpath=//*[contains(@class, "ant-table-row")]
    Run Keyword If    ${elements}     Display     ${elements}
    ...    ELSE    Log To Console     Không tồn tại đơn hủy hàng nào ứng với từ khóa tìm kiếm!

Display
    [Arguments]    ${elements}
    Log To Console    ${EMPTY}
    Log To Console    ***************************************************************-DANH SÁCH ĐƠN HỦY HÀNG-***************************************************************
    Wait Until Element Is Visible         ${elements}[0]
    ${count}=           Set Variable        1
    ${stt}=             Set Variable        1
    FOR  ${i}  IN  @{elements}
        ${Mã hủy hàng}        Get Text    //tbody[contains(@class, "ant-table-tbody")]/tr[${count}]/td[1]
        ${Ngày hủy}           Get Text    //tbody[contains(@class, "ant-table-tbody")]/tr[${count}]/td[2]
        ${Trạng thái}         Get Text    //tbody[contains(@class, "ant-table-tbody")]/tr[${count}]/td[3]
        Log To Console    ${stt}. Mã hủy hàng: ${Mã hủy hàng} || Ngày hủy: ${Ngày hủy} || Trạng thái: ${Trạng thái}
        Log To Console    -------------------------------------------------------------------------------------------------------------------------------------------------------------
        ${count}=    Evaluate    ${count} + 1
        ${stt}=    Evaluate    ${stt} + 1
    END
    ${total}=    Evaluate    ${count} - 1
    Log To Console    Tổng số lượng đơn hủy hàng là: ${total} đơn

Click select in "${name}" field with "${text}"
  IF  '${name}' == 'Chọn trạng thái'
      ${elements}=               Get Elements             //*[contains(@class, "ant-select-selection-search-input")]
      Click         ${elements}[0]
  ELSE IF  '${name}' == 'Chọn nhà cung cấp'
      ${elements}=               Get Elements             //*[contains(@class, "ant-select-selection-search-input")]
      Click         ${elements}[1]
  ELSE IF  '${name}' == 'Đối tác' and '${text}' == 'Non_Balance'
      ${elements}=               Set Variable       //span[contains(text(),'Balance')]
      Wait Until Element Is Visible     ${elements}
      Click         ${elements}
  ELSE IF  '${name}' == 'Đối tác' and '${text}' == 'Balance'
      ${elements}=               Set Variable       //span[contains(text(),'Non_Balance')]
      Wait Until Element Is Visible     ${elements}
      Click         ${elements}
  END
  ${element}=             Get Element      xpath=//*[contains(@class, "ant-select-item-option") and @title="${text}"]
  Wait Until Element Is Visible     ${element}
  Click                   ${element}
