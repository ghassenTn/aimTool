// تهيئة صفحة الهاك
document.addEventListener('DOMContentLoaded', function() {
    // إضافة أحداث للأزرار
    setupButtonEvents();
    
    // إضافة أحداث للمفاتيح التبديلية
    setupToggleSwitches();
    
    // إضافة أحداث لشريط التمرير
    setupSliders();
    
    // التحقق من حالة ميزات التصويب عند تحميل الصفحة
    checkAimingFeaturesState();
    
    // محاكاة نشاط الهاك
    simulateHackActivity();
});

// إعداد أحداث الأزرار
function setupButtonEvents() {
    // أزرار شريط التنقل العلوي
    const loginBtn = document.getElementById('login-btn');
    loginBtn.addEventListener('click', function() {
        // التحقق من حالة تسجيل الدخول
        const isLoggedIn = localStorage.getItem('psh4x_logged_in') === 'true';
        const isPremium = localStorage.getItem('psh4x_premium') === 'true';
        
        if (isLoggedIn && isPremium) {
            // إذا كان المستخدم مسجل دخوله بالفعل، اسأله إذا كان يريد تسجيل الخروج
            if (confirm('هل ترغب في تسجيل الخروج من الحساب المدفوع؟')) {
                // تسجيل الخروج
                localStorage.setItem('psh4x_logged_in', 'false');
                localStorage.setItem('psh4x_premium', 'false');
                localStorage.setItem('psh4x_logged_out', 'true');
                localStorage.setItem('psh4x_floating_logo_visible', 'false');
                
                // إخفاء الشعار العائم
                if (window.floatingLogo && typeof window.floatingLogo.hide === 'function') {
                    window.floatingLogo.hide();
                }
                
                // إرسال حدث للإشارة إلى تغيير حالة تسجيل الدخول
                const loginStatusEvent = new CustomEvent('login_status_changed', {
                    detail: { isLoggedIn: false }
                });
                window.dispatchEvent(loginStatusEvent);
                
                // إرسال حدث للإشارة إلى تغيير حالة الحساب المدفوع
                const premiumStatusEvent = new CustomEvent('premium_status_changed', {
                    detail: { isPremium: false }
                });
                window.dispatchEvent(premiumStatusEvent);
                
                // إظهار إشعار للمستخدم
                showNotification('تم تسجيل الخروج من الحساب المدفوع', 'info');
                
                // تحديث نص الزر وأيقونته
                loginBtn.innerHTML = '<i class="fas fa-sign-in-alt"></i>';
                
                // تحديث الواجهة لإظهار الميزات المدفوعة كمقفلة
                checkAimingFeaturesState();
            }
        } else {
            // إذا لم يكن المستخدم مسجل دخوله، أظهر نافذة تسجيل الدخول
            showModal('login-modal');
        }
    });
    
    // تحديث أيقونة زر تسجيل الدخول عند تحميل الصفحة
    const isLoggedIn = localStorage.getItem('psh4x_logged_in') === 'true';
    const isPremium = localStorage.getItem('psh4x_premium') === 'true';
    if (isLoggedIn && isPremium) {
        loginBtn.innerHTML = '<i class="fas fa-sign-out-alt"></i>';
    } else {
        loginBtn.innerHTML = '<i class="fas fa-sign-in-alt"></i>';
    }
    
    // زر تعرف علينا
    document.getElementById('stats-btn').addEventListener('click', function() {
        window.location.href = 'news.html';
    });
    
    // زر التنبيهات
    document.getElementById('notification-btn').addEventListener('click', function(e) {
        e.stopPropagation(); // منع انتشار الحدث
        const dropdown = document.querySelector('.notification-dropdown');
        dropdown.classList.toggle('show');
    });
    
    // إغلاق قائمة التنبيهات عند النقر في أي مكان آخر
    document.addEventListener('click', function(e) {
        const dropdown = document.querySelector('.notification-dropdown');
        const notificationBtn = document.getElementById('notification-btn');
        
        if (dropdown.classList.contains('show') && e.target !== notificationBtn && !notificationBtn.contains(e.target) && !dropdown.contains(e.target)) {
            dropdown.classList.remove('show');
        }
    });
    
    // أزرار شريط الأدوات السفلي
    const footerBtns = document.querySelectorAll('.footer-btn');
    footerBtns.forEach(btn => {
        btn.addEventListener('click', function() {
            footerBtns.forEach(b => b.classList.remove('active'));
            this.classList.add('active');
            
            // تحويل المستخدم إلى الصفحة المناسبة
            if (this.id === 'premium-btn') {
                window.location.href = 'support.html';
            } else if (this.id === 'home-btn') {
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
    
    // زر اللصق التلقائي
    const pasteBtn = document.getElementById('paste-btn');
    if (pasteBtn) {
        pasteBtn.addEventListener('click', async function() {
            try {
                const text = await navigator.clipboard.readText();
                const activationKeyInput = document.getElementById('activation-key');
                activationKeyInput.value = formatActivationKey(text);
                showNotification('تم لصق المفتاح بنجاح', 'success');
            } catch (err) {
                showNotification('لا يمكن الوصول إلى الحافظة', 'error');
                console.error('فشل في الوصول إلى الحافظة: ', err);
            }
        });
    }
    
    // تنسيق مفتاح التفعيل أثناء الكتابة
    const activationKeyInput = document.getElementById('activation-key');
    if (activationKeyInput) {
        activationKeyInput.addEventListener('input', function(e) {
            let value = e.target.value;
            
            // إزالة أي حروف غير الأحرف الإنجليزية والأرقام
            value = value.replace(/[^A-Za-z0-9-]/g, '');
            
            // تحويل الأحرف إلى كابتل
            value = value.toUpperCase();
            
            // تنسيق المفتاح بإضافة الشرطات
            value = formatActivationKey(value);
            
            // تحديث قيمة الحقل
            e.target.value = value;
        });
    }
    
    // وظيفة تنسيق مفتاح التفعيل
    function formatActivationKey(key) {
        // إزالة الشرطات والمسافات وأي حروف غير الأحرف الإنجليزية والأرقام
        let cleanKey = key.replace(/[^A-Za-z0-9]/g, '').toUpperCase();
        
        // تحديد الحد الأقصى للمفتاح (20 حرف بدون الشرطات)
        cleanKey = cleanKey.substring(0, 20);
        
        // إضافة الشرطات بعد كل 5 أحرف
        let formattedKey = '';
        for (let i = 0; i < cleanKey.length; i++) {
            if (i > 0 && i % 5 === 0 && i < 20) {
                formattedKey += '-';
            }
            formattedKey += cleanKey[i];
        }
        
        return formattedKey;
    }
    
    // وظيفة التحقق من صحة المفتاح
    function validateActivationKey(key) {
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
        
        // التحقق من وجود قيمة
        if (!key) {
            return { valid: false, message: 'الحقل فارغ. الرجاء إدخال مفتاح التفعيل' };
        }
        
        // إزالة الشرطات للتحقق من الطول
        const cleanKey = key.replace(/-/g, '');
        
        // التحقق من طول المفتاح
        if (cleanKey.length < 20) {
            return { valid: false, message: 'الرجاء إكمال إدخال مفتاح التفعيل بالكامل' };
        }
        
        // التحقق من أن المفتاح يبدأ بـ PSH4X
        if (!cleanKey.startsWith('PSH4X')) {
            return { valid: false, message: 'مفتاح التفعيل غير صالح. تأكد من المفتاح أو تواصل مع البائع' };
        }
        
        // التحقق من أن المفتاح من ضمن المفاتيح الصالحة
        if (validKeys.includes(key)) {
            return { valid: true, message: 'تم التحقق من المفتاح بنجاح' };
        }
        
        // إذا لم يكن المفتاح من ضمن المفاتيح الصالحة
        return { valid: false, message: 'مفتاح التفعيل غير صالح. تأكد من المفتاح أو تواصل مع البائع' };
    }

    // زر التفعيل
    const activateBtn = document.getElementById('login-submit');
    if (activateBtn) {
        activateBtn.addEventListener('click', function() {
            const activationKeyInput = document.getElementById('activation-key');
            const key = activationKeyInput.value;
            
            // التحقق من صحة المفتاح
            const validation = validateActivationKey(key);
            
            if (!validation.valid) {
                showNotification(validation.message, 'error');
                activationKeyInput.classList.add('error');
                setTimeout(() => {
                    activationKeyInput.classList.remove('error');
                }, 2000);
            } else {
                // إظهار تأثير التفعيل
                showActivationEffect();
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
    
    // زر حفظ الإعدادات
    document.getElementById('save-settings').addEventListener('click', function() {
        const modal = document.getElementById('settings-modal');
        modal.style.display = 'none';
        
        // محاكاة حفظ الإعدادات
        showNotification('تم حفظ الإعدادات بنجاح!');
    });
}

// إعداد مفاتيح التبديل
function setupToggleSwitches() {
    const toggles = document.querySelectorAll('.feature-toggle input[type="checkbox"]');
    
    // معرفات ميزات التصويب الثلاث
    const aimingFeatures = ['aim-assist', 'perfect-shot', 'trajectory'];
    
    // معرفات ميزات تخصيص العرض
    const displayFeatures = ['always-win', 'unlimited-time', 'anti-ban'];
    
    // معرفات ميزات التسجيل
    const recordingFeatures = ['custom-cues', 'custom-tables'];
    
    toggles.forEach(toggle => {
        toggle.addEventListener('change', function() {
            const featureName = this.closest('.feature-toggle').querySelector('.feature-name').textContent;
            const featureId = this.id;
            
            // التحقق من حالة التفعيل في النسخة المدفوعة
            const isPremiumActivated = localStorage.getItem('psh4x_premium_activated') === 'true';
            const isPremiumFeature = this.closest('.feature-toggle').querySelector('.premium-badge');
            
            if (this.checked) {
                // إذا كانت ميزة مدفوعة والنسخة غير مفعلة
                if (isPremiumFeature && !isPremiumActivated) {
                    this.checked = false;
                    showNotification('هذه الميزة متاحة فقط في النسخة المدفوعة', 'warning');
                } else {
                    // التحقق مما إذا كانت ميزة تصويب
                    if (aimingFeatures.includes(featureId)) {
                        // إلغاء تفعيل ميزات التصويب الأخرى
                        aimingFeatures.forEach(id => {
                            if (id !== featureId) {
                                const otherFeature = document.getElementById(id);
                                if (otherFeature && otherFeature.checked) {
                                    otherFeature.checked = false;
                                    const otherFeatureName = otherFeature.closest('.feature-toggle').querySelector('.feature-name').textContent;
                                    showNotification(`تم إيقاف ${otherFeatureName} تلقائياً`, 'info');
                                    // حفظ حالة الميزة في localStorage
                                    localStorage.setItem(`psh4x_feature_${id}`, 'false');
                                }
                            }
                        });
                    }
                    // التحقق مما إذا كانت ميزة تخصيص العرض
                    else if (displayFeatures.includes(featureId)) {
                        // إلغاء تفعيل ميزات تخصيص العرض الأخرى
                        displayFeatures.forEach(id => {
                            if (id !== featureId) {
                                const otherFeature = document.getElementById(id);
                                if (otherFeature && otherFeature.checked) {
                                    otherFeature.checked = false;
                                    const otherFeatureName = otherFeature.closest('.feature-toggle').querySelector('.feature-name').textContent;
                                    showNotification(`تم إيقاف ${otherFeatureName} تلقائياً`, 'info');
                                    // حفظ حالة الميزة في localStorage
                                    localStorage.setItem(`psh4x_feature_${id}`, 'false');
                                }
                            }
                        });
                    }
                    // التحقق مما إذا كانت ميزة تسجيل
                    else if (recordingFeatures.includes(featureId)) {
                        // إلغاء تفعيل ميزات التسجيل الأخرى
                        recordingFeatures.forEach(id => {
                            if (id !== featureId) {
                                const otherFeature = document.getElementById(id);
                                if (otherFeature && otherFeature.checked) {
                                    otherFeature.checked = false;
                                    const otherFeatureName = otherFeature.closest('.feature-toggle').querySelector('.feature-name').textContent;
                                    showNotification(`تم إيقاف ${otherFeatureName} تلقائياً`, 'info');
                                    // حفظ حالة الميزة في localStorage
                                    localStorage.setItem(`psh4x_feature_${id}`, 'false');
                                }
                            }
                        });
                    }
                    
                    // السماح بالتفعيل في النسخة المدفوعة أو للميزات المجانية
                    showNotification(`تم تفعيل ${featureName}`);
                    
                    // حفظ حالة الميزة في localStorage
                    localStorage.setItem(`psh4x_feature_${featureId}`, 'true');
                }
            } else {
                showNotification(`تم إيقاف ${featureName}`);
                
                // حفظ حالة الميزة في localStorage
                localStorage.setItem(`psh4x_feature_${featureId}`, 'false');
            }
            
            // محاكاة تأثيرات الهاك (في الإصدار الكامل سيتم تنفيذ هذه الوظيفة)
        });
    });
}

// إعداد أشرطة التمرير
function setupSliders() {
    const aimPower = document.getElementById('aim-power');
    const aimPowerValue = document.getElementById('aim-power-value');
    
    aimPower.addEventListener('input', function() {
        aimPowerValue.textContent = this.value + '%';
    });
    
    // منتقي الألوان
    const trajectoryColor = document.getElementById('trajectory-color');
    trajectoryColor.addEventListener('change', function() {
        showNotification(`تم تغيير لون المسار إلى ${this.value}`);
    });
}

// التحقق من حالة ميزات التصويب وتخصيص العرض والتسجيل عند تحميل الصفحة
function checkAimingFeaturesState() {
    // معرفات ميزات التصويب الثلاث
    const aimingFeatures = ['aim-assist', 'perfect-shot', 'trajectory'];
    
    // معرفات ميزات تخصيص العرض
    const displayFeatures = ['always-win', 'unlimited-time', 'anti-ban'];
    
    // معرفات ميزات التسجيل
    const recordingFeatures = ['custom-cues', 'custom-tables'];
    
    // التحقق من حالة التفعيل في النسخة المدفوعة
    const isPremiumActivated = localStorage.getItem('psh4x_premium_activated') === 'true';
    
    if (isPremiumActivated) {
        // التحقق من ميزات التصويب
        checkExclusiveFeatures(aimingFeatures);
        
        // التحقق من ميزات تخصيص العرض
        checkExclusiveFeatures(displayFeatures);
        
        // التحقق من ميزات التسجيل
        checkExclusiveFeatures(recordingFeatures);
    }
    
    // وظيفة داخلية للتحقق من الميزات الحصرية
    function checkExclusiveFeatures(featuresList) {
        let activeFeatureFound = false;
        let lastActiveFeature = null;
        
        // فحص جميع الميزات في القائمة
        featuresList.forEach(id => {
            const feature = document.getElementById(id);
            const featureState = localStorage.getItem(`psh4x_feature_${id}`) === 'true';
            
            if (feature && featureState) {
                if (!activeFeatureFound) {
                    // السماح بميزة واحدة فقط
                    activeFeatureFound = true;
                    lastActiveFeature = id;
                    feature.checked = true;
                } else {
                    // إلغاء تفعيل الميزات الأخرى
                    feature.checked = false;
                    localStorage.setItem(`psh4x_feature_${id}`, 'false');
                }
            }
        });
    }
}

// محاكاة نشاط الهاك
function simulateHackActivity() {
    // محاكاة اتصال اللعبة
    setTimeout(() => {
        showNotification('تم الاتصال بلعبة 8 Ball Pool بنجاح');
    }, 1500);
    
    // محاكاة تحديثات دورية
    setInterval(() => {
        const randomMessages = [
            'جاري فحص تحديثات اللعبة...',
            'تم تحديث خوارزميات الحماية',
            'تم تجنب كشف الهاك بنجاح',
            'جاري مزامنة البيانات مع الخادم...'
        ];
        
        const randomIndex = Math.floor(Math.random() * randomMessages.length);
        updateStatusText(randomMessages[randomIndex]);
    }, 15000);
}

// إظهار إشعار
function showNotification(message, type = 'info') {
    // إنشاء عنصر الإشعار
    const notification = document.createElement('div');
    notification.className = `notification ${type}`;
    
    // إضافة أيقونة حسب النوع
    let icon = 'info-circle';
    if (type === 'success') icon = 'check-circle';
    if (type === 'warning') icon = 'exclamation-triangle';
    if (type === 'error') icon = 'times-circle';
    
    notification.innerHTML = `
        <i class="fas fa-${icon}"></i>
        <span>${message}</span>
    `;
    
    // إضافة الإشعار إلى الصفحة
    document.body.appendChild(notification);
    
    // إظهار الإشعار بتأثير
    setTimeout(() => {
        notification.classList.add('show');
    }, 10);
    
    // إخفاء الإشعار بعد فترة
    setTimeout(() => {
        notification.classList.remove('show');
        setTimeout(() => {
            notification.remove();
        }, 300);
    }, 3000);
}

// تحديث نص الحالة
function updateStatusText(text) {
    const statusItems = document.querySelectorAll('.status-panel .status-item');
    const randomIndex = Math.floor(Math.random() * statusItems.length);
    
    const statusText = statusItems[randomIndex].querySelector('.status-text');
    const originalText = statusText.textContent;
    
    // تحديث النص
    statusText.textContent = text;
    
    // إعادة النص الأصلي بعد فترة
    setTimeout(() => {
        statusText.textContent = originalText;
    }, 5000);
}

// إظهار النافذة المنبثقة
function showModal(modalId) {
    const modal = document.getElementById(modalId);
    modal.style.display = 'flex';
}

// إضافة CSS للإشعارات
const notificationStyle = document.createElement('style');
notificationStyle.textContent = `
    .notification {
        position: fixed;
        top: 20px;
        left: 50%;
        transform: translateX(-50%) translateY(-100px);
        background-color: rgba(0, 0, 0, 0.8);
        color: white;
        padding: 12px 20px;
        border-radius: 8px;
        display: flex;
        align-items: center;
        gap: 10px;
        z-index: 1000;
        transition: transform 0.3s ease;
        border-left: 3px solid #00b7ff;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
    }
    
    .notification.show {
        transform: translateX(-50%) translateY(0);
    }
    
    .notification.success {
        border-left-color: #00ff00;
    }
    
    .notification.warning {
        border-left-color: #ffcc00;
    }
    
    .notification.error {
        border-left-color: #ff3333;
    }
    
    .notification i {
        color: #00b7ff;
    }
    
    .notification.success i {
        color: #00ff00;
    }
    
    .notification.warning i {
        color: #ffcc00;
    }
    
    .notification.error i {
        color: #ff3333;
    }
`;

document.head.appendChild(notificationStyle);
