package com.project.contact.object;

import com.project.contact.dao.GroupsEntity;
import com.project.contact.dao.PhoneEntity;
import org.json.JSONArray;
import org.json.JSONObject;

import java.util.List;

/**
 * Created by jwl on 2016/4/24.
 */
public class ParseJson {
    /**
     * phone json转换
     *
     * @param list
     * @return String
     * private int id;
     * private int userId;
     * private String number;
     * private String name;
     * private String pinyin;
     * private String email;
     * private String qq;
     * private Timestamp createAt;
     * private String number2;
     * private String workAddress;
     * private String homeAddress;
     * private String birthday;
     * private String homePage;
     * private String postCode;
     * private String image;
     */
    public String phoneToJsonDetail(List<PhoneEntity> list) {
        JSONArray json = new JSONArray();
        ParseGroup parseGroup=new ParseGroup();
        for(int i=0;i<list.size();i++){
            PhoneEntity v=list.get(i);
            if(v!=null){
                JSONObject tmp = new JSONObject();
                tmp.put("id", v.getId());
                tmp.put("user_id", v.getUserId());
                tmp.put("number",v.getNumber());
                tmp.put("number2",v.getNumber2());
                tmp.put("name", v.getName());
                tmp.put("pinyin",v.getPinyin());
                tmp.put("email",v.getPinyin());
                tmp.put("qq",v.getQq());
                tmp.put("work_address",v.getWorkAddress());
                tmp.put("home_address",v.getHomeAddress());
                tmp.put("birthday",v.getBirthday());
                tmp.put("home_page",v.getHomePage());
                tmp.put("post_code",v.getPostCode());
                tmp.put("image",v.getImage());
                String group=parseGroup.parsePhoneGroup(v);
                tmp.put("group",group);
                json.put(tmp);
            }
        }
        return json.toString();
    }
    public String phoneToJson(List<PhoneEntity> list) {
        JSONArray json = new JSONArray();
        ParseGroup parseGroup=new ParseGroup();
        for(int i=0;i<list.size();i++){
            PhoneEntity v=list.get(i);
            if(v!=null){
                JSONObject tmp = new JSONObject();
                tmp.put("id", v.getId());
                tmp.put("user_id", v.getUserId());
                tmp.put("number",v.getNumber());
                tmp.put("number2",v.getNumber2());
                tmp.put("name", v.getName());
                tmp.put("email",v.getPinyin());
                String group=parseGroup.parsePhoneGroup(v);
                tmp.put("group",group);
                json.put(tmp);
            }
        }
        return json.toString();
    }

    public String groupsToJson(List<GroupsEntity> list){
        JSONArray json=new JSONArray();
        for(GroupsEntity v:list){
            JSONObject tmp =new JSONObject();
            tmp.put("id",v.getId());
            tmp.put("user_id",v.getUserId());
            tmp.put("name",v.getName());
            json.put(tmp);
        }
        return json.toString();
    }
}
