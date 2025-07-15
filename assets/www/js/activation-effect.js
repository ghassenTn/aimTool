// وظيفة تأثير التفعيل
function showActivationEffect() {
    // إنشاء عنصر التأثير
    const effectOverlay = document.createElement('div');
    effectOverlay.className = 'activation-effect-overlay';
    
    // إنشاء عنصر الرسالة
    const messageContainer = document.createElement('div');
    messageContainer.className = 'activation-message-container';
    
    // إضافة أيقونة التحميل
    const loader = document.createElement('div');
    loader.className = 'activation-loader';
    messageContainer.appendChild(loader);
    
    // إضافة النص
    const message = document.createElement('div');
    message.className = 'activation-message';
    message.textContent = 'جاري التفعيل...';
    messageContainer.appendChild(message);
    
    // إضافة العناصر إلى الصفحة
    effectOverlay.appendChild(messageContainer);
    document.body.appendChild(effectOverlay);
    
    // تحديث النص بعد فترة
    setTimeout(() => {
        message.textContent = 'جاري تحويلك للنسخة المدفوعة...';
        loader.style.borderTopColor = '#00ff00';
    }, 1500);
    
    // إظهار رسالة النجاح بعد فترة
    setTimeout(() => {
        messageContainer.innerHTML = `
            <i class="fas fa-check-circle activation-success-icon"></i>
            <div class="activation-message">تم تفعيل النسخة بنجاح!</div>
            <div class="activation-submessage">أنت الآن لديك خطة برو</div>
        `;
        
        // تفعيل المزايا المدفوعة
        activatePremiumFeatures();
    }, 3000);
    
    // إزالة التأثير بعد فترة
    setTimeout(() => {
        effectOverlay.classList.add('fade-out');
        setTimeout(() => {
            effectOverlay.remove();
            // إغلاق نافذة تسجيل الدخول
            document.getElementById('login-modal').style.display = 'none';
            
            // تطبيق تغيير زر الدخول إلى زر الخروج مباشرة
            changeLoginButtonToLogout();
        }, 1000);
    }, 5000);
}

