*** Settings ***
Resource            ../keywords/common.robot

Test Setup          Preconditions
Test Teardown       Tear Down

*** Variables ***
${Mã nhập hàng}     RNSTR12372023091802

*** Test Cases ***
####=============================================TRẢ HÀNG THEO PHIẾU NHẬP HÀNG==========================================
Create_Goods_Return_01: Xác minh rằng có thể điều hướng thành công đến trang "Trả hàng"
    [Tags]    @Test_Create_Goods_Return     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh rằng có thể điều hướng thành công đến trang "Trả hàng"
    When Click "Quản lý kho" menu
    And Click "Trả hàng" sub menu
    And Click "Thêm mới" button
    Then User look title "Trả Hàng"
    And User look contains title is "Trả hàng"

####----------------------------------------------VALIDATION TEXT-------------------------------------------------------
Create_Goods_Return_02: Xác minh rằng hiển thị validation text khi bỏ trống trường "Thời gian trả hàng"
    [Tags]    @Test_Create_Goods_Return     @Test_by_Hồ_Văn_Nhật       @Test_Case_Failed
    [Documentation]     Xác minh rằng hiển thị validation text khi bỏ trống trường "Thời gian trả hàng"
    When Go to create Goods return page
    And Enter "Mã nhập hàng" in "Mã nhập hàng" field with "${Mã nhập hàng}"
    And Delete date text in "Thời gian trả hàng" field
    Then Required message in "Thời gian trả hàng" field displayed under with "Thời gian trả hàng là bắt buộc"

Create_Goods_Return_03: Xác minh rằng hiển thị validation text khi bỏ trống trường "Lý do trả hàng"
    [Tags]    @Test_Create_Goods_Return     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh rằng hiển thị validation text khi bỏ trống trường "Lý do trả hàng"
    When Go to create Goods return page
    And Enter "Mã nhập hàng" in "Mã nhập hàng" field with "${Mã nhập hàng}"
    And Enter "test name" in "Lý do trả hàng" field with "_RANDOM_"
    And Enter "test name" in "Lý do trả hàng" field with "${EMPTY}"
    Then Required message in "Lý do trả hàng" field displayed under with "Lý do trả hàng là bắt buộc."

Create_Goods_Return_04: Xác minh rằng hiển thị validation text khi bỏ trống trường "Đơn giá (VND)"
    [Tags]    @Test_Create_Goods_Return     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh rằng hiển thị validation text khi bỏ trống trường "Đơn giá (VND)"
    When Go to create Goods return page
    And Enter "Mã nhập hàng" in "Mã nhập hàng" field with "${Mã nhập hàng}"
    And Enter "cost" in "Đơn giá (VND)" field with "${EMPTY}"
    Then Required message in "Đơn giá (VND)" field displayed under with "Đơn giá là bắt buộc"

Create_Goods_Return_05: Xác minh rằng hiển thị validation text khi nhập "SL trả" lớn hơn "Số lượng"
    [Tags]    @Test_Create_Goods_Return     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh rằng hiển thị validation text khi nhập "SL trả" lớn hơn "Số lượng"
    When Go to create Goods return page
    And Enter "Mã nhập hàng" in "Mã nhập hàng" field with "${Mã nhập hàng}"
    And Enter "SL trả > Số lượng" in "SL trả" field with "_RANDOM_"
    Then Required message in "SL trả" field displayed under with "SL trả nhỏ hơn hoặc bằng SL nhập là 10"

Create_Goods_Return_06: Xác minh rằng hiển thị validation text khi bỏ trống trường "Thời gian trả hàng" - Trả hàng không theo phiếu nhập hàng
    [Tags]    @Test_Create_Goods_Return     @Test_by_Hồ_Văn_Nhật      @Test_Case_Failed
    [Documentation]     Xác minh rằng hiển thị validation text khi bỏ trống trường "Thời gian trả hàng" - Trả hàng không theo phiếu nhập hàng
    When Go to create Goods return page
    And Click radio button with "Trả hàng không theo phiếu nhập hàng"
    And Delete date text in "Thời gian trả hàng" field
    Then Required message in "Thời gian trả hàng" field displayed under with "Thời gian trả hàng là bắt buộc"

