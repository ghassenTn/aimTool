// تنفيذ تأثيرات الانتقال عند تحميل صفحة الهاك
document.addEventListener('DOMContentLoaded', function() {
    // إضافة فئة loading إلى الجسم لمنع التمرير أثناء التحميل
    document.body.classList.add('loading');
    
    // تحديد العناصر الرئيسية
    const hackContainer = document.querySelector('.hack-container');
    const header = document.querySelector('.hack-header');
    const statusPanel = document.querySelector('.status-panel');
    const featureSections = document.querySelectorAll('.feature-section');
    
    // تأخير قصير قبل بدء الانتقالات
    setTimeout(() => {
        // إظهار الحاوية الرئيسية أولاً
        hackContainer.classList.add('loaded');
        
        // إضافة فئات التأثير التدريجي للعناصر
        if (header) {
            header.classList.add('fade-in');
            header.classList.add('delay-1');
        }
        
        if (statusPanel) {
            statusPanel.classList.add('fade-in');
            statusPanel.classList.add('delay-2');
        }
        
        // إضافة تأثير تدريجي لأقسام الميزات
        featureSections.forEach((section, index) => {
            section.classList.add('fade-in');
            section.classList.add(`delay-${index + 3}`);
        });
        
        // إزالة فئة loading بعد اكتمال الانتقالات
        setTimeout(() => {
            document.body.classList.remove('loading');
        }, 1000);
    }, 100);
});
