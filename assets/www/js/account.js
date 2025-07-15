// ملف JavaScript لصفحة معلومات الحساب

document.addEventListener('DOMContentLoaded', function() {
    // تهيئة مؤشر الأمان
    initSecurityMeter();
    
    // تهيئة أزرار الصفحة
    initAccountButtons();
    
    // تحديث وقت آخر تحديث
    updateLastUpdateTime();
    
    // التحقق من حالة تسجيل الدخول
    checkLoginStatus();
    
    // إعداد أحداث أزرار الشريط السفلي
    setupFooterButtons();
});

// تهيئة مؤشر الأمان مع تغيير واقعي للقيم
function initSecurityMeter() {
    const securityMeterFill = document.getElementById('security-meter-fill');
    const securityPercentage = document.getElementById('security-percentage');
    
    // القيم الممكنة لمؤشر الأمان (بين 94% و 99%)
    const possibleValues = [94, 95, 96, 97, 98, 99];
    
    // قيمة البداية
    let currentValue = 98;
    securityMeterFill.style.width = currentValue + '%';
    securityPercentage.textContent = currentValue + '%';
    
    // تحديث المؤشر كل 3-7 ثوانٍ بشكل عشوائي
    function updateSecurityMeter() {
        // اختيار قيمة عشوائية من القيم الممكنة
        const newValue = possibleValues[Math.floor(Math.random() * possibleValues.length)];
        
        // تحديث المؤشر فقط إذا كانت القيمة مختلفة
        if (newValue !== currentValue) {
            currentValue = newValue;
            
            // تحديث النسبة المئوية والمؤشر بتأثير انتقالي
            securityPercentage.textContent = currentValue + '%';
            securityMeterFill.style.width = currentValue + '%';
            
            // تغيير لون المؤشر بناءً على القيمة
            if (currentValue >= 98) {
                securityMeterFill.style.background = 'linear-gradient(to right, #00c851, #00e676)';
                securityPercentage.style.color = '#00e676';
            } else if (currentValue >= 96) {
                securityMeterFill.style.background = 'linear-gradient(to right, #33b5e5, #00c851)';
                securityPercentage.style.color = '#33b5e5';
            } else {
                securityMeterFill.style.background = 'linear-gradient(to right, #ffbb33, #33b5e5)';
                securityPercentage.style.color = '#ffbb33';
            }
        }
        
        // تحديد وقت التحديث التالي (بين 3 و 7 ثوانٍ)
        const nextUpdateTime = 3000 + Math.random() * 4000;
        setTimeout(updateSecurityMeter, nextUpdateTime);
    }
    
    // بدء تحديث المؤشر
    setTimeout(updateSecurityMeter, 2000);
}

// تهيئة أزرار الصفحة
function initAccountButtons() {
    // زر تفعيل الحساب
    const activateAccountBtn = document.getElementById('activate-account-btn');
    if (activateAccountBtn) {
        activateAccountBtn.addEventListener('click', function() {
            // إظهار نافذة تسجيل الدخول
            document.getElementById('login-modal').style.display = 'flex';
        });
    }
    
    // زر ترقية الحساب
    const upgradeAccountBtn = document.getElementById('upgrade-account-btn');
    if (upgradeAccountBtn) {
        upgradeAccountBtn.addEventListener('click', function() {
            // إظهار إشعار
            showNotification('سيتم توفير خيارات الترقية قريبًا!', 'info');
        });
    }
    
    // زر تسجيل الخروج
    const logoutBtn = document.getElementById('logout-btn');
    if (logoutBtn) {
        logoutBtn.addEventListener('click', function() {
            // التحقق من حالة تسجيل الدخول
            const isLoggedIn = localStorage.getItem('psh4x_logged_in') === 'true';
            
            if (isLoggedIn) {
                // تأكيد تسجيل الخروج
                if (confirm('هل أنت متأكد من رغبتك في تسجيل الخروج؟')) {
                    // تسجيل الخروج
                    logoutUser();
                    
                    // إظهار إشعار
                    showNotification('تم تسجيل الخروج بنجاح', 'success');
                    
                    // تحديث واجهة المستخدم
                    updateUIAfterLogout();
                }
            } else {
                showNotification('أنت غير مسجل الدخول حاليًا', 'warning');
            }
        });
    }
    
    // إغلاق نافذة تسجيل الدخول
    const closeModal = document.querySelector('.close-modal');
    if (closeModal) {
        closeModal.addEventListener('click', function() {
            document.getElementById('login-modal').style.display = 'none';
        });
    }
    
    // النقر خارج نافذة تسجيل الدخول لإغلاقها
    window.addEventListener('click', function(event) {
        const modal = document.getElementById('login-modal');
        if (event.target === modal) {
            modal.style.display = 'none';
        }
    });
}

