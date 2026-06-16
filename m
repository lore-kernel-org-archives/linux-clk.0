Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25BC0395DBE
	for <linux-clk@vger.kernel.org>; Tue, 16 Jun 2026 20:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781641654; cv=none; b=MwqD2hcHJJwG/uo9b7omZETLwL0eWo44HOxZzWrE4DgdyGMqOXCJpMkm30rDoObZC/jXsCVrbcYwm3f5atqYjCrW09/IfJX85BxVmP6eBdzB4xZnQ8lfrMco1/qLXLI2W0B4byl5AAL4R7Xky/aS0XsgZyK8xi+xcxOMo4Wfo8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781641654; c=relaxed/simple;
	bh=/Onf7SXVmixZtmZBhrlI1d4heQCOgMKCksLiEvEpIR4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oj59vBeaDgUctf3snrYsx1j4LYPt4TOZMaLHMtG2Ff9A1XWRq8Akiwih3r5lN9DPEQR3vS++jbWjvyF7Stgu5qwdo4T23Eq714TG+eU94QSfdkUpCO9e/nj99Y1Hy/yLX4usuUkwe5jYBQ172HUb77gcA1rSFVkh1AitWWcXsh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ec8dQWi8; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ec8dQWi8"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490a76757e5so36359275e9.2
        for <linux-clk@vger.kernel.org>; Tue, 16 Jun 2026 13:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781641651; x=1782246451; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gyQFQwJnUbTFEFdQPMoEQmAROc3LFCyt4oG2RWf7UYA=;
        b=Ec8dQWi8ltWf+z6OAczJ5BKyO1K/AWmfXNuNFUTTsNnJd51mkb9uk9ejFywDTKp0hr
         Uspldk0mF9u2dDAN7facFAdtNTfjFd6TVp/Z8i49399Xn79IpCtj4tX3wygJGXfTU4cv
         MdUO+88AYrqzxUdeQz36/L+dYJ9ghl7y4DYAcZMp9tjR7hC7L/PaWI9gZWonPmz4PRmm
         0hDYCfvK0V6+fygpkIaqFQ9HjXHVovWB4eAi5qCkMhC817+gPNkReqiVMdmnMDyDIBFJ
         x1wCriHuEAuAosfAaKu6ctXjViDbze0nyt4djarpEcqfDoB/YLkVmdHZ91xe8ELW2Grp
         iFlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781641651; x=1782246451;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gyQFQwJnUbTFEFdQPMoEQmAROc3LFCyt4oG2RWf7UYA=;
        b=EzRJIGENNy0sWvv1U+fullrCsxizrWGGT/wtM4u3SrSfAgg2Y4PTDz752aZqh3gAUm
         rCrYVCZ/okGgErsE55JqZ/fXg7f3RkIJhNXw703NMwjXMmCqf/Td6KZ8VfZYyJOIrPwu
         R1bcsXHh+g5oZo6dMnujiodjApWgqPfCmM7735nBR1Xufx/mGm0Iy3iSkYzRPHlkVCI8
         KUu7tUFYCGzl4T+JLTbjN1oV798nrnhsVnadvEy+MYyb9JRwyQwDn3DGo8GIlblqUVmG
         LZQKxalSFu8YRlkRaeejR9rk4O6Sd9ckvjmShSffGY0xzZUccodzk3e3vP0xX2Xb7+EG
         DU3w==
X-Gm-Message-State: AOJu0Yy33xVhLEZzpt82wJr6AKAdxkzSCmtVARRvOO86dsP5RRWXEek1
	2EdZ8ECg5xhft2BsChJSi1qBLKfWC+yCddUZaPt8PfG0Ue6nofVxgYpF
