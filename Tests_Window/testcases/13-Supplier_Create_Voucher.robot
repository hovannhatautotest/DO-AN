*** Settings ***
Resource            ../keywords/common.robot
Test Setup          Preconditions
Test Teardown       Tear Down

*** Variables ***
${Ngày bắt đầu}     11/10/2023
${Ngày kết thúc}    01/12/2023

*** Test Cases ***
###*******************************CREATE VOUCHER************************************************************************
###=============================Navigate to create voucher==============================================================
Create_vocher_01: Kiểm tra có thể điều hướng đến trang tạo mới mã khuyến mãi thành công
    [Tags]    @Test_Create_Voucher     @Test_by_Hồ_Văn_Nhật
    [Documentation]       Kiểm tra có thể điều hướng đến trang tạo mới mã khuyến mãi thành công
    When Click "Quản lý khuyến mãi" menu
    And Click "Quản lý voucher" sub menu
    And Click "Thêm mới" button
    Then User look title "Thêm voucher"
    And User look contains title is "Thêm mới voucher"

##==============================Validation text========================================================================
Create_vocher_02: Kiểm tra validation text khi bỏ trống tất cả các trường
    [Tags]    @Test_Create_Voucher     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra validation text khi bỏ trống tất cả các trường
    When Go to create voucher page
    And Click "Lưu" button
    Then Required message "Mã Voucher" displayed under "Vui lòng điền vào trường này!" field
    And Required message "Giá trị" displayed under "Vui lòng điền vào trường này!" field
    And Required message "Ngày bắt đầu" displayed under "Vui lòng chọn ngày bắt đầu!" field
    And Required message "Ngày kết thúc" displayed under "Vui lòng chọn ngày kết thúc!" field
    And Required message "Điều kiện áp dụng" displayed under "Vui lòng điền vào trường này!" field
    And Required message "Tổng số phát hành" displayed under "Vui lòng điền vào trường này!" field
    And Required message "Mô tả" displayed under "Vui lòng điền vào trường này!" field

Create_vocher_03: Kiểm tra validation text khi bỏ trống trường "Mã Voucher"
    [Tags]    @Test_Create_Voucher     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra validation text khi bỏ trống trường "Mã Voucher"
    When Go to create voucher page
    And Enter "Mã Voucher" in "Mã Voucher" with "${empty}"
    And Click in "Giá trị" field
    Then Required message "Mã Voucher" displayed under "Vui lòng điền vào trường này!" field

Create_vocher_04: Kiểm tra validation text khi bỏ trống trường "Hình thức khuyến mãi"
    [Tags]    @Test_Create_Voucher     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra validation text khi bỏ trống trường "Hình thức khuyến mãi"
    When Go to create voucher page
    And Delete text in "Hình thức khuyến mãi" field
    Then Required message "Hình thức khuyến mãi" displayed under "Vui lòng chọn hình thức khuyến mãi!" field

Create_vocher_05: Kiểm tra validation text khi bỏ trống trường "Giá trị"
    [Tags]    @Test_Create_Voucher     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra validation text khi bỏ trống trường "Giá trị"
    When Go to create voucher page
    And Enter "text" in "Giá trị" with "${empty}"
    And Click in "Mã Voucher" field
    Then Required message "Giá trị" displayed under "Vui lòng điền vào trường này!" field

Create_vocher_06: Kiểm tra validation text khi nhập trường "Giá trị" bằng 0 với "Hình thức khuyến mãi" là "Giảm tiền mặt"
    [Tags]    @Test_Create_Voucher     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra validation text khi nhập trường "Giá trị" bằng 0 với "Hình thức khuyến mãi" là "Giảm tiền mặt"
    When Go to create voucher page
    And Enter "text" in "Giá trị" with "0"
    And Click in "Mã Voucher" field
    Then Required message "Giá trị" displayed under "Vui lòng nhập số lớn hơn 0!" field

Create_vocher_07: Kiểm tra validation text khi nhập trường "Giá trị" bằng 0 với "Hình thức khuyến mãi" là "Giảm phần trăm"
    [Tags]    @Test_Create_Voucher     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra validation text khi nhập trường "Giá trị" bằng 0 với "Hình thức khuyến mãi" là "Giảm phần trăm"
    When Go to create voucher page
    And Click select "Hình thức khuyến mãi" with "Giảm phần trăm"
    And Enter "text" in "Giá trị" with "0"
    And Click in "Mã Voucher" field
    Then Required message "Giá trị" displayed under "Vui lòng nhập giá trị từ lớn hơn 0 và nhỏ hơn 100%!" field