// تحديث وقت آخر تحديث
function updateLastUpdateTime() {
    const lastUpdateElement = document.getElementById('last-update');
    if (lastUpdateElement) {
        // تحديث الوقت كل دقيقة
        function updateTime() {
            const now = new Date();
            const minutes = Math.floor(Math.random() * 5) + 1; // بين 1 و 5 دقائق
            
            if (minutes === 1) {
                lastUpdateElement.textContent = 'منذ دقيقة واحدة';
            } else {
                lastUpdateElement.textContent = `منذ ${minutes} دقائق`;
            }
            
            // تحديث الوقت بعد دقيقة
            setTimeout(updateTime, 60000);
        }
        
        updateTime();
    }
}

// التحقق من حالة تسجيل الدخول
function checkLoginStatus() {
    const isLoggedIn = localStorage.getItem('psh4x_logged_in') === 'true';
    const isPremium = localStorage.getItem('psh4x_premium') === 'true';
    
    if (isLoggedIn) {
        // تحديث زر تسجيل الدخول
        const loginBtn = document.getElementById('login-btn');
        if (loginBtn) {
            const icon = loginBtn.querySelector('i');
            if (icon) {
                icon.className = 'fas fa-power-off';
            }
            loginBtn.title = 'تسجيل الخروج';
            loginBtn.classList.add('logout-btn');
            
            // تغيير وظيفة الزر
            loginBtn.onclick = function(e) {
                e.preventDefault();
                e.stopPropagation();
                // تأكيد تسجيل الخروج
                if (confirm('هل أنت متأكد من رغبتك في تسجيل الخروج؟')) {
                    // تسجيل الخروج
                    logoutUser();
                    
                    // إظهار إشعار
                    showNotification('تم تسجيل الخروج بنجاح', 'success');
                    
                    // تحديث واجهة المستخدم
                    updateUIAfterLogout();
                }
                return false;
            };
        }
        
        // تحديث واجهة المستخدم بناءً على حالة الحساب
        updateUIAfterLogin(isPremium);
    }
}

// إعداد أحداث أزرار الشريط السفلي
function setupFooterButtons() {
    // أزرار شريط الأدوات السفلي
    const footerBtns = document.querySelectorAll('.footer-btn');
    footerBtns.forEach(btn => {
        btn.addEventListener('click', function() {
            // إزالة التنشيط من جميع الأزرار
            footerBtns.forEach(b => b.classList.remove('active'));
            // تنشيط الزر الحالي
            this.classList.add('active');
            
            // تحويل المستخدم إلى الصفحة المناسبة
            if (this.id === 'home-btn') {
                window.location.href = 'hack.html';
            } else if (this.id === 'about-btn') {
                window.location.href = 'news.html';
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
                    if (typeof showNotification === 'function') {
                        showNotification('عليك الدخول أولاً لإظهار بيانات الاشتراك', 'warning');
                    } else {
                        alert('عليك الدخول أولاً لإظهار بيانات الاشتراك');
                    }
                }
            }
        });
    });
}

