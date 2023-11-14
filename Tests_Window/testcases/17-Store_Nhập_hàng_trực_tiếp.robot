*** Settings ***
Resource            ../keywords/common.robot

Test Setup          Preconditions
Test Teardown       Tear Down

*** Test Cases ***
##************************* ĐIỀU HƯỚNG ĐẾN TRANG "NHẬP HÀNG TRỰC TIẾP"*************************************************
Create_Import_goods_directly_01: Xác minh có thể điều huớng đến trang "Nhập hàng trực tiếp" thành công
    [Tags]    @Test_Create_Import_goods_directly     @Test_by_Hồ_Văn_Nhật
    When Click "Quản lý kho" menu
    And Click on "Nhập Hàng Trực Tiếp" sub menu
    And Click "Thêm mới" button
    Then User look title "Nhập Hàng Trực Tiếp"
    And User look contains title is "Nhập hàng trực tiếp"

##**************************************VALIDATION TEXT****************************************************************
Create_Import_goods_directly_02: Xác minh Validation Text khi bỏ trống trường "Lý do nhập hàng"
    [Tags]    @Test_Create_Import_goods_directly     @Test_by_Hồ_Văn_Nhật
    When Go to create "Nhập Hàng Trực Tiếp" page
    And Click "Lưu" button
    Then Required message in "Lý do nhập hàng" field displayed under "Lý do nhập hàng là bắt buộc"

Create_Import_goods_directly_03: Xác minh Validation Text khi bỏ trống trường "Thời gian nhập hàng"
    [Tags]    @Test_Create_Import_goods_directly     @Test_by_Hồ_Văn_Nhật
    When Go to create "Nhập Hàng Trực Tiếp" page
    And Delete text in "Thời gian nhập hàng"
    Then Required message in "Thời gian nhập hàng" field displayed under "Thời gian nhập hàng là bắt buộc"

Create_Import_goods_directly_04: Xác minh Validation Text khi nhập "Số tiền thanh toán" lơn hơn tổng số tiền cần thanh toán
    [Tags]    @Test_Create_Import_goods_directly     @Test_by_Hồ_Văn_Nhật
    When Go to create "Nhập Hàng Trực Tiếp" page
    And Enter in "Số tiền thanh toán" field with "_RANDOM_"
    Then Required message in "Số tiền thanh toán" field displayed under "Số tiền nhập không được lớn hơn tổng số tiền cần thanh toán."

Create_Import_goods_directly_05: Xác minh Validation Text khi bỏ trống "Đơn giá (VND)"
    [Tags]    @Test_Create_Import_goods_directly     @Test_by_Hồ_Văn_Nhật
    When Go to create "Nhập Hàng Trực Tiếp" page
    And Add product
    And Enter "Đơn giá" in "Đơn giá" field with ""
    Then Required message in "Đơn giá" field displayed under "Đơn giá là bắt buộc"

Create_Import_goods_directly_06: Xác minh Validation Text khi bỏ trống "Số lượng"
    [Tags]    @Test_Create_Import_goods_directly     @Test_by_Hồ_Văn_Nhật
    When Go to create "Nhập Hàng Trực Tiếp" page
    And Add product
    And Enter "Số lượng" in "Số lượng" field with ""
    And Click "Lưu" button
    Then Required message in "Số lượng" field displayed under "Số lượng là bắt buộc"

Create_Import_goods_directly_07: Xác minh Validation Text khi nhập "Số lượng" bằng 0
    [Tags]    @Test_Create_Import_goods_directly     @Test_by_Hồ_Văn_Nhật
    When Go to create "Nhập Hàng Trực Tiếp" page
    And Add product
    And Enter "cost" in "Số lượng" field with "0"
    Then Required message in "Số lượng" field displayed under "Vui lòng nhập giá trị lớn hơn 0"

