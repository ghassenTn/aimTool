// عرض نافذة التحقق المنبثقة
function showVerificationModal(title) {
    const modal = document.getElementById('verification-modal');
    const verificationTitle = document.getElementById('verification-title');
    const progressFill = document.getElementById('progress-fill');
    const progressPercentage = document.getElementById('progress-percentage');
    const verificationResult = document.getElementById('verification-result');
    
    // إعادة تعيين حالة النافذة
    verificationTitle.textContent = title;
    progressFill.style.width = '0%';
    progressPercentage.textContent = '0%';
    verificationResult.textContent = '';
    verificationResult.className = 'verification-result';
    
    // إظهار النافذة
    modal.style.display = 'flex';
}

// محاكاة تقدم عملية التحقق
function simulateVerificationProgress(callback) {
    const progressFill = document.getElementById('progress-fill');
    const progressPercentage = document.getElementById('progress-percentage');
    let progress = 0;
    
    // محاكاة تقدم بطيء نسبيًا (كما طلب المستخدم)
    const interval = setInterval(() => {
        // زيادة التقدم بشكل عشوائي
        progress += Math.random() * 3;
        
        // التأكد من عدم تجاوز 100%
        if (progress >= 100) {
            progress = 100;
            clearInterval(interval);
            
            // استدعاء الدالة المرجعية بعد اكتمال التقدم
            setTimeout(() => {
                if (callback) callback();
            }, 500);
        }
        
        // تحديث شريط التقدم
        progressFill.style.width = progress + '%';
        progressPercentage.textContent = Math.floor(progress) + '%';
    }, 100); // تأخير أطول بين كل تحديث
}

// إظهار نتيجة التحقق
function showVerificationResult(message, type, showLatestVersionButton = false) {
    const verificationResult = document.getElementById('verification-result');
    const verificationIcon = document.getElementById('verification-icon');
    
    // تغيير أيقونة التحقق حسب النوع
    verificationIcon.classList.remove('fa-spin', 'fa-sync-alt');
    
    if (type === 'success') {
        verificationIcon.classList.add('fa-check-circle');
        verificationIcon.style.color = 'var(--success-green)';
    } else if (type === 'error') {
        verificationIcon.classList.add('fa-times-circle');
        verificationIcon.style.color = 'var(--danger-red)';
    }
    
    // إظهار الرسالة
    verificationResult.textContent = message;
    verificationResult.classList.add('show', type);
    
    // إغلاق النافذة بعد فترة
    setTimeout(() => {
        const modal = document.getElementById('verification-modal');
        modal.style.display = 'none';
        
        // إذا كان مطلوب إظهار زر التحقق من آخر إصدار
        if (showLatestVersionButton) {
            // إظهار نص مختصر وزر التحقق من آخر إصدار بعد إغلاق النافذة
            const statusItem = document.getElementById('game-version-status');
            const statusInfo = statusItem.querySelector('.status-info');
            
            // إضافة زر التحقق من آخر إصدار بجانب النص
            const latestVersionBtn = document.createElement('button');
            latestVersionBtn.className = 'latest-version-btn';
            latestVersionBtn.innerHTML = '<i class="fas fa-download"></i> تحقق من آخر إصدار';
            latestVersionBtn.addEventListener('click', checkLatestVersion);
            
            // إضافة نص مختصر للتحقق من آخر إصدار
            const latestVersionText = document.createElement('div');
            latestVersionText.className = 'latest-version-text';
            latestVersionText.innerHTML = '<i class="fas fa-shield-alt"></i> تعزيز الحماية والأمان:';
            
            // إضافة العناصر إلى الواجهة
            const latestVersionContainer = document.createElement('div');
            latestVersionContainer.className = 'latest-version-container';
            latestVersionContainer.appendChild(latestVersionText);
            latestVersionContainer.appendChild(latestVersionBtn);
            
            // إضافة الحاوية إلى عنصر حالة التحقق
            statusItem.appendChild(latestVersionContainer);
        }
    }, 3000);
}

