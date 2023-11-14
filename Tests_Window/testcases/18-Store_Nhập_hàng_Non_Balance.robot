*** Settings ***
Resource            ../keywords/common.robot

Test Setup          Preconditions
Test Teardown       Tear Down

*** Variables ***
${Tên sản phẩm}       BÒ TÂY NINH

*** Test Cases ***
###************************* ĐIỀU HƯỚNG ĐẾN TRANG "NHẬP HÀNG TRỰC TIẾP"*************************************************
Create_Import_Goods_Non-Balance_01: Xác minh có thể điều huớng đến trang "Nhập hàng Non-Balance" thành công
    [Tags]    @Test_Create_Import_Goods_Non-Balance     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh có thể điều huớng đến trang "Nhập hàng Non-Balance" thành công
    When Click "Quản lý kho" menu
    And Click "Nhập hàng N-Balance" sub menu
    And Click "Thêm mới" button
    Then User look title "Nhập Hàng Non-Balance"
    And User look contains title is "Nhập hàng Non-Balance"

###**************************************VALIDATION TEXT****************************************************************
Create_Import_Goods_Non-Balance_02: Xác minh Validation Text khi bỏ trống trường "Thời gian nhập hàng"
    [Tags]    @Test_Create_Import_Goods_Non-Balance     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh Validation Text khi bỏ trống trường "Thời gian nhập hàng"
    When Go to create "Nhập Hàng Non-Balance" page
    And Delete date text in "Thời gian nhập hàng" field
    Then Required message in "Thời gian nhập hàng" field displayed under with "Thời gian nhập hàng là bắt buộc"

Create_Import_Goods_Non-Balance_03: Xác minh Validation Text khi bỏ trống "Đơn giá (VND)"
    [Tags]    @Test_Create_Import_Goods_Non-Balance     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh Validation Text khi bỏ trống "Đơn giá (VND)"
    When Go to create "Nhập Hàng Non-Balance" page
    And Add product
    And Enter "Đơn giá" in "Đơn giá (VND)" field with "${empty}"
    Then Required message in "Đơn giá (VND)" field displayed under with "Đơn giá là bắt buộc"

Create_Import_Goods_Non-Balance_04: Xác minh Validation Text khi bỏ trống "Số lượng"
    [Tags]    @Test_Create_Import_Goods_Non-Balance     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh Validation Text khi bỏ trống "Số lượng"
    When Go to create "Nhập Hàng Non-Balance" page
    And Add product
    And Click "Lưu" button
    Then Required message in "Số lượng" field displayed under with "Số lượng là bắt buộc"

Create_Import_Goods_Non-Balance_05: Xác minh Validation Text khi nhập "Số lượng" bằng 0
    [Tags]    @Test_Create_Import_Goods_Non-Balance     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh Validation Text khi nhập "Số lượng" bằng 0
    When Go to create "Nhập Hàng Non-Balance" page
    And Add product
    And Enter "number" in "Số lượng" field with "0"
    Then Required message in "Số lượng" field displayed under with "Vui lòng nhập giá trị lớn hơn 0"

###**************************************ERROR MESSAGE******************************************************************
Create_Import_Goods_Non-Balance_06: Xác minh hiển thị thông báo lỗi khi nhập số lượng nhập hàng lớn hơn 999999
    [Tags]    @Test_Create_Import_Goods_Non-Balance     @Test_by_Hồ_Văn_Nhật
    [Documentation]       Xác minh hiển thị thông báo lỗi khi nhập số lượng nhập hàng lớn hơn 999999
    When Go to create "Nhập Hàng Non-Balance" page
    And Add product
    And Enter "number" in "Số lượng" field with "1000000"
    And Click "Lưu" button
    Then User look message "Vui lòng nhập tối đa 999999" popup

