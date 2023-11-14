*** Settings ***
Resource            ../keywords/common.robot

Test Setup          Preconditions
Test Teardown       Tear Down

*** Variables ***
${Tên sản phẩm Balance}         HEO GẠO PHÁO 2
${Tên sản phẩm Non_Balance}     BÒ TÂY NINH
*** Test Cases ***
####******************************************CREATE ISSUEING GOODS TRANSFER********************************************
Create_Issueing_Goods_Transfer_01: Xác minh rằng có thể điều hướng đến trang tạo mới đơn chuyển hàng
    [Tags]    @Create_Issueing_Goods_Transfer     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh rằng có thể điều hướng đến trang tạo mới đơn chuyển hàng
    When Click "Quản lý kho" menu
    And Click "Chuyển hàng" sub menu
    And Click "Hàng chuyển" tab button
    And Click "Thêm mới" button
    Then User look title "Chuyển Hàng"
    And User look contains title is "Chuyển hàng"

####--------------------------------------------VALIDATION TEXT----------------------------------------------------------
Create_Issueing_Goods_Transfer_02: Xác minh hiển thị validation text khi bỏ trống trường "Thời gian chuyển hàng"
    [Tags]    @Create_Issueing_Goods_Transfer     @Test_by_Hồ_Văn_Nhật    @Test_Case_Failed
    [Documentation]     Xác minh hiển thị validation text khi bỏ trống trường "Thời gian chuyển hàng"
    When Go to create Issueing Goods Transfer page
    And Delete date text in "Thời gian chuyển hàng" field
    Then Required message in "Thời gian chuyển hàng" field displayed under with "Thời gian chuyển hàng là bắt buộc"

Create_Issueing_Goods_Transfer_03: Xác minh hiển thị validation text khi bỏ trống trường "Lý do"
    [Tags]    @Create_Issueing_Goods_Transfer     @Test_by_Hồ_Văn_Nhật    @Test_Case_Failed
    [Documentation]     Xác minh hiển thị validation text khi bỏ trống trường "Lý do"
    When Go to create Issueing Goods Transfer page
    And Enter "test name" in "Lý do" field with "_RANDOM_"
    And Enter "test name" in "Lý do" field with "${EMPTY}"
    Then Required message in "Lý do" field displayed under with "Lý do chuyển hàng là bắt buộc."

Create_Issueing_Goods_Transfer_04: Xác minh hiển thị validation text khi bỏ trống trường "Số lượng chuyển"
    [Tags]    @Create_Issueing_Goods_Transfer     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh hiển thị validation text khi bỏ trống trường "Số lượng chuyển"
    When Go to create Issueing Goods Transfer page
    And Click select in "Cửa hàng nhận" field with "Văn Nhật Store - Chi nhánh Huế"
    And Enter date in "Thời gian chuyển hàng" field with "_RANDOM_"
    And Enter "test name" in "Lý do" field with "_RANDOM_"
    And Click select in "Đối tác" field with "Balance"
    And Select "Chọn Balance Supplier" in supplier "Siêu thị Big C Huế" with "${Tên sản phẩm Balance}"
    And Click "Lưu" button
    Then Required message in "Số lượng chuyển" field displayed under with "Số lượng là bắt buộc"

Create_Issueing_Goods_Transfer_05: Xác minh hiển thị validation text khi nhập "Số lượng chuyển" bằng 0
    [Tags]    @Create_Issueing_Goods_Transfer     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh hiển thị validation text khi nhập "Số lượng chuyển" bằng 0
    When Go to create Issueing Goods Transfer page
    And Click select in "Cửa hàng nhận" field with "Văn Nhật Store - Chi nhánh Huế"
    And Enter date in "Thời gian chuyển hàng" field with "_RANDOM_"
    And Enter "test name" in "Lý do" field with "_RANDOM_"
    And Click select in "Đối tác" field with "Balance"
    And Select "Chọn Balance Supplier" in supplier "Siêu thị Big C Huế" with "${Tên sản phẩm Balance}"
    And Enter "number" in "Số lượng chuyển" field with "0"
    Then Required message in "Số lượng chuyển" field displayed under with "Vui lòng nhập số lượng lớn hơn 0"