Create_Goods_Return_07: Xác minh rằng hiển thị validation text khi bỏ trống trường "Lý do trả hàng" - Trả hàng không theo phiếu nhập hàng
    [Tags]    @Test_Create_Goods_Return     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh rằng hiển thị validation text khi bỏ trống trường "Lý do trả hàng" - Trả hàng không theo phiếu nhập hàng
    When Go to create Goods return page
    And Click radio button with "Trả hàng không theo phiếu nhập hàng"
    And Enter "test name" in "Lý do trả hàng" field with "_RANDOM_"
    And Enter "test name" in "Lý do trả hàng" field with "${EMPTY}"
    Then Required message in "Lý do trả hàng" field displayed under with "Lý do trả hàng là bắt buộc."

Create_Goods_Return_08: Xác minh rằng hiển thị validation text khi bỏ trống trường "Đơn giá (VND)" - Trả hàng không theo phiếu nhập hàng
    [Tags]    @Test_Create_Goods_Return     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh rằng hiển thị validation text khi bỏ trống trường "Đơn giá (VND)" - Trả hàng không theo phiếu nhập hàng
    When Go to create Goods return page
    And Click radio button with "Trả hàng không theo phiếu nhập hàng"
    And Click select in "Đối tác" field with "Balance"
    And Click select in "Nhà cung cấp" field with "Siêu thị Big C Huế"
    And Enter "test name" in "Lý do trả hàng" field with "_RANDOM_"
    And Add product with "Iphone 13 pro max"
    And Enter "cost" in "Đơn giá (VND)" field with "${EMPTY}"
    Then Required message in "Đơn giá (VND)" field displayed under with "Đơn giá là bắt buộc"

####-----------------------------------------ERROR MESSAGE--------------------------------------------------------------
Create_Goods_Return_09: Xác minh rằng hiển thị thông báo lỗi khi không nhập "SL trả"
    [Tags]    @Test_Create_Goods_Return     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh rằng hiển thị thông báo lỗi khi không nhập "SL trả"
    When Go to create Goods return page
    And Enter "Mã nhập hàng" in "Mã nhập hàng" field with "${Mã nhập hàng}"
    And Enter "test name" in "Lý do trả hàng" field with "_RANDOM_"
    And Click "Lưu" button
    Then User look message "Vui lòng nhập số lượng cho ít nhất một sản phẩm" popup

Create_Goods_Return_10: Xác minh rằng hiển thị thông báo lỗi khi Đơn trả hàng với mã nhập hàng này đang xử lý
    [Tags]    @Test_Create_Goods_Return     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh rằng hiển thị thông báo lỗi khi Đơn trả hàng với mã nhập hàng này đang xử lý
    When Go to create Goods return page
    And Enter "Mã nhập hàng" in "Mã nhập hàng" field with "RNSTR12372023082201"
    Then User look message "Đơn trả hàng với mã nhập hàng này đang xử lý. Vui lòng hoàn tất để thực hiện đơn trả hàng tiếp theo" popup

Create_Goods_Return_11: Xác minh rằng hiển thị thông báo lỗi khi không nhập "SL trả" - Trả hàng không theo phiếu nhập hàng
    [Tags]    @Test_Create_Goods_Return     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh rằng hiển thị thông báo lỗi khi không nhập "SL trả" - Trả hàng không theo phiếu nhập hàng
    When Go to create Goods return page
    And Click radio button with "Trả hàng không theo phiếu nhập hàng"
    And Click select in "Đối tác" field with "Balance"
    And Click select in "Nhà cung cấp" field with "Siêu thị Big C Huế"
    And Enter "test name" in "Lý do trả hàng" field with "_RANDOM_"
    And Add product with "Iphone 13 pro max"
    And Enter "number" in "SL trả" field with "0"
    And Click "Lưu" button
    Then User look message "Vui lòng nhập số lượng cho ít nhất một sản phẩm" popup

