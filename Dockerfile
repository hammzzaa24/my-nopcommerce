# جلب النسخة الرسمية الجاهزة لـ nopCommerce المبنية على دوت نت 8
FROM nopcommerce/nopcommerce:latest

# فتح المنفذ الافتراضي للتطبيق داخل الحاوية
EXPOSE 80

# تعيين متغيرات البيئة ليعمل التطبيق على المنفذ المتوقع
ENV ASPNETCORE_URLS=http://+:80
