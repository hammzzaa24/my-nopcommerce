# استخدام بيئة تشغيل دوت نت 7 الرسمية والخفيفة من مايكروسوفت
FROM mcr.microsoft.com/dotnet/aspnet:7.0
WORKDIR /app

# تثبيت الأدوات الأساسية لفك الضغط داخل السيرفر
RUN apt-get update && apt-get install -y wget unzip && rm -rf /var/lib/apt/lists/*

# جلب نسخة مستقرة ومجربة بالكامل تتوافق مع قيود السيرفرات المجانية
RUN wget https://github.com/nopSolutions/nopCommerce/releases/download/release-4.60.5/nopCommerce_4.60.5_NoSource_linux_x64.zip -O nopcommerce.zip \
    && unzip nopcommerce.zip -d . \
    && rm nopcommerce.zip

# فتح المنفذ الذي تتوقعه منصة Render
EXPOSE 5000
ENV ASPNETCORE_URLS=http://+:5000

# أمر الإقلاع للملف التنفيذي الأساسي للموقع
ENTRYPOINT ["dotnet", "Nop.Web.dll"]