Create_Goods_Return_12: Xác minh rằng hiển thị thông báo lỗi khi không nhập "SL trả" lớn hơn 999999 - Trả hàng không theo phiếu nhập hàng
    [Tags]    @Test_Create_Goods_Return     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh rằng hiển thị thông báo lỗi khi không nhập "SL trả" lớn hơn 999999 - Trả hàng không theo phiếu nhập hàng
    When Go to create Goods return page
    And Click radio button with "Trả hàng không theo phiếu nhập hàng"
    And Click select in "Đối tác" field with "Balance"
    And Click select in "Nhà cung cấp" field with "Siêu thị Big C Huế"
    And Enter "test name" in "Lý do trả hàng" field with "_RANDOM_"
    And Add product with "Iphone 13 pro max"
    And Enter "number > 999999" in "SL trả" field with "_RANDOM_"
    And Click "Lưu" button
    And Click on "Đồng ý" button
    Then User look message "Vui lòng nhập tối đa 999999" popup

####-----------------------------CREATE GOODS RETURN SUCCESSFULL--------------------------------------------------------
Create_Goods_Return_13: Xác minh rằng hiển thị thông báo thành công khi tạo mới đơn trả hàng theo phiếu nhập hàng
    [Tags]    @Test_Create_Goods_Return     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh rằng hiển thị thông báo thành công khi tạo mới đơn trả hàng theo phiếu nhập hàng
    When Go to create Goods return page
    And Enter "Mã nhập hàng" in "Mã nhập hàng" field with "${Mã nhập hàng}"
    And Enter "test name" in "Lý do trả hàng" field with "_RANDOM_"
    And Enter "SL trả = Số lượng" in "SL trả" field with "_RANDOM_"
    And Click "Lưu" button
    Then User look message "Tạo trả hàng thành công." popup
    When Select Goods return need to delete
    And Click "Xóa" button
    And Click Verify To Action
    Then User look message "Xoá trả hàng thành công." popup

Create_Goods_Return_14: Xác minh rằng hiển thị thông báo thành công khi tạo mới đơn trả hàng không theo phiếu nhập hàng
    [Tags]    @Test_Create_Goods_Return     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh rằng hiển thị thông báo thành công khi tạo mới đơn trả hàng không theo phiếu nhập hàng
    When Go to create Goods return page
    And Click radio button with "Trả hàng không theo phiếu nhập hàng"
    And Click select in "Đối tác" field with "Balance"
    And Click select in "Nhà cung cấp" field with "Siêu thị Big C Huế"
    And Enter "test name" in "Lý do trả hàng" field with "_RANDOM_"
    And Add product with "Iphone 13 pro max"
    And Enter "Số lượng" in "SL trả" field with "1"
    And Click "Lưu" button
    And Click Verify To Action
    Then User look message "Tạo trả hàng thành công." popup
    When Select Goods return need to delete
    And Click "Xóa" button
    And Click Verify To Action
    Then User look message "Xoá trả hàng thành công." popup

Create_Goods_Return_15: Xác minh rằng hiển thị thông báo thành công khi tạo mới đơn trả hàng không theo phiếu nhập hàng và "Không áp dụng thuế"
    [Tags]    @Test_Create_Goods_Return     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh rằng hiển thị thông báo thành công khi tạo mới đơn trả hàng không theo phiếu nhập hàng và "Không áp dụng thuế"
    When Go to create Goods return page
    And Click radio button with "Trả hàng không theo phiếu nhập hàng"
    And Click select in "Đối tác" field with "Balance"
    And Click select in "Nhà cung cấp" field with "Siêu thị Big C Huế"
    And Enter "test name" in "Lý do trả hàng" field with "_RANDOM_"
    And Click select in "Thuế" field with "Không áp dụng thuế"
    And Add product with "Iphone 13 pro max"
    And Enter "Số lượng" in "SL trả" field with "1"
    And Click "Lưu" button
    And Click Verify To Action
    Then User look message "Tạo trả hàng thành công." popup
    When Select Goods return need to delete
    And Click "Xóa" button
    And Click Verify To Action
    Then User look message "Xoá trả hàng thành công." popup

####===========================================VIEW LIST OF GOODS RETURN================================================
Create_Goods_Return_16: Xác minh rằng có thể hiển thị danh sách đơn "Trả hàng"
    [Tags]    @Test_Create_Goods_Return     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh rằng có thể hiển thị danh sách đơn "Trả hàng"
    When Go to list Goods return page
    Then View list of "Goods Return"

