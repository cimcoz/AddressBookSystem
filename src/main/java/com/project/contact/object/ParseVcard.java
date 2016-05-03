package com.project.contact.object;

import com.project.contact.dao.PhoneEntity;
import net.sourceforge.cardme.engine.VCardEngine;
import net.sourceforge.cardme.vcard.VCard;
import net.sourceforge.cardme.vcard.exceptions.VCardParseException;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by jwl on 2016/5/2.
 */
public class ParseVcard {
    private File[] vcardFiles = null;
    private VCardEngine vcardEngine = new VCardEngine();

    public List<PhoneEntity> parser(File file){
        List<PhoneEntity> list=new ArrayList<>();
        List vcards = new ArrayList();
        for(int i = 0; i < vcardFiles.length; i++) {
            try {
                VCard vcard = vcardEngine.parse(file);
                vcards.add(vcard);
            }
            catch(IOException ioe) {
                System.err.println("Could not read vcard file: "+vcardFiles[i].getAbsolutePath());
                ioe.printStackTrace();
            } catch (VCardParseException e) {
                e.printStackTrace();
            }
        }

        return vcards;
    }
}
