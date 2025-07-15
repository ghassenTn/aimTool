// تهيئة صفحة الدعم
document.addEventListener('DOMContentLoaded', function() {
    // إضافة أحداث للأزرار
    setupButtonEvents();
});

// إعداد أحداث الأزرار
function setupButtonEvents() {
    // زر الرجوع
    document.getElementById('back-btn').addEventListener('click', function() {
        window.location.href = 'hack.html';
    });
    
    // زر تسجيل الدخول
    document.getElementById('login-btn').addEventListener('click', function() {
        showModal('login-modal');
    });
    
    document.getElementById('info-btn').addEventListener('click', function() {
        alert('PSH4X\nتطبيق محاكاة هاك 8 Ball Pool\nجميع الميزات آمنة تماماً ولا تؤثر على اللعبة الحقيقية.');
    });
    
    // أزرار شريط الأدوات السفلي
    const footerBtns = document.querySelectorAll('.footer-btn');
    footerBtns.forEach(btn => {
        btn.addEventListener('click', function() {
            footerBtns.forEach(b => b.classList.remove('active'));
            this.classList.add('active');
            
            // تحويل المستخدم إلى الصفحة المناسبة
            if (this.id === 'home-btn') {
                window.location.href = 'hack.html';
            } else if (this.id === 'about-btn') {
                window.location.href = 'news.html';
            } else if (this.id === 'profile-btn') {
                // التحقق من حالة تسجيل الدخول
                const isLoggedIn = localStorage.getItem('psh4x_logged_in') === 'true';
                
                if (isLoggedIn) {
                    // إذا كان المستخدم مسجل الدخول، توجيهه إلى صفحة الحساب
                    window.location.href = 'account.html';
                } else {
                    // إذا لم يكن مسجل الدخول، عرض تنبيه
                    showNotification('عليك الدخول أولاً لإظهار بيانات الاشتراك', 'warning');
                }
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