Create_Goods_Return_17: Xác minh rằng có thể hiển thị danh sách đơn trả hàng khi tìm kiếm với "Mã trả hàng" hợp lệ
    [Tags]    @Test_Create_Goods_Return     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh rằng có thể hiển thị danh sách đơn trả hàng khi tìm kiếm với "Mã trả hàng" hợp lệ
    When Go to list Goods return page
    And Search "Mã trả hàng" in "Mã trả hàng" with "GRNSTR123720230930001"
    Then View list of "Goods Return"

Create_Goods_Return_18: Xác minh rằng không hiển thị danh sách đơn trả hàng khi tìm kiếm với "Mã trả hàng" không hợp lệ
    [Tags]    @Test_Create_Goods_Return     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh rằng không hiển thị danh sách đơn trả hàng khi tìm kiếm với "Mã trả hàng" không hợp lệ
    When Go to list Goods return page
    And Search "Mã trả hàng" in "Mã trả hàng" with "_RANDOM_"
    Then No Goods_Return are shown

Create_Goods_Return_19: Xác minh rằng có thể hiển thị danh sách đơn trả hàng với trang thái "Đang xử lý"
    [Tags]    @Test_Create_Goods_Return     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh rằng có thể hiển thị danh sách đơn trả hàng với trang thái "Đang xử lý"
    When Go to list Goods return page
    And Click select in "Chọn trạng thái" field with "Đang xử lý"
    Then View list of "Goods Return"

Create_Goods_Return_20: Xác minh rằng có thể hiển thị danh sách đơn trả hàng với trang thái "Đã hoàn tất"
    [Tags]    @Test_Create_Goods_Return     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh rằng có thể hiển thị danh sách đơn trả hàng với trang thái "Đã hoàn tất"
    When Go to list Goods return page
    And Click select in "Chọn trạng thái" field with "Đã hoàn tất"
    Then View list of "Goods Return"

Create_Goods_Return_21: Xác minh rằng có thể hiển thị danh sách đơn trả hàng theo nhà cung cấp là "Siêu thị Big C Huế"
    [Tags]    @Test_Create_Goods_Return     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh rằng có thể hiển thị danh sách đơn trả hàng theo nhà cung cấp là "Siêu thị Big C Huế"
    When Go to list Goods return page
    And Click select in "Chọn nhà cung cấp" field with "Siêu thị Big C Huế"
    Then View list of "Goods Return"

Create_Goods_Return_22: Xác minh rằng có thể hiển thị danh sách đơn trả hàng theo nhà cung cấp là "Nhà cung cấp Ben"
    [Tags]    @Test_Create_Goods_Return     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh rằng có thể hiển thị danh sách đơn trả hàng theo nhà cung cấp là "Nhà cung cấp Ben"
    When Go to list Goods return page
    And Click select in "Chọn nhà cung cấp" field with "Nhà cung cấp Ben"
    Then View list of "Goods Return"

Create_Goods_Return_23: Xác minh rằng có thể hiển thị danh sách đơn trả hàng theo thời gian nhập hàng
    [Tags]    @Test_Create_Goods_Return     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh rằng có thể hiển thị danh sách đơn trả hàng theo thời gian nhập hàng
    When Go to list Goods return page
    And Enter date in "Từ ngày" field with "04/09/2023"
    And Enter date in "Đến ngày" field with "01/10/2023"
    Then View list of "Goods Return"

Create_Goods_Return_24: Xác minh rằng có thể xem danh sách đơn trả hàng trang kế tiếp, trước trước, trang cuối cùng, trang đầu tiên
    [Tags]    @Test_Edit_Goods_Return     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh rằng có thể xem danh sách đơn trả hàng trang kế tiếp, trước trước, trang cuối cùng, trang đầu tiên
    When Go to list Goods return page
    And Click ">" to "next" page
    Then View list of "Goods Return"
    And Click "<" to "prev" page
    Then View list of "Goods Return"
    And Click ">>" to "next_all" page
    Then View list of "Goods Return"
    And Click "<<" to "prev_all" page
    Then View list of "Goods Return"

