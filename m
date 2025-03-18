Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE121C4A10
	for <linux-clk@vger.kernel.org>; Tue, 18 Mar 2025 05:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742277457; cv=none; b=t/Qg0tYsJfLQn10Jp3O/2LD1kWs5gFzp+nGMrDmnr5OP5QekttkH/FAWviHGAu2k9/MHhKSC3INoJ9sQfFEOIxjscboEMaJJEAyGbeTiwJT2OAGKHiKVfyIBEydCnQagflwdAQILnGbg2RKfypVPco6JdTzVTDPshhkFmZgbyGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742277457; c=relaxed/simple;
	bh=VNorIlJrBMTZi3vbOgZiolGqGyUVBlGTnWAqVyyJeWM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sCgfF/rbQ3Zlhcy7KcBH6wYP0gWfMsKYcaHeQCtqeYTRIel1+B9SEHfah1p6BmdY7X5JmBTYMb5mrPTVZpjGSBeHIdN78WjcshSae5CiOeRBibKzH9pFMvrlzjyYp5ewn14Ohcd6Ssh5+LuituailCQpmRnmPgqZrTTYQuW9fxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qOrrjkQh; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qOrrjkQh"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-22401f4d35aso97221985ad.2
        for <linux-clk@vger.kernel.org>; Mon, 17 Mar 2025 22:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742277455; x=1742882255; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=llikhmZ0VyhG0hV+3+6urJ6KvAwqIcQWJl1kQJnPD9w=;
        b=qOrrjkQhTc4G/uGlq2p6r1GAeOflf6jTccwVXpwIwBftALn+KJccgUE1MM/pukUb/V
         z7sRhZSx4y1MYjp1bOSql+MEQPkZD8g8M/oiu/zweLnEAMBZkfR6TyYF8SJuTFHLseOR
         H2L1rCwoAcvw2XtmqfnoFFxAqxlKNWdkGC5FWMrxkdwF5ZGyLp1xQehi3+VqcVTdbpTS
         cbSbdFJshq00D7sa0YW7Jn2jGaWAtEWZVtljwNQ2WpL3bhp1cgJdr4vEpF2/MnPFVohr
         1BsAlq2G1w/wFXukiTZj4uOiV/d0Tm40Tehc+iAwRm5jAPC/rnQDgR4xo2VgyE6yVgrh
         92kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742277455; x=1742882255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=llikhmZ0VyhG0hV+3+6urJ6KvAwqIcQWJl1kQJnPD9w=;
        b=OX+S/oKoI+x1y8VZCt27GI4kLPpicNhR3UIrYlZ1OwmpdALcD19bUes+uJiolNpsYJ
         3KAm0247Xt7UGsA3pIXTJ8XSPoORiiKhVLacLvBJafFIUVFrH9unwibyyldlscKiZ1P6
         2pfQuEQVAyDeSWo+CK5Qm7dtGjKVb/ZOZ8sWt9stT7ciLoqb/kgOhb6gd01Zz4nbH267
         s+KwG7CNvKWZQWB5IsvqxUgU4uPIFmPx67ZwulOQyRHBllZk2sgMuUPrlaRdZ1XSe6f9
         nvwah685kIEUMqcW2xqi3S6tGJapj+bCn93cnIu/op2gzfTxfh1sVauJVkZiFTLaMs7W
         ID5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXXByo4vzQ1F6Qaa7dbJoI2Zt/ZIV89NhzYziioRkeJzfSZfYkdgwE+D7x+XPx0Ytxe4nR/elb4C58=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3KDy1pjxWNRQ7jwB5LQvPF2irLgZ5Ign7zIfdhG7hakQcjMEE
	nxJQ7443qMnn5VU6bM2UwbUf4SON/X1Vb4BJ4iawVbtecaBspnOtoe2Ddbp30Dc=
X-Gm-Gg: ASbGncsRSv5+uAxa+V08A7lD9xqBMfIDMBx8T4osYWBpFmpVCGdqwsOg5AQx4f3hgb+
	Ka5/JbZ+R1ybUJI5/pF376dJHvav25/CglTyZZiVmwWnKPbiBtEI3mQT+iM6NPV362Ctroz5fhK
	lHd7i43gbVV98kCeTf31UuN9BbpZnM4NqW1sxspeS64IO3WNW9wBOTlw7fWk0Rl4BVOIaj2xMX4
	sI2Uj583D4heqKaT6T4CmGUlXxTb2IvWtbna96a5burJJDZ7SR/Mqy1zUWCyL4zIkNtjNAptazk
	gtLE7MDKxLJApYRdrsSA7nYzxIkT3pOyu9nO9EqtBiJuqg==
