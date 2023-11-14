*** Settings ***
Resource            ../keywords/common.robot
Test Setup          Preconditions
Test Teardown       Tear Down

*** Test Cases ***
###======================NAVIGATE TO THE REQUEST MORE PRODUCT PAGE============================================
Store_Create_Product_Request_01: Kiểm tra điều hướng đến trang "Yêu cầu thêm sản phẩm" thành công
    [Tags]    @Test_Store_Create_Product_Request     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra điều hướng đến trang "Yêu cầu thêm sản phẩm" thành công
    Login to Store
    When Click "Quản lý kết nối" menu
    And Click "Kết nối" sub menu
    And Click "Thêm yêu cầu" button
    Then User look title "Quản Lý Kết Nối"
    And User look contains title is "Yêu cầu thêm sản phẩm"

##========================VALIDATION TEXT==============================================================
Store_Create_Product_Request_02: Kiểm tra Validation text trường "Tên sản phẩm" khi không nhập "Tên sản phẩm"
    [Tags]    @Test_Store_Create_Product_Request     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation text trường "Tên sản phẩm" khi không nhập "Tên sản phẩm"
    When Go to create Product Request page
    And Enter "text" in "Tên sản phẩm" with "${empty}"
    And Click in textarea "Yêu cầu chi tiết về sản phẩm" field
    Then Required message "Tên sản phẩm" displayed under "Xin vui lòng nhập tên sản phẩm" field

Store_Create_Product_Request_03: Kiểm tra Validation text trường "Yêu cầu chi tiết về sản phẩm" khi nhập quá 500 ký tự
    [Tags]    @Test_Store_Create_Product_Request     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation text trường "Yêu cầu chi tiết về sản phẩm" khi nhập quá 500 ký tự
    When Go to create Product Request page
    And Enter "word" in textarea "Yêu cầu chi tiết về sản phẩm" with "_RANDOM_"
    And Click in "Tên sản phẩm" field
    Then Required message "Yêu cầu chi tiết về sản phẩm" displayed under "Chỉ được nhập tối đa 500 kí tự" field

##=======================CREATE REQUEST PRODUCT SUCCESSFULL=======================================
Store_Create_Product_Request_04: Kiểm tra tạo mới "Yêu cầu thêm sản phẩm" thành công khi bỏ trống "Yêu cầu chi tiết về sản phẩm"
    [Tags]    @Test_Store_Create_Product_Request     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra tạo mới "Yêu cầu thêm sản phẩm" thành công khi bỏ trống "Yêu cầu chi tiết về sản phẩm"
    When Go to create Product Request page
    And Enter "Tên sản phẩm" in "Tên sản phẩm" with "Điện thoại thông minh"
    And Click "Yêu cầu sản phẩm" button
    Then User look message "Yêu cầu sản phẩm thành công. Quản trị viên sẽ xem xét yêu cầu của cửa hàng" popup

Store_Create_Product_Request_05: Kiểm tra tạo mới "Yêu cầu thêm sản phẩm" thành công khi nhập đầy đủ thông tin
    [Tags]    @Test_Store_Create_Product_Request     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra tạo mới "Yêu cầu thêm sản phẩm" thành công khi nhập đầy đủ thông tin
    When Go to create Product Request page
    And Enter "Tên sản phẩm" in "Tên sản phẩm" with "Điện thoại thông minh"
    And Enter "paragraph" in textarea "Yêu cầu chi tiết về sản phẩm" with "Hãng nào cũng được, chất lượng tốt là OK"
    And Click "Yêu cầu sản phẩm" button
    Then User look message "Yêu cầu sản phẩm thành công. Quản trị viên sẽ xem xét yêu cầu của cửa hàng" popup

##======================CANCEL CREATE REQUEST PRODUCT=============================================
Store_Create_Product_Request_06: Kiểm tra có thể hủy yêu cầu thêm sản phẩm khi click "Hủy" button
    [Tags]    @Test_Store_Create_Product_Request     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra có thể hủy yêu cầu thêm sản phẩm khi click "Hủy" button
    When Go to create Product Request page
    And Click "Hủy" button
    Then User look title "Quản Lý Kết Nối"
    And User look contains title is "Kết nối"

##=======================SEE DETAILS "YÊU CẦU THÊM SẢN PHẨM"=======================================
Store_Create_Product_Request_07: Kiểm tra có thể xem chi tiết "Yêu cầu thêm sản phẩm" với trạng thái "Chờ phê duyệt"
    [Tags]    @Test_Store_Create_Product_Request     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra có thể xem chi tiết "Yêu cầu thêm sản phẩm" với trạng thái "Chờ phê duyệt"
    When Go to create Product Request page
    And Search "Mã yêu cầu" in "Tìm kiếm" with "SRS0862"
    And Select product request with "Chờ phê duyệt"
    Then Show details product request with "Chờ phê duyệt"

Store_Create_Product_Request_08: Kiểm tra có thể xem chi tiết "Yêu cầu thêm sản phẩm" với trạng thái "Đã phê duyệt"
    [Tags]    @Test_Store_Create_Product_Request     @Test_by_Hồ_Văn_Nhật
    [Documentation]       Kiểm tra có thể xem chi tiết "Yêu cầu thêm sản phẩm" với trạng thái "Đã phê duyệt"
    When Go to create Product Request page
    And Search "Mã yêu cầu" in "Tìm kiếm" with "SRS0830"
    And Select product request with "Đã phê duyệt"
    Then Show details product request with "Đã phê duyệt"

Store_Create_Product_Request_09: Kiểm tra có thể xem chi tiết "Yêu cầu thêm sản phẩm" với trạng thái "Từ chối"
    [Tags]    @Test_Store_Create_Product_Request     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra có thể xem chi tiết "Yêu cầu thêm sản phẩm" với trạng thái "Từ chối"
    When Go to create Product Request page
    And Search "Mã yêu cầu" in "Tìm kiếm" with "SRS0861"
    And Select product request with "Từ chối"
    Then Show details product request with "Từ chối"

Store_Create_Product_Request_10: Kiểm tra có thể xem chi tiết "Yêu cầu thêm sản phẩm" với trạng thái "Chờ kết nối"
    [Tags]    @Test_Store_Create_Product_Request     @Test_by_Hồ_Văn_Nhật
    [Documentation]       Kiểm tra có thể xem chi tiết "Yêu cầu thêm sản phẩm" với trạng thái "Chờ kết nối"
    When Go to create Product Request page
    And Search "Mã yêu cầu" in "Tìm kiếm" with "SRS0879"
    And Select product request with "Chờ kết nối"
    Then Show details product request with "Chờ kết nối"

##========================NAVIGATE BACK TO LIST "YÊU CẦU THÊM SẢN PHẨM" PAGE FROM "CHI TIẾT KẾT NỐI" PAGE======================================
Store_Create_Product_Request_11: Kiểm tra có thể quay lại trang danh sách "Yêu cầu thêm sản phẩm" từ trang "Chi tiết yêu cầu thêm sản phẩm"
    [Tags]    @Test_Store_Create_Product_Request     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra có thể quay lại trang danh sách "Yêu cầu thêm sản phẩm" từ trang "Chi tiết yêu cầu thêm sản phẩm"
    When Go to create Product Request page
    And Search "Mã yêu cầu" in "Tìm kiếm" with "SRS0879"
    And Select product request with "Chờ kết nối"
    And Click "Trở về" button
    Then User look title "Quản Lý Kết Nối"
    And User look contains title is "Kết nối"

###===============================VIEW LIST OF REQUEST PRODUCT===================================================
Store_Create_Product_Request_12: Kiểm tra có thể xem danh sách "Yêu cầu thêm sản phẩm" đã được tạo
    [Tags]    @Test_Store_Create_Product_Request     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra có thể xem danh sách "Yêu cầu thêm sản phẩm" đã được tạo
    When Go to list Product Request page
    And Increase the number of products displayed with "40"
    Then Show list of "Product Requests" by Store

Store_Create_Product_Request_13: Kiểm tra hiển thị danh sách "Yêu cầu thêm sản phẩm" thành công khi tìm kiếm "Mã yêu cầu" hợp lệ
    [Tags]    @Test_Store_Create_Product_Request     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra hiển thị danh sách "Yêu cầu thêm sản phẩm" thành công khi tìm kiếm "Mã yêu cầu" hợp lệ
    When Go to list Product Request page
    And Search "Mã yêu cầu" in "Tìm kiếm" with "SRS0869"
    Then Show list of "Product Requests" by Store

Store_Create_Product_Request_14: Kiểm tra hiển thị danh sách "Yêu cầu thêm sản phẩm" thành công khi tìm kiếm "Tên sản phẩm" hợp lệ
    [Tags]    @Test_Store_Create_Product_Request     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra hiển thị danh sách "Yêu cầu thêm sản phẩm" thành công khi tìm kiếm "Tên sản phẩm" hợp lệ
    When Go to list Product Request page
    And Search "Tên sản phẩm" in "Tìm kiếm" with "Nước ép cam"
    Then Show list of "Product Requests" by Store

