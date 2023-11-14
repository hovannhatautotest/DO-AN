*** Settings ***
Resource            ../keywords/common.robot
Test Setup          Preconditions
Test Teardown       Tear Down

*** Test Cases ***
###====================================NAVIGATE TO CREATE PRODUCT FROM EXCEL PAGE============================
Supplier_Import_Product_01: Kiểm tra có thể điều hướng đến trang thêm sản phẩm bằng cách nhập file excel
    [Tags]    @Test_create_product_by_import_excel    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Test case này kiểm tra có thể điều hướng đến trang thêm sản phẩm bằng cách nhập file excel
    When Click "Quản lý hàng hóa" menu
    And Click "Sản phẩm" sub menu
    And Click on "Nhập từ file excel" button
    Then User look title "Quản Lý Hàng Hóa"
    And User look contains title is "Thêm sản phẩm từ excel"

##=================================================ERROR MEESSAGE======================================================
Supplier_Import_Product_02: Kiểm tra hiển thị thông báo lỗi không khi không upload file excel
    [Tags]    @Test_create_product_by_import_excel    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Test case này kiểm tra hiển thị thông báo lỗi không khi không upload file excel
    When Go to create product by import file excel
    And Select file in "Chọn tệp" with "upload_product_valid.xlsx"
    And Click "Tiếp theo" button
    Then User look message "Đọc danh sách sản phẩm thành công." popup
    And Click "Trở về" button
    And Click "Tiếp theo" button
    Then User look message "Internal server error" popup

Supplier_Import_Product_03: Kiểm tra hiển thị thông báo lỗi khi upload file ảnh sản phẩm với định dạng không hợp lệ
    [Tags]    @Test_create_product_by_import_excel    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Test case này kiểm tra hiển thị thông báo lỗi khi upload file ảnh sản phẩm với định dạng không hợp lệ
    When Go to create product by import file excel
    And Select file in "Chọn tệp" with "vay1.jpg"
    Then User look message "Định dạng file không hợp lệ. Vui lòng chỉ tải lên file excel có định dạng xls/xlsx." popup

###========================================UPLOAD FILE SUCCESSFULLY====================================================
Supplier_Import_Product_04: Kiểm tra đọc dữ liệu file excel thành công với dữ liệu hợp lệ
    [Tags]    @Test_create_product_by_import_excel    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Test case này kiểm tra đọc dữ liệu file excel thành công với dữ liệu hợp lệ
    When Go to create product by import file excel
    And Select file in "Chọn tệp" with "upload_product_valid.xlsx"
    And Click "Tiếp theo" button
    Then User look message "Đọc danh sách sản phẩm thành công." popup
    And Show list of data valid

Supplier_Import_Product_05: Kiểm tra đọc dữ liệu file excel thành công với dữ liệu không hợp lệ
    [Tags]    @Test_create_product_by_import_excel    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Test case này kiểm tra đọc dữ liệu file excel thành công với dữ liệu không hợp lệ
    When Go to create product by import file excel
    And Select file in "Chọn tệp" with "DanhMucKhongTonTai.xlsx"
    And Click "Tiếp theo" button
    Then User look message "Đọc danh sách sản phẩm thành công." popup
    And Show list of data invalid

##********************************************DATA VALID PAGE**********************************************************
##====================================Error Message====================================================================
Supplier_Import_Product_06: Kiểm tra hiển thị thông báo lỗi khi upload file ảnh sai định dạng
    [Tags]    @Test_create_product_by_import_excel    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Test case này kiểm tra hiển thị thông báo lỗi "Định dạng file không hợp lệ. Vui lòng chỉ tải lên file ảnh có định dạng jpg/jpeg/png." khi upload ảnh sải định dạng
    When Go to add product with data valid
    And Select file in "Chọn tệp" field with "upload_product_valid.xlsx"
    Then User look message "Định dạng file không hợp lệ. Vui lòng chỉ tải lên file ảnh có định dạng jpg/jpeg/png." popup

