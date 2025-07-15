// إظهار إشعار
function showNotification(message, type = 'info', isVerification = false) {
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
    
    // إخفاء الإشعار بعد فترة إلا إذا كان ثابتًا
    if (!isVerification) {
        setTimeout(() => {
            notification.classList.remove('show');
            setTimeout(() => {
                notification.remove();
            }, 300);
        }, 3000);
    }
}

// إضافة إشعار إلى قائمة الإشعارات
function addNotificationToMenu(title, message, type = 'info', actionButton = null) {
    // التحقق من وجود قائمة الإشعارات
    const notificationList = document.querySelector('.notification-list');
    if (!notificationList) return;
    
    // إزالة رسالة "لا توجد تنبيهات جديدة"
    const emptyNotification = notificationList.querySelector('.empty-notification');
    if (emptyNotification) {
        emptyNotification.style.display = 'none';
    }
    
    // إنشاء عنصر الإشعار الجديد
    const notificationItem = document.createElement('div');
    notificationItem.className = `notification-item ${type}`;
    
    // إضافة أيقونة حسب النوع
    let icon = 'info-circle';
    if (type === 'success') icon = 'check-circle';
    if (type === 'warning') icon = 'exclamation-triangle';
    if (type === 'error') icon = 'times-circle';
    if (type === 'premium') icon = 'crown';
    
    // إنشاء محتوى الإشعار
    let notificationContent = `
        <div class="notification-icon">
            <i class="fas fa-${icon}"></i>
        </div>
        <div class="notification-content">
            <h4>${title}</h4>
            <p>${message}</p>
        </div>
    `;
    
    // إضافة زر الإجراء إذا كان موجوداً
    if (actionButton) {
        notificationContent += `
            <div class="notification-action">
                <button class="action-btn" data-action="${actionButton.action}">${actionButton.text}</button>
            </div>
        `;
    }
    
    notificationItem.innerHTML = notificationContent;
    
    // إضافة الإشعار إلى القائمة
    notificationList.prepend(notificationItem);
    
    // إضافة مستمع للزر إذا كان موجوداً
    if (actionButton && actionButton.callback) {
        const actionBtn = notificationItem.querySelector('.action-btn');
        if (actionBtn) {
            actionBtn.addEventListener('click', actionButton.callback);
        }
    }
    
    // تحديث عدد الإشعارات
    updateNotificationCount();
    
    return notificationItem;
}

// تحديث عدد الإشعارات وإظهار الرقم فوق الأيقونة
function updateNotificationCount() {
    const notificationList = document.querySelector('.notification-list');
    if (!notificationList) return;
    
    // حساب عدد الإشعارات
    const notificationItems = notificationList.querySelectorAll('.notification-item');
    const count = notificationItems.length;
    
    // التحقق من وجود عنصر العداد
    let notificationBadge = document.querySelector('.notification-badge');
    
    // إذا كان العدد أكبر من صفر، أظهر العداد
    if (count > 0) {
        // إنشاء العداد إذا لم يكن موجوداً
        if (!notificationBadge) {
            notificationBadge = document.createElement('span');
            notificationBadge.className = 'notification-badge';
            
            // إضافة العداد إلى زر الإشعارات
            const notificationBtn = document.getElementById('notification-btn');
            if (notificationBtn) {
                notificationBtn.appendChild(notificationBadge);
            }
        }
        
        // تحديث قيمة العداد
        notificationBadge.textContent = count;
        notificationBadge.style.display = 'flex';
    } else if (notificationBadge) {
        // إخفاء العداد إذا كان العدد صفر
        notificationBadge.style.display = 'none';
    }
}

// مسح جميع الإشعارات من القائمة
function clearAllNotifications() {
    const notificationList = document.querySelector('.notification-list');
    if (!notificationList) return;
    
    // إزالة جميع الإشعارات
    const notificationItems = notificationList.querySelectorAll('.notification-item');
    notificationItems.forEach(item => item.remove());
    
    // إظهار رسالة "لا توجد تنبيهات جديدة"
    const emptyNotification = notificationList.querySelector('.empty-notification');
    if (emptyNotification) {
        emptyNotification.style.display = 'flex';
    }
    
    // تحديث عدد الإشعارات
    updateNotificationCount();
}

// تهيئة نظام الإشعارات عند تحميل الصفحة
window.addEventListener('load', function() {
    initNotificationSystem();
});

// وظيفة تهيئة نظام الإشعارات
function initNotificationSystem() {
    // الحصول على عناصر الإشعارات
    const notificationBtn = document.getElementById('notification-btn');
    const notificationDropdown = document.querySelector('.notification-dropdown');
    
    // التحقق من وجود العناصر
    if (!notificationBtn || !notificationDropdown) {
        console.error('لم يتم العثور على عناصر الإشعارات');
        return;
    }
    
    // إضافة مستمع للنقر على زر الإشعارات
    notificationBtn.onclick = function(e) {
        e.preventDefault();
        e.stopPropagation();
        
        // إعادة تعيين قيمة z-index للتأكد من ظهورها فوق جميع العناصر
        notificationDropdown.style.zIndex = '99999';
        document.body.style.position = 'relative';
        
        // تبديل حالة العرض
        if (notificationDropdown.style.display === 'block') {
            notificationDropdown.style.display = 'none';
        } else {
            notificationDropdown.style.display = 'block';
            // إضافة القائمة إلى نهاية body لضمان ظهورها فوق جميع العناصر
            document.body.appendChild(notificationDropdown);
        }
        
        console.log('تم النقر على زر الإشعارات');
        return false;
    };
    
    // إغلاق القائمة عند النقر في أي مكان آخر
    document.onclick = function(e) {
        if (e.target !== notificationBtn && !notificationDropdown.contains(e.target)) {
            notificationDropdown.style.display = 'none';
        }
    };
    
    // منع إغلاق القائمة عند النقر عليها
    notificationDropdown.onclick = function(e) {
        e.stopPropagation();
    };
    
    // إضافة زر مسح جميع الإشعارات
    const notificationHeader = document.querySelector('.notification-header');
    if (notificationHeader) {
        const clearBtn = document.createElement('button');
        clearBtn.className = 'clear-notifications-btn';
        clearBtn.innerHTML = '<i class="fas fa-trash"></i>';
        clearBtn.title = 'مسح جميع الإشعارات';
        clearBtn.addEventListener('click', clearAllNotifications);
        notificationHeader.appendChild(clearBtn);
    }
}