X-Gm-Gg: Acq92OGoM2ZNlG0FDaBfN1XQXWhqo0cLmYmiBIl+zrWaEWhA5o4wf9LZeLwqmp/4gQW
	L/rnX/rzCkJ730R6O0YQvj7+PcgE98uk3fORktWdZ4k5gu5xMlTAMTozlXc/ZKe04ONcNxNKdxI
	nvzKk4GmV/dB7bY3OFaJzkYvM4MezYKTZGoEHj4+3BSNO7RsqqmOZv72+g6g9QN6HytkYLZ4P8U
	163iTNJBhik1mSUZYfJKmFDdk1YTEO1JOjhYZSMtFEfxp69bV4PS3BPa/txbN1MN0I4LtXnH6+d
	l2/7eMDSjARuSDyJp+3T+SUm+mUl9wayCnypv5a+1KPsOTOf7RemDlooDJLnIkPxcPtjDUcxIlZ
	tEFJdTmPeZID+jqloIzGwW9R2yfUstfADaaFx6s8sawPaDI/f3e21HrgaKB1nXIOHfI9RbGMmAU
	ZieFvf6MHmFNJH1jfzjkUv3pPl58ttUGdbOw==
X-Received: by 2002:a05:600c:c09a:b0:490:bb37:9d49 with SMTP id 5b1f17b1804b1-492333bf9f6mr15269455e9.11.1781641651403;
        Tue, 16 Jun 2026 13:27:31 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a458f2sm89987005e9.3.2026.06.16.13.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 13:27:30 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Tue, 16 Jun 2026 23:26:30 +0300
Subject: [PATCH RFC v4 10/12] reset: zte: Add a zx297520v3 reset driver
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260616-zx29clk-v4-10-ca994bd22e9d@gmail.com>
References: <20260616-zx29clk-v4-0-ca994bd22e9d@gmail.com>
In-Reply-To: <20260616-zx29clk-v4-0-ca994bd22e9d@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=11093;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=/Onf7SXVmixZtmZBhrlI1d4heQCOgMKCksLiEvEpIR4=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqMbGGZTOmPtLBlyNbaMcWpanSPy4o/C2VjTjma
 bqpPM5kLaaJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCajGxhhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiJaUQ//Zc26M1HzXnLUzAvLgAPfOnYSemnKyuN
 uFndLu41BWHi4OSmYe2We8unIgoWPnA2+QfeVBSX419pVImDFPR40a67Pf+xxfSSiIUXMMEeQIc
 n7pO3Dn1lE7yXHyeWyb7Xe765VhZCHOPsZ/a2YDGqU/QhRtb++ZVvJWeyUZLPF6/fvOVSgkUWhY
 UNBjTUzcgh27yJIP54k+D2yY/AKbXgI5xIQpGKCDegm8WT68W+dtuyNwb9WwoeF5aMq5zsvH1UI
 Y4aSG7+zMzHHuDJRDsPV6mr4Ma9aLf3QVTsktT3o+wC0mcZZWGIjfu2gaTLwti2fPnFST91lwKO
 hkW+pYbPQCcgq7Rgyit4EQOKR+IRagTxBQBdHg/VyOT3xsRqi4EuuD0G+vqIMjCv7k4npNmMPGL
 c0KUw4NNMGfx8JGAf89JQ3D5k5AzUkRCNW/kUG0tJ56ac0fLfYi5VMmlH0FW8R1AKc1gI0zgjFO
 68d5b/rbAAFAHumx2gc5Og5WwvhAf/O66ebHt7oQlgXOkzRDTVby7bTkbbMMyzyKbtg+5ObXAUV
 t1wOXMCCjKlRJBeRWrk9fGtMOTXWIqTgY9bQgxhaiQrtIULuqlVCGLHK8nx5IZu6QvRvtmtgf6I
 Fo+88mc4F62KqSGGlUsUU3NSobc+Aba7etHHmhWueiL5coVe4BTM=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

This drives the auxiliary devices created by the clock driver.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
 MAINTAINERS                          |   1 +
 drivers/reset/Kconfig                |  11 ++
 drivers/reset/Makefile               |   1 +
 drivers/reset/reset-zte-zx297520v3.c | 224 +++++++++++++++++++++++++++++++++++
 4 files changed, 237 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f1f0459b2c72..55bf0290343a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3871,6 +3871,7 @@ F:	Documentation/devicetree/zte,zx297520v3-*
 F:	arch/arm/boot/dts/zte/
 F:	arch/arm/mach-zte/
 F:	drivers/clk/zte/
