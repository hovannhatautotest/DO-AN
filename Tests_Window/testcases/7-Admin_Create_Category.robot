*** Settings ***
Resource            ../keywords/common.robot

Test Setup          Preconditions
Test Teardown       Tear Down


*** Test Cases ***
###*******************************CREATE CATEGORY**********************************************************************
###================================NAVIGATE TO CREATE CATEGORY PAGE=====================================================
Create_Category_01: Kiểm tra có thể điều hướng thành công đến trang tạo mới danh mục
    [Tags]    @Test_create_category    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra có thể điều hướng thành công đến trang tạo mới danh mục
    When Click "Quản lý hàng hóa" menu
    And Click "Danh mục" sub menu
    Then User look title "Quản Lý Hàng Hóa"
    And User look contains title is "Danh mục"

##===============================VALIDATION TEXT=======================================================================
Create_Category_02: Kiểm tra validation text khi bỏ trống danh mục chính
    [Tags]    @Test_create_category    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra validation text khi bỏ trống danh mục chính
    When Go to create category page
    And Click on "Thêm danh mục" button in "Danh mục chính"
    And Enter category "test name" in "Danh mục chính" with "${SPACE}"
    Then Required message "Danh mục" displayed under "Không được để trống" field

Create_Category_03: Kiểm tra validation text khi bỏ trống danh mục cấp 1
    [Tags]    @Test_create_category    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra validation text khi bỏ trống danh mục cấp 1
    When Go to create category page
    And Select category in "Danh mục chính" with "Shopee"
    And Click on "Thêm danh mục" button in "Danh mục cấp 1"
    And Enter category "test name" in "Danh mục cấp 1" with "${SPACE}"
    Then Required message "Danh mục" displayed under "Không được để trống" field

Create_Category_04: Kiểm tra validation text khi bỏ trống danh mục cấp 2
    [Tags]    @Test_create_category    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra validation text khi bỏ trống danh mục cấp 2
    When Go to create category page
    And Select category in "Danh mục chính" with "Shopee"
    And Select category in "Danh mục cấp 1" with "Consumer Electronics"
    And Click on "Thêm danh mục" button in "Danh mục cấp 2"
    And Enter category "test name" in "Danh mục cấp 2" with "${SPACE}"
    Then Required message "Danh mục" displayed under "Không được để trống" field

###================================ERROR MESSAGE WHEN CREATE CATEGORY==================================================
Create_Category_05: Kiểm tra error message khi tạo mới "Danh mục chính" đã tồn tại
    [Tags]    @Test_create_category    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra error message khi tạo mới "Danh mục chính" đã tồn tại
    When Go to create category page
    And Click on "Thêm danh mục" button in "Danh mục chính"
    And Enter category "text" in "Danh mục chính" with "Hàng đông lạnh"
    And Click on "Lưu" button in "Danh mục chính"
    Then User look message "Tên danh mục này đã tồn tại" popup

Create_Category_06: Kiểm tra error message khi tạo mới "Danh mục cấp 1" đã tồn tại
    [Tags]    @Test_create_category    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra hiển thị thông báo lỗi khi tạo mới "Danh mục cấp 1" đã tồn tại
    When Go to create category page
    And Select category in "Danh mục chính" with "Hàng đông lạnh"
    And Click on "Thêm danh mục" button in "Danh mục cấp 1"
    And Enter category "text" in "Danh mục cấp 1" with "Hải sản"
    And Click on "Lưu" button in "Danh mục cấp 1"
    Then User look message "Tên danh mục này đã tồn tại" popup

Create_Category_07: Kiểm tra error message khi tạo mới "Danh mục cấp 2" đã tồn tại
    [Tags]    @Test_create_category    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra hiển thị thông báo lỗi khi tạo mới "Danh mục cấp 2" đã tồn tại
    When Go to create category page
    And Select category in "Danh mục chính" with "Hàng đông lạnh"
    And Select category in "Danh mục cấp 1" with "Hải sản"
    And Click on "Thêm danh mục" button in "Danh mục cấp 2"
    And Enter category "text" in "Danh mục cấp 2" with "Hải sản nước mặn"
    And Click on "Lưu" button in "Danh mục cấp 2"
    Then User look message "Tên danh mục này đã tồn tại" popup