Create_vocher_08: Kiểm tra validation text khi bỏ trống trường "Ngày bắt đầu"
    [Tags]    @Test_Create_Voucher     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra validation text khi bỏ trống trường "Ngày bắt đầu"
    When Go to create voucher page
    And Enter date in "Ngày bắt đầu" with "${empty}"
    And Click in "Giá trị" field
    Then Required message "Ngày bắt đầu" displayed under "Vui lòng chọn ngày bắt đầu!" field

Create_vocher_09: Kiểm tra validation text khi bỏ trống trường "Ngày kết thúc"
    [Tags]    @Test_Create_Voucher     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra validation text khi bỏ trống trường "Ngày kết thúc"
    When Go to create voucher page
    And Enter date in "Ngày kết thúc" with "${empty}"
    And Click in "Giá trị" field
    Then Required message "Ngày kết thúc" displayed under "Vui lòng chọn ngày kết thúc!" field

Create_vocher_10: Kiểm tra validation text khi bỏ trống trường "Điều kiện áp dụng"
    [Tags]    @Test_Create_Voucher     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra validation text khi bỏ trống trường "Điều kiện áp dụng"
    When Go to create voucher page
    And Enter "number" in "Điều kiện áp dụng" with "${empty}"
    And Click in "Tổng số phát hành" field
    Then Required message "Điều kiện áp dụng" displayed under "Vui lòng điền vào trường này!" field

Create_vocher_11: Kiểm tra validation text khi nhập trường "Điều kiện áp dụng" không hợp lệ
    [Tags]    @Test_Create_Voucher     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra validation text khi nhập trường "Điều kiện áp dụng" không hợp lệ
    When Go to create voucher page
    And Enter "voucher invalid" in "Điều kiện áp dụng" with "_RANDOM_"
    And Click in "Tổng số phát hành" field
    Then Required message "Điều kiện áp dụng" displayed under "Vui lòng chỉ nhập số!" field

Create_vocher_12: Kiểm tra validation text khi nhập trường "Điều kiện áp dụng" nhỏ hơn trường "Giá trị"
    [Tags]    @Test_Create_Voucher     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra validation text khi nhập trường "Điều kiện áp dụng" nhỏ hơn trường "Giá trị"
    When Go to create voucher page
    And Enter "giá trị" in "Giá trị" with "100000"
    And Enter "điều kiện" in "Điều kiện áp dụng" with "10000"
    And Click in "Tổng số phát hành" field
    Then Required message "Điều kiện áp dụng" displayed under "Điều kiện áp dụng phải lớn hơn hoặc bằng giá trị!" field

Create_vocher_13: Kiểm tra validation text khi bỏ trống trường "Tổng số phát hành"
    [Tags]    @Test_Create_Voucher     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra validation text khi bỏ trống trường "Tổng số phát hành"
    When Go to create voucher page
    And Enter "number" in "Tổng số phát hành" with "${empty}"
    And Click in "Điều kiện áp dụng" field
    Then Required message "Tổng số phát hành" displayed under "Vui lòng điền vào trường này!" field

Create_vocher_14: Kiểm tra validation text khi nhập trường "Tổng số phát hành" không hợp lệ
    [Tags]    @Test_Create_Voucher     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra validation text khi nhập trường "Tổng số phát hành" không hợp lệ
    When Go to create voucher page
    And Enter "voucher invalid" in "Tổng số phát hành" with "_RANDOM_"
    And Click in "Điều kiện áp dụng" field
    Then Required message "Tổng số phát hành" displayed under "Vui lòng chỉ nhập số!" field

Create_vocher_15: Kiểm tra validation text khi nhập trường "Tổng số phát hành" bằng 0
    [Tags]    @Test_Create_Voucher     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra validation text khi nhập trường "Tổng số phát hành" bằng 0
    When Go to create voucher page
    And Enter "voucher invalid" in "Tổng số phát hành" with "0"
    And Click in "Điều kiện áp dụng" field
    Then Required message "Tổng số phát hành" displayed under "Vui lòng nhập số lớn hơn 0!" field