####--------------------------------------ERROR MESSAGE-----------------------------------------------------------------
Create_Issueing_Goods_Transfer_06: Xác minh hiển thị thông báo lỗi khi nhập "Số lượng chuyển" > 999999
    [Tags]    @Create_Issueing_Goods_Transfer     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh hiển thị thông báo lỗi khi nhập "Số lượng chuyển" > 999999
    When Go to create Issueing Goods Transfer page
    And Click select in "Cửa hàng nhận" field with "Văn Nhật Store - Chi nhánh Huế"
    And Enter date in "Thời gian chuyển hàng" field with "_RANDOM_"
    And Enter "test name" in "Lý do" field with "_RANDOM_"
    And Click select in "Đối tác" field with "Balance"
    And Select "Chọn Balance Supplier" in supplier "Siêu thị Big C Huế" with "${Tên sản phẩm Balance}"
    And Enter "number > 999999" in "Số lượng chuyển" field with "_RANDOM_"
    And Click "Lưu" button
    And Click Verify To Action
    Then User look message "Vui lòng nhập tối đa 999999" popup

####--------------------------------------CREATE ISSUEING GOODS TRANSFER SUCCESSFULL------------------------------------
Create_Issueing_Goods_Transfer_07: Xác minh hiển thị thông báo tạo đơn chuyển hàng thành công với đối tác "Balance"
    [Tags]    @Create_Issueing_Goods_Transfer     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh hiển thị thông báo tạo đơn chuyển hàng thành công với đối tác "Balance"
    When Go to create Issueing Goods Transfer page
    And Click select in "Cửa hàng nhận" field with "Văn Nhật Store - Chi nhánh Huế"
    And Enter date in "Thời gian chuyển hàng" field with "_RANDOM_"
    And Enter "Lý do" in "Lý do" field with "Cửa hàng cần gấp, chuyển nhanh"
    And Click select in "Đối tác" field with "Balance"
    And Select "Chọn Balance Supplier" in supplier "Siêu thị Big C Huế" with "${Tên sản phẩm Balance}"
    And Enter "%" in "Số lượng chuyển" field with "1"
    And Click "Lưu" button
    Then User look message "Tạo chuyển hàng thành công." popup
    When Select Issueing Goods Transfer need to delete
    And Click "Xoá" button
    And Click Verify To Action
    Then User look message "Xoá chuyển hàng thành công." popup

Create_Issueing_Goods_Transfer_08: Xác minh hiển thị thông báo tạo đơn chuyển hàng thành công với đối tác "Non_Balance"
    [Tags]    @Create_Issueing_Goods_Transfer     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh hiển thị thông báo tạo đơn chuyển hàng thành công với đối tác "Non_Balance"
    When Go to create Issueing Goods Transfer page
    And Click select in "Cửa hàng nhận" field with "Văn Nhật Store - Chi nhánh Huế"
    And Enter date in "Thời gian chuyển hàng" field with "_RANDOM_"
    And Enter "Lý do" in "Lý do" field with "Cửa hàng cần gấp, chuyển nhanh"
    And Click select in "Đối tác" field with "Non_Balance"
    And Select "Chọn Non_Balance Supplier" in supplier "Nhà cung cấp đồ chơi Rubik" with "${Tên sản phẩm Non_Balance}"
    And Enter "%" in "Số lượng chuyển" field with "1"
    And Click "Lưu" button
    Then User look message "Tạo chuyển hàng thành công." popup
    When Select Issueing Goods Transfer need to delete
    And Click "Xoá" button
    And Click Verify To Action
    Then User look message "Xoá chuyển hàng thành công." popup

####--------------------------------------VIEW LIST OF ISSUEING GOODS TRANSFER------------------------------------------
Create_Issueing_Goods_Transfer_09: Xác minh rằng có thể hiển thị danh sách đơn "Chuyển hàng"
    [Tags]    @Create_Issueing_Goods_Transfer     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh rằng có thể hiển thị danh sách đơn "Chuyển hàng"
    When Go to list Issueing Goods Transfer page
    Then View list of "Issueing Goods Transfer"

