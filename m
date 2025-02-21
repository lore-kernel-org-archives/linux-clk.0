Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097C11FF1A2
	for <linux-clk@vger.kernel.org>; Fri, 21 Feb 2025 06:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740119641; cv=none; b=rH0KcEJEEhrM72U4nxJyyqrH5B1tgx7uJzxuy9lL8ZBBT6DbfkW3wrBY9C8N94GDCmihqrHY3AgggxnkhKPevXul9sW2E2Rt/48e1OGwpbrdadxnyLnNxKEUOJcVXkQ3tKjEYo8mrv2aRPZJrta9T5E7BtKdHycyViKTD7vvUg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740119641; c=relaxed/simple;
	bh=QwtY0+2OsM6DemRSALyHBYrUGqwilbtsVhnN9LkG79k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=O4P7F5B84z+UHidNRTT8IMSWjyhRY6R1guwogsa+HFdLCRrjfPOgaFuHutHIG2bM0+CAkNphZU4sQOP2lA41amewAiimUNOrNnUwO4EsT6+iexzS0EGJ+Cdnmxgl5DKMtIpdsMQKPLi8yFlN7uotjsk0k0yVux8DVY/EXnjAGkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T4PVf/RF; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T4PVf/RF"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2211cd4463cso34813325ad.2
        for <linux-clk@vger.kernel.org>; Thu, 20 Feb 2025 22:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740119639; x=1740724439; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DNg/PQcPlHeI4lLEbliBR3X5bvZKY/k1Ucn2ATe8Pak=;
        b=T4PVf/RFeTUN8g4LsUskPEcpee7tS+Qs6FMH7RWIwPFwO6+zlLdKnP/ofv7bgsGlpb
         UG7WpGH3orBlDkX5vpjx/Gvn/Vn+Lfr143XK7mcb4beratv+7cEhG5LjUyED54ZhM5OI
         Xj7JlqljUkYNerBzI4qq+ZZ6zPGbfF1CY/ComJwMIAMhyOYiUCAr7v8gJUgudC9UVc/W
         EYAM3ickPmWQBmNB4qE+PuI2zWbGScuF2LtRMDDWkePAann4okgw2xGfB3aPiQOv2RjR
         r1SUIKe4YjNQ2cxfNaS01JZP2hzKWLITD7f/ooLUx3u1l3x6RtuAhzV4fUQVSkhYqwW/
         xjPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740119639; x=1740724439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DNg/PQcPlHeI4lLEbliBR3X5bvZKY/k1Ucn2ATe8Pak=;
        b=AEbmkAjedIeTqCWMe3nFVrgJIsvZCeMxPqWOHDf6bRw3Bfr2N8UxQDrqlV/M+zrGOe
         NHDt2WHjgykNDWCJnVwD0v+WNunRsFPSYlDCtWSiTgzKajx+BE8YQBAQO7Kyk56RCc9A
         u9BLms2LwYbZys+MzthD/QiNrzuMQeBQ5AgqyZeQ4LFSHeNcywgXziL3Q8FubAY8ZowN
         hi2QMr3RIaDLehcdm4Fnt9a9VEA4cQ7EbyRHwz/uYsdE1XaLawvsj6VhgvTogUoldS6y
         SVSEvYe3y0jp1BjLHIiLQ8aqWpH2iPGamSSqDx9crt3wkSojK5/3KRAM6fKiPb02p72r
         folg==
X-Forwarded-Encrypted: i=1; AJvYcCWmUDy2uLmJ8hhnNf4UYi2xCCzxED9Og0vS+0ReB1wSmWQXjK4WL2Ld1vHxgIy9xg9vfAHkd+iFE6A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvyJtSrU3a4dtjBML38jbL+wqWe7IYiK6XVgCtaSVnyS6sHX2d
	smDl1ENZtL1zepg54hk7cx+JYC7fl/EL1DD+LWV6VkCLVEGtbse+7izxVk3+l04=
X-Gm-Gg: ASbGncvV2CQ1KS3PA4QbC7rFOIUlikflmevIX8smzbANw7IseeDK86hVV/OgxXdjtcW
	+tlkQxK+Nu4rbACsOpYP2tT6nixS6fY6xH5GnLgRiLzkeFLuTTY2hDD80bOdRjSrXVzlgnwVufS
	FWxBQDEoeUE1QzxxwwW/A+oUQyosKFAsPu390riJ/PQ6kCpDvSR7zSADqXUXVjsMQmQgwJdY0Bs
	KTwC9EjlzSCiYiNghXCGy/fWAP66ZazP4l/cSOOgLXEF9ddRhJSgIPeDeZNr2zPJ1N+ZVjjBUk6
	8bgpEo/JbqJSGAX8LW/Sl2dU+mw5
X-Google-Smtp-Source: AGHT+IGWN7LMDgKfbQIt8winmK79UQaYRMyPCFRcj2wUkH6XJiRNnCEc0FgdST1qCb93KqqidUdo8g==
X-Received: by 2002:a05:6a20:ad0c:b0:1ee:aa76:2321 with SMTP id adf61e73a8af0-1eef3c588bbmr4075137637.1.1740119639285;
        Thu, 20 Feb 2025 22:33:59 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-add0e439774sm11618432a12.0.2025.02.20.22.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 22:33:58 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH V2 2/2] rust: Add basic bindings for clk APIs
