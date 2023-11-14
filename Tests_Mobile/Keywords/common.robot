*** Settings ***
Library             AppiumLibrary
Library             FakerLibrary        locale=en_IN
Library             String

*** Variables ***
${URL_DEFAULT}          http://localhost:4723/wd/hub
${platformName}         Android
${deviceName}           R92W7082RKY
${appPackage_browser}           com.sec.android.app.sbrowser
${appActivity_browser}          com.sec.android.app.sbrowser.SBrowserMainActivity

${automationName}       Uiautomator2
${URL}                  https://b2b.balance.ari.com.vn/#/
${BROWSER_TIMEOUT}      60 seconds

${SEARCH_URL}           //android.widget.EditText[@resource-id="com.sec.android.app.sbrowser:id/location_bar_edit_text"]
${APP}                  com.sec.android.app.sbrowser:id/deep_link_icon

##TỌA ĐỘ NÚT "THÔNG TIN CÁ NHÂN" ##
${X_profile}        441
${Y_profile}        305

##TỌA ĐỘ NÚT "ĐỔI MẬT KHẨU" ##
${X_changePassword}        427
${Y_changePassword}        386

##TỌA ĐỘ NÚT "ĐỔI MẬT KHẨU" ##
${X_logout}        421
${Y_logout}        473

${USER_STORE}          minhminh@getnada.com
${USER_SUPPLIER}       ha@getnada.com
${PASSWORD}            Nhat@01101999

${Nút trở về}         4
${Nút home}           3

*** Keywords ***
Get Element Form Item By Name
  [Arguments]               ${name}                           ${xpath}=${EMPTY}
  [Return]                  //android.view.View[@text="${name}"]/../../*[contains(@class, "android.view.View")]${xpath}

Click "${text}" button
    IF  '${text}' == 'Thêm quản trị viên'
        ${element}=               set variable          //android.widget.Button[@text=" ${text}"]
    ELSE IF  '${text}' != 'Thêm quản trị viên'
        ${element}=               set variable          //android.widget.Button[@text="${text}"]
    END
    wait until page contains element          ${element}          ${BROWSER_TIMEOUT}
    click element           ${element}

Click link "${text}"
    ${element}=         set variable        //android.widget.TextView[@text="${text}"]
    wait until page contains element          ${element}          ${BROWSER_TIMEOUT}
    click element       ${element}

Open App Balance
    open application    ${URL_DEFAULT}    platformName=${platformName}    deviceName=${deviceName}      appPackage=${appPackage_browser}    appActivity=${appActivity_browser}      automationName=Uiautomator2
    press keycode       ${Nút home}
    ${element}    set variable      //android.widget.TextView[@text="Balance"]
    wait until page contains element      ${element}
    click element       ${element}

Tear Down
    swipe   160     1574      0     300     100
    ${element}      set variable      //android.widget.Button[@text="Đóng tất cả"]
    wait until page contains element      ${element}
    click element                         ${element}

Logout Account
    ${element}=               set variable          //android.widget.Image[@text="profile_pic"]
    wait until page contains element                ${element}      ${BROWSER_TIMEOUT}
    click element                                   ${element}
    sleep                               0.5
    click element at coordinates        ${X_logout}     ${Y_logout}
    Tear Down

Display popup with "${text}"
    wait until page contains element          //android.widget.TextView[@resource-id="swal2-title"]     ${BROWSER_TIMEOUT}
    Element Text Should Be     //android.widget.TextView[@resource-id="swal2-title"]          ${text}

User look message "${message}" popup
    wait until page contains element          //android.widget.TextView[@resource-id="swal2-html-container"]        ${BROWSER_TIMEOUT}
    Element Text Should Be    //android.widget.TextView[@resource-id="swal2-html-container"]           ${message}
    wait until page contains element          //android.widget.Button[@text="Close this dialog"]       ${BROWSER_TIMEOUT}
    ${passed}                 run keyword and return status
                            ...   element should be visible     //android.widget.Button[@text="Close this dialog"]
    IF    '${passed}' == 'True'
        click element          //android.widget.Button[@text="Close this dialog"]
    END

