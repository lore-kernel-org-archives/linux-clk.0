Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9545F1F2360
	for <linux-clk@vger.kernel.org>; Mon,  3 Mar 2025 10:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740996027; cv=none; b=R5xwAtVJKE7m5HftAr5eaMfqVo3piQVZeiWPcWaDGm9lZS2ff5hxlcPVUB+Jlk3V3AFcow/UT0SdGpD4BaL/2SBso7CX3B1MwsddzfLFmpOhkUOmOryP5RSR1cIHmOcaSknEc9jpcREE5tjHbHggufofcgbdNNOn08t6tTdYC+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740996027; c=relaxed/simple;
	bh=VNorIlJrBMTZi3vbOgZiolGqGyUVBlGTnWAqVyyJeWM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YpHpgPFLRqAVMym/JXRnPnxLyCUHVgAGxvHnIjIp+e+kKSR10wBL+HWlVWOaiGpMY6kpdVtz9LBjtqlRFh+T8HQNIXF76MOrIBnE5oQLZ4UT/Jg91Rif3vnKAZId/ufhZPfvhCzeFna7TmyJ5/uXhzoe8vO9PpUrGFhAUKthamQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ne/fllsy; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ne/fllsy"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-223cc017ef5so2968055ad.0
        for <linux-clk@vger.kernel.org>; Mon, 03 Mar 2025 02:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740996025; x=1741600825; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=llikhmZ0VyhG0hV+3+6urJ6KvAwqIcQWJl1kQJnPD9w=;
        b=Ne/fllsyElEAsCKe5KjJcryaX7+F7ZzPhAHN5+3tX2fg1OEvXikuCfn5Ql2H6pFLXC
         sD8eYJN/yJsv8Fo+vT/KYnKV9xpdmUXWAXESwayeXxtRVd2Ye56OfMSI4HHnG7dK18D5
         W4blYGAgv5LT2KlxvNO1vlNisLvHv5jdH4sbsUloiffoXUimsb+BWGjGtMfRde3FCoeF
         tq60Dluk8CwumCJNDhJjNL8L3DiYfMS7lmFrOZ50X9q47xPs1J4tv9q1XfcLClouogI+
         wyPunz0IiBLpXtVvbYAhm1BNASb9IJyViY9ARtc4+VhV+ugDL+6cyYIKtH/uC/J/Ntjl
         j3dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740996025; x=1741600825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=llikhmZ0VyhG0hV+3+6urJ6KvAwqIcQWJl1kQJnPD9w=;
        b=D2dU6VJaU5YbOsbv9lPeb6z/c+U3SAupij9JIEwzA8yETM81zpgI0uQ2ipOCLC7d91
         irFA935aJTkv2Ov14FG0DU8bwekTgn7hygw/EcqnUMHj5oORr4YPMu1tFSxRND6b4b0v
         7CCpbV1IIVSSatvgYs1uEOrG6iBR8XzhjmOyQxwGDzJrGC2kWMFv8s1S0iqV7R8whllM
         aNCkBM+A3Yk1kgTkRSIXK88b6lshYfcEbT/jRMyrbkr5lZH+/ggtd0CCcei5dyDjih+W
         tX69iqvL6cBaqkRP4NquepQ7jeYNHej9efQq3t1qT+UgjlRG5Q+SrUMvKECpFUla/Gdd
         w68Q==
X-Forwarded-Encrypted: i=1; AJvYcCUrotKM47wPEgoObrn6DLCnby53NJ7Ni8At3SJqZeNOmmI1KcCaiGqsHwlKmOQGckAZGCLmCXT5R2g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFzyQIfnTczFPJyV/Gsr2EZbbhK3XYi5SRKZ1OsBscsRrV1IBj
	rIu7fEbClQbLMTi7pjenPm6blP37OlLgRhxtPwGlwyVLjycn7YVXSbAgMx7Q5oQ=
X-Gm-Gg: ASbGncvmZm/MmBX2u54gc8jXutBRrE/aDxlkASPG4vPD2f5skO/enYwB1nSPFFn6S2G
	ZxKbf6+zVxFhyvtOPFpdz9D9a1rRgGWhccBpQH8KGXsRYU0G2prFXa9EfTWqpYAUu90xi7DUSmO
	V/GNtIiZTkm0knv0oQq9OdHbZZbpFAC6WDsJna2gkqmY8VGhCjCKbV52o43sCpayxDIZTyU8CXt
	qdt2WwDbopfr3c4Z9ZPjfJV47/Szx0rFsEkYzUcaGJ0MwAZ+L2bbABhsQ/jNlCiab1ZUdKk3EFq
	hh3Fv/aZjUjc/IYNlpcqP3Vm5jgkY9rh/L3UCIrxlrEKpw==
X-Google-Smtp-Source: AGHT+IHqFN+xF+o9m7Xx/deOcJ9/WXc9j/+gWYBjaafRCFoJroQXEYt2vPp6Im0nz23NvVeb4H3maw==
X-Received: by 2002:a17:903:1c3:b0:223:33cb:335f with SMTP id d9443c01a7336-22368fa17fbmr186193075ad.3.1740996024858;
        Mon, 03 Mar 2025 02:00:24 -0800 (PST)
Received: from localhost ([122.172.84.15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22350513ac4sm74177965ad.222.2025.03.03.02.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 02:00:24 -0800 (PST)
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
Subject: [PATCH V3 1/2] rust: Add clk helpers
Date: Mon,  3 Mar 2025 15:28:09 +0530
Message-Id: <171b6cd811ff4e913880ab33bc11e634f7cdeecb.1740995194.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1740995194.git.viresh.kumar@linaro.org>
References: <cover.1740995194.git.viresh.kumar@linaro.org>
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

