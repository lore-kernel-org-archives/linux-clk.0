Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D18E329E61;
	Wed, 24 Dec 2025 05:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766554655; cv=none; b=uIhYcvo8RJcNPlTtwALe/UBU5dRXv5wcXeuXjDnWbn0iNeAucJVzkrNXA0bZnT0J5mO+TrJPHBQiJxLY1s8CH1xyyUoax3aLQtsHuwRidAqSDHYLvKuCAOWGdF+mP+45189F2NZcpOMabe6lkx3lUYrBWHV8TQR3UzB2z5DDClA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766554655; c=relaxed/simple;
	bh=QUP/lHHi7gANo6uybmooacUeZzMb6YNKU3yjZDuNONY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=C2TXg0XPhSPE+VYOu6k383SC9/FlsSHsK0iIlFztoIXAXtc9r26dJ/4y3ZkUo4yXFKpxUlFc8S3DS9FTKohlEeLkRZiZaaJm7ZDMCoy5yRsDP5NOGG3rRYZbBF14wSiidWGqLh9fAfl6/h/n1iIHbC0m68BpdeQgC+vpJbTAvp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 24 Dec
 2025 13:37:23 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 24 Dec 2025 13:37:23 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
Date: Wed, 24 Dec 2025 13:37:22 +0800
Subject: [PATCH v16 1/3] clk: aspeed: Move the existing ASPEED clk drivers
 into aspeed subdirectory.
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251224-upstream_clk-v16-1-8c1318f56c3c@aspeedtech.com>
References: <20251224-upstream_clk-v16-0-8c1318f56c3c@aspeedtech.com>
In-Reply-To: <20251224-upstream_clk-v16-0-8c1318f56c3c@aspeedtech.com>
To: Brian Masney <bmasney@redhat.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Joel Stanley
	<joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>
CC: <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
	"Ryan Chen" <ryan_chen@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766554643; l=4334;
 i=ryan_chen@aspeedtech.com; s=20251126; h=from:subject:message-id;
 bh=QUP/lHHi7gANo6uybmooacUeZzMb6YNKU3yjZDuNONY=;
 b=Oypthn77pCaBxdB7oBz8nF+59BEIkD9RU0xSiXqn1z/S67L3PMXguaHnK5GF0rGS33JiRFCbY
 Vjo7wgImDiEDbC7/PrhoJF7OToXr5Z2KqHbGQIAotDoZV9jn80FwNKE
X-Developer-Key: i=ryan_chen@aspeedtech.com; a=ed25519;
 pk=Xe73xY6tcnkuRjjbVAB/oU30KdB3FvG4nuJuILj7ZVc=

Prepare for long-term maintenance and future additions by introducing a
dedicated drivers/clk/aspeed/ subdirectory for ASPEED clock drivers.

Move the existing ASPEED clock drivers into the new
drivers/clk/aspeed/ subdirectory.

No functional change, file move only.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
 drivers/clk/Kconfig                    | 13 +------------
 drivers/clk/Makefile                   |  3 +--
 drivers/clk/aspeed/Kconfig             | 13 +++++++++++++
 drivers/clk/aspeed/Makefile            |  3 +++
 drivers/clk/{ => aspeed}/clk-aspeed.c  |  0
 drivers/clk/{ => aspeed}/clk-aspeed.h  |  0
 drivers/clk/{ => aspeed}/clk-ast2600.c |  0
 7 files changed, 18 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 3a1611008e48..c46920649c97 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -284,18 +284,6 @@ config COMMON_CLK_LAN966X
 	  LAN966X SoC. GCK generates and supplies clock to various peripherals
 	  within the SoC.
 
-config COMMON_CLK_ASPEED
-	bool "Clock driver for Aspeed BMC SoCs"
-	depends on ARCH_ASPEED || COMPILE_TEST
-	default ARCH_ASPEED
-	select MFD_SYSCON
-	select RESET_CONTROLLER
-	help
-	  This driver supports the SoC clocks on the Aspeed BMC platforms.
-
-	  The G4 and G5 series, including the ast2400 and ast2500, are supported
-	  by this driver.
-
 config COMMON_CLK_S2MPS11
 	tristate "Clock driver for S2MPS1X/S5M8767 MFD"
 	depends on MFD_SEC_CORE || COMPILE_TEST
