Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334F833E37A
	for <linux-clk@vger.kernel.org>; Sun,  2 Aug 2026 20:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785702907; cv=none; b=KqmhVgvlt+G861A7YPONqsL3/MIz3pZEESFaKeJgoZRC3Rmu8uQ22w0ariYoASf09IEpOhfsucHXbTDZNpsuAQvh9q0GDJ0eJPt2oSSJDISlEx+zOpPdfvWb+mqrpGsEXy2gter4500Ce9yPLCbYRJm4MLThFH/Q02soHt6+9MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785702907; c=relaxed/simple;
	bh=TRjy5bUxO+V8q3ch7n0l3OxN1Xkep+KvM97lNAPdEl4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ud9+ByBk54DM8h99cRFp1MczrhRrkmD1M3csfBX2NYvGPwxTblwQJCww1z3I7Y6De8SMLzXT5RtwshL5KIU79DwoXbPjoLPMRZExSxeuu+EzEIS7wZ68lY5Fu6hxNcvBrBiIdwGGRWs2DjOB+znujzYmnsWqkSSnLwlM6UcreV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f3Eroubj; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f3Eroubj"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493f6de72faso9343175e9.0
        for <linux-clk@vger.kernel.org>; Sun, 02 Aug 2026 13:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785702901; x=1786307701; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3MsuqA52qi+vSj2NqLmps4fkN4FAMP+ql8Q3pTmxUkM=;
        b=f3EroubjVC0NA4g/3SBIVYj+Q+dJmOdKJ2xYiJjU+qp60DNE/+avsNMaN/sLYZXsRQ
         ja+enO4J7fUndNqDJEWYeqsK8qsNL9Z7dBavrpfqoKtbrc3Z01495fhWQseRqoIs/zct
         6bdVi0YV83AVS9xS+xE6GgrmumqFZsB9UqrutBThyoYNIpqzKoCJi1smeQMmNY3n/GH3
         4kcM7djYLh5AUoTzwTHypiJBVIwA5O1Pf+hWGdRhJnLbGBSvrDME455mzYe96jqU1coL
         CI7CdNhjuf9hQ4q/FKpmE4/+LUJLsfbVSM9vaKEFkJzEbAB782kpGA+sVIuV1fpO3S+8
         +22g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785702901; x=1786307701;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3MsuqA52qi+vSj2NqLmps4fkN4FAMP+ql8Q3pTmxUkM=;
        b=CdtbSjFnar3dfDq37D0JIrfyEIlFnVUBInuOwqv2TFK931LwOCy1+Svj0o936jgALM
         RcwHlI+Z7FSsCL6OcTGpDSXl5WlUlW9jfdMInvQsVbdsTZZ3hPnH2lBIG+ER+Uveh9he
         5N5HYD7yTykK8MUaWEq6XwBfDahdqM8BdPP6wtsMAUQkasKZy9NSPsOyV4N+CbxMlJTR
         majMGmTUjySQQXDdnu5yDHei4pILr7nIYcDyQT6cu+OY5oxV87XPba6Ns5nc+VG4+Cs/
         +ujCoQ5a69OOgeKrpm3J9r7tp7WR3nw5pNt0b4WXk2qy7rg5g44Z69yFT+OjIb5NwQv+
         eOlw==
X-Gm-Message-State: AOJu0YyP7gFutuSXG2Cp6Nv36sdqkpTD0a6tkQuJdmvG1ErLhZiBS2Nx
	KXhZ0/6+23Sk5By6aAgP0127Xd5wYqrx3g966ziAeNS5yRoSgNNwg7Et
