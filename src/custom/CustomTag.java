/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package custom;

import java.io.IOException;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyContent;
import javax.servlet.jsp.tagext.BodyTagSupport;

/**
 *
 * @author User
 */
public class CustomTag extends BodyTagSupport {

    private String item;

    public String getItem() {
        return item;
    }

    public void setItem(String item) {
        this.item = item;
    }
    @Override
    public int doStartTag() throws JspException {
        JspWriter out=pageContext.getOut();
        try{
            if(item.length()==0||item.equals("0")==true)out.print("*");

        }catch(Exception e){e.printStackTrace();}

        return SKIP_BODY;
    }

}