Create_vocher_16: Kiểm tra validation text khi bỏ trống trường "Mô tả"
    [Tags]    @Test_Create_Voucher     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra validation text khi bỏ trống trường "Mô tả"
    When Go to create voucher page
    And Enter "text" in textarea "Mô tả" with "${empty}"
    And Click in "Điều kiện áp dụng" field
    Then Required message "Mô tả" displayed under "Vui lòng điền vào trường này!" field

Create_vocher_17: Kiểm tra validation text khi nhập trường "Mô tả" lớn hơn 255 ký tự
    [Tags]    @Test_Create_Voucher     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra validation text khi nhập trường "Mô tả" lớn hơn 255 ký tự
    When Go to create voucher page
    And Enter "text > 255" in textarea "Mô tả" with "_RANDOM_"
    And Click in "Điều kiện áp dụng" field
    Then Required message "Mô tả" displayed under "Vui lòng không nhập quá 255 ký tự!" field

##====================================Error Message====================================================================
Create_vocher_18: Kiểm tra hiển thị thông báo lỗi khi "Mã voucher" đã tồn tại và đang có hiệu lực
    [Tags]    @Test_Create_Voucher     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra hiển thị thông báo lỗi khi "Mã voucher" đã tồn tại và đang có hiệu lực
    When Go to create voucher page
    And Enter "Mã voucher" in "Mã Voucher" with "Voucher01"
    And Enter "giá trị" in "Giá trị" with "_RANDOM_"
    And Enter date in "Ngày bắt đầu" with "${Ngày bắt đầu}"
    And Enter date in "Ngày kết thúc" with "${Ngày kết thúc}"
    And Enter "điều kiện" in "Điều kiện áp dụng" with "_RANDOM_"
    And Enter "số lượng" in "Tổng số phát hành" with "_RANDOM_"
    And Enter "paragraph" in textarea "Mô tả" with "_RANDOM_"
    And Click "Lưu" button
    Then User look message "Mã voucher đã tồn tại và đang có hiệu lực, vui lòng nhập mã khác!" popup

##====================================Create Successfull===============================================================
Create_vocher_19: Kiểm tra tạo mới thành công voucher "Giảm tiền mặt"
    [Tags]    @Test_Create_Voucher     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra tạo mới thành công voucher "Giảm tiền mặt"
    When Go to create voucher page
    And Enter "giá trị" in "Giá trị" with "_RANDOM_"
    And Enter default information when create voucher
    And Click "Lưu" button
    Then User look message "Tạo voucher thành công." popup

Create_vocher_20: Kiểm tra tạo mới thành công voucher "Giảm phần trăm"
    [Tags]    @Test_Create_Voucher     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra tạo mới thành công voucher "Giảm phần trăm"
    When Go to create voucher page
    And Click select "Hình thức khuyến mãi" with "Giảm phần trăm"
    And Enter "%" in "Giá trị" with "_RANDOM_"
    And Enter default information when create voucher
    And Click "Lưu" button
    Then User look message "Tạo voucher thành công." popup

##=========================================View list of Vouchers=======================================================
Create_vocher_21: Kiểm tra có thể hiển thị danh sách Voucher đã tạo
    [Tags]    @Test_Create_Voucher     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra có thể hiển thị danh sách Voucher đã tạo
    When Go to list voucher page
    Then Show list of "Vouchers"

Create_vocher_22: Kiểm tra có thể hiển thị danh sách voucher khi tìm kiếm "Mã voucher" hợp lệ
    [Tags]    @Test_Create_Voucher     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra có thể hiển thị danh sách voucher khi tìm kiếm "Mã voucher" hợp lệ
    When Go to list voucher page
    And Search "Mã voucher" in "Mã voucher" with "Voucher01"
    Then Show list of "Vouchers"

Create_vocher_23: Kiểm tra không hiển thị danh sách voucher khi tìm kiếm "Mã voucher" không hợp lệ
    [Tags]    @Test_Create_Voucher     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra không hiển thị danh sách voucher khi tìm kiếm "Mã voucher" không hợp lệ
    When Go to list voucher page
    And Search "Mã voucher" in "Mã voucher" with "_RANDOM_"
    Then No voucher are shown

Create_vocher_24: Kiểm tra không hiển thị danh sách voucher khi tìm kiếm "Từ khóa" không hợp lệ
    [Tags]    @Test_Create_Voucher     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra không hiển thị danh sách voucher khi tìm kiếm "Từ khóa" không hợp lệ
    When Go to list voucher page
    And Search "text" in "Mã voucher" with "_RANDOM_"
    Then No voucher are shown

