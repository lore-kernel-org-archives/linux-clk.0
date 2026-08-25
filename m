Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3243E557A
	for <linux-clk@vger.kernel.org>; Tue, 25 Aug 2026 21:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787693145; cv=none; b=jO37MYUUFtbhKwldbcimyzdP3wQyZRqsGX2HkJEzazC/lZRzLIAvJHEEwNJKa/e40VyN40s+uTteBmg9Jhp4HHbSIBiU8rzVDnQgX6Dbqk0EU7UsgYHRwCgNGHFy8n+BakJpxGJw4pa/+2+ibpbhhOHgh921RRBtY43cJTV15cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787693145; c=relaxed/simple;
	bh=VXnxm65KcPoQrJl8efexnj1nsMX1cHzVJZlNqvoDrr0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pXd2KU6TtbOGuXSyVc47ZkUmdK92veXA2xEBDcHleDvGY3x/pFQczZVzBSZNEMLaoBf1O0rDbBxZz8q+1biOMatGcCF1ocL2ez5aJLhdwS4jN3ylfmnb4gFoa0f8aLFXoIqKSx8hqgLRWHSbpyxn2o8fdLF609YKyPHZu0s8BcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ndX55agj; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ndX55agj"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c250c6a6a6eso34849466b.0
        for <linux-clk@vger.kernel.org>; Tue, 25 Aug 2026 14:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787693142; x=1788297942; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hl6uXHaDIlxUoQ9RAB6KP2TA3D97vD6HRvuIgwgxfMY=;
        b=ndX55agjQQxIIZh2XA6L69HzLUvbLwhT8jnCKjo2wA7b7bIBBszNxMGYArFLSY7m28
         5v0Styc5CN9VFlZo2qcHTwlHXEkj3ylg/2ditT7TlK4R83vJ5cQhh/bG9m8kE71BMPkt
         bgLiYsTQAGqhPysoIMM0Kp1aXKrT9G5UzhZLV0cTunFCh8/DkI6QWsDF5kHFZU1u4NYr
         XmMWP9/vMAunZMgT/CMlE/8JMkhEv1JSxwMQwCB3Dj3M3Am50yFDFqIgTMgv8vjF7DtL
         vgUILAeeQ4SUo/8Dap7GbYM1f6aDpNQQYzlHmiDraE1ZHbUZOSVCLE5WC+Q2dO/9RGJx
         dVlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787693142; x=1788297942;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hl6uXHaDIlxUoQ9RAB6KP2TA3D97vD6HRvuIgwgxfMY=;
        b=FsyG0Fa+EoFRFtTJl6wW1/DOgxZV6DgygzcEG/AWiEYSpyOVLnc/1Meu3XJJsDj4Nd
         e0eb6Ey0oKtS5ux4rxWW5S1g5v33ag7Anoef0nT8LP2rjnpZPXEOC/XfwnkrgFPvQcKm
         ZHY/+VUy8j68TXMvKvocTvjpuCZttf82r/SvL6uTXZ83dyz6b5nUhXgsH4Ua2wS3u9jR
         hAnG2+ta+H2uRTVPVtntOFnIFTs6HrRKz7t8V9U8sYOZjyVJ5h/Hvg6MVAPNFr+6+2J7
         nI4u9rj99/uS0d7wkdezzq2MkKvtCkPueBl7D+9jGbuY1SFOcnc/MJFxl6soCQbXPjFT
         g0wg==
X-Gm-Message-State: AFuF++kZg/BYg5ZL5FJxxjon55Vj5ViDnXQtm07V1iKhoY/oGy9vtcHI
	JwfbwBG7mf949n+PV76CxXv9ZaNAsuD0MRcI+sX1yqJ93KUfTTdhRoqb
X-Gm-Gg: AR+sD13AfZvyc0b/IES9B1ZwgeKYlpLty/Zo3wsiYXnN2Q/sSXIudl79KpLxh4e6NU6
	jX4FSGg+HpBNloLVDJ9Ys6Bnehw6hBUUwGtzF+tAtzp1fo0lJusxFvFbcZNkvZc7wtRFIEVoI7V
	rLtFr47EMZINyBlvrsuVHoqBFv8u7cM8nXR56r8xZ36yQgMJ0mgrp3AHtYQkFzEPamttDIRbuA3
	fGm6JVGevseLZ2WKyiibSUc/nclafx4sAg7WtyRceWG4RpnvRTFTPdYKUmoYe83KLCiUewS6fs+
	rvc8VvGNxZicViI3ENuiSa5pJm0cpqPPizrHXHd8vdEihn/ZHrWEuaNnCSffBi5IAA6c7Sbn8J+
	nYVfcW9qMNyvHoFjbJut5EioawSz9l7930lEi1GJlN+j7TwR2BhYAqt/S9Uv1frx2EzdHdRaxDw
	jspC+ucR0xAYIQEqwHnpaGkE0kNep0myWgSaV4C93oanx3VHNuPTuCWV8jGAXpmYPS9YOD+pBgC
	mxyjiV9