Store_Create_Product_Request_15: Kiểm tra hiển thị danh sách "Yêu cầu thêm sản phẩm" không thành công khi tìm kiếm với từ khóa không hợp lệ
    [Tags]    @Test_Store_Create_Product_Request     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra hiển thị danh sách "Yêu cầu thêm sản phẩm" không thành công khi tìm kiếm với từ khóa không hợp lệ
    When Go to list Product Request page
    And Search "Text" in "Tìm kiếm" with "_RANDOM_"
    Then No Product_Request are shown

Store_Create_Product_Request_16: Kiểm tra có thể xem danh sách yêu cầu trang kế tiếp, trước trước, 10 trang kế tiếp, 10 trang trước
    [Tags]    @Test_Store_Create_Product_Request     @Test_by_Hồ_Văn_Nhật
    [Documentation]       Kiểm tra có thể xem danh sách yêu cầu trang kế tiếp, trước trước, 10 trang kế tiếp, 10 trang trước
    When Go to list Product Request page
    And Click ">" to "next" page
    Then Show list of "Product Requests" by Store
    And Click "<" to "prev" page
    Then Show list of "Product Requests" by Store
    And Click ">>" to "next_all" page
    Then Show list of "Product Requests" by Store
    And Click "<<" to "prev_all" page
    Then Show list of "Product Requests" by Store

###===========================ADMIN APPROVE THE STORE OWNER REQUEST SUCCESSFULLY============================================================
Admin_Approve_Product_Request_01: Kiểm tra Admin có thể xóa "Danh sách nhà cung cấp" vừa được thêm vào "Yêu cầu thêm sản phẩm"
    [Tags]    @Test_Admin_Approve_Product_Request     @Test_by_Hồ_Văn_Nhật
    [Documentation]       Kiểm tra Admin có thể xóa "Danh sách nhà cung cấp" vừa được thêm vào "Yêu cầu thêm sản phẩm"
    When Go to approve product request page
    And Search "Mã yêu cầu" in "Tìm kiếm" with "SRS0862"
    And Select product request with "Chờ phê duyệt"
    And Click "Thêm nhà cung cấp" button
    And Search "supplier" in "Tìm kiếm sản phẩm" with "Bánh bao"
    And Select supplier with "Hoàng Dũng"
    And Click "Thêm nhà cung cấp" button when add_supplier
    Then User look message "Thêm nhà cung cấp thành công" popup
    And Delete the newly added supplier list
    Then User look message "Đã xóa đề xuất" popup

Admin_Approve_Product_Request_02: Kiểm tra Admin có thể phê duyệt "Yêu cầu thêm sản phẩm" của cửa hàng
    [Tags]    @Test_Admin_Approve_Product_Request     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Admin có thể phê duyệt "Yêu cầu thêm sản phẩm" của cửa hàng
    When Go to approve product request page
    And Search "Mã yêu cầu" in "Tìm kiếm" with "SRS0862"
    And Select product request with "Chờ phê duyệt"
    And Click "Thêm nhà cung cấp" button
    And Search "supplier" in "Tìm kiếm sản phẩm" with "Bánh bao"
    And Select supplier with "Hoàng Dũng"
    And Click "Thêm nhà cung cấp" button when add_supplier
    Then User look message "Thêm nhà cung cấp thành công" popup
    And Click "Phê duyệt yêu cầu" button
    Then User look message "Phê duyệt thành công" popup

Admin_Approve_Product_Request_03: Kiểm tra Admin có thể phê duyệt "Yêu cầu thêm sản phẩm" của cửa hàng khi thêm nhiều nhà cung cấp
    [Tags]    @Test_Admin_Approve_Product_Request     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Admin có thể phê duyệt "Yêu cầu thêm sản phẩm" của cửa hàng khi thêm nhiều nhà cung cấp
    When Go to approve product request page
    And Search "Mã yêu cầu" in "Tìm kiếm" with "SRS0863"
    And Select product request with "Chờ phê duyệt"
    And Click "Thêm nhà cung cấp" button
    And Search "supplier" in "Tìm kiếm sản phẩm" with "Nước ép"
    And Select supplier with "lananh"
    And Click "Thêm nhà cung cấp" button when add_supplier
    Then User look message "Thêm nhà cung cấp thành công" popup
    And Click "Phê duyệt yêu cầu" button
    Then User look message "Phê duyệt thành công" popup

##===========================ADMIN REFUSE THE STORE OWNER REQUEST SUCCESSFULLY============================================================
#=====================VALIDATION TEXT=========================================================
Admin_Approve_Product_Request_04: Kiểm tra Validation text khi không nhập "Lý do"
    [Tags]    @Test_Admin_Refuse_Product_Request     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation text khi không nhập "Lý do"
    When Go to approve product request page
    And Search "Mã yêu cầu" in "Tìm kiếm" with "SRS0864"
    And Select product request with "Chờ phê duyệt"
    And Click "Từ chối yêu cầu" button
    And Click "Gửi" button
    Then Required message "Lý do" displayed under "Xin vui lòng nhập lý do" field

Admin_Approve_Product_Request_05: Kiểm tra Validation text trường "Chi tiết" khi nhập quá 500 ký tự
    [Tags]    @Test_Admin_Refuse_Product_Request     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation text trường "Chi tiết" khi nhập quá 500 ký tự
    When Go to approve product request page
    And Search "Mã yêu cầu" in "Tìm kiếm" with "SRS0864"
    And Select product request with "Chờ phê duyệt"
    And Click "Từ chối yêu cầu" button
    And Enter "word" in textarea "Chi tiết" with "_RANDOM_"
    And Click select in "Lý do" field
    Then Required message "Chi tiết" displayed under "Chỉ được nhập tối đa 500 kí tự" field

###===============================REFUSE SUCCESSFULL===========================================
Admin_Approve_Product_Request_06: Kiểm tra Admin có thể hủy từ chối phê duyệt khi click "Hủy" button
    [Tags]    @Test_Admin_Refuse_Product_Request     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Admin có thể hủy từ chối phê duyệt khi click "Hủy" button
    When Go to approve product request page
    And Search "Mã yêu cầu" in "Tìm kiếm" with "SRS0864"
    And Select product request with "Chờ phê duyệt"
    And Click "Từ chối yêu cầu" button
    And Click select "Lý do" with "Sản phẩm chưa có nhà cung cấp"
    And Enter "test name" in textarea "Chi tiết" with "_RANDOM_"
    And Click "Hủy" button
    Then User look title "Chi Tiết Kết Nối"
    And User look contains title is "Quản lý kết nối"

Admin_Approve_Product_Request_07: Kiểm tra từ chối yêu cầu thành công với lý do "Yêu cầu không phù hợp với cửa hàng"
    [Tags]    @Test_Admin_Refuse_Product_Request     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra từ chối yêu cầu thành công với lý do "Yêu cầu không phù hợp với cửa hàng"
    When Go to approve product request page
    And Search "Mã yêu cầu" in "Tìm kiếm" with "SRS0864"
    And Select product request with "Chờ phê duyệt"
    And Click "Từ chối yêu cầu" button
    And Click select "Lý do" with "Yêu cầu không phù hợp với cửa hàng"
    And Enter "test name" in textarea "Chi tiết" with "Yêu cầu không phù hợp với cửa hàng"
    And Click "Gửi" button
    Then User look message "Hoàn tất từ chối phê duyệt" popup

Admin_Approve_Product_Request_08: Kiểm tra từ chối yêu cầu thành công với lý do "Sản phẩm chưa có nhà cung cấp"
    [Tags]    @Test_Admin_Refuse_Product_Request     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra từ chối yêu cầu thành công với lý do "Sản phẩm chưa có nhà cung cấp"
    When Go to approve product request page
    And Search "Mã yêu cầu" in "Tìm kiếm" with "SRS0865"
    And Select product request with "Chờ phê duyệt"
    And Click "Từ chối yêu cầu" button
    And Click select "Lý do" with "Sản phẩm chưa có nhà cung cấp"
    And Enter "test name" in textarea "Chi tiết" with "Sản phẩm chưa có nhà cung cấp"
    And Click "Gửi" button
    Then User look message "Hoàn tất từ chối phê duyệt" popup

