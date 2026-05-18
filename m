Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57AE3A2556
	for <linux-clk@vger.kernel.org>; Mon, 18 May 2026 22:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779142372; cv=none; b=qY5iLjINsDpBvZL6zyOUwGcpcmd7gi5F+nF1oumuKaUyM6Euj/Gs2r1jnXikchQT0K46NVO9OTz/KLZmCICcApBuLyfZZuY+Lb69kxZTd9g8XjcXaiAyt8Jl8RP//tjJrTj6h2lxDMemb/ahk26O9+CGmkG0L/GKu3MZPucoxcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779142372; c=relaxed/simple;
	bh=J+tgaVmppo6bMeaWb9ihVDpwoliaqsB7qyiETjGZhaI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m2M0FeWVeqS5QBZvPlxEa60EjDvFZGw0t8Y0VAfGoa9UXs6ETWjyu4GafaZuhJT8MLqJBzrqVriEsSpV+AJfh6RFcdJqsxLXwGDJe6zvpHyjPgX2CWUoym1zECHYgnPBa94KQIztYrtarbJbPYo+wzasSfEq3Jm/gAiZnHm5/5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g5NIr/+C; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g5NIr/+C"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-82748257f5fso2410740b3a.1
        for <linux-clk@vger.kernel.org>; Mon, 18 May 2026 15:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779142369; x=1779747169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kpz3rbq9P9pH8i5JgQAH9XRkEkwWKb9Pq31/YwXsa/0=;
        b=g5NIr/+Cc6oG7FtHi4FbAyH15GNYKDA6UnBs/MZMq32hKhiA+jFW0OGbenLh1pyb8J
         ju98nl+X6+VXaDDQQIwUvANyluQuvLabc2UL1ShSTiLGZAtBTwu2e37ONdpTtGEz6SIL
         AspxKmpEOB/0+lzYmvfCsdujTu/bfmjfzYOiP8XZuFASc15gNhKFaovInL+7ugfJRzxh
         +ukMZ93ClWxye5s9QwOFk/adCMKOty78HtID+pO+/35OlB2C6x7e3LaLLCE8uepQmly+
         uTIu/UaD4t94JJMkn9O2k75MFHmPyEPoJ16xMpFPxEp724HMarqGidlSHgh/P/EsfJro
         jnDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779142369; x=1779747169;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kpz3rbq9P9pH8i5JgQAH9XRkEkwWKb9Pq31/YwXsa/0=;
        b=U2ZefZXbn4KvAE9V5l6ixSlAFgdxsDoKM3lzXaZ64SopJ01aUytr72U6Tn2PQUyyD7
         VKQHrlT8Q/aO2oKqYMBNsjVgZpd7VAxkpyC/+CeH0KjWkb2NS0GIo0/9QjsqQjpCpHms
         weaeoMm3rkOSVjJSeZW7vhPbObFbvLSFZ7+q0l5fr6yv3fH1gCgXIEOemced40AVrT8y
         KUtNUXmn3iPQl8Bpqy4jKK35Zfo7ON8xUiQDnyQ0HLOMdrQbukt/TwyK3ONII/Agt57b
         BIPd00Shst0ZrMkIBxKwWqwvDjS1ZUbRsYHupL0I3ntBayrV+dw8ZEPRW7GQKtbLg1mg
         qtUQ==
X-Gm-Message-State: AOJu0YzL1lTqDbVxaiFoBi7creKoi2mBqeoUWClr/0rAPlcXzm43w3kc
	Jw1wfS6iU3eK4VPSG43YkG0cMUaJQ1XW2Jhm56+Mn0ZB6ccONCp4YoK5pUSaF3QI