X-Gm-Gg: AR+sD11OinV9V58bcxD0hDxQ5YP0e2I6rt2rxf2UjcZ+oZIwBk32NTb076DegokcAVv
	MPvwsdRPlCYpXvx/n5DstJoUZJPXeOBVmj5iy6tSuQGEMwX0We8ne42dHyKUy4xANcBS5IUo/O9
	/KGilluZEKUZDbKsRTyA6bVFjHqNIZfOo3ufxnrNOMhAWXdwW097uWFL5npIWaHzub6w5YJsogw
	cxin8stqL7JRuSp+hbblUHUlmQtYfqZwyZfzpnQOvJXcd4120EWRTLYlU9ywqvc+Eer8hg/Q9B+
	V5QzB6+JFL4yCgjvu0IYcFHwIU0iqedfjiPBQPlhB/zE7gjS9BwIC1W1TL59dVsoUV1ZsTlzWcT
	PreXB1k6Wjh0w+8oTGPGtI+ir+NKQ9FWHXN6eStHNJ7nyBt9vUVtouxZEAYnyniFXP/AL366x1f
	sQDAxn+WJYOhXKU721M/5TvB5tjnbF1zDUppFCA0EtIDGHmZFgtRARZLSQf5zHpTUpqlDhUp7b
X-Received: by 2002:a05:600c:a42:b0:495:69eb:27d3 with SMTP id 5b1f17b1804b1-4980eba0a6fmr146621445e9.8.1785702900789;
        Sun, 02 Aug 2026 13:35:00 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.226.155])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807bb45ebsm118499905e9.4.2026.08.02.13.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 13:35:00 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Sun, 02 Aug 2026 23:33:43 +0300
Subject: [PATCH v9 11/12] reset: zte: Add a zx297520v3 reset driver
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260802-zx29clk-v9-11-d05530d85d28@gmail.com>
References: <20260802-zx29clk-v9-0-d05530d85d28@gmail.com>
In-Reply-To: <20260802-zx29clk-v9-0-d05530d85d28@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, mfd@lists.linux.dev, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=13237;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=TRjy5bUxO+V8q3ch7n0l3OxN1Xkep+KvM97lNAPdEl4=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqb6my8IkVTLt1SetWXhcIrQSdcOMel/KipWRG7
 Ia66+Z2YjKJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCam+pshsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiLOgA/6AgSJ4rTvUF+Uxb84CHdyz+TC4c3onDS
 j/916et8OfWw30wARF/7YXcYen2+XC3d2AzWvXr1eaPxNLAjS8YtL4azMh6o0ibf1hh48Wm/lAO
 irQf+V/B+R1+u5i3b43uRsiK+/3ymPti/sQQQ3U6/wVIW5dA0uVcDqo+qMKiZ30l530nnER/iVT
 Xl8WkdyT/8VjZ+DuFvwsd/vefo1EsNHa8erfctOPJMdR+6P0f8Hyh+G2t3BK2D4Dbc3GJvspxYN
 /9072LasHN2QTuLAkk9YHaB9vrQfxf/s5bItErFRp8Un1NDhYNjknYJBs1fLtNTwUCVsnaPyGRK
 93zpOyR3p4DCPafkzGLXTE31u+n9rNM3Nlpw9sbeXA7EHz5TlJ0SMVd4naWVoH7S4keXGwl0K33
 9FAW9sPsrXqWVAgM1F7KEwenFmcIRDFqeyuLJ02Lx9DtuR5lH9R4dHBzLmL/qiAct5Xr8isCsoJ
 ybVi8huv2ONmdlPBB1BSYjJvswP3LRMahIF5EJ3bGlY6BolEm+A71acvKP9vi6SUug2s9cwQcgC
 zMLRHSr9PzS6nkCyGA0MWlq+ajYj931nS/+F16TM5RnaN+SFEgk+4CrInVamzrF19SebpUDJ4vx
 bKu7bmKom45M+E+Tm003J8y4FbtJk7DVaLz172jR2djNOcYDKvjQ=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

This drives the MFD child devices created by the zte-zx297520v3-crm
driver.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---

v9:
Remove HSIC and USB PHY resets, the phy driver will access them through
the shared regmap directly
Sort include files alphabetically
Depend on HAS_IOMEM due to "select MFD_SYSCON" (Sashiko). This has some,
but not consistent, precedent in the same file

v8: Select MFD_SYSCON for COMPILE_TESTing this driver without the MFD
parent driver.

v7:
Add MODULE_DEVICE_TABLE (Philipp)
Add DDR control and LSP resets