###**********************************IMPORT GOODS Non-Balance SUCCESSFULL**************************************************
Create_Import_Goods_Non-Balance_07: Xác minh tạo mới đơn "Nhập hàng Non-Balance" thành công
    [Tags]    @Test_Create_Import_Goods_Non-Balance     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh tạo mới đơn "Nhập hàng Non-Balance" thành công
    When Go to create "Nhập Hàng Non-Balance" page
    And Add product
    And Enter "Lý do nhập hàng" in "Lý do nhập hàng" field with "Đang thiếu hàng, cần nhập hàng gấp"
    And Enter "%" in "Số lượng" field with "_RANDOM_"
    And Click "Lưu" button
    Then User look message "Thêm nhập hàng thành công." popup
    When Select goods non-balance need to delete
    And Click "Xóa" button
    And Click Verify To Action
    Then User look message "Xóa nhập hàng thành công." popup

Create_Import_Goods_Non-Balance_08: Xác minh tạo mới đơn "Nhập hàng Non-Balance" thành công khi không nhập "Lý do nhập hàng"
    [Tags]    @Test_Create_Import_Goods_Non-Balance     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh tạo mới đơn "Nhập hàng Non-Balance" thành công khi không nhập "Lý do nhập hàng"
    When Go to create "Nhập Hàng Non-Balance" page
    And Add product
    And Enter "%" in "Số lượng" field with "_RANDOM_"
    And Click "Lưu" button
    Then User look message "Thêm nhập hàng thành công." popup
    When Select goods non-balance need to delete
    And Click "Xóa" button
    And Click Verify To Action
    Then User look message "Xóa nhập hàng thành công." popup

Create_Import_Goods_Non-Balance_09: Xác minh tạo mới đơn "Nhập hàng Non-Balance" thành công khi "Không áp dụng thuế"
    [Tags]    @Test_Create_Import_Goods_Non-Balance     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh tạo mới đơn "Nhập hàng Non-Balance" thành công khi "Không áp dụng thuế"
    When Go to create "Nhập Hàng Non-Balance" page
    And Add product
    And Enter "Lý do nhập hàng" in "Lý do nhập hàng" field with "Đang thiếu hàng, cần nhập hàng gấp"
    And Click select in "Loại thuế" with "Không áp dụng thuế"
    And Enter "%" in "Số lượng" field with "_RANDOM_"
    And Click "Lưu" button
    Then User look message "Thêm nhập hàng thành công." popup
    When Select goods non-balance need to delete
    And Click "Xóa" button
    And Click Verify To Action
    Then User look message "Xóa nhập hàng thành công." popup

####***********************************VIEW LIST OF GOODS DIRECTLY*******************************************************
Create_Import_Goods_Non-Balance_10: Xác minh hiển thị danh sách Nhập Hàng Non-Balance
    [Tags]    @Test_Create_Import_Goods_Non-Balance     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh hiển thị danh sách Nhập Hàng Non-Balance
    When Go to list "Nhập Hàng Non-Balance" page
    Then View list of "Import goods Non-Balance"

Create_Import_Goods_Non-Balance_11: Xác minh hiển thị danh sách Nhập Hàng Non-Balance khi tìm kiếm với mã nhập hàng hợp lệ
    [Tags]    @Test_Create_Import_Goods_Non-Balance     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh hiển thị danh sách Nhập Hàng Non-Balance khi tìm kiếm với mã nhập hàng hợp lệ
    When Go to list "Nhập Hàng Non-Balance" page
    And Search "Mã nhập hàng" in "Mã nhập hàng" with "PONSTR12372023092601"
    Then View list of "Import goods Non-Balance"

Create_Import_Goods_Non-Balance_12: Xác minh hiển thị danh sách Nhập Hàng Non-Balance khi tìm kiếm với mã nhập hàng không hợp lệ
    [Tags]    @Test_Create_Import_Goods_Non-Balance     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh hiển thị danh sách Nhập Hàng Non-Balance khi tìm kiếm với mã nhập hàng không hợp lệ
    When Go to list "Nhập Hàng Non-Balance" page
    And Search "Mã nhập hàng" in "Mã nhập hàng" with "_RANDOM_"
    Then No Import goods Non-Balance are shown