##====================================Create Successfull===============================================================
Supplier_Import_Product_07: Kiểm tra tạo mới sản phẩm thành công với dữ liệu hợp lệ
    [Tags]    @Test_create_product_by_import_excel    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Test case này kiểm tra có thể tạo mới sản phẩm bằng cách upload file excel
    When Go to add product with data valid
    And Change image all product
    And Click "Lưu" button
    Then User look message "Tạo sản phẩm thành công." popup

Supplier_Import_Product_08: Kiểm tra có thể quay lại trang 'Quản lý sản phẩm' từ trang 'Thêm sản phẩm từ excel'
    [Tags]    @Test_create_product_by_import_excel    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Test case này kiểm tra có thể quay lại trang 'Quản lý sản phẩm' từ trang 'Thêm sản phẩm từ excel'
    When Go to create product by import file excel
    And Click "Trở về" button
    Then User look title "Quản Lý Hàng Hóa"
    And User look contains title is "Quản lý sản phẩm"

####================================"DỮ LIỆU KHÔNG HỢP LỆ PAGE"=========================================================
Supplier_Import_Product_09: Kiểm tra hiển thị thông tin không hợp lệ khi nhà cung cấp tải lên tệp excel với "Danh mục" không tồn tại trong hệ thống
    [Tags]    @Test_create_product_by_import_excel    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Test case này kiểm tra hiển thị thông tin không hợp lệ khi nhà cung cấp tải lên tệp excel với "Danh mục" không tồn tại trong hệ thống
    When Go to create product by import file excel
    And Select file in "Chọn tệp" with "DanhMucKhongTonTai.xlsx"
    And Click "Tiếp theo" button
    Then User look message "Đọc danh sách sản phẩm thành công." popup
    And Show list of data invalid

Supplier_Import_Product_10: Kiểm tra hiển thị thông tin không hợp lệ khi nhà cung cấp tải lên tệp excel thiếu "Danh mục"
    [Tags]    @Test_create_product_by_import_excel    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Test case này kiểm tra hiển thị thông tin không hợp lệ khi nhà cung cấp tải lên tệp excel thiếu "Danh mục"
    When Go to create product by import file excel
    And Select file in "Chọn tệp" with "ThieuDanhMuc.xlsx"
    And Click "Tiếp theo" button
    Then User look message "Đọc danh sách sản phẩm thành công." popup
    And Show list of data invalid

Supplier_Import_Product_11: Kiểm tra hiển thị thông tin không hợp lệ khi nhà cung cấp tải lên tệp excel thiếu "Tên sản phẩm"
    [Tags]    @Test_create_product_by_import_excel    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Test case này kiểm tra hiển thị thông tin không hợp lệ khi nhà cung cấp tải lên tệp excel thiếu "Tên sản phẩm"
    When Go to create product by import file excel
    And Select file in "Chọn tệp" with "ThieuTenSanPham.xlsx"
    And Click "Tiếp theo" button
    Then User look message "Đọc danh sách sản phẩm thành công." popup
    And Show list of data invalid

Supplier_Import_Product_12: Kiểm tra hiển thị thông tin không hợp lệ khi nhà cung cấp tải lên tệp excel với "Mã vạch" không hợp lệ
    [Tags]    @Test_create_product_by_import_excel    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Test case này kiểm tra hiển thị thông tin không hợp lệ khi nhà cung cấp tải lên tệp excel với "Mã vạch" không hợp lệ
    When Go to create product by import file excel
    And Select file in "Chọn tệp" with "MaVachKhongHopLe.xlsx"
    And Click "Tiếp theo" button
    Then User look message "Đọc danh sách sản phẩm thành công." popup
    And Show list of data invalid

Supplier_Import_Product_13: Kiểm tra hiển thị thông tin không hợp lệ khi nhà cung cấp tải lên tệp excel với "Mã vạch" trùng với mã vạch của sản phẩm khác trên hệ thống
    [Tags]    @Test_create_product_by_import_excel    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Test case này kiểm tra hiển thị thông tin không hợp lệ khi nhà cung cấp tải lên tệp excel với "Mã vạch" trùng với mã vạch của sản phẩm khác trên hệ thống
    When Go to create product by import file excel
    And Select file in "Chọn tệp" with "MaVachDaTonTai.xlsx"
    And Click "Tiếp theo" button
    Then User look message "Đọc danh sách sản phẩm thành công." popup
    And Show list of data invalid