v6:
Add a comment wrt checking all bits in .status() (Philipp)
include cleanup (Philipp, Sashiko)

v5:
Make top and matrix MFD children instead of aux devices
Split USB PHY reset into its own reset ID
Remove USB reset wait code - this will be handled via syscon from a
future minimal phy-zx29-usb driver
---
 MAINTAINERS                          |   1 +
 drivers/reset/Kconfig                |  13 ++
 drivers/reset/Makefile               |   1 +
 drivers/reset/reset-zte-zx297520v3.c | 236 +++++++++++++++++++++++++++++++++++
 4 files changed, 251 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 77fa86c671b8..eab0cdf8efac 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3917,6 +3917,7 @@ F:	arch/arm/boot/dts/zte/
 F:	arch/arm/mach-zte/
 F:	drivers/clk/zte/
 F:	drivers/mfd/zte-zx297520v3-crm.c
+F:	drivers/reset/reset-zte-zx297520v3.c
 F:	include/dt-bindings/clock/zte,zx297520v3-clk.h
 F:	include/dt-bindings/phy/zte,zx297520v3-topcrm.h
 F:	include/dt-bindings/reset/zte,zx297520v3-reset.h
diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index d009eb0849a3..b92bd0c16517 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -404,6 +404,19 @@ config RESET_UNIPHIER_GLUE
 	  on UniPhier SoCs. Say Y if you want to control reset signals
 	  provided by the glue layer.
 
+config RESET_ZTE_ZX297520V3
+	tristate "ZTE zx297520v3 Reset Driver"
+	depends on HAS_IOMEM
+	depends on MFD_ZTE_ZX297520V3_CRM || COMPILE_TEST
+	default SOC_ZX297520V3
+	select MFD_SYSCON
+	help
+	  This enables the reset controllers for ZTE zx297520v3 SoCs. The reset
+	  controllers are required for booting this board and are part of the
+	  clock and reset management controllers on this board, so you will also
+	  need MFD_ZTE_ZX297520V3_CRM. Enable this if you are building a kernel
+	  for a ZTE zx297520v3 based board.
+
 config RESET_ZYNQ
 	bool "ZYNQ Reset Driver" if COMPILE_TEST
 	default ARCH_ZYNQ
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index 3e52569bd276..9a8a48d44dc4 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -50,5 +50,6 @@ obj-$(CONFIG_RESET_TI_TPS380X) += reset-tps380x.o
 obj-$(CONFIG_RESET_TN48M_CPLD) += reset-tn48m.o
 obj-$(CONFIG_RESET_UNIPHIER) += reset-uniphier.o
 obj-$(CONFIG_RESET_UNIPHIER_GLUE) += reset-uniphier-glue.o
+obj-$(CONFIG_RESET_ZTE_ZX297520V3) += reset-zte-zx297520v3.o
 obj-$(CONFIG_RESET_ZYNQ) += reset-zynq.o
 obj-$(CONFIG_RESET_ZYNQMP) += reset-zynqmp.o
