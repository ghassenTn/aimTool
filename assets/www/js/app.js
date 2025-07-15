// تهيئة التطبيق
document.addEventListener('DOMContentLoaded', function() {
    // إضافة أحداث للأزرار
    document.getElementById('enter-hack').addEventListener('click', enterHack);
});

// الانتقال إلى صفحة الهاك
function enterHack() {
    // محاكاة التحميل
    const container = document.querySelector('.container');
    container.innerHTML = `
        <div class="loading-screen">
            <div class="logo-container">
                <img src="images/psh4x-logo.png" alt="PSH4X Logo" class="logo">
            </div>
            <div class="loading-bar-container">
                <div class="loading-bar"></div>
            </div>
            <div class="loading-text">جاري بدء الهاك... <span id="loading-percentage">0%</span></div>
        </div>
    `;
    
    // محاكاة شريط التحميل بشكل أسرع (2 ثانية فقط)
    let percentage = 0;
    const loadingBar = document.querySelector('.loading-bar');
    const loadingPercentage = document.getElementById('loading-percentage');
    
    // حساب الفترة الزمنية للوصول إلى 100% في 2 ثانية
    // 2000ms / 20 = 100ms لكل زيادة بنسبة 5%
    const loadingInterval = setInterval(() => {
        percentage += 5;
        if (percentage > 100) percentage = 100;
        
        loadingBar.style.width = percentage + '%';
        loadingPercentage.textContent = Math.floor(percentage) + '%';
        
        if (percentage >= 100) {
            clearInterval(loadingInterval);
            setTimeout(() => {
                window.location.href = 'hack.html';
            }, 200); // تقليل وقت الانتظار بعد اكتمال التحميل
        }
    }, 100);
}