X-Google-Smtp-Source: AGHT+IHt4dP/2ZCotnLRvPmF95XeDbGWHGlcVUF0swIV4HUIiEJWdVoagzWLCHWRlpu/tKYoi70Y7g==
X-Received: by 2002:a17:902:ced0:b0:220:e156:63e0 with SMTP id d9443c01a7336-2262c51bc95mr19693135ad.8.1742277454770;
        Mon, 17 Mar 2025 22:57:34 -0700 (PDT)
Received: from localhost ([122.172.84.15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c68887bfsm85715745ad.34.2025.03.17.22.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 22:57:34 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Daniel Almeida <daniel.almeida@collabora.com>
Subject: [PATCH V4 1/2] rust: Add clk helpers
Date: Tue, 18 Mar 2025 11:27:14 +0530
Message-Id: <171b6cd811ff4e913880ab33bc11e634f7cdeecb.1742276963.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1742276963.git.viresh.kumar@linaro.org>
References: <cover.1742276963.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Non-trivial C macros and inlined C functions cannot be used directly
in the Rust code and are used via functions ("helpers") that wrap
those so that they can be called from Rust.

In order to prepare for adding Rust abstractions for the clock APIs,
add clock helpers required by the Rust implementation.

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 MAINTAINERS                     |  1 +
 rust/bindings/bindings_helper.h |  1 +
 rust/helpers/clk.c              | 66 +++++++++++++++++++++++++++++++++
 rust/helpers/helpers.c          |  1 +
 4 files changed, 69 insertions(+)
 create mode 100644 rust/helpers/clk.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 25c86f47353d..726110d3c988 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5778,6 +5778,7 @@ F:	include/dt-bindings/clock/
 F:	include/linux/clk-pr*
 F:	include/linux/clk/
 F:	include/linux/of_clk.h
+F:	rust/helpers/clk.c
 X:	drivers/clk/clkdev.c
 
 COMMON INTERNET FILE SYSTEM CLIENT (CIFS and SMB3)
diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 55354e4dec14..4e4e16c3b479 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -10,6 +10,7 @@
 #include <linux/blk-mq.h>
 #include <linux/blk_types.h>
 #include <linux/blkdev.h>
+#include <linux/clk.h>
 #include <linux/cred.h>
 #include <linux/errname.h>
 #include <linux/ethtool.h>
diff --git a/rust/helpers/clk.c b/rust/helpers/clk.c
new file mode 100644
index 000000000000..6d04372c9f3b
--- /dev/null
+++ b/rust/helpers/clk.c
@@ -0,0 +1,66 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/clk.h>
+
+/*
+ * The "inline" implementation of below helpers are only available when
+ * CONFIG_HAVE_CLK or CONFIG_HAVE_CLK_PREPARE aren't set.
+ */
+#ifndef CONFIG_HAVE_CLK
+struct clk *rust_helper_clk_get(struct device *dev, const char *id)
+{
+	return clk_get(dev, id);
+}
+
+void rust_helper_clk_put(struct clk *clk)
+{
+	clk_put(clk);
+}
+
+int rust_helper_clk_enable(struct clk *clk)
+{
+	return clk_enable(clk);
+}
+
+void rust_helper_clk_disable(struct clk *clk)
+{
+	clk_disable(clk);
+}
+
+unsigned long rust_helper_clk_get_rate(struct clk *clk)
+{
+	return clk_get_rate(clk);
+}
+
+int rust_helper_clk_set_rate(struct clk *clk, unsigned long rate)
+{
+	return clk_set_rate(clk, rate);
+}
+#endif
+
+#ifndef CONFIG_HAVE_CLK_PREPARE
+int rust_helper_clk_prepare(struct clk *clk)
+{
+	return clk_prepare(clk);
+}
+
+void rust_helper_clk_unprepare(struct clk *clk)
+{
+	clk_unprepare(clk);
+}
+#endif
+
+struct clk *rust_helper_clk_get_optional(struct device *dev, const char *id)
+{
+	return clk_get_optional(dev, id);
+}
+
+int rust_helper_clk_prepare_enable(struct clk *clk)
+{
+	return clk_prepare_enable(clk);
+}
+
+void rust_helper_clk_disable_unprepare(struct clk *clk)
+{
+	clk_disable_unprepare(clk);
+}
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 0640b7e115be..4700ee7aaf85 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -11,6 +11,7 @@
 #include "bug.c"
 #include "build_assert.c"
 #include "build_bug.c"
+#include "clk.c"
 #include "cred.c"
 #include "device.c"
 #include "err.c"
-- 
2.31.1.272.g89b43f80a514

