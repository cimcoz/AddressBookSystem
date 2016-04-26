package com.project.contact.controller;

import com.project.contact.object.ParsePinYin;
import org.junit.Test;

/**
 * Created by jwl on 2016/4/26.
 */
public class TestController {
    @Test
    public void test(){
        System.out.println(new ParsePinYin().getFullSpell("行业"));
    }
}
