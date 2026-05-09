Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F38637647E
	for <linux-clk@vger.kernel.org>; Sat,  9 May 2026 05:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778303490; cv=none; b=muVRY+dGbGtHylH+cYCdNFeK+6fzEmp4bBmRXrl9I3M6UdfIMv/qWnx2DBY8Y8PzMwARRvIRrJ896jQV46m0JQogOO2Rd7eVd/Nt8EGe9maqzrLXoYtKvjKlivOzPBN+pbW8601/kopMWDZonhQBBqL3FkeXmFKno5r6gvvZqbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778303490; c=relaxed/simple;
	bh=vqf9cXRfFn9C97UZ7Rrp6ta1EJUwME/SlnC8suh7SYM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PR6BpXNCu/UMJKCvt1UEspjxEj9hpxtNOpzemg7LjCbOQgOt+KI48w5EvanqyozR8yjReqGFwTd21eIropsa/TfG/2Nfk/d7zL7fOyg4fTllOp7IpVeR0q3kLLEW9Bx1lZqheOHeDglrZUKyRS/+uWEwW8SA/UkT5LYZDXFXkHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dtRsF3r2; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dtRsF3r2"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ad9a9be502so16329715ad.0
        for <linux-clk@vger.kernel.org>; Fri, 08 May 2026 22:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778303488; x=1778908288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zmbb0GtvOQ3Ohjh7GZ3z5cRx9zjtJUSAuN49gAkn1Qo=;
        b=dtRsF3r2Iwz12n2qOSM79F42ZSsnKvNqcviDbQ5zhsCGN/BaZw3CmHSOYzivamzh/J
         LwDIj5IfyytErcJ/TBjLr1c3atKSuphUrZ4QlQXPj6ZPZbrOLi96k6SsP4zPnEFhVkAA
         hw93LedMY+bKbyokR4cHQuNzVxQkuWEUXwpCxt79+vzCb8od+Cp+RUq+Teb7dAEqrtHE
         ecKbxkCHVwlHeYYh2ZOznVKLgGcKW4NKxaYXWYRKvmBzevNjPv9ssm0PKk9R6RJ2/uFS
         IJke+/gqzowJ/Mh1oGLHnEK2gmuFqlL4BIEU7k8v17N1GnH/Q5C5qD6LXt2jsnbzU8Gc
         qWTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778303488; x=1778908288;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zmbb0GtvOQ3Ohjh7GZ3z5cRx9zjtJUSAuN49gAkn1Qo=;
        b=dAI0onlIck+r86ndzjz834MmasPavLRX17MHPP19dQPxhiKIS8TaSBZBDFxYQfMZI7
         l/iTjtDgqmNL16/p9keWse0BCZdzGS7mdOjPL1twyKykY/rw7nV/3tVFubPUkm91eyzC
         JbKpP/4h6IgTHMYNzi6A1DBoSNxjz7PxOEoeWkV1b/KPM/XXq9dqLoUCo385ME6ISygh
         jbZ7RFjfjoTUvjjZQSJahwRMh66niOFng3tsQlFx9YLQomxgvFNS7u1LevfgBy40FC7P
         l1HbHTqc1mF2K94A9TrZz3v0Tu/z3BVuBHlg08ewxxLDisaZQ6rLgx4hRitfLjtjfxgx
         SMSA==
X-Gm-Message-State: AOJu0YxyCXiDjELHPXCO/nVX0SSzP/l2uj3vs0Twm9Rb5KzEMUNxxp2c
	l2Bt6PlZdfSQ5BPUeRDNbtwWWtugMPnKxuZqSUbrHYCnkLTC+0Dbr/kkmg7Kar1/
X-Gm-Gg: Acq92OGcJ/SRjdrOxS6b2P0FqWGvF3aaiioetlS7qOmXnmLsQ+V++jv+gSGv7FHUTzn
	AHoSJDbdiziaAaHdDauLX00f/AwVh3KVzSj2BbrkyydhKLN/bHQpVnzyLxUYJNsUymOnS0AxwZr
	oHD8Sn376/G1q3hw9sWtxZLc+Krkcw3gzWcdwsBV2bXphX7Bor/yAQOKjF77uvZP0YJItm+r9c9
	0TgtWNHjpfa73916EDM6p+cB9YrEjULBhcmEMFOpzJN9ajDPVHCU8sYR+47rw9JjHyK+id6oVMl
	03mirkI6ynRFNqVc3K/9k/T3WouOvyZIgmS91OYNAvNF5Hk1voWonRT4e3iw+TOTOdvSpXGq2nx
	NP/y0REw6c3CLaoDS9aC8W4tNU82h5L0jYoEgmEEmngi/hfj8jd0cy0TBL3+fIm/wTSCJZxbGT9
	jPKu2HaLHT8z7xATCVfgzPUnZmjZrxcwcPSQ8g8qA9w//9VmhElC9smoUFoKI4bCetPT8sxNjYI
	83TFzWtTDsKzeoTjEyEWyHNaEWJ3+XHjxg=
X-Received: by 2002:a17:903:1cd:b0:2ba:36f4:5844 with SMTP id d9443c01a7336-2ba78f63de4mr161628525ad.7.1778303487952;
        Fri, 08 May 2026 22:11:27 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d2709bsm41892915ad.5.2026.05.08.22.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 22:11:27 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] clk: hisilicon: allow COMPILE_TEST builds