Create_vocher_25: Kiểm tra có thể hiển thị danh sách voucher "Đang hiệu lực"
    [Tags]    @Test_Create_Voucher     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra có thể hiển thị danh sách voucher "Đang hiệu lực"
    When Go to list voucher page
    And Click select "Chọn trạng thái" field with "Đang hiệu lực"
    Then Show list of "Vouchers"

Create_vocher_26: Kiểm tra có thể hiển thị danh sách voucher "Hết hiệu lực"
    [Tags]    @Test_Create_Voucher     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra có thể hiển thị danh sách voucher "Hết hiệu lực"
    When Go to list voucher page
    And Click select "Chọn trạng thái" field with "Hết hiệu lực"
    Then Show list of "Vouchers"

Create_vocher_27: Kiểm tra có thể hiển thị danh sách voucher theo ngày bắt đầu và ngày kết thúc
    [Tags]    @Test_Create_Voucher     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra có thể hiển thị danh sách voucher theo ngày bắt đầu và ngày kết thúc
    When Go to list voucher page
    And Enter date in "Từ ngày" field with "30/08/2023"
    And Enter date in "Đến ngày" field with "11/10/2023"
    Then Show list of "Vouchers"

Create_vocher_28: Kiểm tra có thể hiển thị danh sách voucher trang kế tiếp, trang trước, trang cuối cùng, trang đầu tiên
    [Tags]    @Test_Create_Voucher     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra có thể hiển thị danh sách voucher trang kế tiếp, trang trước, trang cuối cùng, trang đầu tiên
    When Go to list voucher page
    And Click ">" to "next" page
    Then Show list of "Vouchers"
    And Click "<" to "prev" page
    Then Show list of "Vouchers"
    And Click ">>" to "next_all" page
    Then Show list of "Vouchers"
    And Click "<<" to "prev_all" page
    Then Show list of "Vouchers"

##********************************EDIT VOUCHER*************************************************************************
##===============================Navigate to edit Voucher==============================================================
Edit_vocher_01: Kiểm tra có thể điều hướng thành công đến trang chỉnh sửa Voucher
    [Tags]    @Test_Edit_Voucher     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra có thể điều hướng thành công đến trang chỉnh sửa Voucher
    When Click "Quản lý khuyến mãi" menu
    And Click "Quản lý voucher" sub menu
    And Select voucher need to edit
    Then User look title "Chỉnh sửa voucher"
    And User look contains title is "Chỉnh sửa voucher"

###=================================VALIDATION TEXT=====================================================================
Edit_Voucher_02: Kiểm tra validation text khi bỏ trống trường "Mã Voucher"
    [Tags]    @Test_Edit_Voucher     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra validation text khi bỏ trống trường "Mã Voucher"
    When Go to edit voucher page
    And Enter "Mã Voucher" in "Mã Voucher" with "${empty}"
    And Click in "Giá trị" field
    Then Required message "Mã Voucher" displayed under "Vui lòng điền vào trường này!" field

Edit_Voucher_03: Kiểm tra validation text khi bỏ trống trường "Hình thức khuyến mãi"
    [Tags]    @Test_Edit_Voucher     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra validation text khi bỏ trống trường "Hình thức khuyến mãi"
    When Go to edit voucher page
    And Delete select text in "Hình thức khuyến mãi"
    Then Required message "Hình thức khuyến mãi" displayed under "Vui lòng chọn hình thức khuyến mãi!" field

Edit_Voucher_04: Kiểm tra validation text khi bỏ trống trường "Giá trị" với hình thức khuyến mãi "Giảm tiền mặt"
    [Tags]    @Test_Edit_Voucher     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra validation text khi bỏ trống trường "Giá trị" với hình thức khuyến mãi "Giảm phần trăm"
    When Go to edit voucher page
    And Click select "Hình thức khuyến mãi" with "Giảm tiền mặt"
    And Enter "text" in "Giá trị" with "${empty}"
    And Click in "Mã Voucher" field
    Then Required message "Giá trị" displayed under "Vui lòng điền vào trường này!" field