diff --git a/drivers/reset/reset-zte-zx297520v3.c b/drivers/reset/reset-zte-zx297520v3.c
new file mode 100644
index 000000000000..bc2801d43d10
--- /dev/null
+++ b/drivers/reset/reset-zte-zx297520v3.c
@@ -0,0 +1,236 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Stefan Dösinger
+ */
+#include <dt-bindings/reset/zte,zx297520v3-reset.h>
+
+#include <linux/bits.h>
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/reset-controller.h>
+#include <linux/types.h>
+
+/* Most devices on the zx297520v3 SoC have one reset bit per clock line. As a rule of thumb, the
+ * lower bit disconnects the device from the bus, similarly to turning off PCLK - registers read 0
+ * or hang indefinitely. Unlike PCLK, this reset may have a lingering effect after deasserting.
+ * E.g. timers will be disabled, but retain their counter value.
+ *
+ * The other bit resets the actual device registers.
+ *
+ * For some devices, e.g. GMAC, both reset bits behave in the same way: They disconnect the device
+ * and registers will have their default state after deasserting. For devices that have two reset
+ * bits, both need to be deasserted for the device to function.
+ */
+struct zte_reset_reg {
+	u32 mask;
+	u16 reg;
+};
+
+struct zte_reset_data {
+	const struct zte_reset_reg *resets;
+	unsigned int num;
+};
+
+struct zte_reset {
+	struct reset_controller_dev rcdev;
+	struct regmap *map;
+	const struct zte_reset_reg *resets;
+};
+
+static inline struct zte_reset *to_zte_reset(struct reset_controller_dev *rcdev)
+{
+	return container_of(rcdev, struct zte_reset, rcdev);
+}
+
+static int zx29_rst_assert(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	struct zte_reset *rst = to_zte_reset(rcdev);
+
+	return regmap_clear_bits(rst->map, rst->resets[id].reg, rst->resets[id].mask);
+}
+
+static int zx29_rst_deassert(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	struct zte_reset *rst = to_zte_reset(rcdev);
+
+	return regmap_set_bits(rst->map, rst->resets[id].reg, rst->resets[id].mask);
+}
+
+static int zx29_rst_status(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	struct zte_reset *rst = to_zte_reset(rcdev);
+	int res;
+
+	/* Devices with two reset bits need both deasserted to work. So only report them as
+	 * deasserted if both bits are set.
+	 *
+	 * assert()/deassert() will always clear/set both. The only reason a device might be in a
+	 * hybrid state is an unexpected handover state from the bootloader.
+	 */
+	res = regmap_test_bits(rst->map, rst->resets[id].reg, rst->resets[id].mask);
+	if (res < 0)
+		return res;
+
+	return !res;
+}
+
+static const struct reset_control_ops zx29_rst_ops = {
+	.assert		= zx29_rst_assert,
+	.deassert	= zx29_rst_deassert,
+	.status		= zx29_rst_status,
+};
+
+static const struct zte_reset_reg zx297520v3_top_resets[] = {
+	/* This bit is set by ZTE's cpko.ko blob, it looks like a reset bit for the LTE DSP
+	 * coprocessor. Clocks for it are in matrixcrm.
+	 */
+	[ZX297520V3_ZSP_RESET]       = { .reg = 0x13c, .mask = BIT(0)            },
+
+	[ZX297520V3_UART0_RESET]     = { .reg =  0x78, .mask = BIT(6)  | BIT(7)  },
+	[ZX297520V3_I2C0_RESET]      = { .reg =  0x74, .mask = BIT(8)  | BIT(9)  },
+	/* Only one reset. Bit 5 is settable but does not do anything observable */
+	[ZX297520V3_RTC_RESET]       = { .reg =  0x74, .mask = BIT(4)            },
+	[ZX297520V3_TIMER_T08_RESET] = { .reg =  0x78, .mask = BIT(4)  | BIT(5)  },
+	[ZX297520V3_TIMER_T09_RESET] = { .reg =  0x78, .mask = BIT(2)  | BIT(3)  },
+	/* Only one reset. Bit 0 is settable but does not do anything observable */
+	[ZX297520V3_PMM_RESET]       = { .reg =  0x74, .mask = BIT(1)            },
+
+	/* I haven't found any clocks for GPIO. It probably wouldn't make much
+	 * sense anyway. Only one reset bit per controller.
+	 */
+	[ZX297520V3_GPIO_RESET]      = { .reg =  0x74, .mask = BIT(3)            },
+	[ZX297520V3_GPIO8_RESET]     = { .reg =  0x74, .mask = BIT(2)            },
+
+	[ZX297520V3_TIMER_T12_RESET] = { .reg =  0x74, .mask = BIT(6)  | BIT(7)  },
+	[ZX297520V3_TIMER_T13_RESET] = { .reg =  0x7c, .mask = BIT(0)  | BIT(1)  },
+	[ZX297520V3_TIMER_T14_RESET] = { .reg =  0x7c, .mask = BIT(2)  | BIT(3)  },
+	[ZX297520V3_TIMER_T15_RESET] = { .reg =  0x74, .mask = BIT(10) | BIT(11) },
+	[ZX297520V3_TIMER_T16_RESET] = { .reg =  0x7c, .mask = BIT(4)  | BIT(5)  },
+	[ZX297520V3_TIMER_T17_RESET] = { .reg = 0x12c, .mask = BIT(0)  | BIT(1)  },
+	[ZX297520V3_WDT_T18_RESET]   = { .reg =  0x74, .mask = BIT(12) | BIT(13) },
+	[ZX297520V3_USIM1_RESET]     = { .reg =  0x74, .mask = BIT(14) | BIT(15) },
+	[ZX297520V3_AHB_RESET]       = { .reg =  0x70, .mask = BIT(0)  | BIT(1)  },
+
+	/* USB reset. 0x84 returns the USB device status (0x1 for HSIC up, 0x2 for USB up, but
+	 * all 3 bits (PCLK, WCLK, PHY) need to be deasserted for the device to report ready.
+	 * Thus polling the status is the responsibility of the USB PHY driver.
+	 */
+	[ZX297520V3_USB_RESET]       = { .reg =  0x80, .mask = BIT(4) | BIT(5)   },
+	[ZX297520V3_HSIC_RESET]      = { .reg =  0x80, .mask = BIT(1) | BIT(2)   },
+};
+
+static const struct zte_reset_data zx297520v3_topreset_data = {
+	.resets = zx297520v3_top_resets,
+	.num = ARRAY_SIZE(zx297520v3_top_resets),
+};
+
+static const struct zte_reset_reg zx297520v3_matrix_resets[] = {
+	[ZX297520V3_CPU_RESET]       = { .reg =  0x28, .mask = BIT(1)            },
+	[ZX297520V3_DDR_CTRL_RESET]  = { .reg = 0x100, .mask = BIT(10) | BIT(11) },
+	[ZX297520V3_EDCP_RESET]      = { .reg =  0x68, .mask = BIT(0)            },
+	[ZX297520V3_SD0_RESET]       = { .reg =  0x58, .mask = BIT(1)            },
+	[ZX297520V3_SD1_RESET]       = { .reg =  0x58, .mask = BIT(0)            },
+	[ZX297520V3_NAND_RESET]      = { .reg =  0x58, .mask = BIT(4)            },
+	[ZX297520V3_PDCFG_RESET]     = { .reg =  0x94, .mask = BIT(20)           },
+	[ZX297520V3_SSC_RESET]       = { .reg =  0x94, .mask = BIT(24)           },
+	[ZX297520V3_GMAC_RESET]      = { .reg = 0x114, .mask = BIT(0)  | BIT(1)  },
+	[ZX297520V3_VOU_RESET]       = { .reg = 0x16c, .mask = BIT(0)            },
+	[ZX297520V3_LSP_RESET]       = { .reg =  0x80, .mask = BIT(0)            },
+};
+
+static const struct zte_reset_data zx297520v3_matrixreset_data = {
+	.resets = zx297520v3_matrix_resets,
+	.num = ARRAY_SIZE(zx297520v3_matrix_resets),
+};
+
+static const struct zte_reset_reg zx297520v3_lsp_resets[] = {
+	[ZX297520V3_TIMER_L1_RESET]  = { .reg = 0x04,  .mask = BIT(8)  | BIT(9)  },
+	[ZX297520V3_WDT_L2_RESET]    = { .reg = 0x08,  .mask = BIT(8)  | BIT(9)  },
+	[ZX297520V3_WDT_L3_RESET]    = { .reg = 0x0c,  .mask = BIT(8)  | BIT(9)  },
+	[ZX297520V3_PWM_RESET]       = { .reg = 0x10,  .mask = BIT(8)  | BIT(9)  },
+	[ZX297520V3_I2S0_RESET]      = { .reg = 0x14,  .mask = BIT(8)  | BIT(9)  },
+	/* 0x18: Not writeable */
+	[ZX297520V3_I2S1_RESET]      = { .reg = 0x1c,  .mask = BIT(8)  | BIT(9)  },
+	/* 0x20: Not writeable */
+	[ZX297520V3_QSPI_RESET]      = { .reg = 0x24,  .mask = BIT(8)  | BIT(9)  },
+	[ZX297520V3_UART1_RESET]     = { .reg = 0x28,  .mask = BIT(8)  | BIT(9)  },
+	[ZX297520V3_I2C1_RESET]      = { .reg = 0x2c,  .mask = BIT(8)  | BIT(9)  },
+	[ZX297520V3_SPI0_RESET]      = { .reg = 0x30,  .mask = BIT(8)  | BIT(9)  },
+	[ZX297520V3_TIMER_LB_RESET]  = { .reg = 0x34,  .mask = BIT(8)  | BIT(9)  },
+	[ZX297520V3_TIMER_LC_RESET]  = { .reg = 0x38,  .mask = BIT(8)  | BIT(9)  },
+	[ZX297520V3_UART2_RESET]     = { .reg = 0x3c,  .mask = BIT(8)  | BIT(9)  },
+	[ZX297520V3_WDT_LE_RESET]    = { .reg = 0x40,  .mask = BIT(8)  | BIT(9)  },
+	[ZX297520V3_TIMER_LF_RESET]  = { .reg = 0x44,  .mask = BIT(8)  | BIT(9)  },
+	[ZX297520V3_SPI1_RESET]      = { .reg = 0x48,  .mask = BIT(8)  | BIT(9)  },
+	[ZX297520V3_TIMER_L11_RESET] = { .reg = 0x4c,  .mask = BIT(8)  | BIT(9)  },
+	[ZX297520V3_TDM_RESET]       = { .reg = 0x50,  .mask = BIT(8)  | BIT(9)  },
+};
+
+static const struct zte_reset_data zx297520v3_lspreset_data = {
+	.resets = zx297520v3_lsp_resets,
+	.num = ARRAY_SIZE(zx297520v3_lsp_resets),
+};
+
+static int reset_zx297520v3_probe(struct platform_device *pdev)
+{
+	const struct platform_device_id *id = platform_get_device_id(pdev);
+	struct device *dev = &pdev->dev;
+	struct device_node *of_node = dev->parent->of_node;
+	const struct zte_reset_data *data;
+	struct zte_reset *rst;
+
+	if (!id)
+		return -ENODEV;
+	data = (const struct zte_reset_data *)id->driver_data;
+
+	rst = devm_kzalloc(dev, sizeof(*rst), GFP_KERNEL);
+	if (!rst)
+		return -ENOMEM;
+
+	rst->resets = data->resets;
+	rst->rcdev.owner = THIS_MODULE;
+	rst->rcdev.nr_resets = data->num;
+	rst->rcdev.ops = &zx29_rst_ops;
+	rst->rcdev.of_node = of_node;
+	rst->rcdev.dev = dev;
+
+	rst->map = device_node_to_regmap(of_node);
+	if (IS_ERR(rst->map))
+		return dev_err_probe(dev, PTR_ERR(rst->map), "Cannot get parent syscon regmap\n");
+
+	return devm_reset_controller_register(dev, &rst->rcdev);
+}
+
+static const struct platform_device_id reset_zx297520v3_ids[] = {
+	{
+		.name = "zx297520v3-topreset",
+		.driver_data = (kernel_ulong_t)&zx297520v3_topreset_data,
+	},
+	{
+		.name = "zx297520v3-matrixreset",
+		.driver_data = (kernel_ulong_t)&zx297520v3_matrixreset_data,
+	},
+	{
+		.name = "zx297520v3-lspreset",
+		.driver_data = (kernel_ulong_t)&zx297520v3_lspreset_data,
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(platform, reset_zx297520v3_ids);
+
+static struct platform_driver reset_zx297520v3 = {
+	.probe = reset_zx297520v3_probe,
+	.driver = {
+		.name = "reset-zx297520v3",
+	},
+	.id_table = reset_zx297520v3_ids,
+};
+module_platform_driver(reset_zx297520v3);
+
+MODULE_AUTHOR("Stefan Dösinger <stefandoesinger@gmail.com>");
+MODULE_DESCRIPTION("ZTE zx297520v3 reset driver");
+MODULE_LICENSE("GPL");

-- 
2.54.0

