// التحقق من حالة التفعيل عند تحميل الصفحة
document.addEventListener('DOMContentLoaded', function() {
    checkPremiumStatus();
    
    // إضافة مستمعي الأحداث للمزايا المدفوعة
    setupPremiumFeatureListeners();
});

// التحقق من حالة التفعيل
function checkPremiumStatus() {
    const isPremiumActivated = localStorage.getItem('psh4x_premium_activated') === 'true';
    const isFirstActivation = localStorage.getItem('psh4x_first_activation') !== 'done';
    const wasLoggedOut = localStorage.getItem('psh4x_logged_out') === 'true';
    const prevLoginStatus = localStorage.getItem('psh4x_logged_in');
    const prevPremiumStatus = localStorage.getItem('psh4x_premium');
    
    // تحديث حالة تسجيل الدخول والحساب المدفوع
    if (isPremiumActivated) {
        // تعيين حالة تسجيل الدخول والحساب المدفوع
        localStorage.setItem('psh4x_logged_in', 'true');
        localStorage.setItem('psh4x_premium', 'true');
        
        console.log('تم تفعيل النسخة المدفوعة');
        
        // إلغاء تعطيل جميع المزايا المدفوعة للسماح بتفعيلها وإلغائها بحرية
        const premiumFeatures = document.querySelectorAll('.feature-toggle input[type="checkbox"]');
        
        // إذا كان هذا أول تفعيل للنسخة المدفوعة أو كان المستخدم قد سجل الخروج مسبقاً
        if (isFirstActivation || wasLoggedOut) {
            // إطفاء جميع الميزات افتراضياً
            premiumFeatures.forEach(feature => {
                feature.disabled = false;
                feature.checked = false;
                
                // حفظ حالة الميزة في localStorage
                const featureId = feature.id;
                localStorage.setItem(`psh4x_feature_${featureId}`, 'false');
            });
            
            // تسجيل أن التفعيل الأول تم وإزالة حالة تسجيل الخروج
            localStorage.setItem('psh4x_first_activation', 'done');
            localStorage.removeItem('psh4x_logged_out');
        } else {
            // إلغاء تعطيل الميزات فقط واستعادة حالتها المحفوظة
            premiumFeatures.forEach(feature => {
                feature.disabled = false;
                
                // استعادة حالة الميزة من localStorage إن وجدت
                const featureId = feature.id;
                const featureState = localStorage.getItem(`psh4x_feature_${featureId}`);
                if (featureState !== null) {
                    feature.checked = featureState === 'true';
                } else {
                    // إذا لم تكن هناك حالة محفوظة، اجعلها غير مفعلة
                    feature.checked = false;
                    localStorage.setItem(`psh4x_feature_${featureId}`, 'false');
                }
            });
        }
        
        // إخفاء علامات "مدفوع"
        const premiumBadges = document.querySelectorAll('.premium-badge');
        premiumBadges.forEach(badge => {
            badge.style.display = 'none';
        });
        
        // تغيير الأزرار المقفلة
        const lockedButtons = document.querySelectorAll('.locked-feature');
        lockedButtons.forEach(button => {
            button.classList.remove('locked-feature');
            button.disabled = false;
        });
    } else {
        console.log('النسخة المجانية');
        
        // تعطيل المزايا المدفوعة
        const premiumFeatures = document.querySelectorAll('.feature-toggle input[type="checkbox"]');
        premiumFeatures.forEach(feature => {
            if (feature.closest('.feature-toggle').querySelector('.premium-badge')) {
                feature.disabled = true;
                feature.checked = false;
            }
        });
        
        // تعيين حالة الحساب المجاني إذا لم يتم تسجيل الخروج يدويًا
        if (!wasLoggedOut) {
            localStorage.setItem('psh4x_premium', 'false');
        }
    }
    
    // إرسال الأحداث للإشارة إلى تغيير حالة تسجيل الدخول والحساب المدفوع
    const currentLoginStatus = localStorage.getItem('psh4x_logged_in');
    const currentPremiumStatus = localStorage.getItem('psh4x_premium');
    
    // إرسال حدث للإشارة إلى تغيير حالة تسجيل الدخول
    if (prevLoginStatus !== currentLoginStatus) {
        const loginStatusEvent = new CustomEvent('login_status_changed', {
            detail: { isLoggedIn: currentLoginStatus === 'true' }
        });
        window.dispatchEvent(loginStatusEvent);
    }
    
    // إرسال حدث للإشارة إلى تغيير حالة الحساب المدفوع
    if (prevPremiumStatus !== currentPremiumStatus) {
        const premiumStatusEvent = new CustomEvent('premium_status_changed', {
            detail: { isPremium: currentPremiumStatus === 'true' }
        });
        window.dispatchEvent(premiumStatusEvent);
    }
}

// إضافة مستمعي الأحداث للمزايا المدفوعة
function setupPremiumFeatureListeners() {
    const premiumFeatures = document.querySelectorAll('.feature-toggle input[type="checkbox"]');
    
    premiumFeatures.forEach(feature => {
        feature.addEventListener('change', function() {
            // حفظ حالة الميزة في localStorage
            const featureId = this.id;
            localStorage.setItem(`psh4x_feature_${featureId}`, this.checked ? 'true' : 'false');
        });
        
        // استعادة حالة الميزة من localStorage
        const featureId = feature.id;
        const featureState = localStorage.getItem(`psh4x_feature_${featureId}`);
        
        if (featureState !== null && !feature.disabled) {
            feature.checked = featureState === 'true';
        }
    });
}