Create_Import_Goods_Non-Balance_13: Xác minh hiển thị danh sách nhập hàng với trang thái "Đang xử lý"
    [Tags]    @Test_Create_Import_Goods_Non-Balance     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh hiển thị danh sách nhập hàng với trang thái "Đang xử lý"
    When Go to list "Nhập Hàng Non-Balance" page
    And Click select in "Chọn trạng thái" field with "Đang xử lý"
    Then View list of "Import goods Non-Balance"

Create_Import_Goods_Non-Balance_14: Xác minh hiển thị danh sách nhập hàng với trang thái "Đã hoàn tất"
    [Tags]    @Test_Create_Import_Goods_Non-Balance     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh hiển thị danh sách nhập hàng với trang thái "Đã hoàn tất"
    When Go to list "Nhập Hàng Non-Balance" page
    And Click select in "Chọn trạng thái" field with "Đã hoàn tất"
    Then View list of "Import goods Non-Balance"

Create_Import_Goods_Non-Balance_15: Xác minh hiển thị danh sách nhập hàng với nhà cung cấp "Nhà cung cấp thiết bị điện tử"
    [Tags]    @Test_Create_Import_Goods_Non-Balance     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh hiển thị danh sách nhập hàng với nhà cung cấp "Nhà cung cấp thiết bị điện tử"
    When Go to list "Nhập Hàng Non-Balance" page
    And Click select in "Chọn nhà cung cấp" field with "Nhà cung cấp thiết bị điện tử"
    Then View list of "Import goods Non-Balance"

Create_Import_Goods_Non-Balance_16: Xác minh hiển thị danh sách nhập hàng với nhà cung cấp "Nhà cung cấp đồ chơi Rubik"
    [Tags]    @Test_Create_Import_Goods_Non-Balance     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh hiển thị danh sách nhập hàng với nhà cung cấp "Nhà cung cấp đồ chơi Rubik"
    When Go to list "Nhập Hàng Non-Balance" page
    And Click select in "Chọn nhà cung cấp" field with "Nhà cung cấp đồ chơi Rubik"
    Then View list of "Import goods Non-Balance"

Create_Import_Goods_Non-Balance_17: Xác minh hiển thị danh sách nhập hàng theo thời gian nhập hàng
    [Tags]    @Test_Create_Import_Goods_Non-Balance     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh hiển thị danh sách nhập hàng theo thời gian nhập hàng
    When Go to list "Nhập Hàng Non-Balance" page
    And Enter date in "Từ ngày" field with "05/06/2023"
    And Enter date in "Đến ngày" field with "02/10/2023"
    Then View list of "Import goods Non-Balance"

Create_Import_Goods_Non-Balance_18: Xác minh rằng có thể xem danh sách đơn nhập hàng Non-Balance trang kế tiếp, trước trước, trang cuối cùng, trang đầu tiên
    [Tags]    @Test_Create_Import_Goods_Non-Balance     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh rằng có thể xem danh sách đơn nhập hàng Non-Balance trang kế tiếp, trước trước, trang cuối cùng, trang đầu tiên
    When Go to list "Nhập Hàng Non-Balance" page
    And Click ">" to "next" page
    Then View list of "Import goods Non-Balance"
    And Click "<" to "prev" page
    Then View list of "Import goods Non-Balance"
    And Click ">>" to "next_all" page
    Then View list of "Import goods Non-Balance"
    And Click "<<" to "prev_all" page
    Then View list of "Import goods Non-Balance"