Edit_Voucher_05: Kiểm tra validation text khi bỏ trống trường "Giá trị" với hình thức khuyến mãi "Giảm phần trăm"
    [Tags]    @Test_Edit_Voucher     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra validation text khi bỏ trống trường "Giá trị" với hình thức khuyến mãi "Giảm phần trăm"
    When Go to edit voucher page
    And Click select "Hình thức khuyến mãi" with "Giảm phần trăm"
    And Enter "text" in "Giá trị" with "${empty}"
    And Click in "Mã Voucher" field
    Then Required message "Giá trị" field displayed under "Vui lòng điền vào trường này!"
    And Required message "Giá trị" field displayed under "Vui lòng nhập giá trị từ lớn hơn 0 và nhỏ hơn 100%!"

Edit_Voucher_06: Kiểm tra validation text khi nhập trường "Giá trị" bằng 0 với "Hình thức khuyến mãi" là "Giảm tiền mặt"
    [Tags]    @Test_Edit_Voucher     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra validation text khi nhập trường "Giá trị" bằng 0 với "Hình thức KM" là Giảm tiền mặt
    When Go to edit voucher page
    And Click select "Hình thức khuyến mãi" with "Giảm tiền mặt"
    And Enter "cost" in "Giá trị" with "0"
    And Click in "Mã Voucher" field
    Then Required message "Giá trị" displayed under "Vui lòng nhập số lớn hơn 0!" field

Edit_Voucher_07: Kiểm tra validation text khi nhập trường "Giá trị" bằng 0 với "Hình thức khuyến mãi" là "Giảm phần trăm"
    [Tags]    @Test_Edit_Voucher     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra validation text khi nhập trường "Giá trị" bằng 0 với "Hình thức KM" là Giảm phần trăm
    When Go to edit voucher page
    And Click select "Hình thức khuyến mãi" with "Giảm phần trăm"
    And Enter "%" in "Giá trị" with "0"
    And Click in "Mã Voucher" field
    Then Required message "Giá trị" displayed under "Vui lòng nhập giá trị từ lớn hơn 0 và nhỏ hơn 100%!" field

Edit_Voucher_08: Kiểm tra validation text khi bỏ trống trường "Ngày bắt đầu"
    [Tags]    @Test_Edit_Voucher     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra validation text khi bỏ trống trường "Ngày bắt đầu"
    When Go to edit voucher page
    And Delete date in "Ngày bắt đầu" field
    And Click date in "Ngày bắt đầu" field
    And Click date in "Ngày kết thúc" field
    Then Required message "Ngày bắt đầu" displayed under "Vui lòng chọn ngày bắt đầu!" field

Edit_Voucher_09: Kiểm tra validation text khi bỏ trống trường "Ngày kết thúc"
    [Tags]    @Test_Edit_Voucher     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra validation text khi bỏ trống trường "Ngày kết thúc"
    When Go to edit voucher page
    And Delete date in "Ngày kết thúc" field
    And Click date in "Ngày kết thúc" field
    And Click date in "Ngày bắt đầu" field
    Then Required message "Ngày kết thúc" displayed under "Vui lòng chọn ngày kết thúc!" field

Edit_Voucher_10: Kiểm tra validation text khi bỏ trống trường "Điều kiện áp dụng"
    [Tags]    @Test_Edit_Voucher     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra validation text khi bỏ trống trường "Điều kiện áp dụng"
    When Go to edit voucher page
    And Enter "number" in "Điều kiện áp dụng" with "${empty}"
    And Click in "Tổng số phát hành" field
    Then Required message "Điều kiện áp dụng" field displayed under "Vui lòng điền vào trường này!"
    And Required message "Điều kiện áp dụng" field displayed under "Điều kiện áp dụng phải lớn hơn hoặc bằng giá trị!"

Edit_Voucher_11: Kiểm tra validation text khi nhập trường "Điều kiện áp dụng" không hợp lệ
    [Tags]    @Test_Edit_Voucher     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra validation text khi bỏ trống trường "Điều kiện áp dụng"
    When Go to edit voucher page
    And Enter "voucher invalid" in "Điều kiện áp dụng" with "_RANDOM_"
    And Click in "Tổng số phát hành" field
    Then Required message "Điều kiện áp dụng" displayed under "Vui lòng chỉ nhập số!" field

