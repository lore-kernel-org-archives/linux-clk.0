Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1467330D3EE
	for <linux-clk@vger.kernel.org>; Wed, 12 Aug 2026 18:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786560005; cv=none; b=aQZiHnxh9BNEZctBstPUzrsGh8KI6O0ArDPgk2HbS7bxOxdnK/v96H9GuMOkcMfwJ4P5IAFUNPFFzhga5EuPfkzEt6ZBvJadGz6swmTrWabxoMBZ5v0GPttPMjMdrtCf3eQIUT8gK81woVBjg7vCzwDAHIUE04EOUayXDkPtymY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786560005; c=relaxed/simple;
	bh=4P5YzhdjWRvZro4L9as7n6iOh8nU57i78r8b3/U0BpI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UlY9yNw3Ac2dq3guzrR9y4h2DSbd6H4wtNpSuf023XZg95kv5LmkPjemqE8XGkMzzmWDaomaxmKnUCj0VaGT3m+a/FDggwbyZNcW/86iIsvEbjyNvjQf9vxmQNCddbFllaQxJNNavexGT5Y1lEqEj8gPs/lgbT+/IFeFnrxOiq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K6DdzFQ/; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K6DdzFQ/"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cc7ef7ec27so16411015ad.1
        for <linux-clk@vger.kernel.org>; Wed, 12 Aug 2026 11:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786560003; x=1787164803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XRB9D8tHiycOW0JZ0af8VBWlDQDUFD2KIawSC2R9TIQ=;
        b=K6DdzFQ/LCMBG24NPe3EAswG8nVf8ZvQ785wmFPWbmaluOOGPthEXQ8xrnHoxmG3fV
         a5103mELGdQweADJ1UrqepbKxOf0b7Na6ATVnP2eSqg5uQBvuqGTxmd3RtxQziwvkuqP
         sXqJoECJzog/tf4LTD6GP8dNsQMdRIDrYQo5gaZRDLa7oY+GQJ5XDSNFnDO6vyabV9DA
         SJTHCNUA7s7hQVIOiHDk3YV1U8WUIh+PrDwe93LQGxIkq6yMRshwYfsCc96dlGpjH3MO
         xrFq4vZXh9PS4QZhctb6wgPikFq6pBgt9oii1lKM1ndekOFqHo++AkxXc+XvXuyAAbRO
         B06g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786560003; x=1787164803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XRB9D8tHiycOW0JZ0af8VBWlDQDUFD2KIawSC2R9TIQ=;
        b=ZJNP2IthYQkwMB6KxdA5YpjtasdS98DA2n1mWcuhj60tDU2WIpBeFtvZUNvoEyr2iR
         ZZ7862TG+z/woL8SvKk6hpO2MSJRHPMJVRBYrSaiC2dQgu4423UvLssneKT/gYz8fHxm
         aCNHRNViqHQj6yZPAMa9z3mSPzDZFVPVNqYsxuF5kvwpI07kRVXNb6iV3ToTb9rTsObO
         tNtBL+Rct89HlI7sx3dyHk744QFormD4QxHX84O6yuX8eLtBff4P3SUa13hLfmFN1yH6
         D//4SKIaaEx7Yf08YeHyaWPNbPh3oefFGIMO/ulunsaS2TWadKCssg0mfRSoFcHTUSTk
         Vzng==
X-Gm-Message-State: AOJu0YzqEeA73rVfmET2lY7bGwa5KaZD4MeHK14seKEoSM9USuL+wy/v
	fYULSJweM7lRqydrzz6bAfFcmFr5Wp5nTFsAN1xiE0baKi9hWWzWCQNTBjQ1bQ==
X-Gm-Gg: AR+sD13DWxL9EtMLiXtw3Lxwzz/b/Mw6F7Sm8IgDlDAsiwImXgW4q4ZeiGqJzmoaxSH
	p7sjKVELIqGgzIBRSLLaZvm7F7A99oVSbGPOKKbqyX/otFmgIqtrn+xsKm8GIG9kVzVEktZDI5P
	agLfFeMsW5XjFVuT8ID9hfnXhXPbZw+hk/dFPPMwGE4Yq7axzx5QkZe0m033SgioGYkHtaprHAF
	1KBR0UYDSzIRWbIXJVaxYbFD3A65IltBfRhgH0kAkyUR915dBy+Fi7wKHXgPiSFxUZGPYl9Cl+Y
	ood0huZQwf09I/wlXwVCH9mdZok45m1M4mpmOY8FUPVBssOK7m39rBrX2MhiEl3UTWr5Bv9LxBL
	v9Rc9f7oxHEEfksgy9FTtscEWQuQf0+9LeaEahl/qqd6tk1DDFf1XXNWtvIFAyoS3oHQxr112qZ
	owZAn5Q2MALJLRvXNJ80RnvuqZurYapjpeAK2bcfZtpGFFwdKlK4F+PcbllkZEoTo37Bcgbkizm
	1nH4970JBULanRU3EGXOhj8SxNFo8iIo3Lrt2d5Yiy0q08EcV43M8/AXldcUHrhZ3qY2OQufFUR
	hhxv1pL76+6bZaHDFJFpnu04lEetCFxWuzw9fVucJo/L+tZn