Create_Issueing_Goods_Transfer_10: Xác minh rằng có thể hiển thị danh sách đơn Chuyển hàng khi tìm kiếm với "Mã chuyển hàng" hợp lệ
    [Tags]    @Create_Issueing_Goods_Transfer     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh rằng có thể hiển thị danh sách đơn Chuyển hàng khi tìm kiếm với "Mã chuyển hàng" hợp lệ
    When Go to list Issueing Goods Transfer page
    And Search "Mã chuyển hàng" in "Mã chuyển hàng" with "GTNSTR123720231001003"
    Then View list of "Issueing Goods Transfer"

Create_Issueing_Goods_Transfer_11: Xác minh rằng không hiển thị danh sách đơn Chuyển hàng khi tìm kiếm với "Mã chuyển hàng" không hợp lệ
    [Tags]    @Create_Issueing_Goods_Transfer     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh rằng không hiển thị danh sách đơn Chuyển hàng khi tìm kiếm với "Mã chuyển hàng" không hợp lệ
    When Go to list Issueing Goods Transfer page
    And Search "Mã chuyển hàng" in "Mã chuyển hàng" with "_RANDOM_"
    Then No Issueing_Goods_Transfer are shown

Create_Issueing_Goods_Transfer_12: Xác minh rằng có thể hiển thị danh sách đơn Chuyển hàng với trang thái "Đang xử lý"
    [Tags]    @Create_Issueing_Goods_Transfer     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh rằng có thể hiển thị danh sách đơn Chuyển hàng với trang thái "Đang xử lý"
    When Go to list Issueing Goods Transfer page
    And Click select in "Chọn trạng thái" field with "Đang xử lý"
    Then View list of "Issueing Goods Transfer"

Create_Issueing_Goods_Transfer_13: Xác minh rằng có thể hiển thị danh sách đơn Chuyển hàng với trang thái "Đã hoàn tất"
    [Tags]    @Create_Issueing_Goods_Transfer     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh rằng có thể hiển thị danh sách đơn Chuyển hàng với trang thái "Đã hoàn tất"
    When Go to list Issueing Goods Transfer page
    And Click select in "Chọn trạng thái" field with "Đã hoàn tất"
    Then View list of "Issueing Goods Transfer"

Create_Issueing_Goods_Transfer_14: Xác minh rằng có thể hiển thị danh sách đơn Chuyển hàng theo cửa hàng nhận là "Văn Nhật Store - Chi nhánh Huế"
    [Tags]    @Create_Issueing_Goods_Transfer     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh rằng có thể hiển thị danh sách đơn Chuyển hàng theo cửa hàng nhận là "Văn Nhật Store - Chi nhánh Huế"
    When Go to list Issueing Goods Transfer page
    And Click select in "Chọn cửa hàng nhận" field with "Văn Nhật Store - Chi nhánh Huế"
    Then View list of "Issueing Goods Transfer"

Create_Issueing_Goods_Transfer_15: Xác minh rằng có thể hiển thị danh sách đơn Chuyển hàng theo cửa hàng nhận là "Văn Nhật Store - Chi nhánh Hồ Chí Minh"
    [Tags]    @Create_Issueing_Goods_Transfer     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh rằng có thể hiển thị danh sách đơn Chuyển hàng theo cửa hàng nhận là "Văn Nhật Store - Chi nhánh Hồ Chí Minh"
    When Go to list Issueing Goods Transfer page
    And Click select in "Chọn cửa hàng nhận" field with "Văn Nhật Store - Chi nhánh Hồ Chí Minh"
    Then View list of "Issueing Goods Transfer"