####********************************ĐIỀU HƯỚNG ĐẾN TRANG CHỈNH SỬA Nhập Hàng Non-Balance***********************************
Edit_Import_Goods_Non-Balance_01: Xác minh điều hướng đến trang chỉnh sửa "Nhập Hàng Non-Balance" thành công
    [Tags]    @Test_Create_Import_Goods_Non-Balance     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh điều hướng đến trang chỉnh sửa "Nhập Hàng Non-Balance" thành công
    When Go to list "Nhập Hàng Non-Balance" page
    And Select goods non-balance need to edit
    And Click "Chỉnh sửa" button
    Then User look title "Nhập Hàng Non-Balance"
    And User look contains title is "Nhập hàng Non-Balance"

####==================================EDIT IMPORT GOODS NON-BALANCE=====================================================
###**************************************VALIDATION TEXT****************************************************************
Edit_Import_Goods_Non-Balance_02: Xác minh Validation Text khi bỏ trống trường "Thời gian nhập hàng"
    [Tags]    @Test_Edit_Import_Goods_Non-Balance     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh Validation Text khi bỏ trống trường "Thời gian nhập hàng"
    When Go to edit "Nhập Hàng Non-Balance" page
    And Delete date text in "Thời gian nhập hàng" field
    Then Required message in "Thời gian nhập hàng" field displayed under with "Thời gian nhập hàng là bắt buộc"

Edit_Import_Goods_Non-Balance_03: Xác minh Validation Text khi bỏ trống "Đơn giá (VND)"
    [Tags]    @Test_Edit_Import_Goods_Non-Balance     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh Validation Text khi bỏ trống "Đơn giá (VND)"
    When Go to edit "Nhập Hàng Non-Balance" page
    And Enter "Đơn giá" in "Đơn giá (VND)" field with "${empty}"
    Then Required message in "Đơn giá (VND)" field displayed under with "Đơn giá là bắt buộc"

Edit_Import_Goods_Non-Balance_04: Xác minh Validation Text khi bỏ trống "Số lượng"
    [Tags]    @Test_Edit_Import_Goods_Non-Balance     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh Validation Text khi bỏ trống "Số lượng"
    When Go to edit "Nhập Hàng Non-Balance" page
    And Enter "number" in "Số lượng" field with "${empty}"
    And Click "Lưu" button
    Then Required message in "Số lượng" field displayed under with "Số lượng là bắt buộc"

Edit_Import_Goods_Non-Balance_05: Xác minh Validation Text khi nhập "Số lượng" bằng 0
    [Tags]    @Test_Edit_Import_Goods_Non-Balance     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh Validation Text khi nhập "Số lượng" bằng 0
    When Go to edit "Nhập Hàng Non-Balance" page
    And Enter "number" in "Số lượng" field with "0"
    Then Required message in "Số lượng" field displayed under with "Vui lòng nhập giá trị lớn hơn 0"

####**************************************ERROR MESSAGE******************************************************************
Edit_Import_Goods_Non-Balance_06: Xác minh hiển thị thông báo lỗi khi nhập số lượng nhập hàng lớn hơn 999999
    [Tags]    @Test_Case_Failed     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh hiển thị thông báo lỗi khi nhập số lượng nhập hàng lớn hơn 999999
    When Go to edit "Nhập Hàng Non-Balance" page
    And Enter "number" in "Số lượng" field with "1000000"
    And Click "Lưu" button
    Then User look message "Vui lòng nhập tối đa 999999" popup

####**********************************EDIT IMPORT GOODS Non-Balance SUCCESSFULL**************************************************
Edit_Import_Goods_Non-Balance_07: Xác minh chỉnh sửa đơn "Nhập hàng Non-Balance" thành công khi thay đổi "Lý do nhập hàng"
    [Tags]    @Test_Edit_Import_Goods_Non-Balance     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh chỉnh sửa đơn "Nhập hàng Non-Balance" thành công khi thay đổi "Lý do nhập hàng"
    When Go to edit "Nhập Hàng Non-Balance" page
    And Enter "Lý do nhập hàng" in "Lý do nhập hàng" field with "Đang thiếu hàng, cần nhập hàng gấp"
    And Click "Lưu" button
    Then User look message "Chỉnh sửa nhập hàng thành công." popup