X-Gm-Gg: Acq92OFi1YEFGQuuw1BkRxnZin74dSf6JZHny/CebxT7xHc9HQBezx3MDm9PXQZwviF
	5/SgRKg1WPqJvpfSqk8F+hkdE2LYztCgNqL0Zwltfm8i4d2WH8UVIWsIDLWOTkLNPKANxcYyJkd
	V/zkHAf3pV/1PcmUp+IUuqsZQP9hBAwWQHth+VWsnMihFftr7+x1Hrm3H3UOuiHKlB1u2uLA7NM
	hRc8AoUkCTmlc96ihZfdT2pj5Q36aEiab8XLVM4JkjJ4dAbQksh2GHm1P2AYdaI/zYjFLu21K3o
	sYzsNWz/SwUcrPqmOmulBukeUI85ECZq3iFEJVwP2Cq6qUh6q74ln5XFOmmHHxNJM0JwW5ATkgE
	Gi1ldJkwI3XafOT9tYf6T0cqjzmr6MEEegcrh8llDrE21h19tkPkiB29K6Ke9OsrOMbl6MIg3eh
	59JwyIbGPFiFH3kVKARgJgO2HE8BoQysql5Y4tuwr2KYJWdJZVdjZdJEWgY6g4+vX4aKMKyHPPY
	D6AIEvrzdOByrQ1B08ggmrR+Z9BYLwbQpU=
X-Received: by 2002:a05:6a00:12c2:b0:82f:9a88:9092 with SMTP id d2e1a72fcca58-83f18ee3862mr17241901b3a.33.1779142369233;
        Mon, 18 May 2026 15:12:49 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19f7cca8sm15870899b3a.56.2026.05.18.15.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 15:12:48 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32 ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/STM32 ARCHITECTURE),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] clk: stm32: allow STM32MP COMPILE_TEST builds
Date: Mon, 18 May 2026 15:12:30 -0700
Message-ID: <20260518221230.19879-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

COMMON_CLK_STM32MP already allows COMPILE_TEST, but the parent clock
Makefile only descends into drivers/clk/stm32 for ARCH_STM32.  Use the
STM32MP clock symbol for that directory gate instead.

Building the STM32MP21 and STM32MP25 clock drivers then requires direct
linux/bitfield.h includes for FIELD_GET(), so add them as part of exposing
that compile-test coverage.

Tested with:
make LLVM=1 ARCH=loongarch drivers/clk/stm32/

Assisted-by: Codex:GPT-5.5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/clk/Makefile              | 2 +-
 drivers/clk/stm32/clk-stm32mp21.c | 1 +
 drivers/clk/stm32/clk-stm32mp25.c | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 9c3a9703ad92..0cd2223de3ca 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -150,7 +150,7 @@ obj-y					+= spacemit/
 obj-$(CONFIG_PLAT_SPEAR)		+= spear/
 obj-y					+= sprd/
 obj-$(CONFIG_ARCH_STI)			+= st/
-obj-$(CONFIG_ARCH_STM32)		+= stm32/
+obj-$(CONFIG_COMMON_CLK_STM32MP)	+= stm32/
 obj-y					+= starfive/
 obj-$(CONFIG_ARCH_SUNXI)		+= sunxi/
 obj-y					+= sunxi-ng/
diff --git a/drivers/clk/stm32/clk-stm32mp21.c b/drivers/clk/stm32/clk-stm32mp21.c
index c8a37b716bd5..3c143371c77e 100644
--- a/drivers/clk/stm32/clk-stm32mp21.c
+++ b/drivers/clk/stm32/clk-stm32mp21.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/bus/stm32_firewall_device.h>
+#include <linux/bitfield.h>
 #include <linux/clk-provider.h>
 #include <linux/io.h>
 #include <linux/platform_device.h>
diff --git a/drivers/clk/stm32/clk-stm32mp25.c b/drivers/clk/stm32/clk-stm32mp25.c
index 52f0e8a12926..cc95fac66449 100644
--- a/drivers/clk/stm32/clk-stm32mp25.c
+++ b/drivers/clk/stm32/clk-stm32mp25.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/bus/stm32_firewall_device.h>
+#include <linux/bitfield.h>
 #include <linux/clk-provider.h>
 #include <linux/io.h>
 #include <linux/platform_device.h>
-- 
2.54.0