// وظيفة تفعيل المزايا المدفوعة
function activatePremiumFeatures() {
    // تخزين حالة التفعيل في localStorage
    localStorage.setItem('psh4x_premium_activated', 'true');
    localStorage.setItem('psh4x_logged_in', 'true');
    localStorage.setItem('psh4x_premium', 'true');
    
    // إطلاق حدث تفعيل النسخة المدفوعة لإظهار زر تشغيل الهاك
    const premiumActivatedEvent = new Event('premium_activated');
    window.dispatchEvent(premiumActivatedEvent);
    
    // التحقق مما إذا كان المستخدم قد سجل الخروج مسبقاً أو كان هذا أول تفعيل
    const wasLoggedOut = localStorage.getItem('psh4x_logged_out') === 'true';
    const isFirstActivation = localStorage.getItem('psh4x_first_activation') !== 'done';
    
    // إلغاء تعطيل جميع المزايا المدفوعة
    const premiumFeatures = document.querySelectorAll('.feature-toggle input[type="checkbox"]');
    
    // إذا كان المستخدم قد سجل الخروج مسبقاً أو كان هذا أول تفعيل
    if (wasLoggedOut || isFirstActivation) {
        // إعادة تعيين جميع الميزات إلى غير مفعلة
        premiumFeatures.forEach(feature => {
            // إلغاء تعطيل الميزات فقط دون تفعيلها تلقائياً
            feature.disabled = false;
            feature.checked = false;
            
            // إعادة تعيين حالة جميع الميزات إلى غير مفعلة
            const featureId = feature.id;
            localStorage.setItem(`psh4x_feature_${featureId}`, 'false');
        });
        
        // إعادة تعيين الحالات
        localStorage.setItem('psh4x_first_activation', 'done');
        localStorage.removeItem('psh4x_logged_out');
    } else {
        // إذا لم يكن المستخدم قد سجل الخروج، فقط قم بإلغاء تعطيل الميزات
        premiumFeatures.forEach(feature => {
            feature.disabled = false;
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
    
    // تغيير أيقونة الدخول إلى أيقونة الخروج بشكل فوري
    // تنفيذ التغيير بشكل مباشر
    setTimeout(function() {
        changeLoginButtonToLogout();
    }, 0);
    
    // إضافة إشعارات التهنئة والتحقق
    setTimeout(function() {
        // التحقق من أن تنبيه التهنئة لم يظهر من قبل
        const congratsNotificationShown = localStorage.getItem('psh4x_congrats_shown');
        
        // إذا لم يظهر تنبيه التهنئة من قبل، قم بإظهاره وتخزين حالته
        if (!congratsNotificationShown) {
            // إشعار التهنئة بالنسخة المدفوعة بدون زر
            const congratsNotification = addNotificationToMenu(
                'تهانينا! 🎉',
                'تم تفعيل النسخة المدفوعة من PSH4X بنجاح',
                'premium'
            );
            
            // تخزين حالة ظهور تنبيه التهنئة
            localStorage.setItem('psh4x_congrats_shown', 'true');
            
            // إضافة مستمع لإغلاق التنبيه عند النقر عليه
            if (congratsNotification) {
                // إضافة مستمع للنقر على كامل التنبيه
                congratsNotification.addEventListener('click', function() {
                    // إزالة التنبيه من القائمة
                    this.remove();
                    // تحديث عدد التنبيهات
                    updateNotificationCount();
                });
                
                // إضافة مستمع للنقر على محتوى التنبيه
                const notificationContent = congratsNotification.querySelector('.notification-content');
                if (notificationContent) {
                    notificationContent.style.cursor = 'pointer';
                    notificationContent.addEventListener('click', function(e) {
                        e.stopPropagation();
                        congratsNotification.remove();
                        updateNotificationCount();
                    });
                }
            }
        }
        
        // إشعار التحقق لتفعيل الهاك
        addNotificationToMenu(
            'تحقق من اللعبة',
            'قم بالتحقق لتفعيل الهاك على اللعبة',
            'warning'
        );
    }, 1000);
}

// وظيفة تغيير أيقونة الدخول إلى أيقونة الخروج
function changeLoginButtonToLogout() {
    // البحث عن زر الدخول في الواجهة
    const loginBtn = document.getElementById('login-btn');
    if (loginBtn) {
        // تغيير الأيقونة إلى أيقونة الخروج
        const icon = loginBtn.querySelector('i');
        if (icon) {
            icon.className = 'fas fa-power-off'; // أيقونة الخروج الجديدة
        }
        
        // إزالة أي نص موجود
        const span = loginBtn.querySelector('span');
        if (span) {
            span.remove();
        }
        
        // تغيير السلوك عند النقر
        loginBtn.onclick = function(e) {
            e.preventDefault();
            e.stopPropagation();
            // تنفيذ وظيفة تسجيل الخروج
            logoutUser();
            return false;
        };
        
        // إضافة فئة جديدة للتمييز
        loginBtn.classList.add('logout-btn');
        loginBtn.title = 'خروج'; // إضافة تلميح عند تمرير المؤشر
    }
    
    // البحث عن أي أزرار دخول أخرى
    const otherLoginButtons = document.querySelectorAll('.login-btn, .nav-login-btn');
    otherLoginButtons.forEach(button => {
        if (button !== loginBtn) {
            // تغيير الأيقونة
            const icon = button.querySelector('i');
            if (icon) {
                icon.className = 'fas fa-power-off'; // أيقونة الخروج الجديدة
            }
            
            // إزالة أي نص
            const span = button.querySelector('span');
            if (span) {
                span.remove();
            }
            
            // تغيير السلوك عند النقر
            button.onclick = function(e) {
                e.preventDefault();
                e.stopPropagation();
                // تنفيذ وظيفة تسجيل الخروج
                logoutUser();
                return false;
            };
            
            // إضافة فئة جديدة للتمييز
            button.classList.add('logout-btn');
            button.classList.remove('login-btn');
            button.title = 'خروج'; // إضافة تلميح عند تمرير المؤشر
        }
    });
    
    // إخفاء زر تفعيل PSH4X في القائمة المنسدلة
    const activateButtons = document.querySelectorAll('.activate-btn, .trial-btn');
    activateButtons.forEach(button => {
        button.style.display = 'none';
    });
}

// وظيفة تسجيل الخروج
function logoutUser() {
    // حفظ معلومات أن المستخدم قام بتسجيل الخروج عمداً
    localStorage.setItem('psh4x_logged_out', 'true');
    
    // حذف حالة التفعيل من localStorage
    localStorage.removeItem('psh4x_premium_activated');
    localStorage.removeItem('psh4x_logged_in');
    localStorage.removeItem('psh4x_premium');
    
    // إخفاء زر تشغيل الهاك قبل إعادة تحميل الصفحة
    const launchHackContainer = document.querySelector('.launch-hack-container');
    if (launchHackContainer) {
        launchHackContainer.style.display = 'none';
    }
    
    // إطلاق حدث إلغاء تفعيل النسخة المدفوعة
    const premiumDeactivatedEvent = new Event('premium_deactivated');
    window.dispatchEvent(premiumDeactivatedEvent);
    
    // إعادة تحميل الصفحة
    setTimeout(function() {
        location.reload();
    }, 500); // انتظار نصف ثانية للتأكد من تنفيذ التغييرات قبل إعادة التحميل
}

// محاكاة نشاط الهاك
function simulateHackActivity() {
    showNotification('جاري تشغيل الهاك...', 'info');
    
    // تغيير حالة الاتصال باللعبة
    setTimeout(function() {
        const statusItems = document.querySelectorAll('.status-item');
        if (statusItems.length >= 2) {
            statusItems[1].classList.add('connected');
            statusItems[1].querySelector('.status-text').textContent = 'الحماية نشطة ومتصلة';
        }
        
        showNotification('تم الاتصال بلعبة 8 Ball Pool بنجاح', 'success');
    }, 1500);
}

// التحقق من حالة التفعيل عند تحميل الصفحة
document.addEventListener('DOMContentLoaded', function() {
    if (localStorage.getItem('psh4x_premium_activated') === 'true') {
        // تفعيل المزايا المدفوعة
        activatePremiumFeatures();
    }
});

// إضافة CSS للتأثير
const activationStyle = document.createElement('style');
activationStyle.textContent = `
    .activation-effect-overlay {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.9);
        z-index: 9999;
        display: flex;
        justify-content: center;
        align-items: center;
        opacity: 1;
        transition: opacity 1s ease;
    }
    
    .activation-effect-overlay.fade-out {
        opacity: 0;
    }
    
    .activation-message-container {
        text-align: center;
        color: white;
    }
    
    .activation-loader {
        border: 5px solid rgba(0, 183, 255, 0.3);
        border-top: 5px solid #00b7ff;
        border-radius: 50%;
        width: 50px;
        height: 50px;
        animation: spin 1s linear infinite;
        margin: 0 auto 20px;
    }
    
    @keyframes spin {
        0% { transform: rotate(0deg); }
        100% { transform: rotate(360deg); }
    }
    
    .activation-message {
        font-size: 24px;
        margin-bottom: 10px;
        font-weight: bold;
    }
    
    .activation-submessage {
        font-size: 18px;
        opacity: 0.8;
    }
    
    .activation-success-icon {
        font-size: 60px;
        color: #00ff00;
        margin-bottom: 20px;
        animation: pulse 1.5s infinite;
    }
    
    @keyframes pulse {
        0% { transform: scale(1); }
        50% { transform: scale(1.1); }
        100% { transform: scale(1); }
    }
`;

document.head.appendChild(activationStyle);