Create_Import_goods_directly_08: Xác minh Validation Text khi nhập "Số lượng" lơn hơn 999999
    [Tags]    @Test_Create_Import_goods_directly     @Test_by_Hồ_Văn_Nhật
    When Go to create "Nhập Hàng Trực Tiếp" page
    And Add product
    And Enter "number > 999999" in "Số lượng" field with "_RANDOM_"
    Then Required message in "Số lượng" field displayed under "Số lượng không được vượt quá 999999"

#**************************************ERROR MESSAGE******************************************************************
Create_Import_goods_directly_09: Xác minh hiển thị thông báo lỗi khi không thêm sản phẩm
    [Tags]    @Test_Create_Import_goods_directly     @Test_by_Hồ_Văn_Nhật
    When Go to create "Nhập Hàng Trực Tiếp" page
    And Enter "test name" in "Lý do nhập hàng" field with "_RANDOM_"
    And Click "Lưu" button
    Then User look message "Vui lòng chọn ít nhất một sản phẩm" popup

##**********************************IMPORT GOODS DIRECTLY SUCCESSFULL**************************************************
Create_Import_goods_directly_10: Xác minh nhập hàng trực tiếp thành công
    [Tags]    @Test_Create_Import_goods_directly     @Test_by_Hồ_Văn_Nhật
    When Go to create "Nhập Hàng Trực Tiếp" page
    And Enter "test name" in "Lý do nhập hàng" field with "_RANDOM_"
    And Add product
    And Enter "%" in "Số lượng" field with "_RANDOM_"
    And Click "Lưu" button
    Then User look message "Thêm nhập hàng thành công." popup
    And Select goods need to delete
    And Click "Xóa" button
    And Click Verify To Action
    Then User look message "Xóa nhập hàng thành công." popup

Create_Import_goods_directly_11: Xác minh nhập hàng trực tiếp thành công khi không áp dụng thuế
    [Tags]    @Test_Create_Import_goods_directly     @Test_by_Hồ_Văn_Nhật
    When Go to create "Nhập Hàng Trực Tiếp" page
    And Enter "test name" in "Lý do nhập hàng" field with "_RANDOM_"
    And Enter "Thuế" in "Thuế" field with "Không áp dụng thuế"
    And Add product
    And Enter "%" in "Số lượng" field with "_RANDOM_"
    And Click "Lưu" button
    Then User look message "Thêm nhập hàng thành công." popup
    And Select goods need to delete
    And Click "Xóa" button
    And Click Verify To Action
    Then User look message "Xóa nhập hàng thành công." popup

##***********************************VIEW LIST OF GOODS DIRECTLY*******************************************************
Create_Import_goods_directly_12: Xác minh hiển thị danh sách nhập hàng trực tiếp
    [Tags]    @Test_Create_Import_goods_directly     @Test_by_Hồ_Văn_Nhật
    When Go to list "Nhập Hàng Trực Tiếp" page
    Then View list of "Import goods directly"

Create_Import_goods_directly_13: Xác minh hiển thị danh sách nhập hàng trực tiếp khi tìm kiếm với mã nhập hàng hợp lệ
    [Tags]    @Test_Create_Import_goods_directly     @Test_by_Hồ_Văn_Nhật
    When Go to list "Nhập Hàng Trực Tiếp" page
    And Search "Mã nhập hàng" in "Mã nhập hàng" with "RNSTR12372023082202"
    Then View list of "Import goods directly"

Create_Import_goods_directly_14: Xác minh hiển thị danh sách nhập hàng trực tiếp khi tìm kiếm với mã nhập hàng không hợp lệ
    [Tags]    @Test_Create_Import_goods_directly     @Test_by_Hồ_Văn_Nhật
    When Go to list "Nhập Hàng Trực Tiếp" page
    And Search "Mã nhập hàng" in "Mã nhập hàng" with "_RANDOM_"
    Then No Import goods directly are shown

