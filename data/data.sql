/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : PostgreSQL
 Source Server Version : 140001
 Source Host           : localhost:5432
 Source Catalog        : reviews
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 140001
 File Encoding         : 65001

 Date: 14/04/2023 13:35:35
*/


-- ----------------------------
-- Table structure for appreciation
-- ----------------------------
DROP TABLE IF EXISTS "public"."appreciation";
CREATE TABLE "public"."appreciation" (
  "id" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "author" varchar(40) COLLATE "pg_catalog"."default",
  "title" varchar(120) COLLATE "pg_catalog"."default",
  "description" varchar(120) COLLATE "pg_catalog"."default",
  "usefulcount" int4,
  "replycount" int4,
  "createdat" date,
  "userid" varchar(40) COLLATE "pg_catalog"."default",
  "time" date
)
;

-- ----------------------------
-- Records of appreciation
-- ----------------------------

-- ----------------------------
-- Table structure for appreciationcomment
-- ----------------------------
DROP TABLE IF EXISTS "public"."appreciationcomment";
CREATE TABLE "public"."appreciationcomment" (
  "commentid" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "id" varchar(255) COLLATE "pg_catalog"."default",
  "author" varchar(255) COLLATE "pg_catalog"."default",
  "userid" varchar(255) COLLATE "pg_catalog"."default",
  "comment" text COLLATE "pg_catalog"."default",
  "time" timestamp(6),
  "updatedat" timestamp(6),
  "histories" jsonb[]
)
;

-- ----------------------------
-- Records of appreciationcomment
-- ----------------------------

-- ----------------------------
-- Table structure for appreciationreaction
-- ----------------------------
DROP TABLE IF EXISTS "public"."appreciationreaction";
CREATE TABLE "public"."appreciationreaction" (
  "id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "author" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "userid" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "time" timestamp(6),
  "reaction" int2
)
;