####=======================================EDIT GOODS RETURN============================================================
Edit_Goods_Return_01: Xác minh rằng có thể điều hướng thành công đến trang chỉnh sửa đơn "Trả hàng"
    [Tags]    @Test_Edit_Goods_Return     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh rằng có thể điều hướng thành công đến trang "Trả hàng"
    When Click "Quản lý kho" menu
    And Click "Trả hàng" sub menu
    And Select Goods return need to edit
    And Click "Chỉnh sửa" button
    Then User look title "Trả Hàng"
    And User look contains title is "Trả hàng"

####----------------------------------------------VALIDATION TEXT-------------------------------------------------------
Edit_Goods_Return_02: Xác minh rằng hiển thị validation text khi bỏ trống trường "Thời gian trả hàng"
    [Tags]    @Test_Edit_Goods_Return     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh rằng hiển thị validation text khi bỏ trống trường "Thời gian trả hàng"
    When Go to edit Goods return page
    And Delete date text in "Thời gian trả hàng" field
    Then Required message in "Thời gian trả hàng" field displayed under with "Thời gian trả hàng là bắt buộc"

Edit_Goods_Return_03: Xác minh rằng hiển thị validation text khi bỏ trống trường "Lý do trả hàng"
    [Tags]    @Test_Edit_Goods_Return     @Test_by_Hồ_Văn_Nhật      @Test_Case_Failed
    [Documentation]     Xác minh rằng hiển thị validation text khi bỏ trống trường "Lý do trả hàng"
    When Go to edit Goods return page
    And Enter "test name" in "Lý do trả hàng" field with "${EMPTY}"
    Then Required message in "Lý do trả hàng" field displayed under with "Lý do trả hàng là bắt buộc."

Edit_Goods_Return_04: Xác minh rằng hiển thị validation text khi bỏ trống trường "Đơn giá (VND)"
    [Tags]    @Test_Edit_Goods_Return     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh rằng hiển thị validation text khi bỏ trống trường "Đơn giá (VND)"
    When Go to edit Goods return page
    And Enter "cost" in "Đơn giá (VND)" field with "${EMPTY}"
    Then Required message in "Đơn giá (VND)" field displayed under with "Đơn giá là bắt buộc"

Edit_Goods_Return_05: Xác minh rằng hiển thị validation text khi không nhập "SL trả" lớn hơn "Số lượng" hoặc lớn hơn 100
    [Tags]    @Test_Edit_Goods_Return     @Test_by_Hồ_Văn_Nhật
    [Documentation]    Xác minh rằng hiển thị validation text khi không nhập "SL trả" lớn hơn "Số lượng" hoặc lớn hơn 100
    When Go to list Goods return page
    And Search "Mã trả hàng" in "Mã trả hàng" with "GRNSTR123720231002004"
    And Select Goods return need to edit
    And Click "Chỉnh sửa" button
    And Enter "cost" in "SL trả" field with "_RANDOM_"
    Then Required message in "SL trả" field displayed under with "SL trả nhỏ hơn hoặc bằng SL nhập là 100"

####-----------------------------------------ERROR MESSAGE--------------------------------------------------------------
Edit_Goods_Return_06: Xác minh rằng hiển thị thông báo lỗi khi không nhập "SL trả"
    [Tags]    @Test_Edit_Goods_Return     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh rằng hiển thị thông báo lỗi khi không nhập "SL trả"
    When Go to edit Goods return page
    And Enter "number" in "SL trả" field with "${EMPTY}"
    And Click "Lưu" button
    Then User look message "Vui lòng nhập số lượng cho ít nhất một sản phẩm" popup

Edit_Goods_Return_07: Xác minh rằng hiển thị thông báo lỗi khi không nhập "SL trả" lớn hơn 999999
    [Tags]    @Test_Edit_Goods_Return     @Test_by_Hồ_Văn_Nhật      @Test_Case_Failed
    [Documentation]     Xác minh rằng hiển thị thông báo lỗi khi không nhập "SL trả"
    When Go to edit Goods return page
    And Enter "number > 999999" in "SL trả" field with "_RANDOM_"
    And Click "Lưu" button
    And Click Verify To Action
    Then User look message "Vui lòng nhập tối đa 999999" popup