Supplier_Import_Product_14: Kiểm tra hiển thị thông tin không hợp lệ khi nhà cung cấp tải lên tệp excel thiếu "Tên nhà cung cấp"
    [Tags]    @Test_create_product_by_import_excel    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Test case này kiểm tra hiển thị thông tin không hợp lệ khi nhà cung cấp tải lên tệp excel thiếu "Tên nhà cung cấp"
    When Go to create product by import file excel
    And Select file in "Chọn tệp" with "ThieuNCC.xlsx"
    And Click "Tiếp theo" button
    Then User look message "Đọc danh sách sản phẩm thành công." popup
    And Show list of data invalid

Supplier_Import_Product_15: Kiểm tra hiển thị thông tin không hợp lệ khi nhà cung cấp tải lên tệp excel thiếu "Xuất xứ"
    [Tags]    @Test_create_product_by_import_excel    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Test case này kiểm tra hiển thị thông tin không hợp lệ khi nhà cung cấp tải lên tệp excel thiếu "Xuất xứ"
    When Go to create product by import file excel
    And Select file in "Chọn tệp" with "ThieuXuatXu.xlsx"
    And Click "Tiếp theo" button
    Then User look message "Đọc danh sách sản phẩm thành công." popup
    And Show list of data invalid

Supplier_Import_Product_16: Kiểm tra hiển thị thông tin không hợp lệ khi nhà cung cấp tải lên tệp excel thiếu "Đơn vị cơ bản"
    [Tags]    @Test_create_product_by_import_excel    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Test case này kiểm tra hiển thị thông tin không hợp lệ khi nhà cung cấp tải lên tệp excel thiếu "Đơn vị cơ bản"
    When Go to create product by import file excel
    And Select file in "Chọn tệp" with "ThieuDonViCoBan.xlsx"
    And Click "Tiếp theo" button
    Then User look message "Đọc danh sách sản phẩm thành công." popup
    And Show list of data invalid

Supplier_Import_Product_17: Kiểm tra hiển thị thông báo khi nhà cung cấp tải lên tệp excel thiếu "Giá bán buôn tầng 1"
    [Tags]    @Test_create_product_by_import_excel    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Test case này kiểm tra hiển thị thông báo khi nhà cung cấp tải lên tệp excel thiếu "Giá bán buôn tầng 1"
    When Go to create product by import file excel
    And Select file in "Chọn tệp" with "ThieuGiaBan1.xlsx"
    And Click "Tiếp theo" button
    Then User look message "Đọc danh sách sản phẩm thành công." popup
    And Show list of data invalid

Supplier_Import_Product_18: Kiểm tra hiển thị thông tin không hợp lệ khi nhà cung cấp tải lên tệp excel thiếu "Giá bán buôn tầng 2"
    [Tags]    @Test_create_product_by_import_excel    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Test case này kiểm tra hiển thị thông tin không hợp lệ khi nhà cung cấp tải lên tệp excel thiếu "Giá bán buôn tầng 2"
    When Go to create product by import file excel
    And Select file in "Chọn tệp" with "ThieuGiaBan2.xlsx"
    And Click "Tiếp theo" button
    Then User look message "Đọc danh sách sản phẩm thành công." popup
    And Show list of data invalid

Supplier_Import_Product_19: Kiểm tra hiển thị thông tin không hợp lệ khi nhà cung cấp tải lên tệp excel thiếu "Giá bán buôn tầng 3"
    [Tags]    @Test_create_product_by_import_excel    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Test case này kiểm tra hiển thị thông tin không hợp lệ khi nhà cung cấp tải lên tệp excel thiếu "Giá bán buôn tầng 3"
    When Go to create product by import file excel
    And Select file in "Chọn tệp" with "ThieuGiaBan3.xlsx"
    And Click "Tiếp theo" button
    Then User look message "Đọc danh sách sản phẩm thành công." popup
    And Show list of data invalid

