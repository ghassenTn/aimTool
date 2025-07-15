// مصفوفة المفاتيح التجريبية
const trialKeys = [
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

// وظيفة للحصول على مفتاح عشوائي من المصفوفة
function getRandomTrialKey() {
    const randomIndex = Math.floor(Math.random() * trialKeys.length);
    return trialKeys[randomIndex];
}

// وظيفة لنسخ النص إلى الحافظة
function copyToClipboard(text) {
    navigator.clipboard.writeText(text).then(
        function() {
            showNotification('تم نسخ المفتاح بنجاح!', 'success');
        },
        function(err) {
            showNotification('فشل في نسخ المفتاح', 'error');
            console.error('فشل في نسخ النص: ', err);
        }
    );
}

// وظيفة لإظهار نافذة المفتاح التجريبي
function showTrialKeyModal() {
    // إخفاء نافذة تسجيل الدخول
    document.getElementById('login-modal').style.display = 'none';
    
    // إظهار نافذة المفتاح التجريبي
    document.getElementById('trial-key-modal').style.display = 'flex';
}

// وظيفة لإظهار الهدية
function showGift() {
    // التحقق مما إذا كان المستخدم قد حصل على مفتاح تجريبي من قبل
    const hasTrialKey = localStorage.getItem('psh4x_trial_key_used') === 'true';
    
    if (hasTrialKey) {
        // إظهار تنبيه للمستخدم
        showNotification('لقد حصلت على مفتاح تجريبي بالفعل!', 'warning');
        
        // إغلاق نافذة المفتاح التجريبي
        document.getElementById('trial-key-modal').style.display = 'none';
        
        // إظهار نافذة تسجيل الدخول مرة أخرى
        document.getElementById('login-modal').style.display = 'flex';
        
        return;
    }
    
    const trialKeyContent = document.querySelector('.trial-key-content');
    const giftContent = document.querySelector('.gift-content');
    
    trialKeyContent.style.display = 'none';
    giftContent.style.display = 'flex';
}

// وظيفة لإظهار المفتاح
function showKey() {
    const giftContent = document.querySelector('.gift-content');
    const keyContent = document.querySelector('.key-content');
    const keyDisplay = document.getElementById('trial-key-display');
    
    // الحصول على مفتاح عشوائي
    const randomKey = getRandomTrialKey();
    keyDisplay.textContent = randomKey;
    
    // نسخ المفتاح تلقائيًا
    copyToClipboard(randomKey);
    
    // تسجيل أن المستخدم قد حصل على مفتاح تجريبي
    localStorage.setItem('psh4x_trial_key_used', 'true');
    
    giftContent.style.display = 'none';
    keyContent.style.display = 'flex';
}

// وظيفة للعودة إلى نافذة تسجيل الدخول مع المفتاح
function returnToLogin() {
    // إخفاء نافذة المفتاح التجريبي
    document.getElementById('trial-key-modal').style.display = 'none';
    
    // إظهار نافذة تسجيل الدخول
    const loginModal = document.getElementById('login-modal');
    loginModal.style.display = 'flex';
    
    // وضع المفتاح في حقل الإدخال
    const keyDisplay = document.getElementById('trial-key-display');
    if (keyDisplay && keyDisplay.textContent) {
        const activationKeyInput = document.getElementById('activation-key');
        if (activationKeyInput) {
            activationKeyInput.value = keyDisplay.textContent;
        }
    }
}

// إضافة أحداث عند تحميل الصفحة
document.addEventListener('DOMContentLoaded', function() {
    // زر الحصول على المفتاح التجريبي
    const getTrialKeyBtn = document.getElementById('get-trial-key-btn');
    if (getTrialKeyBtn) {
        getTrialKeyBtn.addEventListener('click', showGift);
    }
    
    // زر الهدية
    const giftBtn = document.getElementById('gift-btn');
    if (giftBtn) {
        giftBtn.addEventListener('click', showKey);
    }
    
    // زر نسخ المفتاح
    const copyKeyBtn = document.getElementById('copy-key-btn');
    if (copyKeyBtn) {
        copyKeyBtn.addEventListener('click', function() {
            const keyDisplay = document.getElementById('trial-key-display');
            if (keyDisplay) {
                copyToClipboard(keyDisplay.textContent);
            }
        });
    }
    
    // زر العودة إلى تسجيل الدخول
    const returnToLoginBtn = document.getElementById('return-to-login-btn');
    if (returnToLoginBtn) {
        returnToLoginBtn.addEventListener('click', returnToLogin);
    }
});