Create_Issueing_Goods_Transfer_16: Xác minh rằng có thể hiển thị danh sách đơn Chuyển hàng theo thời gian nhập hàng
    [Tags]    @Create_Issueing_Goods_Transfer     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh rằng có thể hiển thị danh sách đơn Chuyển hàng theo thời gian nhập hàng
    When Go to list Issueing Goods Transfer page
    And Enter date in "Từ ngày" field with "04/09/2023"
    And Enter date in "Đến ngày" field with "01/10/2023"
    Then View list of "Issueing Goods Transfer"

Create_Issueing_Goods_Transfer_17: Xác minh rằng có thể xem danh sách đơn Chuyển hàng trang kế tiếp, trước trước, trang cuối cùng, trang đầu tiên
    [Tags]    @Create_Issueing_Goods_Transfer     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh rằng có thể xem danh sách đơn Chuyển hàng trang kế tiếp, trước trước, trang cuối cùng, trang đầu tiên
    When Go to list Issueing Goods Transfer page
    And Click ">" to "next" page
    Then View list of "Issueing Goods Transfer"
    And Click "<" to "prev" page
    Then View list of "Issueing Goods Transfer"
    And Click ">>" to "next_all" page
    Then View list of "Issueing Goods Transfer"
    And Click "<<" to "prev_all" page
    Then View list of "Issueing Goods Transfer"

####******************************************EDIT ISSUEING GOODS TRANSFER********************************************
Edit_Issueing_Goods_Transfer_01: Xác minh rằng có thể điều hướng đến trang tạo mới chỉnh sửa đơn chuyển hàng
    [Tags]    @Edit_Issueing_Goods_Transfer     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh rằng có thể điều hướng đến trang tạo mới chỉnh sửa đơn chuyển hàng
    When Go to list Issueing Goods Transfer page
    And Select Issueing Goods Transfer need to edit
    And Click "Chỉnh sửa" button
    Then User look title "Chuyển Hàng"
    And User look contains title is "Chuyển hàng"

####--------------------------------------------VALIDATION TEXT----------------------------------------------------------
Edit_Issueing_Goods_Transfer_02: Xác minh rằng hiển thị validation text khi bỏ trống trường "Thời gian chuyển hàng"
    [Tags]    @Edit_Issueing_Goods_Transfer     @Test_by_Hồ_Văn_Nhật    @Test_Case_Failed
    [Documentation]     Xác minh rằng hiển thị validation text khi bỏ trống trường "Thời gian chuyển hàng"
    When Go to edit Issueing Goods Transfer page
    And Delete date text in "Thời gian chuyển hàng" field
    Then Required message in "Thời gian chuyển hàng" field displayed under with "Thời gian chuyển hàng là bắt buộc"

Edit_Issueing_Goods_Transfer_03: Xác minh rằng hiển thị validation text khi bỏ trống trường "Lý do"
    [Tags]    @Edit_Issueing_Goods_Transfer     @Test_by_Hồ_Văn_Nhật    @Test_Case_Failed
    [Documentation]     Xác minh rằng hiển thị validation text khi bỏ trống trường "Lý do"
    When Go to edit Issueing Goods Transfer page
    And Enter "Lý do" in "Lý do" field with "${EMPTY}"
    Then Required message in "Lý do" field displayed under with "Lý do chuyển hàng là bắt buộc."

Edit_Issueing_Goods_Transfer_04: Xác minh rằng hiển thị validation text khi bỏ trống trường "Số lượng chuyển"
    [Tags]    @Edit_Issueing_Goods_Transfer     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh rằng hiển thị validation text khi bỏ trống trường "Số lượng chuyển"
    When Go to edit Issueing Goods Transfer page
    And Enter "number" in "Số lượng chuyển" field with "${EMPTY}"
    Then Required message in "Số lượng chuyển" field displayed under with "Số lượng là bắt buộc"

Edit_Issueing_Goods_Transfer_05: Xác minh rằng hiển thị validation text khi nhập "Số lượng chuyển" bằng 0
    [Tags]    @Edit_Issueing_Goods_Transfer     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh rằng hiển thị validation text khi nhập "Số lượng chuyển" bằng 0
    When Go to edit Issueing Goods Transfer page
    And Enter "number" in "Số lượng chuyển" field with "0"
    Then Required message in "Số lượng chuyển" field displayed under with "Vui lòng nhập số lượng lớn hơn 0"