@@ -513,6 +501,7 @@ config COMMON_CLK_RPMI
 
 source "drivers/clk/actions/Kconfig"
 source "drivers/clk/analogbits/Kconfig"
+source "drivers/clk/aspeed/Kconfig"
 source "drivers/clk/baikal-t1/Kconfig"
 source "drivers/clk/bcm/Kconfig"
 source "drivers/clk/hisilicon/Kconfig"
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 61ec08404442..f7bce3951a30 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -62,8 +62,6 @@ obj-$(CONFIG_COMMON_CLK_FIXED_MMIO)	+= clk-fixed-mmio.o
 obj-$(CONFIG_COMMON_CLK_FSL_FLEXSPI)	+= clk-fsl-flexspi.o
 obj-$(CONFIG_COMMON_CLK_FSL_SAI)	+= clk-fsl-sai.o
 obj-$(CONFIG_COMMON_CLK_GEMINI)		+= clk-gemini.o
-obj-$(CONFIG_COMMON_CLK_ASPEED)		+= clk-aspeed.o
-obj-$(CONFIG_MACH_ASPEED_G6)		+= clk-ast2600.o
 obj-$(CONFIG_ARCH_HIGHBANK)		+= clk-highbank.o
 obj-$(CONFIG_CLK_HSDK)			+= clk-hsdk-pll.o
 obj-$(CONFIG_COMMON_CLK_K210)		+= clk-k210.o
@@ -114,6 +112,7 @@ obj-$(CONFIG_COMMON_CLK_XGENE)		+= clk-xgene.o
 # please keep this section sorted lexicographically by directory path name
 obj-y					+= actions/
 obj-y					+= analogbits/
+obj-y					+= aspeed/
 obj-$(CONFIG_COMMON_CLK_AT91)		+= at91/
 obj-$(CONFIG_ARCH_ARTPEC)		+= axis/
 obj-$(CONFIG_ARC_PLAT_AXS10X)		+= axs10x/
diff --git a/drivers/clk/aspeed/Kconfig b/drivers/clk/aspeed/Kconfig
new file mode 100644
index 000000000000..c59b0a1f581c
--- /dev/null
+++ b/drivers/clk/aspeed/Kconfig
@@ -0,0 +1,13 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config COMMON_CLK_ASPEED
+        bool "Clock driver for Aspeed BMC SoCs"
+        depends on ARCH_ASPEED || COMPILE_TEST
+        default ARCH_ASPEED
+        select MFD_SYSCON
+        select RESET_CONTROLLER
+        help
+          This driver supports the SoC clocks on the Aspeed BMC platforms.
+
+          The G4 and G5 series, including the ast2400 and ast2500, are supported
+          by this driver.
diff --git a/drivers/clk/aspeed/Makefile b/drivers/clk/aspeed/Makefile
new file mode 100644
index 000000000000..7db136b89b1e
--- /dev/null
+++ b/drivers/clk/aspeed/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_COMMON_CLK_ASPEED)		+= clk-aspeed.o
+obj-$(CONFIG_MACH_ASPEED_G6)		+= clk-ast2600.o
diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/aspeed/clk-aspeed.c
similarity index 100%
rename from drivers/clk/clk-aspeed.c
rename to drivers/clk/aspeed/clk-aspeed.c
diff --git a/drivers/clk/clk-aspeed.h b/drivers/clk/aspeed/clk-aspeed.h
similarity index 100%
rename from drivers/clk/clk-aspeed.h
rename to drivers/clk/aspeed/clk-aspeed.h
diff --git a/drivers/clk/clk-ast2600.c b/drivers/clk/aspeed/clk-ast2600.c
similarity index 100%
rename from drivers/clk/clk-ast2600.c
rename to drivers/clk/aspeed/clk-ast2600.c

-- 
2.34.1