Create_Import_goods_directly_15: Xác minh hiển thị danh sách nhập hàng với trang thái "Đang xử lý"
    [Tags]    @Test_Create_Import_goods_directly     @Test_by_Hồ_Văn_Nhật
    When Go to list "Nhập Hàng Trực Tiếp" page
    And Click select in "Chọn trạng thái" field with "Đang xử lý"
    Then View list of "Import goods directly"

Create_Import_goods_directly_16: Xác minh hiển thị danh sách nhập hàng với trang thái "Đã hoàn tất"
    [Tags]    @Test_Create_Import_goods_directly     @Test_by_Hồ_Văn_Nhật
    When Go to list "Nhập Hàng Trực Tiếp" page
    And Click select in "Chọn trạng thái" field with "Đã hoàn tất"
    Then View list of "Import goods directly"

Create_Import_goods_directly_17: Xác minh hiển thị danh sách nhập hàng với nhà cung cấp "Siêu thị Big C Huế"
    [Tags]    @Test_Create_Import_goods_directly     @Test_by_Hồ_Văn_Nhật
    When Go to list "Nhập Hàng Trực Tiếp" page
    And Click select in "Chọn nhà cung cấp" field with "Siêu thị Big C Huế"
    Then View list of "Import goods directly"

Create_Import_goods_directly_18: Xác minh hiển thị danh sách nhập hàng với nhà cung cấp "Nhà cung cấp uat test 3"
    [Tags]    @Test_Create_Import_goods_directly     @Test_by_Hồ_Văn_Nhật
    When Go to list "Nhập Hàng Trực Tiếp" page
    And Click select in "Chọn nhà cung cấp" field with "Nhà cung cấp uat test 3"
    Then View list of "Import goods directly"

Create_Import_goods_directly_19: Xác minh hiển thị danh sách nhập hàng với nhà cung cấp "Nhà cung cấp Ben"
    [Tags]    @Test_Create_Import_goods_directly     @Test_by_Hồ_Văn_Nhật
    When Go to list "Nhập Hàng Trực Tiếp" page
    And Click select in "Chọn nhà cung cấp" field with "Nhà cung cấp Ben"
    Then View list of "Import goods directly"

Create_Import_goods_directly_20: Xác minh hiển thị danh sách nhập hàng theo thời gian "Ngày nhận"
    [Tags]    @Test_Create_Import_goods_directly     @Test_by_Hồ_Văn_Nhật
    When Go to list "Nhập Hàng Trực Tiếp" page
    And Enter date in "Từ ngày" field with "04/09/2023"
    And Enter date in "Đến ngày" field with "05/09/2023"
    Then View list of "Import goods directly"

##********************************ĐIỀU HƯỚNG ĐẾN TRANG CHỈNH SỬA NHẬP HÀNG TRỰC TIẾP***********************************
Edit_Import_goods_directly_01: Xác minh điều hướng đến trang chỉnh sửa "Nhập hàng trực tiếp" thành công
    [Tags]    @Test_Edit_Import_goods_directly     @Test_by_Hồ_Văn_Nhật
    When Go to list "Nhập Hàng Trực Tiếp" page
    And Select goods need to edit
    And Click "Chỉnh sửa" button
    Then User look title "Nhập Hàng Trực Tiếp"
    And User look contains title is "Nhập hàng trực tiếp"

##*****************************-VALIDATION TEXT-***********************************************************************
Edit_Import_goods_directly_02: Xác minh Validation text khi bỏ trống trường "Thời gian nhập hàng"
    [Tags]    @Test_Edit_Import_goods_directly     @Test_by_Hồ_Văn_Nhật
    When Go to edit "Nhập Hàng Trực Tiếp" page
    And Delete text in "Thời gian nhập hàng"
    Then Required message in "Thời gian nhập hàng" field displayed under "Thời gian nhập hàng là bắt buộc"