####--------------------------------------ERROR MESSAGE-----------------------------------------------------------------
Edit_Issueing_Goods_Transfer_06: Xác minh rằng hiển thị thông báo lỗi khi nhập "Số lượng chuyển" > 999999
    [Tags]    @Edit_Issueing_Goods_Transfer     @Test_by_Hồ_Văn_Nhật    @Test_Case_Failed
    [Documentation]     Xác minh hiển thị thông báo lỗi khi nhập "Số lượng chuyển" > 999999
    When Go to edit Issueing Goods Transfer page
    And Enter "number > 999999" in "Số lượng chuyển" field with "_RANDOM_"
    And Click "Lưu" button
    And Click Verify To Action
    Then User look message "Vui lòng nhập tối đa 999999" popup

#####--------------------------------------EDIT ISSUEING GOODS TRANSFER SUCCESSFULL------------------------------------
Edit_Issueing_Goods_Transfer_07: Xác minh rằng hiển thị thông báo chỉnh sửa đơn chuyển hàng thành công khi thay đổi "Cửa hàng nhận"
    [Tags]    @Edit_Issueing_Goods_Transfer     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh rằng hiển thị thông báo chỉnh sửa đơn chuyển hàng thành công khi thay đổi "Cửa hàng nhận"
    When Go to edit Issueing Goods Transfer page
    And Choose "Cửa hàng nhận" with "Văn Nhật Store - Chi nhánh Hồ Chí Minh"
    And Click "Lưu" button
    And Click Verify To Action
    Then User look message "Chỉnh sửa chuyển hàng thành công." popup

Edit_Issueing_Goods_Transfer_08: Xác minh rằng hiển thị thông báo chỉnh sửa đơn chuyển hàng thành công khi thay đổi "Thời gian chuyển hàng"
    [Tags]    @Edit_Issueing_Goods_Transfer     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh rằng hiển thị thông báo chỉnh sửa đơn chuyển hàng thành công khi thay đổi "Thời gian chuyển hàng"
    When Go to edit Issueing Goods Transfer page
    And Enter date in "Thời gian chuyển hàng" field with "03/10/2023"
    And Click "Lưu" button
    And Click Verify To Action
    Then User look message "Chỉnh sửa chuyển hàng thành công." popup

Edit_Issueing_Goods_Transfer_09: Xác minh rằng hiển thị thông báo chỉnh sửa đơn chuyển hàng thành công khi thay đổi "Lý do"
    [Tags]    @Edit_Issueing_Goods_Transfer     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh rằng hiển thị thông báo chỉnh sửa đơn chuyển hàng thành công khi thay đổi "Lý do"
    When Go to edit Issueing Goods Transfer page
    And Enter "Lý do" in "Lý do" field with "Khách yêu cầu"
    And Click "Lưu" button
    And Click Verify To Action
    Then User look message "Chỉnh sửa chuyển hàng thành công." popup

Edit_Issueing_Goods_Transfer_10: Xác minh rằng hiển thị thông báo chỉnh sửa đơn chuyển hàng thành công khi thay đổi "Số lượng chuyển"
    [Tags]    @Edit_Issueing_Goods_Transfer     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh rằng hiển thị thông báo chỉnh sửa đơn chuyển hàng thành công khi thay đổi "Số lượng chuyển"
    When Go to edit Issueing Goods Transfer page
    And Enter "number" in "Số lượng chuyển" field with "1"
    And Click "Lưu" button
    Then User look message "Chỉnh sửa chuyển hàng thành công." popup

Edit_Issueing_Goods_Transfer_11: Xác minh rằng hiển thị thông báo chỉnh sửa đơn chuyển hàng thành công khi thay đổi "Trạng thái đơn chuyển hàng"
    [Tags]    @Edit_Issueing_Goods_Transfer     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh rằng hiển thị thông báo chỉnh sửa đơn chuyển hàng thành công khi thay đổi "Số lượng chuyển"
    When Go to list Issueing Goods Transfer page
    And Select Issueing Goods Transfer need to change_status
    And Click "Xuất phiếu chuyển hàng" button
    Then User look message "Tạo phiếu chuyển hàng thành công." popup

