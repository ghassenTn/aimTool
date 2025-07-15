// وظيفة تشغيل الهاك
document.addEventListener('DOMContentLoaded', function() {
    console.log('تهيئة زر تشغيل الهاك...');
    
    // التأكد من إخفاء زر تشغيل الهاك بشكل افتراضي
    const launchHackContainer = document.querySelector('.launch-hack-container');
    if (launchHackContainer) {
        // إخفاء الزر بشكل افتراضي بغض النظر عن القيمة في HTML
        launchHackContainer.style.display = 'none';
    }
    
    // التحقق من حالة تسجيل الدخول والتفعيل
    setTimeout(function() {
        checkPremiumActivation();
    }, 500); // تأخير للتأكد من تحميل جميع المكونات
    
    // الحصول على زر تشغيل الهاك
    const launchHackBtn = document.getElementById('launch-hack-btn');
    if (launchHackBtn) {
        // إضافة تأثير نبض للزر عند تحميل الصفحة (فقط إذا كان ظاهراً)
        setTimeout(function() {
            if (isPremiumUser() && launchHackContainer && launchHackContainer.style.display === 'flex') {
                launchHackBtn.classList.add('pulse');
                console.log('تم تفعيل تأثير النبض لزر تشغيل الهاك');
            }
        }, 1500);
        
        // إضافة مستمع للنقر على زر تشغيل الهاك
        launchHackBtn.addEventListener('click', function() {
            // تغيير حالة الزر لإظهار أنه قيد التشغيل
            launchHackBtn.classList.add('active');
            launchHackBtn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> <span>جاري التشغيل...</span>';
            
            // محاكاة وقت التحميل
            setTimeout(function() {
                // إظهار إشعار نجاح تشغيل الهاك
                showHackActivationNotification();
                
                // إظهار الشعار العائم
                if (window.floatingLogo && typeof window.floatingLogo.show === 'function') {
                    window.floatingLogo.show();
                    console.log('تم إظهار الشعار العائم');
                } else {
                    console.error('لم يتم العثور على وظيفة الشعار العائم');
                }
                
                // إعادة الزر إلى حالته الأصلية بعد فترة
                setTimeout(function() {
                    launchHackBtn.classList.remove('active');
                    launchHackBtn.innerHTML = '<i class="fas fa-rocket"></i> <span>تشغيل الهاك</span>';
                }, 3000);
            }, 2000);
        });
    }
});

// وظيفة محاكاة نشاط الهاك (إذا لم تكن موجودة بالفعل)
if (typeof simulateHackActivity !== 'function') {
    function simulateHackActivity() {
        // إظهار إشعارات متتالية لمحاكاة تشغيل الهاك
        setTimeout(function() {
            showNotification('جاري التحقق من اللعبة...', 'info');
        }, 1000);
        
        setTimeout(function() {
            showNotification('تم التحقق بنجاح!', 'success');
        }, 2500);
        
        setTimeout(function() {
            showNotification('جاري تحميل الهاك...', 'info');
        }, 3500);
        
        setTimeout(function() {
            showNotification('تم تشغيل الهاك بنجاح!', 'success');
            
            // تحديث حالة الهاك في واجهة المستخدم
            updateHackStatus(true);
        }, 5000);
    }
}

// وظيفة للتحقق ما إذا كان المستخدم يملك نسخة مدفوعة
function isPremiumUser() {
    // التحقق من حالة تسجيل الدخول والنسخة المدفوعة من localStorage
    const isLoggedIn = localStorage.getItem('psh4x_logged_in') === 'true';
    const isPremium = localStorage.getItem('psh4x_premium') === 'true';
    const isLoggedOut = localStorage.getItem('psh4x_logged_out') === 'true';
    const isAppClosed = localStorage.getItem('psh4x_app_closed') === 'true';
    const isPremiumActivated = localStorage.getItem('psh4x_premium_activated') === 'true';
    
    // التحقق من جميع الشروط
    // يجب أن يكون المستخدم مسجل دخوله ولديه نسخة مدفوعة ولم يقم بتسجيل الخروج
    return isLoggedIn && (isPremium || isPremiumActivated) && !isLoggedOut;
}