Supplier_Import_Product_20: Kiểm tra hiển thị thông tin không hợp lệ khi nhà cung cấp tải lên tệp excel thiếu "Chiết khấu"
    [Tags]    @Test_create_product_by_import_excel    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Test case này kiểm tra hiển thị thông tin không hợp lệ khi nhà cung cấp tải lên tệp excel thiếu "Chiết khấu"
    When Go to create product by import file excel
    And Select file in "Chọn tệp" with "ThieuChietKhau.xlsx"
    And Click "Tiếp theo" button
    Then User look message "Đọc danh sách sản phẩm thành công." popup
    And Show list of data invalid

Supplier_Import_Product_21: Kiểm tra hiển thị thông tin không hợp lệ khi nhà cung cấp tải lên tệp excel thiếu "Chiết khấu tầng 1"
    [Tags]    @Test_create_product_by_import_excel    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Test case này kiểm tra hiển thị thông tin không hợp lệ khi nhà cung cấp tải lên tệp excel thiếu "Chiết khấu tầng 1"
    When Go to create product by import file excel
    And Select file in "Chọn tệp" with "ThieuChietKhau1.xlsx"
    And Click "Tiếp theo" button
    Then User look message "Đọc danh sách sản phẩm thành công." popup
    And Show list of data invalid

Supplier_Import_Product_22: Kiểm tra hiển thị thông tin không hợp lệ khi nhà cung cấp tải lên tệp excel thiếu "Chiết khấu tầng 2"
    [Tags]    @Test_create_product_by_import_excel    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Test case này kiểm tra hiển thị thông tin không hợp lệ khi nhà cung cấp tải lên tệp excel thiếu "Chiết khấu tầng 2"
    When Go to create product by import file excel
    And Select file in "Chọn tệp" with "ThieuChietKhau2.xlsx"
    And Click "Tiếp theo" button
    Then User look message "Đọc danh sách sản phẩm thành công." popup
    And Show list of data invalid

Supplier_Import_Product_23: Kiểm tra hiển thị thông tin không hợp lệ khi nhà cung cấp tải lên tệp excel thiếu "Chiết khấu tầng 3"
    [Tags]    @Test_create_product_by_import_excel    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Test case này kiểm tra hiển thị thông tin không hợp lệ khi nhà cung cấp tải lên tệp excel thiếu "Chiết khấu tầng 3"
    When Go to create product by import file excel
    And Select file in "Chọn tệp" with "ThieuChietKhau3.xlsx"
    And Click "Tiếp theo" button
    Then User look message "Đọc danh sách sản phẩm thành công." popup
    And Show list of data invalid

Supplier_Import_Product_24: Kiểm tra hiển thị thông tin không hợp lệ khi nhà cung cấp tải lên tệp excel thiếu "Chiết doanh thu và chiết khấu tầng 1"
    [Tags]    @Test_create_product_by_import_excel    @Test_by_Hồ_Văn_Nhật
    [Documentation]     Test case này kiểm tra hiển thị thông tin không hợp lệ khi nhà cung cấp tải lên tệp excel thiếu "Chiết doanh thu và chiết khấu tầng 1"
    When Go to create product by import file excel
    And Select file in "Chọn tệp" with "ThieuCK&DT1.xlsx"
    And Click "Tiếp theo" button
    Then User look message "Đọc danh sách sản phẩm thành công." popup
    And Show list of data invalid

*** Keywords ***
Preconditions
  Set Browser Timeout         ${BROWSER_TIMEOUT}
  New Browser                 ${BROWSER}  headless=${HEADLESS}
  New Page                    ${URL_DEFAULT}
  ${STATE}                    Evaluate  json.loads('''{}''')  json
  Login to Supplier