User look ${name} with "${text}"
#    IF  '${text}' == 'Thông tin cá nhân'
#        swipe     337     386      0       500       100
#    END
    ${element}=         set variable        //android.view.View/android.widget.TextView[@text="${text}"]
    wait until page contains element          ${element}          ${BROWSER_TIMEOUT}
    element text should be                  ${element}          ${text}

# Tạo một văn bản ngẫu nhiên dựa trên loại và giá trị đầu vào.
Get Random Text
  [Arguments]               ${type}                           ${text}
  ${symbol}                 Set Variable                      _RANDOM_
  ${new_text}               Set Variable
  ${containsS}=             Get Regexp Matches                ${text}                       _@(.+)@_                    1
  ${cntS}=                  Get length                        ${containsS}
  ${contains}=              Get Regexp Matches                ${text}                       ${symbol}
  ${cnt}=                   Get length                        ${contains}
  IF  ${cntS} > 0
    ${new_text}=            Set Variable                      ${STATE["${containsS[0]}"]}
    ${symbol}=              Set Variable                      _@${containsS[0]}@_
  ELSE IF  ${cnt} > 0 and '${type}' == 'fullname'
    ${new_text}=            FakerLibrary.Name
  ELSE IF  ${cnt} > 0 and '${type}' == 'test name'
    ${random}=              FakerLibrary.Sentence             nb_words=3
    ${words}=               Split String                      ${TEST NAME}                  ${SPACE}
    ${new_text}=            Set Variable                      ${words[0]} ${random}
  ELSE IF  ${cnt} > 0 and '${type}' == 'name code'
    ${random}=              FakerLibrary.Random Int           min=00000             max=99999
    ${name}=               Set Variable                       USR
    ${new_text}=            Set Variable                      ${name}${random}
  ELSE IF  ${cnt} > 0 and '${type}' == '7 character'
    ${random}=              FakerLibrary.Random Int           min=0000             max=9999
    ${name}=               Set Variable                       USR
    ${new_text}=            Set Variable                      ${name}${random}
  ELSE IF  ${cnt} > 0 and '${type}' == '> 12 character'
    ${random}=              FakerLibrary.Random Int           min=100000000             max=999999999
    ${name}=               Set Variable                       USER
    ${new_text}=            Set Variable                      ${name}${random}
  ELSE IF  ${cnt} > 0 and '${type}' == 'phone_invalid'
    ${new_text}=            FakerLibrary.Random Int           min=1000000000000             max=9999999999999
    ${new_text}=            Convert To String                 ${new_text}
  ELSE IF  ${cnt} > 0 and '${type}' == 'phone > 12 number'
    ${new_text}=            FakerLibrary.Random Int           min=10000000000000             max=99999999999999
    ${new_text}=            Convert To String                 ${new_text}
  ELSE IF  ${cnt} > 0 and '${type}' == 'Tax > 999%'
    ${new_text}=            FakerLibrary.Random Int           min=1000             max=9999
    ${new_text}=            Convert To String                 ${new_text}
  ELSE IF  ${cnt} > 0 and '${type}' == 'Tax < 0%'
    ${new_text}=            FakerLibrary.Random Int           min=0             max=9999
    ${new_text}=            Convert To String                 --${new_text}
  ELSE IF  ${cnt} > 0 and '${type}' == 'Tax valid'
    ${new_text}=            FakerLibrary.Random Int           min=0             max=999
    ${new_text}=            Convert To String                 ${new_text}
  ELSE IF  ${cnt} > 0 and '${type}' == 'nhập hàng'
    ${new_text}=            FakerLibrary.Random Int           min=0             max=10
    ${new_text}=            Convert To String                 ${new_text}
  ELSE IF  ${cnt} > 0 and '${type}' == 'number < 16'
    ${new_text}=            FakerLibrary.Random Int           min=0             max=15
    ${new_text}=            Convert To String                 ${new_text}
  ELSE IF  ${cnt} > 0 and '${type}' == 'number < 12'
    ${new_text}=            FakerLibrary.Random Int           min=0             max=11
    ${new_text}=            Convert To String                 ${new_text}
  ELSE IF  ${cnt} > 0 and '${type}' == 'percentage'
    ${new_text}=            FakerLibrary.Random Int           max=100
    ${new_text}=            Convert To String                 ${new_text}
  ELSE IF  ${cnt} > 0 and '${type}' == 'paragraph'
    ${new_text}=            FakerLibrary.Paragraph
  ELSE IF  ${cnt} > 0 and '${type}' == 'email'
    ${new_text}=            FakerLibrary.Email
  ELSE IF  ${cnt} > 0 and '${type}' == 'password'
    ${email}=            FakerLibrary.Email
    ${name}=               Set Variable                       N
    ${number}=            FakerLibrary.Random Int           min=00             max=99
    ${new_text}=            Set Variable                      ${name}${email}${number}
  ELSE IF  ${cnt} > 0 and '${type}' == 'Email'
    ${number}=            FakerLibrary.Random Int           min=00             max=99
    ${name}=               Set Variable                       t
    ${number_7}=            FakerLibrary.Random Int           min=1000000             max=9999999
    ${new_text}=            Set Variable                      ${number}${name}${number_7}@husc.edu.vn
  ELSE IF  ${cnt} > 0 and '${type}' == 'phone'
    ${new_text}=            FakerLibrary.Random Int           min=1000000                  max=9999999
    ${new_text}=            Convert To String                 094${new_text}
  ELSE IF  ${cnt} > 0 and '${type}' == 'phone_7'
    ${new_text}=            FakerLibrary.Random Int           min=0000000                  max=9999999
    ${new_text}=            Convert To String                 ${new_text}
  ELSE IF  ${cnt} > 0 and '${type}' == 'phone_invalid'
    ${new_text}=            FakerLibrary.Random Int           min=0000000000000             max=9999999999999
    ${new_text}=            Convert To String                 ${new_text}
  ELSE IF  ${cnt} > 0 and '${type}' == 'fax_7'
    ${new_text}=            FakerLibrary.Random Int           min=0000000                  max=9999999
    ${new_text}=            Convert To String                 ${new_text}
  ELSE IF  ${cnt} > 0 and '${type}' == 'fax_valid'
    ${new_text}=            FakerLibrary.Random Int           min=1000                 max=9999
    ${new_text}=            Convert To String                 84234${new_text}
  ELSE IF  ${cnt} > 0 and '${type}' == 'fax_invalid'
    ${new_text}=            FakerLibrary.Random Int           min=1000000000000            max=9999999999999
    ${new_text}=            Convert To String                 ${new_text}
  ELSE IF  ${cnt} > 0 and '${type}' == 'number'
    ${new_text}=            FakerLibrary.Random Int           min=55555555                  max=999999999999
    ${new_text}=            Convert To String                 ${new_text}
  ELSE IF  ${cnt} > 0 and '${type}' == 'cost'
    ${new_text}=            FakerLibrary.Random Int           min=1000000                  max=99999999
    ${new_text}=            Convert To String                 ${new_text}
  ELSE IF  ${cnt} > 0 and '${type}' == 'otp'
    ${new_text}=            FakerLibrary.Random Int           min=100000                  max=999999
    ${new_text}=            Convert To String                 ${new_text}
  ELSE IF  ${cnt} > 0 and '${type}' == '%'
    ${new_text}=            FakerLibrary.Random Int           min=0                  max=100
    ${new_text}=            Convert To String                 ${new_text}
  ELSE IF  ${cnt} > 0 and '${type}' == 'color'
    ${new_text}=            FakerLibrary.Safe Hex Color
  ELSE IF  ${cnt} > 0 and '${type}' == 'date'
    ${new_text}=            FakerLibrary.Date  	              pattern=%d-%m-%Y
  ELSE IF  ${cnt} > 0 and '${type}' == 'dd/mm/yyyy'
    ${new_text}=            FakerLibrary.Date  	              pattern=%d/%m/2023
  ELSE IF  ${cnt} > 0 and '${type}' == 'word'
    ${new_text}=            FakerLibrary.Sentence             nb_words=600
  ELSE IF  ${cnt} > 0 and '${type}' == '> 500 character'
    ${new_text}=            FakerLibrary.Sentence             nb_words=700
  ELSE IF  ${cnt} > 0 and '${type}' == '2000 word'
    ${new_text}=            FakerLibrary.Sentence             nb_words=2000
  ELSE IF  ${cnt} > 0 and '${type}' == 'Barcode_valid'
    ${new_text}=            FakerLibrary.Random Int           min=1000000000000             max=9999999999999
    ${new_text}=            Convert To String                 ${new_text}
  ELSE IF  ${cnt} > 0 and '${type}' == 'Barcode_invalid'
    ${new_text}=            FakerLibrary.Random Int           min=10000000000000             max=99999999999999
    ${new_text}=            Convert To String                 ${new_text}
  ELSE IF  ${cnt} > 0 and '${type}' == 'voucher invalid'
    ${new_text}=            FakerLibrary.Random Int           min=1000000000000000000000             max=9999999999999999999999
    ${new_text}=            Convert To String                 ${new_text}
  ELSE IF  ${cnt} > 0 and '${type}' == 'giá trị'
    ${new_text}=            FakerLibrary.Random Int           min=10000             max=100000
    ${new_text}=            Convert To String                 ${new_text}
  ELSE IF  ${cnt} > 0 and '${type}' == 'điều kiện'
    ${new_text}=            FakerLibrary.Random Int           min=500000             max=1000000
    ${new_text}=            Convert To String                 ${new_text}
  ELSE IF  ${cnt} > 0 and '${type}' == 'số lượng'
    ${new_text}=            FakerLibrary.Random Int           min=0             max=100
    ${new_text}=            Convert To String                 ${new_text}
  ELSE IF  ${cnt} > 0 and '${type}' == 'Mã voucher'
    ${new_text}=            FakerLibrary.Random Int           min=10000             max=99999
    ${new_text}=            Convert To String                 Voucher${new_text}
  ELSE IF  ${cnt} > 0 and '${type}' == 'number > 999999'
    ${new_text}=            FakerLibrary.Random Int           min=999999             max=9999999
    ${new_text}=            Convert To String                 ${new_text}
  ELSE IF  ${cnt} > 0 and '${type}' == 'Mã nhập hàng'
    ${new_text}=            FakerLibrary.Random Int           min=10000000000000             max=99999999999999
    ${new_text}=            Convert To String                 RNSTR${new_text}
  ELSE IF  ${cnt} > 0 and '${type}' == 'Mã hủy hàng'
    ${new_text}=            FakerLibrary.Random Int           min=10000000000000             max=99999999999999
    ${new_text}=            Convert To String                 DNSTR${new_text}
  ELSE IF  ${cnt} > 0 and '${type}' == 'Mã trả hàng'
    ${new_text}=            FakerLibrary.Random Int           min=10000000000000             max=99999999999999
    ${new_text}=            Convert To String                 GRNSTR${new_text}
  ELSE IF  ${cnt} > 0 and '${type}' == 'Mã chuyển hàng'
    ${new_text}=            FakerLibrary.Random Int           min=10000000000000             max=99999999999999
    ${new_text}=            Convert To String                 GTNSTR${new_text}
  ELSE IF  ${cnt} > 0 and '${type}' == 'Mã yêu cầu'
    ${new_text}=            FakerLibrary.Random Int           min=0000             max=9999
    ${new_text}=            Convert To String                 SRS${new_text}
  ELSE IF  ${cnt} > 0 and '${type}' == 'Số tiền thanh toán'
    ${new_text}=            FakerLibrary.Random Int           min=100000000             max=1000000000
    ${new_text}=            Convert To String                 ${new_text}
  ELSE IF  ${cnt} > 0 and '${type}' == 'text > 255'
    ${new_text}=            FakerLibrary.Sentence             nb_words=255
  ELSE IF  ${cnt} > 0
    ${new_text}=            FakerLibrary.Sentence
  END
    ${cnt}=                 Get Length                        ${text}
  IF  ${cnt} > 0
    ${text}=                Replace String                    ${text}                       ${symbol}                   ${new_text}
  END
    [Return]    ${text}