Date: Fri, 21 Feb 2025 12:03:39 +0530
Message-Id: <a0a1ba4e27c3a0d9e38c677611eb88027e463287.1740118863.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1740118863.git.viresh.kumar@linaro.org>
References: <cover.1740118863.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add initial bindings for the clk APIs. These provide the minimal
functionality needed for common use cases, making them straightforward
to introduce in the first iteration.

These will be used by Rust based cpufreq / OPP layers to begin with.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 MAINTAINERS        |   1 +
 rust/kernel/clk.rs | 104 +++++++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs |   1 +
 3 files changed, 106 insertions(+)
 create mode 100644 rust/kernel/clk.rs

diff --git a/MAINTAINERS b/MAINTAINERS
index 726110d3c988..96e2574f41c0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5779,6 +5779,7 @@ F:	include/linux/clk-pr*
 F:	include/linux/clk/
 F:	include/linux/of_clk.h
 F:	rust/helpers/clk.c
+F:	rust/kernel/clk.rs
 X:	drivers/clk/clkdev.c
 
 COMMON INTERNET FILE SYSTEM CLIENT (CIFS and SMB3)
diff --git a/rust/kernel/clk.rs b/rust/kernel/clk.rs
new file mode 100644
index 000000000000..c212cd3167e1
--- /dev/null
+++ b/rust/kernel/clk.rs
@@ -0,0 +1,104 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Clock abstractions.
+//!
+//! C header: [`include/linux/clk.h`](srctree/include/linux/clk.h)
+
+use crate::{
+    bindings,
+    device::Device,
+    error::{from_err_ptr, to_result, Result},
+    prelude::*,
+};
+
+use core::ptr;
+
+/// A simple implementation of `struct clk` from the C code.
+#[repr(transparent)]
+pub struct Clk(*mut bindings::clk);
+
+impl Clk {
+    /// Creates `Clk` instance for a device and a connection id.
+    pub fn new(dev: &Device, name: Option<&CStr>) -> Result<Self> {
+        let con_id = if let Some(name) = name {
+            name.as_ptr() as *const _
+        } else {
+            ptr::null()
+        };
+
+        // SAFETY: It is safe to call `clk_get()`, on a device pointer earlier received from the C
+        // code.
+        Ok(Self(from_err_ptr(unsafe {
+            bindings::clk_get(dev.as_raw(), con_id)
+        })?))
+    }
+
+    /// Obtain the raw `struct clk *`.
+    pub fn as_raw(&self) -> *mut bindings::clk {
+        self.0
+    }
+
+    /// Clock enable.
+    pub fn enable(&self) -> Result<()> {
+        // SAFETY: By the type invariants, we know that `self` owns a reference, so it is safe to
+        // use it now.
+        to_result(unsafe { bindings::clk_enable(self.0) })
+    }
+
+    /// Clock disable.
+    pub fn disable(&self) {
+        // SAFETY: By the type invariants, we know that `self` owns a reference, so it is safe to
+        // use it now.
+        unsafe { bindings::clk_disable(self.0) };
+    }
+
+    /// Clock prepare.
+    pub fn prepare(&self) -> Result<()> {
+        // SAFETY: By the type invariants, we know that `self` owns a reference, so it is safe to
+        // use it now.
+        to_result(unsafe { bindings::clk_prepare(self.0) })
+    }
+
+    /// Clock unprepare.
+    pub fn unprepare(&self) {
+        // SAFETY: By the type invariants, we know that `self` owns a reference, so it is safe to
+        // use it now.
+        unsafe { bindings::clk_unprepare(self.0) };
+    }
+
+    /// Clock prepare enable.
+    pub fn prepare_enable(&self) -> Result<()> {
+        // SAFETY: By the type invariants, we know that `self` owns a reference, so it is safe to
+        // use it now.
+        to_result(unsafe { bindings::clk_prepare_enable(self.0) })
+    }
+
+    /// Clock disable unprepare.
+    pub fn disable_unprepare(&self) {
+        // SAFETY: By the type invariants, we know that `self` owns a reference, so it is safe to
+        // use it now.
+        unsafe { bindings::clk_disable_unprepare(self.0) };
+    }
+
+    /// Clock get rate.
+    pub fn rate(&self) -> usize {
+        // SAFETY: By the type invariants, we know that `self` owns a reference, so it is safe to
+        // use it now.
+        unsafe { bindings::clk_get_rate(self.0) }
+    }
+
+    /// Clock set rate.
+    pub fn set_rate(&self, rate: usize) -> Result<()> {
+        // SAFETY: By the type invariants, we know that `self` owns a reference, so it is safe to
+        // use it now.
+        to_result(unsafe { bindings::clk_set_rate(self.0, rate) })
+    }
+}
+
+impl Drop for Clk {
+    fn drop(&mut self) {
+        // SAFETY: By the type invariants, we know that `self` owns a reference, so it is safe to
+        // relinquish it now.
+        unsafe { bindings::clk_put(self.0) };
+    }
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 496ed32b0911..324b86f127a0 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -40,6 +40,7 @@
 pub mod block;
 #[doc(hidden)]
 pub mod build_assert;
+pub mod clk;
 pub mod cred;
 pub mod device;
 pub mod device_id;
-- 
2.31.1.272.g89b43f80a514