Admin_Approve_Product_Request_09: Kiểm tra từ chối yêu cầu thành công với lý do "Khác"
    [Tags]    @Test_Admin_Refuse_Product_Request     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra từ chối yêu cầu thành công với lý do "Khác"
    When Go to approve product request page
    And Search "Mã yêu cầu" in "Tìm kiếm" with "SRS0866"
    And Select product request with "Chờ phê duyệt"
    And Click "Từ chối yêu cầu" button
    And Click select "Lý do" with "Khác"
    And Enter "test name" in textarea "Chi tiết" with "Sản phẩm không tồn tại trong hệ thống"
    And Click "Gửi" button
    Then User look message "Hoàn tất từ chối phê duyệt" popup

Admin_Approve_Product_Request_10: Kiểm tra từ chối yêu cầu thành công khi không nhập chi tiết lý do từ chối
    [Tags]    @Test_Admin_Refuse_Product_Request     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra từ chối yêu cầu thành công khi không nhập chi tiết lý do từ chối
    When Go to approve product request page
    And Search "Mã yêu cầu" in "Tìm kiếm" with "SRS0868"
    And Select product request with "Chờ phê duyệt"
    And Click "Từ chối yêu cầu" button
    And Click select "Lý do" with "Sản phẩm chưa có nhà cung cấp"
    And Click "Gửi" button
    Then User look message "Hoàn tất từ chối phê duyệt" popup

####========================================SEE DETAILS INFORMATION PRODUCT REQUEST===============================================
Admin_Approve_Product_Request_11: Kiểm tra Admin có thể xem chi tiết "Yêu cầu thêm sản phẩm" với trạng thái "Chờ phê duyệt"
    [Tags]    @Test_Admin_View_Details_Information_Produdct_Request     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Admin có thể xem chi tiết "Yêu cầu thêm sản phẩm" với trạng thái "Chờ phê duyệt"
    When Go to approve product request page
    And Search "code request" in "Tìm kiếm" with "SRS0857"
    And Select product request with "Chờ phê duyệt"
    Then User look title "Chi Tiết Kết Nối"
    And Show details product request with "Chờ phê duyệt" by Admin

Admin_Approve_Product_Request_12: Kiểm tra Admin có thể xem chi tiết "Yêu cầu thêm sản phẩm" với trạng thái "Đã phê duyệt"
    [Tags]    @Test_Admin_View_Details_Information_Produdct_Request     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Admin có thể xem chi tiết "Yêu cầu thêm sản phẩm" với trạng thái "Đã phê duyệt"
    When Go to approve product request page
    And Search "code request" in "Tìm kiếm" with "SRS0852"
    And Select product request with "Đã phê duyệt"
    Then User look title "Chi Tiết Kết Nối"
    And Show details product request with "Đã phê duyệt" by Admin

Admin_Approve_Product_Request_13: Kiểm tra Admin có thể xem chi tiết "Yêu cầu thêm sản phẩm" với trạng thái "Từ chối"
    [Tags]    @Test_Admin_View_Details_Information_Produdct_Request     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Admin có thể xem chi tiết "Yêu cầu thêm sản phẩm" với trạng thái "Từ chối"
    When Go to approve product request page
    And Search "code request" in "Tìm kiếm" with "SRS0869"
    And Select product request with "Từ chối"
    Then User look title "Chi Tiết Kết Nối"
    And Show details product request with "Từ chối" by Admin

Admin_Approve_Product_Request_14: Kiểm tra Admin có thể xem chi tiết "Yêu cầu thêm sản phẩm" với trạng thái "Chờ kết nối"
    [Tags]    @Test_Admin_View_Details_Information_Produdct_Request     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Admin có thể xem chi tiết "Yêu cầu thêm sản phẩm" với trạng thái "Chờ kết nối"
    When Go to approve product request page
    And Search "code request" in "Tìm kiếm" with "SRS0827"
    And Select product request with "Chờ kết nối"
    Then User look title "Chi Tiết Kết Nối"
    And Show details product request with "Chờ kết nối" by Admin

Admin_Approve_Product_Request_15: Kiểm tra có thể quay lại trang danh sách "Yêu cầu thêm sản phẩm" từ trang "Chi tiết yêu cầu"
    [Tags]    @Test_Admin_View_Details_Information_Produdct_Request     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra có thể quay lại trang danh sách "Yêu cầu thêm sản phẩm" từ trang "Chi tiết yêu cầu"
    When Go to approve product request page
    And Search "code request" in "Tìm kiếm" with "SRS0827"
    And Select product request with "Chờ kết nối"
    And Click "Trở về" button
    Then User look title "Quản Lý Kết Nối"
    And User look contains title is "Kết nối"

###================================ADMIN VIEW LIST OF PRODUCT REQUEST========================================================
Admin_Approve_Product_Request_16: Kiểm tra Admin có thể xem danh sách "Yêu cầu thêm sản phẩm" đã tạo
    [Tags]    @Test_Admin_View_List_Produdct_Request     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Admin có thể xem danh sách "Yêu cầu thêm sản phẩm" đã tạo
    When Go to approve product request page
    And Increase the number of products displayed with "40"
    Then Show list of "Product Requests" by Admin

Admin_Approve_Product_Request_17: Kiểm tra Admin có thể xem danh sách "Yêu cầu thêm sản phẩm" khi tìm kiếm với "Mã yêu cầu" hợp lệ
    [Tags]    @Test_Admin_View_List_Produdct_Request     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Admin có thể xem danh sách "Yêu cầu thêm sản phẩm" khi tìm kiếm với "Mã yêu cầu" hợp lệ
    When Go to approve product request page
    And Search "code request" in "Tìm kiếm" with "SRS0862"
    Then Show list of "Product Requests" by Admin

Admin_Approve_Product_Request_18: Kiểm tra Admin có thể xem danh sách "Yêu cầu thêm sản phẩm" khi tìm kiếm với "Tên cửa hàng" hợp lệ
    [Tags]    @Test_Admin_View_List_Produdct_Request     @Test_by_Hồ_Văn_Nhật
    [Documentation]       Kiểm tra Admin có thể xem danh sách "Yêu cầu thêm sản phẩm" khi tìm kiếm với "Tên cửa hàng" hợp lệ
    When Go to approve product request page
    And Search "name store" in "Tìm kiếm" with "Cửa hàng của Ben"
    Then Show list of "Product Requests" by Admin

Admin_Approve_Product_Request_19: Kiểm tra Admin có thể xem danh sách "Yêu cầu thêm sản phẩm" khi tìm kiếm với "Tên sản phẩm" hợp lệ
    [Tags]    @Test_Admin_View_List_Produdct_Request     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Admin có thể xem danh sách "Yêu cầu thêm sản phẩm" khi tìm kiếm với "Tên sản phẩm" hợp lệ
    When Go to approve product request page
    And Search "name product" in "Tìm kiếm" with "Nước ép cam"
    Then Show list of "Product Requests" by Admin

Admin_Approve_Product_Request_20: Kiểm tra Admin không thể xem danh sách "Yêu cầu thêm sản phẩm" khi tìm kiếm với từ khóa không hợp lệ
    [Tags]    @Test_Admin_View_List_Produdct_Request     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Admin không thể xem danh sách "Yêu cầu thêm sản phẩm" khi tìm kiếm với từ khóa không hợp lệ
    When Go to approve product request page
    And Search "test name" in "Tìm kiếm" with "_RANDOM_"
    Then No Product_Request are shown

Admin_Approve_Product_Request_21: Kiểm tra Admin không thể xem danh sách "Yêu cầu thêm sản phẩm" khi tìm kiếm với "Mã yêu cầu" không hợp lệ
    [Tags]    @Test_Admin_View_List_Produdct_Request     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Admin không thể xem danh sách "Yêu cầu thêm sản phẩm" khi tìm kiếm với "Mã yêu cầu" không hợp lệ
    When Go to approve product request page
    And Search "Mã yêu cầu" in "Tìm kiếm" with "_RANDOM_"
    Then No Product_Request are shown

Admin_Approve_Product_Request_22: Kiểm tra Admin có thể xem danh sách trang kế tiếp, trước trước, 10 trang kế tiếp, 10 trang trước
    [Tags]    @Test_Admin_View_List_Produdct_Request     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra có thể xem danh sách trang kế tiếp, trước trước, 10 trang kế tiếp, 10 trang trước
    When Go to approve product request page
    And Click ">" to "next" page
    Then Show list of "Product Requests" by Admin
    And Click "<" to "prev" page
    Then Show list of "Product Requests" by Admin
    And Click ">>" to "next_all" page
    Then Show list of "Product Requests" by Admin
    And Click "<<" to "prev_all" page
    Then Show list of "Product Requests" by Admin

##===========================================STORE & SUPPLIER CONNECT==================================================================
Store_Supplier_Connect_01: Kiểm tra có thể xem chi tiết sản phẩm của nhà cung cấp
    [Tags]    @Test_Store_Supplier_Connect     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra có thể xem chi tiết sản phẩm của nhà cung cấp
    When Go to list Product Request page
    And Search "code request" in "Tìm kiếm" with "SRS0872"
    And Select product request with "Chờ kết nối"
    And Show all detail information supplier