// تحديث واجهة المستخدم بعد تسجيل الدخول
function updateUIAfterLogin(isPremium) {
    // تحديث نوع الحساب
    const freeBadge = document.querySelector('.account-type-badge.free');
    const premiumBadge = document.querySelector('.account-type-badge.premium');
    
    if (freeBadge && premiumBadge) {
        if (isPremium) {
            freeBadge.style.display = 'none';
            premiumBadge.style.display = 'inline-block';
        } else {
            freeBadge.style.display = 'inline-block';
            premiumBadge.style.display = 'none';
        }
    }
    
    // تحديث حالة التفعيل
    const activationStatus = document.querySelector('.activation-status');
    if (activationStatus) {
        activationStatus.textContent = 'مفعل';
        activationStatus.classList.remove('not-activated');
        activationStatus.classList.add('activated');
    }
    
    // إخفاء تنبيه التفعيل
    const activationNotice = document.querySelector('.activation-notice');
    if (activationNotice) {
        activationNotice.style.display = 'none';
    }
    
    // تحديث زر تفعيل الحساب
    const activateAccountBtn = document.getElementById('activate-account-btn');
    if (activateAccountBtn) {
        activateAccountBtn.textContent = 'الحساب مفعل';
        activateAccountBtn.disabled = true;
        activateAccountBtn.style.opacity = '0.7';
        activateAccountBtn.style.cursor = 'not-allowed';
    }
    
    // تحديث الوقت المتبقي
    const timeRemaining = document.querySelector('.time-remaining');
    if (timeRemaining) {
        if (isPremium) {
            timeRemaining.textContent = 'غير محدود (PRO)';
        } else {
            // عدد عشوائي من الأيام للنسخة المجانية
            const days = Math.floor(Math.random() * 7) + 1;
            timeRemaining.textContent = `${days} أيام`;
        }
    }
}

// تحديث واجهة المستخدم بعد تسجيل الخروج
function updateUIAfterLogout() {
    // تحديث نوع الحساب
    const freeBadge = document.querySelector('.account-type-badge.free');
    const premiumBadge = document.querySelector('.account-type-badge.premium');
    
    if (freeBadge && premiumBadge) {
        freeBadge.style.display = 'inline-block';
        premiumBadge.style.display = 'none';
    }
    
    // تحديث حالة التفعيل
    const activationStatus = document.querySelector('.activation-status');
    if (activationStatus) {
        activationStatus.textContent = 'غير مفعل';
        activationStatus.classList.remove('activated');
        activationStatus.classList.add('not-activated');
    }
    
    // إظهار تنبيه التفعيل
    const activationNotice = document.querySelector('.activation-notice');
    if (activationNotice) {
        activationNotice.style.display = 'flex';
    }
    
    // تحديث زر تفعيل الحساب
    const activateAccountBtn = document.getElementById('activate-account-btn');
    if (activateAccountBtn) {
        const icon = document.createElement('i');
        icon.className = 'fas fa-key';
        
        activateAccountBtn.textContent = '';
        activateAccountBtn.appendChild(icon);
        activateAccountBtn.appendChild(document.createTextNode(' تفعيل الحساب'));
        activateAccountBtn.disabled = false;
        activateAccountBtn.style.opacity = '1';
        activateAccountBtn.style.cursor = 'pointer';
    }
    
    // تحديث الوقت المتبقي
    const timeRemaining = document.querySelector('.time-remaining');
    if (timeRemaining) {
        timeRemaining.textContent = 'غير محدود';
    }
    
    // تحديث زر تسجيل الدخول
    const loginBtn = document.getElementById('login-btn');
    if (loginBtn) {
        const icon = loginBtn.querySelector('i');
        if (icon) {
            icon.className = 'fas fa-sign-in-alt';
        }
        loginBtn.title = 'تسجيل الدخول';
        loginBtn.classList.remove('logout-btn');
        
        // إعادة تعيين وظيفة الزر
        loginBtn.onclick = function() {
            document.getElementById('login-modal').style.display = 'flex';
        };
    }
}

// وظيفة تسجيل الخروج
function logoutUser() {
    // مسح بيانات تسجيل الدخول من التخزين المحلي
    localStorage.removeItem('psh4x_logged_in');
    localStorage.removeItem('psh4x_premium');
    localStorage.setItem('psh4x_logged_out', 'true');
    
    // إخفاء شعار الهاك العائم
    localStorage.setItem('psh4x_floating_logo_visible', 'false');
    
    // إرسال حدث تغيير حالة تسجيل الدخول
    const event = new CustomEvent('login_status_changed', { detail: { loggedIn: false } });
    document.dispatchEvent(event);
    
    // إرسال حدث تغيير حالة الاشتراك المميز
    const premiumEvent = new CustomEvent('premium_status_changed', { detail: { isPremium: false } });
    document.dispatchEvent(premiumEvent);
}