*** Keywords ***
Preconditions
  Set Browser Timeout         ${BROWSER_TIMEOUT}
  New Browser                 ${BROWSER}  headless=${HEADLESS}
  New Page                    ${URL_DEFAULT}
  ${STATE}                    Evaluate  json.loads('''{}''')  json
  Login to Store

Go to ${name} Issueing Goods Transfer page
    When Click "Quản lý kho" menu
    And Click "Chuyển hàng" sub menu
    And Click "Hàng chuyển" tab button
    And Delete date text in "Từ ngày" field
    And Delete date text in "Đến ngày" field
    IF  '${name}' == 'create'
      And Click "Thêm mới" button
    ELSE IF  '${name}' == 'edit'
      And Select Issueing Goods Transfer need to edit
      And Click "Chỉnh sửa" button
    END

Click on "${name}" button
    Click     //*[contains(text(),'${name}')]

Enter "${type}" in "${name}" field with "${text}"
    ${text}=              Get Random Text                     ${type}                       ${text}
    IF    '${name}' == 'Số lượng chuyển'
        ${element}          Set Variable            //input[@placeholder='${SPACE}Nhập số lượng']
    ELSE IF    '${name}' != 'Số lượng chuyển'
        ${element}=           Get Element Form Item By Label      ${name}        //input[contains(@class, "ant-input")]
    END
    Wait Until Element Is Visible        ${element}
    Clear Text                           ${element}
    Type Text             ${element}          ${text}
    Press Keys            ${element}            Enter

Enter date in "${name}" field with "${text}"
    ${text}=                  Get Random Text                   dd/mm/yyyy                          ${text}
    ${element}=               Get Element Form Item By Label    ${name}                       //*[contains(@class, "ant-picker-input")]/input
    Click                     ${element}
    Clear Text                ${element}
    Fill Text                 ${element}                        ${text}
    Press Keys                ${element}                        Tab
    Press Keys                ${element}                        Tab

Delete date text in "${name}" field
    ${element}=               Get Element Form Item By Label     ${name}            //span[contains(@class, "ant-picker-clear")]
    Wait Until Element Is Visible       ${element}
    Click                               ${element}
    Sleep                               ${SHOULD_TIMEOUT}

Click select in "${name}" field with "${text}"
    ${elements}=               Get Elements       //*[contains(@class, "ant-select-selection-search-input")]
    IF    '${name}' == 'Chọn trạng thái'
        ${element}=               Set Variable       ${elements}[0]
    ELSE IF    '${name}' == 'Chọn cửa hàng nhận'
        ${element}=               Set Variable       ${elements}[1]
    ELSE IF    '${name}' == 'Chọn Balance Supplier'
        ${elements}=               Get Elements       //span[contains(text(),'Siêu thị Big C Huế')]
        ${element}=                Set Variable       ${elements}[0]
    ELSE IF    '${name}' == 'Chọn Non_Balance Supplier'
        ${elements}=               Get Elements       //span[contains(text(),'Nhà cung cấp thiết bị điện tử')]
        ${element}=                Set Variable       ${elements}[0]
    ELSE IF    '${name}' == 'Đối tác'
        ${element}=               Get Element Form Item By Label    ${name}       //span[contains(text(),'Balance')]
    ELSE IF    '${name}' != 'Chọn trạng thái'
        ${element}=               Get Element Form Item By Label    ${name}       //*[contains(@class, "ant-select-selection-search-input")]
    END
    Wait Until Element Is Visible       ${element}
    Click             ${element}
    IF  '${name}' == 'Nhà cung cấp'
        ${element}        Set Variable        //*[contains(@class, "ant-select-item-option-content")]//*[contains(text(), "${text}")]
    ELSE IF  '${name}' != 'Nhà cung cấp'
        ${element}        Set Variable      xpath=//*[contains(@class, "ant-select-item-option") and @title="${text}"]
    END
    Click             ${element}