X-Received: by 2002:a17:907:1c84:b0:c24:bf0b:6b62 with SMTP id a640c23a62f3a-c250bb05c1cmr147298266b.4.1787693141547;
        Tue, 25 Aug 2026 14:25:41 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.227.34])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a9ec343sm98297866b.57.2026.08.25.14.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 14:25:40 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Wed, 26 Aug 2026 00:24:11 +0300
Subject: [PATCH v11 12/12] reset: zte: Add a zx297520v3 reset driver
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260826-zx29clk-v11-12-f8ad59c6426c@gmail.com>
References: <20260826-zx29clk-v11-0-f8ad59c6426c@gmail.com>
In-Reply-To: <20260826-zx29clk-v11-0-f8ad59c6426c@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, mfd@lists.linux.dev, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=13352;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=VXnxm65KcPoQrJl8efexnj1nsMX1cHzVJZlNqvoDrr0=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqjggD7wnjHjRZZNbRKG917C2Em/zQOhNbI404i
 KTS76ZVR2CJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCao4IAxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiLCiw//Se1G/FDrzZa1J8aim/f51DKr9mCsKm8
 2UeiIH9ZJEjhvWTxZYtmev8SSowXijXyjntKHDw2N27BAsk3H13tt8QeeAR3cB3MqW5iduxlvoL
 zkFQoX9JJJffGQK5YswZNsaWymHpFX07nR8kYQCOW1LUwwC0EECJKo3PyLfNkLDN61DT6AbxQr+
 Fzr77mBVUxELxjNkhe07BMAO+u0RpnkPEzMS/vpad/YDmhMVBqIvNoGs3+aD2o0CGZX4HiwbNac
 UATwcOixijuu8KtX3yQnUgtAIaV4EIR34nNLqXs0Tn0/uBkeslYFGzI8KDK1k50gzW0em/2PHVZ
 SW6xlGD1oNqi8Kl5x+ab+LRc5MIXVzvv4kzS5nU5yIttVCI6oKheI979kYnARrutZ2AtxO0Njwb
 ySQrajaCQfDR2RdD/nq9DWK15CQUtXVTu7Q2YCGFwYCWoZ0rzukCP56kJWq/kl+NvWU84VZxitr
 04p38jhhXwvhB2D0IXa7qoZ/tuVXC6+iXyH2uNt/E1/+tP3Q1V1RHS4gtJmbci2igOFJvp/RGeL
 kxb6b/u31TGNYLfVLJJ+teFHbliAHQJKnAizBbafee7ti1ZhL79dcyRZdffeHMc5J8PqRoqA8X0
 hvprYLD2SHJaiLqE3zzyMHDI+3v1pjVjFQofDe8qr7EROjESWsbI=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

This drives the MFD child devices created by the zte-zx297520v3-crm
driver.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---

v10:
Add ZSP reset in matrixcrm

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
 drivers/reset/reset-zte-zx297520v3.c | 237 +++++++++++++++++++++++++++++++++++
 4 files changed, 252 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a23d6134e8f7..9553ef3ace9f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3908,6 +3908,7 @@ F:	arch/arm/boot/dts/zte/
 F:	arch/arm/mach-zte/
 F:	drivers/clk/zte/
 F:	drivers/mfd/zte-zx297520v3-crm.c
+F:	drivers/reset/reset-zte-zx297520v3.c
 F:	include/dt-bindings/clock/zte,zx297520v3-clk.h
 F:	include/dt-bindings/phy/zte,zx297520v3-topcrm.h
 F:	include/dt-bindings/reset/zte,zx297520v3-reset.h
diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 3168ab1eea88..30fa1f2868ef 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -428,6 +428,19 @@ config RESET_UNIPHIER_GLUE
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
index 45ad17062462..3662824c5c36 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -52,5 +52,6 @@ obj-$(CONFIG_RESET_TI_TPS380X) += reset-tps380x.o
 obj-$(CONFIG_RESET_TN48M_CPLD) += reset-tn48m.o
 obj-$(CONFIG_RESET_UNIPHIER) += reset-uniphier.o
 obj-$(CONFIG_RESET_UNIPHIER_GLUE) += reset-uniphier-glue.o
+obj-$(CONFIG_RESET_ZTE_ZX297520V3) += reset-zte-zx297520v3.o
 obj-$(CONFIG_RESET_ZYNQ) += reset-zynq.o
 obj-$(CONFIG_RESET_ZYNQMP) += reset-zynqmp.o
diff --git a/drivers/reset/reset-zte-zx297520v3.c b/drivers/reset/reset-zte-zx297520v3.c
new file mode 100644
index 000000000000..48463c553b3f
--- /dev/null
+++ b/drivers/reset/reset-zte-zx297520v3.c
@@ -0,0 +1,237 @@
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
+	[ZX297520V3_ZSP_CORE_RESET]  = { .reg = 0x13c, .mask = BIT(0)            },
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
+	[ZX297520V3_ZSP_BUS_RESET]   = { .reg =  0x3c, .mask = BIT(0)            },
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

