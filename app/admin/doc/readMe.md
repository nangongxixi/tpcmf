##一：默认密码
    所有新增客户 和 新增员工 的初始密码，均在系统管理 -> 系统设置中设定


##二：意向客户
####2.1 添加
    所属员工下拉：role(user.role_id)->name = '普通员工' (角色是普通员工)
                 user.status = Config::USER_STATUS_YES （状态为“正常”）
                
    审核操作员下拉：role(user.role_id)->name = '审核操作员' (角色是审核操作员)
                   user.status = Config::USER_STATUS_YES （状态为“正常”）
                   
####2.2 报单
###### 2.2.1 规则：
    1. 角色为超级管理员时
        a. 审核中： 可以注册客户，删除，通过，驳回
        b. 通过：  可以注册客户，删除，驳回
        c. 驳回：  可以注册客户，删除，通过，重新报单
         
    2. 登录者角色是系统员工本人，自己的客户
        a. 状态为 审核中 时不能有任何操作
        b. 状态为 通过 时可以注册客户
        c. 状态为 驳回 时可以重新报单
        
    3. 角色是审核操作员 且 指定审核员为当前登录人
        a. 审核中：   可以通过，驳回
        b. 通过/驳回： 不能有任何操作
        

        
###### 客户状态在不同角色的情况下，按钮的显示
|   角色 | 状态码 | 状态 | 按钮 |
|:----:|:----:|:----:|:----:|
|超级管理员 |1      | 审核中 | 【注册客户】【删除】【通过】【驳回】  
|        |  2     | 通过  |   【注册客户】【删除】【驳回】     |
|       |   3    | 驳回   | 【注册客户】【删除】【通过】【重新报单】    |
|系统员工 |1      | 审核中 |   |
|        |  2     | 通过  | 【注册客户】     |
|       |   3    | 驳回   | 【重新报单】    |
|       |       |       |       |  |
| 审核操作员|   1 | 审核中  |【通过】【驳回】  |
|       |    2   | 通过   |       |      |
|       |    3   | 驳回   |      |

