// تهيئة صفحة تعرف علينا
document.addEventListener('DOMContentLoaded', function() {
    // إضافة أحداث للأزرار
    setupButtonEvents();
    
    // إضافة أحداث للأسئلة والأجوبة
    setupFaqItems();
});

// إعداد أحداث الأزرار
function setupButtonEvents() {
    // أزرار شريط الأدوات السفلي
    const footerBtns = document.querySelectorAll('.footer-btn');
    footerBtns.forEach(btn => {
        btn.addEventListener('click', function() {
            footerBtns.forEach(b => b.classList.remove('active'));
            this.classList.add('active');
            
            // تحويل المستخدم إلى الصفحة المناسبة
            if (this.id === 'home-btn') {
                window.location.href = 'hack.html';
            } else if (this.id === 'premium-btn') {
                window.location.href = 'support.html';
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
}

// إعداد الأسئلة والأجوبة التفاعلية
function setupFaqItems() {
    // إضافة أحداث النقر للأسئلة
    const faqQuestions = document.querySelectorAll('.faq-question');
    
    // إخفاء جميع الإجابات ما عدا الأولى
    const faqAnswers = document.querySelectorAll('.faq-answer');
    for (let i = 1; i < faqAnswers.length; i++) {
        faqAnswers[i].style.display = 'none';
    }
    
    // إضافة أيقونة السهم للأسئلة
    faqQuestions.forEach((question, index) => {
        // إضافة أيقونة السهم
        const arrow = document.createElement('i');
        arrow.className = index === 0 ? 'fas fa-chevron-up' : 'fas fa-chevron-down';
        arrow.style.marginRight = 'auto';
        arrow.style.color = 'var(--primary-blue)';
        question.appendChild(arrow);
        
        // إضافة حدث النقر
        question.addEventListener('click', function() {
            const answer = this.nextElementSibling;
            const arrowIcon = this.querySelector('.fa-chevron-up, .fa-chevron-down');
            
            // تبديل عرض الإجابة
            if (answer.style.display === 'none' || answer.style.display === '') {
                answer.style.display = 'block';
                arrowIcon.className = 'fas fa-chevron-up';
            } else {
                answer.style.display = 'none';
                arrowIcon.className = 'fas fa-chevron-down';
            }
        });
    });
    
    // جعل السؤال الأول مفتوحاً افتراضياً
    if (faqQuestions.length > 0) {
        faqAnswers[0].style.display = 'block';
    }
}