Edit_Voucher_12: Kiểm tra validation text khi nhập trường "Điều kiện áp dụng" nhỏ hơn trường "Giá trị"
    [Tags]    @Test_Edit_Voucher     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra validation text khi nhập trường "Điều kiện áp dụng" nhỏ hơn trường "Giá trị"
    When Go to edit voucher page
    And Click select "Hình thức khuyến mãi" with "Giảm tiền mặt"
    And Enter "giá trị" in "Giá trị" with "100000"
    And Enter "điều kiện" in "Điều kiện áp dụng" with "10000"
    And Click in "Tổng số phát hành" field
    Then Required message "Điều kiện áp dụng" displayed under "Điều kiện áp dụng phải lớn hơn hoặc bằng giá trị!" field

Edit_Voucher_13: Kiểm tra validation text khi bỏ trống trường "Tổng số phát hành"
    [Tags]    @Test_Edit_Voucher     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra validation text khi bỏ trống trường "Tổng số phát hành"
    When Go to edit voucher page
    And Enter "number" in "Tổng số phát hành" with "${empty}"
    And Click in "Điều kiện áp dụng" field
    Then Required message "Tổng số phát hành" field displayed under "Vui lòng điền vào trường này!"
    And Required message "Tổng số phát hành" field displayed under "Vui lòng nhập số lớn hơn 0!"

Edit_Voucher_14: Kiểm tra validation text khi nhập trường "Tổng số phát hành" không hợp lệ
    [Tags]    @Test_Edit_Voucher     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra validation text khi nhập trường "Tổng số phát hành" không hợp lệ
    When Go to edit voucher page
    And Enter "voucher invalid" in "Tổng số phát hành" with "_RANDOM_"
    And Click in "Điều kiện áp dụng" field
    Then Required message "Tổng số phát hành" displayed under "Vui lòng chỉ nhập số!" field

Edit_Voucher_15: Kiểm tra validation text khi nhập trường "Tổng số phát hành" bằng 0
    [Tags]    @Test_Edit_Voucher     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra validation text khi nhập trường "Tổng số phát hành" không hợp lệ
    When Go to edit voucher page
    And Enter "number" in "Tổng số phát hành" with "0"
    And Click in "Điều kiện áp dụng" field
    Then Required message "Tổng số phát hành" displayed under "Vui lòng nhập số lớn hơn 0!" field

Edit_Voucher_16: Kiểm tra validation text khi bỏ trống trường "Mô tả"
    [Tags]    @Test_Edit_Voucher     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra validation text khi bỏ trống trường "Mô tả"
    When Go to edit voucher page
    And Enter "text" in textarea "Mô tả" with "${empty}"
    And Click in "Điều kiện áp dụng" field
    Then Required message "Mô tả" displayed under "Vui lòng điền vào trường này!" field

Edit_Voucher_17: Kiểm tra validation text khi nhập trường "Tổng số phát hành" lớn hơn 255 ký tự
    [Tags]    @Test_Edit_Voucher     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra validation text khi nhập trường "Tổng số phát hành" lớn hơn 255 ký tự
    When Go to edit voucher page
    And Enter "text > 255" in textarea "Mô tả" with "_RANDOM_"
    And Click in "Điều kiện áp dụng" field
    Then Required message "Mô tả" displayed under "Vui lòng không nhập quá 255 ký tự!" field

##====================================Error Message====================================================================
Edit_Voucher_18: Kiểm tra hiển thị thông báo lỗi khi Mã voucher đã tồn tại và đang có hiệu lực
    [Tags]    @Test_Edit_Voucher     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra hiển thị thông báo lỗi khi Mã voucher đã tồn tại và đang có hiệu lực
    When Go to edit voucher page
    And Enter "Mã voucher" in "Mã Voucher" with "Voucher01"
    And Click "Lưu" button
    Then User look message "Mã voucher đã tồn tại, vui lòng nhập mã khác!" popup

###=================================Edit voucher successfull===========================================================
Edit_Voucher_19: Kiểm tra chỉnh sửa voucher thành công khi thay đổi "Mã voucher"
    [Tags]    @Test_Edit_Voucher     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra hiển thị thông báo lỗi khi Mã voucher đã tồn tại và đang có hiệu lực
    When Go to edit voucher page
    And Enter "Mã voucher" in "Mã Voucher" with "Voucher178"
    And Click "Lưu" button
    Then User look message "Cập nhật voucher thành công." popup

