Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9044AD7D0
	for <linux-clk@vger.kernel.org>; Wed,  2 Sep 2026 22:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788387620; cv=none; b=t6juwHbHOJed2DXCjd/LUK25cSw95aDBA7PLCv++T2eEBFYFfhal776+3mpFBFPtPVP+Nl+XelzlBOvaq6RHgczsR0aHXrmWACvtrdUJZUlL5C/vC8L8PCf5fqlayt6BCiJXOc+Ex8zhU8D+fe2QX4gu3I80kxr4hCs6f6ZA4kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788387620; c=relaxed/simple;
	bh=vxK97kKjZ3lVGvkiTJiojCl0+uWyc0eS118X0/+w+oo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kMM/shl+o/JasTF+0/nqOemwLchW8JMDB2LsQsP9yNHalSB1Kf9NYvIuTfh7RLFyDKkruiBcPutmTSs6QDuMNi32c8Aq8/gdiKBulkX2oc2X80UZHsvnaXGCeGazP/yfIHjqpIRtYEbLiH0USmKKfrlqsESa8Z/AMg37wkihKbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HGchz8ss; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HGchz8ss"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-396750cfee6so1415177a91.2
        for <linux-clk@vger.kernel.org>; Wed, 02 Sep 2026 15:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788387615; x=1788992415; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fyRUPWtmRNwWz6B/B/Z+kuE2rtbBrZ9WaHMXlXktatE=;
        b=HGchz8ss+vmykX5lTYhANf5aiNgsxyniR9sbRgLsPuPoyCdclPb0zNGTQBnQDGtUyG
         M04YGByQ3qMPU+GQ34Id3MV9klgzscXN6Mm8Sv9j68lWMZ1Iav1GWwmEaM76czvyb9wM
         PxA2XNDZsCXdI1d6S3YfQZZS4joglROHbzC1fAbte9jqgGlLVZr2RaQvuD11+z1ymptc
         Uc2ecCE5XmietFZw0Sxuajwgoyto1pmycVk7YCe17r/zDyw7Ez1f3Lu6sizerAZXuEga
         ppTXAwHD3LxntS12ZjbEtezxgqjpamdkEFzPFFUbW945kFdnMoVTkWx/+05Zjfh6iDwG
         oqkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788387615; x=1788992415;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fyRUPWtmRNwWz6B/B/Z+kuE2rtbBrZ9WaHMXlXktatE=;
        b=TofnLe4kW5qtoVFz0awSIw6cJfOiunfFUbPF1kqTUQhEmqal9lhZ0BGfu0YW5UZFnH
         dHZjKxONexbxevnxzdzVnVfYLj+aKBa/xtCKNF4zPzMgACdy9yZKRB6EsUKmu2i8iO7V
         +4h3N1fw+zOCGv1+3qrWgFIktHnDQ/yiBMwm7C9MLcykMUbmXsiliaoNt+rZvwwjD/RO
         qpqE7EIFwQ3vFnlWApv3zj9VPAT7nDnMW8+tMlIICQTwDkVTzQTd8xaorn0GKe6OpnpK
         12RF1mbzIUhlhU9sGSvHbcJ1CAKXB1N/prnST33ts9dLUss+sQdxGODdNvxBK5qYNU6D
         OcPQ==
X-Gm-Message-State: AFuF++n2Iot29li9VpnHABLa1X70DYEIlMhgCkkr22zSzKB0qEcNTiuN
	PLQbodHKoIr5G7z5s5Ex6J4Ge8/um+gQKvS9je12ja7nI+V1ce+uy3/q6CkGAA==
X-Gm-Gg: AYBFou2QDM9ZD0l+vhaJI2sad+tIqZ0Ce7GqRqpALnMTaGisRctYHs0krNVQ1QpX6Ys
	C3UCQOjsvZ2RHiAd8WSVUBpx/A8Prz+nDN6eTmUbyk33e9ckrx/llBKm6tECsUVN6I6Z+tjNVZi
	R4MCWaKpf0l3KqTz/RbmxfUuPs5nVQtIFcAsWmA5nwrsp9QMsNDHdLl0Aib3q7MqUJfupTFUvKm
	YM8X5eUP2b0eopSwueEmLxkaSlZKK2lX5xtixVLa/u/qrJ/pYhuEUejomME1N+G9+in9zDrr2II
	i8v4j+enJUISeRFBbyh7pN36L9n/H2qsLTB/em60+IVtiIeXYlNpfRAZ1gyKvB4hQ2PAWSzx7Iu
	vvZJpHxhz/A8F9O7DH0J8s3F8RQYFSU5tcy1PfZWBxM2ROMwH0oqm7It/Vju70BWR+1gfIe3j/c
	B+MharCRF/o/V3J1peGhRsY6uPXpNYzMPv3e3w8tEkSj9y6EWbmkSwPwM8ltKbl0IGGVPzXiJFQ
	6x3pwx3iBYI9IN8PKWAcs9rGTPAwmuRCrq7JCQb8uz2bLje5nCdwGGSknjp8g2yf9XFU2c+dJJ1
	6OVgdTJ4zmCG+nNq7ZBliD0Kr3+l2u+tjZGhRA==
X-Received: by 2002:a17:90b:6cc:b0:398:9bd5:490d with SMTP id 98e67ed59e1d1-39aee0eafb9mr12273618a91.20.1788387614634;
        Wed, 02 Sep 2026 15:20:14 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08766a2dsm1381049a91.15.2026.09.02.15.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 15:20:13 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	David Lechner <david@lechnology.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv4] clk: davinci: add COMPILE_TEST support
Date: Wed,  2 Sep 2026 15:20:12 -0700
Message-ID: <20260902222012.344765-1-rosenp@gmail.com>
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
 v4: rebase
 v3: remove pointless symbols for single user.
 v2: use COMMON_CLK prefix.
 drivers/clk/Kconfig          |  1 +
 drivers/clk/Makefile         |  2 +-
 drivers/clk/davinci/Kconfig  | 10 ++++++++++
 drivers/clk/davinci/Makefile |  8 +++-----
 4 files changed, 15 insertions(+), 6 deletions(-)
 create mode 100644 drivers/clk/davinci/Kconfig

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 36b4801ee46e..c2edbd3393b5 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -517,6 +517,7 @@ source "drivers/clk/analogbits/Kconfig"
 source "drivers/clk/aspeed/Kconfig"
 source "drivers/clk/bcm/Kconfig"
 source "drivers/clk/cix/Kconfig"
+source "drivers/clk/davinci/Kconfig"
 source "drivers/clk/eswin/Kconfig"
 source "drivers/clk/hisilicon/Kconfig"
 source "drivers/clk/imgtec/Kconfig"
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 64095c805e6b..69a09b7d0097 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -132,7 +132,7 @@ obj-$(CONFIG_ARC_PLAT_AXS10X)		+= axs10x/
 obj-y					+= bcm/
 obj-$(CONFIG_ARCH_BERLIN)		+= berlin/
 obj-y					+= cix/
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