Click Verify To Action
    ${element}         Get Element        //button[contains(text(),'Đồng ý')]
    Click               ${element}

Choose "${name}" with "${text}"
    ${element}=               Get Element Form Item By Label    ${name}       //input[@id='nameBrand']
    Clear Text                ${element}
    Fill Text                 ${element}          ${text}         True
    Press Keys                ${element}          Enter

Select Issueing Goods Transfer need to ${name}
    ${element}        Get Elements          //div[contains(text(),'Đang xử lý')]
    Click             ${element}[0]         left          2

Select "${supplier}" in supplier "${name}" with "${Product name Balance}"
    When Click on "Thêm sản phẩm" button
    And Click select in "${supplier}" field with "${name}"
    And Search "Tên sản phẩm" in "Tìm kiếm" with "${Product name Balance}"
    And Choose product
    And Click "Thêm" button
    And Click "Đóng" button

Choose product
    ${element}        Set Variable        //*[contains(@class, 'top-[10px]')]
    Wait Until Element Is Visible         ${element}
    Click                                 ${element}

Required message in "${name}" field displayed under with "${text}"
    IF  '${name}' == 'Số lượng chuyển'
        ${element}=               Get Element         //*[contains(text(), "${text}")]
    ELSE IF  '${name}' != 'Số lượng chuyển'
        ${element}=               Get Element         //*[contains(@class, "ant-form-item-explain-error")]
    END
    Element Text Should Be              ${element}                ${text}

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
    ...    ELSE    Log To Console     Không tồn tại đơn chuyển hàng nào ứng với từ khóa tìm kiếm!

Display
    [Arguments]    ${elements}
    Log To Console    ${EMPTY}
    Log To Console    ***************************************************************-DANH SÁCH ĐƠN CHUYỂN HÀNG-***************************************************************
    Wait Until Element Is Visible         ${elements}[0]
    ${count}=           Set Variable        1
    ${stt}=             Set Variable        1
    FOR  ${i}  IN  @{elements}
        ${Mã chuyển hàng}            Get Elements    //tbody[contains(@class, "ant-table-tbody")]/tr[${count}]/td[1]
        ${Mã chuyển hàng}            Get Text        ${Mã chuyển hàng}[0]
        ${Tên cửa hàng nhận}         Get Elements    //tbody[contains(@class, "ant-table-tbody")]/tr[${count}]/td[2]
        ${Tên cửa hàng nhận}         Get Text        ${Tên cửa hàng nhận}[0]
        ${Ngày chuyển}               Get Elements    //tbody[contains(@class, "ant-table-tbody")]/tr[${count}]/td[3]
        ${Ngày chuyển}               Get Text        ${Ngày chuyển}[0]
        ${Trạng thái}                Get Elements    //tbody[contains(@class, "ant-table-tbody")]/tr[${count}]/td[4]
        ${Trạng thái}                Get Text        ${Trạng thái}[0]
        Log To Console    -----------------------------------------------------ĐƠN CHUYỂN HÀNG SỐ ${stt}-----------------------------------------------------------------------
        Log To Console    - Mã chuyển hàng:${SPACE}${SPACE}${SPACE} ${Mã chuyển hàng}
        Log To Console    - Tên cửa hàng nhận: ${Tên cửa hàng nhận}
        Log To Console    - Ngày chuyển:${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE} ${Ngày chuyển}
        Log To Console    - Trạng thái:${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE} ${Trạng thái}
        Log To Console    -------------------------------------------------------------------------------------------------------------------------------------------------------------
        ${count}=    Evaluate    ${count} + 1
        ${stt}=    Evaluate    ${stt} + 1
    END
    ${total}=    Evaluate    ${count} - 1
    Log To Console    Tổng số lượng đơn chuyển hàng là: ${total} đơn

No Issueing_Goods_Transfer are shown
    Log To Console    Không có đơn chuyển hàng nào ứng với từ khóa tìm kiếm