X-Received: by 2002:a17:903:298b:b0:2c6:90ec:f601 with SMTP id d9443c01a7336-2d37d57b4eamr20745ad.8.1786560003220;
        Wed, 12 Aug 2026 11:40:03 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d37c26d0fbsm661405ad.37.2026.08.12.11.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 11:40:02 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	David Lechner <david@lechnology.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv3] clk: davinci: add COMPILE_TEST support
Date: Wed, 12 Aug 2026 11:40:01 -0700
Message-ID: <20260812184001.75093-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a driver-scoped Kconfig symbol for the DaVinci clock drivers so
they can be built through COMPILE_TEST without selecting the ARM
DaVinci platform symbols.

Keep the existing ARM platform behavior by defaulting the new symbol
from ARCH_DAVINCI, and use it for the davinci clock Makefile entries.
ARCH_DAVINCI_DA850 is the only remaining DaVinci platform symbol, so a
single COMMON_CLK_DAVINCI symbol suffices; the whole directory builds
together just fine.

Assisted-by: Codex:GPT-5.5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
Reviewed-by: Brian Masney <bmasney@redhat.com>
---
 v3: remove pointless symbols for single user.
 v2: use COMMON_CLK prefix.
 drivers/clk/Kconfig          |  1 +
 drivers/clk/Makefile         |  2 +-
 drivers/clk/davinci/Kconfig  | 10 ++++++++++
 drivers/clk/davinci/Makefile |  8 +++-----
 4 files changed, 15 insertions(+), 6 deletions(-)
 create mode 100644 drivers/clk/davinci/Kconfig

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index fe68534e7b04..cb69872401fd 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -518,6 +518,7 @@ source "drivers/clk/actions/Kconfig"
 source "drivers/clk/analogbits/Kconfig"
 source "drivers/clk/aspeed/Kconfig"
 source "drivers/clk/bcm/Kconfig"
+source "drivers/clk/davinci/Kconfig"
 source "drivers/clk/eswin/Kconfig"
 source "drivers/clk/hisilicon/Kconfig"
 source "drivers/clk/imgtec/Kconfig"
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 26f15cfdd6b2..d7f9dedde011 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -119,7 +119,7 @@ obj-$(CONFIG_ARCH_ARTPEC)		+= axis/
 obj-$(CONFIG_ARC_PLAT_AXS10X)		+= axs10x/
 obj-y					+= bcm/
 obj-$(CONFIG_ARCH_BERLIN)		+= berlin/
-obj-$(CONFIG_ARCH_DAVINCI)		+= davinci/
+obj-$(CONFIG_COMMON_CLK_DAVINCI)	+= davinci/
 obj-$(CONFIG_COMMON_CLK_ESWIN)		+= eswin/
 obj-$(CONFIG_COMMON_CLK_HISI)		+= hisilicon/
 obj-y					+= imgtec/
diff --git a/drivers/clk/davinci/Kconfig b/drivers/clk/davinci/Kconfig
new file mode 100644
index 000000000000..7b8c518ef6b4
--- /dev/null
+++ b/drivers/clk/davinci/Kconfig
@@ -0,0 +1,10 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config COMMON_CLK_DAVINCI
+	bool "Clock drivers for TI DaVinci SoCs"
+	depends on ARCH_DAVINCI || COMPILE_TEST
+	depends on HAS_IOMEM
+	select REGMAP_MMIO
+	select RESET_CONTROLLER
+	default ARCH_DAVINCI
+	help
+	  Support for the clock controllers found on TI DaVinci SoCs.
diff --git a/drivers/clk/davinci/Makefile b/drivers/clk/davinci/Makefile
index f9d5c9a392e4..7cb030b5e046 100644
--- a/drivers/clk/davinci/Makefile
+++ b/drivers/clk/davinci/Makefile
@@ -1,11 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0
 
-ifeq ($(CONFIG_COMMON_CLK), y)
-obj-$(CONFIG_ARCH_DAVINCI_DA8XX)	+= da8xx-cfgchip.o
+obj-y += da8xx-cfgchip.o
 
 obj-y += pll.o
-obj-$(CONFIG_ARCH_DAVINCI_DA850)	+= pll-da850.o
+obj-y += pll-da850.o
 
 obj-y += psc.o
-obj-$(CONFIG_ARCH_DAVINCI_DA850)	+= psc-da850.o
-endif
+obj-y += psc-da850.o
-- 
2.55.0

