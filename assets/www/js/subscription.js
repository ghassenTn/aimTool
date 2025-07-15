// تهيئة صفحة الاشتراك
document.addEventListener('DOMContentLoaded', function() {
    // إضافة أحداث للأزرار
    setupButtonEvents();
    
    // إضافة أحداث لزر التفعيل
    const activateBtn = document.getElementById('login-submit');
    if (activateBtn) {
        activateBtn.addEventListener('click', function() {
            const activationKeyInput = document.getElementById('activation-key');
            const key = activationKeyInput.value;
            
            // التحقق من صحة المفتاح
            if (!key) {
                showNotification('الحقل فارغ. الرجاء إدخال مفتاح التفعيل', 'error');
                activationKeyInput.classList.add('error');
                setTimeout(() => {
                    activationKeyInput.classList.remove('error');
                }, 2000);
                return;
            }
            
            // قائمة المفاتيح الصالحة
            const validKeys = [
                "PSH4X-K3M7-L9QD-V2XN-PRO7X",
                "PSH4X-P8L4-X9TZ-Q3MP-VIP6Z",
                "PSH4X-T4ZA-K6PQ-V3LJ-TRI3X",
                "PSH4X-L1QP-X3ZM-W2FK-ULT4V",
                "PSH4X-Z7MN-P6XR-A2LV-MAX9K",
                "PSH4X-R2XW-K3NV-Q7LB-PRM8L",
                "PSH4X-Y9QD-F6LU-M5XA-ELT2X",
                "PSH4X-M3LK-V9ZD-C2QP-SUP5R",
                "PSH4X-W8NM-A3LD-F7XZ-ADV7Q",
                "PSH4X-Q1BZ-R4XN-K6ZP-PRE4X"
            ];
            
            // التحقق من المفتاح
            if (validKeys.includes(key)) {
                // إظهار تأثير التفعيل
                showActivationEffect();
            } else {
                showNotification('مفتاح التفعيل غير صالح. تأكد من المفتاح أو تواصل مع البائع', 'error');
                activationKeyInput.classList.add('error');
                setTimeout(() => {
                    activationKeyInput.classList.remove('error');
                }, 2000);
            }
        });
    }
});

// إعداد أحداث الأزرار
function setupButtonEvents() {
    // تم إزالة وظيفة زر الرجوع
    
    // تم إزالة وظائف الأزرار التي تمت إزالتها من شريط التنقل العلوي
    
    // زر اللصق التلقائي
    const pasteBtn = document.getElementById('paste-btn');
    if (pasteBtn) {
        pasteBtn.addEventListener('click', async function() {
            try {
                const text = await navigator.clipboard.readText();
                document.getElementById('activation-key').value = text;
                showNotification('تم لصق المفتاح بنجاح', 'success');
            } catch (err) {
                showNotification('لا يمكن الوصول إلى الحافظة', 'error');
                console.error('فشل في الوصول إلى الحافظة: ', err);
            }
        });
    }
    
    // زر التجريبي
    const trialBtn = document.getElementById('trial-btn');
    if (trialBtn) {
        trialBtn.addEventListener('click', function() {
            // إخفاء نافذة تسجيل الدخول
            document.getElementById('login-modal').style.display = 'none';
            
            // إظهار نافذة المفتاح التجريبي
            const trialKeyModal = document.getElementById('trial-key-modal');
            trialKeyModal.style.display = 'flex';
            
            // إظهار الشاشة الأولى فقط
            document.querySelector('.trial-key-content').style.display = 'flex';
            document.querySelector('.gift-content').style.display = 'none';
            document.querySelector('.key-content').style.display = 'none';
        });
    }
    
    // أزرار شريط الأدوات السفلي
    const footerBtns = document.querySelectorAll('.footer-btn');
    footerBtns.forEach(btn => {
        btn.addEventListener('click', function() {
            footerBtns.forEach(b => b.classList.remove('active'));
            this.classList.add('active');
            
            // تحويل المستخدم إلى الصفحة المناسبة
            if (this.id === 'home-btn') {
                window.location.href = 'hack.html';
            } else if (this.id === 'stats-btn') {
                // تحويل المستخدم إلى صفحة تعرف علينا
                window.location.href = 'news.html';
            } else if (this.id === 'profile-btn') {
                // عرض تنبيه للمستخدم بضرورة تسجيل الدخول أولاً
                showNotification('عليك الدخول أولاً لإظهار بيانات الاشتراك', 'warning');
            }
        });
    });
    
    // زر إغلاق النافذة المنبثقة
    const closeBtns = document.querySelectorAll('.close-btn');
    closeBtns.forEach(btn => {
        btn.addEventListener('click', function() {
            const modal = this.closest('.modal');
            modal.style.display = 'none';
        });
    });
}

// عرض النافذة المنبثقة
function showModal(modalId) {
    const modal = document.getElementById(modalId);
    if (modal) {
        modal.style.display = 'flex';
    }
}