Change image all product
    ${elements}=        Get Elements        xpath=//*[contains(@class, "ant-table-row")]
    ${count}=           Set Variable        0
    FOR  ${i}  IN  @{elements}
        ${element}=               Get Elements                      //div/input[@type = "file"]
        Upload File By Selector   ${element}[${count}]                        test/upload/vaychinh.jpg
        Sleep                     1
        Upload File By Selector   ${element}[${count}]                        test/upload/vay1.jpg
        Sleep                     1
        Upload File By Selector   ${element}[${count}]                        test/upload/vay2.jpg
        Sleep                     1
        Upload File By Selector   ${element}[${count}]                        test/upload/vay3.jpg
        ${count}=    Evaluate    ${count} + 2
    END

Select file in "${name}" field with "${text}"
  ${element}=               Get Elements                      //div/input[@type = "file"]
  Upload File By Selector   ${element}[0]                        test/upload/${text}

Go to create product by import file excel
  When Click "Quản lý hàng hóa" menu
  And Click "Sản phẩm" sub menu
  And Click on "Nhập từ file excel" button

Go to add product with data valid
  When Go to create product by import file excel
  And Select file in "Chọn tệp" with "upload_product_valid.xlsx"
  And Click "Tiếp theo" button
  Then User look message "Đọc danh sách sản phẩm thành công." popup
  And Click "Tiếp theo" button

Click on "${name}" button
  IF  '${name}' == 'Nhập từ file excel'
      ${element}        Set Variable        xpath=(//button[@id='importBtn'])[2]
  ELSE IF   '${name}' != 'Nhập từ file excel'
      ${element}        Set Variable        xpath=//div[2]/div/button/span
  END
  Click     ${element}

Show list of data ${text}
    Wait Until Element Spin
    IF  '${text}' == 'valid'
      ${elements}=        Get Elements        xpath=//*[contains(@class, "ant-table-row")]
      ${count}=           Set Variable        2
      ${stt}=             Set Variable        1
      Log To Console      ${EMPTY}
      Log To Console      DANH SÁCH SẢN PHẨM HỢP LỆ
      Log To Console    -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
      FOR  ${i}  IN  @{elements}
          ${Mã vạch}            Get Text    //tbody[contains(@class, "ant-table-tbody")]/tr[${count}]/td[2]
          ${Tên sản phẩm}       Get Text    //tbody[contains(@class, "ant-table-tbody")]/tr[${count}]/td[3]
          ${Danh mục}           Get Text    //tbody[contains(@class, "ant-table-tbody")]/tr[${count}]/td[4]
          ${Nhà cung cấp}       Get Text    //tbody[contains(@class, "ant-table-tbody")]/tr[${count}]/td[5]
          ${Giá bán lẻ}         Get Text    //tbody[contains(@class, "ant-table-tbody")]/tr[${count}]/td[6]
          Log To Console    ${stt}. Mã vạch: ${Mã vạch} || Tên sản phẩm: ${Tên sản phẩm} || Danh mục: ${Danh mục} || Nhà cung cấp: ${Nhà cung cấp} || Giá bán lẻ: ${Giá bán lẻ}
          Log To Console    -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
          ${count}=    Evaluate    ${count} + 1
          ${stt}=    Evaluate    ${stt} + 1
      END
    ELSE IF  '${text}' == 'invalid'
      ${elements}=        Get Elements        xpath=//*[contains(@class, "ant-table-row")]
      ${count}=           Set Variable        2
      Log To Console      ${EMPTY}
      Log To Console      DANH SÁCH SẢN PHẨM KHÔNG HỢP LỆ
      Log To Console    -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
      FOR  ${i}  IN  @{elements}
          ${elements}           Get Elements    //tbody[contains(@class, "ant-table-tbody")]/tr[${count}]/td[1]
          ${Dòng}               Get Text        ${elements}[0]
          ${Lỗi}                Get Text        //tbody[contains(@class, "ant-table-tbody")]/tr[${count}]/td[2]
          Log To Console    Dòng: ${Dòng} || Lỗi: ${Lỗi}
          Log To Console    -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
          ${count}=    Evaluate    ${count} + 1
      END
    END