Edit_Import_goods_directly_03: Xác minh Validation text khi bỏ trống trường "Lý do nhập hàng"
    [Tags]    @Test_Edit_Import_goods_directly     @Test_by_Hồ_Văn_Nhật
    When Go to edit "Nhập Hàng Trực Tiếp" page
    And Enter "Lý do" in "Lý do nhập hàng" field with ""
    Then Required message in "Lý do nhập hàng" field displayed under "Lý do nhập hàng là bắt buộc"

Edit_Import_goods_directly_04: Xác minh Validation text khi bỏ trống trường "Đơn giá (VND)"
    [Tags]    @Test_Edit_Import_goods_directly     @Test_by_Hồ_Văn_Nhật
    When Go to edit "Nhập Hàng Trực Tiếp" page
    And Enter "Đơn giá" in "Đơn giá" field with ""
    Then Required message in "Đơn giá" field displayed under "Đơn giá là bắt buộc"

Edit_Import_goods_directly_05: Xác minh Validation text khi bỏ trống trường "Số lượng"
    [Tags]    @Test_Edit_Import_goods_directly     @Test_by_Hồ_Văn_Nhật
    When Go to edit "Nhập Hàng Trực Tiếp" page
    And Enter "Số lượng" in "Số lượng" field with ""
    Then Required message in "Số lượng" field displayed under "Số lượng là bắt buộc"

Edit_Import_goods_directly_06: Xác minh Validation text khi nhập trường "Số lượng" bằng 0
    [Tags]    @Test_Edit_Import_goods_directly     @Test_by_Hồ_Văn_Nhật
    When Go to edit "Nhập Hàng Trực Tiếp" page
    And Enter "Số lượng" in "Số lượng" field with "0"
    Then Required message in "Số lượng" field displayed under "Vui lòng nhập giá trị lớn hơn 0"

Edit_Import_goods_directly_07: Xác minh Validation text khi nhập trường "Số lượng" lớn hơn 999999
    [Tags]    @Test_Edit_Import_goods_directly     @Test_by_Hồ_Văn_Nhật
    When Go to edit "Nhập Hàng Trực Tiếp" page
    And Enter "number > 999999" in "Số lượng" field with "_RANDOM_"
    Then Required message in "Số lượng" field displayed under "Số lượng không được vượt quá 999999"

Edit_Import_goods_directly_08: Xác minh Validation text khi nhập trường "Số tiền thanh toán" lớn hơn tổng số tiền thanh toán
    [Tags]    @Test_Edit_Import_goods_directly     @Test_by_Hồ_Văn_Nhật
    When Go to edit "Nhập Hàng Trực Tiếp" page
    And Enter in "Số tiền thanh toán" field with "invalid"
    Then Required message in "Số tiền thanh toán" field displayed under "Số tiền nhập không được lớn hơn tổng số tiền cần thanh toán."

##***************************************-EDIT "NHẬP HÀNG TRỰC TIẾP" SUCCESSFULL-**************************************
Edit_Import_goods_directly_09: Xác minh chỉnh sửa "Nhập hàng trực tiếp" thành công khi thay đổi "Ngày nhập hàng"
    [Tags]    @Test_Edit_Import_goods_directly     @Test_by_Hồ_Văn_Nhật
    When Go to edit "Nhập Hàng Trực Tiếp" page
    And Enter date in "Thời gian nhập hàng" field with "_RANDOM_"
    And Click "Lưu" button
    Then User look message "Chỉnh sửa nhập hàng thành công." popup

Edit_Import_goods_directly_10: Xác minh chỉnh sửa "Nhập hàng trực tiếp" thành công khi thay đổi "Lý do nhập hàng"
    [Tags]    @Test_Edit_Import_goods_directly     @Test_by_Hồ_Văn_Nhật
    When Go to edit "Nhập Hàng Trực Tiếp" page
    And Enter "test name" in "Lý do nhập hàng" field with "_RANDOM_"
    And Click "Lưu" button
    Then User look message "Chỉnh sửa nhập hàng thành công." popup