Edit_Voucher_20: Kiểm tra chỉnh sửa voucher thành công khi thay đổi "Hình thức khuyến mãi"
    [Tags]    @Test_Edit_Voucher     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra hiển thị thông báo lỗi khi Mã voucher đã tồn tại và đang có hiệu lực
    When Go to edit voucher page
    And Click select "Hình thức khuyến mãi" with "Giảm tiền mặt"
    And Enter "cost" in "Giá trị" with "_RANDOM_"
    And Click "Lưu" button
    Then User look message "Cập nhật voucher thành công." popup

Edit_Voucher_21: Kiểm tra chỉnh sửa voucher thành công khi thay đổi "Tổng số phát hành"
    [Tags]    @Test_Edit_Voucher     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra hiển thị thông báo lỗi khi Mã voucher đã tồn tại và đang có hiệu lực
    When Go to edit voucher page
    And Enter "%" in "Tổng số phát hành" with "_RANDOM_"
    And Click "Lưu" button
    Then User look message "Cập nhật voucher thành công." popup

Edit_Voucher_22: Kiểm tra chỉnh sửa voucher thành công khi thay đổi thời gian áp dụng voucher
    [Tags]    @Test_Edit_Voucher     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra hiển thị thông báo lỗi khi Mã voucher đã tồn tại và đang có hiệu lực
    When Go to edit voucher page
    And Enter date in "Ngày bắt đầu" with "${Ngày bắt đầu}"
    And Enter date in "Ngày kết thúc" with "${Ngày kết thúc}"
    And Click "Lưu" button
    Then User look message "Cập nhật voucher thành công." popup

Edit_Voucher_23: Kiểm tra chỉnh sửa voucher thành công khi thay đổi "Điều kiện áp dụng"
    [Tags]    @Test_Edit_Voucher     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra hiển thị thông báo lỗi khi Mã voucher đã tồn tại và đang có hiệu lực
    When Go to edit voucher page
    And Click select "Hình thức khuyến mãi" with "Giảm tiền mặt"
    And Enter "cost" in "Giá trị" with "1000000"
    And Enter "cost" in "Điều kiện áp dụng" with "1000000"
    And Click "Lưu" button
    Then User look message "Cập nhật voucher thành công." popup

Edit_Voucher_24: Kiểm tra chỉnh sửa voucher thành công khi thay đổi "Mô tả"
    [Tags]    @Test_Edit_Voucher     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra hiển thị thông báo lỗi khi Mã voucher đã tồn tại và đang có hiệu lực
    When Go to edit voucher page
    And Enter "paragraph" in textarea "Mô tả" with "_RANDOM_"
    And Click "Lưu" button
    Then User look message "Cập nhật voucher thành công." popup

Edit_vocher_25: Kiểm tra chỉnh sửa trạng thái voucher thành "Hết hiệu lực"
    [Tags]    @Test_Edit_Voucher     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra chỉnh sửa trạng thái voucher thành "Hết hiệu lực"
    When Go to list voucher page
    And Search "Mã voucher" in "Mã voucher" with "Voucher01"
    And Click switch "Hành động" to be activated
    Then User look message "Ngừng hoạt động thành công!" popup

Edit_vocher_26: Kiểm tra chỉnh sửa trạng thái voucher thành "Đang hiệu lực"
    [Tags]    @Test_Edit_Voucher     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra chỉnh sửa trạng thái voucher thành "Đang hiệu lực"
    When Go to list voucher page
    And Search "Mã voucher" in "Mã voucher" with "Voucher01"
    And Click switch "Hành động" to be activated
    Then User look message "Kích hoạt thành công!" popup

*** Keywords ***
Preconditions
  Set Browser Timeout         ${BROWSER_TIMEOUT}
  New Browser                 ${BROWSER}  headless=${HEADLESS}
  New Page                    ${URL_DEFAULT}
  ${STATE}                    Evaluate  json.loads('''{}''')  json
  Login to Supplier

Go to ${name} voucher page
    When Click "Quản lý khuyến mãi" menu
    And Click "Quản lý voucher" sub menu
    IF  '${name}' == 'create'
        And Click "Thêm mới" button
    ELSE IF  '${name}' == 'edit'
        And Select voucher need to edit
    END

Select voucher need to edit
    Search "text" in "Mã voucher" with "Voucher178"
    ${element}    Set Variable   //button[contains(text(),'Voucher178')]
    Click         ${element}        left        2