###======================================CONNECT SUCCESSFULL===========================================================================
Store_Supplier_Connect_02: Kiểm tra có thể kết nối Store & Supplier
    [Tags]    @Test_Store_Supplier_Connect     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra có thể kết nối Store & Supplier
    When Go to list Product Request page
    And Search "code request" in "Tìm kiếm" with "SRS0872"
    And Select product request with "Chờ kết nối"
    And Click "Đồng ý kết nối" button
    Then User look message "Kết nối thành công" popup

#========================REFUSE CONNECT TO SUPPLIER=============================================================================================
#---------------------------------VALIDATION TEXT-------------------------------------------------------------------------------------
Store_Supplier_Connect_03: Kiểm tra Validation text khi không nhập "Lý do"
    [Tags]    @Test_Store_Refuse_Connect_Request     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation text khi không nhập "Lý do"
    When Go to list Product Request page
    And Search "code request" in "Tìm kiếm" with "SRS0877"
    And Select product request with "Chờ kết nối"
    And Click "Từ chối tất cả" button
    And Click "Gửi" button
    Then Required message "Lý do" displayed under "Xin vui lòng nhập lý do" field

Store_Supplier_Connect_04: Kiểm tra Validation text trường "Chi tiết" khi nhập quá 500 ký tự
    [Tags]    @Test_Store_Refuse_Connect_Request     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Validation text trường "Chi tiết" khi nhập quá 500 ký tự
    When Go to list Product Request page
    And Search "code request" in "Tìm kiếm" with "SRS0877"
    And Select product request with "Chờ kết nối"
    And Click "Từ chối tất cả" button
    And Enter "word" in textarea "Chi tiết" with "_RANDOM_"
    And Click select in "Lý do" field
    Then Required message "Chi tiết" displayed under "Chỉ được nhập tối đa 500 kí tự" field

####===============================REFUSE SUCCESSFULL===========================================
Store_Supplier_Connect_05: Kiểm tra Store có thể hủy từ chối phê duyệt khi click "Hủy" button
    [Tags]    @Test_Store_Refuse_Connect_Request     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra Store có thể hủy từ chối phê duyệt khi click "Hủy" button
    When Go to list Product Request page
    And Search "code request" in "Tìm kiếm" with "SRS0877"
    And Select product request with "Chờ kết nối"
    And Click "Từ chối tất cả" button
    And Click select "Lý do" with "Không tìm thấy nhà cung cấp phù hợp"
    And Enter "test name" in textarea "Chi tiết" with "_RANDOM_"
    And Click "Hủy" button
    Then User look title "Chi Tiết Kết Nối"
    And User look contains title is "Quản lý kết nối"

Store_Supplier_Connect_06: Kiểm tra từ chối yêu cầu thành công với lý do "Không tìm thấy nhà cung cấp phù hợp"
    [Tags]    @Test_Store_Refuse_Connect_Request     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra từ chối yêu cầu thành công với lý do "Không tìm thấy nhà cung cấp phù hợp"
    When Go to list Product Request page
    And Search "code request" in "Tìm kiếm" with "SRS0871"
    And Select product request with "Chờ kết nối"
    And Click "Từ chối tất cả" button
    And Click select "Lý do" with "Không tìm thấy nhà cung cấp phù hợp"
    And Enter "text" in textarea "Chi tiết" with "Không tìm thấy nhà cung cấp phù hợp"
    And Click "Gửi" button
    Then User look message "Đã từ chối tất cả nhà cung cấp" popup

Store_Supplier_Connect_07: Kiểm tra từ chối yêu cầu thành công với lý do "Sản phẩm được đề nghị không phù hợp"
    [Tags]    @Test_Store_Refuse_Connect_Request     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra từ chối yêu cầu thành công với lý do "Sản phẩm được đề nghị không phù hợp"
    When Go to list Product Request page
    And Search "code request" in "Tìm kiếm" with "SRS0870"
    And Select product request with "Chờ kết nối"
    And Click "Từ chối tất cả" button
    And Click select "Lý do" with "Sản phẩm được đề nghị không phù hợp"
    And Enter "test name" in textarea "Chi tiết" with "Sản phẩm được đề nghị không phù hợp"
    And Click "Gửi" button
    Then User look message "Đã từ chối tất cả nhà cung cấp" popup

Store_Supplier_Connect_08: Kiểm tra từ chối yêu cầu thành công với lý do "Giá bán sản phẩm không phù hợp"
    [Tags]    @Test_Store_Refuse_Connect_Request     @Test_by_Hồ_Văn_Nhật
    [Documentation]       Kiểm tra từ chối yêu cầu thành công với lý do "Giá bán sản phẩm không phù hợp"
    When Go to list Product Request page
    And Search "code request" in "Tìm kiếm" with "SRS0869"
    And Select product request with "Chờ kết nối"
    And Click "Từ chối tất cả" button
    And Click select "Lý do" with "Giá bán sản phẩm không phù hợp"
    And Enter "test name" in textarea "Chi tiết" with "Giá bán sản phẩm không phù hợp"
    And Click "Gửi" button
    Then User look message "Đã từ chối tất cả nhà cung cấp" popup

Store_Supplier_Connect_09: Kiểm tra từ chối yêu cầu thành công với lý do "Khác"
    [Tags]    @Test_Store_Refuse_Connect_Request     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra từ chối yêu cầu thành công với lý do "Khác"
    When Go to list Product Request page
    And Search "code request" in "Tìm kiếm" with "SRS0880"
    And Select product request with "Chờ kết nối"
    And Click "Từ chối tất cả" button
    And Click select "Lý do" with "Khác"
    And Enter "test name" in textarea "Chi tiết" with "Không có lý do nào cả, thích từ chối thôi!"
    And Click "Gửi" button
    Then User look message "Đã từ chối tất cả nhà cung cấp" popup

Store_Supplier_Connect_10: Kiểm tra từ chối yêu cầu thành công khi không nhập chi tiết lý do từ chối
    [Tags]    @Test_Store_Refuse_Connect_Request     @Test_by_Hồ_Văn_Nhật
    [Documentation]     Kiểm tra từ chối yêu cầu thành công khi không nhập chi tiết lý do từ chối
    When Go to list Product Request page
    And Search "code request" in "Tìm kiếm" with "SRS0879"
    And Select product request with "Chờ kết nối"
    And Click "Từ chối tất cả" button
    And Click select "Lý do" with "Khác"
    And Click "Gửi" button
    Then User look message "Đã từ chối tất cả nhà cung cấp" popup

*** Keywords ***
Selelect supplier need to approve
  Click     //*[contains(@class, "ant-table-row")][1]     left    2

Show all detail information supplier
  ${elements}=        Get Elements        xpath=//*[contains(@class, "ant-table-row")]
  Wait Until Element Is Visible       ${elements}[0]
  ${stt}=             Set Variable        1
  FOR  ${temp}  IN  @{elements}
      Log To Console      ${EMPTY}
      Log To Console      NHÀ CUNG CẤP SỐ ${stt}
      Click       ${temp}
      Show details supplier by Store
      Click "Trở về" button when add_supplier
      ${stt}=    Evaluate    ${stt} + 1
  END

Preconditions
  Set Browser Timeout         ${BROWSER_TIMEOUT}
  New Browser                 ${BROWSER}  headless=${HEADLESS}
  New Page                    ${URL_DEFAULT}
  ${STATE}                    Evaluate  json.loads('''{}''')  json

Click select in "${name}" field
  ${element}=               Get Element Form Item By Name     ${name}                       //*[contains(@class, "ant-select-show-arrow")]
  Wait Until Element Is Visible    ${element}
  Click                     ${element}

Select supplier with "${text}"
    ${elements}       Get Elements      //p[contains(text(),'${text}')]
    Wait Until Element Is Visible       ${elements}[0]
    FOR  ${temp}  IN  @{elements}
          Click       ${temp}
          Sleep       ${SHOULD_TIMEOUT}
    END

Delete the newly added supplier list
  ${elements}=        Get Elements        xpath=//*[contains(@class, "ant-table-row")]
  Wait Until Element Is Visible       ${elements}[0]
  FOR  ${temp}  IN  @{elements}
      Click       //button[contains(text(),'Xóa')][1]
      Then User look message "Đã xóa đề xuất" popup
  END

Click "${text}" button when ${name}
  Sleep           1
  ${elements}     Get Elements      xpath=//button[contains(text(),'${text}')]
  ${total}        Get length        ${elements}
  ${index}        Evaluate          ${total} - 1
  Wait Until Element Is Visible     ${elements}[${index}]
  Click                             ${elements}[${index}]
  Click Confirm To Action
  Scroll By                 ${None}

Go to approve product request page
  When Login to Admin
  And Click "Quản lý kết nối" menu
  And Click "Kết nối" sub menu

