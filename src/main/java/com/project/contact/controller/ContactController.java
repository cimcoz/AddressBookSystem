package com.project.contact.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by jwl on 2016/4/22.
 */
@Controller
@RequestMapping(value="/contact")
public class ContactController {
    /**
     * 联系人页面
     * @return view
     */
    @RequestMapping(value="/phone",method = RequestMethod.GET)
    public String indexPhone(){
        return "phone";
    }
    /**
     * 分组管理页面
     * @return view
     */
    @RequestMapping(value="/groupsManage",method=RequestMethod.GET)
    public String indexGroups(){
        return "groups";
    }
    /**
     * 修改密码
     * @return view
     */
    @RequestMapping(value="/changePass",method=RequestMethod.GET)
    public String indexChangePass(){
        return "changePass";
    }

}