// وظيفة التحقق من حالة تفعيل النسخة المدفوعة
function checkPremiumActivation() {
    // الحصول على حاوية زر تشغيل الهاك
    const launchHackContainer = document.querySelector('.launch-hack-container');
    if (!launchHackContainer) {
        console.error('لم يتم العثور على حاوية زر تشغيل الهاك');
        return;
    }
    
    // التحقق من حالة المستخدم
    if (isPremiumUser()) {
        // إظهار زر تشغيل الهاك فقط للمستخدمين المدفوعين
        launchHackContainer.style.display = 'flex';
        console.log('تم تفعيل زر تشغيل الهاك للمستخدم المدفوع');
    } else {
        // إخفاء زر تشغيل الهاك للمستخدمين غير المدفوعين
        launchHackContainer.style.display = 'none';
        console.log('زر تشغيل الهاك غير متاح - يتطلب تفعيل النسخة المدفوعة');
    }
}

// إضافة مستمع للتغييرات في حالة تسجيل الدخول
window.addEventListener('premium_activated', function() {
    console.log('تم استلام حدث تفعيل النسخة المدفوعة');
    
    // تأخير بسيط للتأكد من تحديث الـ localStorage قبل التحقق
    setTimeout(function() {
        // تحديث حالة زر تشغيل الهاك عند تفعيل النسخة المدفوعة
        checkPremiumActivation();
        
        // إضافة تأثير النبض للزر بعد إظهاره
        const launchHackBtn = document.getElementById('launch-hack-btn');
        if (launchHackBtn && isPremiumUser()) {
            launchHackBtn.classList.add('pulse');
        }
        
        console.log('تم تفعيل النسخة المدفوعة - إظهار زر تشغيل الهاك');
    }, 300);
});

// إضافة مستمع للتغييرات في حالة إلغاء تفعيل النسخة المدفوعة
window.addEventListener('premium_deactivated', function() {
    console.log('تم استلام حدث إلغاء تفعيل النسخة المدفوعة');
    
    // إخفاء زر تشغيل الهاك فوراً عند إلغاء تفعيل النسخة المدفوعة
    const launchHackContainer = document.querySelector('.launch-hack-container');
    if (launchHackContainer) {
        launchHackContainer.style.display = 'none';
        console.log('تم إخفاء زر تشغيل الهاك');
    }
    
    // إزالة تأثير النبض من الزر
    const launchHackBtn = document.getElementById('launch-hack-btn');
    if (launchHackBtn) {
        launchHackBtn.classList.remove('pulse');
    }
    
    console.log('تم إلغاء تفعيل النسخة المدفوعة - إخفاء زر تشغيل الهاك');
});

// وظيفة إظهار إشعار تفعيل الهاك
function showHackActivationNotification() {
    // إظهار إشعار واحد فقط بنجاح تشغيل الهاك
    showNotification('تم تشغيل الهاك بنجاح!', 'success');
}

// وظيفة إظهار إشعار بحالة الهاك
function showHackNotification(status, type = 'success') {
    // إظهار إشعار بحالة الهاك
    showNotification(status, type);
}

// وظيفة تحديث حالة الهاك في واجهة المستخدم
function updateHackStatus(isActive) {
    // تحديث أيقونة الزر
    const launchHackBtn = document.getElementById('launch-hack-btn');
    if (!launchHackBtn) return;
    
    const iconElement = launchHackBtn.querySelector('i');
    const textElement = launchHackBtn.querySelector('span');
    
    if (isActive) {
        // تغيير الأيقونة والنص عند تفعيل الهاك
        iconElement.className = 'fas fa-stop';
        textElement.textContent = 'إيقاف الهاك';
        launchHackBtn.classList.add('active');
    } else {
        // إعادة الأيقونة والنص إلى الحالة الأصلية
        iconElement.className = 'fas fa-rocket';
        textElement.textContent = 'تشغيل الهاك';
        launchHackBtn.classList.remove('active');
    }
}