Go to ${text} Product Request page
  When Login to Store
  And Click "Quản lý kết nối" menu
  And Click "Kết nối" sub menu
  IF  '${text}' == 'create'
    And Click "Thêm yêu cầu" button
  END

Select product request with "${text}"
  Sleep             1
  IF  '${text}' == 'Chờ phê duyệt'
    ${elements}   Get Elements        //div[contains(@class, 'bg-yellow-50') and text()='${text}']
    ${element}    Set Variable        ${elements}[0]
  ELSE IF  '${text}' == 'Từ chối'
    ${elements}   Get Elements        //div[contains(@class, 'bg-red-50') and text()='${text}']
    ${element}    Set Variable        ${elements}[0]
  ELSE IF  '${text}' == 'Chờ kết nối'
    ${elements}   Get Elements        //div[contains(@class, 'bg-blue-50') and text()='${text}']
    ${element}    Set Variable        ${elements}[0]
  ELSE IF  '${text}' == 'Đã phê duyệt'
    ${elements}   Get Elements        //div[contains(@class, 'bg-green-50') and text()='${text}']
    ${element}    Set Variable        ${elements}[0]
  END
  Wait Until Element Is Visible     ${element}
  Click         ${element}        left      2
  Sleep       1

Show details product request with "${text}"
    ${element}            Get Elements       css=div.whitespace-pre-wrap
    Run Keyword If    ${element}    Show details_1     ${text}      ${element}
    ...    ELSE    Show details_2   ${text}

