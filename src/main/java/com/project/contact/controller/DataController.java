package com.project.contact.controller;

import com.project.contact.dao.GroupsEntity;
import com.project.contact.dao.GroupsRecordEntity;
import com.project.contact.dao.PhoneEntity;
import com.project.contact.model.Groups;
import com.project.contact.model.GroupsRecord;
import com.project.contact.model.Phone;
import com.project.contact.object.ParseGroup;
import com.project.contact.object.ParseJson;

import com.project.contact.object.ParsePinYin;
import org.apache.commons.io.FileUtils;
import org.hibernate.annotations.Parameter;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;

/**
 * Created by jwl on 2016/4/24.
 */
@Controller
@RequestMapping(value = "/data")
public class DataController {
    /* ----------------Groups------------------------ */
    //OK
    @RequestMapping(value = "/allGroup", produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String getAllGroups(Groups groups, HttpSession httpSession) {
        List<GroupsEntity> list = groups.getGroupsByUserId((Integer) httpSession.getAttribute("userId"));
        String json = new ParseJson().groupsToJson(list);
        return json;
    }

    //OK
    @RequestMapping(value = "/group", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String addGroups(@RequestParam(value = "name") String name, HttpSession httpSession) {
        Groups groups = new Groups();
        if ("".equals(name) || name == null) {
            return "0";
        } else {
            groups.addGroup((int) httpSession.getAttribute("userId"), name);
            return "1";
        }
    }

    //OK
    @RequestMapping(value = "/group", method = RequestMethod.DELETE, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String deleteGroup(@RequestParam(value = "id", required = true) Integer id, HttpSession httpSession) {
        int userId;
        userId = (int) httpSession.getAttribute("userId");
        Groups groups = new Groups();
        GroupsRecord groupsRecord = new GroupsRecord();
        if (groups.deleteGroupById(id, userId) && groupsRecord.deleteGroupsRecordByGroupId(id, userId)) {
            return "1";
        } else {
            return "0";
        }
    }
    /* ---------------------------------------- */

    /* ----------------Phone------------------------ */
    //OK
    @RequestMapping(value = "/phone", method = RequestMethod.GET, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String getPhone(HttpSession httpSession, Phone phone, HttpServletRequest httpServletRequest) throws IOException {
        Integer userId = (Integer) httpSession.getAttribute("userId");
        List<PhoneEntity> list = phone.getAll(userId);
        String json = new ParseJson().phoneToJson(list);
        return json;
    }

    @RequestMapping(value = "/phone", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String addPhone(@ModelAttribute PhoneEntity phoneEntity,HttpSession httpSession){
        Integer userId = (Integer) httpSession.getAttribute("userId");
        phoneEntity.setUserId(userId);
        Phone phone =new Phone();
        //转拼音
        String name=phoneEntity.getName();
        if(name!=null||!"".equals(name)){
            phoneEntity.setPinyin(new ParsePinYin().getFullSpell(name));
        }
        if(phone.addPhone(phoneEntity)){
            return "1";
        }else{
            return "0";
        }
    }

    @RequestMapping(value = "/phone", method = RequestMethod.DELETE, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String deletePhone(@RequestParam(value = "id", required = true) Integer id, HttpSession httpSession) {
        int userId;
        //TODO phoneRecord要删除
        userId = (int) httpSession.getAttribute("userId");
        Phone phone = new Phone();
        if (phone.deletePhoneById(id, userId) ) {
            return "1";
        } else {
            return "0";
        }
    }

    @RequestMapping(value = "/searchPhone", method = RequestMethod.GET, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String allPhone(@RequestParam("search") String search, HttpSession httpSession, Phone phone, HttpServletRequest httpServletRequest) throws IOException {
        Integer userId = (Integer) httpSession.getAttribute("userId");
        System.out.println(search);
        List<PhoneEntity> list;
        if ("".equals(search) || search == null) {
            list = phone.getAll(userId);
        } else {
            list = phone.getPhoneBySearch(search, userId);
        }
        String json = new ParseJson().phoneToJson(list);
        return json;
    }
    /* ---------------------------------------- */

    /* ----------------GroupsRecord------------------------ */
    @RequestMapping(value = "/groupPhone", method = RequestMethod.GET, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String phoneByGroup(@RequestParam("id") Integer id, HttpSession httpSession){
        int userId=(int)httpSession.getAttribute("userId");
        GroupsRecord groupsRecord=new GroupsRecord();
        ParseGroup parseGroup=new ParseGroup();
        ParseJson parseJson=new ParseJson();
        List<PhoneEntity>list=parseGroup.getGroupAll(id,userId);
        System.out.println(list);
        String json=parseJson.phoneToJson(list);
        return json;
    }


    @RequestMapping(value = "/groupsRecord", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String addGroupsRecord(@ModelAttribute GroupsRecordEntity groupsRecordEntity,HttpSession httpSession){
        int userId=(int)httpSession.getAttribute("userId");
        GroupsRecord groupsRecord=new GroupsRecord();
        if(groupsRecord.addGroupsRecord(userId,groupsRecordEntity)){
            return "1";
        }else{
            return "0";
        }
    }
    /* ---------------------------------------- */
    @RequestMapping(value = "/upload", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String upload(@RequestParam("file") MultipartFile multipartFile) throws IOException {
        if(!multipartFile.isEmpty()){
            FileUtils.copyInputStreamToFile(multipartFile.getInputStream(),new File("H:\\apache-tomcat-9.0.0.M4\\webapps\\contact\\src\\main\\webapp\\WEB-INF\\uploads\\head\\",System.currentTimeMillis()+ multipartFile.getOriginalFilename()));
            return "/uploads/head/"+System.currentTimeMillis()+ multipartFile.getOriginalFilename();
        }else{
            return "0";
        }
    }

}