Delete select text in "${field}"
    ${elements}       Get Element    xpath=//span[contains(@class, "ant-select-clear")]
    Wait Until Element Is Visible       ${elements}
    Click                               ${elements}

Enter default information when create voucher
    And Enter "Mã voucher" in "Mã Voucher" with "_RANDOM_"
    And Enter date in "Ngày bắt đầu" with "${Ngày bắt đầu}"
    And Enter date in "Ngày kết thúc" with "${Ngày kết thúc}"
    And Enter "điều kiện" in "Điều kiện áp dụng" with "_RANDOM_"
    And Enter "số lượng" in "Tổng số phát hành" with "_RANDOM_"
    And Enter "paragraph" in textarea "Mô tả" with "_RANDOM_"

Show list of "${name}"
    Sleep       1
    Wait Until Element Spin
    ${elements}=        Get Elements        xpath=//*[contains(@class, "ant-table-row")]
    Run Keyword If    ${elements}     Display     ${name}     ${elements}
    ...    ELSE    Log To Console     Không tồn tại ${name} nào!
Display
    [Arguments]    ${name}    ${elements}
    Log To Console    ${EMPTY}
    Log To Console    *************************Show List of ${name}**************************
    Wait Until Element Is Visible         ${elements}[0]
    ${count}=           Set Variable        2
    ${stt}=             Set Variable        1
    FOR  ${i}  IN  @{elements}
       ${Mã voucher}        Get Text          //tbody[contains(@class, "ant-table-tbody")]/tr[${count}]/td[1]
       ${Mô tả}             Get Text          //tbody[contains(@class, "ant-table-tbody")]/tr[${count}]/td[2]
       ${HTKM}              Get Text          //tbody[contains(@class, "ant-table-tbody")]/tr[${count}]/td[3]
       ${Giá trị}           Get Text          //tbody[contains(@class, "ant-table-tbody")]/tr[${count}]/td[4]
       ${start date}        Get Text          //tbody[contains(@class, "ant-table-tbody")]/tr[${count}]/td[5]
       ${end date}          Get Text          //tbody[contains(@class, "ant-table-tbody")]/tr[${count}]/td[6]
       ${ĐKAD}              Get Text          //tbody[contains(@class, "ant-table-tbody")]/tr[${count}]/td[7]
       ${TSPH}              Get Text          //tbody[contains(@class, "ant-table-tbody")]/tr[${count}]/td[8]
       ${SLCL}              Get Text          //tbody[contains(@class, "ant-table-tbody")]/tr[${count}]/td[9]
       ${Trạng thái}        Get Text          //tbody[contains(@class, "ant-table-tbody")]/tr[${count}]/td[10]
       Log To Console    ${stt}. Mã voucher: ${Mã voucher} || Mô tả: ${Mô tả} || Hình thức KM: ${HTKM} || Giá trị: ${Giá trị} || Ngày bắt đầu: ${start date} || Ngày kết thúc: ${end date} || Điều kiện áp dụng: ${ĐKAD} || Tổng số phát hành: ${TSPH} || Số lượng còn lại: ${SLCL} || Trạng thái: ${Trạng thái}
       Log To Console    -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
       ${count}=    Evaluate    ${count} + 1
       ${stt}=    Evaluate    ${stt} + 1
    END
    ${total}=    Evaluate    ${count} - 2
    Log To Console    Tổng số lượng ${name} là: ${total}

Click select "${name}" field with "${text}"
  ${text}=                  Get Random Text                   Text                          ${text}
  ${element}=               Get Element                      //input[@id='rc_select_0']
  Click                ${element}
  Wait Until Element Spin
  ${element}=             Get Element      xpath=//*[contains(@class, "ant-select-item-option") and @title="${text}"]
  Click                     ${element}

Enter date in "${name}" field with "${text}"
  ${text}=                  Get Random Text                   dd/mm/yyyy                          ${text}
  ${elements}=               Get Elements                       //*[contains(@class, "ant-picker-input")]/input
  IF  '${name}' == 'Từ ngày'
      ${element}            Set Variable             ${elements}[0]
  ELSE IF  '${name}' == 'Đến ngày'
      ${element}            Set Variable             ${elements}[1]
  END
  Click                     ${element}
  Clear Text                ${element}
  Fill Text                 ${element}                        ${text}
  Press Keys                ${element}                        Enter