Edit_Import_goods_directly_11: Xác minh chỉnh sửa "Nhập hàng trực tiếp" thành công khi thay đổi "Đơn giá (VND)"
    [Tags]    @Test_Edit_Import_goods_directly     @Test_by_Hồ_Văn_Nhật
    When Go to edit "Nhập Hàng Trực Tiếp" page
    And Enter "cost" in "Đơn giá" field with "_RANDOM_"
    And Click "Lưu" button
    Then User look message "Chỉnh sửa nhập hàng thành công." popup

Edit_Import_goods_directly_12: Xác minh chỉnh sửa "Nhập hàng trực tiếp" thành công khi thay đổi "Số lượng"
    [Tags]    @Test_Edit_Import_goods_directly     @Test_by_Hồ_Văn_Nhật
    When Go to edit "Nhập Hàng Trực Tiếp" page
    And Enter "%" in "Số lượng" field with "_RANDOM_"
    And Click "Lưu" button
    Then User look message "Chỉnh sửa nhập hàng thành công." popup

Edit_Import_goods_directly_13: Xác minh chỉnh sửa "Nhập hàng trực tiếp" thành công khi thanh toán thành công
    [Tags]    @Test_Edit_Import_goods_directly     @Test_by_Hồ_Văn_Nhật
    When Go to pay "Nhập Hàng Trực Tiếp" page
    And Enter in "Số tiền thanh toán" field with "valid"
    And Click "Xuất phiếu nhập hàng" button
    Then User look message "Xuất hoá đơn nhập hàng trực tiếp thành công." popup

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

Click Verify To Action
    ${elements}         Get Elements        //button[contains(text(),'Xóa')]
    Click               ${elements}[1]

Select goods need to ${text}
    IF  '${text}' == 'edit'
        ${elements}      Get Elements        //div[contains(text(),'Đang xử lý')]
        Click         ${elements}[0]       left      2
    ELSE IF   '${text}' != 'edit'
        Click         //*[contains(@class, "ant-table-row")][1]       left      2
    END

Click on "Thêm sản phẩm" button
    Click     //span[contains(text(),'Thêm sản phẩm')]

Click on "Nhập Hàng Trực Tiếp" sub menu
    Click       //a[contains(text(),'Nhập Hàng Trực Tiếp')]

Enter in "Số tiền thanh toán" field with "${text}"
    ${text}=              Get Random Text                   number                       ${text}
    ${elements}           Get Elements            //span[contains(text(),'Tổng tiền hàng:')]/..//span
    ${Tổng tiền hàng}     Get Text                ${elements}[1]
    ${Tổng tiền hàng}=                   Evaluate              "${Tổng tiền hàng}".replace(" VND", "")
    ${Tổng tiền hàng}=                   Evaluate              "${Tổng tiền hàng}".replace(".", "")
    ${Tổng tiền hàng_invalid}=           Evaluate              ${Tổng tiền hàng} * 2
    ${element}           Get Element     //span[contains(text(),'Số tiền thanh toán:')]/..//input[contains(@class, "ant-input")]
    Clear Text            ${element}
    IF  '${text}' == 'invalid'
        Fill Text             ${element}           ${Tổng tiền hàng_invalid}         True
    ELSE IF  '${text}' == 'valid'
        Fill Text             ${element}           ${Tổng tiền hàng}         True
    ELSE IF     '${text}' != 'invalid' and '${text}' != 'valid'
        Fill Text             ${element}           ${text}         True
    END