-- ----------------------------
-- Records of appreciationreaction
-- ----------------------------

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS "public"."article";
CREATE TABLE "public"."article" (
  "id" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "title" varchar(300) COLLATE "pg_catalog"."default",
  "name" varchar(300) COLLATE "pg_catalog"."default",
  "description" varchar(1000) COLLATE "pg_catalog"."default",
  "type" varchar(40) COLLATE "pg_catalog"."default",
  "content" varchar(100000) COLLATE "pg_catalog"."default",
  "authorid" varchar(40) COLLATE "pg_catalog"."default",
  "tags" varchar[] COLLATE "pg_catalog"."default",
  "status" varchar(1) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO "public"."article" VALUES ('01', 'This is title 01', 'This is name 01', 'This is description 01', 'type 01', '<div class="key-event__content"> 
    <p>Trong phần thủ tục, các luật sư bảo vệ người bị hại đề nghị HĐXX xác định tỷ lệ thương tích của bị hại vào các ngày 7, 10, và 12.12.2021, nhằm xem xét xử lý các bị cáo hành vi “cố ý gây thương tích. </p> 
    <p>Bên cạnh đó, các luật sư đề nghị HĐXX xem xét và xác định Thái đồng phạm tội danh "giết người" với bị cáo Trang.</p>  
    <table class="picture" align="center"> 
     <tbody> 
      <tr> 
       <td class="pic"> <img data-image-id="3910826" src="https://image.thanhnien.vn/w2048/Uploaded/2022/bahgtm/2022_07_21/thai-2-3830.jpg" data-width="2560" data-height="1697" class="cms-photo" alt="Xét xử vụ bé gái 8 tuổi bị bạo hành tử vong: Tòa cân nhắc khi trình chiếu video hành vi phạm tội  - ảnh 1" caption="Xét xử vụ bé gái 8 tuổi bị bạo hành tử vong: Tòa cân nhắc khi trình chiếu video hành vi phạm tội  - ảnh 1"> </td> 
      </tr> 
      <tr>
       <td class="caption"><p>Bị cáo Trung Thái và Quỳnh Trang tại phiên tòa sáng 21.7</p>
        <div class="source">
         <p>ngọc dương</p>
        </div></td>
      </tr> 
     </tbody>
    </table> 
   </div>', '77c35c38c3554ea6906730dbcfeca0f2', '{tag01,tag02}', 'A');
INSERT INTO "public"."article" VALUES ('02', 'This is title 02', 'This is name 02', 'This is description 02', 'type 02', 'This is content 02', '77c35c38c3554ea6906730dbcfeca0f2', '{tag01,tag02}', 'A');
INSERT INTO "public"."article" VALUES ('03', 'This is title 03', 'This is name 03', 'This is description 03', 'type 03', 'This is content 03', '77c35c38c3554ea6906730dbcfeca0f2', '{tag01,tag02}', 'A');
INSERT INTO "public"."article" VALUES ('04', 'This is title 04', 'This is name 04', 'This is description 04', 'type 04', 'This is content 04', '77c35c38c3554ea6906730dbcfeca0f2', '{tag01,tag02}', 'A');
INSERT INTO "public"."article" VALUES ('05', 'This is title 05', 'This is name 05', 'This is description 05', 'type 05', 'This is content 05', '77c35c38c3554ea6906730dbcfeca0f2', '{tag01,tag02}', 'A');
INSERT INTO "public"."article" VALUES ('abw6F9-ap', 'Điều gì đang xảy ra với thị trường xăng dầu?', '', 'Việt Nam tự chủ được 70% nguồn cung, có 36 doanh nghiệp đầu mối lo nhập hàng, 17.000 cửa hàng bán lẻ nhưng người dân vẫn không mua được xăng dầu.', 'Kinh doanh', '<p class="Normal" style="letter-spacing: normal; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);">Ở TP HCM có 550 cửa hàng bán lẻ nhưng theo thống kê của quản lý thị trường, đến chiều qua, 137 cây xăng (chiếm 20% hệ thống) tại 19 quận, huyện thiếu hàng, đóng cửa. Nhiều người dân thậm chí phải dắt bộ xe máy nhiều cây số để tìm nơi đổ xăng.</p><figure data-size="true" itemprop="associatedMedia image" itemscope="" itemtype="http://schema.org/ImageObject" class="tplCaption action_thumb_added" style="letter-spacing: normal; margin-right: auto; margin-bottom: 15px; margin-left: auto; padding: 0px; text-rendering: optimizelegibility; max-width: 100%; clear: both; position: relative; text-align: center; width: 670px; float: left; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);"><div class="fig-picture" style="margin: 0px; padding: 0px 0px 376.698px; text-rendering: optimizelegibility; width: 670px; float: left; display: table; -webkit-box-pack: center; justify-content: center; background: rgb(240, 238, 234); position: relative;"><picture style="margin: 0px; padding: 0px; text-rendering: optimizelegibility;"><source data-srcset="https://i1-kinhdoanh.vnecdn.net/2022/10/12/-4371-1665550330.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=P5fMzE4p1lqAKYUOuSRUQg 1x, https://i1-kinhdoanh.vnecdn.net/2022/10/12/-4371-1665550330.jpg?w=1020&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=RjFIqvg2F1YgLt0Db4xEHQ 1.5x, https://i1-kinhdoanh.vnecdn.net/2022/10/12/-4371-1665550330.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=2&amp;fit=crop&amp;s=b4UQ-3_8skwK-EJQfClODA 2x" srcset="https://i1-kinhdoanh.vnecdn.net/2022/10/12/-4371-1665550330.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=P5fMzE4p1lqAKYUOuSRUQg 1x, https://i1-kinhdoanh.vnecdn.net/2022/10/12/-4371-1665550330.jpg?w=1020&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=RjFIqvg2F1YgLt0Db4xEHQ 1.5x, https://i1-kinhdoanh.vnecdn.net/2022/10/12/-4371-1665550330.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=2&amp;fit=crop&amp;s=b4UQ-3_8skwK-EJQfClODA 2x" style="margin: 0px; padding: 0px; text-rendering: optimizelegibility;"><img itemprop="contentUrl" loading="lazy" intrinsicsize="680x0" alt="Hàng trăm xe máy, ôtô vây quanh cây xăng trên đường Tô Ký, quận 12 để chờ đổ xăng sáng nay.  Hầu hết người dân phải chờ hơn 30 phút mới đến lượt đổ xăng. Ảnh: Quỳnh Trần" class="lazy lazied" src="https://i1-kinhdoanh.vnecdn.net/2022/10/12/-4371-1665550330.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=P5fMzE4p1lqAKYUOuSRUQg" data-src="https://i1-kinhdoanh.vnecdn.net/2022/10/12/-4371-1665550330.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=P5fMzE4p1lqAKYUOuSRUQg" data-ll-status="loaded" style="margin: 0px; padding: 0px; text-rendering: optimizelegibility; border: 0px; font-size: 0px; line-height: 0; max-width: 100%; position: absolute; top: 0px; left: 0px; max-height: 700px; width: 670px;"></picture></div><figcaption itemprop="description" style="margin: 0px; padding: 0px; text-rendering: optimizelegibility; width: 670px; float: left; text-align: left;"><p class="Image" style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 10px 0px 0px; text-rendering: optimizespeed; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 14px; line-height: 22.4px; font-family: arial;">Hàng trăm xe máy, ôtô vây quanh cây xăng trên đường Tô Ký, quận 12 để chờ đổ xăng sáng nay. Hầu hết người dân phải chờ hơn 30 phút mới đến lượt đổ xăng. Ảnh:&nbsp;<em style="margin: 0px; padding: 0px; text-rendering: optimizelegibility;">Đình Văn</em></p></figcaption></figure><p class="Normal" style="letter-spacing: normal; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);">Không chỉ TP HCM, tình trạng này lan ra một số tỉnh, thành khác phía Nam như Bình Dương, Đồng Nai, Bình Phước hay khu vực Tây Nguyên, như Đăk Lăk...</p><p class="Normal" style="letter-spacing: normal; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);">Riêng trong năm nay, đây không phải lần đầu có tình trạng thiếu xăng, các cửa hàng ngưng bán. Hồi tháng 2, khi nguồn cung từ Lọc dầu Nghi Sơn bị ảnh hưởng, cảnh tượng này đã diễn ra.</p><p class="Normal" style="letter-spacing: normal; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);">Việt Nam hiện sản xuất được 70% nguồn cung xăng dầu trong nước thông qua hai nhà máy lọc dầu, phần còn lại nhập khẩu. Trong chuỗi cung ứng đưa xăng tới người dân, 36 doanh nghiệp đầu mối có chức năng nhập hàng đầu nguồn (từ nhà máy lọc dầu trong nước hoặc nhập từ nước ngoài). Tiếp đến là 500 thương nhân phân phối, những người mua lại từ các đầu mối và bán buôn cho các đại lý và sau cùng là 17.000 cửa hàng xăng dầu trên khắp cả nước. Tuy nhiên, những ngày qua, hệ thống phân phối với hàng chục nghìn điểm chạm này bộc lộ nhiều vấn đề.</p><p class="Normal" style="letter-spacing: normal; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);">Chủ một doanh nghiệp kinh doanh xăng dầu cho rằng, quan trọng nhất trong kinh doanh bán lẻ xăng dầu là nguồn cung, chiết khấu, giá nhưng cả ba yếu tố này đều bất ổn thời gian qua.</p><p class="Normal" style="letter-spacing: normal; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);"><span style="margin: 0px; padding: 0px; text-rendering: optimizelegibility; color: rgb(44, 62, 80);"><strong style="margin: 0px; padding: 0px; text-rendering: optimizelegibility;">Đầu tiên là nguồn cung đầu nguồn đã không còn dồi dào như trước.&nbsp;</strong></span>Vụ Thị trường trong nước (Bộ Công Thương) thừa nhận, nguyên nhân chính khiến loạt cửa hàng bán lẻ xăng dầu đóng cửa, ngừng bán xuất phát từ việc các doanh nghiệp đầu mối không có đủ nguồn tài chính để nhập hàng. Họ chỉ duy trì lượng hàng đủ để cung cấp cho hệ thống phân phối của mình và duy trì lượng dự trữ tồn kho theo quy định.</p><p class="Normal" style="letter-spacing: normal; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);">Lãnh đạo một doanh nghiệp tại phía Nam chia sẻ, trước đây 3 tỷ đồng nhập được 2 tàu, nhưng giá hiện đã tăng vọt. "Cùng số tiền đó, giờ chỉ nhập được 1-1,5 tàu, mà vay ngân hàng thì khó do room tín dụng cạn", ông bộc bạch.</p><p class="Normal" style="letter-spacing: normal; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);">Còn theo Bộ Tài chính, nguồn hàng ít hơn một phần vì chính các doanh nghiệp đầu mối hiện cũng e dè hơn khi nhập khẩu do giá thế giới biến động khó lường, nguy cơ thua lỗ cao. Bộ này dẫn số liệu từ hải quan cho thấy, trong quý III, sản lượng nhập khẩu giảm 40% với xăng, 35% với dầu diesel so với quý II. Ngoài 3 đầu mối nhập nhiên liệu cho máy bay, chỉ 19 trong số 33 doanh nghiệp đầu mối xăng dầu còn lại nhập khẩu.</p><p class="Normal" style="letter-spacing: normal; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);">Cũng trong thời gian này, hàng loạt doanh nghiệp đầu mối bị rút giấy phép trong 1-1,5 tháng, đồng nghĩa họ cũng không thể tham gia nhập khẩu hoặc mua từ nguồn trong nước. Sau khi được trả giấy phép, các doanh nghiệp này cũng chưa thể nối lại việc nhập khẩu ngay do thời gian đàm phán mua, hàng về cảng nhanh nhất cũng 2-3 tuần.</p><p class="Normal" style="letter-spacing: normal; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);">Có 5 doanh nghiệp đầu mối xăng dầu được hoãn lại việc rút giấy phép, nhưng sau khi có thông tin xử phạt, nguồn tin của&nbsp;<em style="margin: 0px; padding: 0px; text-rendering: optimizelegibility;">VnExpress</em>&nbsp;cho biết, họ cũng bị ngân hàng siết tín dụng, không có nguồn tài chính nên ảnh hưởng tới nhập khẩu hàng.</p><p class="Normal" style="letter-spacing: normal; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);">Tình hình bão lũ xảy ra tại miền Trung vừa qua cũng ảnh hưởng tới tiến độ nhập hàng. Như tại Saigon Petro, kế hoạch nhập 12.000 m3 xăng dầu từ nhà máy lọc dầu trong nước phải dời lại.</p><p class="Normal" style="letter-spacing: normal; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);"><span style="margin: 0px; padding: 0px; text-rendering: optimizelegibility; color: rgb(44, 62, 80);"><strong style="margin: 0px; padding: 0px; text-rendering: optimizelegibility;">Tiếp đến là vấn đề về chiết khấu&nbsp;</strong></span>- nguyên nhân chính khiến các doanh nghiệp bán xăng dầu không muốn tiếp tục kinh doanh. Chiết khấu là khoản thoả thuận, giảm giá của đơn vị bán buôn xăng dầu (đầu mối, tổng đại lý, thương nhân phân phối) cho doanh nghiệp bán lẻ, chủ các cây xăng về 0 đồng, thậm chí âm.</p><p class="Normal" style="letter-spacing: normal; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);">Khi nguồn cung dồi dào, giá thế giới giảm, doanh nghiệp đầu mối, thương nhân phân phối tăng chiết khấu cho cửa hàng, đại lý bán lẻ để đẩy lượng bán ra. Ngược lại, giá thế giới tăng, họ giảm mức chiết khấu này.</p><p class="Normal" style="letter-spacing: normal; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);">Thậm chí gần đây xảy ra tình trạng chiết khấu âm. Theo phản ánh của một số chủ doanh nghiệp bán lẻ, các doanh nghiệp phân phối bán ra cho các cây xăng với giá cao hơn giá bán lẻ quy định, bằng cách thu thêm phí vận chuyển vào một hóa đơn khác. Vì thế, khi cộng phí vận chuyển, doanh nghiệp bán hàng ra với mức giá thấp hơn khi họ nhập về, khiến họ bị âm vốn.</p><p class="Normal" style="letter-spacing: normal; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);">Ông Giang Chấn Tây, sở hữu 6 cửa hàng xăng dầu ở Trà Vinh, cho rằng doanh nghiệp bán lẻ là khâu cuối trong chuỗi cung ứng, cung cấp xăng dầu trực tiếp cho người tiêu dùng nhưng không được quan tâm đúng mức. "Càng bán ra càng lỗ. Một mặt do đứt nguồn cung mặt khác chủ cây xăng sợ lỗ nên không dám nhập hàng về", ông giải thích.</p><figure data-size="true" itemprop="associatedMedia image" itemscope="" itemtype="http://schema.org/ImageObject" class="tplCaption action_thumb_added" style="letter-spacing: normal; margin-right: auto; margin-bottom: 15px; margin-left: auto; padding: 0px; text-rendering: optimizelegibility; max-width: 100%; clear: both; position: relative; text-align: center; width: 670px; float: left; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);"><div class="fig-picture" style="margin: 0px; padding: 0px 0px 502.135px; text-rendering: optimizelegibility; width: 670px; float: left; display: table; -webkit-box-pack: center; justify-content: center; background: rgb(240, 238, 234); position: relative;"><picture style="margin: 0px; padding: 0px; text-rendering: optimizelegibility;"><source data-srcset="https://i1-kinhdoanh.vnecdn.net/2022/10/12/-6261-1665558593.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=ibQmeD9IzrOfguDOvoSJag 1x, https://i1-kinhdoanh.vnecdn.net/2022/10/12/-6261-1665558593.jpg?w=1020&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=hFKGoYR-EK0dS1pITNHYGQ 1.5x, https://i1-kinhdoanh.vnecdn.net/2022/10/12/-6261-1665558593.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=2&amp;fit=crop&amp;s=sB2GKcgXS4mLZqTaBA5i1Q 2x" srcset="https://i1-kinhdoanh.vnecdn.net/2022/10/12/-6261-1665558593.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=ibQmeD9IzrOfguDOvoSJag 1x, https://i1-kinhdoanh.vnecdn.net/2022/10/12/-6261-1665558593.jpg?w=1020&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=hFKGoYR-EK0dS1pITNHYGQ 1.5x, https://i1-kinhdoanh.vnecdn.net/2022/10/12/-6261-1665558593.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=2&amp;fit=crop&amp;s=sB2GKcgXS4mLZqTaBA5i1Q 2x" style="margin: 0px; padding: 0px; text-rendering: optimizelegibility;"><img itemprop="contentUrl" loading="lazy" intrinsicsize="680x0" alt="Cửa hàng trên đường Cộng Hoà, quận Tân Bình thông báo hết xăng kèm lý do đứt gãy nguồn hàng, ngày 12/10. Ảnh: Quỳnh Trần" class="lazy lazied" src="https://i1-kinhdoanh.vnecdn.net/2022/10/12/-6261-1665558593.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=ibQmeD9IzrOfguDOvoSJag" data-src="https://i1-kinhdoanh.vnecdn.net/2022/10/12/-6261-1665558593.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=ibQmeD9IzrOfguDOvoSJag" data-ll-status="loaded" style="margin: 0px; padding: 0px; text-rendering: optimizelegibility; border: 0px; font-size: 0px; line-height: 0; max-width: 100%; position: absolute; top: 0px; left: 0px; max-height: 700px; width: 670px;"></picture></div><figcaption itemprop="description" style="margin: 0px; padding: 0px; text-rendering: optimizelegibility; width: 670px; float: left; text-align: left;"><p class="Image" style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 10px 0px 0px; text-rendering: optimizespeed; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 14px; line-height: 22.4px; font-family: arial;">Cửa hàng trên đường Cộng Hoà, quận Tân Bình thông báo hết xăng kèm lý do "đứt gãy nguồn hàng", ngày 12/10.&nbsp;<em style="margin: 0px; padding: 0px; text-rendering: optimizelegibility;">Ảnh: Quỳnh Trần</em></p></figcaption></figure><p class="Normal" style="letter-spacing: normal; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);"><span style="margin: 0px; padding: 0px; text-rendering: optimizelegibility; color: rgb(44, 62, 80);"><strong style="margin: 0px; padding: 0px; text-rendering: optimizelegibility;">Giá xăng chưa thỏa đáng&nbsp;</strong></span>cũng là nguyên nhân khiến các doanh nghiệp nói "không muốn tiếp tục kinh doanh". Giá cơ sở xăng dầu mỗi kỳ điều hành do liên Bộ Công Thương - Tài chính quyết định, là căn cứ để xác định mức giá bán lẻ mỗi lít nhiên liệu cho người tiêu dùng. Nhưng theo 36 doanh nghiệp đã gửi đơn kiến nghị lên Thủ tướng, chi phí thực tế chưa được phản ánh đầy đủ và nhà điều hành chậm điều chỉnh các&nbsp;<a href="https://vnexpress.net/se-xem-xet-dieu-chinh-chi-phi-kinh-doanh-xang-dau-4518026.html" rel="dofollow" style="margin: 0px; padding: 0px 0px 1px; text-rendering: optimizelegibility; color: rgb(7, 109, 182); position: relative; text-underline-position: under; border-bottom-width: 1px; border-bottom-style: solid;">chi phí kinh doanh</a><span style="margin: 0px; padding: 0px; text-rendering: optimizelegibility; color: rgb(44, 62, 80);">,&nbsp;</span>kìm giá khiến bất ổn gia tăng.</p><p class="Normal" style="letter-spacing: normal; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);">Trong chi phí kinh doanh có khoản đưa xăng dầu về đến cảng, chi phí vận tải tạo nguồn trong nước... Các phụ phí, chi phí kinh doanh này vừa qua tăng 7-8 lần so với trước đây và chưa được phán ánh đủ trong giá cơ sở. Hiện chi phí vận chuyển từ nước ngoài về Việt Nam đã được Bộ Tài chính điều chỉnh từ kỳ điều hành 21/9; còn chi phí vận chuyển xăng dầu từ nhà máy về cảng và premium trong nước tới hôm qua, ở kỳ điều hành ngày 11/10, mới điều chỉnh</p><p class="Normal" style="letter-spacing: normal; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);">Do đó, khi chưa được điều chỉnh chi phí hợp lý khiến kinh doanh bị lỗ, nhà cung cấp (đầu mối, thương nhân phân phối) hạn chế bán ra. Điển hình là hơn một tuần nay, từ sau kỳ điều hành 3/10, nguồn cung từ các thương nhân đầu mối bán ra rất ít, chỉ cung cấp một lượng rất nhỏ với những doanh nghiệp có hợp đồng, để "cầm cự qua ngày".</p><p class="Normal" style="letter-spacing: normal; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);">Ông Lê Văn Mỵ, Tổng giám đốc Công ty cổ phần thương mại Hóc Môn - đơn vị đang sở hữu 11 cửa hàng và 21 đại lý bán lẻ ở TP HCM cho biết, từ đầu năm đến nay công ty ông đã lỗ 8 tỷ đồng. Ông lo ngại nếu vẫn cứ thiếu cung, chiết khấu về 0 đồng, doanh nghiệp có nguy cơ giải thể.</p><p class="Normal" style="letter-spacing: normal; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);">Mỗi ngày tổng sản lượng tiêu thụ xăng dầu bình quân của TP HCM khoảng 6.880 m3, nhưng một tuần qua luôn ghi nhận thiếu hụt. Lãnh đạo một doanh nghiệp tại phía Nam - nơi xảy ra chủ yếu việc khan hiếm xăng - chia sẻ, điều quan trọng trong kinh doanh là lợi nhuận phải đảm bảo, nhưng triền miên khó khăn, thua lỗ từ đầu mối, thương nhân phân phối tới đại lý thì rất khó.</p><p class="Normal" style="letter-spacing: normal; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);">"Cái gốc là giá, tức là các yếu tố cấu thành trong giá cơ sở phải đảm bảo tính đúng, đủ để ít nhất doanh nghiệp hoà vốn", ông nêu.</p><figure class="item_slide_show clearfix" style="letter-spacing: normal; margin-right: auto; margin-bottom: 20px; margin-left: auto; padding: 0px; text-rendering: optimizelegibility; max-width: 100%; clear: both; position: relative; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);"><div id="video_parent_364576" class="box_embed_video_parent embed_video_new" data-vcate="1003834" data-vscate="1003004" data-vscaten="Thời sự" data-vid="364576" data-ratio="1" data-articleoriginal="4521984" data-ads="1" data-license="1" data-duration="122" data-brandsafe="0" data-type="0" data-play="1" data-frame="" data-aot="Mua bán căng thẳng ở cây xăng" data-videoclassify="Ban Video" data-initdom="1" data-view="inview" data-auto="1" data-status="play" style="margin: 0px; padding: 0px; text-rendering: optimizelegibility; position: relative; overflow: hidden; clear: both;"><div id="embed_video_364576" class="box_embed_video" style="margin: 0px; padding: 0px 0px 376.875px; text-rendering: optimizelegibility; height: 0px; width: 670px; position: relative; background: rgb(225, 225, 225);"><div class="bg_overlay_small_unpin" style="margin: 0px; padding: 0px; text-rendering: optimizelegibility;"></div><div class="bg_overlay_small" style="margin: 0px; padding: 0px; text-rendering: optimizelegibility;"></div><div class="embed-container" style="margin: 0px; padding: 0px 0px 376.875px; text-rendering: optimizelegibility; position: relative; height: 0px; overflow: hidden; clear: both; transition-duration: 300ms; transition-property: left; transition-timing-function: cubic-bezier(0.7, 1, 0.7, 1);"><div id="video-364576" style="margin: 0px; padding: 0px; text-rendering: optimizelegibility; width: 670px; height: 376.875px;"><div id="parser_player_364576" class="media_content" style="margin: 0px; padding: 0px; text-rendering: optimizelegibility; width: 670px; height: 376.875px; position: relative; background: rgb(0, 0, 0);"><div id="videoContainter_364576" class="videoContainter" style="margin: 0px; padding: 0px; text-rendering: optimizelegibility; width: 670px; height: 376.875px;"><div class="video-js vjs-default-skin vjs-controls-enabled vjs-workinghover vjs-v7 media-video-364576-dimensions vjs-has-started vjs-paused vjs-ended vjs-user-inactive" data-ex="st=1&amp;bs=0&amp;pt=1" adsconfig="{&quot;adlist&quot;:[{&quot;type&quot;:&quot;preroll&quot;,&quot;tag&quot;:&quot;https:\/\/pubads.g.doubleclick.net\/gampad\/ads?iu=\/27973503\/Vnexpress\/Desktop\/Instream.preroll\/Kinhdoanh\/Kinhdoanh.detail&amp;description_url=http%3A%2F%2Fvnexpress.net&amp;tfcd=0&amp;npa=0&amp;sz=640x360&amp;gdfp_req=1&amp;output=vast&amp;unviewed_position_start=1&amp;env=vp&amp;impl=s&amp;correlator=&quot;,&quot;skipOffset&quot;:&quot;00:00:06&quot;,&quot;duration&quot;:&quot;00:00:30&quot;},{&quot;type&quot;:&quot;overlay&quot;,&quot;tag&quot;:&quot;&quot;,&quot;script&quot;:&quot;%3Cdiv%20id%3D%22div-gpt-ad-overlay%22%3E%3Cdiv%20style%3D%22height%3A70px%3Bwidth%3A480px%3B%22%3E%3C%2Fdiv%3E%3C%2Fdiv%3E%3Cscript%3Evar%20gR%3D%210%2CsR%3D%22div-overlay-0%22%2BMath.round%281E6%2AMath.random%28%29%29%2CeL%3Ddocument.getElementById%28%22div-gpt-ad-overlay%22%29%3Bif%28eL%29%7BeL.firstChild.id%3DsR%3Bif%28%21window.googletag%7C%7C%21googletag.apiReady%29%7BgR%3D%211%3Bvar%20googletag%3Dwindow.googletag%7C%7C%7Bcmd%3A%5B%5D%7D%2Csb%3Ddocument.getElementsByTagName%28%22script%22%29%5B0%5D%2Csa%3Ddocument.createElement%28%22script%22%29%3Bsa.setAttribute%28%22type%22%2C%22text%2Fjavascript%22%29%3Bsa.setAttribute%28%22src%22%2C%22https%3A%2F%2Fwww.googletagservices.com%2Ftag%2Fjs%2Fgpt.js%22%29%3Bsa.setAttribute%28%22async%22%2C%22true%22%29%3Bsb.parentNode.appendChild%28sa%29%7Dtry%7Bgoogletag.cmd.push%28function%28%29%7Bvar%20a%3Dgoogletag.defineSlot%28%22%2F27973503%2FVnexpress%2FDesktop%2FOverlay%2FKinhdoanh%2FKinhdoanh.detail%22%2C%5B%22fluid%22%2C%20%5B480%2C%2070%5D%5D%2CsR%29%3Ba%26%26%28a.addService%28googletag.pubads%28%29%29%2CgR%3Fgoogletag.pubads%28%29.refresh%28%5Ba%5D%29%3A%28googletag.pubads%28%29.enableSingleRequest%28%29%2Cgoogletag.enableServices%28%29%2Cgoogletag.pubads%28%29.refresh%28%5Ba%5D%29%29%29%7D%29%7Dcatch%28a%29%7B%7D%7D%3B%3C%2Fscript%3E&quot;,&quot;size&quot;:&quot;480x70&quot;,&quot;offset&quot;:&quot;30%&quot;,&quot;skipOffset&quot;:&quot;00:00:01&quot;,&quot;duration&quot;:&quot;00:00:15&quot;}]}" ads="" active-mode="720" data-subtitle="0" max-mode="720" data-mode="240|360|480|720" type="application/x-mpegURL" src="https://d1.vnecdn.net/vnexpress/video/video/web/mp4/,240p,360p,480p,,/2022/10/11/tranh-cai-khi-mua-xang-1665474761/vne/master.m3u8" webkit-playsinline="" playsinline="true" preload="auto" id="media-video-364576" lang="vi" role="region" aria-label="Video Player" style="margin: 0px; padding: 0px; text-rendering: optimizelegibility; width: 670px; height: 376.875px; vertical-align: top; color: rgb(255, 255, 255); position: relative; font-size: 10px; line-height: 1; font-family: Arial, Helvetica, sans-serif; user-select: none;"><div class="vjs-text-track-display" aria-live="off" aria-atomic="true" style="margin: 0px; padding: 0px; box-sizing: inherit; text-rendering: optimizelegibility; position: absolute; inset: 0px 0px 3em; pointer-events: none; transform: translateY(-2em);"></div><div class="vjs-loading-spinner" dir="ltr" style="margin: 0px; padding: 0px; box-sizing: inherit; text-rendering: optimizelegibility; position: absolute; top: 0px; left: 0px; opacity: 0.0001; width: 670px; height: 376.875px; background: url(&quot;data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz48IURPQ1RZUEUgc3ZnIFBVQkxJQyAiLS8vVzNDLy9EVEQgU1ZHIDEuMS8vRU4iICJodHRwOi8vd3d3LnczLm9yZy9HcmFwaGljcy9TVkcvMS4xL0RURC9zdmcxMS5kdGQiPjxzdmcgdmVyc2lvbj0iMS4xIiBpZD0iTGF5ZXJfMSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgeD0iMHB4IiB5PSIwcHgiIHdpZHRoPSI0OHB4IiBoZWlnaHQ9IjQ4cHgiIHZpZXdCb3g9IjAgMCA0OCA0OCIgZW5hYmxlLWJhY2tncm91bmQ9Im5ldyAwIDAgNDggNDgiIHhtbDpzcGFjZT0icHJlc2VydmUiPjxyZWN0IHg9Ii0wLjA4MyIgZmlsbD0ibm9uZSIgd2lkdGg9IjQ3Ljk5OSIgaGVpZ2h0PSI0OCIvPjxjaXJjbGUgZmlsbD0ibm9uZSIgc3Ryb2tlPSIjRkZGRkZGIiBzdHJva2Utd2lkdGg9IjQiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgY3g9IjI0IiBjeT0iMjQiIHI9IjIwIj48YW5pbWF0ZSAgZmlsbD0icmVtb3ZlIiByZXN0YXJ0PSJhbHdheXMiIGNhbGNNb2RlPSJsaW5lYXIiIGFkZGl0aXZlPSJyZXBsYWNlIiBhY2N1bXVsYXRlPSJub25lIiB0bz0iMCIgZnJvbT0iMzYwIiByZXBlYXRDb3VudD0iaW5kZWZpbml0ZSIgZHVyPSIzcyIgYXR0cmlidXRlTmFtZT0ic3Ryb2tlLWRhc2hvZmZzZXQiPjwvYW5pbWF0ZT48YW5pbWF0ZSAgZmlsbD0icmVtb3ZlIiB2YWx1ZXM9IjEwMCAxNTA7MSAyNTAiIHJlc3RhcnQ9ImFsd2F5cyIgY2FsY01vZGU9ImxpbmVhciIgYWRkaXRpdmU9InJlcGxhY2UiIGFjY3VtdWxhdGU9Im5vbmUiIHJlcGVhdENvdW50PSJpbmRlZmluaXRlIiBkdXI9IjNzIiBhdHRyaWJ1dGVOYW1lPSJzdHJva2UtZGFzaGFycmF5Ij48L2FuaW1hdGU+PC9jaXJjbGU+PC9zdmc+&quot;) center center / auto 20% no-repeat rgba(0, 0, 0, 0.7); transition: all 0.5s ease 0s;"><span class="vjs-control-text" style="margin: 0px; padding: 0px; box-sizing: inherit; text-rendering: optimizelegibility; border: 0px; clip: rect(0px, 0px, 0px, 0px); height: 1px; overflow: hidden; position: absolute; width: 1px;">Video Player is loading.</span></div><button class="vjs-big-play-button" type="button" title="" aria-disabled="false" style="padding: 0px; box-sizing: inherit; text-rendering: optimizelegibility; border-width: initial; border-style: none; border-color: initial; outline: 0px; background: url(&quot;data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4NCjwhLS0gR2VuZXJhdG9yOiBBZG9iZSBJbGx1c3RyYXRvciAxNi4wLjMsIFNWRyBFeHBvcnQgUGx1Zy1JbiAuIFNWRyBWZXJzaW9uOiA2LjAwIEJ1aWxkIDApICAtLT4NCjwhRE9DVFlQRSBzdmcgUFVCTElDICItLy9XM0MvL0RURCBTVkcgMS4xLy9FTiIgImh0dHA6Ly93d3cudzMub3JnL0dyYXBoaWNzL1NWRy8xLjEvRFREL3N2ZzExLmR0ZCI+DQo8c3ZnIHZlcnNpb249IjEuMSIgaWQ9IkxheWVyXzEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHg9IjBweCIgeT0iMHB4Ig0KCSB3aWR0aD0iNTBweCIgaGVpZ2h0PSI1MHB4IiB2aWV3Qm94PSItMSAtMSA1MCA1MCIgZW5hYmxlLWJhY2tncm91bmQ9Im5ldyAtMSAtMSA1MCA1MCIgeG1sOnNwYWNlPSJwcmVzZXJ2ZSI+DQo8cmVjdCB4PSItMSIgeT0iLTEiIGZpbGw9Im5vbmUiIHdpZHRoPSI1MCIgaGVpZ2h0PSI1MCIvPg0KPGNpcmNsZSBmaWxsPSJub25lIiBzdHJva2U9IiNGRkZGRkYiIHN0cm9rZS13aWR0aD0iNCIgc3Ryb2tlLWxpbmVjYXA9InJvdW5kIiBjeD0iMjQiIGN5PSIyNCIgcj0iMjIuNSIvPg0KPHBvbHlnb24gZmlsbD0iI0ZGRkZGRiIgcG9pbnRzPSIxOC41MzEsMTEuNTg3IDE4LjUzMSwzNi40MTMgMzcuMjgsMjQgIi8+DQo8L3N2Zz4NCg==&quot;) center center / auto 20% no-repeat rgba(0, 0, 0, 0.1); transition: all 0.5s ease 0s; appearance: none; position: absolute; top: 0px; left: 0px; opacity: 0.85; width: 670px; height: 376.875px;"><span aria-hidden="true" class="vjs-icon-placeholder" style="margin: 0px; padding: 0px; box-sizing: inherit; text-rendering: optimizelegibility;"></span><span class="vjs-control-text" aria-live="polite" style="margin: 0px; padding: 0px; box-sizing: inherit; text-rendering: optimizelegibility; border: 0px; clip: rect(0px, 0px, 0px, 0px); height: 1px; overflow: hidden; position: absolute; width: 1px;"></span></button><div class="vjs-control-bar" dir="ltr" style="margin: 0px; padding: 0px; box-sizing: inherit; text-rendering: optimizelegibility; display: flex; width: 670px; position: absolute; bottom: 0px; left: 0px; right: 0px; height: 5em; background: linear-gradient(rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.8)); visibility: visible; opacity: 1; transition: visibility 0.1s ease 0s, opacity 0.1s ease 0s;"><button class="vjs-play-control vjs-control vjs-button vjs-paused vjs-ended" type="button" title="Replay" aria-disabled="false" style="padding: 0px; box-sizing: inherit; text-rendering: optimizelegibility; border-width: initial; border-style: none; border-color: initial; outline: 0px; background-image: initial; background-position: 0px 0px; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; transition: none 0s ease 0s; appearance: none; position: relative; height: 50px; width: 5em; flex: 0 0 auto;"><span aria-hidden="true" class="vjs-icon-placeholder" style="margin: 0px; padding: 0px; box-sizing: inherit; text-rendering: optimizelegibility; cursor: pointer; flex: 0 0 auto; font-family: VideoJS !important;"></span><span class="vjs-control-text" aria-live="polite" style="margin: 0px; padding: 0px; box-sizing: inherit; text-rendering: optimizelegibility; border: 0px; clip: rect(0px, 0px, 0px, 0px); height: 1px; overflow: hidden; position: absolute; width: 1px;">Replay</span></button><div class="vjs-current-time vjs-time-control vjs-control" style="margin: 0px; padding: 0px 0.1em; box-sizing: inherit; text-rendering: optimizelegibility; position: relative; text-align: center; height: 50px; width: auto; flex: 0 0 auto; font-size: 1.4em; line-height: 3.5em; min-width: 0.5em;"><span class="vjs-control-text" style="margin: 0px; padding: 0px; box-sizing: inherit; text-rendering: optimizelegibility; border: 0px; clip: rect(0px, 0px, 0px, 0px); height: 1px; overflow: hidden; position: absolute; width: 1px;">Hiện tại&nbsp;</span><span class="vjs-current-time-display" aria-live="off" style="margin: 0px; padding: 0px; box-sizing: inherit; text-rendering: optimizelegibility;">2:02</span></div><div class="vjs-time-control vjs-time-divider" style="margin: 0px; padding: 0px 0.1em; box-sizing: inherit; text-rendering: optimizelegibility; line-height: 3.5em; flex: 0 0 auto; font-size: 1.4em; min-width: 0.5em; width: auto;"><div style="margin: 0px; padding: 0px; box-sizing: inherit; text-rendering: optimizelegibility;"><span style="margin: 0px; padding: 0px; box-sizing: inherit; text-rendering: optimizelegibility;">/</span></div></div><div class="vjs-duration vjs-time-control vjs-control" style="margin: 0px; padding: 0px 0.1em; box-sizing: inherit; text-rendering: optimizelegibility; position: relative; text-align: center; height: 50px; width: auto; flex: 0 0 auto; font-size: 1.4em; line-height: 3.5em; min-width: 0.5em;"><span class="vjs-control-text" style="margin: 0px; padding: 0px; box-sizing: inherit; text-rendering: optimizelegibility; border: 0px; clip: rect(0px, 0px, 0px, 0px); height: 1px; overflow: hidden; position: absolute; width: 1px;">Thời lượng&nbsp;</span><span class="vjs-duration-display" aria-live="off" style="margin: 0px; padding: 0px; box-sizing: inherit; text-rendering: optimizelegibility;">2:02</span></div><div class="vjs-progress-control vjs-control" style="margin: 0px; padding: 0px; box-sizing: inherit; text-rendering: optimizelegibility; position: relative; text-align: center; height: 50px; width: 5em; flex: 1 1 auto; cursor: pointer; display: flex; -webkit-box-align: center; align-items: center; min-width: 4em;"><div tabindex="0" class="vjs-progress-holder vjs-slider vjs-slider-horizontal" role="slider" aria-valuenow="100.00" aria-valuemin="0" aria-valuemax="100" aria-label="Progress Bar" aria-valuetext="2:02 of 2:02" style="margin: 0px 10px; padding: 0px; box-sizing: inherit; text-rendering: optimizelegibility; flex: 1 1 auto; transition: all 0.2s ease 0s; height: 0.5em; position: relative; cursor: pointer; user-select: none; background-color: rgba(255, 255, 255, 0.3);"><div class="vjs-load-progress" style="margin: 0px; padding: 0px; box-sizing: inherit; text-rendering: optimizelegibility; background: rgba(200, 200, 200, 0.3); overflow: hidden; position: absolute; height: 5px; width: 432.906px; left: 0px; top: 0px;"><span class="vjs-control-text" style="margin: 0px; padding: 0px; box-sizing: inherit; text-rendering: optimizelegibility; border: 0px; clip: rect(0px, 0px, 0px, 0px); height: 1px; overflow: hidden; position: absolute; width: 1px;"><span style="margin: 0px; padding: 0px; box-sizing: inherit; text-rendering: optimizelegibility;">Đã tải</span>: 0%</span><div style="margin: 0px; padding: 0px; box-sizing: inherit; text-rendering: optimizelegibility; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; position: absolute; height: 5px; width: 432.615px; left: 0.28125px; top: 0px;"></div></div><div class="vjs-play-progress vjs-slider-bar" style="margin: 0px; padding: 0px; box-sizing: inherit; text-rendering: optimizelegibility; background-color: rgb(159, 34, 78); position: absolute; height: 5px; width: 432.917px; left: 0px; top: 0px; font-family: VideoJS !important;"><div class="vjs-time-tooltip" style="margin: 0px; padding: 6px 8px 8px; box-sizing: inherit; text-rendering: optimizelegibility; font-family: Arial, Helvetica, sans-serif; background-color: rgba(255, 255, 255, 0.8); border-radius: 0.3em; color: rgb(0, 0, 0); float: right; font-size: 1em; pointer-events: none; position: relative; top: -3.4em; visibility: hidden; z-index: 1; right: -17.7344px;"></div><span class="vjs-control-text" style="margin: 0px; padding: 0px; box-sizing: inherit; text-rendering: optimizelegibility; border: 0px; clip: rect(0px, 0px, 0px, 0px); height: 1px; overflow: hidden; position: absolute; width: 1px;"><span style="margin: 0px; padding: 0px; box-sizing: inherit; text-rendering: optimizelegibility;">Tiến trình</span>: 0%</span></div></div></div><div class="vjs-volume-panel vjs-control vjs-volume-panel-vertical" style="margin: 0px; padding: 0px; box-sizing: inherit; text-rendering: optimizelegibility; position: relative; text-align: center; height: 50px; width: 5em; flex: 0 0 auto; transition: width 1s ease 0s; display: flex;"><button class="vjs-mute-control vjs-control vjs-button vjs-vol-0" type="button" title="Bỏ tắt tiếng" aria-disabled="false" style="padding: 0px 2em 3em; box-sizing: inherit; text-rendering: optimizelegibility; border-width: initial; border-style: none; border-color: initial; outline: 0px; background-image: initial; background-position: 0px 0px; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; transition: none 0s ease 0s; appearance: none; width: 5em; height: 50px; position: relative; flex: 0 0 auto;"><span aria-hidden="true" class="vjs-icon-placeholder" style="margin: 0px; padding: 0px; box-sizing: inherit; text-rendering: optimizelegibility; font-family: VideoJS !important;"></span><span class="vjs-control-text" aria-live="polite" style="margin: 0px; padding: 0px; box-sizing: inherit; text-rendering: optimizelegibility; border: 0px; clip: rect(0px, 0px, 0px, 0px); height: 1px; overflow: hidden; position: absolute; width: 1px;">Bỏ tắt tiếng</span></button><div class="vjs-volume-control vjs-control vjs-volume-vertical" style="margin: 0px 1em 0px -1px; padding: 0px; box-sizing: inherit; text-rendering: optimizelegibility; position: relative; height: 8em; width: 3em; flex: 0 0 auto; cursor: pointer; display: flex; bottom: 8em; background-color: rgba(43, 51, 63, 0.7); visibility: visible; opacity: 0; left: -3.5em; transition: visibility 1s ease 0s, opacity 1s ease 0s, height 1s ease 1s, width 1s ease 1s, left 1s ease 1s, top 1s ease 1s;"><div tabindex="0" class="vjs-volume-bar vjs-slider-bar vjs-slider vjs-slider-vertical" role="slider" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" aria-label="Volume Level" aria-live="polite" aria-valuetext="0%" style="margin: 1.35em auto; padding: 0px; box-sizing: inherit; text-rendering: optimizelegibility; position: relative; cursor: pointer; user-select: none; background-color: rgba(255, 255, 255, 0.3); width: 0.5em; height: 5em;"><div class="vjs-volume-level" style="margin: 0px; padding: 0px; box-sizing: inherit; text-rendering: optimizelegibility; position: absolute; bottom: 0px; left: 0px; background-color: rgb(159, 34, 78); width: 0.5em; height: 0px; font-family: VideoJS !important;"><span class="vjs-control-text" style="margin: 0px; padding: 0px; box-sizing: inherit; text-rendering: optimizelegibility; border: 0px; clip: rect(0px, 0px, 0px, 0px); height: 1px; overflow: hidden; position: absolute; width: 1px;"></span></div></div></div></div><button class="vjs-fullscreen-control vjs-control vjs-button" type="button" title="Toàn màn hình" aria-disabled="false" style="padding: 0px; box-sizing: inherit; text-rendering: optimizelegibility; border-width: initial; border-style: none; border-color: initial; outline: 0px; background-image: initial; background-position: 0px 0px; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; transition: none 0s ease 0s; appearance: none; position: relative; height: 50px; width: 5em; flex: 0 0 auto;"><span aria-hidden="true" class="vjs-icon-placeholder" style="margin: 0px; padding: 0px; box-sizing: inherit; text-rendering: optimizelegibility; font-family: VideoJS !important;"></span><span class="vjs-control-text" aria-live="polite" style="margin: 0px; padding: 0px; box-sizing: inherit; text-rendering: optimizelegibility; border: 0px; clip: rect(0px, 0px, 0px, 0px); height: 1px; overflow: hidden; position: absolute; width: 1px;">Toàn màn hình</span></button></div><div class="fp-sound-status-container" id="364576_soundTopRight" style="margin: 0px; padding: 0px; box-sizing: inherit; text-rendering: optimizelegibility; opacity: 0; position: absolute; top: 15px; right: 15px; min-width: 108px; width: auto; height: 32px; border-radius: 16px; background-color: rgba(0, 0, 0, 0.8); text-align: center; font-size: 12px; line-height: 32px; transition: opacity 2s ease 0s;"></div><div class="share-hover" style="margin: 0px; padding: 10px 15px; box-sizing: inherit; text-rendering: optimizelegibility; display: flex; -webkit-box-pack: end; justify-content: flex-end; width: 670px; height: 55px; position: absolute; top: 0px; left: 0px;"><a class="share-item" style="margin: 0px 0px 0px 10px; padding: 5px; box-sizing: inherit; text-rendering: optimizelegibility; position: relative; text-underline-position: under; display: block; z-index: 1; height: 26px; color: rgb(255, 255, 255) !important; border-bottom-width: 0px !important;"><svg class="ic ic-face"><use xlink:href="#Facebook"></use></svg></a><a class="share-item" style="margin: 0px 0px 0px 10px; padding: 5px; box-sizing: inherit; text-rendering: optimizelegibility; position: relative; text-underline-position: under; display: block; z-index: 1; height: 26px; color: rgb(255, 255, 255) !important; border-bottom-width: 0px !important;"><svg class="ic ic-twit"><use xlink:href="#Twitter"></use></svg></a><a class="share-item" style="margin: 0px 0px 0px 10px; padding: 5px; box-sizing: inherit; text-rendering: optimizelegibility; position: relative; text-underline-position: under; display: block; z-index: 1; height: 26px; color: rgb(255, 255, 255) !important; border-bottom-width: 0px !important;"><svg class="ic ic-link"><use xlink:href="#Link"></use></svg></a></div></div></div></div></div></div></div></div><figcaption class="desc_cation" style="margin: 0px; padding: 0px; text-rendering: optimizelegibility;"><div class="inner_caption" style="margin: 0px; padding: 0px; text-rendering: optimizelegibility;"><p class="Image" style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 10px 0px 0px; text-rendering: optimizespeed; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 14px; line-height: 22.4px; font-family: arial;">Không khí căng thẳng khi mua xăng tại TP HCM. Video:&nbsp;<em style="margin: 0px; padding: 0px; text-rendering: optimizelegibility;">Thịnh Việt - Điệp Khang</em></p></div></figcaption></figure><p class="Normal" style="letter-spacing: normal; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);"><span style="margin: 0px; padding: 0px; text-rendering: optimizelegibility; color: rgb(44, 62, 80);"><strong style="margin: 0px; padding: 0px; text-rendering: optimizelegibility;">"Điều hành của hai bộ Công Thương, Tài chính&nbsp;<a href="https://vnexpress.net/doanh-nghiep-to-bo-cong-thuong-tai-chinh-dieu-hanh-xang-dau-co-van-de-4520554.html" rel="dofollow" style="margin: 0px; padding: 0px 0px 1px; text-rendering: optimizelegibility; color: rgb(7, 109, 182); position: relative; text-underline-position: under; border-bottom-width: 1px; border-bottom-style: solid;">có vấn đề</a>",</strong></span>&nbsp;theo 36 doanh nghiệp kinh doanh tại TP HCM. Hai cơ quan được giao nhiệm vụ điều hành thị trường và&nbsp;<a href="https://vnexpress.net/chu-de/gia-xang-hom-nay-3026" rel="dofollow" style="margin: 0px; padding: 0px 0px 1px; text-rendering: optimizelegibility; color: rgb(7, 109, 182); position: relative; text-underline-position: under; border-bottom-width: 1px; border-bottom-style: solid;">giá xăng dầu&nbsp;</a>thời gian qua bị doanh nghiệp cho rằng "phản ứng chậm, và đùn đẩy trách nhiệm".</p><p class="Normal" style="letter-spacing: normal; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);">Trước khi quyết định điều chỉnh chi phí kinh doanh xăng dầu được Bộ Tài chính đưa ra ngày 7/10, Bộ Công Thương cho hay đã ít nhất 4 lần đề xuất cơ quan này điều chỉnh, nhưng chưa được đồng thuận. Bộ này đánh giá việc điều chỉnh chậm là nguyên nhân khiến chiết khấu giảm về 0, cửa hàng bán lẻ bị lỗ...</p><p class="Normal" style="letter-spacing: normal; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);">Trong khi đó, Bộ Tài chính cho rằng việc đảm bảo nguồn cung xăng dầu, các chi phí trung gian, tiết giảm chi phí quản trị doanh nghiệp xăng dầu thuộc trách nhiệm của Bộ Công Thương và các doanh nghiệp.</p><p class="Normal" style="letter-spacing: normal; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);">Bộ trưởng Tài chính Hồ Đức Phớc ngày 10/10 thừa nhận có trách nhiệm trong đưa ra chi phí định mức kinh doanh xăng dầu và tham mưu Chính phủ trình Quốc hội các khoản thuế phí với xăng dầu. Tuy nhiên, quản lý doanh nghiệp đầu mối, doanh nghiệp phân phối và bán lẻ thuộc về trách nhiệm của Bộ Công Thương.</p><div class="width_common box-tinlienquanv2 " style="letter-spacing: normal; margin-bottom: 20px; padding: 15px; text-rendering: optimizelegibility; width: 670px; float: left; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border: 1px solid rgb(229, 229, 229); color: rgb(34, 34, 34); font-family: arial; font-size: 18px;"><article class="item-news" style="margin: 0px; padding: 0px; text-rendering: optimizelegibility; width: 638px; float: left; border-bottom: none;"><div class="thumb-art" style="margin: 0px 10px 0px 0px; padding: 0px; text-rendering: optimizelegibility; position: relative; float: left; width: 145px;"><a href="https://vnexpress.net/doanh-nghiep-to-bo-cong-thuong-tai-chinh-dieu-hanh-xang-dau-co-van-de-4520554.html" data-itm-source="#vn_source=Detail-KinhDoanh_ViMo-4521590&amp;vn_campaign=Box-TinXemThem&amp;vn_medium=Item-1&amp;vn_term=Desktop&amp;vn_thumb=1" class="thumb thumb-5x3" title="Doanh nghiệp xăng dầu: Bộ Công Thương, Tài chính ''điều hành có vấn đề''" data-itm-added="1" style="margin: 0px; padding: 0px 0px 87px; text-rendering: optimizelegibility; color: rgb(7, 109, 182); text-decoration-line: underline; display: block; overflow: hidden; height: 0px; position: relative; width: 145px; background: rgb(244, 244, 244); text-underline-position: under;"><picture style="margin: 0px; padding: 0px; text-rendering: optimizelegibility;"><source data-srcset="https://i1-kinhdoanh.vnecdn.net/2022/10/07/-1507-1665148345.jpg?w=180&amp;h=108&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=fB3_KEuch8SjEI_kAWsgSg 1x, https://i1-kinhdoanh.vnecdn.net/2022/10/07/-1507-1665148345.jpg?w=180&amp;h=108&amp;q=100&amp;dpr=2&amp;fit=crop&amp;s=aEt0kGO9WFmxC0uymfC6mA 2x" srcset="https://i1-kinhdoanh.vnecdn.net/2022/10/07/-1507-1665148345.jpg?w=180&amp;h=108&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=fB3_KEuch8SjEI_kAWsgSg 1x, https://i1-kinhdoanh.vnecdn.net/2022/10/07/-1507-1665148345.jpg?w=180&amp;h=108&amp;q=100&amp;dpr=2&amp;fit=crop&amp;s=aEt0kGO9WFmxC0uymfC6mA 2x" style="margin: 0px; padding: 0px; text-rendering: optimizelegibility;"><img loading="lazy" intrinsicsize="180x108" alt="Doanh nghiệp xăng dầu\: Bộ Công Thương, Tài chính ''điều hành có vấn đề''" class="lazy lazied" src="https://i1-kinhdoanh.vnecdn.net/2022/10/07/-1507-1665148345.jpg?w=180&amp;h=108&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=fB3_KEuch8SjEI_kAWsgSg" data-src="https://i1-kinhdoanh.vnecdn.net/2022/10/07/-1507-1665148345.jpg?w=180&amp;h=108&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=fB3_KEuch8SjEI_kAWsgSg" data-ll-status="loaded" style="margin: 0px; padding: 0px; text-rendering: optimizelegibility; border: 0px; font-size: 0px; line-height: 0; max-width: 100%; position: absolute; inset: 0px; object-fit: cover; width: 145px; height: 87px;"></picture></a></div><h4 class="title-news" style="margin-top: 0px; margin-bottom: 5px; padding: 0px; text-rendering: optimizelegibility; line-height: 24px; font-feature-settings: &quot;pnum&quot;, &quot;lnum&quot;; font-family: Merriweather, serif;"><a href="https://vnexpress.net/doanh-nghiep-to-bo-cong-thuong-tai-chinh-dieu-hanh-xang-dau-co-van-de-4520554.html" data-itm-source="#vn_source=Detail-KinhDoanh_ViMo-4521590&amp;vn_campaign=Box-TinXemThem&amp;vn_medium=Item-1&amp;vn_term=Desktop&amp;vn_thumb=1" title="Doanh nghiệp xăng dầu: Bộ Công Thương, Tài chính ''điều hành có vấn đề''" data-itm-added="1" style="margin: 0px; padding: 0px; text-rendering: optimizelegibility; color: rgb(34, 34, 34); transition-duration: 200ms; transition-property: all; transition-timing-function: cubic-bezier(0.7, 1, 0.7, 1); position: relative; text-underline-position: under;">Doanh nghiệp xăng dầu: Bộ Công Thương, Tài chính ''điều hành có vấn đề''</a></h4><p class="description" style="padding: 0px; text-rendering: optimizespeed; line-height: 22.4px; font-size: 14px;"><a data-itm-source="#vn_source=Detail-KinhDoanh_ViMo-4521590&amp;vn_campaign=Box-TinXemThem&amp;vn_medium=Item-1&amp;vn_term=Desktop&amp;vn_thumb=1" href="https://vnexpress.net/doanh-nghiep-to-bo-cong-thuong-tai-chinh-dieu-hanh-xang-dau-co-van-de-4520554.html" title="Doanh nghiệp xăng dầu: Bộ Công Thương, Tài chính ''điều hành có vấn đề''" data-itm-added="1" style="margin: 0px; padding: 0px; text-rendering: optimizelegibility; color: rgb(7, 109, 182); text-decoration-line: underline; position: relative; text-underline-position: under;">Các doanh nghiệp cho rằng cơ quan quản lý điều hành xăng dầu trái với quy luật cung cầu, để giá mua cao hơn bán khiến nhiều cây xăng thua lỗ, đóng cửa.</a>&nbsp;<span class="meta-news" style="margin: 0px 0px 0px 5px; padding: 0px; text-rendering: optimizelegibility; color: rgb(117, 117, 117); font-size: 12px; line-height: 14px; font-family: Arial; float: none; display: inline-block; vertical-align: middle; font-weight: 400 !important;"><a class="count_cmt" href="https://vnexpress.net/doanh-nghiep-to-bo-cong-thuong-tai-chinh-dieu-hanh-xang-dau-co-van-de-4520554.html#box_comment_vne" style="margin: 0px; padding: 0px; text-rendering: optimizelegibility; text-decoration-line: underline; position: relative; text-underline-position: under; display: inline-block; white-space: nowrap; color: rgb(7, 109, 182) !important;"><svg class="ic ic-comment"><use xlink:href="#Comment-Reg"></use></svg>&nbsp;<span class="font_icon widget-comment-4520554-1" style="margin: 0px; padding: 0px; text-rendering: optimizelegibility;">230</span></a></span></p></article></div><p class="Normal" style="letter-spacing: normal; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);">Các phụ phí, chi phí kinh doanh xăng dầu thực tế đã được điều chỉnh từ kỳ điều hành 11/10, song theo các doanh nghiệp, vẫn có độ trễ. Theo họ, nếu nhà chức trách rà soát, điều chỉnh các chi phí này từ kỳ điều hành trong tháng 9, thuận lợi hơn nhiều do thời điểm này giá xuống thấp. Còn với kỳ điều hành 11/10,&nbsp;<a href="https://vnexpress.net/gia-xang-dau-ngay-mai-co-the-tang-tro-lai-4521151.html" rel="dofollow" style="margin: 0px; padding: 0px 0px 1px; text-rendering: optimizelegibility; color: rgb(7, 109, 182); position: relative; text-underline-position: under; border-bottom-width: 1px; border-bottom-style: solid;">giá xăng đã tăng trở lại</a>&nbsp;sau 3 kỳ giảm liên tiếp.</p><p class="Normal" style="letter-spacing: normal; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);">PGS.TS Đinh Trọng Thịnh cũng cho rằng "đang có vấn đề" trong điều hành thị trường xăng dầu của liên Bộ. Theo ông, cơ chế giữa doanh nghiệp đầu mối - phân phối và bán lẻ chưa rõ ràng; nên chuyện "ép giá" xảy ra. Bộ Công Thương cũng chưa tính đúng, tính đủ nhu cầu và sản lượng tiêu thụ của từng địa phương.</p><p class="Normal" style="letter-spacing: normal; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);">"Cần phải cụ thể từng tháng, từng quý để đảm bảo nhu cầu, không để thiếu đột xuất", ông nhìn nhận. Ngoài ra, quy định về kiểm tra, phân phối hạn mức nhập khẩu đã có, nhưng việc giám sát các đầu mối có nhập đúng, đủ theo đúng thời hạn quy định hay không, lại chưa chặt chẽ, khiến thực tế quý III vừa qua có tới 2/3 đầu mối không nhập khẩu, gây thiếu hụt nguồn hàng.</p><p class="Normal" style="letter-spacing: normal; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);">Ở góc độ cơ quan quản lý giá xăng dầu, Bộ Tài chính chưa kịp thời cập nhật những thay đổi về chi phí trong cơ cấu giá bán, khiến doanh nghiệp thua lỗ.</p><p class="Normal" style="letter-spacing: normal; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);">Tại phiên họp thứ 16 của Uỷ ban Thường vụ Quốc hội ngày 11/10, Ủy ban Kinh tế khi thẩm tra báo cáo kinh tế xã hội 2022, kế hoạch 2023 của Chính phủ cũng đề nghị phân tích rõ nguyên nhân trong điều hành giá xăng dầu. Việc này để rút ra bài học kinh nghiệm và có giải pháp ứng phó phù hợp, kịp thời khi giá xăng dầu thế giới có những diễn biến bất lợi trong tương lai.</p>', 'AWvaYDttM', NULL, '');

-- ----------------------------
-- Table structure for articlecomment
-- ----------------------------
DROP TABLE IF EXISTS "public"."articlecomment";
CREATE TABLE "public"."articlecomment" (
  "commentid" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "commentthreadid" varchar(40) COLLATE "pg_catalog"."default",
  "id" varchar(40) COLLATE "pg_catalog"."default",
  "author" varchar(255) COLLATE "pg_catalog"."default",
  "userid" varchar(255) COLLATE "pg_catalog"."default",
  "comment" text COLLATE "pg_catalog"."default",
  "time" timestamptz(6),
  "updatedat" timestamptz(6),
  "histories" jsonb[]
)
;

-- ----------------------------
-- Records of articlecomment
-- ----------------------------
INSERT INTO "public"."articlecomment" VALUES ('35vJP2Lnb', 'j3xlD3DIt', 'abw6F9-ap', 'uEyz9MqaM', 'uEyz9MqaM', 'sdasdasdasdasdasdasd', '2022-11-08 06:03:04.285+00', '2023-04-12 03:20:25.284591+00', '{"{\"time\": \"2023-04-12T10:20:25.2845913+07:00\", \"comment\": \"sdasdasdasd\"}"}');
INSERT INTO "public"."articlecomment" VALUES ('rkKu76p-r', 'j3xlD3DIt', 'abw6F9-ap', 'uEyz9MqaM', 'uEyz9MqaM', 'sdasdasdasdasdasdasd', '2022-11-08 06:03:19.611+00', '2023-04-12 03:20:25.284591+00', '{"{\"time\": \"2023-04-12T10:20:25.2845913+07:00\", \"comment\": \"sdasdasdasd\"}"}');
INSERT INTO "public"."articlecomment" VALUES ('luSQpIQlO', 'XstrMmbor', 'abw6F9-ap', 'uEyz9MqaM', 'uEyz9MqaM', 'sdasdasdasdasdasdasd', '2022-11-09 10:01:30.371+00', '2023-04-12 03:20:25.284591+00', '{"{\"time\": \"2023-04-12T10:20:25.2845913+07:00\", \"comment\": \"sdasdasdasd\"}"}');
INSERT INTO "public"."articlecomment" VALUES ('fV3_2Jcnv', 'XstrMmbor', 'abw6F9-ap', 'uEyz9MqaM', 'uEyz9MqaM', 'sdasdasdasdasdasdasd', '2022-11-09 10:13:10.788+00', '2023-04-12 03:20:25.284591+00', '{"{\"time\": \"2023-04-12T10:20:25.2845913+07:00\", \"comment\": \"sdasdasdasd\"}"}');
INSERT INTO "public"."articlecomment" VALUES ('patkthInN', '0v79DeRaC', 'abw6F9-ap', 'uEyz9MqaM', 'uEyz9MqaM', 'sdasdasdasdasdasdasd', '2022-11-10 04:04:48.333+00', '2023-04-12 03:20:25.284591+00', '{"{\"time\": \"2023-04-12T10:20:25.2845913+07:00\", \"comment\": \"sdasdasdasd\"}"}');
INSERT INTO "public"."articlecomment" VALUES ('r3Jyws4it', '0v79DeRaC', 'abw6F9-ap', 'uEyz9MqaM', 'uEyz9MqaM', 'sdasdasdasdasdasdasd', '2022-11-10 06:45:20.124+00', '2023-04-12 03:20:25.284591+00', '{"{\"time\": \"2023-04-12T10:20:25.2845913+07:00\", \"comment\": \"sdasdasdasd\"}"}');
INSERT INTO "public"."articlecomment" VALUES ('5ao19HoT1', 'BwscWRPYB', 'abw6F9-ap', 'uEyz9MqaM', 'uEyz9MqaM', 'sdasdasdasdasdasdasd', '2023-03-27 06:57:22.833+00', '2023-04-12 03:20:25.284591+00', '{"{\"time\": \"2023-04-12T10:20:25.2845913+07:00\", \"comment\": \"sdasdasdasd\"}"}');
INSERT INTO "public"."articlecomment" VALUES ('D_j7MhdTU', 'Peo0sio7x', 'abw6F9-ap', 'uEyz9MqaM', 'uEyz9MqaM', 'sdasdasdasdasdasdasd', '2023-03-27 07:48:50.738+00', '2023-04-12 03:20:25.284591+00', '{"{\"time\": \"2023-04-12T10:20:25.2845913+07:00\", \"comment\": \"sdasdasdasd\"}"}');
INSERT INTO "public"."articlecomment" VALUES ('HKYriMyKE', 'BwscWRPYB', 'abw6F9-ap', 'uEyz9MqaM', 'uEyz9MqaM', 'sdasdasdasdasdasdasd', '2023-03-28 07:43:17.364+00', '2023-04-12 03:20:25.284591+00', '{"{\"time\": \"2023-04-12T10:20:25.2845913+07:00\", \"comment\": \"sdasdasdasd\"}"}');
INSERT INTO "public"."articlecomment" VALUES ('4le5TenHE', 'BwscWRPYB', 'abw6F9-ap', 'uEyz9MqaM', 'uEyz9MqaM', 'sdasdasdasdasdasdasd', '2023-03-28 07:50:06.049+00', '2023-04-12 03:20:25.284591+00', '{"{\"time\": \"2023-04-12T10:20:25.2845913+07:00\", \"comment\": \"sdasdasdasd\"}"}');
INSERT INTO "public"."articlecomment" VALUES ('ArJsh0Y0t', 'CaP4JWfMW', 'abw6F9-ap', 'pu65Tr6FE', 'pu65Tr6FE', 'sdasdasdasdasdasdasd', '2023-04-03 03:17:13.629+00', '2023-04-12 03:20:25.284591+00', '{"{\"time\": \"2023-04-12T10:20:25.2845913+07:00\", \"comment\": \"sdasdasdasd\"}"}');
INSERT INTO "public"."articlecomment" VALUES ('CVxNU5xOe', '7qUfAFE_z', 'abw6F9-ap', 'pu65Tr6FE', 'pu65Tr6FE', 'sdasdasdasdasdasdasd', '2023-04-03 07:22:53.619+00', '2023-04-12 03:20:25.284591+00', '{"{\"time\": \"2023-04-12T10:20:25.2845913+07:00\", \"comment\": \"sdasdasdasd\"}"}');
INSERT INTO "public"."articlecomment" VALUES ('HsiUO1vaM', '47cIh1vtM', '01', 'uEyz9MqaM', 'uEyz9MqaM', 'sdasdasdasdasdasdasd', '2023-04-12 03:17:41.508216+00', '2023-04-12 03:20:25.284591+00', '{"{\"time\": \"2023-04-12T10:20:25.2845913+07:00\", \"comment\": \"sdasdasdasd\"}"}');
INSERT INTO "public"."articlecomment" VALUES ('5a8Ih1Xap', '47cIh1vtM', '01', 'uEyz9MqaM', 'uEyz9MqaM', 'sdasdasdasdasdasdasd', '2023-04-12 03:17:46.324555+00', '2023-04-12 03:20:25.284591+00', '{"{\"time\": \"2023-04-12T10:20:25.2845913+07:00\", \"comment\": \"sdasdasdasd\"}"}');
INSERT INTO "public"."articlecomment" VALUES ('SW4RO1vap', 'n6y5q_vap', '01', 'uEyz9MqaM', 'uEyz9MqaM', 'sdasdasdasdasdasdasd', '2023-04-12 03:20:17.068188+00', '2023-04-12 03:20:25.284591+00', '{"{\"time\": \"2023-04-12T10:20:25.2845913+07:00\", \"comment\": \"sdasdasdasd\"}"}');

-- ----------------------------
-- Table structure for articlecommentinfo
-- ----------------------------
DROP TABLE IF EXISTS "public"."articlecommentinfo";
CREATE TABLE "public"."articlecommentinfo" (
  "commentid" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "replycount" int4 DEFAULT 0,
  "usefulcount" int4 DEFAULT 0
)
;

-- ----------------------------
-- Records of articlecommentinfo
-- ----------------------------
INSERT INTO "public"."articlecommentinfo" VALUES ('CVxNU5xOe', 0, 1);

-- ----------------------------
-- Table structure for articlecommentreaction
-- ----------------------------
DROP TABLE IF EXISTS "public"."articlecommentreaction";
CREATE TABLE "public"."articlecommentreaction" (
  "commentid" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "author" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "userid" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "time" timestamptz(6),
  "reaction" int2
)
;

-- ----------------------------
-- Records of articlecommentreaction
-- ----------------------------
INSERT INTO "public"."articlecommentreaction" VALUES ('CVxNU5xOe', 'pu65Tr6FE', 'pu65Tr6FE', '2023-04-03 07:22:55.016+00', 1);

-- ----------------------------
-- Table structure for articlecommentthread
-- ----------------------------
DROP TABLE IF EXISTS "public"."articlecommentthread";
CREATE TABLE "public"."articlecommentthread" (
  "commentid" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "id" varchar(40) COLLATE "pg_catalog"."default",
  "author" varchar(255) COLLATE "pg_catalog"."default",
  "comment" text COLLATE "pg_catalog"."default",
  "time" timestamptz(6),
  "updatedat" timestamptz(6),
  "histories" jsonb[],
  "anonymous" bool,
  "userid" varchar(40) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of articlecommentthread
-- ----------------------------
INSERT INTO "public"."articlecommentthread" VALUES ('7qUfAFE_z', 'abw6F9-ap', 'pu65Tr6FE', 'yup', '2023-04-03 07:22:28.309+00', NULL, '{}', NULL, 'pu65Tr6FE');
INSERT INTO "public"."articlecommentthread" VALUES ('7FJaNVvtp', 'abw6F9-ap', 'uEyz9MqaM', 'dwrdwsrewrwer', '2023-04-11 09:39:29.363368+00', NULL, '{}', NULL, 'uEyz9MqaM');
INSERT INTO "public"."articlecommentthread" VALUES ('EGP5q_vaM', '01', 'uEyz9MqaM', 'sdfsdfsdfsdf', '2023-04-11 10:03:17.164252+00', NULL, '{}', NULL, 'uEyz9MqaM');
INSERT INTO "public"."articlecommentthread" VALUES ('9MG5qVvtM', '01', 'uEyz9MqaM', 'sdfsdfsdfsf', '2023-04-11 10:03:30.728717+00', NULL, '{}', NULL, 'uEyz9MqaM');
INSERT INTO "public"."articlecommentthread" VALUES ('n6y5q_vap', '01', 'uEyz9MqaM', 'sdfdsfsdf', '2023-04-11 10:03:36.681524+00', NULL, '{}', NULL, 'uEyz9MqaM');
INSERT INTO "public"."articlecommentthread" VALUES ('uj-UhQvap', '01', 'uEyz9MqaM', 'efsdfdsfsdf', '2023-04-12 03:17:34.963705+00', NULL, '{}', NULL, 'uEyz9MqaM');
INSERT INTO "public"."articlecommentthread" VALUES ('47cIh1vtM', '01', 'uEyz9MqaM', 'sdfdsfsdfs', '2023-04-12 03:17:37.50919+00', NULL, '{}', NULL, 'uEyz9MqaM');

-- ----------------------------
-- Table structure for articlecommentthreadinfo
-- ----------------------------
DROP TABLE IF EXISTS "public"."articlecommentthreadinfo";
CREATE TABLE "public"."articlecommentthreadinfo" (
  "commentid" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "replycount" int4 DEFAULT 0,
  "usefulcount" int4 DEFAULT 0
)
;

-- ----------------------------
-- Records of articlecommentthreadinfo
-- ----------------------------
INSERT INTO "public"."articlecommentthreadinfo" VALUES ('0v79DeRaC', 2, 0);
INSERT INTO "public"."articlecommentthreadinfo" VALUES ('UhZ1uBuNi', 0, 1);
INSERT INTO "public"."articlecommentthreadinfo" VALUES ('xHeq3KlUq', 0, 0);
INSERT INTO "public"."articlecommentthreadinfo" VALUES ('XstrMmbor', 2, 0);
INSERT INTO "public"."articlecommentthreadinfo" VALUES ('Peo0sio7x', 1, 0);
INSERT INTO "public"."articlecommentthreadinfo" VALUES ('BwscWRPYB', 3, 0);
INSERT INTO "public"."articlecommentthreadinfo" VALUES ('CaP4JWfMW', 1, 0);
INSERT INTO "public"."articlecommentthreadinfo" VALUES ('7qUfAFE_z', 1, 1);
INSERT INTO "public"."articlecommentthreadinfo" VALUES ('47cIh1vtM', 2, 0);
INSERT INTO "public"."articlecommentthreadinfo" VALUES ('n6y5q_vap', 1, 1);

-- ----------------------------
-- Table structure for articlecommentthreadreaction
-- ----------------------------
DROP TABLE IF EXISTS "public"."articlecommentthreadreaction";
CREATE TABLE "public"."articlecommentthreadreaction" (
  "commentid" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "author" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "userid" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "time" timestamptz(6),
  "reaction" int2
)
;

-- ----------------------------
-- Records of articlecommentthreadreaction
-- ----------------------------
INSERT INTO "public"."articlecommentthreadreaction" VALUES ('7qUfAFE_z', 'pu65Tr6FE', 'pu65Tr6FE', '2023-04-03 07:22:45.504+00', 1);
INSERT INTO "public"."articlecommentthreadreaction" VALUES ('n6y5q_vap', 'uEyz9MqaM', 'uEyz9MqaM', '2023-04-11 10:03:38.280387+00', 1);

-- ----------------------------
-- Table structure for articleinfo
-- ----------------------------
DROP TABLE IF EXISTS "public"."articleinfo";
CREATE TABLE "public"."articleinfo" (
  "id" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "rate" numeric DEFAULT 0,
  "rate1" int4 DEFAULT 0,
  "rate2" int4 DEFAULT 0,
  "rate3" int4 DEFAULT 0,
  "rate4" int4 DEFAULT 0,
  "rate5" int4 DEFAULT 0,
  "count" int4 DEFAULT 0,
  "score" numeric DEFAULT 0
)
;

-- ----------------------------
-- Records of articleinfo
-- ----------------------------
INSERT INTO "public"."articleinfo" VALUES ('03', 4, 0, 0, 0, 1, 0, 1, 4);
INSERT INTO "public"."articleinfo" VALUES ('01', 4, 0, 0, 0, 1, 0, 1, 4);
INSERT INTO "public"."articleinfo" VALUES ('abw6F9-ap', 3.6000000000000000, 0, 0, 3, 1, 1, 5, 18);
INSERT INTO "public"."articleinfo" VALUES ('02', 4, 0, 0, 0, 1, 0, 1, 4);

-- ----------------------------
-- Table structure for articlerate
-- ----------------------------
DROP TABLE IF EXISTS "public"."articlerate";
CREATE TABLE "public"."articlerate" (
  "id" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "author" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "rate" int4 NOT NULL,
  "time" timestamp(6),
  "review" text COLLATE "pg_catalog"."default",
  "usefulcount" int4 DEFAULT 0,
  "replycount" int4 DEFAULT 0,
  "histories" jsonb[],
  "anonymous" bool
)
;

-- ----------------------------
-- Records of articlerate
-- ----------------------------
INSERT INTO "public"."articlerate" VALUES ('03', 'uEyz9MqaM', 4, '2023-04-11 09:37:59.248', '', 0, 0, '{"{\"rate\": 4, \"time\": \"2023-04-11T09:37:54.058Z\", \"review\": \"sdfsdfsdfsdf\"}"}', 'f');
INSERT INTO "public"."articlerate" VALUES ('01', 'uEyz9MqaM', 4, '2023-04-11 09:51:42.322', 'sdfsdfds', 0, 3, NULL, 'f');
INSERT INTO "public"."articlerate" VALUES ('abw6F9-ap', 'uEyz9MqaM', 5, '2023-04-12 03:41:49.894', '', 1, 3, '{"{\"rate\": 4, \"time\": \"2023-03-27T02:27:57.032Z\", \"review\": \"hi\"}","{\"rate\": 5, \"time\": \"2023-03-27T02:32:15.778Z\", \"review\": \"yolo\"}","{\"rate\": 3, \"time\": \"2023-03-27T16:37:42.861Z\", \"review\": \"a\"}","{\"rate\": 4, \"time\": \"2023-04-11T09:39:40.639Z\", \"review\": \"werwerwerwerwe\"}","{\"rate\": 3, \"time\": \"2023-04-12T03:41:31.294Z\"}"}', 'f');
INSERT INTO "public"."articlerate" VALUES ('02', 'uEyz9MqaM', 4, '2023-04-14 06:12:54.22', '', 0, 0, NULL, 'f');

-- ----------------------------
-- Table structure for articleratecomment
-- ----------------------------
DROP TABLE IF EXISTS "public"."articleratecomment";
CREATE TABLE "public"."articleratecomment" (
  "commentid" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "id" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "author" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "userid" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "comment" text COLLATE "pg_catalog"."default",
  "time" timestamp(6),
  "updatedat" timestamp(6),
  "histories" jsonb[],
  "anonymous" bool
)
;

-- ----------------------------
-- Records of articleratecomment
-- ----------------------------
INSERT INTO "public"."articleratecomment" VALUES ('3619fd33-27a5-4005-b127-1392ca8b09f0', 'abw6F9-ap', 'uEyz9MqaM', 'uEyz9MqaM', 'sdfsdfsdfsdfsdfsdfsdf', '2023-04-11 16:47:48.513863', '2023-04-11 16:48:52.595535', '{"{\"time\": \"2023-04-11T16:47:48.513863Z\", \"comment\": \"sdfsdfsdfsdf\"}"}', 'f');
INSERT INTO "public"."articleratecomment" VALUES ('66bc3c02-b5c9-4813-9eec-32ddacfebfdc', 'abw6F9-ap', 'uEyz9MqaM', 'uEyz9MqaM', 'sdfsdfsdf', '2023-04-11 16:49:07.891247', NULL, NULL, 't');
INSERT INTO "public"."articleratecomment" VALUES ('64e641f0-5c0a-4c15-8451-c03207949143', 'abw6F9-ap', 'uEyz9MqaM', 'uEyz9MqaM', 'sdfsdfsdf', '2023-04-11 16:49:39.067734', NULL, NULL, 'f');
INSERT INTO "public"."articleratecomment" VALUES ('19f66ef9-e8b9-41be-b6e3-dd0bb4735606', '01', 'uEyz9MqaM', 'uEyz9MqaM', 'sdfsfdsfsdfsdfsdfsdf', '2023-04-11 16:51:50.607095', '2023-04-11 16:54:20.77203', '{"{\"time\": \"2023-04-11T16:51:50.607095Z\", \"comment\": \"sdfsfdsfsdf\"}"}', 'f');
INSERT INTO "public"."articleratecomment" VALUES ('69016b24-70c7-4fa8-adb9-1aa7f3960648', '01', 'uEyz9MqaM', 'uEyz9MqaM', 'sdfsdfsdf', '2023-04-11 17:03:21.236855', NULL, NULL, 'f');
INSERT INTO "public"."articleratecomment" VALUES ('c222a184-2aca-4d20-beb9-6c2bde035ae4', '01', 'uEyz9MqaM', 'uEyz9MqaM', 'sdfsdfsdfsdfwerfwer', '2023-04-11 17:03:26.720663', NULL, NULL, 't');

-- ----------------------------
-- Table structure for articleratereaction
-- ----------------------------
DROP TABLE IF EXISTS "public"."articleratereaction";
CREATE TABLE "public"."articleratereaction" (
  "id" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "author" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "userid" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "time" timestamp(6),
  "reaction" int2
)
;

-- ----------------------------
-- Records of articleratereaction
-- ----------------------------
INSERT INTO "public"."articleratereaction" VALUES ('abw6F9-ap', 'uEyz9MqaM', 'pu65Tr6FE', '2023-04-03 09:21:09.311', 1);

-- ----------------------------
-- Table structure for authencodes
-- ----------------------------
DROP TABLE IF EXISTS "public"."authencodes";
CREATE TABLE "public"."authencodes" (
  "id" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "code" varchar(500) COLLATE "pg_catalog"."default" NOT NULL,
  "expiredat" timestamptz(6) NOT NULL
)
;

-- ----------------------------
-- Records of authencodes
-- ----------------------------

-- ----------------------------
-- Table structure for authentication
-- ----------------------------
DROP TABLE IF EXISTS "public"."authentication";
CREATE TABLE "public"."authentication" (
  "id" varchar COLLATE "pg_catalog"."default",
  "password" varchar COLLATE "pg_catalog"."default",
  "failcount" varchar COLLATE "pg_catalog"."default",
  "lockeduntiltime" varchar COLLATE "pg_catalog"."default",
  "successtime" varchar COLLATE "pg_catalog"."default",
  "failtime" varchar COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of authentication
-- ----------------------------

-- ----------------------------
-- Table structure for brand
-- ----------------------------
DROP TABLE IF EXISTS "public"."brand";
CREATE TABLE "public"."brand" (
  "brand" varchar(255) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of brand
-- ----------------------------
INSERT INTO "public"."brand" VALUES ('Sony');
INSERT INTO "public"."brand" VALUES ('Samsung');
INSERT INTO "public"."brand" VALUES ('Canon');
INSERT INTO "public"."brand" VALUES ('Nikon');
INSERT INTO "public"."brand" VALUES ('Olypus');
INSERT INTO "public"."brand" VALUES ('Xiaomi');
INSERT INTO "public"."brand" VALUES ('Apple');
INSERT INTO "public"."brand" VALUES ('Disney');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS "public"."category";
CREATE TABLE "public"."category" (
  "categoryid" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "categoryname" varchar(300) COLLATE "pg_catalog"."default" NOT NULL,
  "status" char(1) COLLATE "pg_catalog"."default" NOT NULL,
  "createdby" varchar(40) COLLATE "pg_catalog"."default",
  "createdat" timestamp(6),
  "updatedby" varchar(40) COLLATE "pg_catalog"."default",
  "updatedat" timestamp(6)
)
;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO "public"."category" VALUES ('action', 'action', 'A', NULL, NULL, NULL, NULL);
INSERT INTO "public"."category" VALUES ('comedy', 'comedy', 'A', NULL, NULL, NULL, NULL);
INSERT INTO "public"."category" VALUES ('camera', 'camera', 'A', NULL, NULL, NULL, NULL);
INSERT INTO "public"."category" VALUES ('mobiphone', 'mobiphone', 'A', NULL, NULL, NULL, NULL);
INSERT INTO "public"."category" VALUES ('technological', 'technological', 'A', NULL, NULL, NULL, NULL);
INSERT INTO "public"."category" VALUES ('apple', 'apple', 'A', NULL, NULL, NULL, NULL);
INSERT INTO "public"."category" VALUES ('laptop', 'laptop', 'A', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for cinema
-- ----------------------------
DROP TABLE IF EXISTS "public"."cinema";
CREATE TABLE "public"."cinema" (
  "id" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "address" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "parent" varchar(40) COLLATE "pg_catalog"."default",
  "status" char(1) COLLATE "pg_catalog"."default" NOT NULL,
  "latitude" numeric,
  "longitude" numeric,
  "imageurl" text COLLATE "pg_catalog"."default",
  "createdby" varchar(40) COLLATE "pg_catalog"."default",
  "createdat" timestamp(6),
  "updatedby" varchar(40) COLLATE "pg_catalog"."default",
  "updatedat" timestamp(6),
  "gallery" jsonb[],
  "coverurl" text COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of cinema
-- ----------------------------
INSERT INTO "public"."cinema" VALUES ('CGV1', 'CGV Thu Duc', '216 Đ. Võ Văn Ngân, Bình Thọ, Thủ Đức, T', 'CGV', 'A', NULL, NULL, 'https:/storage.googleapis.com/go-firestore-rest-api.appspot.com/sub/PvYGRnrtp_pup.jpg', NULL, NULL, NULL, NULL, '{"{\"url\": \"https:/storage.googleapis.com/go-firestore-rest-api.appspot.com/sub/O6EC3CztM_dog3.jfif\", \"type\": \"image\"}","{\"url\": \"https:/storage.googleapis.com/go-firestore-rest-api.appspot.com/sub/trvCFk-tp_pup.jpg\", \"type\": \"image\"}"}', 'https:/storage.googleapis.com/go-firestore-rest-api.appspot.com/sub/hiF_Fk-tM_cover.jpg');

-- ----------------------------
-- Table structure for company
-- ----------------------------
DROP TABLE IF EXISTS "public"."company";
CREATE TABLE "public"."company" (
  "id" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(120) COLLATE "pg_catalog"."default",
  "description" varchar(1000) COLLATE "pg_catalog"."default",
  "address" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "size" int4,
  "status" char(1) COLLATE "pg_catalog"."default" NOT NULL,
  "establishedat" timestamptz(6),
  "categories" varchar[] COLLATE "pg_catalog"."default",
  "imageurl" varchar(300) COLLATE "pg_catalog"."default",
  "coverurl" varchar(300) COLLATE "pg_catalog"."default",
  "gallery" varchar[] COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of company
-- ----------------------------
INSERT INTO "public"."company" VALUES ('id1', 'Softwave company', 'This is description', ' Hùng Vương Plaza 126 Hùng Vương Quận 5 Tp. Hồ Chí Minh', 500, 'A', '2022-07-20 17:00:00+00', '{Categories1,Categories2}', 'https://maisonoffice.vn/wp-content/uploads/2021/09/toa-nha-hung-vuong-plaza.jpg', NULL, NULL);
INSERT INTO "public"."company" VALUES ('id2', 'Softwave company', 'This is description', ' Hùng Vương Plaza 126 Hùng Vương Quận 5 Tp. Hồ Chí Minh', 500, 'A', '2022-07-20 17:00:00+00', '{Categories1,Categories2}', 'https://maisonoffice.vn/wp-content/uploads/2021/09/toa-nha-hung-vuong-plaza.jpg', NULL, NULL);
INSERT INTO "public"."company" VALUES ('id3', 'Softwave company', 'This is description', ' Hùng Vương Plaza 126 Hùng Vương Quận 5 Tp. Hồ Chí Minh', 500, 'A', '2022-07-20 17:00:00+00', '{Categories1,Categories2}', 'https://maisonoffice.vn/wp-content/uploads/2021/09/toa-nha-hung-vuong-plaza.jpg', NULL, NULL);
INSERT INTO "public"."company" VALUES ('id4', 'Softwave company', 'This is description', ' Hùng Vương Plaza 126 Hùng Vương Quận 5 Tp. Hồ Chí Minh', 500, 'I', '2022-07-20 17:00:00+00', '{Categories1,Categories2}', 'https://maisonoffice.vn/wp-content/uploads/2021/09/toa-nha-hung-vuong-plaza.jpg', NULL, NULL);
INSERT INTO "public"."company" VALUES ('id5', 'Softwave company', 'This is description', ' Hùng Vương Plaza 126 Hùng Vương Quận 5 Tp. Hồ Chí Minh', 500, 'I', '2022-07-20 17:00:00+00', '{Categories1,Categories2}', 'https://maisonoffice.vn/wp-content/uploads/2021/09/toa-nha-hung-vuong-plaza.jpg', NULL, NULL);

-- ----------------------------
-- Table structure for company_users
-- ----------------------------
DROP TABLE IF EXISTS "public"."company_users";
CREATE TABLE "public"."company_users" (
  "company_id" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "user_id" varchar(40) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of company_users
-- ----------------------------
INSERT INTO "public"."company_users" VALUES ('odltd', 'h3-bIa9tp');
INSERT INTO "public"."company_users" VALUES ('odltd', 'mPOdF3rap');
INSERT INTO "public"."company_users" VALUES ('odltd', '1c7TAkSsA');
INSERT INTO "public"."company_users" VALUES ('id2', '1c7TAkSsA');

-- ----------------------------
-- Table structure for companycategory
-- ----------------------------
DROP TABLE IF EXISTS "public"."companycategory";
CREATE TABLE "public"."companycategory" (
  "categoryid" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "categoryname" varchar(300) COLLATE "pg_catalog"."default" NOT NULL,
  "status" char(1) COLLATE "pg_catalog"."default" NOT NULL,
  "createdby" varchar(40) COLLATE "pg_catalog"."default",
  "createdat" timestamp(6),
  "updatedby" varchar(40) COLLATE "pg_catalog"."default",
  "updatedat" timestamp(6)
)
;

-- ----------------------------
-- Records of companycategory
-- ----------------------------
INSERT INTO "public"."companycategory" VALUES ('Entertainment', 'Entertainment', 'A', NULL, NULL, NULL, NULL);
INSERT INTO "public"."companycategory" VALUES ('Financial business', 'Financial business', 'A', NULL, NULL, NULL, NULL);
INSERT INTO "public"."companycategory" VALUES ('Industrial production', 'Industrial production', 'A', NULL, NULL, NULL, NULL);
INSERT INTO "public"."companycategory" VALUES ('Real estate business', 'Real estate business', 'A', NULL, NULL, NULL, NULL);
INSERT INTO "public"."companycategory" VALUES ('Business services', 'Business services', 'A', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for companycomment
-- ----------------------------
DROP TABLE IF EXISTS "public"."companycomment";
CREATE TABLE "public"."companycomment" (
  "commentid" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "id" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "author" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "userid" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "comment" text COLLATE "pg_catalog"."default",
  "time" timestamp(6),
  "updatedat" timestamp(6),
  "histories" jsonb[]
)
;

-- ----------------------------
-- Records of companycomment
-- ----------------------------

-- ----------------------------
-- Table structure for companyrate
-- ----------------------------
DROP TABLE IF EXISTS "public"."companyrate";
CREATE TABLE "public"."companyrate" (
  "id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "author" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "rate" int4,
  "time" timestamp(6),
  "review" text COLLATE "pg_catalog"."default",
  "usefulcount" int4 DEFAULT 0,
  "replycount" int4 DEFAULT 0,
  "histories" jsonb[]
)
;

-- ----------------------------
-- Records of companyrate
-- ----------------------------

-- ----------------------------
-- Table structure for companyratefullinfo
-- ----------------------------
DROP TABLE IF EXISTS "public"."companyratefullinfo";
CREATE TABLE "public"."companyratefullinfo" (
  "id" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "rate" numeric DEFAULT 0,
  "rate1" int4 DEFAULT 0,
  "rate2" int4 DEFAULT 0,
  "rate3" int4 DEFAULT 0,
  "rate4" int4 DEFAULT 0,
  "rate5" int4 DEFAULT 0,
  "count" int4,
  "score" numeric
)
;

-- ----------------------------
-- Records of companyratefullinfo
-- ----------------------------
INSERT INTO "public"."companyratefullinfo" VALUES ('id2', 2.799999952316284, 4, 3, 4, 2, 1, 1, 2.799999952316284);

-- ----------------------------
-- Table structure for companyrateinfo01
-- ----------------------------
DROP TABLE IF EXISTS "public"."companyrateinfo01";
CREATE TABLE "public"."companyrateinfo01" (
  "id" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "rate" numeric DEFAULT 0,
  "rate1" int4 DEFAULT 0,
  "rate2" int4 DEFAULT 0,
  "rate3" int4 DEFAULT 0,
  "rate4" int4 DEFAULT 0,
  "rate5" int4 DEFAULT 0,
  "count" int4,
  "score" numeric
)
;

-- ----------------------------
-- Records of companyrateinfo01
-- ----------------------------
INSERT INTO "public"."companyrateinfo01" VALUES ('id2', 4, 0, 0, 0, 1, 0, 1, 4);

-- ----------------------------
-- Table structure for companyrateinfo02
-- ----------------------------
DROP TABLE IF EXISTS "public"."companyrateinfo02";
CREATE TABLE "public"."companyrateinfo02" (
  "id" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "rate" numeric DEFAULT 0,
  "rate1" int4 DEFAULT 0,
  "rate2" int4 DEFAULT 0,
  "rate3" int4 DEFAULT 0,
  "rate4" int4 DEFAULT 0,
  "rate5" int4 DEFAULT 0,
  "count" int4,
  "score" numeric
)
;

-- ----------------------------
-- Records of companyrateinfo02
-- ----------------------------
INSERT INTO "public"."companyrateinfo02" VALUES ('id2', 3, 0, 0, 1, 0, 0, 1, 3);

-- ----------------------------
-- Table structure for companyrateinfo03
-- ----------------------------
DROP TABLE IF EXISTS "public"."companyrateinfo03";
CREATE TABLE "public"."companyrateinfo03" (
  "id" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "rate" numeric DEFAULT 0,
  "rate1" int4 DEFAULT 0,
  "rate2" int4 DEFAULT 0,
  "rate3" int4 DEFAULT 0,
  "rate4" int4 DEFAULT 0,
  "rate5" int4 DEFAULT 0,
  "count" int4,
  "score" numeric
)
;

-- ----------------------------
-- Records of companyrateinfo03
-- ----------------------------
INSERT INTO "public"."companyrateinfo03" VALUES ('id2', 4, 0, 0, 0, 1, 0, 1, 4);

-- ----------------------------
-- Table structure for companyrateinfo04
-- ----------------------------
DROP TABLE IF EXISTS "public"."companyrateinfo04";
CREATE TABLE "public"."companyrateinfo04" (
  "id" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "rate" numeric DEFAULT 0,
  "rate1" int4 DEFAULT 0,
  "rate2" int4 DEFAULT 0,
  "rate3" int4 DEFAULT 0,
  "rate4" int4 DEFAULT 0,
  "rate5" int4 DEFAULT 0,
  "count" int4,
  "score" numeric
)
;

-- ----------------------------
-- Records of companyrateinfo04
-- ----------------------------
INSERT INTO "public"."companyrateinfo04" VALUES ('id2', 2, 0, 1, 0, 0, 0, 1, 2);

-- ----------------------------
-- Table structure for companyrateinfo05
-- ----------------------------
DROP TABLE IF EXISTS "public"."companyrateinfo05";
CREATE TABLE "public"."companyrateinfo05" (
  "id" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "rate" numeric DEFAULT 0,
  "rate1" int4 DEFAULT 0,
  "rate2" int4 DEFAULT 0,
  "rate3" int4 DEFAULT 0,
  "rate4" int4 DEFAULT 0,
  "rate5" int4 DEFAULT 0,
  "count" int4,
  "score" numeric
)
;

-- ----------------------------
-- Records of companyrateinfo05
-- ----------------------------
INSERT INTO "public"."companyrateinfo05" VALUES ('id2', 1, 1, 0, 0, 0, 0, 1, 1);

-- ----------------------------
-- Table structure for companyratereaction
-- ----------------------------
DROP TABLE IF EXISTS "public"."companyratereaction";
CREATE TABLE "public"."companyratereaction" (
  "id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "author" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "userid" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "time" timestamp(6),
  "reaction" int2
)
;

-- ----------------------------
-- Records of companyratereaction
-- ----------------------------
INSERT INTO "public"."companyratereaction" VALUES ('id2', 'h3-bIa9tp', 'h3-bIa9tp', '2022-11-05 07:45:05.676442', 1);

-- ----------------------------
-- Table structure for countries
-- ----------------------------
DROP TABLE IF EXISTS "public"."countries";
CREATE TABLE "public"."countries" (
  "country" varchar(120) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of countries
-- ----------------------------
INSERT INTO "public"."countries" VALUES ('Vietnam');
INSERT INTO "public"."countries" VALUES ('United State');
INSERT INTO "public"."countries" VALUES ('England');
INSERT INTO "public"."countries" VALUES ('Chinese');
INSERT INTO "public"."countries" VALUES ('Australia');

-- ----------------------------
-- Table structure for film
-- ----------------------------
DROP TABLE IF EXISTS "public"."film";
CREATE TABLE "public"."film" (
  "id" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "title" varchar(300) COLLATE "pg_catalog"."default" NOT NULL,
  "description" varchar(300) COLLATE "pg_catalog"."default",
  "imageurl" varchar(300) COLLATE "pg_catalog"."default",
  "trailerurl" varchar(300) COLLATE "pg_catalog"."default",
  "categories" varchar[] COLLATE "pg_catalog"."default",
  "directors" varchar[] COLLATE "pg_catalog"."default",
  "casts" varchar[] COLLATE "pg_catalog"."default",
  "productions" varchar[] COLLATE "pg_catalog"."default",
  "countries" varchar[] COLLATE "pg_catalog"."default",
  "language" varchar(300) COLLATE "pg_catalog"."default",
  "writer" varchar[] COLLATE "pg_catalog"."default",
  "gallery" jsonb[],
  "coverurl" varchar(300) COLLATE "pg_catalog"."default",
  "status" char(1) COLLATE "pg_catalog"."default" NOT NULL,
  "createdby" varchar(40) COLLATE "pg_catalog"."default",
  "createdat" timestamp(6),
  "updatedby" varchar(40) COLLATE "pg_catalog"."default",
  "updatedat" timestamp(6)
)
;

-- ----------------------------
-- Records of film
-- ----------------------------
INSERT INTO "public"."film" VALUES ('00001', 'The Shawshank Redemption', NULL, 'https://m.media-amazon.com/images/M/MV5BMDFkYTc0MGEtZmNhMC00ZDIzLWFmNTEtODM1ZmRlYWMwMWFmXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_.jpg', 'https://www.imdb.com/video/vi3877612057?playlistId=tt0111161&ref_=tt_pr_ov_vi', '{drama}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, NULL);
INSERT INTO "public"."film" VALUES ('00002', 'Thor: Love and Thunder', NULL, 'https://genk.mediacdn.vn/139269124445442048/2022/4/19/2-16503255592162067496114.jpg', 'https://www.youtube.com/watch?v=tgB1wUcmbbw', '{drama,crime}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, NULL);
INSERT INTO "public"."film" VALUES ('00003', 'Top Gun: Maverick', NULL, 'https://www.cgv.vn/media/catalog/product/cache/3/image/c5f0a1eff4c394a251036189ccddaacd/t/o/top_gun_maverick_-_poster_28.03_1_.jpg', 'https://www.youtube.com/watch?v=yM389FbhlRQ', '{action,drama}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, NULL);
INSERT INTO "public"."film" VALUES ('00004', 'The Batman', NULL, 'https://www.cgv.vn/media/catalog/product/cache/1/image/c5f0a1eff4c394a251036189ccddaacd/p/o/poster_batman-1.jpg', 'https://youtu.be/761uRaAoW00', '{action,crime,drama}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, NULL);
INSERT INTO "public"."film" VALUES ('00005', 'The Sadness', NULL, 'https://phimnhua.com/wp-content/uploads/2022/04/phimnhua_1650248826.jpg', 'https://www.youtube.com/watch?v=axjme4v-xRo', '{horror}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, NULL);
INSERT INTO "public"."film" VALUES ('00006', 'Doctor Strange in the Multiverse of Madness', NULL, 'https://m.media-amazon.com/images/M/MV5BMDFkYTc0MGEtZmNhMC00ZDIzLWFmNTEtODM1ZmRlYWMwMWFmXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_UY67_CR0,0,45,67_AL_.jpg', 'https://www.imdb.com/video/vi3877612057?playlistId=tt0111161&ref_=tt_pr_ov_vi', '{action,adventure,fantasy}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, NULL);
INSERT INTO "public"."film" VALUES ('00007', 'Fantastic Beasts: The Secrets of Dumbledore', NULL, 'https://i.bloganchoi.com/bloganchoi.com/wp-content/uploads/2022/04/review-phim-sinh-vat-huyen-bi-3-fantastic-beasts-3-2-696x1031.jpg?fit=700%2C20000&quality=95&ssl=1', 'https://youtu.be/Y9dr2zw-TXQ', '{family,adventure,fantasy}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, NULL);
INSERT INTO "public"."film" VALUES ('00008', 'The Adam Project', NULL, 'http://photos.q00gle.com/storage/files/images-2021/images-movies/09/622b6789e7084.jpg', 'https://youtu.be/IE8HIsIrq4o', '{action,comedy,adventure}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, NULL);
INSERT INTO "public"."film" VALUES ('00009', 'Spider-Man: No Way Home', NULL, 'https://gamek.mediacdn.vn/133514250583805952/2021/11/17/photo-1-1637118381839432740223.jpg', 'https://www.youtube.com/watch?v=OB3g37GTALc', '{action,adventure,fantasy}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, NULL);
INSERT INTO "public"."film" VALUES ('00010', 'Dune', NULL, 'https://www.cgv.vn/media/catalog/product/cache/1/image/c5f0a1eff4c394a251036189ccddaacd/d/u/dune-poster-1.jpg', 'https://youtu.be/8g18jFHCLXk', '{action,adventure,drama}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for filmcasts
-- ----------------------------
DROP TABLE IF EXISTS "public"."filmcasts";
CREATE TABLE "public"."filmcasts" (
  "actor" varchar(120) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of filmcasts
-- ----------------------------
INSERT INTO "public"."filmcasts" VALUES ('Will Smith');
INSERT INTO "public"."filmcasts" VALUES ('Leonardo DiCaprio');
INSERT INTO "public"."filmcasts" VALUES ('Tom Hanks');
INSERT INTO "public"."filmcasts" VALUES ('Samuel L. Jackson');
INSERT INTO "public"."filmcasts" VALUES ('Robert Downey Jr.');
INSERT INTO "public"."filmcasts" VALUES ('Johnny Deep');
INSERT INTO "public"."filmcasts" VALUES ('Benedict Cumberbatch');

-- ----------------------------
-- Table structure for filmcategory
-- ----------------------------
DROP TABLE IF EXISTS "public"."filmcategory";
CREATE TABLE "public"."filmcategory" (
  "categoryid" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "categoryname" varchar(300) COLLATE "pg_catalog"."default" NOT NULL,
  "status" char(1) COLLATE "pg_catalog"."default" NOT NULL,
  "createdby" varchar(40) COLLATE "pg_catalog"."default",
  "createdat" timestamp(6),
  "updatedby" varchar(40) COLLATE "pg_catalog"."default",
  "updatedat" timestamp(6)
)
;

-- ----------------------------
-- Records of filmcategory
-- ----------------------------
INSERT INTO "public"."filmcategory" VALUES ('adventure', 'adventure', 'A', NULL, NULL, NULL, NULL);
INSERT INTO "public"."filmcategory" VALUES ('animated', 'animated', 'A', NULL, NULL, NULL, NULL);
INSERT INTO "public"."filmcategory" VALUES ('comedy', 'comedy', 'A', NULL, NULL, NULL, NULL);
INSERT INTO "public"."filmcategory" VALUES ('drama', 'drama', 'A', NULL, NULL, NULL, NULL);
INSERT INTO "public"."filmcategory" VALUES ('horror', 'horror', 'A', NULL, NULL, NULL, NULL);
INSERT INTO "public"."filmcategory" VALUES ('crime', 'crime', 'A', NULL, NULL, NULL, NULL);
INSERT INTO "public"."filmcategory" VALUES ('fantasy', 'fantasy', 'A', NULL, NULL, NULL, NULL);
INSERT INTO "public"."filmcategory" VALUES ('family', 'family', 'A', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for filmcommentthread
-- ----------------------------
DROP TABLE IF EXISTS "public"."filmcommentthread";
CREATE TABLE "public"."filmcommentthread" (
  "commentid" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "id" varchar(40) COLLATE "pg_catalog"."default",
  "author" varchar(255) COLLATE "pg_catalog"."default",
  "comment" text COLLATE "pg_catalog"."default",
  "time" timestamptz(6),
  "updatedat" timestamptz(6),
  "histories" jsonb[],
  "anonymous" bool,
  "userid" varchar(40) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of filmcommentthread
-- ----------------------------
INSERT INTO "public"."filmcommentthread" VALUES ('7_Pblhrzn', '00002', 'uEyz9MqaM', 'hi', '2023-03-29 07:07:55.007+00', NULL, '{}', NULL, 'uEyz9MqaM');
INSERT INTO "public"."filmcommentthread" VALUES ('zfVUyEgHR', '00002', 'pu65Tr6FE', 'hi', '2023-04-03 02:19:55.2+00', NULL, '{}', NULL, 'pu65Tr6FE');
INSERT INTO "public"."filmcommentthread" VALUES ('c0cWhmwdG', '00001', 'pu65Tr6FE', 'yo', '2023-04-03 06:50:22.819+00', NULL, '{}', NULL, 'pu65Tr6FE');
INSERT INTO "public"."filmcommentthread" VALUES ('F5jCAtR9_', '00001', 'pu65Tr6FE', 'a', '2023-04-07 02:41:51.653+00', NULL, NULL, NULL, 'pu65Tr6FE');
INSERT INTO "public"."filmcommentthread" VALUES ('r3agdZQcJ', '00001', 'pu65Tr6FE', 'b', '2023-04-07 02:41:54.213+00', NULL, NULL, NULL, 'pu65Tr6FE');
INSERT INTO "public"."filmcommentthread" VALUES ('6QPDwt6b5', '00001', 'pu65Tr6FE', 'c', '2023-04-07 02:41:56.864+00', NULL, NULL, NULL, 'pu65Tr6FE');
INSERT INTO "public"."filmcommentthread" VALUES ('YL93OqP_L', '00001', 'pu65Tr6FE', 'd', '2023-04-07 02:41:59.205+00', NULL, NULL, NULL, 'pu65Tr6FE');
INSERT INTO "public"."filmcommentthread" VALUES ('hSU_DwgzF', '00001', 'pu65Tr6FE', 'e', '2023-04-07 02:42:01.597+00', NULL, NULL, NULL, 'pu65Tr6FE');
INSERT INTO "public"."filmcommentthread" VALUES ('GLNCpyjmd', '00001', 'pu65Tr6FE', 'f', '2023-04-07 02:42:03.832+00', NULL, NULL, NULL, 'pu65Tr6FE');
INSERT INTO "public"."filmcommentthread" VALUES ('QUuNhgAv1', '00001', 'pu65Tr6FE', 'g', '2023-04-07 02:42:06.346+00', NULL, NULL, NULL, 'pu65Tr6FE');
INSERT INTO "public"."filmcommentthread" VALUES ('JredRTfaH', '00001', 'pu65Tr6FE', 'k', '2023-04-07 02:42:14.781+00', NULL, NULL, NULL, 'pu65Tr6FE');
INSERT INTO "public"."filmcommentthread" VALUES ('G9VuEdWyn', '00001', 'pu65Tr6FE', 'l', '2023-04-07 02:42:18.26+00', NULL, NULL, NULL, 'pu65Tr6FE');
INSERT INTO "public"."filmcommentthread" VALUES ('Ujfc98cda', '00001', 'pu65Tr6FE', 'm', '2023-04-07 02:42:21.33+00', NULL, NULL, NULL, 'pu65Tr6FE');
INSERT INTO "public"."filmcommentthread" VALUES ('dcj3Vb_Hs', '00001', 'pu65Tr6FE', 'hhhbaba', '2023-04-07 02:42:08.933+00', '2023-04-07 03:54:25.086+00', '{"{\"time\": \"2023-04-07T02:42:08.933Z\", \"comment\": \"h\"}","{\"time\": \"2023-04-07T02:42:08.933Z\", \"comment\": \"hhh\"}","{\"time\": \"2023-04-07T02:42:08.933Z\", \"comment\": \"hhh b\"}","{\"time\": \"2023-04-07T02:42:08.933Z\", \"comment\": \"hhh\"}","{\"time\": \"2023-04-07T02:42:08.933Z\", \"comment\": \"hhhba\"}"}', NULL, 'pu65Tr6FE');
INSERT INTO "public"."filmcommentthread" VALUES ('Y7EcAhUMf', '00001', 'pu65Tr6FE', 'klka', '2023-04-07 02:42:11.496+00', '2023-04-07 04:19:56.03+00', '{"{\"time\": \"2023-04-07T02:42:11.496Z\", \"comment\": \"j\"}","{\"time\": \"2023-04-07T02:42:11.496Z\", \"comment\": \"klk\"}","{\"time\": \"2023-04-07T02:42:11.496Z\", \"comment\": \"klka\"}","{\"time\": \"2023-04-07T02:42:11.496Z\", \"comment\": \"klkb\"}","{\"time\": \"2023-04-07T02:42:11.496Z\", \"comment\": \"klka\"}","{\"time\": \"2023-04-07T02:42:11.496Z\", \"comment\": \"klkb\"}"}', NULL, 'pu65Tr6FE');
INSERT INTO "public"."filmcommentthread" VALUES ('Z2ENHmsM-', '00001', 'pu65Tr6FE', 'alo aboseyo', '2023-04-03 03:25:23.401+00', '2023-04-07 06:49:25.525+00', '{"{\"time\": \"2023-04-03T03:25:23.401Z\", \"comment\": \"alo\"}"}', NULL, 'pu65Tr6FE');
INSERT INTO "public"."filmcommentthread" VALUES ('4kL4o6eeO', '00001', 'pu65Tr6FE', 'Filling the Resignation letter form. Signature of your Project manager and yours are requested.
Please return all of TMA’s equipment and get signature of IT/Security Department at Item I
And get signature of your Project Manager at item III and at the end of this document (Checklist of Resignation)', '2023-04-07 08:45:47.118+00', NULL, NULL, NULL, 'pu65Tr6FE');
INSERT INTO "public"."filmcommentthread" VALUES ('G3iwl_vap', '00003', 'uEyz9MqaM', 'sdfgvsdfsdfds', '2023-04-11 09:15:48.057242+00', NULL, '{}', NULL, 'uEyz9MqaM');
INSERT INTO "public"."filmcommentthread" VALUES ('-47Ux1vtM', '00001', 'uEyz9MqaM', 'wefwerwerewr', '2023-04-12 02:25:21.575776+00', NULL, '{}', NULL, 'uEyz9MqaM');

-- ----------------------------
-- Table structure for filmcommentthreadinfo
-- ----------------------------
DROP TABLE IF EXISTS "public"."filmcommentthreadinfo";
CREATE TABLE "public"."filmcommentthreadinfo" (
  "commentid" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "replycount" int4 DEFAULT 0,
  "usefulcount" int4 DEFAULT 0
)
;

-- ----------------------------
-- Records of filmcommentthreadinfo
-- ----------------------------
INSERT INTO "public"."filmcommentthreadinfo" VALUES ('r3agdZQcJ', 0, 0);
INSERT INTO "public"."filmcommentthreadinfo" VALUES ('F5jCAtR9_', 0, 1);
INSERT INTO "public"."filmcommentthreadinfo" VALUES ('c0cWhmwdG', 1, 1);
INSERT INTO "public"."filmcommentthreadinfo" VALUES ('zfVUyEgHR', 2, 0);
INSERT INTO "public"."filmcommentthreadinfo" VALUES ('7_Pblhrzn', 4, 1);
INSERT INTO "public"."filmcommentthreadinfo" VALUES ('4kL4o6eeO', 1, 0);
INSERT INTO "public"."filmcommentthreadinfo" VALUES ('Y7EcAhUMf', 2, 0);
INSERT INTO "public"."filmcommentthreadinfo" VALUES ('6QPDwt6b5', 0, 1);
INSERT INTO "public"."filmcommentthreadinfo" VALUES ('G3iwl_vap', 2, 0);

-- ----------------------------
-- Table structure for filmcommentthreadreaction
-- ----------------------------
DROP TABLE IF EXISTS "public"."filmcommentthreadreaction";
CREATE TABLE "public"."filmcommentthreadreaction" (
  "commentid" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "author" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "userid" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "time" timestamptz(6),
  "reaction" int2
)
;

-- ----------------------------
-- Records of filmcommentthreadreaction
-- ----------------------------
INSERT INTO "public"."filmcommentthreadreaction" VALUES ('F5jCAtR9_', 'pu65Tr6FE', 'pu65Tr6FE', '2023-04-07 07:22:43.099+00', 1);
INSERT INTO "public"."filmcommentthreadreaction" VALUES ('c0cWhmwdG', 'pu65Tr6FE', 'uEyz9MqaM', '2023-04-07 07:45:13.396+00', 1);
INSERT INTO "public"."filmcommentthreadreaction" VALUES ('7_Pblhrzn', 'uEyz9MqaM', 'uEyz9MqaM', '2023-04-10 08:17:56.279846+00', 1);
INSERT INTO "public"."filmcommentthreadreaction" VALUES ('6QPDwt6b5', 'pu65Tr6FE', 'uEyz9MqaM', '2023-04-12 02:24:44.623864+00', 1);

-- ----------------------------
-- Table structure for filmdirectors
-- ----------------------------
DROP TABLE IF EXISTS "public"."filmdirectors";
CREATE TABLE "public"."filmdirectors" (
  "director" varchar(120) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of filmdirectors
-- ----------------------------
INSERT INTO "public"."filmdirectors" VALUES ('Steven Spielberg');
INSERT INTO "public"."filmdirectors" VALUES ('Quentin Tarantino');
INSERT INTO "public"."filmdirectors" VALUES ('christopher Nolan');
INSERT INTO "public"."filmdirectors" VALUES ('Peter Jackson');
INSERT INTO "public"."filmdirectors" VALUES ('Martin Scorsese');

-- ----------------------------
-- Table structure for filmproductions
-- ----------------------------
DROP TABLE IF EXISTS "public"."filmproductions";
CREATE TABLE "public"."filmproductions" (
  "production" varchar(120) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of filmproductions
-- ----------------------------
INSERT INTO "public"."filmproductions" VALUES ('Walt Disney Studios');
INSERT INTO "public"."filmproductions" VALUES ('Warner Bros.');
INSERT INTO "public"."filmproductions" VALUES ('Universal Pictures');
INSERT INTO "public"."filmproductions" VALUES ('Paramount Pictures');
INSERT INTO "public"."filmproductions" VALUES ('Lionsgate Films');

-- ----------------------------
-- Table structure for filmrate
-- ----------------------------
DROP TABLE IF EXISTS "public"."filmrate";
CREATE TABLE "public"."filmrate" (
  "id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "author" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "rate" int4,
  "time" timestamp(6),
  "review" text COLLATE "pg_catalog"."default",
  "usefulcount" int4 DEFAULT 0,
  "replycount" int4 DEFAULT 0,
  "histories" jsonb[],
  "anonymous" bool
)
;

-- ----------------------------
-- Records of filmrate
-- ----------------------------
INSERT INTO "public"."filmrate" VALUES ('00001', 'pu65Tr6FE', 4, '2023-04-07 15:47:37.515', 'Filling the Resignation letter form. Signature of your Project manager and yours are requested. Please return all of TMA’s equipment and get signature of IT/Security Department at Item I And get signature of your Project Manager at item III and at the end of this document (Checklist of Resignation)', 0, 1, '{"{\"rate\": 7, \"time\": \"2023-04-07T04:21:30.048Z\", \"review\": \"hellu\"}","{\"rate\": 2, \"time\": \"2023-04-07T04:33:32.394Z\", \"review\": \"bello\"}","{\"rate\": 9, \"time\": \"2023-04-07T04:37:51.359Z\", \"review\": \"oh no\"}","{\"rate\": 2, \"time\": \"2023-04-07T06:24:55.001Z\", \"review\": \"abc\"}","{\"rate\": 9, \"time\": \"2023-04-07T06:25:20.593Z\", \"review\": \"abc\"}","{\"rate\": 2, \"time\": \"2023-04-07T06:54:15.120Z\", \"review\": \"haha\"}","{\"rate\": 7, \"time\": \"2023-04-07T06:54:39.294Z\", \"review\": \"huhu\"}"}', 'f');
INSERT INTO "public"."filmrate" VALUES ('00001', 'uEyz9MqaM', 9, '2023-04-07 13:56:57.118', 'he', 0, 2, '{"{\"rate\": 4, \"time\": \"2023-03-20T03:19:11.113Z\", \"review\": \"Abc\"}","{\"rate\": 5, \"time\": \"2023-03-22T04:52:23.538Z\", \"review\": \"a\"}","{\"rate\": 4, \"time\": \"2023-04-04T04:37:46.812Z\", \"review\": \"a\"}","{\"rate\": 7, \"time\": \"2023-04-05T02:22:16.703Z\", \"review\": \"a\"}","{\"rate\": 5, \"time\": \"2023-04-05T07:16:50.336Z\", \"review\": \"a\"}"}', 'f');
INSERT INTO "public"."filmrate" VALUES ('00005', 'uEyz9MqaM', 6, '2023-04-11 03:20:46.734', '', 0, 0, NULL, 'f');
INSERT INTO "public"."filmrate" VALUES ('00002', 'uEyz9MqaM', 7, '2023-04-11 06:42:30.047', '', 1, 4, '{"{\"rate\": 8, \"time\": \"2023-03-29T14:05:15.874Z\", \"review\": \"poor\"}","{\"rate\": 9, \"time\": \"2023-04-10T08:05:53.773Z\", \"review\": \"weerfwerweqrwer\"}"}', 'f');
INSERT INTO "public"."filmrate" VALUES ('00009', 'uEyz9MqaM', 6, '2023-04-11 10:38:39.985', '', 0, 2, '{"{\"rate\": 6, \"time\": \"2023-04-11T10:12:55.223Z\", \"review\": \"FSDFSDFSDFSDF\"}","{\"rate\": 8, \"time\": \"2023-04-11T10:38:22.88Z\"}"}', 'f');
INSERT INTO "public"."filmrate" VALUES ('00008', 'uEyz9MqaM', 7, '2023-04-11 10:54:57.624', '', 0, 0, '{"{\"rate\": 8, \"time\": \"2023-04-11T10:05:08.529Z\"}"}', 'f');
INSERT INTO "public"."filmrate" VALUES ('00007', 'uEyz9MqaM', 2, '2023-04-13 09:54:08.479', 'sfsdfsdfsdf', 0, 0, '{"{\"rate\": 9, \"time\": \"2023-04-13T09:45:53.356Z\", \"review\": \"werwerwer\"}","{\"rate\": 8, \"time\": \"2023-04-13T09:46:00.966Z\", \"review\": \"wwerwerwer\"}","{\"rate\": 9, \"time\": \"2023-04-13T09:46:15.493Z\"}","{\"rate\": 7, \"time\": \"2023-04-13T09:53:56.028Z\", \"review\": \"sdfdsfsdfsdf\"}"}', 'f');
INSERT INTO "public"."filmrate" VALUES ('00003', 'uEyz9MqaM', 7, '2023-04-14 04:32:20.335', '', 0, 1, '{"{\"rate\": 8, \"time\": \"2023-04-11T07:47:51.767Z\"}","{\"rate\": 9, \"time\": \"2023-04-14T03:05:20.12Z\"}"}', 'f');

-- ----------------------------
-- Table structure for filmratecomment
-- ----------------------------
DROP TABLE IF EXISTS "public"."filmratecomment";
CREATE TABLE "public"."filmratecomment" (
  "commentid" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "id" varchar(255) COLLATE "pg_catalog"."default",
  "author" varchar(255) COLLATE "pg_catalog"."default",
  "userid" varchar(255) COLLATE "pg_catalog"."default",
  "comment" text COLLATE "pg_catalog"."default",
  "time" timestamp(6),
  "updatedat" timestamp(6),
  "histories" jsonb[],
  "anonymous" bool
)
;

-- ----------------------------
-- Records of filmratecomment
-- ----------------------------
INSERT INTO "public"."filmratecomment" VALUES ('schiZMrme', '00002', 'uEyz9MqaM', 'pu65Tr6FE', 'g', '2023-04-03 10:05:33.564', NULL, NULL, 'f');
INSERT INTO "public"."filmratecomment" VALUES ('qo-y1datx', '00001', 'uEyz9MqaM', 'uEyz9MqaM', 'yo', '2023-04-05 14:17:08.326', '2023-04-05 14:28:14.229', '{"{\"time\": \"2023-04-05T07:17:08.326Z\", \"comment\": \"yo\"}","{\"time\": \"2023-04-05T07:17:08.326Z\", \"comment\": \"yoo\"}"}', 'f');
INSERT INTO "public"."filmratecomment" VALUES ('cuJA0_nJo', '00001', 'pu65Tr6FE', 'pu65Tr6FE', 'Filling the Resignation letter form. Signature of your Project manager and yours are requested. Please return all of TMA’s equipment and get signature of IT/Security Department at Item I And get signature of your Project Manager at item III and at the end of this document (Checklist of Resignation)', '2023-04-07 11:47:53.237', '2023-04-07 15:47:46.036', '{"{\"time\": \"2023-04-07T04:47:53.237Z\", \"comment\": \"yolo\"}"}', 'f');
INSERT INTO "public"."filmratecomment" VALUES ('YtF8ej8-i', '00001', 'uEyz9MqaM', 'pu65Tr6FE', ' sdddsssssssssssssssssssssssssssssssdddsssssssssssssssssssssssssssssssdddsssssssssssssssssssssssssssssssdddsssssssssssssssssssssssssssssssdddsssssssssssssssssssssssssssssssdddsssssssssssssssssssssssssssssssdddsssssssssssssssssssssssssssssssdddsssssssssssssssssssssssssssssssdddsssssssssssssssssssssssssssssssdddssssssssssssssssssssssssssssss', '2023-04-10 09:24:18.776', NULL, NULL, 'f');
INSERT INTO "public"."filmratecomment" VALUES ('f18f4852-ebc1-4c81-b40b-5c1bcb8b8a01', '00002', 'uEyz9MqaM', 'uEyz9MqaM', 'sdfsdfsdfsdf', '2023-04-10 15:10:42.614114', NULL, NULL, 'f');
INSERT INTO "public"."filmratecomment" VALUES ('1f6584fb-4c2e-4a19-b6da-95f89a31e681', '00002', 'uEyz9MqaM', 'uEyz9MqaM', 'dfsdfdsfdfwerfwerwerwerwr', '2023-04-10 15:10:58.228069', NULL, NULL, 'f');
INSERT INTO "public"."filmratecomment" VALUES ('46480b0a-ff0d-40f9-9d39-9319ed99f026', '00002', 'uEyz9MqaM', 'uEyz9MqaM', 'zdxfsdfsdfdsfsdfsd', '2023-04-11 13:42:25.698017', NULL, NULL, 'f');
INSERT INTO "public"."filmratecomment" VALUES ('ee48c027-04a4-4f54-aa4a-66655169bd8f', '00003', 'uEyz9MqaM', 'uEyz9MqaM', 'sdfsdfsdfsdf', '2023-04-11 14:47:55.360108', NULL, NULL, 'f');
INSERT INTO "public"."filmratecomment" VALUES ('0c3810d4-5ecc-4378-a11a-e654f2bccef5', '00009', 'uEyz9MqaM', 'uEyz9MqaM', 'sdfsdfsdf', '2023-04-11 17:12:58.459766', '2023-04-11 17:38:32.419845', '{"{\"time\": \"2023-04-11T17:12:58.459766Z\", \"comment\": \"SDFDSFSDF\"}","{\"time\": \"2023-04-11T17:13:04.376956Z\", \"comment\": \"SDFDSFSDFSDFSFWERW\"}"}', 'f');
INSERT INTO "public"."filmratecomment" VALUES ('dfecc310-39db-4b2c-98d5-255ea443fb94', '00009', 'uEyz9MqaM', 'uEyz9MqaM', 'sdfsdfsdf', '2023-04-11 17:38:36.932702', NULL, NULL, 'f');
INSERT INTO "public"."filmratecomment" VALUES ('6fa024a3-e515-4a34-809f-0b953ebae8a1', '05', '77c35c38c3554ea6906730dbcfeca0f2', 'uEyz9MqaM', 'sdfsdfsdf', '2023-04-12 16:01:40.587904', NULL, NULL, 'f');

-- ----------------------------
-- Table structure for filmrateinfo
-- ----------------------------
DROP TABLE IF EXISTS "public"."filmrateinfo";
CREATE TABLE "public"."filmrateinfo" (
  "id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "rate" numeric DEFAULT 0,
  "rate1" int4 DEFAULT 0,
  "rate2" int4 DEFAULT 0,
  "rate3" int4 DEFAULT 0,
  "rate4" int4 DEFAULT 0,
  "rate5" int4 DEFAULT 0,
  "rate6" int4 DEFAULT 0,
  "rate7" int4 DEFAULT 0,
  "rate8" int4 DEFAULT 0,
  "rate9" int4 DEFAULT 0,
  "rate10" int4 DEFAULT 0,
  "count" int4,
  "score" numeric
)
;

-- ----------------------------
-- Records of filmrateinfo
-- ----------------------------
INSERT INTO "public"."filmrateinfo" VALUES ('00001', 6.5000000000000000, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 2, 13);
INSERT INTO "public"."filmrateinfo" VALUES ('00005', 6, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 6);
INSERT INTO "public"."filmrateinfo" VALUES ('00002', 7.0000000000000000, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 7);
INSERT INTO "public"."filmrateinfo" VALUES ('00009', 6.0000000000000000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 6);
INSERT INTO "public"."filmrateinfo" VALUES ('00008', 7.0000000000000000, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 7);
INSERT INTO "public"."filmrateinfo" VALUES ('00007', 2.0000000000000000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2);
INSERT INTO "public"."filmrateinfo" VALUES ('00003', 7.0000000000000000, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 7);

-- ----------------------------
-- Table structure for filmratereaction
-- ----------------------------
DROP TABLE IF EXISTS "public"."filmratereaction";
CREATE TABLE "public"."filmratereaction" (
  "id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "author" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "userid" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "time" timestamp(6),
  "reaction" int2
)
;

-- ----------------------------
-- Records of filmratereaction
-- ----------------------------
INSERT INTO "public"."filmratereaction" VALUES ('00002', 'uEyz9MqaM', 'uEyz9MqaM', '2023-04-10 15:05:49.311476', 1);
INSERT INTO "public"."filmratereaction" VALUES ('05', '77c35c38c3554ea6906730dbcfeca0f2', 'uEyz9MqaM', '2023-04-12 16:01:37.115268', 1);

-- ----------------------------
-- Table structure for filmreplycomment
-- ----------------------------
DROP TABLE IF EXISTS "public"."filmreplycomment";
CREATE TABLE "public"."filmreplycomment" (
  "commentid" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "commentthreadid" varchar(40) COLLATE "pg_catalog"."default",
  "id" varchar(40) COLLATE "pg_catalog"."default",
  "author" varchar(255) COLLATE "pg_catalog"."default",
  "userid" varchar(255) COLLATE "pg_catalog"."default",
  "comment" text COLLATE "pg_catalog"."default",
  "time" timestamptz(6),
  "updatedat" timestamptz(6),
  "histories" jsonb[]
)
;

-- ----------------------------
-- Records of filmreplycomment
-- ----------------------------
INSERT INTO "public"."filmreplycomment" VALUES ('XFFVX-ZjP', 'c0cWhmwdG', '00001', 'pu65Tr6FE', 'pu65Tr6FE', 'oh hell', '2023-04-07 07:03:24.287+00', NULL, '{"{\"time\": \"2023-04-07T07:03:24.287Z\", \"comment\": \"oh hello\"}"}');
INSERT INTO "public"."filmreplycomment" VALUES ('IBFPnVXtp', 'zfVUyEgHR', '00002', 'uEyz9MqaM', 'uEyz9MqaM', 'asdasdasdasd', '2023-04-11 06:47:15.752498+00', NULL, '{}');
INSERT INTO "public"."filmreplycomment" VALUES ('pPuPc_Xap', '7_Pblhrzn', '00002', 'uEyz9MqaM', 'uEyz9MqaM', 'adfasdfasdfsdfdsf', '2023-04-11 06:47:22.21068+00', NULL, '{}');
INSERT INTO "public"."filmreplycomment" VALUES ('RlAJZVXaM', '7_Pblhrzn', '00002', 'uEyz9MqaM', 'uEyz9MqaM', 'erwerwerwer', '2023-04-11 07:12:32.830429+00', NULL, '{}');
INSERT INTO "public"."filmreplycomment" VALUES ('oIslEVvtM', 'zfVUyEgHR', '00002', 'uEyz9MqaM', 'uEyz9MqaM', 'werwrwer', '2023-04-11 07:43:00.866558+00', NULL, '{}');
INSERT INTO "public"."filmreplycomment" VALUES ('KcvlxVvtM', '7_Pblhrzn', '00002', 'uEyz9MqaM', 'uEyz9MqaM', 'werwerewrwer', '2023-04-11 07:43:05.527673+00', NULL, '{}');
INSERT INTO "public"."filmreplycomment" VALUES ('5VXvx_vap', '7_Pblhrzn', '00002', 'uEyz9MqaM', 'uEyz9MqaM', 'asdvsdfdsfsdf', '2023-04-11 07:45:17.139915+00', NULL, '{}');
INSERT INTO "public"."filmreplycomment" VALUES ('V-5klVvtM', 'G3iwl_vap', '00003', 'uEyz9MqaM', 'uEyz9MqaM', 'sdfsdfsdfsdf', '2023-04-11 09:18:04.037535+00', NULL, '{}');
INSERT INTO "public"."filmreplycomment" VALUES ('rcYKE1XtM', '4kL4o6eeO', '00001', 'uEyz9MqaM', 'uEyz9MqaM', 'ergertertert', '2023-04-12 02:24:00.81044+00', NULL, '{}');
INSERT INTO "public"."filmreplycomment" VALUES ('HjJdEQvtM', 'Y7EcAhUMf', '00001', 'uEyz9MqaM', 'uEyz9MqaM', 'werwerwer', '2023-04-12 02:24:22.116001+00', NULL, '{}');
INSERT INTO "public"."filmreplycomment" VALUES ('i5oexQXaM', 'Y7EcAhUMf', '00001', 'uEyz9MqaM', 'uEyz9MqaM', 'werwerwer', '2023-04-12 02:24:29.773916+00', NULL, '{}');
INSERT INTO "public"."filmreplycomment" VALUES ('qY3wNpdtM', 'G3iwl_vap', '00003', 'uEyz9MqaM', 'uEyz9MqaM', 'asdasdasdasd', '2023-04-14 03:05:26.933514+00', NULL, '{}');

-- ----------------------------
-- Table structure for filmreplycommentinfo
-- ----------------------------
DROP TABLE IF EXISTS "public"."filmreplycommentinfo";
CREATE TABLE "public"."filmreplycommentinfo" (
  "commentid" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "replycount" int4 DEFAULT 0,
  "usefulcount" int4 DEFAULT 0
)
;

-- ----------------------------
-- Records of filmreplycommentinfo
-- ----------------------------
INSERT INTO "public"."filmreplycommentinfo" VALUES ('wv5cx_a-e', 0, 0);
INSERT INTO "public"."filmreplycommentinfo" VALUES ('XFFVX-ZjP', 0, 0);

-- ----------------------------
-- Table structure for filmreplycommentreaction
-- ----------------------------
DROP TABLE IF EXISTS "public"."filmreplycommentreaction";
CREATE TABLE "public"."filmreplycommentreaction" (
  "commentid" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "author" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "userid" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "time" timestamptz(6),
  "reaction" int2
)
;

-- ----------------------------
-- Records of filmreplycommentreaction
-- ----------------------------

-- ----------------------------
-- Table structure for history
-- ----------------------------
DROP TABLE IF EXISTS "public"."history";
CREATE TABLE "public"."history" (
  "id" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "history" varchar[] COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of history
-- ----------------------------
INSERT INTO "public"."history" VALUES ('mPOdF3rap', '{$2a$10$RYOJbtG1crorHlvkRpjcO.Cf21BWnEQXisdGtqKt2NDj0bRovv0/C,$2a$10$44Gh5T5QctnkK/XaGrKLeenuaLgUS40vxyPWahdbBWjsINEyisFFi,$2a$10$pW/zKZCs0qkNOmTiFDj8x.KOUrZkO8DsI0.eTRbhNd.qF3PtqLMtm,$2a$10$eHNlUsZMFMpHxefurOOLmuoChl65N0AkhrjKJh7yxEU0jCElhbxwi,$2a$10$x60m11QjQHYheZn3raWLg.2EPlaJsmljnT4GVlfNN8Wj0lTEPCHBa}');

-- ----------------------------
-- Table structure for integrationconfiguration
-- ----------------------------
DROP TABLE IF EXISTS "public"."integrationconfiguration";
CREATE TABLE "public"."integrationconfiguration" (
  "id" varchar COLLATE "pg_catalog"."default",
  "link" varchar COLLATE "pg_catalog"."default",
  "cliendid" varchar COLLATE "pg_catalog"."default",
  "scope" varchar COLLATE "pg_catalog"."default",
  "redirecturi" varchar COLLATE "pg_catalog"."default",
  "accesstokenlink" varchar COLLATE "pg_catalog"."default",
  "clientsecret" varchar COLLATE "pg_catalog"."default",
  "status" varchar COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of integrationconfiguration
-- ----------------------------

-- ----------------------------
-- Table structure for interests
-- ----------------------------
DROP TABLE IF EXISTS "public"."interests";
CREATE TABLE "public"."interests" (
  "interest" varchar(120) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of interests
-- ----------------------------
INSERT INTO "public"."interests" VALUES ('game');
INSERT INTO "public"."interests" VALUES ('movie');
INSERT INTO "public"."interests" VALUES ('coding');
INSERT INTO "public"."interests" VALUES ('football');
INSERT INTO "public"."interests" VALUES ('basketball');
INSERT INTO "public"."interests" VALUES ('books');
INSERT INTO "public"."interests" VALUES ('money');
INSERT INTO "public"."interests" VALUES ('manga');
INSERT INTO "public"."interests" VALUES ('badminton');
INSERT INTO "public"."interests" VALUES ('esport');
INSERT INTO "public"."interests" VALUES ('food');
INSERT INTO "public"."interests" VALUES ('sdfsdfsdf');

-- ----------------------------
-- Table structure for item
-- ----------------------------
DROP TABLE IF EXISTS "public"."item";
CREATE TABLE "public"."item" (
  "id" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "title" varchar(120) COLLATE "pg_catalog"."default",
  "author" varchar(140) COLLATE "pg_catalog"."default",
  "status" varchar(1) COLLATE "pg_catalog"."default",
  "description" varchar(1500) COLLATE "pg_catalog"."default",
  "price" numeric,
  "imageurl" varchar(300) COLLATE "pg_catalog"."default",
  "brand" varchar(120) COLLATE "pg_catalog"."default",
  "publishedat" timestamp(6),
  "expiredat" timestamp(6),
  "category" varchar[] COLLATE "pg_catalog"."default",
  "gallery" jsonb[]
)
;

-- ----------------------------
-- Records of item
-- ----------------------------
INSERT INTO "public"."item" VALUES ('01', 'Movie tickets', NULL, 'A', 'Thor movie ticket', 100000, 'https://i.etsystatic.com/31051854/r/il/951542/3882447990/il_570xN.3882447990_8so4.jpg', 'Disney', '2022-07-19 00:00:00', '2022-08-25 00:00:00', '{comedy,action}', '{"{\"url\": \"https://i.etsystatic.com/31051854/r/il/951542/3882447990/il_570xN.3882447990_8so4.jpg\", \"type\": \"image\", \"source\": \"\"}"}');
INSERT INTO "public"."item" VALUES ('02', 'Iphone 13', NULL, 'A', 'Iphone 13 from Apple', 20000000, 'https://lebaostore.com/wp-content/uploads/2022/02/iphone-13-pro-family-hero.png', 'Apple', '2022-07-19 00:00:00', '2025-07-19 00:00:00', '{mobiphone,technological,apple}', '{"{\"url\": \"https://lebaostore.com/wp-content/uploads/2022/02/iphone-13-pro-family-hero.png\", \"type\": \"image\", \"source\": \"\"}"}');
INSERT INTO "public"."item" VALUES ('03', 'Camera', NULL, 'A', 'Camera from Samsung', 100000000, 'https://acmartbd.com/wp-content/uploads/2015/03/Samsung-wb1100f.jpg', 'Samsung', '2022-07-19 00:00:00', '2025-07-19 00:00:00', '{camera,technological}', '{"{\"url\": \"https://acmartbd.com/wp-content/uploads/2015/03/Samsung-wb1100f.jpg\", \"type\": \"image\", \"source\": \"\"}"}');
INSERT INTO "public"."item" VALUES ('04', 'Movie tickets', NULL, 'A', 'Minion mooive ticket', 100000, 'https://i.pinimg.com/originals/2d/ac/e7/2dace73219e9f26ffb39b3bfbb98c41b.jpg', 'Disney', '2022-07-19 00:00:00', '2022-08-25 00:00:00', '{comedy,action}', '{"{\"url\": \"https://i.pinimg.com/originals/2d/ac/e7/2dace73219e9f26ffb39b3bfbb98c41b.jpg\", \"type\": \"image\", \"source\": \"\"}"}');
INSERT INTO "public"."item" VALUES ('05', 'Macbook', NULL, 'A', 'Macbook from Apple', 25000000, 'https://www.maccenter.vn/App_images/MacBookPro-14-SpaceGray.jpg', 'Apple', '2022-07-19 00:00:00', '2025-07-19 00:00:00', '{laptop,technological,apple}', '{"{\"url\": \"https://www.maccenter.vn/App_images/MacBookPro-14-SpaceGray.jpg\", \"type\": \"image\", \"source\": \"\"}"}');
INSERT INTO "public"."item" VALUES ('12341231', '33123123', 'uEyz9MqaM', 'A', 'asdfdasdasdasd', 12312312312, 'https://i.ebayimg.com/images/g/JoEAAOSweLdioxQy/s-l500.jpg', '23424', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for itemcategory
-- ----------------------------
DROP TABLE IF EXISTS "public"."itemcategory";
CREATE TABLE "public"."itemcategory" (
  "categoryid" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "categoryname" varchar(300) COLLATE "pg_catalog"."default" NOT NULL,
  "status" char(1) COLLATE "pg_catalog"."default" NOT NULL,
  "createdby" varchar(40) COLLATE "pg_catalog"."default",
  "createdat" timestamp(6),
  "updatedby" varchar(40) COLLATE "pg_catalog"."default",
  "updatedat" timestamp(6)
)
;

-- ----------------------------
-- Records of itemcategory
-- ----------------------------

-- ----------------------------
-- Table structure for itemcomment
-- ----------------------------
DROP TABLE IF EXISTS "public"."itemcomment";
CREATE TABLE "public"."itemcomment" (
  "id" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "author" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "userid" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "comment" text COLLATE "pg_catalog"."default",
  "time" timestamp(6),
  "updatedat" timestamp(6),
  "histories" jsonb[]
)
;

-- ----------------------------
-- Records of itemcomment
-- ----------------------------
INSERT INTO "public"."itemcomment" VALUES ('01', '02', '77c35c38c3554ea6906730dbcfeca0f2', 'Good', '2022-07-22 00:00:00', NULL, NULL);
INSERT INTO "public"."itemcomment" VALUES ('02', '06', '77c35c38c3554ea6906730dbcfeca0f2', 'Not Bad', '2022-07-22 00:00:00', NULL, NULL);
INSERT INTO "public"."itemcomment" VALUES ('03', '05', '77c35c38c3554ea6906730dbcfeca0f2', 'abc', '2022-07-22 00:00:00', NULL, NULL);
INSERT INTO "public"."itemcomment" VALUES ('04', '07', '77c35c38c3554ea6906730dbcfeca0f2', 'Bad', '2022-07-22 00:00:00', NULL, NULL);
INSERT INTO "public"."itemcomment" VALUES ('05', '11', '77c35c38c3554ea6906730dbcfeca0f2', '123', '2022-07-22 00:00:00', NULL, NULL);

-- ----------------------------
-- Table structure for iteminfo
-- ----------------------------
DROP TABLE IF EXISTS "public"."iteminfo";
CREATE TABLE "public"."iteminfo" (
  "id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "viewcount" int4 DEFAULT 0
)
;

-- ----------------------------
-- Records of iteminfo
-- ----------------------------

-- ----------------------------
-- Table structure for itemresponse
-- ----------------------------
DROP TABLE IF EXISTS "public"."itemresponse";
CREATE TABLE "public"."itemresponse" (
  "id" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "author" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "description" text COLLATE "pg_catalog"."default",
  "time" timestamp(6),
  "usefulcount" int4 DEFAULT 0,
  "replycount" int4 DEFAULT 0,
  "histories" jsonb[]
)
;

-- ----------------------------
-- Records of itemresponse
-- ----------------------------
INSERT INTO "public"."itemresponse" VALUES ('01', '77c35c38c3554ea6906730dbcfeca0f2', 'Good', '2022-07-22 00:00:00', 0, 0, NULL);
INSERT INTO "public"."itemresponse" VALUES ('02', '77c35c38c3554ea6906730dbcfeca0f2', 'Not Bad', '2022-07-22 00:00:00', 0, 0, NULL);
INSERT INTO "public"."itemresponse" VALUES ('03', '77c35c38c3554ea6906730dbcfeca0f2', 'Wow', '2022-07-22 00:00:00', 0, 0, NULL);
INSERT INTO "public"."itemresponse" VALUES ('04', '77c35c38c3554ea6906730dbcfeca0f2', 'Bad', '2022-07-22 00:00:00', 0, 0, NULL);
INSERT INTO "public"."itemresponse" VALUES ('05', '77c35c38c3554ea6906730dbcfeca0f2', 'I hate this', '2022-07-22 00:00:00', 0, 0, NULL);

-- ----------------------------
-- Table structure for itemresponsereaction
-- ----------------------------
DROP TABLE IF EXISTS "public"."itemresponsereaction";
CREATE TABLE "public"."itemresponsereaction" (
  "id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "author" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "userid" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "time" timestamp(6),
  "reaction" int2
)
;

-- ----------------------------
-- Records of itemresponsereaction
-- ----------------------------

-- ----------------------------
-- Table structure for job
-- ----------------------------
DROP TABLE IF EXISTS "public"."job";
CREATE TABLE "public"."job" (
  "id" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "title" varchar(300) COLLATE "pg_catalog"."default",
  "description" varchar(1000) COLLATE "pg_catalog"."default",
  "skill" jsonb[],
  "publishedat" timestamptz(6),
  "expiredat" timestamptz(6),
  "quantity" int8 DEFAULT 0,
  "applicantcount" int8 DEFAULT 0,
  "requirements" varchar(255) COLLATE "pg_catalog"."default",
  "benefit" varchar(255) COLLATE "pg_catalog"."default",
  "company_id" varchar(40) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of job
-- ----------------------------
INSERT INTO "public"."job" VALUES ('aaa', 'aaa', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 'odltd');

-- ----------------------------
-- Table structure for location
-- ----------------------------
DROP TABLE IF EXISTS "public"."location";
CREATE TABLE "public"."location" (
  "id" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(300) COLLATE "pg_catalog"."default" NOT NULL,
  "type" varchar(40) COLLATE "pg_catalog"."default",
  "description" varchar(1000) COLLATE "pg_catalog"."default",
  "status" char(1) COLLATE "pg_catalog"."default" NOT NULL,
  "geo" jsonb,
  "latitude" numeric(20,16),
  "longitude" numeric(20,16),
  "imageurl" varchar(1500) COLLATE "pg_catalog"."default",
  "customurl" varchar(1500) COLLATE "pg_catalog"."default",
  "createdby" varchar(1500) COLLATE "pg_catalog"."default",
  "createdat" timestamp(6),
  "updatedby" varchar(1500) COLLATE "pg_catalog"."default",
  "version" int4,
  "info" jsonb
)
;

-- ----------------------------
-- Records of location
-- ----------------------------
INSERT INTO "public"."location" VALUES ('5d1d7a66c5e4f320a86ca6b2', 'Highland Coffee', 'coffee', 'Highland Coffee', 'A', NULL, 10.7826048776525080, 106.7009147396518000, 'https://storage.googleapis.com/go-firestore-rest-api.appspot.com/image/5d1d7a66c5e4f320a86ca6b2_IFc9Db9DT_c.jpg', 'https://storage.googleapis.com/go-firestore-rest-api.appspot.com/cover/5d146cbffbdf2b1d30742262_TL4wqjvnz_4K-Art-Wallpapers.jpg', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."location" VALUES ('5d1d7a85c5e4f320a86ca6b3', 'Starbucks Coffee', 'coffee', 'Starbucks Coffee', 'A', NULL, 10.7826048776525080, 106.7009147396518000, 'https://ichef.bbci.co.uk/news/976/cpsprodpb/17185/production/_118879549_gettyimages-1308703596.jpg', 'https://storage.googleapis.com/go-firestore-rest-api.appspot.com/cover/5d146cbffbdf2b1d30742262_TL4wqjvnz_4K-Art-Wallpapers.jpg', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."location" VALUES ('5d1d7b79c5e4f320a86ca6b4', 'King Coffee', 'coffee', 'King Coffee', 'A', NULL, 10.7826048776525080, 106.7009147396518000, 'https://www.asia-bars.com/wp-content/uploads/2015/11/cong-caphe-1.jpg', 'https://storage.googleapis.com/go-firestore-rest-api.appspot.com/cover/5d146cbffbdf2b1d30742262_TL4wqjvnz_4K-Art-Wallpapers.jpg', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."location" VALUES ('5d1efb3796988a127077547c', 'Sumo BBQ Restaurant', 'restaurant', 'farthest', 'A', NULL, 10.7826048776525080, 106.7009147396518000, 'https://aeonmall-binhduongcanary.com.vn/wp-content/uploads/2018/12/IMG-2041-min-e1558279440850.jpg', 'https://storage.googleapis.com/go-firestore-rest-api.appspot.com/cover/5d146cbffbdf2b1d30742262_TL4wqjvnz_4K-Art-Wallpapers.jpg', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."location" VALUES ('5d562ad357568217d0d9a2d5', 'CGV', 'cinema', 'CGV cinema', 'A', NULL, 10.7826048776525080, 10.8548611610901300, 'https://rapchieuphim.com/photos/9/rap-cgv-su-van-hanh/rap-CGV-Su-van-hanh-8__2_.jpg', 'https://storage.googleapis.com/go-firestore-rest-api.appspot.com/cover/5d146cbffbdf2b1d30742262_TL4wqjvnz_4K-Art-Wallpapers.jpg', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."location" VALUES ('5d146cbffbdf2b1d30742262', 'Highland Coffee', 'coffee', 'Highland Coffee', 'A', NULL, 10.7826048776525080, 106.7009147396518000, 'https://i.ndh.vn/2022/07/29/1600834272dautuvietnamsuchunglaicuahighlandscoffeelabandapchotheluckhac-1659080446.jpg', 'https://i.ndh.vn/2022/07/29/1600834272dautuvietnamsuchunglaicuahighlandscoffeelabandapchotheluckhac-1659080446.jpg', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."location" VALUES ('5d1d7a18c5e4f320a86ca6b1', 'Trung Nguyen Coffee', 'coffee', 'Trung Nguyen Coffee', 'A', NULL, 10.7826048776525080, 106.7009147396518000, 'https://cdn2.shopify.com/s/files/1/0065/6759/1999/files/dia-chi-trung-nguyen-legend-cafe-tai-vincom-ha-nam_grande.jpg', 'https://storage.googleapis.com/go-firestore-rest-api.appspot.com/cover/5d146cbffbdf2b1d30742262_TL4wqjvnz_4K-Art-Wallpapers.jpg', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for locationcomment
-- ----------------------------
DROP TABLE IF EXISTS "public"."locationcomment";
CREATE TABLE "public"."locationcomment" (
  "commentid" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "id" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "author" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "userid" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "comment" text COLLATE "pg_catalog"."default",
  "time" timestamp(6),
  "updatedat" timestamp(6),
  "histories" jsonb[],
  "anonymous" bool
)
;

-- ----------------------------
-- Records of locationcomment
-- ----------------------------
INSERT INTO "public"."locationcomment" VALUES ('CPh9yOO8H', '5d146cbffbdf2b1d30742262', 'uEyz9MqaM', 'uEyz9MqaM', 'hi', '2023-03-23 15:44:25.356', NULL, NULL, 't');
INSERT INTO "public"."locationcomment" VALUES ('cQ6hNws3v', '5d146cbffbdf2b1d30742262', 'uEyz9MqaM', 'uEyz9MqaM', 'yolo', '2023-03-23 15:45:32.621', NULL, NULL, 'f');
INSERT INTO "public"."locationcomment" VALUES ('MAk1BOOPB', '5d146cbffbdf2b1d30742262', 'uEyz9MqaM', 'uEyz9MqaM', 'hi', '2023-03-23 16:51:46.922', NULL, NULL, 'f');
INSERT INTO "public"."locationcomment" VALUES ('EzRxHlOBC', '5d146cbffbdf2b1d30742262', 'uEyz9MqaM', 'uEyz9MqaM', 'oh yeah', '2023-03-23 16:57:01.95', NULL, NULL, 'f');
INSERT INTO "public"."locationcomment" VALUES ('EDepjfUZz', '5d146cbffbdf2b1d30742262', 'uEyz9MqaM', 'uEyz9MqaM', 'yolo', '2023-03-23 16:58:28.567', NULL, NULL, 't');
INSERT INTO "public"."locationcomment" VALUES ('29feI2KC9', '5d146cbffbdf2b1d30742262', 'uEyz9MqaM', 'uEyz9MqaM', 'yup', '2023-03-27 10:46:09.769', NULL, NULL, 'f');
INSERT INTO "public"."locationcomment" VALUES ('XhtnFuz_0', '5d146cbffbdf2b1d30742262', 'uEyz9MqaM', 'uEyz9MqaM', 'yolo', '2023-03-27 10:47:04.826', NULL, NULL, 'f');
INSERT INTO "public"."locationcomment" VALUES ('9ukzkr43b', '5d146cbffbdf2b1d30742262', 'uEyz9MqaM', 'uEyz9MqaM', 'hi', '2023-03-27 10:47:29.937', NULL, NULL, 'f');
INSERT INTO "public"."locationcomment" VALUES ('nmlfmxPl0', '5d146cbffbdf2b1d30742262', 'uEyz9MqaM', 'uEyz9MqaM', 'hi', '2023-03-27 10:47:29.937', NULL, NULL, 'f');
INSERT INTO "public"."locationcomment" VALUES ('VwP1pBM40', '5d146cbffbdf2b1d30742262', 'uEyz9MqaM', 'uEyz9MqaM', 'yo', '2023-03-27 10:52:48.336', NULL, NULL, 'f');
INSERT INTO "public"."locationcomment" VALUES ('e-nmtaraD', '5d146cbffbdf2b1d30742262', 'pu65Tr6FE', 'pu65Tr6FE', 'hi', '2023-03-30 13:40:15.87', NULL, NULL, 'f');
INSERT INTO "public"."locationcomment" VALUES ('JxoG2Ct8n', '5d1d7a66c5e4f320a86ca6b2', 'uEyz9MqaM', 'uEyz9MqaM', 'a', '2023-04-04 13:18:16.839', NULL, NULL, 'f');
INSERT INTO "public"."locationcomment" VALUES ('n_C2clD6g', '5d146cbffbdf2b1d30742262', 'pu65Tr6FE', 'uEyz9MqaM', 'yeah', '2023-04-04 13:20:19.586', NULL, NULL, 'f');
INSERT INTO "public"."locationcomment" VALUES ('piwKVqajD', '5d1d7a66c5e4f320a86ca6b2', 'uEyz9MqaM', 'uEyz9MqaM', 'b', '2023-04-04 14:03:22.18', NULL, NULL, 'f');
INSERT INTO "public"."locationcomment" VALUES ('d1mLikn2k', '5d1d7a66c5e4f320a86ca6b2', 'uEyz9MqaM', 'uEyz9MqaM', 'a', '2023-04-04 16:13:02.472', NULL, NULL, 'f');
INSERT INTO "public"."locationcomment" VALUES ('Q6bBIl8Zc', '5d1d7a66c5e4f320a86ca6b2', 'uEyz9MqaM', 'uEyz9MqaM', 'b', '2023-04-04 16:13:06.534', NULL, NULL, 'f');
INSERT INTO "public"."locationcomment" VALUES ('hI_v0wrjo', '5d146cbffbdf2b1d30742262', 'pu65Tr6FE', 'pu65Tr6FE', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged', '2023-04-06 10:28:46.38', NULL, NULL, 'f');
INSERT INTO "public"."locationcomment" VALUES ('g1Of56Z9C', '5d146cbffbdf2b1d30742262', 'pu65Tr6FE', 'pu65Tr6FE', 'hi', '2023-04-06 10:45:18.101', NULL, NULL, 't');
INSERT INTO "public"."locationcomment" VALUES ('ELH_IQyqf', '5d1d7a66c5e4f320a86ca6b2', 'uEyz9MqaM', 'pu65Tr6FE', 'e', '2023-04-06 11:00:48.4', NULL, NULL, 'f');
INSERT INTO "public"."locationcomment" VALUES ('TorLzPvd-', '5d1d7a66c5e4f320a86ca6b2', 'uEyz9MqaM', 'pu65Tr6FE', 'huhu', '2023-04-04 16:13:29.731', '2023-04-06 13:22:53.811', '{"{\"time\": \"2023-04-04T09:13:29.731Z\", \"comment\": \"d\"}"}', 'f');
INSERT INTO "public"."locationcomment" VALUES ('3BCGcCgC8', '5d1d7a66c5e4f320a86ca6b2', 'pu65Tr6FE', 'pu65Tr6FE', 'b', '2023-04-06 13:40:42.394', NULL, NULL, 'f');
INSERT INTO "public"."locationcomment" VALUES ('0041bfbc-e353-4e6b-a360-c2f260689eaf', '5d562ad357568217d0d9a2d5', 'uEyz9MqaM', 'uEyz9MqaM', 'sdafsdfsdf', '2023-04-11 16:51:24.531934', NULL, NULL, 'f');
INSERT INTO "public"."locationcomment" VALUES ('1aade4e7-4ecf-4f54-a166-6057bc940cd5', '5d1d7a66c5e4f320a86ca6b2', 'pu65Tr6FE', 'uEyz9MqaM', 'sdfsdfsdfsdf', '2023-04-14 09:45:39.89984', NULL, NULL, 'f');
INSERT INTO "public"."locationcomment" VALUES ('017abd4d-4c9e-4ae0-99c3-5c23ac1f5b88', '5d1d7a66c5e4f320a86ca6b2', 'uEyz9MqaM', 'uEyz9MqaM', 'sdfsdfsdfsdfffwefwefddddd', '2023-04-11 15:20:09.613034', '2023-04-14 10:10:24.762064', '{"{\"time\": \"2023-04-11T15:20:09.613034Z\", \"comment\": \"sdfsdfsdfsdf\"}","{\"time\": \"2023-04-14T09:49:13.22642Z\", \"comment\": \"sdfsdfsdfsdfffwefwef\"}"}', 'f');
INSERT INTO "public"."locationcomment" VALUES ('fdde5c55-6491-466f-aee1-debb21e8462a', '5d1d7a66c5e4f320a86ca6b2', 'pu65Tr6FE', 'uEyz9MqaM', 'haha', '2023-04-14 10:27:51.213602', NULL, NULL, 'f');
INSERT INTO "public"."locationcomment" VALUES ('bf8fbed8-0ee5-4e61-a85f-c6e992bf959a', '5d1d7a66c5e4f320a86ca6b2', 'pu65Tr6FE', 'uEyz9MqaM', 'hih', '2023-04-14 10:28:22.732127', NULL, NULL, 'f');
INSERT INTO "public"."locationcomment" VALUES ('c2c11184-edef-46e2-98c6-2b96c0da6d86', '5d1d7a66c5e4f320a86ca6b2', 'pu65Tr6FE', 'uEyz9MqaM', 'sdfsdfsdf', '2023-04-14 10:35:44.478994', NULL, NULL, 'f');
INSERT INTO "public"."locationcomment" VALUES ('f575a52d-c129-498d-bb24-d707b2922041', '5d1d7a66c5e4f320a86ca6b2', 'pu65Tr6FE', 'uEyz9MqaM', 'dfgdfgdfgddddd', '2023-04-14 10:12:44.608672', '2023-04-14 10:49:19.858435', '{"{\"time\": \"2023-04-14T10:12:44.608672Z\", \"comment\": \"dfgdfgdfg\"}"}', 'f');
INSERT INTO "public"."locationcomment" VALUES ('cb331254-018c-4820-a69d-5faaa0838e8c', '5d1d7a66c5e4f320a86ca6b2', 'pu65Tr6FE', 'uEyz9MqaM', 'sdfsdfsdf', '2023-04-14 10:49:25.586667', NULL, NULL, 'f');
INSERT INTO "public"."locationcomment" VALUES ('6c805894-7748-46eb-bb06-a14f3234916e', '5d1d7a66c5e4f320a86ca6b2', 'uEyz9MqaM', 'uEyz9MqaM', 'sdfsdfsdfsdf', '2023-04-14 11:08:33.980123', NULL, NULL, 'f');
INSERT INTO "public"."locationcomment" VALUES ('b3885d14-7a1d-40ce-b422-5356ebfb79c2', '5d1d7a66c5e4f320a86ca6b2', 'pu65Tr6FE', 'uEyz9MqaM', 'sdfsdfsdf', '2023-04-14 11:23:38.937907', NULL, NULL, 't');

-- ----------------------------
-- Table structure for locationcommentthread
-- ----------------------------
DROP TABLE IF EXISTS "public"."locationcommentthread";
CREATE TABLE "public"."locationcommentthread" (
  "commentid" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "id" varchar(40) COLLATE "pg_catalog"."default",
  "author" varchar(255) COLLATE "pg_catalog"."default",
  "comment" text COLLATE "pg_catalog"."default",
  "time" timestamptz(6),
  "updatedat" timestamptz(6),
  "histories" jsonb[],
  "anonymous" bool,
  "userid" varchar(40) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of locationcommentthread
-- ----------------------------
INSERT INTO "public"."locationcommentthread" VALUES ('4QkTPXfLt', '5d146cbffbdf2b1d30742262', 'pu65Tr6FE', 'hi', '2023-04-03 07:57:04.638+00', NULL, '{}', NULL, 'pu65Tr6FE');
INSERT INTO "public"."locationcommentthread" VALUES ('SMmXVksrQ', '5d146cbffbdf2b1d30742262', 'pu65Tr6FE', 'a', '2023-04-04 02:28:36.938+00', NULL, '{}', NULL, 'pu65Tr6FE');
INSERT INTO "public"."locationcommentthread" VALUES ('xGsBHvAhI', '5d146cbffbdf2b1d30742262', 'pu65Tr6FE', 'b', '2023-04-04 02:28:40.291+00', NULL, '{}', NULL, 'pu65Tr6FE');
INSERT INTO "public"."locationcommentthread" VALUES ('ks-txtHW5', '5d146cbffbdf2b1d30742262', 'pu65Tr6FE', 'c', '2023-04-04 02:28:41.934+00', NULL, '{}', NULL, 'pu65Tr6FE');
INSERT INTO "public"."locationcommentthread" VALUES ('gQsRtAsY8', '5d146cbffbdf2b1d30742262', 'pu65Tr6FE', 'd', '2023-04-04 02:28:43.621+00', NULL, '{}', NULL, 'pu65Tr6FE');
INSERT INTO "public"."locationcommentthread" VALUES ('hGMdUFDp4', '5d1d7a66c5e4f320a86ca6b2', 'uEyz9MqaM', 'hi', '2023-04-04 07:07:24.928+00', NULL, '{}', NULL, 'uEyz9MqaM');
INSERT INTO "public"."locationcommentthread" VALUES ('9zrpqYJzM', '5d1d7a66c5e4f320a86ca6b2', 'uEyz9MqaM', 'hi hello', '2023-04-04 07:29:36.445+00', NULL, '{}', NULL, 'uEyz9MqaM');
INSERT INTO "public"."locationcommentthread" VALUES ('ywurd_OaC', '5d1d7a66c5e4f320a86ca6b2', 'pu65Tr6FE', 'abcxyz', '2023-04-04 06:24:41.486+00', '2023-04-06 06:25:06.683+00', '{"{\"time\": \"2023-04-04T06:24:41.486Z\", \"comment\": \"abc\"}"}', NULL, 'pu65Tr6FE');
INSERT INTO "public"."locationcommentthread" VALUES ('WvbZM_GYu', '5d1d7a66c5e4f320a86ca6b2', 'pu65Tr6FE', 'a', '2023-04-06 06:45:37.87+00', NULL, '{}', NULL, 'pu65Tr6FE');
INSERT INTO "public"."locationcommentthread" VALUES ('u7rf0YUD4', '5d1d7a66c5e4f320a86ca6b2', 'pu65Tr6FE', 'b', '2023-04-06 06:46:03.804+00', NULL, '{}', NULL, 'pu65Tr6FE');
INSERT INTO "public"."locationcommentthread" VALUES ('M369VOqsD', '5d1d7a66c5e4f320a86ca6b2', 'pu65Tr6FE', 'test', '2023-04-06 06:47:50.358+00', NULL, NULL, NULL, 'pu65Tr6FE');
INSERT INTO "public"."locationcommentthread" VALUES ('jQ-d1LjB2', '5d1d7a66c5e4f320a86ca6b2', 'pu65Tr6FE', 'a', '2023-04-06 08:15:46.102+00', NULL, NULL, NULL, 'pu65Tr6FE');
INSERT INTO "public"."locationcommentthread" VALUES ('fQ8ZGjZV0', '5d1d7a66c5e4f320a86ca6b2', 'pu65Tr6FE', 'a', '2023-04-06 08:16:00.971+00', NULL, NULL, NULL, 'pu65Tr6FE');
INSERT INTO "public"."locationcommentthread" VALUES ('FBFtrF7a3', '5d1d7a66c5e4f320a86ca6b2', 'pu65Tr6FE', 'b', '2023-04-06 08:16:03.984+00', NULL, NULL, NULL, 'pu65Tr6FE');
INSERT INTO "public"."locationcommentthread" VALUES ('2wA097XQl', '5d1d7a66c5e4f320a86ca6b2', 'pu65Tr6FE', 'aa', '2023-04-06 08:16:06.02+00', NULL, NULL, NULL, 'pu65Tr6FE');
INSERT INTO "public"."locationcommentthread" VALUES ('8R2era603', '5d1d7a66c5e4f320a86ca6b2', 'pu65Tr6FE', 'dd', '2023-04-06 08:16:10.003+00', NULL, NULL, NULL, 'pu65Tr6FE');
INSERT INTO "public"."locationcommentthread" VALUES ('lCM2iMFwk', '5d1d7a66c5e4f320a86ca6b2', 'pu65Tr6FE', 'qw', '2023-04-06 08:16:12.484+00', NULL, NULL, NULL, 'pu65Tr6FE');
INSERT INTO "public"."locationcommentthread" VALUES ('-22Rke27r', '5d1d7a66c5e4f320a86ca6b2', 'uEyz9MqaM', 'asd', '2023-04-10 04:15:18.406+00', NULL, NULL, NULL, 'uEyz9MqaM');
INSERT INTO "public"."locationcommentthread" VALUES ('wzBnAmMZ5', '5d1d7a66c5e4f320a86ca6b2', 'uEyz9MqaM', 'qwe', '2023-04-10 04:15:20.215+00', NULL, NULL, NULL, 'uEyz9MqaM');
INSERT INTO "public"."locationcommentthread" VALUES ('NM8JHf5w6', '5d1d7a66c5e4f320a86ca6b2', 'uEyz9MqaM', 'rty', '2023-04-10 04:15:22.159+00', NULL, NULL, NULL, 'uEyz9MqaM');
INSERT INTO "public"."locationcommentthread" VALUES ('UoPwSaRJU', '5d1d7a66c5e4f320a86ca6b2', 'uEyz9MqaM', 'uio', '2023-04-10 04:15:23.957+00', NULL, NULL, NULL, 'uEyz9MqaM');
INSERT INTO "public"."locationcommentthread" VALUES ('VtZUjfyPh', '5d1d7a66c5e4f320a86ca6b2', 'uEyz9MqaM', 'm,.', '2023-04-10 04:15:26.991+00', NULL, NULL, NULL, 'uEyz9MqaM');
INSERT INTO "public"."locationcommentthread" VALUES ('xVJy8Uj9g', '5d1d7a66c5e4f320a86ca6b2', 'uEyz9MqaM', 'zxc', '2023-04-10 04:15:28.807+00', NULL, NULL, NULL, 'uEyz9MqaM');
INSERT INTO "public"."locationcommentthread" VALUES ('YOBTuks1e', '5d1d7a66c5e4f320a86ca6b2', 'uEyz9MqaM', 'asd', '2023-04-10 04:15:30.44+00', NULL, NULL, NULL, 'uEyz9MqaM');
INSERT INTO "public"."locationcommentthread" VALUES ('JihXTDUrN', '5d1d7a66c5e4f320a86ca6b2', 'uEyz9MqaM', 'kyu', '2023-04-10 04:15:32.723+00', NULL, NULL, NULL, 'uEyz9MqaM');
INSERT INTO "public"."locationcommentthread" VALUES ('5d5HPMuiE', '5d1d7a66c5e4f320a86ca6b2', 'uEyz9MqaM', 'dcsc', '2023-04-10 04:15:36.013+00', NULL, NULL, NULL, 'uEyz9MqaM');
INSERT INTO "public"."locationcommentthread" VALUES ('ofh1b_XtM', '5d1d7a66c5e4f320a86ca6b2', 'uEyz9MqaM', 'rewertwertwert', '2023-04-11 08:58:53.984243+00', NULL, '{}', NULL, 'uEyz9MqaM');
INSERT INTO "public"."locationcommentthread" VALUES ('1FLT2_vaM', '5d1d7a66c5e4f320a86ca6b2', 'uEyz9MqaM', 'sdfsdfsdf', '2023-04-11 09:02:25.244983+00', NULL, '{}', NULL, 'uEyz9MqaM');
INSERT INTO "public"."locationcommentthread" VALUES ('SOX_2Vvap', '5d1d7a66c5e4f320a86ca6b2', 'uEyz9MqaM', 'sdfsdfsdfdsf', '2023-04-11 09:15:23.498054+00', NULL, '{}', NULL, 'uEyz9MqaM');
INSERT INTO "public"."locationcommentthread" VALUES ('WnRklVXap', '5d146cbffbdf2b1d30742262', 'uEyz9MqaM', 'wefewfsdfsdf', '2023-04-11 09:18:15.341029+00', NULL, '{}', NULL, 'uEyz9MqaM');
INSERT INTO "public"."locationcommentthread" VALUES ('BXt05_vtp', '5d146cbffbdf2b1d30742262', 'uEyz9MqaM', 'sdfsdfsdfs', '2023-04-11 09:20:03.232628+00', NULL, '{}', NULL, 'uEyz9MqaM');
INSERT INTO "public"."locationcommentthread" VALUES ('gBhf8VXtM', '5d146cbffbdf2b1d30742262', 'uEyz9MqaM', 'sdfsdfsdfsdf', '2023-04-11 09:21:17.323509+00', NULL, '{}', NULL, 'uEyz9MqaM');
INSERT INTO "public"."locationcommentthread" VALUES ('zApS8VXap', '5d146cbffbdf2b1d30742262', 'uEyz9MqaM', 'wefewrewrwer', '2023-04-11 09:23:47.559808+00', NULL, '{}', NULL, 'uEyz9MqaM');
INSERT INTO "public"."locationcommentthread" VALUES ('e6rZ8VvtM', '5d146cbffbdf2b1d30742262', 'uEyz9MqaM', 'werwerwerwerwer', '2023-04-11 09:23:54.871585+00', NULL, '{}', NULL, 'uEyz9MqaM');
INSERT INTO "public"."locationcommentthread" VALUES ('szmS5_vap', '5d146cbffbdf2b1d30742262', 'uEyz9MqaM', 'asdasdasd', '2023-04-11 09:24:16.752819+00', NULL, '{}', NULL, 'uEyz9MqaM');
INSERT INTO "public"."locationcommentthread" VALUES ('CY6_5_vtp', '5d146cbffbdf2b1d30742262', 'uEyz9MqaM', 'sdfsdfsdfs', '2023-04-11 09:32:57.88792+00', NULL, '{}', NULL, 'uEyz9MqaM');
INSERT INTO "public"."locationcommentthread" VALUES ('tlvw8_Xtp', '5d146cbffbdf2b1d30742262', 'uEyz9MqaM', 'sdfsdfsdf', '2023-04-11 09:33:24.902968+00', NULL, '{}', NULL, 'uEyz9MqaM');
INSERT INTO "public"."locationcommentthread" VALUES ('_BbtNpdtM', '5d1d7a85c5e4f320a86ca6b3', 'uEyz9MqaM', 'dsfsdfsdf', '2023-04-14 02:54:00.730517+00', NULL, '{}', NULL, 'uEyz9MqaM');

-- ----------------------------
-- Table structure for locationcommentthreadinfo
-- ----------------------------
DROP TABLE IF EXISTS "public"."locationcommentthreadinfo";
CREATE TABLE "public"."locationcommentthreadinfo" (
  "commentid" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "replycount" int4 DEFAULT 0,
  "usefulcount" int4 DEFAULT 0
)
;

-- ----------------------------
-- Records of locationcommentthreadinfo
-- ----------------------------
INSERT INTO "public"."locationcommentthreadinfo" VALUES ('5d1d7a66c5e4f320a86ca6b2', 0, 1);
INSERT INTO "public"."locationcommentthreadinfo" VALUES ('ywurd_OaC', 3, 1);
INSERT INTO "public"."locationcommentthreadinfo" VALUES ('4QkTPXfLt', 2, 1);
INSERT INTO "public"."locationcommentthreadinfo" VALUES ('hGMdUFDp4', 1, 0);
INSERT INTO "public"."locationcommentthreadinfo" VALUES ('ofh1b_XtM', 0, 1);
INSERT INTO "public"."locationcommentthreadinfo" VALUES ('WnRklVXap', 2, 0);
INSERT INTO "public"."locationcommentthreadinfo" VALUES ('BXt05_vtp', 2, 0);
INSERT INTO "public"."locationcommentthreadinfo" VALUES ('gBhf8VXtM', 4, 0);
INSERT INTO "public"."locationcommentthreadinfo" VALUES ('CY6_5_vtp', 2, 1);
INSERT INTO "public"."locationcommentthreadinfo" VALUES ('e6rZ8VvtM', 1, 0);
INSERT INTO "public"."locationcommentthreadinfo" VALUES ('ks-txtHW5', 1, 0);
INSERT INTO "public"."locationcommentthreadinfo" VALUES ('zApS8VXap', 1, 0);
INSERT INTO "public"."locationcommentthreadinfo" VALUES ('gQsRtAsY8', 0, 1);
INSERT INTO "public"."locationcommentthreadinfo" VALUES ('tlvw8_Xtp', 2, 1);
INSERT INTO "public"."locationcommentthreadinfo" VALUES ('9zrpqYJzM', 2, 1);
INSERT INTO "public"."locationcommentthreadinfo" VALUES ('8R2era603', 2, 0);
INSERT INTO "public"."locationcommentthreadinfo" VALUES ('SOX_2Vvap', 1, 0);
INSERT INTO "public"."locationcommentthreadinfo" VALUES ('_BbtNpdtM', 6, 0);
INSERT INTO "public"."locationcommentthreadinfo" VALUES ('2wA097XQl', 1, 0);
INSERT INTO "public"."locationcommentthreadinfo" VALUES ('fQ8ZGjZV0', 1, 0);

-- ----------------------------
-- Table structure for locationcommentthreadreaction
-- ----------------------------
DROP TABLE IF EXISTS "public"."locationcommentthreadreaction";
CREATE TABLE "public"."locationcommentthreadreaction" (
  "commentid" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "author" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "userid" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "time" timestamptz(6),
  "reaction" int2
)
;

-- ----------------------------
-- Records of locationcommentthreadreaction
-- ----------------------------
INSERT INTO "public"."locationcommentthreadreaction" VALUES ('4QkTPXfLt', 'pu65Tr6FE', 'pu65Tr6FE', '2023-04-03 07:57:05.913+00', 1);
INSERT INTO "public"."locationcommentthreadreaction" VALUES ('ywurd_OaC', 'pu65Tr6FE', 'uEyz9MqaM', '2023-04-04 07:32:04.636+00', 1);
INSERT INTO "public"."locationcommentthreadreaction" VALUES ('5d1d7a66c5e4f320a86ca6b2', 'uEyz9MqaM', 'uEyz9MqaM', '2023-04-04 07:35:43.616+00', 1);
INSERT INTO "public"."locationcommentthreadreaction" VALUES ('9zrpqYJzM', 'uEyz9MqaM', 'uEyz9MqaM', '2023-04-04 07:40:24.465+00', 1);
INSERT INTO "public"."locationcommentthreadreaction" VALUES ('ofh1b_XtM', 'uEyz9MqaM', 'uEyz9MqaM', '2023-04-11 09:02:22.008695+00', 1);
INSERT INTO "public"."locationcommentthreadreaction" VALUES ('CY6_5_vtp', 'uEyz9MqaM', 'uEyz9MqaM', '2023-04-11 09:33:14.239677+00', 1);
INSERT INTO "public"."locationcommentthreadreaction" VALUES ('gQsRtAsY8', 'pu65Tr6FE', 'uEyz9MqaM', '2023-04-11 09:36:20.663061+00', 1);
INSERT INTO "public"."locationcommentthreadreaction" VALUES ('tlvw8_Xtp', 'uEyz9MqaM', 'uEyz9MqaM', '2023-04-11 09:36:21.718119+00', 1);

-- ----------------------------
-- Table structure for locationfollower
-- ----------------------------
DROP TABLE IF EXISTS "public"."locationfollower";
CREATE TABLE "public"."locationfollower" (
  "id" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "follower" varchar(40) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of locationfollower
-- ----------------------------
INSERT INTO "public"."locationfollower" VALUES ('uEyz9MqaM', '5d1d7a66c5e4f320a86ca6b2');
INSERT INTO "public"."locationfollower" VALUES ('uEyz9MqaM', '5d1d7a66c5e4f320a86ca6b2');
INSERT INTO "public"."locationfollower" VALUES ('uEyz9MqaM', '5d1d7a66c5e4f320a86ca6b2');
INSERT INTO "public"."locationfollower" VALUES ('uEyz9MqaM', '5d1d7a66c5e4f320a86ca6b2');
INSERT INTO "public"."locationfollower" VALUES ('uEyz9MqaM', '5d1d7a66c5e4f320a86ca6b2');

-- ----------------------------
-- Table structure for locationfollowing
-- ----------------------------
DROP TABLE IF EXISTS "public"."locationfollowing";
CREATE TABLE "public"."locationfollowing" (
  "id" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "following" varchar(40) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of locationfollowing
-- ----------------------------
INSERT INTO "public"."locationfollowing" VALUES ('5d1d7a66c5e4f320a86ca6b2', 'uEyz9MqaM');
INSERT INTO "public"."locationfollowing" VALUES ('5d1d7a66c5e4f320a86ca6b2', 'uEyz9MqaM');
INSERT INTO "public"."locationfollowing" VALUES ('5d1d7a66c5e4f320a86ca6b2', 'uEyz9MqaM');
INSERT INTO "public"."locationfollowing" VALUES ('5d1d7a66c5e4f320a86ca6b2', 'uEyz9MqaM');
INSERT INTO "public"."locationfollowing" VALUES ('5d1d7a66c5e4f320a86ca6b2', 'uEyz9MqaM');

-- ----------------------------
-- Table structure for locationinfo
-- ----------------------------
DROP TABLE IF EXISTS "public"."locationinfo";
CREATE TABLE "public"."locationinfo" (
  "id" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "rate" numeric DEFAULT 0,
  "rate1" int4 DEFAULT 0,
  "rate2" int4 DEFAULT 0,
  "rate3" int4 DEFAULT 0,
  "rate4" int4 DEFAULT 0,
  "rate5" int4 DEFAULT 0,
  "count" int4 DEFAULT 0,
  "score" numeric DEFAULT 0
)
;

-- ----------------------------
-- Records of locationinfo
-- ----------------------------
INSERT INTO "public"."locationinfo" VALUES ('5d1d7b79c5e4f320a86ca6b4', 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."locationinfo" VALUES ('5d1efb3796988a127077547c', 3.0000000000000000, 0, 0, 1, 0, 0, 1, 3);
INSERT INTO "public"."locationinfo" VALUES ('5d562ad357568217d0d9a2d5', 4.0000000000000000, 0, 0, 0, 1, 0, 1, 4);
INSERT INTO "public"."locationinfo" VALUES ('5d1d7a85c5e4f320a86ca6b3', 5.0000000000000000, 0, 0, 0, 0, 1, 1, 5);
INSERT INTO "public"."locationinfo" VALUES ('5d1d7a66c5e4f320a86ca6b2', 6.3333333333333333, 0, 0, -3, 2, 4, 3, 19);
INSERT INTO "public"."locationinfo" VALUES ('5d146cbffbdf2b1d30742262', 4.3333333333333333, 0, 0, 0, 2, 1, 3, 13);
INSERT INTO "public"."locationinfo" VALUES ('5d1d7a18c5e4f320a86ca6b1', 5.0000000000000000, 0, 0, 0, 0, 1, 1, 5);

-- ----------------------------
-- Table structure for locationinfomation
-- ----------------------------
DROP TABLE IF EXISTS "public"."locationinfomation";
CREATE TABLE "public"."locationinfomation" (
  "id" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "followercount" int8,
  "followingcount" int8
)
;

-- ----------------------------
-- Records of locationinfomation
-- ----------------------------

-- ----------------------------
-- Table structure for locationrate
-- ----------------------------
DROP TABLE IF EXISTS "public"."locationrate";
CREATE TABLE "public"."locationrate" (
  "id" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "author" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "rate" int4 NOT NULL,
  "time" timestamp(6),
  "review" text COLLATE "pg_catalog"."default",
  "usefulcount" int4 DEFAULT 0,
  "replycount" int4 DEFAULT 0,
  "anonymous" bool,
  "histories" jsonb[]
)
;

-- ----------------------------
-- Records of locationrate
-- ----------------------------
INSERT INTO "public"."locationrate" VALUES ('5d1efb3796988a127077547c', 'uEyz9MqaM', 3, '2023-03-30 10:50:30.575', '3', 0, 0, 't', '{"{\"rate\": 1, \"time\": \"2021-09-30T17:00:00.000Z\", \"review\": \"Poor\"}"}');
INSERT INTO "public"."locationrate" VALUES ('5d1d7b79c5e4f320a86ca6b4', 'uEyz9MqaM', 5, '2021-10-01 00:00:00', 'Excellent', 0, 0, 'f', NULL);
INSERT INTO "public"."locationrate" VALUES ('5d146cbffbdf2b1d30742262', 'pu65Tr6FE', 4, '2023-03-30 13:40:02.577', 'oh yes', 1, 4, 'f', NULL);
INSERT INTO "public"."locationrate" VALUES ('5d562ad357568217d0d9a2d5', 'uEyz9MqaM', 4, '2023-04-12 03:42:16.94', '', 0, 1, 'f', '{"{\"rate\": 4, \"time\": \"2021-09-30T17:00:00Z\", \"review\": \"Good\"}","{\"rate\": 3, \"time\": \"2023-03-30T04:46:35.188Z\", \"review\": \"yeah\"}","{\"rate\": 5, \"time\": \"2023-03-30T11:46:50.824Z\", \"review\": \"yeah\"}"}');
INSERT INTO "public"."locationrate" VALUES ('5d1d7a85c5e4f320a86ca6b3', 'uEyz9MqaM', 5, '2023-04-14 03:04:54.76', 'sadasdasdasd', 0, 0, 'f', '{"{\"rate\": 4, \"time\": \"2023-03-23T16:59:16.65Z\", \"review\": \"good\"}"}');
INSERT INTO "public"."locationrate" VALUES ('5d1d7a66c5e4f320a86ca6b2', 'pu65Tr6FE', 5, '2023-04-04 17:30:34.002', 'a', 1, 8, 'f', '{"{\"rate\": 4, \"time\": \"2023-04-04T10:30:21.097Z\", \"review\": \"a\"}"}');
INSERT INTO "public"."locationrate" VALUES ('5d146cbffbdf2b1d30742262', 'uEyz9MqaM', 5, '2023-04-14 06:10:42.704', '', 1, 10, 'f', '{"{\"rate\": 3, \"time\": \"2023-03-22T04:54:15.009Z\", \"review\": \"yeah\"}","{\"rate\": 4, \"time\": \"2023-03-22T07:01:27.579Z\", \"review\": \"a\"}","{\"rate\": 5, \"time\": \"2023-03-22T07:01:37.107Z\", \"review\": \"b\"}","{\"rate\": 2, \"time\": \"2023-03-22T07:02:28.984Z\", \"review\": \"d\\n\"}","{\"rate\": 1, \"time\": \"2023-03-22T07:03:19.934Z\", \"review\": \"e\"}","{\"rate\": 3, \"time\": \"2023-03-22T07:03:27.269Z\", \"review\": \"d\"}","{\"rate\": 2, \"time\": \"2023-03-22T07:03:36.195Z\", \"review\": \"a\"}","{\"rate\": 4, \"time\": \"2023-03-22T07:04:38.91Z\", \"review\": \"good\"}","{\"rate\": 2, \"time\": \"2023-03-22T07:04:48.285Z\", \"review\": \"huhu\"}","{\"rate\": 4, \"time\": \"2023-03-22T07:12:00.461Z\", \"review\": \"oh yeah\"}","{\"rate\": 2, \"time\": \"2023-03-22T17:08:24.089Z\", \"review\": \"oh no\"}","{\"rate\": 4, \"time\": \"2023-04-11T09:25:32.11Z\"}","{\"rate\": 3, \"time\": \"2023-04-11T09:25:39.604Z\"}"}');
INSERT INTO "public"."locationrate" VALUES ('5d1d7a18c5e4f320a86ca6b1', 'uEyz9MqaM', 5, '2023-04-14 06:13:41.425', '', 0, 0, 'f', '{"{\"rate\": 3, \"time\": \"2021-09-30T17:00:00Z\", \"review\": \"Poor\"}","{\"rate\": 5, \"time\": \"2023-03-22T09:00:16.64Z\", \"review\": \"good service\"}","{\"rate\": 3, \"time\": \"2023-03-22T16:04:19.423Z\", \"review\": \"poor\"}"}');
INSERT INTO "public"."locationrate" VALUES ('5d1d7a66c5e4f320a86ca6b2', 'uEyz9MqaM', 4, '2023-04-14 03:10:16.674', '', 0, 8, 'f', '{"{\"rate\": 2, \"time\": \"2023-04-04T04:20:42.232Z\", \"review\": \"rdtjdx\"}","{\"rate\": 3, \"time\": \"2023-04-04T04:20:55.012Z\", \"review\": \"jxj\"}","{\"rate\": 5, \"time\": \"2023-04-04T04:21:20.371Z\"}","{\"rate\": 3, \"time\": \"2023-04-04T04:24:14.567Z\", \"review\": \"a\"}","{\"rate\": 4, \"time\": \"2023-04-04T04:25:02.478Z\", \"review\": \"a\"}","{\"rate\": 3, \"time\": \"2023-04-04T04:35:02.366Z\", \"review\": \"3\"}","{\"rate\": 4, \"time\": \"2023-04-04T04:39:29.91Z\", \"review\": \"5\"}","{\"rate\": 5, \"time\": \"2023-04-04T04:40:09.837Z\", \"review\": \"a\"}","{\"rate\": 4, \"time\": \"2023-04-04T06:07:56.926Z\", \"review\": \"b\"}","{\"rate\": 2, \"time\": \"2023-04-04T10:30:55.661Z\", \"review\": \"b\"}","{\"rate\": 4, \"time\": \"2023-04-04T10:31:23.893Z\", \"review\": \"a\"}","{\"rate\": 3, \"time\": \"2023-04-04T10:33:49.294Z\", \"review\": \"a\"}","{\"rate\": 1, \"time\": \"2023-04-04T10:33:59.054Z\", \"review\": \"a\"}","{\"rate\": 2, \"time\": \"2023-04-04T10:34:05.559Z\", \"review\": \"b\"}","{\"rate\": 3, \"time\": \"2023-04-04T10:34:14.806Z\", \"review\": \"a\"}","{\"rate\": 4, \"time\": \"2023-04-04T10:34:19.095Z\", \"review\": \"a\"}","{\"rate\": 1, \"time\": \"2023-04-04T10:34:23.773Z\", \"review\": \"a\"}","{\"rate\": 4, \"time\": \"2023-04-04T10:37:32.091Z\", \"review\": \"a\"}","{\"rate\": 2, \"time\": \"2023-04-04T10:37:56.707Z\", \"review\": \"a\"}","{\"rate\": 3, \"time\": \"2023-04-04T10:38:46.557Z\", \"review\": \"a\"}","{\"rate\": 2, \"time\": \"2023-04-05T02:04:14.902Z\", \"review\": \"12\"}","{\"rate\": 3, \"time\": \"2023-04-05T02:05:41.085Z\", \"review\": \"a\"}","{\"rate\": 2, \"time\": \"2023-04-05T02:06:42.762Z\", \"review\": \"a\"}","{\"rate\": 3, \"time\": \"2023-04-05T02:08:58.079Z\", \"review\": \"a\"}","{\"rate\": 4, \"time\": \"2023-04-05T02:10:02.435Z\", \"review\": \"b\"}","{\"rate\": 3, \"time\": \"2023-04-05T02:15:40.423Z\", \"review\": \"a\"}","{\"rate\": 4, \"time\": \"2023-04-05T02:27:03.348Z\", \"review\": \"a\"}","{\"rate\": 2, \"time\": \"2023-04-05T02:27:36.434Z\", \"review\": \"a\"}","{\"rate\": 3, \"time\": \"2023-04-05T02:28:20.469Z\", \"review\": \"a\"}","{\"rate\": 4, \"time\": \"2023-04-05T02:30:07.777Z\", \"review\": \"a\"}","{\"rate\": 1, \"time\": \"2023-04-05T03:44:59.668Z\", \"review\": \"1\"}","{\"rate\": 4, \"time\": \"2023-04-05T03:48:50.537Z\", \"review\": \"a\"}","{\"rate\": 1, \"time\": \"2023-04-05T08:18:47.815Z\", \"review\": \"b\"}","{\"rate\": 5, \"time\": \"2023-04-05T15:49:28.241Z\", \"review\": \"a\"}","{\"rate\": 4, \"time\": \"2023-04-11T08:21:26.53Z\"}","{\"rate\": 5, \"time\": \"2023-04-11T08:27:29.03Z\"}","{\"rate\": 3, \"time\": \"2023-04-11T08:27:39.106Z\"}","{\"rate\": 5, \"time\": \"2023-04-13T06:30:01.89Z\", \"review\": \"sdfdsfsdfsdf\"}","{\"rate\": 2, \"time\": \"2023-04-13T06:30:09.537Z\"}","{\"rate\": 4, \"time\": \"2023-04-13T06:30:20.028Z\"}","{\"rate\": 5, \"time\": \"2023-04-13T07:10:45.373Z\"}","{\"rate\": 5, \"time\": \"2023-04-13T07:12:17.724Z\", \"review\": \"dfgfdgdfg\"}","{\"rate\": 5, \"time\": \"2023-04-13T07:16:13.962Z\", \"review\": \"abc\"}","{\"rate\": 5, \"time\": \"2023-04-13T07:16:47.112Z\", \"review\": \"asdasd\"}","{\"rate\": 5, \"time\": \"2023-04-13T00:17:13.524Z\", \"review\": \"dddd\"}","{\"rate\": 4, \"time\": \"2023-04-13T07:25:51.233Z\"}","{\"rate\": 5, \"time\": \"2023-04-13T14:27:14.648Z\"}","{\"rate\": 5, \"time\": \"2023-04-13T09:19:27.6Z\", \"review\": \"asdsadasdasd\"}","{\"rate\": 5, \"time\": \"2023-04-13T09:19:33.692Z\"}","{\"rate\": 4, \"time\": \"2023-04-13T09:19:36.539Z\"}","{\"rate\": 5, \"time\": \"2023-04-13T09:19:47.175Z\"}"}');

-- ----------------------------
-- Table structure for locationratereaction
-- ----------------------------
DROP TABLE IF EXISTS "public"."locationratereaction";
CREATE TABLE "public"."locationratereaction" (
  "id" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "author" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "userid" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "time" timestamp(6),
  "reaction" int2
)
;

-- ----------------------------
-- Records of locationratereaction
-- ----------------------------
INSERT INTO "public"."locationratereaction" VALUES ('5d146cbffbdf2b1d30742262', 'uEyz9MqaM', 'uEyz9MqaM', '2023-04-03 17:06:54.931', 1);
INSERT INTO "public"."locationratereaction" VALUES ('5d146cbffbdf2b1d30742262', 'pu65Tr6FE', 'uEyz9MqaM', '2023-04-04 09:06:30.261', 1);
INSERT INTO "public"."locationratereaction" VALUES ('5d1d7a66c5e4f320a86ca6b2', 'pu65Tr6FE', 'uEyz9MqaM', '2023-04-13 16:44:05.570859', 1);

-- ----------------------------
-- Table structure for locationreplycomment
-- ----------------------------
DROP TABLE IF EXISTS "public"."locationreplycomment";
CREATE TABLE "public"."locationreplycomment" (
  "commentid" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "commentthreadid" varchar(40) COLLATE "pg_catalog"."default",
  "id" varchar(40) COLLATE "pg_catalog"."default",
  "author" varchar(255) COLLATE "pg_catalog"."default",
  "userid" varchar(255) COLLATE "pg_catalog"."default",
  "comment" text COLLATE "pg_catalog"."default",
  "time" timestamptz(6),
  "updatedat" timestamptz(6),
  "histories" jsonb[]
)
;

-- ----------------------------
-- Records of locationreplycomment
-- ----------------------------
INSERT INTO "public"."locationreplycomment" VALUES ('3speDSv5z', 'OYBh0OCY3', '5d146cbffbdf2b1d30742262', 'pu65Tr6FE', 'pu65Tr6FE', 'sdfsdfsdfsf', '2023-04-03 07:48:47.09+00', '2023-04-14 02:48:48.904074+00', '{"{\"time\": \"2023-04-14T09:48:48.9040738+07:00\", \"comment\": \"sdfsdfsdfs\"}"}');
INSERT INTO "public"."locationreplycomment" VALUES ('1-zYOlk9l', 'ywurd_OaC', '5d1d7a66c5e4f320a86ca6b2', 'pu65Tr6FE', 'pu65Tr6FE', 'sdfsdfsdfsf', '2023-04-04 06:45:39.418+00', '2023-04-14 02:48:48.904074+00', '{"{\"time\": \"2023-04-14T09:48:48.9040738+07:00\", \"comment\": \"sdfsdfsdfs\"}"}');
INSERT INTO "public"."locationreplycomment" VALUES ('2dt1uofzQ', 'ywurd_OaC', '5d1d7a66c5e4f320a86ca6b2', 'pu65Tr6FE', 'pu65Tr6FE', 'sdfsdfsdfsf', '2023-04-05 03:10:43.794+00', '2023-04-14 02:48:48.904074+00', '{"{\"time\": \"2023-04-14T09:48:48.9040738+07:00\", \"comment\": \"sdfsdfsdfs\"}"}');
INSERT INTO "public"."locationreplycomment" VALUES ('Md5KdWC4U', '4QkTPXfLt', '5d146cbffbdf2b1d30742262', 'uEyz9MqaM', 'uEyz9MqaM', 'sdfsdfsdfsf', '2023-04-05 06:26:33.703+00', '2023-04-14 02:48:48.904074+00', '{"{\"time\": \"2023-04-14T09:48:48.9040738+07:00\", \"comment\": \"sdfsdfsdfs\"}"}');
INSERT INTO "public"."locationreplycomment" VALUES ('-7qfkLaCR', '4QkTPXfLt', '5d146cbffbdf2b1d30742262', 'pu65Tr6FE', 'pu65Tr6FE', 'sdfsdfsdfsf', '2023-04-06 03:57:21.195+00', '2023-04-14 02:48:48.904074+00', '{"{\"time\": \"2023-04-14T09:48:48.9040738+07:00\", \"comment\": \"sdfsdfsdfs\"}"}');
INSERT INTO "public"."locationreplycomment" VALUES ('TYJOHlrmG', 'ywurd_OaC', '5d1d7a66c5e4f320a86ca6b2', 'pu65Tr6FE', 'pu65Tr6FE', 'sdfsdfsdfsf', '2023-04-04 06:24:49.131+00', '2023-04-14 02:48:48.904074+00', '{"{\"time\": \"2023-04-14T09:48:48.9040738+07:00\", \"comment\": \"sdfsdfsdfs\"}"}');
INSERT INTO "public"."locationreplycomment" VALUES ('HQ6Elywul', 'hGMdUFDp4', '5d1d7a66c5e4f320a86ca6b2', 'pu65Tr6FE', 'pu65Tr6FE', 'sdfsdfsdfsf', '2023-04-06 06:41:23.483+00', '2023-04-14 02:48:48.904074+00', '{"{\"time\": \"2023-04-14T09:48:48.9040738+07:00\", \"comment\": \"sdfsdfsdfs\"}"}');
INSERT INTO "public"."locationreplycomment" VALUES ('Ns1T8_vtp', 'WnRklVXap', '5d146cbffbdf2b1d30742262', 'uEyz9MqaM', 'uEyz9MqaM', 'sdfsdfsdfsf', '2023-04-11 09:19:52.865295+00', '2023-04-14 02:48:48.904074+00', '{"{\"time\": \"2023-04-14T09:48:48.9040738+07:00\", \"comment\": \"sdfsdfsdfs\"}"}');
INSERT INTO "public"."locationreplycomment" VALUES ('O2kH5Vvtp', 'WnRklVXap', '5d146cbffbdf2b1d30742262', 'uEyz9MqaM', 'uEyz9MqaM', 'sdfsdfsdfsf', '2023-04-11 09:19:55.952636+00', '2023-04-14 02:48:48.904074+00', '{"{\"time\": \"2023-04-14T09:48:48.9040738+07:00\", \"comment\": \"sdfsdfsdfs\"}"}');
INSERT INTO "public"."locationreplycomment" VALUES ('kiZ08_vap', 'BXt05_vtp', '5d146cbffbdf2b1d30742262', 'uEyz9MqaM', 'uEyz9MqaM', 'sdfsdfsdfsf', '2023-04-11 09:20:07.104661+00', '2023-04-14 02:48:48.904074+00', '{"{\"time\": \"2023-04-14T09:48:48.9040738+07:00\", \"comment\": \"sdfsdfsdfs\"}"}');
INSERT INTO "public"."locationreplycomment" VALUES ('qEWj8_vaM', 'BXt05_vtp', '5d146cbffbdf2b1d30742262', 'uEyz9MqaM', 'uEyz9MqaM', 'sdfsdfsdfsf', '2023-04-11 09:20:10.13438+00', '2023-04-14 02:48:48.904074+00', '{"{\"time\": \"2023-04-14T09:48:48.9040738+07:00\", \"comment\": \"sdfsdfsdfs\"}"}');
INSERT INTO "public"."locationreplycomment" VALUES ('a65f5_Xtp', 'gBhf8VXtM', '5d146cbffbdf2b1d30742262', 'uEyz9MqaM', 'uEyz9MqaM', 'sdfsdfsdfsf', '2023-04-11 09:21:21.255138+00', '2023-04-14 02:48:48.904074+00', '{"{\"time\": \"2023-04-14T09:48:48.9040738+07:00\", \"comment\": \"sdfsdfsdfs\"}"}');
INSERT INTO "public"."locationreplycomment" VALUES ('KE098_XtM', 'gBhf8VXtM', '5d146cbffbdf2b1d30742262', 'uEyz9MqaM', 'uEyz9MqaM', 'sdfsdfsdfsf', '2023-04-11 09:22:43.735389+00', '2023-04-14 02:48:48.904074+00', '{"{\"time\": \"2023-04-14T09:48:48.9040738+07:00\", \"comment\": \"sdfsdfsdfs\"}"}');
INSERT INTO "public"."locationreplycomment" VALUES ('_hr95_Xtp', 'gBhf8VXtM', '5d146cbffbdf2b1d30742262', 'uEyz9MqaM', 'uEyz9MqaM', 'sdfsdfsdfsf', '2023-04-11 09:22:48.95519+00', '2023-04-14 02:48:48.904074+00', '{"{\"time\": \"2023-04-14T09:48:48.9040738+07:00\", \"comment\": \"sdfsdfsdfs\"}"}');
INSERT INTO "public"."locationreplycomment" VALUES ('7lH57Mdtp', '_BbtNpdtM', '5d1d7a85c5e4f320a86ca6b3', 'uEyz9MqaM', 'uEyz9MqaM', 'dsfdsfds', '2023-04-14 03:00:23.775135+00', NULL, '{}');
INSERT INTO "public"."locationreplycomment" VALUES ('mRB77MdtM', '_BbtNpdtM', '5d1d7a85c5e4f320a86ca6b3', 'uEyz9MqaM', 'uEyz9MqaM', 'sdfsdfsdf', '2023-04-14 03:00:56.685514+00', NULL, '{}');
INSERT INTO "public"."locationreplycomment" VALUES ('k7XI7pKap', '_BbtNpdtM', '5d1d7a85c5e4f320a86ca6b3', 'uEyz9MqaM', 'uEyz9MqaM', 'sdfsdfsdfsdf', '2023-04-14 03:03:56.288306+00', NULL, '{}');
INSERT INTO "public"."locationreplycomment" VALUES ('wkIINpdap', '_BbtNpdtM', '5d1d7a85c5e4f320a86ca6b3', 'uEyz9MqaM', 'uEyz9MqaM', 'sdfdsfsdfsdfsdfsd', '2023-04-14 03:03:59.740145+00', NULL, '{}');
INSERT INTO "public"."locationreplycomment" VALUES ('5VwUNMdap', '_BbtNpdtM', '5d1d7a85c5e4f320a86ca6b3', 'uEyz9MqaM', 'uEyz9MqaM', 'sdfsdfdsfsdf', '2023-04-14 03:04:02.643253+00', NULL, '{}');
INSERT INTO "public"."locationreplycomment" VALUES ('TRxQ7pKtp', '_BbtNpdtM', '5d1d7a85c5e4f320a86ca6b3', 'uEyz9MqaM', 'uEyz9MqaM', 'fsdfsdfsdf', '2023-04-14 03:05:58.435884+00', NULL, '{}');
INSERT INTO "public"."locationreplycomment" VALUES ('BMTSUMdtp', '2wA097XQl', '5d1d7a66c5e4f320a86ca6b2', 'uEyz9MqaM', 'uEyz9MqaM', 'sdfdsfsdf', '2023-04-14 04:23:20.353995+00', NULL, '{}');
INSERT INTO "public"."locationreplycomment" VALUES ('2Lxr8VXtM', 'gBhf8VXtM', '5d146cbffbdf2b1d30742262', 'uEyz9MqaM', 'uEyz9MqaM', 'sdfsdfsdfsf', '2023-04-11 09:22:53.491566+00', '2023-04-14 02:48:48.904074+00', '{"{\"time\": \"2023-04-14T09:48:48.9040738+07:00\", \"comment\": \"sdfsdfsdfs\"}"}');
INSERT INTO "public"."locationreplycomment" VALUES ('c9C_5_XaM', 'CY6_5_vtp', '5d146cbffbdf2b1d30742262', 'uEyz9MqaM', 'uEyz9MqaM', 'sdfsdfsdfsf', '2023-04-11 09:33:02.091209+00', '2023-04-14 02:48:48.904074+00', '{"{\"time\": \"2023-04-14T09:48:48.9040738+07:00\", \"comment\": \"sdfsdfsdfs\"}"}');
INSERT INTO "public"."locationreplycomment" VALUES ('kYzw8Vvtp', 'CY6_5_vtp', '5d146cbffbdf2b1d30742262', 'uEyz9MqaM', 'uEyz9MqaM', 'sdfsdfsdfsf', '2023-04-11 09:33:10.177042+00', '2023-04-14 02:48:48.904074+00', '{"{\"time\": \"2023-04-14T09:48:48.9040738+07:00\", \"comment\": \"sdfsdfsdfs\"}"}');
INSERT INTO "public"."locationreplycomment" VALUES ('YEYB7_Xap', 'e6rZ8VvtM', '5d146cbffbdf2b1d30742262', 'uEyz9MqaM', 'uEyz9MqaM', 'sdfsdfsdfsf', '2023-04-11 09:35:51.172825+00', '2023-04-14 02:48:48.904074+00', '{"{\"time\": \"2023-04-14T09:48:48.9040738+07:00\", \"comment\": \"sdfsdfsdfs\"}"}');
INSERT INTO "public"."locationreplycomment" VALUES ('jKnB7_vtM', 'ks-txtHW5', '5d146cbffbdf2b1d30742262', 'uEyz9MqaM', 'uEyz9MqaM', 'sdfsdfsdfsf', '2023-04-11 09:35:56.61249+00', '2023-04-14 02:48:48.904074+00', '{"{\"time\": \"2023-04-14T09:48:48.9040738+07:00\", \"comment\": \"sdfsdfsdfs\"}"}');
INSERT INTO "public"."locationreplycomment" VALUES ('lO5o7_vtp', 'zApS8VXap', '5d146cbffbdf2b1d30742262', 'uEyz9MqaM', 'uEyz9MqaM', 'sdfsdfsdfsf', '2023-04-11 09:36:05.618335+00', '2023-04-14 02:48:48.904074+00', '{"{\"time\": \"2023-04-14T09:48:48.9040738+07:00\", \"comment\": \"sdfsdfsdfs\"}"}');
INSERT INTO "public"."locationreplycomment" VALUES ('LgtMNVXap', 'tlvw8_Xtp', '5d146cbffbdf2b1d30742262', 'uEyz9MqaM', 'uEyz9MqaM', 'sdfsdfsdfsf', '2023-04-11 09:36:25.982504+00', '2023-04-14 02:48:48.904074+00', '{"{\"time\": \"2023-04-14T09:48:48.9040738+07:00\", \"comment\": \"sdfsdfsdfs\"}"}');
INSERT INTO "public"."locationreplycomment" VALUES ('AENp7VvtM', 'tlvw8_Xtp', '5d146cbffbdf2b1d30742262', 'uEyz9MqaM', 'uEyz9MqaM', 'sdfsdfsdfsf', '2023-04-11 09:36:39.320096+00', '2023-04-14 02:48:48.904074+00', '{"{\"time\": \"2023-04-14T09:48:48.9040738+07:00\", \"comment\": \"sdfsdfsdfs\"}"}');
INSERT INTO "public"."locationreplycomment" VALUES ('Q_Ju8MKap', '9zrpqYJzM', '5d1d7a66c5e4f320a86ca6b2', 'uEyz9MqaM', 'uEyz9MqaM', 'sdfsdfsdfsf', '2023-04-14 02:44:20.958014+00', '2023-04-14 02:48:48.904074+00', '{"{\"time\": \"2023-04-14T09:48:48.9040738+07:00\", \"comment\": \"sdfsdfsdfs\"}"}');
INSERT INTO "public"."locationreplycomment" VALUES ('4FxK8MdtM', '9zrpqYJzM', '5d1d7a66c5e4f320a86ca6b2', 'uEyz9MqaM', 'uEyz9MqaM', 'sdfsdfsdfsf', '2023-04-14 02:45:12.774662+00', '2023-04-14 02:48:48.904074+00', '{"{\"time\": \"2023-04-14T09:48:48.9040738+07:00\", \"comment\": \"sdfsdfsdfs\"}"}');
INSERT INTO "public"."locationreplycomment" VALUES ('5bLw5MKaM', '8R2era603', '5d1d7a66c5e4f320a86ca6b2', 'uEyz9MqaM', 'uEyz9MqaM', 'sdfsdfsdfsf', '2023-04-14 02:48:14.100885+00', '2023-04-14 02:48:48.904074+00', '{"{\"time\": \"2023-04-14T09:48:48.9040738+07:00\", \"comment\": \"sdfsdfsdfs\"}"}');
INSERT INTO "public"."locationreplycomment" VALUES ('YwfQ5pKaM', '8R2era603', '5d1d7a66c5e4f320a86ca6b2', 'uEyz9MqaM', 'uEyz9MqaM', 'sdfsdfsdfsf', '2023-04-14 02:48:22.629175+00', '2023-04-14 02:48:48.904074+00', '{"{\"time\": \"2023-04-14T09:48:48.9040738+07:00\", \"comment\": \"sdfsdfsdfs\"}"}');
INSERT INTO "public"."locationreplycomment" VALUES ('M3A15MdtM', 'SOX_2Vvap', '5d1d7a66c5e4f320a86ca6b2', 'uEyz9MqaM', 'uEyz9MqaM', 'sdfsdfsdfsf', '2023-04-14 02:48:40.642594+00', '2023-04-14 02:48:48.904074+00', '{"{\"time\": \"2023-04-14T09:48:48.9040738+07:00\", \"comment\": \"sdfsdfsdfs\"}"}');
INSERT INTO "public"."locationreplycomment" VALUES ('eo-ZUMKtp', 'fQ8ZGjZV0', '5d1d7a66c5e4f320a86ca6b2', 'uEyz9MqaM', 'uEyz9MqaM', 'sdfsdfsdfsdf', '2023-04-14 04:23:25.464135+00', NULL, '{}');

-- ----------------------------
-- Table structure for locationreplycommentinfo
-- ----------------------------
DROP TABLE IF EXISTS "public"."locationreplycommentinfo";
CREATE TABLE "public"."locationreplycommentinfo" (
  "commentid" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "replycount" int4 DEFAULT 0,
  "usefulcount" int4 DEFAULT 0
)
;

-- ----------------------------
-- Records of locationreplycommentinfo
-- ----------------------------
INSERT INTO "public"."locationreplycommentinfo" VALUES ('Md5KdWC4U', 0, 0);
INSERT INTO "public"."locationreplycommentinfo" VALUES ('kYzw8Vvtp', 0, 1);
INSERT INTO "public"."locationreplycommentinfo" VALUES ('c9C_5_XaM', 0, 1);
INSERT INTO "public"."locationreplycommentinfo" VALUES ('YEYB7_Xap', 0, 1);
INSERT INTO "public"."locationreplycommentinfo" VALUES ('lO5o7_vtp', 0, 1);
INSERT INTO "public"."locationreplycommentinfo" VALUES ('jKnB7_vtM', 0, 0);
INSERT INTO "public"."locationreplycommentinfo" VALUES ('YwfQ5pKaM', 0, 1);
INSERT INTO "public"."locationreplycommentinfo" VALUES ('wkIINpdap', 0, 1);

-- ----------------------------
-- Table structure for locationreplycommentreaction
-- ----------------------------
DROP TABLE IF EXISTS "public"."locationreplycommentreaction";
CREATE TABLE "public"."locationreplycommentreaction" (
  "commentid" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "author" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "userid" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "time" timestamptz(6),
  "reaction" int2
)
;

-- ----------------------------
-- Records of locationreplycommentreaction
-- ----------------------------
INSERT INTO "public"."locationreplycommentreaction" VALUES ('kYzw8Vvtp', 'uEyz9MqaM', 'uEyz9MqaM', '2023-04-11 09:33:12.006045+00', 1);
INSERT INTO "public"."locationreplycommentreaction" VALUES ('c9C_5_XaM', 'uEyz9MqaM', 'uEyz9MqaM', '2023-04-11 09:33:13.303896+00', 1);
INSERT INTO "public"."locationreplycommentreaction" VALUES ('YEYB7_Xap', 'uEyz9MqaM', 'uEyz9MqaM', '2023-04-11 09:35:52.761873+00', 1);
INSERT INTO "public"."locationreplycommentreaction" VALUES ('lO5o7_vtp', 'uEyz9MqaM', 'uEyz9MqaM', '2023-04-11 09:36:07.223238+00', 1);
INSERT INTO "public"."locationreplycommentreaction" VALUES ('YwfQ5pKaM', 'uEyz9MqaM', 'uEyz9MqaM', '2023-04-14 02:48:24.265488+00', 1);
INSERT INTO "public"."locationreplycommentreaction" VALUES ('wkIINpdap', 'uEyz9MqaM', 'uEyz9MqaM', '2023-04-14 03:04:42.745828+00', 1);

-- ----------------------------
-- Table structure for music
-- ----------------------------
DROP TABLE IF EXISTS "public"."music";
CREATE TABLE "public"."music" (
  "id" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(300) COLLATE "pg_catalog"."default" NOT NULL,
  "author" varchar[] COLLATE "pg_catalog"."default",
  "releasedate" date,
  "duration" date,
  "lyric" text COLLATE "pg_catalog"."default",
  "imageurl" varchar(300) COLLATE "pg_catalog"."default",
  "mp3url" varchar(300) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of music
-- ----------------------------
INSERT INTO "public"."music" VALUES ('1', 'Gió', '{Jank}', NULL, NULL, '', 'https://photo-resize-zmp3.zmdcdn.me/w240_r1x1_webp/cover/5/3/6/d/536dc591405fc70b6f4932eeb18337e8.jpg', 'https://mp3-s1-zmp3.zmdcdn.me/f93972208a60633e3a71/418807123490058032?authen=exp=1681271241~acl=/f93972208a60633e3a71/*~hmac=ecf8aab8f221a3d6df3a073bf7c4634a&fs=MTY4MTA5ODQ0MTk4N3x3ZWJWNnwwfDExNy42LjQyLjE1NA');

-- ----------------------------
-- Table structure for passwordcodes
-- ----------------------------
DROP TABLE IF EXISTS "public"."passwordcodes";
CREATE TABLE "public"."passwordcodes" (
  "id" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "code" varchar(500) COLLATE "pg_catalog"."default" NOT NULL,
  "expiredat" timestamptz(6) NOT NULL
)
;

-- ----------------------------
-- Records of passwordcodes
-- ----------------------------

-- ----------------------------
-- Table structure for passwords
-- ----------------------------
DROP TABLE IF EXISTS "public"."passwords";
CREATE TABLE "public"."passwords" (
  "id" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "password" varchar(255) COLLATE "pg_catalog"."default",
  "successtime" timestamptz(6),
  "failtime" timestamptz(6),
  "failcount" int4,
  "lockeduntiltime" timestamptz(6),
  "history" varchar[] COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of passwords
-- ----------------------------
INSERT INTO "public"."passwords" VALUES ('pu65Tr6FE', '$2b$10$cuUU9pZcxnrvYbZLw8echezSHZ.l44or37RuG9O9K53prUf3cvjLO', '2023-04-10 02:59:29.351+00', NULL, 0, NULL, NULL);
INSERT INTO "public"."passwords" VALUES ('W4-SSYOad', '$2b$10$RpVp81sI5zI/nDjKf5VmyeSg./i0fCNZZRZjXSXM/PrIhggKiSl6m', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."passwords" VALUES ('EAt0afrot', '$2b$10$HFPVKWD7YUC7MWbICbESQep8X/q1GPi858lHc0oXZmDkEmDVl0Bbe', '2022-10-13 04:51:57.443+00', NULL, 0, NULL, NULL);
INSERT INTO "public"."passwords" VALUES ('hv5IMcgcQ', '$2b$10$misYaotOkglNej8V9vk4GuCbBokIdG6eQT8ag1X0GbeiSNX.BNO.a', '2022-10-13 06:57:51.42+00', NULL, 0, NULL, NULL);
INSERT INTO "public"."passwords" VALUES ('w7GE8z1oF', '$2b$10$u7wDMhETf5PDyLPL4VsJAeb4EKCsd30Pa0dXLu3Bf6pCdG7C48M16', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."passwords" VALUES ('gxLTXmdvq', '$2b$10$A0fFOOzSzZzA5vJ8hwUPfOEBK0uU0VvhAmK8ss4mcO6/TeVmxohpS', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."passwords" VALUES ('fmA8L1ic6', '$2b$10$koIL.Iysk.uW7Krig2ayvOUFoR0Fn1eNhJz6/FpqvZ4mCFVEqjfFG', '2022-10-20 07:28:40.132+00', NULL, 0, NULL, NULL);
INSERT INTO "public"."passwords" VALUES ('errAItrtM', '$2a$10$gbzoZNf5UGIBXu4P8DKaoekqw3ajduyccM14qQGJYW2hN2W7O.4Ya', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."passwords" VALUES ('h3-bIa9tp', '$2a$10$Gy06IjZ463EEGKclZ8t41.wmtLPpsm5BikJxq8D0GFzHtDhOqORtS', '2022-11-11 11:28:59.242767+00', NULL, 0, NULL, NULL);
INSERT INTO "public"."passwords" VALUES ('1c7TAkSsA', '$2b$10$OLrEW8KE4OS8xbccTS72uuqNh7GMhcrHyuZJx7q6tm0rAJk54I3oi', '2022-11-10 03:08:12.467+00', NULL, 0, NULL, NULL);
INSERT INTO "public"."passwords" VALUES ('mPOdF3rap', '$2a$10$RYOJbtG1crorHlvkRpjcO.Cf21BWnEQXisdGtqKt2NDj0bRovv0/C', NULL, NULL, 0, NULL, '{}');
INSERT INTO "public"."passwords" VALUES ('uEyz9MqaM', '$2a$10$NS/TlMoJsvb/fHJsThDCHOSQq0XC5uDMgrf769paxRGh8DL1/5Gb2', '2023-04-14 04:25:04.909802+00', NULL, 0, NULL, NULL);

-- ----------------------------
-- Table structure for playlist
-- ----------------------------
DROP TABLE IF EXISTS "public"."playlist";
CREATE TABLE "public"."playlist" (
  "id" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "title" varchar(255) COLLATE "pg_catalog"."default",
  "userid" varchar(255) COLLATE "pg_catalog"."default",
  "imageurl" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of playlist
-- ----------------------------
INSERT INTO "public"."playlist" VALUES ('7f6kqpqi7', 'Listen', 'pu65Tr6FE', NULL);

-- ----------------------------
-- Table structure for reservation
-- ----------------------------
DROP TABLE IF EXISTS "public"."reservation";
CREATE TABLE "public"."reservation" (
  "id" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "startdate" date,
  "enddate" date,
  "guestid" varchar(255) COLLATE "pg_catalog"."default",
  "totalprice" int4,
  "roomid" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of reservation
-- ----------------------------

-- ----------------------------
-- Table structure for room
-- ----------------------------
DROP TABLE IF EXISTS "public"."room";
CREATE TABLE "public"."room" (
  "id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "title" varchar(255) COLLATE "pg_catalog"."default",
  "description" varchar(1000) COLLATE "pg_catalog"."default",
  "price" int4,
  "offer" varchar[] COLLATE "pg_catalog"."default",
  "location" varchar(255) COLLATE "pg_catalog"."default",
  "host" varchar(255) COLLATE "pg_catalog"."default",
  "guest" int4,
  "bedrooms" int4,
  "bed" int4,
  "bathrooms" int4,
  "highlight" varchar[] COLLATE "pg_catalog"."default",
  "status" char(1) COLLATE "pg_catalog"."default",
  "region" varchar(255) COLLATE "pg_catalog"."default",
  "category" varchar[] COLLATE "pg_catalog"."default",
  "typeof" varchar[] COLLATE "pg_catalog"."default",
  "property" varchar(255) COLLATE "pg_catalog"."default",
  "language" varchar[] COLLATE "pg_catalog"."default",
  "imageurl" jsonb[]
)
;

-- ----------------------------
-- Records of room
-- ----------------------------
INSERT INTO "public"."room" VALUES ('01', 'KHU NGHỈ DƯỠNG PIUGUS', 'Piugus resort tọa lạc tại một hòn đảo nhỏ tư nhân tại Anambas. Toàn bộ biệt thự được xây dựng từ gỗ tự nhiên.', 500, '{"Máy giặt","Sân hoặc ban công","Điều hòa nhiệt độ","Bữa sáng","Cho phép ở dài hạn","Cho phép hút thuốc"}', 'Anambas, Kepulauan Riau, Indonesia', 'Herry', 5, 1, 2, 1, '{"Self check-in","Great location","Dive right in"}', 'A', 'Viet Nam', '{Beach,"Tiny Home",Islands}', '{"Toàn bộ nhà","Phòng riêng","Phòng chung"}', 'Nhà', '{"Tiếng Anh","Tiếng Việt"}', '{"{\"url\": \"https://storage.googleapis.com/go-firestore-rest-api.appspot.com/gallery/JSg3tgoY0_3VZT2SW8b\", \"type\": \"image\"}","{\"url\": \"https://storage.googleapis.com/go-firestore-rest-api.appspot.com/gallery/JSg3tgoY0_oSipzWeYi\", \"type\": \"image\"}","{\"url\": \"https://storage.googleapis.com/go-firestore-rest-api.appspot.com/gallery/JSg3tgoY0_EF7bCPZry\", \"type\": \"image\"}"}');

-- ----------------------------
-- Table structure for saveditem
-- ----------------------------
DROP TABLE IF EXISTS "public"."saveditem";
CREATE TABLE "public"."saveditem" (
  "id" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "items" varchar[] COLLATE "pg_catalog"."default",
  "createdby" varchar(40) COLLATE "pg_catalog"."default",
  "createdat" timestamp(6),
  "updatedby" varchar(40) COLLATE "pg_catalog"."default",
  "updatedat" timestamp(6)
)
;

-- ----------------------------
-- Records of saveditem
-- ----------------------------

-- ----------------------------
-- Table structure for savedlocation
-- ----------------------------
DROP TABLE IF EXISTS "public"."savedlocation";
CREATE TABLE "public"."savedlocation" (
  "id" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "items" varchar[] COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of savedlocation
-- ----------------------------

-- ----------------------------
-- Table structure for signupcodes
-- ----------------------------
DROP TABLE IF EXISTS "public"."signupcodes";
CREATE TABLE "public"."signupcodes" (
  "id" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "code" varchar(500) COLLATE "pg_catalog"."default" NOT NULL,
  "expiredat" timestamptz(6) NOT NULL
)
;

-- ----------------------------
-- Records of signupcodes
-- ----------------------------
INSERT INTO "public"."signupcodes" VALUES ('uEyz9MqaM', '$2a$10$Tj.gVmypc66rvAeFHybtr.VJOANZIBeQBh5NvuzEiCuGHrlHkSqEG', '2023-03-20 04:11:10.310384+00');
INSERT INTO "public"."signupcodes" VALUES ('W4-SSYOad', '$2b$10$GLndZAVCJzEE.2CJiLCxFu3YrvFQieQm46ZGp6XXTcWcbiM1crSZ.', '2022-10-12 11:07:36.779+00');
INSERT INTO "public"."signupcodes" VALUES ('fmA8L1ic6', '$2b$10$IInKP2z703eg1LrQMYpCZOKblTtOtp4gIOZKLnPQFVkmYLkEF7uaC', '2022-10-13 02:32:34.381+00');
INSERT INTO "public"."signupcodes" VALUES ('EAt0afrot', '$2b$10$yiPAyPZjcgN7si4w0W0SgeCah7uFYd2bq3cIARLfnNz6KKzcsMny.', '2022-10-13 04:29:22.179+00');
INSERT INTO "public"."signupcodes" VALUES ('hv5IMcgcQ', '$2b$10$NbB36eZmmoLJQv3rncgcEO6AL58TDtOszYfpTm94Xuynj72Ju7XCa', '2022-10-13 06:34:40.651+00');
INSERT INTO "public"."signupcodes" VALUES ('w7GE8z1oF', '$2b$10$fUm312/OmEA.MjoS5Dk11.kNwHcxS/tnCpjNGgflg3sTA8DoO/rgS', '2022-10-14 03:28:40.987+00');
INSERT INTO "public"."signupcodes" VALUES ('gxLTXmdvq', '$2b$10$W3KnDnzEKslAEsmQ3yBRtOSmb0WLy/ulpwYozu7VybePiqBRb9mdu', '2022-10-17 03:02:04.383+00');
INSERT INTO "public"."signupcodes" VALUES ('mJjun1i5y', '$2b$10$jyc20RCzqLyjVMsD2IvoAOBEqwZDomU8xBDLdu6.85HeHEdXjEE8e', '2022-10-20 07:41:05.714+00');
INSERT INTO "public"."signupcodes" VALUES ('h3-bIa9tp', '$2a$10$mVm.a/owEHCsrFoo/lz.fu8N/HlUB.SvV8DMFmpAvbwKPeFu64m5W', '2022-10-24 04:23:10.731694+00');
INSERT INTO "public"."signupcodes" VALUES ('errAItrtM', '$2a$10$M7XWanpmMvsiVtQWCZEVjetA4bnkwouWaFbCFduVK.IQY5T3B0MBy', '2022-10-24 04:27:00.943492+00');
INSERT INTO "public"."signupcodes" VALUES ('mPOdF3rap', '$2a$10$CGx5zLhznCJiCb5DomIZAe9vvFU0xy64JPtTUYbQ1F5bYqbtYgP9S', '2022-10-27 04:05:45.07198+00');
INSERT INTO "public"."signupcodes" VALUES ('pu65Tr6FE', '$2b$10$HhkKVEx9YMC1ZkHBUfjsQeW67HMPh1Cx8SqAQ6fTSTDqfTPwZqdmi', '2023-03-30 06:45:18.322+00');

-- ----------------------------
-- Table structure for skills
-- ----------------------------
DROP TABLE IF EXISTS "public"."skills";
CREATE TABLE "public"."skills" (
  "skill" varchar(120) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of skills
-- ----------------------------
INSERT INTO "public"."skills" VALUES ('java');
INSERT INTO "public"."skills" VALUES ('javascripts');
INSERT INTO "public"."skills" VALUES ('c++');
INSERT INTO "public"."skills" VALUES ('c#');
INSERT INTO "public"."skills" VALUES ('c');
INSERT INTO "public"."skills" VALUES ('python');
INSERT INTO "public"."skills" VALUES ('ruby');
INSERT INTO "public"."skills" VALUES ('rust');
INSERT INTO "public"."skills" VALUES ('reactjs');
INSERT INTO "public"."skills" VALUES ('angular');
INSERT INTO "public"."skills" VALUES ('vue');
INSERT INTO "public"."skills" VALUES ('express');
INSERT INTO "public"."skills" VALUES ('codeigniter');
INSERT INTO "public"."skills" VALUES ('react native');
INSERT INTO "public"."skills" VALUES ('flutter');
INSERT INTO "public"."skills" VALUES ('qe');
INSERT INTO "public"."skills" VALUES ('asdasdas');
INSERT INTO "public"."skills" VALUES ('dasdasdasdasdasdasdas');
INSERT INTO "public"."skills" VALUES ('asdasdasdasd');
INSERT INTO "public"."skills" VALUES ('asdasdasd');
INSERT INTO "public"."skills" VALUES ('dfbdfgdfgdfg');

-- ----------------------------
-- Table structure for usercompanies
-- ----------------------------
DROP TABLE IF EXISTS "public"."usercompanies";
CREATE TABLE "public"."usercompanies" (
  "company" varchar(120) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of usercompanies
-- ----------------------------

-- ----------------------------
-- Table structure for usereducations
-- ----------------------------
DROP TABLE IF EXISTS "public"."usereducations";
CREATE TABLE "public"."usereducations" (
  "school" varchar(120) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of usereducations
-- ----------------------------

-- ----------------------------
-- Table structure for userfollower
-- ----------------------------
DROP TABLE IF EXISTS "public"."userfollower";
CREATE TABLE "public"."userfollower" (
  "id" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "follower" varchar(40) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of userfollower
-- ----------------------------
INSERT INTO "public"."userfollower" VALUES ('uEyz9MqaM', '5d1d7a66c5e4f320a86ca6b2');
INSERT INTO "public"."userfollower" VALUES ('uEyz9MqaM', '5d1d7a66c5e4f320a86ca6b2');
INSERT INTO "public"."userfollower" VALUES ('uEyz9MqaM', '5d1d7b79c5e4f320a86ca6b4');
INSERT INTO "public"."userfollower" VALUES ('uEyz9MqaM', '5d1d7a66c5e4f320a86ca6b2');

-- ----------------------------
-- Table structure for userfollowing
-- ----------------------------
DROP TABLE IF EXISTS "public"."userfollowing";
CREATE TABLE "public"."userfollowing" (
  "id" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "following" varchar(40) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of userfollowing
-- ----------------------------
INSERT INTO "public"."userfollowing" VALUES ('5d1d7a66c5e4f320a86ca6b2', 'uEyz9MqaM');
INSERT INTO "public"."userfollowing" VALUES ('5d1d7a66c5e4f320a86ca6b2', 'uEyz9MqaM');
INSERT INTO "public"."userfollowing" VALUES ('5d1d7b79c5e4f320a86ca6b4', 'uEyz9MqaM');
INSERT INTO "public"."userfollowing" VALUES ('5d1d7a66c5e4f320a86ca6b2', 'uEyz9MqaM');

-- ----------------------------
-- Table structure for userinfo
-- ----------------------------
DROP TABLE IF EXISTS "public"."userinfo";
CREATE TABLE "public"."userinfo" (
  "id" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "followercount" int8 DEFAULT 0,
  "followingcount" int8 DEFAULT 0,
  "rate1" int4 DEFAULT 0
)
;

-- ----------------------------
-- Records of userinfo
-- ----------------------------

-- ----------------------------
-- Table structure for userinfomation
-- ----------------------------
DROP TABLE IF EXISTS "public"."userinfomation";
CREATE TABLE "public"."userinfomation" (
  "id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "appreciate" int8 DEFAULT 0,
  "respect" int8 DEFAULT 0,
  "admire" int8 DEFAULT 0,
  "reactioncount" int8 DEFAULT 0
)
;

-- ----------------------------
-- Records of userinfomation
-- ----------------------------

-- ----------------------------
-- Table structure for userrate
-- ----------------------------
DROP TABLE IF EXISTS "public"."userrate";
CREATE TABLE "public"."userrate" (
  "id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "author" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "rate" int4,
  "time" timestamp(6),
  "review" text COLLATE "pg_catalog"."default",
  "usefulcount" int4 DEFAULT 0,
  "replycount" int4 DEFAULT 0,
  "histories" jsonb[]
)
;

-- ----------------------------
-- Records of userrate
-- ----------------------------

-- ----------------------------
-- Table structure for userratecomment
-- ----------------------------
DROP TABLE IF EXISTS "public"."userratecomment";
CREATE TABLE "public"."userratecomment" (
  "commentid" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "id" varchar(255) COLLATE "pg_catalog"."default",
  "author" varchar(255) COLLATE "pg_catalog"."default",
  "userid" varchar(255) COLLATE "pg_catalog"."default",
  "comment" text COLLATE "pg_catalog"."default",
  "time" timestamp(6),
  "updatedat" timestamp(6),
  "histories" jsonb[]
)
;

-- ----------------------------
-- Records of userratecomment
-- ----------------------------

-- ----------------------------
-- Table structure for userrateinfo
-- ----------------------------
DROP TABLE IF EXISTS "public"."userrateinfo";
CREATE TABLE "public"."userrateinfo" (
  "id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "rate" numeric DEFAULT 0,
  "rate1" int4 DEFAULT 0,
  "rate2" int4 DEFAULT 0,
  "rate3" int4 DEFAULT 0,
  "rate4" int4 DEFAULT 0,
  "rate5" int4 DEFAULT 0,
  "rate6" int4 DEFAULT 0,
  "rate7" int4 DEFAULT 0,
  "rate8" int4 DEFAULT 0,
  "rate9" int4 DEFAULT 0,
  "rate10" int4 DEFAULT 0,
  "count" int4,
  "score" numeric
)
;

-- ----------------------------
-- Records of userrateinfo
-- ----------------------------

-- ----------------------------
-- Table structure for userratereaction
-- ----------------------------
DROP TABLE IF EXISTS "public"."userratereaction";
CREATE TABLE "public"."userratereaction" (
  "id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "author" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "userid" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "time" timestamp(6),
  "reaction" int2
)
;

-- ----------------------------
-- Records of userratereaction
-- ----------------------------

-- ----------------------------
-- Table structure for userreaction
-- ----------------------------
DROP TABLE IF EXISTS "public"."userreaction";
CREATE TABLE "public"."userreaction" (
  "id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "author" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "userid" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "reaction" int2,
  "time" timestamp(6)
)
;

-- ----------------------------
-- Records of userreaction
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS "public"."users";
CREATE TABLE "public"."users" (
  "id" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "username" varchar(120) COLLATE "pg_catalog"."default",
  "email" varchar(120) COLLATE "pg_catalog"."default",
  "phone" varchar(45) COLLATE "pg_catalog"."default",
  "gender" char(1) COLLATE "pg_catalog"."default",
  "displayname" varchar(500) COLLATE "pg_catalog"."default",
  "givenname" varchar(100) COLLATE "pg_catalog"."default",
  "familyname" varchar(100) COLLATE "pg_catalog"."default",
  "middlename" varchar(100) COLLATE "pg_catalog"."default",
  "alternativeemail" varchar(255) COLLATE "pg_catalog"."default",
  "alternativephone" varchar(45) COLLATE "pg_catalog"."default",
  "imageurl" varchar(255) COLLATE "pg_catalog"."default",
  "coverurl" varchar(255) COLLATE "pg_catalog"."default",
  "title" varchar(255) COLLATE "pg_catalog"."default",
  "nationality" varchar(255) COLLATE "pg_catalog"."default",
  "address" varchar(255) COLLATE "pg_catalog"."default",
  "bio" varchar(255) COLLATE "pg_catalog"."default",
  "website" varchar(255) COLLATE "pg_catalog"."default",
  "occupation" varchar(255) COLLATE "pg_catalog"."default",
  "company" varchar(255) COLLATE "pg_catalog"."default",
  "location" varchar(255) COLLATE "pg_catalog"."default",
  "maxpasswordage" int4,
  "dateofbirth" timestamptz(6),
  "settings" jsonb,
  "links" jsonb,
  "gallery" jsonb[],
  "skills" jsonb[],
  "achievements" jsonb[],
  "works" jsonb[],
  "companies" jsonb[],
  "educations" jsonb[],
  "interests" varchar[] COLLATE "pg_catalog"."default",
  "lookingfor" varchar[] COLLATE "pg_catalog"."default",
  "status" char(1) COLLATE "pg_catalog"."default",
  "createdby" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "createdat" timestamptz(6),
  "updatedby" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "updatedat" timestamptz(6),
  "social" jsonb,
  "version" int4
)
;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO "public"."users" VALUES ('AWvaYDttM', 'vinhtq2020', 'vinhtq2020@gmail.com', NULL, NULL, 'vinh', NULL, NULL, NULL, NULL, NULL, 'https://www.worldhistory.org/img/r/p/500x600/13337.jpeg?v=1654040539', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'AWvaYDttM', NULL, 'AWvaYDttM', NULL, NULL, NULL);
INSERT INTO "public"."users" VALUES ('pu65Tr6FE', 'taquang', 'quang.tx306@gmail.com', NULL, NULL, 'quang2', NULL, NULL, NULL, NULL, NULL, 'https://tulieuvankien.dangcongsan.vn/Uploads/2018/5/5/2/lenin-lenin.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'pu65Tr6FE', '2023-03-30 06:36:58.26+00', 'pu65Tr6FE', '2023-03-30 06:36:58.26+00', NULL, 2);
INSERT INTO "public"."users" VALUES ('uEyz9MqaM', 'quangta', 'quang.tx305@gmail.com', NULL, NULL, 'quang34', NULL, NULL, NULL, NULL, NULL, 'https:/storage.googleapis.com/go-firestore-rest-api.appspot.com/sub/jBkgCQvaM_326691424_1371589173612664_2476295418492007821_n.png', 'https:/storage.googleapis.com/go-firestore-rest-api.appspot.com/sub/PnOFC1Xtp_327187306_503724738543794_1432704642271550047_n.jpg', NULL, NULL, NULL, 'sdfsdfsd', NULL, 'fsdfsdfsd', 'sdfsdf', NULL, 90, NULL, NULL, NULL, '{"{\"url\": \"https:/storage.googleapis.com/go-firestore-rest-api.appspot.com/sub/XA3Xy1vaM_female2016102486572754.jpg\", \"type\": \"image\"}"}', '{"{\"skill\": \"dasdasdasdasdasdasdas\"}","{\"skill\": \"asdasdasdasd\"}","{\"skill\": \"asdasdasd\"}","{\"skill\": \"dfbdfgdfgdfg\"}"}', '{"{\"subject\": \"sdfdsfsd\", \"description\": \"fsdfsdfsdfsdf\"}"}', '{"{\"to\": \"2023-12\", \"from\": \"2023-04\", \"name\": \"sdfsdfsdf\", \"position\": \"sdfsdfsdf\", \"description\": \"sdfsdfsdf\"}"}', '{"{\"to\": \"2023-12\", \"from\": \"2023-04\", \"name\": \"sdfsdfsd\", \"position\": \"fsdfsdf\", \"description\": \"sdfsdfsdfsd\"}"}', '{"{\"to\": \"2023-12\", \"from\": \"2023-08\", \"major\": \"I think people get married just to get ''Likes'' on Facebook.\", \"title\": \"I think people get married just to get ''Likes'' on \", \"degree\": \"I think people get married just to get ''Likes'' on Facebook.\", \"school\": \"I think people get married just to get ''Likes'' on Facebook.\"}"}', '{sdfsdfsdf}', '{dfsdfdsfsdf,asdasdasdasd}', 'A', 'uEyz9MqaM', '2023-03-20 03:11:10.228538+00', 'uEyz9MqaM', '2023-03-20 03:12:10.228538+00', NULL, 2);

-- ----------------------------
-- Table structure for usersearchs
-- ----------------------------
DROP TABLE IF EXISTS "public"."usersearchs";
CREATE TABLE "public"."usersearchs" (
  "item" varchar(120) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of usersearchs
-- ----------------------------
INSERT INTO "public"."usersearchs" VALUES ('friend');
INSERT INTO "public"."usersearchs" VALUES ('room mate');
INSERT INTO "public"."usersearchs" VALUES ('basketball team');
INSERT INTO "public"."usersearchs" VALUES ('qweq');
INSERT INTO "public"."usersearchs" VALUES ('dfsdfdsfsdf');
INSERT INTO "public"."usersearchs" VALUES ('asdasdasdasd');

-- ----------------------------
-- Primary Key structure for table appreciation
-- ----------------------------
ALTER TABLE "public"."appreciation" ADD CONSTRAINT "appreciation_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table appreciationcomment
-- ----------------------------
ALTER TABLE "public"."appreciationcomment" ADD CONSTRAINT "appreciationcomment_pkey" PRIMARY KEY ("commentid");

-- ----------------------------
-- Primary Key structure for table appreciationreaction
-- ----------------------------
ALTER TABLE "public"."appreciationreaction" ADD CONSTRAINT "appreciationreaction_pkey" PRIMARY KEY ("id", "author", "userid");

-- ----------------------------
-- Primary Key structure for table article
-- ----------------------------
ALTER TABLE "public"."article" ADD CONSTRAINT "article_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table articlecomment
-- ----------------------------
ALTER TABLE "public"."articlecomment" ADD CONSTRAINT "articlecomment_pkey" PRIMARY KEY ("commentid");

-- ----------------------------
-- Primary Key structure for table articlecommentinfo
-- ----------------------------
ALTER TABLE "public"."articlecommentinfo" ADD CONSTRAINT "articlecommentinfo_pkey" PRIMARY KEY ("commentid");

-- ----------------------------
-- Primary Key structure for table articlecommentreaction
-- ----------------------------
ALTER TABLE "public"."articlecommentreaction" ADD CONSTRAINT "articlecommentreaction_pkey" PRIMARY KEY ("commentid", "author", "userid");

-- ----------------------------
-- Primary Key structure for table articlecommentthread
-- ----------------------------
ALTER TABLE "public"."articlecommentthread" ADD CONSTRAINT "articlecommentthread_pkey" PRIMARY KEY ("commentid");

-- ----------------------------
-- Primary Key structure for table articlecommentthreadinfo
-- ----------------------------
ALTER TABLE "public"."articlecommentthreadinfo" ADD CONSTRAINT "articlecommentthreadinfo_pkey" PRIMARY KEY ("commentid");

-- ----------------------------
-- Primary Key structure for table articlecommentthreadreaction
-- ----------------------------
ALTER TABLE "public"."articlecommentthreadreaction" ADD CONSTRAINT "articlecommentthreadreaction_pkey" PRIMARY KEY ("commentid", "author", "userid");

-- ----------------------------
-- Primary Key structure for table articleinfo
-- ----------------------------
ALTER TABLE "public"."articleinfo" ADD CONSTRAINT "articleinfo_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table articlerate
-- ----------------------------
ALTER TABLE "public"."articlerate" ADD CONSTRAINT "articlerate_pkey" PRIMARY KEY ("id", "author");

-- ----------------------------
-- Primary Key structure for table articleratecomment
-- ----------------------------
ALTER TABLE "public"."articleratecomment" ADD CONSTRAINT "articleratecomment_pkey" PRIMARY KEY ("commentid");

-- ----------------------------
-- Primary Key structure for table articleratereaction
-- ----------------------------
ALTER TABLE "public"."articleratereaction" ADD CONSTRAINT "articleratereaction_pkey" PRIMARY KEY ("id", "author", "userid");

-- ----------------------------
-- Primary Key structure for table authencodes
-- ----------------------------
ALTER TABLE "public"."authencodes" ADD CONSTRAINT "authencodes_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table brand
-- ----------------------------
ALTER TABLE "public"."brand" ADD CONSTRAINT "brand_pkey" PRIMARY KEY ("brand");

-- ----------------------------
-- Primary Key structure for table category
-- ----------------------------
ALTER TABLE "public"."category" ADD CONSTRAINT "category_pkey" PRIMARY KEY ("categoryid");

-- ----------------------------
-- Primary Key structure for table cinema
-- ----------------------------
ALTER TABLE "public"."cinema" ADD CONSTRAINT "cinema_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table company
-- ----------------------------
ALTER TABLE "public"."company" ADD CONSTRAINT "company_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table company_users
-- ----------------------------
ALTER TABLE "public"."company_users" ADD CONSTRAINT "company_users_pk" PRIMARY KEY ("company_id", "user_id");

-- ----------------------------
-- Primary Key structure for table companycategory
-- ----------------------------
ALTER TABLE "public"."companycategory" ADD CONSTRAINT "companycategory_pkey" PRIMARY KEY ("categoryid");

-- ----------------------------
-- Primary Key structure for table companycomment
-- ----------------------------
ALTER TABLE "public"."companycomment" ADD CONSTRAINT "companycomment_pkey" PRIMARY KEY ("commentid");

-- ----------------------------
-- Primary Key structure for table companyrate
-- ----------------------------
ALTER TABLE "public"."companyrate" ADD CONSTRAINT "companyrate_pkey" PRIMARY KEY ("id", "author");

-- ----------------------------
-- Primary Key structure for table companyratefullinfo
-- ----------------------------
ALTER TABLE "public"."companyratefullinfo" ADD CONSTRAINT "companyratefullinfo_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table companyrateinfo01
-- ----------------------------
ALTER TABLE "public"."companyrateinfo01" ADD CONSTRAINT "companyrateinfo1_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table companyrateinfo02
-- ----------------------------
ALTER TABLE "public"."companyrateinfo02" ADD CONSTRAINT "companyrateinfo2_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table companyrateinfo03
-- ----------------------------
ALTER TABLE "public"."companyrateinfo03" ADD CONSTRAINT "companyrateinfo3_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table companyrateinfo04
-- ----------------------------
ALTER TABLE "public"."companyrateinfo04" ADD CONSTRAINT "companyrateinfo4_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table companyrateinfo05
-- ----------------------------
ALTER TABLE "public"."companyrateinfo05" ADD CONSTRAINT "companyrateinfo5_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table companyratereaction
-- ----------------------------
ALTER TABLE "public"."companyratereaction" ADD CONSTRAINT "companyratereaction_pkey" PRIMARY KEY ("id", "author", "userid");

-- ----------------------------
-- Primary Key structure for table countries
-- ----------------------------
ALTER TABLE "public"."countries" ADD CONSTRAINT "countries_pkey" PRIMARY KEY ("country");

-- ----------------------------
-- Primary Key structure for table film
-- ----------------------------
ALTER TABLE "public"."film" ADD CONSTRAINT "film_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table filmcasts
-- ----------------------------
ALTER TABLE "public"."filmcasts" ADD CONSTRAINT "filmcasts_pkey" PRIMARY KEY ("actor");

-- ----------------------------
-- Primary Key structure for table filmcategory
-- ----------------------------
ALTER TABLE "public"."filmcategory" ADD CONSTRAINT "filmcategory_pkey" PRIMARY KEY ("categoryid");

-- ----------------------------
-- Primary Key structure for table filmcommentthread
-- ----------------------------
ALTER TABLE "public"."filmcommentthread" ADD CONSTRAINT "filmcommentthread_pkey" PRIMARY KEY ("commentid");

-- ----------------------------
-- Primary Key structure for table filmcommentthreadinfo
-- ----------------------------
ALTER TABLE "public"."filmcommentthreadinfo" ADD CONSTRAINT "filmcommentthreadinfo_pkey" PRIMARY KEY ("commentid");

-- ----------------------------
-- Primary Key structure for table filmcommentthreadreaction
-- ----------------------------
ALTER TABLE "public"."filmcommentthreadreaction" ADD CONSTRAINT "filmcommentthreadreaction_pkey" PRIMARY KEY ("commentid", "author", "userid");

-- ----------------------------
-- Primary Key structure for table filmdirectors
-- ----------------------------
ALTER TABLE "public"."filmdirectors" ADD CONSTRAINT "filmdirectors_pkey" PRIMARY KEY ("director");

-- ----------------------------
-- Primary Key structure for table filmproductions
-- ----------------------------
ALTER TABLE "public"."filmproductions" ADD CONSTRAINT "filmproductions_pkey" PRIMARY KEY ("production");

-- ----------------------------
-- Primary Key structure for table filmrate
-- ----------------------------
ALTER TABLE "public"."filmrate" ADD CONSTRAINT "filmrate_pkey" PRIMARY KEY ("id", "author");

-- ----------------------------
-- Primary Key structure for table filmratecomment
-- ----------------------------
ALTER TABLE "public"."filmratecomment" ADD CONSTRAINT "filmratecomment_pkey" PRIMARY KEY ("commentid");

-- ----------------------------
-- Primary Key structure for table filmrateinfo
-- ----------------------------
ALTER TABLE "public"."filmrateinfo" ADD CONSTRAINT "filmrateinfo_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table filmratereaction
-- ----------------------------
ALTER TABLE "public"."filmratereaction" ADD CONSTRAINT "filmratereaction_pkey" PRIMARY KEY ("id", "author", "userid");

-- ----------------------------
-- Primary Key structure for table filmreplycomment
-- ----------------------------
ALTER TABLE "public"."filmreplycomment" ADD CONSTRAINT "filmreplycomment_pkey" PRIMARY KEY ("commentid");

-- ----------------------------
-- Primary Key structure for table filmreplycommentinfo
-- ----------------------------
ALTER TABLE "public"."filmreplycommentinfo" ADD CONSTRAINT "filmreplycommentinfoo_pkey" PRIMARY KEY ("commentid");

-- ----------------------------
-- Primary Key structure for table filmreplycommentreaction
-- ----------------------------
ALTER TABLE "public"."filmreplycommentreaction" ADD CONSTRAINT "filmreplycommentreaction_pkey" PRIMARY KEY ("commentid", "author", "userid");

-- ----------------------------
-- Primary Key structure for table history
-- ----------------------------
ALTER TABLE "public"."history" ADD CONSTRAINT "history_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table interests
-- ----------------------------
ALTER TABLE "public"."interests" ADD CONSTRAINT "interests_pkey" PRIMARY KEY ("interest");

-- ----------------------------
-- Primary Key structure for table item
-- ----------------------------
ALTER TABLE "public"."item" ADD CONSTRAINT "item_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table itemcategory
-- ----------------------------
ALTER TABLE "public"."itemcategory" ADD CONSTRAINT "itemcategory_pkey" PRIMARY KEY ("categoryid");

-- ----------------------------
-- Primary Key structure for table itemcomment
-- ----------------------------
ALTER TABLE "public"."itemcomment" ADD CONSTRAINT "itemcomment_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table iteminfo
-- ----------------------------
ALTER TABLE "public"."iteminfo" ADD CONSTRAINT "iteminfo_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table itemresponse
-- ----------------------------
ALTER TABLE "public"."itemresponse" ADD CONSTRAINT "itemresponse_pkey" PRIMARY KEY ("id", "author");

-- ----------------------------
-- Primary Key structure for table itemresponsereaction
-- ----------------------------
ALTER TABLE "public"."itemresponsereaction" ADD CONSTRAINT "itemresponsereaction_pkey" PRIMARY KEY ("id", "author", "userid");

-- ----------------------------
-- Primary Key structure for table job
-- ----------------------------
ALTER TABLE "public"."job" ADD CONSTRAINT "job_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table location
-- ----------------------------
ALTER TABLE "public"."location" ADD CONSTRAINT "location_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table locationcomment
-- ----------------------------
ALTER TABLE "public"."locationcomment" ADD CONSTRAINT "locationcomment_pkey" PRIMARY KEY ("commentid");

-- ----------------------------
-- Primary Key structure for table locationcommentthread
-- ----------------------------
ALTER TABLE "public"."locationcommentthread" ADD CONSTRAINT "locationcommentthread_pkey" PRIMARY KEY ("commentid");

-- ----------------------------
-- Primary Key structure for table locationcommentthreadinfo
-- ----------------------------
ALTER TABLE "public"."locationcommentthreadinfo" ADD CONSTRAINT "locationcommentthreadinfo_pkey" PRIMARY KEY ("commentid");

-- ----------------------------
-- Primary Key structure for table locationcommentthreadreaction
-- ----------------------------
ALTER TABLE "public"."locationcommentthreadreaction" ADD CONSTRAINT "locationcommentthreadreaction_pkey" PRIMARY KEY ("commentid", "author", "userid");

-- ----------------------------
-- Primary Key structure for table locationinfo
-- ----------------------------
ALTER TABLE "public"."locationinfo" ADD CONSTRAINT "locationinfo_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table locationinfomation
-- ----------------------------
ALTER TABLE "public"."locationinfomation" ADD CONSTRAINT "locationinfomation_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table locationrate
-- ----------------------------
ALTER TABLE "public"."locationrate" ADD CONSTRAINT "locationrate_pkey" PRIMARY KEY ("id", "author");

-- ----------------------------
-- Primary Key structure for table locationratereaction
-- ----------------------------
ALTER TABLE "public"."locationratereaction" ADD CONSTRAINT "locationratereaction_pkey" PRIMARY KEY ("id", "author", "userid");

-- ----------------------------
-- Primary Key structure for table locationreplycomment
-- ----------------------------
ALTER TABLE "public"."locationreplycomment" ADD CONSTRAINT "locationreplycomment_pkey" PRIMARY KEY ("commentid");

-- ----------------------------
-- Primary Key structure for table locationreplycommentinfo
-- ----------------------------
ALTER TABLE "public"."locationreplycommentinfo" ADD CONSTRAINT "locationreplycommentinfo_pkey" PRIMARY KEY ("commentid");

-- ----------------------------
-- Primary Key structure for table locationreplycommentreaction
-- ----------------------------
ALTER TABLE "public"."locationreplycommentreaction" ADD CONSTRAINT "locationreplycommentreaction_pkey" PRIMARY KEY ("commentid", "author", "userid");

-- ----------------------------
-- Primary Key structure for table music
-- ----------------------------
ALTER TABLE "public"."music" ADD CONSTRAINT "music_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table passwordcodes
-- ----------------------------
ALTER TABLE "public"."passwordcodes" ADD CONSTRAINT "passwordcodes_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table passwords
-- ----------------------------
ALTER TABLE "public"."passwords" ADD CONSTRAINT "passwords_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table playlist
-- ----------------------------
ALTER TABLE "public"."playlist" ADD CONSTRAINT "playlist_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table reservation
-- ----------------------------
ALTER TABLE "public"."reservation" ADD CONSTRAINT "reservation_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table room
-- ----------------------------
ALTER TABLE "public"."room" ADD CONSTRAINT "room_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table saveditem
-- ----------------------------
ALTER TABLE "public"."saveditem" ADD CONSTRAINT "saveditem_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table savedlocation
-- ----------------------------
ALTER TABLE "public"."savedlocation" ADD CONSTRAINT "savedlocation_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table signupcodes
-- ----------------------------
ALTER TABLE "public"."signupcodes" ADD CONSTRAINT "signupcodes_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table skills
-- ----------------------------
ALTER TABLE "public"."skills" ADD CONSTRAINT "skills_pkey" PRIMARY KEY ("skill");

-- ----------------------------
-- Primary Key structure for table usercompanies
-- ----------------------------
ALTER TABLE "public"."usercompanies" ADD CONSTRAINT "user_companies_pkey" PRIMARY KEY ("company");

-- ----------------------------
-- Primary Key structure for table usereducations
-- ----------------------------
ALTER TABLE "public"."usereducations" ADD CONSTRAINT "educations_pkey" PRIMARY KEY ("school");

-- ----------------------------
-- Primary Key structure for table userinfo
-- ----------------------------
ALTER TABLE "public"."userinfo" ADD CONSTRAINT "userinfo_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table userinfomation
-- ----------------------------
ALTER TABLE "public"."userinfomation" ADD CONSTRAINT "userinfomation_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table userrate
-- ----------------------------
ALTER TABLE "public"."userrate" ADD CONSTRAINT "userrate_pkey" PRIMARY KEY ("id", "author");

-- ----------------------------
-- Primary Key structure for table userratecomment
-- ----------------------------
ALTER TABLE "public"."userratecomment" ADD CONSTRAINT "userratecomment_pkey" PRIMARY KEY ("commentid");

-- ----------------------------
-- Primary Key structure for table userrateinfo
-- ----------------------------
ALTER TABLE "public"."userrateinfo" ADD CONSTRAINT "userrateinfo_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table userratereaction
-- ----------------------------
ALTER TABLE "public"."userratereaction" ADD CONSTRAINT "userratereaction_pkey" PRIMARY KEY ("id", "author", "userid");

-- ----------------------------
-- Primary Key structure for table userreaction
-- ----------------------------
ALTER TABLE "public"."userreaction" ADD CONSTRAINT "userreaction_pkey" PRIMARY KEY ("id", "author", "userid");

-- ----------------------------
-- Primary Key structure for table users
-- ----------------------------
ALTER TABLE "public"."users" ADD CONSTRAINT "users_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table usersearchs
-- ----------------------------
ALTER TABLE "public"."usersearchs" ADD CONSTRAINT "searchs_pkey" PRIMARY KEY ("item");