####-----------------------------EDIT GOODS RETURN SUCCESSFULL--------------------------------------------------------
Edit_Goods_Return_08: Xác minh rằng hiển thị thông báo chỉnh sửa đơn trả hàng thành công khi thay đổi "Thời gian trả hàng"
    [Tags]    @Test_Edit_Goods_Return     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh rằng hiển thị thông báo chỉnh sửa đơn trả hàng thành công khi thay đổi "Thời gian trả hàng"
    When Go to edit Goods return page
    And Enter date in "Thời gian trả hàng" field with "_RANDOM_"
    And Click "Lưu" button
    Then User look message "Chỉnh sửa trả hàng thành công." popup

Edit_Goods_Return_09: Xác minh rằng hiển thị thông báo chỉnh sửa đơn trả hàng thành công khi thay đổi "Lý do trả hàng"
    [Tags]    @Test_Edit_Goods_Return     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh rằng hiển thị thông báo chỉnh sửa đơn trả hàng thành công khi thay đổi "Lý do trả hàng"
    When Go to edit Goods return page
    And Enter "test name" in "Lý do trả hàng" field with "_RANDOM_"
    And Click "Lưu" button
    Then User look message "Chỉnh sửa trả hàng thành công." popup

Edit_Goods_Return_10: Xác minh rằng hiển thị thông báo chỉnh sửa đơn trả hàng thành công khi thay đổi "Đơn giá (VND)"
    [Tags]    @Test_Edit_Goods_Return     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh rằng hiển thị thông báo chỉnh sửa đơn trả hàng thành công khi thay đổi "Đơn giá (VND)"
    When Go to edit Goods return page
    And Enter "cost" in "Đơn giá (VND)" field with "_RANDOM_"
    And Click "Lưu" button
    Then User look message "Chỉnh sửa trả hàng thành công." popup

Edit_Goods_Return_11: Xác minh rằng hiển thị thông báo chỉnh sửa đơn trả hàng thành công khi thay đổi "SL trả"
    [Tags]    @Test_Edit_Goods_Return     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Xác minh rằng hiển thị thông báo chỉnh sửa đơn trả hàng thành công khi thay đổi "SL trả"
    When Go to edit Goods return page
    And Enter "number" in "SL trả" field with "1"
    And Click "Lưu" button
    Then User look message "Chỉnh sửa trả hàng thành công." popup

Edit_Goods_Return_12: Xác minh rằng hiển thị thông báo "Tạo phiếu trả hàng thành công."
    [Tags]    @Test_Edit_Goods_Return     @Test_by_Hồ_Văn_Nhật
    [Documentation]    Xác minh rằng hiển thị thông báo "Tạo phiếu trả hàng thành công."
    When Go to list Goods return page
    And Select Goods return need to change_status
    And Click "Xuất phiếu trả hàng" button
    Then User look message "Tạo phiếu trả hàng thành công." popup

*** Keywords ***
Preconditions
  Set Browser Timeout         ${BROWSER_TIMEOUT}
  New Browser                 ${BROWSER}  headless=${HEADLESS}
  New Page                    ${URL_DEFAULT}
  ${STATE}                    Evaluate  json.loads('''{}''')  json
  Login to Store

Go to ${name} Goods return page
    When Click "Quản lý kho" menu
    And Click "Trả hàng" sub menu
    And Delete date text in "Từ ngày" field
    And Delete date text in "Đến ngày" field
    IF  '${name}' == 'create'
      And Click "Thêm mới" button
    ELSE IF  '${name}' == 'edit'
      And Select Goods return need to edit
      And Click "Chỉnh sửa" button
    END

Click on "${name}" button
    Click     //*[contains(text(),'${name}')]

Click radio button with "${text}"
    ${element}          Set Variable        //span[contains(text(),'${text}')]
    Wait Until Element Is Visible           ${element}
    Click                                   ${element}