Create_Category_08: Kiểm tra error message khi tạo mới "Danh mục cấp 2" khi đã tồn tại sản phẩm thuộc về danh mục này
    [Tags]    @Test_case_failed    @Sai lỗi chính tả
    [Documentation]     Kiểm tra hiển thị thông báo lỗi khi tạo mới "Danh mục cấp 2" khi đã tồn tại sản phẩm thuộc về danh mục này
    When Go to create category page
    And Select category in "Danh mục chính" with "Thời trang nữ"
    And Select category in "Danh mục cấp 1" with "Váy"
    And Click on "Thêm danh mục" button in "Danh mục cấp 2"
    And Enter category "text" in "Danh mục cấp 2" with "_RANDOM_"
    And Click on "Lưu" button in "Danh mục cấp 2"
    Then User look message "Không thể tạo Danh Mục con vì đã tồn tại sản phẩm thuộc về danh mục này." popup

Create_Category_09: Kiểm tra error message khi xóa "Danh mục chính" đã liên kết với sản phẩm
    [Tags]    @Test_create_category    @Test_by_Hồ_Văn_Nhật
    [Documentation]       Kiểm tra hiển thị thông báo lỗi khi xóa "Danh mục chính" đã liên kết với sản phẩm
    When Go to create category page
    And Delete the category in "Danh mục chính" with "Shopee"
    Then User look message "Không thể xoá danh mục vì có sản phẩm đã được liên kết" popup

Create_Category_10: Kiểm tra error message khi xóa "Danh mục cấp 1" đã liên kết với sản phẩm
    [Tags]    @Test_create_category    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra hiển thị thông báo lỗi khi xóa "Danh mục cấp 1" đã liên kết với sản phẩm
    When Go to create category page
    And Select category in "Danh mục chính" with "Shopee"
    And Delete the category in "Danh mục cấp 1" with "Consumer Electronics"
    Then User look message "Không thể xoá danh mục vì có sản phẩm đã được liên kết" popup

Create_Category_11: Kiểm tra error message khi xóa "Danh mục cấp 2" đã liên kết với sản phẩm
    [Tags]    @Test_create_category    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm hiển thị thông báo lỗi khi xóa "Danh mục cấp 2" đã liên kết với sản phẩm
    When Go to create category page
    And Select category in "Danh mục chính" with "Shopee"
    And Select category in "Danh mục cấp 1" with "Consumer Electronics"
    And Delete the category in "Danh mục cấp 2" with "Tivi Box"
    Then User look message "Không thể xoá danh mục vì có sản phẩm đã được liên kết" popup

##=============================CREATE CATEGORY SUCCESSFULLY==================================================
Create_Category_12: Kiểm tra tạo mới "Danh mục chính" thành công
    [Tags]    @Test_create_category    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra tạo mới "Danh mục chính" thành công
    When Go to create category page
    And Click on "Thêm danh mục" button in "Danh mục chính"
    And Enter category "test name" in "Danh mục chính" with "_RANDOM_"
    And Click on "Lưu" button in "Danh mục chính"
    Then User look message "Tạo danh mục thành công" popup

Create_Category_13: Kiểm tra tạo mới "Danh mục cấp 1" thành công
    [Tags]    @Test_create_category    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra tạo mới "Danh mục cấp 1" thành công
    When Go to create category page
    And Select category in "Danh mục chính" with "Thể thao"
    And Click on "Thêm danh mục" button in "Danh mục cấp 1"
    And Enter category "test name" in "Danh mục cấp 1" with "_RANDOM_"
    And Click on "Lưu" button in "Danh mục cấp 1"
    Then User look message "Tạo danh mục thành công" popup