Date: Fri,  8 May 2026 22:11:10 -0700
Message-ID: <20260509051110.1061393-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HiSilicon clock symbols already depend on ARCH_HISI or COMPILE_TEST,
but the parent clock Makefile only descends into the hisilicon directory
when ARCH_HISI is enabled.

Add a hidden family gate selected by the HiSilicon clock and reset symbols,
default it for ARCH_HISI, and use it for the parent Makefile descent.  This
keeps existing platform builds unchanged while allowing compile-test
coverage.

Tested with:
make LLVM=1 ARCH=loongarch drivers/clk/hisilicon/

Assisted-by: Codex:GPT-5.5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/clk/Makefile          |  2 +-
 drivers/clk/hisilicon/Kconfig | 14 ++++++++++++++
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 4b81757f9090..b20a0445828b 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -120,7 +120,7 @@ obj-y					+= bcm/
 obj-$(CONFIG_ARCH_BERLIN)		+= berlin/
 obj-$(CONFIG_COMMON_CLK_DAVINCI)	+= davinci/
 obj-$(CONFIG_COMMON_CLK_ESWIN)		+= eswin/
-obj-$(CONFIG_ARCH_HISI)			+= hisilicon/
+obj-$(CONFIG_COMMON_CLK_HISI)		+= hisilicon/
 obj-y					+= imgtec/
 obj-y					+= imx/
 obj-y					+= ingenic/
diff --git a/drivers/clk/hisilicon/Kconfig b/drivers/clk/hisilicon/Kconfig
index c1ec75aa4ccd..e70bcfa9105b 100644
--- a/drivers/clk/hisilicon/Kconfig
+++ b/drivers/clk/hisilicon/Kconfig
@@ -1,8 +1,13 @@
 # SPDX-License-Identifier: GPL-2.0-only
+config COMMON_CLK_HISI
+	bool
+	default ARCH_HISI
+
 config COMMON_CLK_HI3516CV300
 	tristate "HI3516CV300 Clock Driver"
 	depends on ARCH_HISI || COMPILE_TEST
 	select RESET_HISI
+	select COMMON_CLK_HISI
 	default ARCH_HISI
 	help
 	  Build the clock driver for hi3516cv300.
@@ -11,6 +16,7 @@ config COMMON_CLK_HI3519
 	tristate "Hi3519 Clock Driver"
 	depends on ARCH_HISI || COMPILE_TEST
 	select RESET_HISI
+	select COMMON_CLK_HISI
 	default ARCH_HISI
 	help
 	  Build the clock driver for hi3519.
@@ -19,6 +25,7 @@ config COMMON_CLK_HI3559A
 	bool "Hi3559A Clock Driver"
 	depends on ARCH_HISI || COMPILE_TEST
 	select RESET_HISI
+	select COMMON_CLK_HISI
 	default ARCH_HISI
 	help
 	  Build the clock driver for hi3559a.
@@ -26,6 +33,7 @@ config COMMON_CLK_HI3559A
 config COMMON_CLK_HI3660
 	bool "Hi3660 Clock Driver"
 	depends on ARCH_HISI || COMPILE_TEST
+	select COMMON_CLK_HISI
 	default ARCH_HISI
 	help
 	  Build the clock driver for hi3660.
@@ -33,6 +41,7 @@ config COMMON_CLK_HI3660
 config COMMON_CLK_HI3670
 	bool "Hi3670 Clock Driver"
 	depends on ARCH_HISI || COMPILE_TEST
+	select COMMON_CLK_HISI
 	default ARCH_HISI
 	help
 	  Build the clock driver for hi3670.
@@ -41,6 +50,7 @@ config COMMON_CLK_HI3798CV200
 	tristate "Hi3798CV200 Clock Driver"
 	depends on ARCH_HISI || COMPILE_TEST
 	select RESET_HISI
+	select COMMON_CLK_HISI
 	default ARCH_HISI
 	help
 	  Build the clock driver for hi3798cv200.
@@ -48,6 +58,7 @@ config COMMON_CLK_HI3798CV200
 config COMMON_CLK_HI6220
 	bool "Hi6220 Clock Driver"
 	depends on ARCH_HISI || COMPILE_TEST
+	select COMMON_CLK_HISI
 	default ARCH_HISI
 	help
 	  Build the Hisilicon Hi6220 clock driver based on the common clock framework.
@@ -55,6 +66,7 @@ config COMMON_CLK_HI6220
 config RESET_HISI
 	bool "HiSilicon Reset Controller Driver"
 	depends on ARCH_HISI || COMPILE_TEST
+	select COMMON_CLK_HISI
 	select RESET_CONTROLLER
 	help
 	  Build reset controller driver for HiSilicon device chipsets.
@@ -63,6 +75,7 @@ config STUB_CLK_HI6220
 	bool "Hi6220 Stub Clock Driver" if EXPERT
 	depends on (COMMON_CLK_HI6220 || COMPILE_TEST)
 	depends on MAILBOX
+	select COMMON_CLK_HISI
 	default COMMON_CLK_HI6220
 	help
 	  Build the Hisilicon Hi6220 stub clock driver.
@@ -71,6 +84,7 @@ config STUB_CLK_HI3660
 	bool "Hi3660 Stub Clock Driver" if EXPERT
 	depends on (COMMON_CLK_HI3660 || COMPILE_TEST)
 	depends on MAILBOX
+	select COMMON_CLK_HISI
 	default COMMON_CLK_HI3660
 	help
 	  Build the Hisilicon Hi3660 stub clock driver.
-- 
2.54.0