Enter "${type}" in "${name}" field with "${text}"
    ${text}=              Get Random Text                   ${type}                       ${text}
    IF  '${name}' == 'Đơn giá'
        ${elements}            Get Elements             //input[contains(@class, "ant-input") and @placeholder=" Nhập giá trị"]
        ${element}            Set Variable          ${elements}[0]
    ELSE IF  '${name}' == 'Số lượng'
        ${elements}            Get Elements             //input[contains(@class, "ant-input") and @placeholder=" Nhập giá trị"]
        ${element}            Set Variable          ${elements}[1]
    ELSE IF  '${name}' == 'Thuế'
        ${element}            Get Element             //span[contains(@class, "ant-select-selection-search")]//input[contains(@class, "ant-select-selection-search-input")]
    ELSE IF  '${name}' != 'Đơn giá'
        ${element}=               Get Element Form Item By Label      ${name}        //input[contains(@class, "ant-input")]
    END
    Wait Until Element Is Visible        ${element}
    Clear Text                           ${element}
    Type Text       ${element}        ${text}
    IF  '${name}' == 'Thuế'
        Press Keys            ${element}          Enter
    END

Go to ${name} "Nhập Hàng Trực Tiếp" page
    When Click "Quản lý kho" menu
    And Click on "Nhập Hàng Trực Tiếp" sub menu
    And Delete text in "Từ ngày"
    And Delete text in "Đến ngày"
    IF  '${name}' == 'create'
      And Click "Thêm mới" button
    ELSE IF  '${name}' == 'edit'
      And Select goods need to edit
      And Click "Chỉnh sửa" button
    ELSE IF  '${name}' == 'pay'
      And Select goods need to edit
    END

Add product
    When Click on "Thêm sản phẩm" button
    And Search "Mã vạch" in "Theo mã vạch, tên sản phẩm" with "7355928765313"
    And Select product need to import goods directly
    And Click "Thêm" button
    And Click "Đóng" button

Select product need to import goods directly
    ${element}        Set Variable        //*[contains(@class, 'top-[10px]')]
    Wait Until Element Is Visible         ${element}
    Click                                 ${element}

Required message in "${name}" field displayed under "${text}"
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

Delete text in "${name}"
    ${element}=               Get Element Form Item By Label     ${name}      //span[contains(@class, "ant-picker-clear")]
    Click           ${element}

View list of "Import goods directly"
    Wait Until Element Spin
    ${elements}=        Get Elements        xpath=//*[contains(@class, "ant-table-row")]
    Run Keyword If    ${elements}     Display     ${elements}
    ...    ELSE    Log To Console     Không tồn tại hàng nhập trực tiếp nào!

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
        ${Tổng tiền}            Get Text    //tbody[contains(@class, "ant-table-tbody")]/tr[${count}]/td[3]
        ${Ngày nhận}            Get Text    //tbody[contains(@class, "ant-table-tbody")]/tr[${count}]/td[4]
        ${Trạng thái}           Get Text    //tbody[contains(@class, "ant-table-tbody")]/tr[${count}]/td[5]
        ${Thanh toán}           Get Text    //tbody[contains(@class, "ant-table-tbody")]/tr[${count}]/td[6]
        Log To Console    ${stt}. Mã nhập hàng: ${Mã nhập hàng} || Tên nhà cung cấp: ${Tên nhà cung cấp} || Tổng tiền (VND): ${Tổng tiền} || Ngày nhận: ${Ngày nhận} || Trạng thái: ${Trạng thái} || Thanh toán: ${Thanh toán}
        Log To Console    -------------------------------------------------------------------------------------------------------------------------------------------------------------
        ${count}=    Evaluate    ${count} + 1
        ${stt}=    Evaluate    ${stt} + 1
    END

Click select in "${name}" field with "${text}"
  ${elements}=               Get Elements             //*[contains(@class, "ant-select-selection-search-input")]
  IF  '${name}' == 'Chọn trạng thái'
      Click         ${elements}[0]
  ELSE IF  '${name}' == 'Chọn nhà cung cấp'
      Click         ${elements}[1]
  END
  ${element}=             Get Element      xpath=//*[contains(@class, "ant-select-item-option") and @title="${text}"]
  Click                   ${element}