####2.3 操作按钮说明
    【注册客户】：只有通过了审核的才能注册
        user.id = customer.worker_uid (当前登录员工 = 客户所属员工)
        customer.check_status = Config::CUSTOMER_STATUS_2 (审核状态 = 通过)
        
    【通过、驳回】：
        role(user.role_id）->name = '审核操作员' (当前登录者角色身份是审核操作员)
        customer.check_uid = user.id (客户所属审核操作员id)
        customer.check_status = Config::CUSTOMER_STATUS_1 (审核状态 = 审核中)
                
        事件： sendMessage()
    
    【重新报单】：
        user.id = customer.worker_uid (当前登录员工 = 客户所属员工)
        customer.check_status = Config::CUSTOMER_STATUS_3 (审核状态 = 驳回)
        
    【删除】：
        role(user.role_id）->name = '超级管理员' （当前登录者是超级管理员）
        
####2.4 客户查询
###### 2.4.1 规则：
    1. 所有的用户都可查看信息
    2. 只有 登陆者是员工本人 才可以操作 ‘编辑’、‘所属员工’、‘停用’、‘启用’等功能
    3. 所有审核员登录进来只能查看
    4. 超级管理员不限
    
###### 2.4.2 列表及按钮：
|   角色 | 状态码 | 状态 | 按钮 | 
|:----:|:----:|:----:|:----:|
|超级管理员 |1      | 正常 | 【查看】【编辑】【所属员工】【停用】【删除】
|           |2  | 停用 | 【查看】【编辑】【所属员工】【启用】【删除】
|       |       |       |       |  |
|系统员工本人 |1  | 正常 | 【查看】【编辑】【所属员工】【停用】
|           |2  | 停用 | 【查看】【编辑】【所属员工】【启用】
|       |       |       |       |  |
| 非本人 / 审核员|   1 | 正常 |【查看】
|       |    2   | 停用   |   【查看】 
    
    
##三：聊天
####3.1发送消息
###### user_type 为 1, uid为XXX的客服 发了一条消息给 form_uid为XXX的客户
###### user_type 为 2, uid为XXX的客户 发了一条消息给 form_uid为XXX的客服
    user_type: 发送者身份（1客服，2客户）
    
    当没有客服登录时，默认发送给超级管理员
    $from_uid = cmf_get_current_admin_id() ?? 1;
    
    getUid() //发送者Id   
     
    发送者为客服时: uid = user.id,            
                   from_uid = customer.id
                   user_type = 1
            
    发送者为客户时: uid = customer.id, 
                   from_uid = user.id
                   user_type = 2

        
####3.1聊天记录
###### 第一人称可能是发送者（uid）, 也可能是接收者（from_uid）
    客服1和所有客户聊天记录: select * from dj_message where user_type=1 and (uid=1 or from_uid=1);
    客服1和客户9的聊天记录: select * from dj_message where (user_type=1 and uid=1 and from_uid=9) or (user_type=2 and uid=9 and from_uid=1)
    
    客户1和所有客服聊天记录: select * from dj_message where user_type=2 and (uid=1 or from_uid=1);
    客户1和客服9的聊天记录: select * from dj_message where (user_type=2 and uid=1 and from_uid=9) or (user_type=1 and uid=9 and from_uid=1)
    
##四：通知
 ###### 4.1 插入   
    客户有操作时插入一条通知记录，当前只有修改密码插入了    
    customerInfo(); 客户详情
    addNotice(); 插入通知
  ###### 4.2 阅读
    状态：1已读，2未读
    
    read()
    管理端客服点击阅读： update from dj_notice set is_read=1 where id=3
   ###### 4.2 列表
    所有通知  未读红点标识
    点击后read(); 红点消失
    
####打印SQL：echo DB::name('customer')->getLastSql();

##附：接口列表
#### 请求地址：http://www.dj.com/api.php?s=
####  消息部分
|   名称 | 地址 | 参数 | 返回 | 
|:----:|:----:|:----:|:----:|
客户聊天总条数 | message/index/customerMessageNums | 'token'  | int: 6
客服聊天总条数 | message/index/userMessageNums |   | int: 6
客服和某客户聊天总条数 | message/index/userToCustomerMessageNums | 'token'  | int: 6
|       |       |       |       |
客服发送消息 | message/index/userSendMessage |  'token'  | array: ['code' => 200, 'msg' => 'success']
客户发送消息 | message/index/customerSendMessage |  'token'  | array: ['code' => 200, 'data' => 'success']
|       |       |       |       |
客户和所有客服的聊天记录 | message/index/customerMessageListAll |  'token' / 'page' / 'nums' | array: ['code' => 200, 'data' => $list]
客服和所有客户的消息记录 | message/index/userMessageListAll |  'token' / 'page' / 'nums'  | array: ['code' => 200, 'data' => $list]
客服和某客户的消息记录 | message/index/userMessageList |  'token' / 'page' / 'nums'  | array: ['code' => 200, 'data' => $list]

####  客户部分
|   名称 | 地址 | 参数 | 返回 | 
|:----:|:----:|:----:|:----:|
客户忘记密码的提示语 | customer/index/forgetPwd |   | str: 'XXXXXX'
客户登录 | customer/index/login | 'username' / 'password'  |array: ['code' => 200, 'msg' => '登录成功','data' => ['token' => 'xxxx', 'nickname'=> '',avatar' => 'xxx']]
修改密码 | customer/index/resetPwd | 'token' / 'oldPwd' / 'newPwd'  | array: ['code' => 200, 'data' => 'success']

####  客服部分
|   名称 | 地址 | 参数 | 返回 | 
|:----:|:----:|:----:|:----:|
消息已读，未读数 | admin/user/isReadMessage |  |array: ['readYes' => 7, 'readNo' => 5]  
首页数量显示 | admin/user/infoNums |   |array: ['readYes'=>10, 'readNo'=>5, last_login_time' => xxx, 'last_login_ip', 'customerYX' => 5, 'customerDZC' => 5, 'customerZC' => 5, 'customerTY' => 5] 

####  通知部分 
|   名称 | 地址 | 参数 | 返回 | 
|:----:|:----:|:----:|:----:|
通知已读，未读数 | admin/notice/isReadNotice |  |array: ['readYes' => 7,'readNo' => 5] 
通知列表 | admin/notice/search |  |array: ['code' => 200, 'data' => $list] 
删除通知 | admin/notice/delNotice | $id |array: ['readYes' => 7, 'readNo' => 5] 