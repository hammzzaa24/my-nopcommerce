# استخدام بيئة تشغيل دوت نت 8 الرسمية والخفيفة من مايكروسوفت
FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app

# تثبيت الأدوات الأساسية لفك الضغط داخل السيرفر
RUN apt-get update && apt-get install -y wget unzip && rm -rf /var/lib/apt/lists/*

# جلب النسخة المجمعة الجاهزة للتشغيل مباشرة من سيرفرات السورس كود الرسمية لـ nopCommerce
RUN wget https://github.com/nopSolutions/nopCommerce/releases/download/release-4.70.5/nopCommerce_4.70.5_NoSource_linux_x64.zip -O nopcommerce.zip \
    && unzip nopcommerce.zip -d . \
    && rm nopcommerce.zip

# فتح المنفذ الذي تتوقعه منصة Render
EXPOSE 5000
ENV ASPNETCORE_URLS=http://+:5000

# أمر الإقلاع للملف التنفيذي الأساسي للموقع
ENTRYPOINT ["dotnet", "Nop.Web.dll"]
