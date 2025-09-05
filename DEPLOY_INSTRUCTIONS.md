## Hướng dẫn sửa lỗi 404 khi deploy lên Render

### Các thay đổi đã thực hiện:

1. **Servlet mapping**: Sửa EmailListServlet để hỗ trợ cả 2 URL patterns:

   ```java
   @WebServlet({"/survey", "/emailList"})
   ```

2. **web.xml**: Thêm servlet mapping rõ ràng:

   ```xml
   <servlet>
       <servlet-name>EmailListServlet</servlet-name>
       <servlet-class>murach.email.EmailListServlet</servlet-class>
   </servlet>

   <servlet-mapping>
       <servlet-name>EmailListServlet</servlet-name>
       <url-pattern>/survey</url-pattern>
   </servlet-mapping>

   <servlet-mapping>
       <servlet-name>EmailListServlet</servlet-name>
       <url-pattern>/emailList</url-pattern>
   </servlet-mapping>
   ```

3. **Welcome file**: Cập nhật welcome-file-list:

   ```xml
   <welcome-file-list>
       <welcome-file>survey</welcome-file>
       <welcome-file>index.html</welcome-file>
       <welcome-file>index.jsp</welcome-file>
   </welcome-file-list>
   ```

4. **Form action**: Cập nhật tất cả form action từ "emailList" thành "survey"

### Để deploy lên Render:

1. **Sử dụng file WAR** từ thư mục `target/Baitap2.war`
2. **Hoặc sử dụng Dockerfile** có sẵn trong project
3. **Kiểm tra URL**:
   - `/survey` - URL chính
   - `/emailList` - URL backup (tương thích ngược)
   - `/` - Trang chủ (auto redirect)

### Test local:

- Deploy file WAR lên Tomcat local trước khi upload lên Render
- Kiểm tra cả 2 URL `/survey` và `/emailList` đều hoạt động

### Nếu vẫn lỗi 404:

1. Kiểm tra Context Path trên Render
2. Đảm bảo tất cả dependencies (JSTL) được include trong WAR
3. Kiểm tra Tomcat logs trên Render để xem lỗi cụ thể
