/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mybeans;

import java.io.*;
import java.net.URL;
import java.sql.*;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.StringTokenizer;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

/**
 *
 * @author tushar
 */
public class ShowStatus implements Serializable {

    Connection con;

    public ShowStatus() {

    }

    public void initializeDB(String url, String user, String password) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url, user, password);

        } catch (Exception e) {
        }
    }

    public void copyInputStream(InputStream in, OutputStream out) throws IOException {
        byte[] buffer = new byte[1024];
        int len = in.read(buffer);
        while (len >= 0) {
            out.write(buffer, 0, len);
            len = in.read(buffer);
        }
        in.close();
        out.close();
    }

    public File getZipFile(String filePath, File targetDir) {
        File zip = null;
        try {
            URL url = new URL("http://stats.mytoday.com/estatsbin/dlr_download?"
                    + filePath + "&feedid=364413");
            InputStream in = new BufferedInputStream(url.openStream(), 1024);
            // make sure we get the actual file

            zip = File.createTempFile("arc", ".zip", targetDir);
            OutputStream fout = new BufferedOutputStream(new FileOutputStream(zip));
            copyInputStream(in, fout);
        } catch (Exception e) {
        }
        return zip;
    }

    public ArrayList getDeliveryStatus(File file, String contacts_table, ArrayList campaignrequestids) {
        ArrayList delivery_status = new ArrayList();
        ArrayList delivery_status_element = null;
        String str = "";
        int i = 1;
        int j = 1;
        int count = 1;
        StringTokenizer st = null;
        StringBuffer sb = null;
        String token = "";

        try {
            PreparedStatement psmt = con.prepareStatement("select * from " + contacts_table + " where Number = ?");
            ResultSet rs = null;
            BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(file)));
            while ((str = br.readLine()) != null) {
                if (i++ == 1) {  // Skip First Line
                    continue;
                }

                st = new StringTokenizer(str, ",");
                j = 0;
                delivery_status_element = new ArrayList();

                while (st.hasMoreTokens()) {
                    j++;
                    token = st.nextToken();
                    if (j == 2 || j == 3) {
                        token = token.substring(token.indexOf('"') + 1, token.lastIndexOf('"'));
                        if (j == 2) {
                            token = token.substring(2);
                            delivery_status_element.add(token);
                            psmt.setString(1, token);
                            rs = psmt.executeQuery();
                            if (rs.next()) {
                                delivery_status_element.add(rs.getString("Name") + " " + rs.getString("Surname") + "(" + token + ")");
                            } else {
                                delivery_status_element.add("Unknown Name" + "(" + token + ")");
                            }
                            rs.close();
                        } else {
                            delivery_status_element.add(token);
                        }
                    }

                    if (j == 7) {
                        token = token.substring(token.indexOf('"') + 1, token.lastIndexOf('"'));
                        if (campaignrequestids.contains(Long.parseLong(token))) {
                            delivery_status.add(delivery_status_element);
                        }
                    }
                }
                count++;
            }
            br.close();

        } catch (Exception e) {
        }
        return delivery_status;
    }

    public File getCSVFile(File zip, File targetDir) {
        ZipFile zipFile = null;
        File file = null;

        try {
            zipFile = new ZipFile(zip);
            for (Enumeration entries = zipFile.entries(); entries.hasMoreElements();) {
                ZipEntry entry = (ZipEntry) entries.nextElement();
                file = new File(targetDir, entry.getName());
                copyInputStream(zipFile.getInputStream(entry),
                        new BufferedOutputStream(new FileOutputStream(file)));
            }
            zipFile.close();
        } catch (Exception e) {
        }
        return file;
    }

    public ArrayList getCampaignRequestIds(long campaignid) {
        ArrayList campaignrequestids = new ArrayList();
        try {
            PreparedStatement campaignstmt = con.prepareStatement("select * from campaigns_status where campaignid = ?");
            campaignstmt.setLong(1, campaignid);
            ResultSet rs = campaignstmt.executeQuery();
            while (rs.next()) {
                campaignrequestids.add(rs.getLong("requestid"));
            }
            rs.close();
        } catch (Exception e) {

        }
        return campaignrequestids;
    }
}