Create_Category_14: Kiểm tra tạo mới "Danh mục cấp 2" thành công
    [Tags]    @Test_create_category    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra tạo mới "Danh mục cấp 2" thành công
    When Go to create category page
    And Select category in "Danh mục chính" with "Thể thao"
    And Select category in "Danh mục cấp 1" with "Bóng đá"
    And Click on "Thêm danh mục" button in "Danh mục cấp 2"
    And Enter category "test name" in "Danh mục cấp 2" with "_RANDOM_"
    And Click on "Lưu" button in "Danh mục cấp 2"
    Then User look message "Tạo danh mục thành công" popup

##**********************************EDIT CATEGORY**********************************************************************
##================================VALIDATION TEXT======================================================================
Edit_Category_01: Kiểm tra validation text khi bỏ trống "Danh mục chính"
    [Tags]    @Test_edit_category    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra validation text khi bỏ trống "Danh mục chính"
    When Go to edit category page
    And Select category in "Danh mục chính" with "Shopee" need to edit
    And Edit category "Tên danh mục" in "Danh mục chính" with "${empty}"
    Then Required message "Danh mục chính" displayed under "Không được để trống" field

Edit_Category_02: Kiểm tra validation text khi bỏ trống "Danh mục cấp 1"
    [Tags]    @Test_edit_category    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra validation text khi bỏ trống "Danh mục cấp 1"
    When Go to edit category page
    And Select category in "Danh mục chính" with "Shopee"
    And Select category in "Danh mục cấp 1" with "Consumer Electronics" need to edit
    And Edit category "Tên danh mục" in "Danh mục cấp 1" with "${empty}"
    Then Required message "Danh mục cấp 1" displayed under "Không được để trống" field

Edit_Category_03: Kiểm tra validation text khi bỏ trống "Danh mục cấp 2"
    [Tags]    @Test_edit_category    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra validation text khi bỏ trống "Danh mục cấp 2"
    When Go to edit category page
    And Select category in "Danh mục chính" with "Shopee"
    And Select category in "Danh mục cấp 1" with "Consumer Electronics"
    And Select category in "Danh mục cấp 2" with "Tivi Box" need to edit
    And Edit category "Tên danh mục" in "Danh mục cấp 2" with "${empty}"
    Then Required message "Danh mục cấp 2" displayed under "Không được để trống" field

###==========================ERROR MESSAGE=============================================================================
Edit_Category_04: Kiểm tra error message khi chỉnh sửa "Danh mục chính" đã tồn tại
    [Tags]    @Test_edit_category    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra hiển thị thông báo lỗi khi chỉnh sửa "Danh mục chính" đã tồn tại
    When Go to edit category page
    And Select category in "Danh mục chính" with "Shopee" need to edit
    And Edit category "Tên danh mục" in "Danh mục chính" with "Thời trang nữ"
    And Press the "Enter" key
    Then User look message "Tên danh mục này đã tồn tại" popup

Edit_Category_05: Kiểm tra error message khi chỉnh sửa "Danh mục cấp 1" đã tồn tại
    [Tags]    @Test_edit_category    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra hiển thị thông báo lỗi khi chỉnh sửa "Danh mục cấp 1" đã tồn tại
    When Go to edit category page
    And Select category in "Danh mục chính" with "Shopee"
    And Select category in "Danh mục cấp 1" with "Consumer Electronics" need to edit
    And Edit category "Tên danh mục" in "Danh mục cấp 1" with "Hải sản"
    And Press the "Enter" key
    Then User look message "Tên danh mục này đã tồn tại" popup

Edit_Category_06: Kiểm tra error message khi chỉnh sửa "Danh mục cấp 2" đã tồn tại
    [Tags]    @Test_edit_category    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra hiển thị thông báo lỗi khi chỉnh sửa "Danh mục cấp 2" đã tồn tại
    When Go to edit category page
    And Select category in "Danh mục chính" with "Shopee"
    And Select category in "Danh mục cấp 1" with "Consumer Electronics"
    And Select category in "Danh mục cấp 2" with "Tivi Box" need to edit
    And Edit category "Tên danh mục" in "Danh mục cấp 2" with "Hải sản nước mặn"
    And Press the "Enter" key
    Then User look message "Tên danh mục này đã tồn tại" popup