+F:	drivers/reset/reset-zte-zx297520v3.c
 F:	include/dt-bindings/clock/zte,zx297520v3-clk.h
 
 ARM/ZYNQ ARCHITECTURE
diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index d009eb0849a3..116dd23f1b8e 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -404,6 +404,17 @@ config RESET_UNIPHIER_GLUE
 	  on UniPhier SoCs. Say Y if you want to control reset signals
 	  provided by the glue layer.
 
+config RESET_ZTE_ZX297520V3
+	tristate "ZTE zx297520v3 Reset Driver"
+	depends on (ARCH_ZTE || COMPILE_TEST)
+	default CLK_ZTE_ZX297520V3
+	select AUXILIARY_BUS
+	help
+	  This enables the reset controller for ZTE zx297520v3 SoCs. The reset
+	  controller is part of the clock controller on this SoC. This driver
+	  operates on an auxiliary device exposed by the clock driver. Enable
+	  this driver if you plan to boot the kernel on a zx297520v3 based SoC.
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
index 000000000000..2022f4df2ebd
--- /dev/null
+++ b/drivers/reset/reset-zte-zx297520v3.c
@@ -0,0 +1,224 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Stefan Dösinger
+ */
+#include <dt-bindings/clock/zte,zx297520v3-clk.h>
+#include <linux/reset-controller.h>
+#include <linux/platform_device.h>
+#include <linux/auxiliary_bus.h>
+#include <linux/clk-provider.h>
+#include <linux/mfd/syscon.h>
+#include <linux/regmap.h>
+#include <linux/iopoll.h>
+#include <linux/delay.h>
+
+struct zte_reset_reg {
+	u32 mask, wait_mask;
+	u16 reg;
+};
+
+struct zte_reset_info {
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
+	int res;
+	u32 val;
+
+	res = regmap_set_bits(rst->map, rst->resets[id].reg, rst->resets[id].mask);
+	if (res)
+		return res;
+
+	/* This is a special case used only by USB reset */
+	if (rst->resets[id].wait_mask) {
+		return regmap_read_poll_timeout(rst->map, rst->resets[id].reg + 4, val,
+						val & rst->resets[id].wait_mask, 1, 100);
+	}
+
+	return 0;
+}
+
+static int zx29_rst_status(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	struct zte_reset *rst = to_zte_reset(rcdev);
+	int res;
+
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
+	 * coprocessor. Clocks for it are in matrixclk.
+	 */
+	[ZX297520V3_ZSP_RESET]       = { .reg = 0x13c, .mask = BIT(0)            },
+
+	[ZX297520V3_UART0_RESET]     = { .reg = 0x78,  .mask = BIT(6)  | BIT(7)  },
+	[ZX297520V3_I2C0_RESET]      = { .reg = 0x74,  .mask = BIT(8)  | BIT(9)  },
+	[ZX297520V3_RTC_RESET]       = { .reg = 0x74,  .mask = BIT(4)  | BIT(5)  },
+	[ZX297520V3_TIMER_T08_RESET] = { .reg = 0x78,  .mask = BIT(4)  | BIT(5)  },
+	[ZX297520V3_TIMER_T09_RESET] = { .reg = 0x78,  .mask = BIT(2)  | BIT(3)  },
+	[ZX297520V3_PMM_RESET]       = { .reg = 0x74,  .mask = BIT(0)  | BIT(1)  },
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
+	/* USB reset. This is slightly special because it needs to wait for a ready bit after
+	 * deasserting.
+	 */
+	[ZX297520V3_USB_RESET]      =  { .reg = 0x80,   .mask = BIT(3) | BIT(4) | BIT(5),
+		.wait_mask = BIT(1)},
+	[ZX297520V3_HSIC_RESET]      = { .reg = 0x80,   .mask = BIT(0) | BIT(1) | BIT(2),
+		.wait_mask = BIT(0)},
+};
+
+static const struct zte_reset_info zx297520v3_top_info = {
+	.resets = zx297520v3_top_resets,
+	.num = ARRAY_SIZE(zx297520v3_top_resets),
+};
+
+static const struct zte_reset_reg zx297520v3_matrix_resets[] = {
+	[ZX297520V3_CPU_RESET]       = { .reg =  0x28, .mask = BIT(1)            },
+	[ZX297520V3_EDCP_RESET]      = { .reg =  0x68, .mask = BIT(0)            },
+	[ZX297520V3_SD0_RESET]       = { .reg =  0x58, .mask = BIT(1)            },
+	[ZX297520V3_SD1_RESET]       = { .reg =  0x58, .mask = BIT(0)            },
+	[ZX297520V3_NAND_RESET]      = { .reg =  0x58, .mask = BIT(4)            },
+	[ZX297520V3_PDCFG_RESET]     = { .reg =  0x94, .mask = BIT(20)           },
+	[ZX297520V3_SSC_RESET]       = { .reg =  0x94, .mask = BIT(24)           },
+	[ZX297520V3_GMAC_RESET]      = { .reg = 0x114, .mask = BIT(0)  | BIT(1)  },
+	[ZX297520V3_VOU_RESET]       = { .reg = 0x16c, .mask = BIT(0)            },
+};
+
+static const struct zte_reset_info zx297520v3_matrix_info = {
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
+static const struct zte_reset_info zx297520v3_lsp_info = {
+	.resets = zx297520v3_lsp_resets,
+	.num = ARRAY_SIZE(zx297520v3_lsp_resets),
+};
+
+static int reset_zx297520v3_probe(struct auxiliary_device *adev,
+				  const struct auxiliary_device_id *id)
+{
+	const struct zte_reset_info *drv_info;
+	struct device *dev = &adev->dev;
+	struct zte_reset *rst;
+
+	drv_info = (struct zte_reset_info *)id->driver_data;
+
+	rst = devm_kzalloc(dev, sizeof(*rst), GFP_KERNEL);
+	if (!rst)
+		return -ENOMEM;
+
+	rst->resets = drv_info->resets;
+	rst->rcdev.owner = THIS_MODULE;
+	rst->rcdev.nr_resets = drv_info->num;
+	rst->rcdev.ops = &zx29_rst_ops;
+	rst->rcdev.of_node = dev->of_node;
+	rst->rcdev.dev = dev;
+	rst->rcdev.of_reset_n_cells = 1;
+
+	rst->map = device_node_to_regmap(dev->of_node);
+	if (IS_ERR(rst->map))
+		return dev_err_probe(dev, PTR_ERR(rst->map), "Cannot get parent syscon regmap\n");
+
+	return devm_reset_controller_register(dev, &rst->rcdev);
+}
+
+static const struct auxiliary_device_id reset_zx297520v3_ids[] = {
+	{
+		.name = "clk_zte.zx297520v3_toprst",
+		.driver_data = (kernel_ulong_t)&zx297520v3_top_info,
+	},
+	{
+		.name = "clk_zte.zx297520v3_matrixrst",
+		.driver_data = (kernel_ulong_t)&zx297520v3_matrix_info,
+	},
+	{
+		.name = "clk_zte.zx297520v3_lsprst",
+		.driver_data = (kernel_ulong_t)&zx297520v3_lsp_info,
+	},
+	{ },
+};
+
+MODULE_DEVICE_TABLE(auxiliary, reset_zx297520v3_ids);
+
+static struct auxiliary_driver reset_zx297520v3_drv = {
+	.name = "zx297520v3_reset",
+	.id_table = reset_zx297520v3_ids,
+	.probe = reset_zx297520v3_probe,
+};
+
+module_auxiliary_driver(reset_zx297520v3_drv);
+
+MODULE_AUTHOR("Stefan Dösinger <stefandoesinger@gmail.com>");
+MODULE_DESCRIPTION("ZTE zx297520v3 reset driver");
+MODULE_LICENSE("GPL");

-- 
2.53.0

