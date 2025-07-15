// تهيئة التطبيق
document.addEventListener('DOMContentLoaded', function() {
    // إضافة أحداث للأزرار
    document.getElementById('check-game-version').addEventListener('click', checkGameVersion);
    document.getElementById('check-device-compatibility').addEventListener('click', checkDeviceCompatibility);
    document.getElementById('enter-hack').addEventListener('click', enterHack);
    document.getElementById('premium-btn').addEventListener('click', showPremiumOptions);
    
    // تفعيل زر دخول الهاك مباشرة
    document.getElementById('enter-hack').disabled = false;
});

// التحقق من إصدار اللعبة
function checkGameVersion() {
    // الحصول على عناصر الواجهة
    const statusItem = document.getElementById('game-version-status');
    const statusText = statusItem.querySelector('.status-text');
    const checkBtn = statusItem.querySelector('.check-btn');
    
    // تغيير حالة العنصر إلى "جاري التحقق"
    statusItem.classList.add('checking');
    checkBtn.disabled = true;
    checkBtn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> جاري التحقق...';
    
    // إظهار نافذة التحقق المنبثقة
    showVerificationModal('جاري التحقق من إصدار اللعبة');
    
    // محاكاة عملية التحقق (مع تأخير أطول كما طلب المستخدم)
    simulateVerificationProgress(() => {
        // تحديث حالة التحقق بعد الانتهاء
        statusItem.classList.remove('checking');
        statusItem.classList.add('success');
        
        // تحديث الأيقونة والنص
        const statusIcon = statusItem.querySelector('.status-icon');
        statusIcon.className = 'fas fa-check-circle status-icon';
        statusText.textContent = 'تم التحقق';
        
        // إخفاء زر التحقق
        checkBtn.style.display = 'none';
        
        // إظهار نتيجة التحقق في النافذة المنبثقة
        showVerificationResult('تم التحقق بنجاح: إصدارك متوافق مع PSH4X. للحصول على أقصى درجات الأمان، يرجى التأكد من استخدام أحدث إصدار من اللعبة.', 'success', true);
        
        // التحقق مما إذا كان كلا الفحصين قد اكتملا لتفعيل زر الدخول
        checkBothVerifications();
    });
}

// التحقق من توافق الجهاز
function checkDeviceCompatibility() {
    // الحصول على عناصر الواجهة
    const statusItem = document.getElementById('device-compatibility-status');
    const statusText = statusItem.querySelector('.status-text');
    const checkBtn = statusItem.querySelector('.check-btn');
    
    // تغيير حالة العنصر إلى "جاري التحقق"
    statusItem.classList.add('checking');
    checkBtn.disabled = true;
    checkBtn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> جاري التحقق';
    statusText.textContent = 'جاري فحص توافق الجهاز...';
    
    // عرض نافذة التحقق المنبثقة
    showVerificationModal('جاري التحقق من توافق الجهاز');
    
    // محاكاة عملية التحقق (مع تأخير أطول كما طلب المستخدم)
    simulateVerificationProgress(function() {
        // بعد اكتمال التحقق بنجاح
        statusItem.classList.remove('checking');
        statusItem.classList.add('success');
        
        const icon = statusItem.querySelector('.status-icon');
        icon.classList.remove('fa-mobile-alt');
        icon.classList.add('fa-check-circle');
        
        statusText.textContent = 'تم التحقق';
        
        // إخفاء زر التحقق
        checkBtn.style.display = 'none';
        
        // إظهار نتيجة التحقق في النافذة المنبثقة
        showVerificationResult('تم التحقق بنجاح: جهازك متوافق مع جميع ميزات PSH4X', 'success');
        
        // التحقق مما إذا كان كلا الفحصين قد اكتملا لتفعيل زر الدخول
        checkBothVerifications();
    });
}

// الانتقال إلى صفحة الهاك
function enterHack() {
    // محاكاة التحميل
    const container = document.querySelector('.container');
    container.innerHTML = `
        <div class="loading-screen">
            <div class="logo-container">
                <img src="images/psh4x-logo.png" alt="PSH4X Logo" class="logo">
            </div>
            <div class="loading-bar-container">
                <div class="loading-bar"></div>
            </div>
            <div class="loading-text">جاري بدء الهاك... <span id="loading-percentage">0%</span></div>
        </div>
    `;
    
    // محاكاة شريط التحميل بشكل أسرع (2 ثانية فقط)
    let percentage = 0;
    const loadingBar = document.querySelector('.loading-bar');
    const loadingPercentage = document.getElementById('loading-percentage');
    
    // حساب الفترة الزمنية للوصول إلى 100% في 2 ثانية
    // 2000ms / 20 = 100ms لكل زيادة بنسبة 5%
    const loadingInterval = setInterval(() => {
        percentage += 5;
        if (percentage > 100) percentage = 100;
        
        loadingBar.style.width = percentage + '%';
        loadingPercentage.textContent = Math.floor(percentage) + '%';
        
        if (percentage >= 100) {
            clearInterval(loadingInterval);
            setTimeout(() => {
                window.location.href = 'hack.html';
            }, 200); // تقليل وقت الانتظار بعد اكتمال التحميل
        }
    }, 100);
}

// عرض خيارات النسخة المدفوعة
function showPremiumOptions() {
    // تحويل المستخدم إلى صفحة news.html
    window.location.href = 'news.html';
}