####==========================EDIT CATEGORY SUCCESSFULLY===============================================
Edit_Category_07: Kiểm tra chỉnh sửa "Danh mục chính" thành công
    [Tags]    @Test_edit_category    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra chỉnh sửa "Danh mục chính" thành công
    When Go to edit category page
    And Select category in "Danh mục chính" with "Shopee" need to edit
    And Edit category "Tên danh mục" in "Danh mục chính" with "Shopee"
    And Press the "Enter" key
    Then User look message "Chỉnh sửa danh mục sản phẩm thành công." popup

Edit_Category_08: Kiểm tra chỉnh sửa "Danh mục cấp 1" thành công
    [Tags]    @Test_edit_category    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra chỉnh sửa "Danh mục cấp 1" thành công
    When Go to edit category page
    And Select category in "Danh mục chính" with "Shopee"
    And Select category in "Danh mục cấp 1" with "Consumer Electronics" need to edit
    And Edit category "Tên danh mục" in "Danh mục cấp 1" with "Consumer Electronics"
    And Press the "Enter" key
    Then User look message "Chỉnh sửa danh mục sản phẩm thành công." popup

Edit_Category_09: Kiểm tra chỉnh sửa "Danh mục cấp 2" thành công
    [Tags]    @Test_edit_category    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra chỉnh sửa "Danh mục cấp 2" thành công
    When Go to edit category page
    And Select category in "Danh mục chính" with "Shopee"
    And Select category in "Danh mục cấp 1" with "Consumer Electronics"
    And Select category in "Danh mục cấp 2" with "Tivi Box" need to edit
    And Edit category "test name" in "Danh mục cấp 2" with "Tivi Box"
    And Press the "Enter" key
    Then User look message "Chỉnh sửa danh mục sản phẩm thành công." popup

*** Keywords ***
Preconditions
  Set Browser Timeout         ${BROWSER_TIMEOUT}
  New Browser                 ${BROWSER}  headless=${HEADLESS}
  New Page                    ${URL_DEFAULT}
  ${STATE}                    Evaluate  json.loads('''{}''')  json
  Login to Admin

Go to ${name} category page
  When Click "Quản lý hàng hóa" menu
  And Click "Danh mục" sub menu

Click on "${text}" button in "${name}"
  ${element}       Get Categoty By Name       ${name}       //div//span[contains(text(),'${text}')]
  Wait Until Element Is Visible     ${element}
  Click                             ${element}

Enter category "${type}" in "${name}" with "${text}"
  ${element}=               Get Elements          xpath=//h1[contains(text(),'${name}')]/..//input[contains(@class, "ant-input")]
  ${text}=                  Get Random Text                   ${type}                       ${text}
  Clear Text                ${element}[1]
  Sleep                     0.1
  Fill Text                 ${element}[1]                     ${text}       True

Select category in "${name}" with "${text}"
  ${element}       Get Categoty By Name       ${name}         //div[contains(text(),'${text}')]
  Wait Until Element Is Visible     ${element}
  Click     ${element}

Delete the category in "${name}" with "${text}"
  ${element}       Get Categoty By Name       ${name}      //div[contains(text(),'${text}')]/..//*[local-name()='svg']
  Wait Until Element Is Visible       ${element}
  Click       ${element}
  Click "Xóa danh mục" button
  Click "Xóa" button

Select category in "${name}" with "${text}" need to edit
  ${element}       Get Categoty By Name       ${name}         //div[contains(text(),'${text}')]
  Wait Until Element Is Visible     ${element}
  Click     ${element}      left      2

Edit category "${type}" in "${name}" with "${text}"
  ${text}=                   Get Random Text                   ${type}                       ${text}
  ${element}       Get Categoty By Name       ${name}         //*[@id="name"]
  Wait Until Element Is Visible       ${element}
  Clear Text                ${element}
  Fill Text                 ${element}                     ${text}                       True

Press the "${text}" key
  Press Keys                //*[@id="name"]                      ${text}

Get Categoty By Name
    [Arguments]               ${name}                           ${xpath}=${EMPTY}
    [Return]            xpath=//h1[contains(text(),'${name}')]/..${xpath}