Enter "${type}" in "${name}" field with "${text}"
    ${text}=              Get Random Text                     ${type}                       ${text}
    IF    '${name}' == 'Đơn giá (VND)'
        ${element}          Set Variable            //input[@placeholder='Đơn giá']
    ELSE IF    '${name}' == 'SL trả'
        ${element}          Set Variable            //input[@placeholder='Nhập SL']
    ELSE IF    '${name}' != 'SL trả'
        ${element}=           Get Element Form Item By Label      ${name}        //input[contains(@class, "ant-input")]
    END
    Wait Until Element Is Visible        ${element}
    Clear Text                           ${element}
    IF    '${type}' == 'SL trả = Số lượng'
        ${temp}             Get Elements            //h5[contains(@class, "text-sm")]
        ${Số lượng}         Get Text                ${temp}[2]
        ${SL trả > Số lượng}=       Evaluate        ${Số lượng} + 1
        Type Text             ${element}          ${Số lượng}
    ELSE IF    '${type}' == 'SL trả > Số lượng'
        ${temp}             Get Elements            //h5[contains(@class, "text-sm")]
        ${Số lượng}         Get Text                ${temp}[2]
        ${SL trả > Số lượng}=       Evaluate        ${Số lượng} + 1
        Type Text             ${element}          ${SL trả > Số lượng}
    ELSE IF    '${type}' != 'SL trả > Số lượng'
        Type Text             ${element}          ${text}
    END
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
    IF    '${name}' == 'Thuế'
        ${element}                 Set Variable      //span[contains(text(),'Áp dụng thuế')]
    ELSE IF    '${name}' == 'Chọn trạng thái'
        ${element}=               Set Variable       ${elements}[0]
    ELSE IF    '${name}' == 'Chọn nhà cung cấp'
        ${element}=               Set Variable       ${elements}[1]
    ELSE IF    '${name}' != 'Thuế'
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

Select Goods return need to ${name}
    ${element}        Get Elements          //div[contains(text(),'Đang xử lý')]
    Click             ${element}[0]         left          2

Add product with "${text}"
    When Click on "Thêm sản phẩm" button
    And Search "name product" in "Tìm kiếm" with "${text}"
    ${element}        Set Variable        //*[contains(@class, 'top-[10px]')]
    Wait Until Element Is Visible         ${element}
    Click                                 ${element}
    And Click "Thêm" button
    And Click "Đóng" button

Required message in "${name}" field displayed under with "${text}"
    ${element}=               Get Element         //*[contains(@class, "ant-form-item-explain-error")]
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
    ...    ELSE    Log To Console     Không tồn tại đơn trả hàng nào ứng với từ khóa tìm kiếm!

Display
    [Arguments]    ${elements}
    Log To Console    ${EMPTY}
    Log To Console    ***************************************************************-DANH SÁCH ĐƠN TRẢ HÀNG-***************************************************************
    Wait Until Element Is Visible         ${elements}[0]
    ${count}=           Set Variable        1
    ${stt}=             Set Variable        1
    FOR  ${i}  IN  @{elements}
        ${Mã trả hàng}            Get Text    //tbody[contains(@class, "ant-table-tbody")]/tr[${count}]/td[1]
        ${Nhà cung cấp}           Get Text    //tbody[contains(@class, "ant-table-tbody")]/tr[${count}]/td[2]
        ${Phiếu nhập}             Get Text    //tbody[contains(@class, "ant-table-tbody")]/tr[${count}]/td[3]
        ${Tổng tiền (VND)}        Get Text    //tbody[contains(@class, "ant-table-tbody")]/tr[${count}]/td[4]
        ${Ngày trả hàng}          Get Text    //tbody[contains(@class, "ant-table-tbody")]/tr[${count}]/td[5]
        ${Trạng thái}             Get Text    //tbody[contains(@class, "ant-table-tbody")]/tr[${count}]/td[6]
        Log To Console    ${stt}. Mã trả hàng: ${Mã trả hàng} || Nhà cung cấp: ${Nhà cung cấp} || Phiếu nhập: ${Phiếu nhập} || Tổng tiền (VND): ${Tổng tiền (VND)} || Ngày trả hàng: ${Ngày trả hàng} || Trạng thái: ${Trạng thái}
        Log To Console    -------------------------------------------------------------------------------------------------------------------------------------------------------------
        ${count}=    Evaluate    ${count} + 1
        ${stt}=    Evaluate    ${stt} + 1
    END
    ${total}=    Evaluate    ${count} - 1
    Log To Console    Tổng số lượng đơn trả hàng là: ${total} đơn