Show details_1
  [Arguments]           ${text}           ${element}
  ${Mã yêu cầu}         Get Text          css=.w-full:nth-child(2) > .w-full:nth-child(1) > .w-full:nth-child(1) > div:nth-child(2)
  ${Trạng thái}         Get Text          css=.w-full:nth-child(2) > .w-full:nth-child(1) > .w-full:nth-child(2) > div:nth-child(2)
  ${Tên sản phẩm}       Get Text          css=.flex:nth-child(3) > div:nth-child(2)
  ${element_date}       Get Elements      css=.w-full:nth-child(2) > .flex > div:nth-child(2)
  ${Ngày yêu cầu}       Get Text          ${element_date}[0]
  ${Mô tả}              Get Text          ${element}[0]
  IF  '${text}' == 'Đã phê duyệt'
      ${Ngày phê duyệt}     Get Text      ${element_date}[1]
      ${Nhà cung cấp}       Get Text      css=.w-full:nth-child(5) > .w-full:nth-child(1) > .w-full:nth-child(1) > div:nth-child(2)
      ${Số điện thoại}      Get Text      css=.w-full:nth-child(5) > .w-full:nth-child(1) > .w-full:nth-child(2) > div:nth-child(2)
      ${Địa chỉ}            Get Text      css=.w-full:nth-child(6) > div:nth-child(2)
      ${Chủ nhà cung cấp}   Get Text      css=.w-full:nth-child(5) > .w-full:nth-child(2) > .w-full:nth-child(1) > div:nth-child(2)
      ${Số fax}             Get Text      css=.w-full:nth-child(5) > .w-full:nth-child(2) > .w-full:nth-child(2) > div:nth-child(2)
  END
  IF  '${text}' == 'Từ chối'
      ${Ngày phản hồi}      Get Text      css=.w-full:nth-child(5) > .w-full:nth-child(1) > .w-full:nth-child(1) > div:nth-child(2)
      ${Từ chối bởi}        Get Text      ${element_date}[2]
      ${Lý do}              Get Text      css=.w-full:nth-child(6) > div:nth-child(2)
  END
  Log To Console        ${EMPTY}
  Log To Console        CHI TIẾT YÊU CẦU
  Log To Console        -------------------------------------------------------------------------
  Log To Console        Mã yêu cầu:${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${Mã yêu cầu}
  Log To Console        Trạng thái:${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${Trạng thái}
  Log To Console        Tên sản phẩm:${SPACE}${SPACE}${SPACE}${SPACE}${Tên sản phẩm}
  Log To Console        Ngày yêu cầu:${SPACE}${SPACE}${SPACE}${SPACE}${Ngày yêu cầu}
  IF  '${text}' == 'Đã phê duyệt'
      Log To Console        Ngày phê duyệt:${SPACE}${SPACE}${Ngày phê duyệt}
  END
  Log To Console        Yêu cầu chi tiết về sản phẩm: ${Mô tả}
  Log To Console        =========================================================================
  IF  '${text}' == 'Đã phê duyệt'
      Log To Console        THÔNG TIN NHÀ CUNG CẤP
      Log To Console        -------------------------------------------------------------------------
      Log To Console        Nhà cung cấp: ${SPACE}${SPACE}${SPACE}${SPACE}${Nhà cung cấp}
      Log To Console        Chủ nhà cung cấp: ${Chủ nhà cung cấp}
      Log To Console        Số điện thoại: ${SPACE}${SPACE}${SPACE}${Số điện thoại}
      Log To Console        Số fax: ${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${Số fax}
      Log To Console        Địa chỉ: ${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${Địa chỉ}
      Log To Console        =========================================================================
  END
  IF  '${text}' == 'Từ chối'
      Log To Console        Chi tiết
      Log To Console        -------------------------------------------------------------------------
      Log To Console        Ngày phản hồi: ${Ngày phản hồi}
      Log To Console        Từ chối bởi: ${SPACE}${SPACE}${Từ chối bởi}
      Log To Console        Lý do: ${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${Lý do}
      Log To Console        =========================================================================
  END

  IF  '${text}' == 'Chờ kết nối'
      Log To Console        DANH SÁCH NHÀ CUNG CẤP
      Wait Until Element Spin
      ${elements}=        Get Elements        xpath=//*[contains(@class, "ant-table-row")]
      Wait Until Element Is Visible         ${elements}[0]
      ${count}=           Set Variable        1
      ${stt}=             Set Variable        1
      FOR  ${i}  IN  @{elements}
            ${name}             Get Text    //tbody/tr[${count}]/td[2]
            ${address}          Get Text    //tbody/tr[${count}]/td[3]
            ${name_product}     Get Text    //tbody/tr[${count}]/td[4]
            ${cost}             Get Text    //tbody/tr[${count}]/td[5]
            ${act}              Get Text    //tbody/tr[${count}]/td[6]
            Log To Console    ${stt}. Tên nhà cung cấp: ${name} | Địa chỉ: ${address} | Tên sản phẩm: ${name_product} | Giá bán lẻ (VND): ${cost} | Hành động: ${act}
            Log To Console    ============================================================================================================================================
            ${count}=    Evaluate    ${count} + 1
            ${stt}=    Evaluate    ${stt} + 1
      END
      ${total}=    Evaluate    ${count} - 1
      Log To Console          Danh sách nhà cung cấp có ${total} nhà cung cấp
  END

Show details_2
  [Arguments]           ${text}
  ${Mã yêu cầu}         Get Text          css=.w-full:nth-child(2) > .w-full:nth-child(1) > .w-full:nth-child(1) > div:nth-child(2)
  ${Trạng thái}         Get Text          css=.w-full:nth-child(2) > .w-full:nth-child(1) > .w-full:nth-child(2) > div:nth-child(2)
  ${Tên sản phẩm}       Get Text          css=.w-full:nth-child(3) > div:nth-child(2)
  ${element_date}       Get Elements      css=.w-full:nth-child(2) > .flex > div:nth-child(2)
  ${Ngày yêu cầu}       Get Text          ${element_date}[0]
  IF  '${text}' == 'Đã phê duyệt'
      ${Ngày phê duyệt}     Get Text      ${element_date}[1]
      ${Nhà cung cấp}       Get Text      css=.w-full:nth-child(5) > .w-full:nth-child(1) > .w-full:nth-child(1) > div:nth-child(2)
      ${Số điện thoại}      Get Text      css=.w-full:nth-child(5) > .w-full:nth-child(1) > .w-full:nth-child(2) > div:nth-child(2)
      ${Địa chỉ}            Get Text      css=.w-full:nth-child(6) > div:nth-child(2)
      ${Chủ nhà cung cấp}   Get Text      css=.w-full:nth-child(5) > .w-full:nth-child(2) > .w-full:nth-child(1) > div:nth-child(2)
      ${Số fax}             Get Text      css=.w-full:nth-child(5) > .w-full:nth-child(2) > .w-full:nth-child(2) > div:nth-child(2)
  END
  IF  '${text}' == 'Từ chối'
      ${Ngày phản hồi}      Get Text      css=.w-full:nth-child(5) > .w-full:nth-child(1) > .w-full:nth-child(1) > div:nth-child(2)
      ${Từ chối bởi}        Get Text      ${element_date}[2]
      ${Lý do}              Get Text      css=.w-full:nth-child(6) > div:nth-child(2)
  END
  Log To Console        ${EMPTY}
  Log To Console        CHI TIẾT YÊU CẦU
  Log To Console        -------------------------------------------------------------------------
  Log To Console        Mã yêu cầu:${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${Mã yêu cầu}
  Log To Console        Trạng thái:${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${Trạng thái}
  Log To Console        Tên sản phẩm:${SPACE}${SPACE}${SPACE}${SPACE}${Tên sản phẩm}
  Log To Console        Ngày yêu cầu:${SPACE}${SPACE}${SPACE}${SPACE}${Ngày yêu cầu}
  IF  '${text}' == 'Đã phê duyệt'
      Log To Console        Ngày phê duyệt:${SPACE}${SPACE}${Ngày phê duyệt}
  END
  Log To Console        Yêu cầu chi tiết về sản phẩm: ${EMPTY}
  Log To Console        =========================================================================
  IF  '${text}' == 'Đã phê duyệt'
      Log To Console        THÔNG TIN NHÀ CUNG CẤP
      Log To Console        -------------------------------------------------------------------------
      Log To Console        Nhà cung cấp: ${SPACE}${SPACE}${SPACE}${SPACE}${Nhà cung cấp}
      Log To Console        Chủ nhà cung cấp: ${Chủ nhà cung cấp}
      Log To Console        Số điện thoại: ${SPACE}${SPACE}${SPACE}${Số điện thoại}
      Log To Console        Số fax: ${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${Số fax}
      Log To Console        Địa chỉ: ${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${Địa chỉ}
  END
  IF  '${text}' == 'Từ chối'
      Log To Console        Chi tiết
      Log To Console        -------------------------------------------------------------------------
      Log To Console        Ngày phản hồi: ${Ngày phản hồi}
      Log To Console        Từ chối bởi: ${SPACE}${SPACE}${Từ chối bởi}
      Log To Console        Lý do: ${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${Lý do}
      Log To Console        =========================================================================
  END

Increase the number of products displayed with "${number}"
  ${element}=       Set Variable      //span[@class="ant-select-selection-item" and @title="10"]
  Wait Until Element Is Visible       ${element}
  Click       ${element}
  ${element}=       Get Element       //*[contains(@class, "ant-select-item-option-content") and text()='${number}']
  Click       ${element}
  Wait Until Element Spin
  Sleep   ${SHOULD_TIMEOUT}

Show list of "Product Requests" by ${name}
      Sleep                 1
      Log To Console        DANH SÁCH YÊU CẦU THÊM SẢN PHẨM
      Wait Until Element Spin
      ${elements}=        Get Elements        xpath=//*[contains(@class, "ant-table-row")]
      Wait Until Element Is Visible         ${elements}[0]
      ${count}=           Set Variable        1
      ${stt}=             Set Variable        1
      FOR  ${i}  IN  @{elements}
            ${Mã yêu cầu}             Get Text    //tbody/tr[${count}]/td[1]
            ${Tên NCC}                Get Text    //tbody/tr[${count}]/td[2]
            ${Tên sản phẩm}           Get Text    //tbody/tr[${count}]/td[3]
            ${Ngày yêu cầu}           Get Text    //tbody/tr[${count}]/td[4]
            ${Ngày phản hồi}          Get Text    //tbody/tr[${count}]/td[5]
            ${Trạng thái}             Get Text    //tbody/tr[${count}]/td[6]
            IF  '${name}' == 'Store'
              Log To Console    ${stt}. Mã yêu cầu: ${Mã yêu cầu} | Tên NCC: ${Tên NCC} | Tên sản phẩm: ${Tên sản phẩm} | Ngày yêu cầu: ${Ngày yêu cầu} | Ngày phản hồi: ${Ngày phản hồi} | Trạng thái: ${Trạng thái}
            ELSE IF  '${name}' == 'Admin'
              Log To Console    ${stt}. Mã yêu cầu: ${Mã yêu cầu} | Tên cửa hàng: ${Tên NCC} | Tên sản phẩm: ${Tên sản phẩm} | Ngày yêu cầu: ${Ngày yêu cầu} | Ngày phản hồi: ${Ngày phản hồi} | Trạng thái: ${Trạng thái}
            END
            Log To Console    ============================================================================================================================================
            ${count}=    Evaluate    ${count} + 1
            ${stt}=    Evaluate    ${stt} + 1
      END
      ${total}=    Evaluate    ${count} - 1
      Log To Console          Có ${total} "Yêu cầu thêm sản phẩm" được hiển thị

Show details product request with "${text}" by Admin
    ${element}            Get Elements       css=div.whitespace-pre-wrap
    Run Keyword If    ${element}    Show details_by Admin_1     ${text}      ${element}
    ...    ELSE    Show details_by Admin_2   ${text}

Show details_by Admin_1
  [Arguments]           ${text}           ${element}
  ${Mã yêu cầu}         Get Text          css=.w-full:nth-child(2) > .w-full:nth-child(1) > .w-full:nth-child(1) > div:nth-child(2)
  ${Trạng thái}         Get Text          css=.w-full:nth-child(2) > .w-full:nth-child(1) > .w-full:nth-child(2) > div:nth-child(2)
  ${Tên sản phẩm}       Get Text          css=.flex:nth-child(3) > div:nth-child(2)
  ${element_date}       Get Elements      css=.w-full:nth-child(2) > .flex > div:nth-child(2)
  ${Ngày yêu cầu}       Get Text          ${element_date}[0]
  ${Ngày phê duyệt}     Get Text          ${element_date}[1]
  ${Mô tả}              Get Text          ${element}[0]
  ${Cửa hàng}           Get Text          css=.w-full:nth-child(5) > .w-full:nth-child(1) > .w-full:nth-child(1) > div:nth-child(2)
  ${Số điện thoại}      Get Text          css=.w-full:nth-child(5) > .w-full:nth-child(1) > .w-full:nth-child(2) > div:nth-child(2)
  ${Địa chỉ}            Get Text          css=.w-full:nth-child(6) > div:nth-child(1) > div:nth-child(2)
  ${Chủ cửa hàng}       Get Text          css=.w-full:nth-child(5) > .w-full:nth-child(2) > .w-full:nth-child(1) > div:nth-child(2)
  ${Số fax}             Get Text          css=.w-full:nth-child(5) > .w-full:nth-child(2) > .w-full:nth-child(2) > div:nth-child(2)
  IF  '${text}' == 'Đã phê duyệt'
      ${Nhà cung cấp}       Get Text          css=.w-full:nth-child(9) > .w-full:nth-child(1) > .w-full:nth-child(1) > div:nth-child(2)
      ${Số điện thoại}      Get Text          css=.w-full:nth-child(9) > .w-full:nth-child(1) > .w-full:nth-child(2) > div:nth-child(2)
      ${Địa chỉ NCC}        Get Text          css=.w-full:nth-child(10) > div:nth-child(2)
      ${Chủ nhà cung cấp}   Get Text          css=.w-full:nth-child(9) > .w-full:nth-child(2) > .w-full:nth-child(1) > div:nth-child(2)
      ${Số fax NCC}         Get Text          css=.w-full:nth-child(9) > .w-full:nth-child(2) > .w-full:nth-child(2) > div:nth-child(2)
  END
  IF  '${text}' == 'Từ chối'
      ${Ngày phản hồi}      Get Text          css=.w-full:nth-child(9) > .w-full:nth-child(1) > .w-full:nth-child(1) > div:nth-child(2)
      ${Lý do}              Get Text          css=.w-full:nth-child(10) > div:nth-child(2)
      ${Từ chối bởi}        Get Text          css=.w-full:nth-child(9) > .w-full:nth-child(2) > .w-full:nth-child(1) > div:nth-child(2)
  END
  Log To Console        ${EMPTY}
  Log To Console        CHI TIẾT YÊU CẦU
  Log To Console        -------------------------------------------------------------------------
  Log To Console        Mã yêu cầu:${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${Mã yêu cầu}
  Log To Console        Trạng thái:${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${Trạng thái}
  Log To Console        Tên sản phẩm:${SPACE}${SPACE}${SPACE}${SPACE}${Tên sản phẩm}
  Log To Console        Ngày yêu cầu:${SPACE}${SPACE}${SPACE}${SPACE}${Ngày yêu cầu}
  Log To Console        Ngày phê duyệt:${SPACE}${SPACE}${Ngày phê duyệt}
  Log To Console        Yêu cầu chi tiết về sản phẩm: ${Mô tả}
  Log To Console        =========================================================================
  Log To Console        THÔNG TIN CỬA HÀNG
  Log To Console        -------------------------------------------------------------------------
  Log To Console        Cửa hàng: ${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${Cửa hàng}
  Log To Console        Tên chủ cửa hàng: ${Chủ cửa hàng}
  Log To Console        Số điện thoại: ${SPACE}${SPACE}${SPACE}${Số điện thoại}
  Log To Console        Số fax: ${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${Số fax}
  Log To Console        Địa chỉ: ${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${Địa chỉ}
  Log To Console        =========================================================================
  IF  '${text}' == 'Chờ phê duyệt'
      Log To Console    DANH SÁCH NHÀ CUNG CẤP
      Log To Console        =========================================================================
  END

  IF  '${text}' == 'Đã phê duyệt'
      Log To Console    THÔNG TIN NHÀ CUNG CẤP
      Log To Console        =========================================================================
      Log To Console    Nhà cung cấp: ${SPACE}${SPACE}${SPACE}${SPACE}${Nhà cung cấp}
      Log To Console    Chủ nhà cung cấp: ${Chủ nhà cung cấp}
      Log To Console    Số điện thoại: ${SPACE}${SPACE}${SPACE}${Số điện thoại}
      Log To Console    Số fax: ${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${Số fax NCC}
      Log To Console    Địa chỉ: ${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${Địa chỉ NCC}
      Log To Console        -------------------------------------------------------------------------
  END

  IF  '${text}' == 'Từ chối'
      Log To Console        CHI TIẾT
      Log To Console        -------------------------------------------------------------------------
      Log To Console        Ngày phản hồi: ${Ngày phản hồi}
      Log To Console        Từ chối bởi: ${SPACE}${SPACE}${Từ chối bởi}
      Log To Console        Lý do: ${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${Lý do}
      Log To Console        =========================================================================
  END

  IF  '${text}' == 'Chờ kết nối'
      Log To Console        DANH SÁCH NHÀ CUNG CẤP
      Wait Until Element Spin
      ${elements}=        Get Elements        xpath=//*[contains(@class, "ant-table-row")]
      Wait Until Element Is Visible         ${elements}[0]
      ${count}=           Set Variable        1
      ${stt}=             Set Variable        1
      FOR  ${i}  IN  @{elements}
            ${name}             Get Text    //tbody/tr[${count}]/td[2]
            ${address}          Get Text    //tbody/tr[${count}]/td[3]
            ${name_product}     Get Text    //tbody/tr[${count}]/td[4]
            ${cost}             Get Text    //tbody/tr[${count}]/td[5]
            ${act}              Get Text    //tbody/tr[${count}]/td[6]
            Log To Console    ${stt}. Tên nhà cung cấp: ${name} | Địa chỉ: ${address} | Tên sản phẩm: ${name_product} | Giá bán lẻ (VND): ${cost} | Bảng giá: ${act}
            Log To Console    ============================================================================================================================================
            ${count}=    Evaluate    ${count} + 1
            ${stt}=    Evaluate    ${stt} + 1
      END
      ${total}=    Evaluate    ${count} - 1
      Log To Console          "Yêu cầu sản phẩm" này có ${total} nhà cung cấp
  END

Show details_by Admin_2
  [Arguments]           ${text}
  ${Mã yêu cầu}         Get Text          css=.w-full:nth-child(2) > .w-full:nth-child(1) > .w-full:nth-child(1) > div:nth-child(2)
  ${Trạng thái}         Get Text          css=.w-full:nth-child(2) > .w-full:nth-child(1) > .w-full:nth-child(2) > div:nth-child(2)
  ${Tên sản phẩm}       Get Text          css=.flex:nth-child(3) > div:nth-child(2)
  ${element_date}       Get Elements      css=.w-full:nth-child(2) > .flex > div:nth-child(2)
  ${Ngày yêu cầu}       Get Text          ${element_date}[0]
  ${Ngày phê duyệt}     Get Text          ${element_date}[1]
  ${Cửa hàng}           Get Text          css=.w-full:nth-child(5) > .w-full:nth-child(1) > .w-full:nth-child(1) > div:nth-child(2)
  ${Số điện thoại}      Get Text          css=.w-full:nth-child(5) > .w-full:nth-child(1) > .w-full:nth-child(2) > div:nth-child(2)
  ${Địa chỉ}            Get Text          css=.w-full:nth-child(6) > div:nth-child(1) > div:nth-child(2)
  ${Chủ cửa hàng}       Get Text          css=.w-full:nth-child(5) > .w-full:nth-child(2) > .w-full:nth-child(1) > div:nth-child(2)
  ${Số fax}             Get Text          css=.w-full:nth-child(5) > .w-full:nth-child(2) > .w-full:nth-child(2) > div:nth-child(2)
  IF  '${text}' == 'Đã phê duyệt'
      ${Nhà cung cấp}       Get Text          css=.w-full:nth-child(9) > .w-full:nth-child(1) > .w-full:nth-child(1) > div:nth-child(2)
      ${Số điện thoại}      Get Text          css=.w-full:nth-child(9) > .w-full:nth-child(1) > .w-full:nth-child(2) > div:nth-child(2)
      ${Địa chỉ NCC}        Get Text          css=.w-full:nth-child(10) > div:nth-child(2)
      ${Chủ nhà cung cấp}   Get Text          css=.w-full:nth-child(9) > .w-full:nth-child(2) > .w-full:nth-child(1) > div:nth-child(2)
      ${Số fax NCC}         Get Text          css=.w-full:nth-child(9) > .w-full:nth-child(2) > .w-full:nth-child(2) > div:nth-child(2)
  END
  IF  '${text}' == 'Từ chối'
      ${Ngày phản hồi}      Get Text          css=.w-full:nth-child(9) > .w-full:nth-child(1) > .w-full:nth-child(1) > div:nth-child(2)
      ${Lý do}              Get Text          css=.w-full:nth-child(10) > div:nth-child(2)
      ${Từ chối bởi}        Get Text          css=.w-full:nth-child(9) > .w-full:nth-child(2) > .w-full:nth-child(1) > div:nth-child(2)
  END
  Log To Console        ${EMPTY}
  Log To Console        CHI TIẾT YÊU CẦU
  Log To Console        -------------------------------------------------------------------------
  Log To Console        Mã yêu cầu:${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${Mã yêu cầu}
  Log To Console        Trạng thái:${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${Trạng thái}
  Log To Console        Tên sản phẩm:${SPACE}${SPACE}${SPACE}${SPACE}${Tên sản phẩm}
  Log To Console        Ngày yêu cầu:${SPACE}${SPACE}${SPACE}${SPACE}${Ngày yêu cầu}
  Log To Console        Ngày phê duyệt:${SPACE}${SPACE}${Ngày phê duyệt}
  Log To Console        =========================================================================
  Log To Console        THÔNG TIN CỬA HÀNG
  Log To Console        -------------------------------------------------------------------------
  Log To Console        Cửa hàng: ${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${Cửa hàng}
  Log To Console        Tên chủ cửa hàng: ${Chủ cửa hàng}
  Log To Console        Số điện thoại: ${SPACE}${SPACE}${SPACE}${Số điện thoại}
  Log To Console        Số fax: ${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${Số fax}
  Log To Console        Địa chỉ: ${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${Địa chỉ}
  Log To Console        =========================================================================
  IF  '${text}' == 'Chờ phê duyệt'
      Log To Console    DANH SÁCH NHÀ CUNG CẤP
      Log To Console        =========================================================================
  END

  IF  '${text}' == 'Đã phê duyệt'
      Log To Console    THÔNG TIN NHÀ CUNG CẤP
      Log To Console        =========================================================================
      Log To Console    Nhà cung cấp: ${SPACE}${SPACE}${SPACE}${SPACE}${Nhà cung cấp}
      Log To Console    Chủ nhà cung cấp: ${Chủ nhà cung cấp}
      Log To Console    Số điện thoại: ${SPACE}${SPACE}${SPACE}${Số điện thoại}
      Log To Console    Số fax: ${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${Số fax NCC}
      Log To Console    Địa chỉ: ${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${Địa chỉ NCC}
      Log To Console        -------------------------------------------------------------------------
  END

  IF  '${text}' == 'Từ chối'
      Log To Console        CHI TIẾT
      Log To Console        -------------------------------------------------------------------------
      Log To Console        Ngày phản hồi: ${Ngày phản hồi}
      Log To Console        Từ chối bởi: ${SPACE}${SPACE}${Từ chối bởi}
      Log To Console        Lý do: ${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${Lý do}
      Log To Console        =========================================================================
  END

Show details supplier by Store      #Khả năng cung ứng không có thì làm sao
    ${element}            Get Elements       xpath=//*[contains(@class, 'w-full')][1]//*[contains(@class, 'font-[16px]')]
    Run Keyword If    ${element}    Show details by Store 1
    ...    ELSE    Show details by Store 2

Show details by Store 1      #Thương hiệu không có thì phải làm sao
  ${temp}           Get Elements          css=.w-full:nth-child(1) > .gap-2:nth-child(2) >div:nth-child(2)
  Run Keyword If    ${temp}    Show details by Store 3
    ...    ELSE    Show details by Store 4

Show details by Store 2     #Không có khả năng cung ứng
  ${elements}       Get Elements      //*[contains(@class, 'w-full')][2]//*[contains(@class, 'flex')]/*[position()=2]
  ${Nhà cung cấp}           Get Text          ${elements}[1]
  ${Địa chỉ}                Get Text          ${elements}[2]
  ${Tên sản phẩm}           Get Text          ${elements}[4]
  ${Đơn vị tính}	          Get Text		      ${elements}[6]
  ${Mã sản phẩm}            Get Text          ${elements}[7]
  ${Thương hiệu}            Get Text          ${elements}[8]
  ${Mã vạch}                Get Text          ${elements}[10]
  ${Danh mục}               Get Text          ${elements}[11]
  ${Thị trường xuất khẩu}   Get Text          ${elements}[12]
  ${Mô tả sản phẩm}         Get Text          ${elements}[13]
  Log To Console            ${EMPTY}
  Log To Console            CHI TIẾT SẢN PHẨM
  Log To Console            =============================================================================================================================================================
  Log To Console            Thông tin nhà cung cấp
  Log To Console            *************************************************************************************************************************************************************
  Log To Console            Nhà cung cấp: ${Nhà cung cấp}${tab}Địa chỉ: ${Địa chỉ}
  Log To Console            -------------------------------------------------------------------------------------------------------------------------------------------------------------
  Log To Console            Tên sản phẩm: ${Tên sản phẩm}${tab}Đơn vị tính: ${Đơn vị tính}
  Log To Console            -------------------------------------------------------------------------------------------------------------------------------------------------------------
  Log To Console            Khả năng cung ứng:
  Log To Console            -------------------------------------------------------------------------------------------------------------------------------------------------------------
  Log To Console            Mã sản phẩm: ${Mã sản phẩm}${tab}Mã vạch: ${Mã vạch}
  Log To Console            -------------------------------------------------------------------------------------------------------------------------------------------------------------
  Log To Console            Thương hiệu: ${Thương hiệu} ${tab}Danh mục: ${Danh mục}
  Log To Console            -------------------------------------------------------------------------------------------------------------------------------------------------------------
  Log To Console            Thị trường xuất khẩu: ${Thị trường xuất khẩu}
  Log To Console            -------------------------------------------------------------------------------------------------------------------------------------------------------------
  Log To Console            Mô tả sản phẩm: ${Mô tả sản phẩm}
  Log To Console            =============================================================================================================================================================

Show details by Store 3         #Có khả năng cung ứng và có thương hiệu
  ${elements}       Get Elements      //*[contains(@class, 'w-full')][2]//*[contains(@class, 'flex')]/*[position()=2]
  ${Nhà cung cấp}           Get Text          ${elements}[2]
  ${Địa chỉ}                Get Text          ${elements}[3]
  ${Tên sản phẩm}           Get Text          ${elements}[5]
  ${Đơn vị tính}	          Get Text		      ${elements}[7]
  ${Theo quý}               Get Text          ${elements}[8]
  ${Theo tháng}             Get Text          ${elements}[10]
  ${Theo năm}               Get Text          ${elements}[11]
  ${Mã sản phẩm}            Get Text          ${elements}[13]
  ${Thương hiệu}            Get Text          ${elements}[14]
  ${Mã vạch}                Get Text          ${elements}[16]
  ${Danh mục}               Get Text          ${elements}[17]
  ${Thị trường xuất khẩu}   Get Text          ${elements}[18]
  ${Mô tả sản phẩm}		      Get Text          ${elements}[19]
  ${Chủng loại giá}         Get Text          //*[contains(@class, 'font-normal')][2]
  ${Số lượng tối thiểu}     Get Text          //*[contains(@class, 'font-normal')][3]
  ${Giá bán(VND)}           Get Text          //*[contains(@class, 'font-normal')][4]
  Log To Console            ${EMPTY}
  Log To Console            CHI TIẾT SẢN PHẨM
  Log To Console            =============================================================================================================================================================
  Log To Console            Thông tin nhà cung cấp
  Log To Console            *************************************************************************************************************************************************************
  Log To Console            Nhà cung cấp: ${Nhà cung cấp}${tab}Địa chỉ: ${Địa chỉ}
  Log To Console            -------------------------------------------------------------------------------------------------------------------------------------------------------------
  Log To Console            Tên sản phẩm: ${Tên sản phẩm}${tab}Đơn vị tính: ${Đơn vị tính}
  Log To Console            -------------------------------------------------------------------------------------------------------------------------------------------------------------
  Log To Console            Khả năng cung ứng:
  Log To Console            Theo quý: ${Theo quý}${tab}Theo tháng: ${Theo tháng}${tab}Theo năm: ${Theo năm}
  Log To Console            -------------------------------------------------------------------------------------------------------------------------------------------------------------
  Log To Console            Bảng giá sản phẩm:
  Log To Console            1. Chủng loại giá: ${Chủng loại giá}${tab}Số lượng tối thiểu: ${Số lượng tối thiểu}${tab}Giá bán(VND: ${Giá bán(VND)}
  Log To Console            -------------------------------------------------------------------------------------------------------------------------------------------------------------
  Log To Console            Mã sản phẩm: ${Mã sản phẩm}${tab}Mã vạch: ${Mã vạch}
  Log To Console            -------------------------------------------------------------------------------------------------------------------------------------------------------------
  Log To Console            Thương hiệu: ${Thương hiệu} ${tab}Danh mục: ${Danh mục}
  Log To Console            -------------------------------------------------------------------------------------------------------------------------------------------------------------
  Log To Console            Thị trường xuất khẩu: ${Thị trường xuất khẩu}
  Log To Console            -------------------------------------------------------------------------------------------------------------------------------------------------------------
  Log To Console            Mô tả sản phẩm: ${Mô tả sản phẩm}
  Log To Console            =============================================================================================================================================================

Show details by Store 4     #Có khả năng cung ứng nhưng không có thương hiệu
  ${elements}       Get Elements      //*[contains(@class, 'w-full')][2]//*[contains(@class, 'flex')]/*[position()=2]
  ${Nhà cung cấp}           Get Text          ${elements}[2]
  ${Địa chỉ}                Get Text          ${elements}[3]
  ${Tên sản phẩm}           Get Text          ${elements}[5]
  ${Đơn vị tính}	          Get Text		      ${elements}[7]
  ${Theo quý}               Get Text          ${elements}[8]
  ${Theo tháng}             Get Text          ${elements}[10]
  ${Theo năm}               Get Text          ${elements}[11]
  ${Mã sản phẩm}            Get Text          ${elements}[13]
  ${Thương hiệu}            Set Variable      ${EMPTY}
  ${Mã vạch}                Get Text          ${elements}[16]
  ${Danh mục}               Get Text          ${elements}[17]
  ${Chủng loại giá}         Get Text          //*[contains(@class, 'font-normal')][2]
  ${Số lượng tối thiểu}     Get Text          //*[contains(@class, 'font-normal')][3]
  ${Giá bán(VND)}           Get Text          //*[contains(@class, 'font-normal')][4]
  Log To Console            ${EMPTY}
  Log To Console            CHI TIẾT SẢN PHẨM
  Log To Console            =============================================================================================================================================================
  Log To Console            Thông tin nhà cung cấp
  Log To Console            *************************************************************************************************************************************************************
  Log To Console            Nhà cung cấp: ${Nhà cung cấp}${tab}Địa chỉ: ${Địa chỉ}
  Log To Console            -------------------------------------------------------------------------------------------------------------------------------------------------------------
  Log To Console            Tên sản phẩm: ${Tên sản phẩm}${tab}Đơn vị tính: ${Đơn vị tính}
  Log To Console            -------------------------------------------------------------------------------------------------------------------------------------------------------------
  Log To Console            Khả năng cung ứng:
  Log To Console            Theo quý: ${Theo quý}${tab}Theo tháng: ${Theo tháng}${tab}Theo năm: ${Theo năm}
  Log To Console            -------------------------------------------------------------------------------------------------------------------------------------------------------------
  Log To Console            Bảng giá sản phẩm:
  Log To Console            1. Chủng loại giá: ${Chủng loại giá}${tab}Số lượng tối thiểu: ${Số lượng tối thiểu}${tab}Giá bán(VND: ${Giá bán(VND)}
  Log To Console            -------------------------------------------------------------------------------------------------------------------------------------------------------------
  Log To Console            Mã sản phẩm: ${Mã sản phẩm}${tab}Mã vạch: ${Mã vạch}
  Log To Console            -------------------------------------------------------------------------------------------------------------------------------------------------------------
  Log To Console            Thương hiệu: ${Thương hiệu} ${tab}Danh mục: ${Danh mục}
  Log To Console            =============================================================================================================================================================