Edit_Import_Goods_Non-Balance_08: Xác minh chỉnh sửa đơn "Nhập hàng Non-Balance" thành công khi thay đổi "Thời gian nhập hàng"
    [Tags]    @Test_Edit_Import_Goods_Non-Balance     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh chỉnh sửa đơn "Nhập hàng Non-Balance" thành công khi thay đổi "Thời gian nhập hàng"
    When Go to edit "Nhập Hàng Non-Balance" page
    And Enter date in "Thời gian nhập hàng" field with "_RANDOM_"
    And Click "Lưu" button
    Then User look message "Chỉnh sửa nhập hàng thành công." popup

Edit_Import_Goods_Non-Balance_09: Xác minh chỉnh sửa đơn "Nhập hàng Non-Balance" thành công khi thay đổi "Thuế"
    [Tags]    @Test_Edit_Import_Goods_Non-Balance     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh chỉnh sửa đơn "Nhập hàng Non-Balance" thành công khi thay đổi "Thuế"
    When Go to edit "Nhập Hàng Non-Balance" page
    And Click select in "Loại thuế" field with "Không áp dụng thuế"
    And Click "Lưu" button
    Then User look message "Chỉnh sửa nhập hàng thành công." popup

Edit_Import_Goods_Non-Balance_10: Xác minh chỉnh sửa đơn "Nhập hàng Non-Balance" thành công khi thay đổi "Trạng thái đơn nhập hàng Non-Balance"
    [Tags]    @Test_Edit_Import_Goods_Non-Balance     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh chỉnh sửa đơn "Nhập hàng Non-Balance" thành công khi thay đổi "Trạng thái đơn nhập hàng Non-Balance"
    When Go to list "Nhập Hàng Non-Balance" page
    And Select goods non-balance need to change_status
    And Click "Xuất phiếu nhập hàng" button
    Then User look message "Tạo phiếu đặt hàng thành công" popup

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
    IF  '${name}' == 'Đơn giá (VND)'
        ${elements}            Get Elements             //input[contains(@class, "ant-input") and @placeholder=" Nhập giá trị"]
        ${element}            Set Variable          ${elements}[0]
    ELSE IF  '${name}' == 'Số lượng'
        ${elements}            Get Elements             //input[contains(@class, "ant-input") and @placeholder=" Nhập giá trị"]
        ${element}            Set Variable          ${elements}[1]
    ELSE IF  '${name}' == 'Lý do nhập hàng'
        ${element}=               Get Element Form Item By Label      ${name}        //input[contains(@class, "ant-input")]
    ELSE IF  '${name}' == 'Thuế'
        ${element}            Set Variable          //input[contains(@class, "ant-select-selection-search-input")]
    END
    Wait Until Element Is Visible        ${element}
    Clear Text                           ${element}
    Type Text       ${element}        ${text}
    Press Keys            ${element}          Enter

Go to ${name} "Nhập Hàng Non-Balance" page
    When Click "Quản lý kho" menu
    And Click "Nhập hàng N-Balance" sub menu
    And Delete date text in "Từ ngày" field
    And Delete date text in "Đến ngày" field
    IF  '${name}' == 'create'
      And Click "Thêm mới" button
    ELSE IF  '${name}' == 'edit'
      And Select goods non-balance need to edit
      And Click "Chỉnh sửa" button
    END

Click Verify To Action
    ${elements}         Get Elements        //button[contains(text(),'Xóa')]
    Click               ${elements}[1]

Select goods non-balance need to ${text}
    ${element}        Get Elements          //div[contains(text(),'Đang xử lý')]
    Click             ${element}[0]         left          2

Delete date text in "${name}" field
    ${element}=               Get Element Form Item By Label     ${name}            //span[contains(@class, "ant-picker-clear")]
    Wait Until Element Is Visible       ${element}
    Click                               ${element}
    Sleep                               ${SHOULD_TIMEOUT}

Add product
    When Click on "Thêm sản phẩm" button
    And Click select non-balance supplier with "Nhà cung cấp đồ chơi Rubik"
    And Search "Tên sản phẩm" in "Tìm kiếm" with "${Tên sản phẩm}"
    And Select product need to import goods non-balance
    And Click "Thêm" button
    And Click "Đóng" button

Select product need to import goods non-balance
    ${element}        Set Variable        //*[contains(@class, 'top-[10px]')]
    Wait Until Element Is Visible         ${element}
    Click                                 ${element}

Click select non-balance supplier with "${text}"
    ${element}        Get Elements      //input[contains(@class, "ant-select-selection-search-input")]
    Clear Text        ${element}[1]
    Type Text         ${element}[1]           ${text}
    Press Keys        ${element}[1]           Enter

Click select in "Loại thuế" with "${text}"
    ${element}        Set Variable      //span[contains(text(),'Áp dụng thuế')]
    Wait Until Element Is Visible       ${element}
    Click             ${element}
    ${element}        Set Variable      xpath=//*[contains(@class, "ant-select-item-option") and @title="${text}"]
    Click             ${element}

Click select in "Loại thuế" field with "${text}"
    ${element}        Set Variable      //*[contains(@class, "ant-select-show-arrow")]
    Wait Until Element Is Visible       ${element}
    Click             ${element}
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

View list of "Import goods Non-Balance"
    Wait Until Element Spin
    ${elements}=        Get Elements        xpath=//*[contains(@class, "ant-table-row")]
    Run Keyword If    ${elements}     Display     ${elements}
    ...    ELSE    Log To Console     Không tồn tại hàng nhập Non-Balance nào!

Display
    [Arguments]    ${elements}
    Log To Console    ${EMPTY}
    Log To Console    ***************************************************************-DANH SÁCH HÀNG NHẬP TRỰC TIẾP-***************************************************************
    Wait Until Element Is Visible         ${elements}[0]
    ${count}=           Set Variable        1
    ${stt}=             Set Variable        1
    FOR  ${i}  IN  @{elements}
        ${Mã nhập hàng}         Get Text    //tbody[contains(@class, "ant-table-tbody")]/tr[${count}]/td[1]
        ${Tên nhà cung cấp}     Get Text    //tbody[contains(@class, "ant-table-tbody")]/tr[${count}]/td[2]
        ${Ngày nhập}            Get Text    //tbody[contains(@class, "ant-table-tbody")]/tr[${count}]/td[3]
        ${Tổng tiền (VND)}      Get Text    //tbody[contains(@class, "ant-table-tbody")]/tr[${count}]/td[4]
        ${Trạng thái}           Get Text    //tbody[contains(@class, "ant-table-tbody")]/tr[${count}]/td[5]
        Log To Console    ${stt}. Mã nhập hàng: ${Mã nhập hàng} || Tên nhà cung cấp: ${Tên nhà cung cấp} || Ngày nhập: ${Ngày nhập} || Tổng tiền (VND): ${Tổng tiền (VND)} || Trạng thái: ${Trạng thái}
        Log To Console    -------------------------------------------------------------------------------------------------------------------------------------------------------------
        ${count}=    Evaluate    ${count} + 1
        ${stt}=    Evaluate    ${stt} + 1
    END
    ${total}=    Evaluate    ${count} - 1
    Log To Console    Tổng số lượng đơn nhập hàng Non_Balance là: ${total} đơn

Click select in "${name}" field with "${text}"
  ${elements}=               Get Elements             //*[contains(@class, "ant-select-selection-search-input")]
  IF  '${name}' == 'Chọn trạng thái'
      Click         ${elements}[0]
  ELSE IF  '${name}' == 'Chọn nhà cung cấp'
      Click         ${elements}[1]
  END
  ${element}=             Get Element      xpath=//*[contains(@class, "ant-select-item-option") and @title="${text}"]
  Click                   ${element}
