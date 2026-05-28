Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1E53655D5
	for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 21:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780005313; cv=none; b=hVoYiS4gG+l2tH5RxK6w+udxTGGsm9LdwCm8iHHJ32btVP/RGdy5eXSOtdOeyD7CrWMoihL1DU+xAvjjy12Rl3Yk5qNAtXCuk/f0BxhN8byEeWycEl2In5VJgXVw80VRo8ezg8fM/oz9zUsTzQpSK5vFTqosDdgC5/9Dc1TfNsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780005313; c=relaxed/simple;
	bh=nWWN49uCFlTbZz1zeZG83Cfh13/Aaz3hz9xtsHASmDA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A8yQ+cnzRgN2ocacFLalIpiNaDUfiZzRPBVsdSLD6N7aXPHyHKPqZiJxpzzIF9m+3n3jHY8jG0WkQ76xQdJWmKsWujKWo14t3f3PbadFnxB5CQQAZhWYy/tDClO+/IGty5a4MnL4N9Ee1+EDva4yH/mkSN2p54xrWsjYiG+QZEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dUNj76RC; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dUNj76RC"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48d146705b4so140059925e9.3
        for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 14:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780005308; x=1780610108; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hvIXFxlldS9mKGY6eVauaUPE2Z/sYvsNOMCQ9X5uQIY=;
        b=dUNj76RCJFatO3rRRp9Srv0g7VFIMAuDMLo55fYQSZrv9MZMHWDOwSrEqEEBMDbltT
         bFTuCZSGozD1oJdy9/2YHx6wiwYyR6d+krTk/VvYQo8eXpmwnLFZZc26S9TspMeCO98p
         Gqra+uyTgS0DkBOTbduxm+Z+izA+tX2EEz+Tb2OVK/CyvT0w7ivjNna2DVBpubqIaO8v
         3DHP7j7vWuBxbtzxWr27XNx/vOQfohNaSRYL+/XYr76ksIGx14+rImYtdbTnvJMbKBxS
         SXwI9ZK5xM3bjjNQKI5xp7FlCfGaerX+97sUzFesPZv6KSJcf96og6ZTRnbupopyCaFV
         lJuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780005308; x=1780610108;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hvIXFxlldS9mKGY6eVauaUPE2Z/sYvsNOMCQ9X5uQIY=;
        b=ZogpkBR0fGJVixRmHzkVDVQp/ZRQ/ipATTu0QwfUSJ3URbSzQhnbj9vwiU84gA77Ni
         aUxcL3QOHBpBgIonbvZAohCdHOkOVk3tTnuw7llzOLFDFor77TqykbZMjUWu3nIUSpsU
         Oqnr/h+tqPP9ObYy8g+AnU5N+dbP3jzwns2A4PjtGclKnPpX0KS+D4+Lv6UydiOTapW7
         jSLAk1DlG5WxzWR+SSdauPS0Zew+mR132sIFTQbj+esoP0SD3dPCrEeogBXa6XLJBaWd
         dgmE7tAUI2RpYl8jshSzKMLKJFpeKGv4nUzLExaYlqWMBII3uTJDqUGCqQyGfoG12ucK
         gjjg==
X-Gm-Message-State: AOJu0Yw1ai3saASc2mBBOWywjhnrXp+/2GSpRGQu7WLqGbPBTSEq8Ys3
	pyS7/WnBpvDxYIdM4iQlrPg45dhZNdzAZckiltUX6jN4jOmByQsPqf3M
X-Gm-Gg: Acq92OG+elRMeVhHUTV7A/Wh7cVd/BGD5sUcE2IOwoxkw6yPCKqgkTHsZHi9Pq/L2m/
	3/qEFmsvVEG5sb2H8rf6ez6M3jRAhQQRD1eZ772V8KUc6iA8Q4rSGgPZOuyvqncotpfMqbLdFVh
	Hzfys7tRWmkfpMabocwb/8QN1L9//tpoF6NE8QFgv3ozdNTJCzN+dA+G40dGEANxDsAMmkrLsCs
	FHrFvDcdYwqA1/pOEAZ8hLOZlvdD3pLkQigVrK+aSBZNDXmvv1HtXK1JPLbR440d9EUJYugOv86
	YSgVoucP5IBvwAAwqbzx5OJoNnVmfJ8cFU4G+bCeCv0SbvGMzXBMjqaUnpF40FHYyI96mnRnHKc
	cf1Yr2KnBAnEWIXGLrn3gIwNanl/A58892H3c/xfquQKDNX35+BRTONkdJ+olde6eBG1ANsUOKv
	VqfS/U1ALTxkAcHykVC90mPOHxhxLkk0XGglCI9nY3gIho
X-Received: by 2002:a05:600c:3b07:b0:490:5057:f602 with SMTP id 5b1f17b1804b1-4909c0cfa4fmr4134625e9.17.1780005307680;
        Thu, 28 May 2026 14:55:07 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.223])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c967c6csm1191085e9.2.2026.05.28.14.55.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 14:55:07 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Fri, 29 May 2026 00:53:00 +0300
Subject: [PATCH RFC v3 3/5] clk: zte: Introduce a driver for zx297520v3 top
 clocks and resets.
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260529-zx29clk-v3-3-c7fe54ea388f@gmail.com>
References: <20260529-zx29clk-v3-0-c7fe54ea388f@gmail.com>
In-Reply-To: <20260529-zx29clk-v3-0-c7fe54ea388f@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=51630;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=nWWN49uCFlTbZz1zeZG83Cfh13/Aaz3hz9xtsHASmDA=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqGLmoVdpvdUzFB72p6yN8A0U7Tfj6mNtS+W3mg
 ecxAeofXA+JAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCahi5qBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiInFA/+M3vrYLHAD+BF+YHi//ZCMIeoMQlyy1D
 973WzdUaP68xfmKL3QDWM3zjH9mzqXMt11NpEEUiRsIuUsWZwPHpYz6YKd8T8UTZjAwwuqCdlFv
 kfhgRumF9kb3T+kkr9atB6v87GbgGHjvZ3H4EMw5HK5Lk6gasmu/Dw18piyeQkXFev4XAZMbSYS
 Xnv2+VXOVLkSbi4JrRIAlA6vDNY1e69vgCQkYiZwYuD8MM7rzW462JN22Q654N/GpSbhXYFqj0+
 f15v2AVEeHDRrnCGcjWg38Y6bEZIG4NERhyEopnZp/hgfqUAIfQ4I5ODXdggQO3SFIDnHhwkM7I
 XZ12HHBJBvn0ubhKM1OZDLofUM/zsVKgLzTSh1kWJMuWenLZCplxOPaEVSMTNeNPUy05Sb2e3Vm
 cub42XB4hSd2ectCVx2Yx6tHCB57zVbMrsOBg829gZrDreYiPuOQiqC5vCp3khL2mOCceOW91oz
 LnHybnt9eJo+5Ci+ye0J383+M1UE4Fcynae1NJIGtFco8ztiEaRLBIK4Js+URHdNrXsOCoKhsF2
 shPqqGVyrcS6xquKa2c8UoLlYwnWI0k5KfZ1qRlRF+yI4e2uf2AamgxOA+wrbftb8/ASPM5a4uG
 CKO/aR8ZzP6zZrjahsNOGh011Fja5cLVyWY9KColg1dRFVekSsUM=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

This register space controls core devices: PLLs, the AHB bus, a lot of
timers, the USB controller, the Cortex M0 processor that boots the board
and a few other devices. For some reason the LTE coprocessor is also
partially controlled by it. The main application processor and DDR
memory are not found here though.

The register to reboot the board is also found here.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

---

Patch changlog:

v2:
*) Add code to set up PLLs
*) Merge top and matrix controllers into one device
*) Bugfixes pointed out by Sashiko
---
 MAINTAINERS                      |   1 +
 drivers/clk/Kconfig              |   1 +
 drivers/clk/Makefile             |   1 +
 drivers/clk/zte/Kconfig          |  18 +
 drivers/clk/zte/Makefile         |   5 +
 drivers/clk/zte/clk-zx297520v3.c | 775 +++++++++++++++++++++++++++++++++++++++
 drivers/clk/zte/pll.c            | 450 +++++++++++++++++++++++
 drivers/clk/zte/pll.h            |  23 ++
 8 files changed, 1274 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ae51d590d440..aecd6d945290 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3867,6 +3867,7 @@ F:	Documentation/devicetree/bindings/arm/zte.yaml
 F:	Documentation/devicetree/zte,zx297520v3-*
 F:	arch/arm/boot/dts/zte/
 F:	arch/arm/mach-zte/
+F:	drivers/clk/zte/
 F:	include/dt-bindings/clock/zte,zx297520v3-clk.h
 
 ARM/ZYNQ ARCHITECTURE
diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 1717ce75a907..6c5e089b4dbe 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -546,6 +546,7 @@ source "drivers/clk/visconti/Kconfig"
 source "drivers/clk/x86/Kconfig"
 source "drivers/clk/xilinx/Kconfig"
 source "drivers/clk/zynqmp/Kconfig"
+source "drivers/clk/zte/Kconfig"
 
 # Kunit test cases
 config CLK_KUNIT_TEST
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index cc108a75a900..1a70a94cf759 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -167,5 +167,6 @@ ifeq ($(CONFIG_COMMON_CLK), y)
 obj-$(CONFIG_X86)			+= x86/
 endif
 obj-y					+= xilinx/
+obj-$(CONFIG_ARCH_ZTE)			+= zte/
 obj-$(CONFIG_ARCH_ZYNQ)			+= zynq/
 obj-$(CONFIG_COMMON_CLK_ZYNQMP)         += zynqmp/
diff --git a/drivers/clk/zte/Kconfig b/drivers/clk/zte/Kconfig
new file mode 100644
index 000000000000..e7acd28832cd
--- /dev/null
+++ b/drivers/clk/zte/Kconfig
@@ -0,0 +1,18 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# ZTE Clock Drivers
+#
+menu "Clock driver for ZTE SoC"
+	depends on ARCH_ZTE || COMPILE_TEST
+
+config COMMON_CLK_ZX297520V3
+	tristate "Clock driver for ZTE zx297520v3"
+	default SOC_ZX297520V3
+	help
+	  This driver supports ZTE zx297520v3 basic clocks.
+
+	  Enable this if you want to build a kernel that is able to run on
+	  boards based on this SoC. You can safely enable multiple clock
+	  drivers. The one(s) matching the device tree will be used.
+
+endmenu
diff --git a/drivers/clk/zte/Makefile b/drivers/clk/zte/Makefile
new file mode 100644
index 000000000000..abe3c6777c5d
--- /dev/null
+++ b/drivers/clk/zte/Makefile
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+obj-$(CONFIG_COMMON_CLK_ZX297520V3) += clk-zx29.o
+
+clk-zx29-y += clk-zx297520v3.o pll.o
diff --git a/drivers/clk/zte/clk-zx297520v3.c b/drivers/clk/zte/clk-zx297520v3.c
new file mode 100644
index 000000000000..986042dd4caf
--- /dev/null
+++ b/drivers/clk/zte/clk-zx297520v3.c
@@ -0,0 +1,775 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Stefan Dösinger
+ */
+#include <dt-bindings/clock/zte,zx297520v3-clk.h>
+#include <linux/reset-controller.h>
+#include <linux/platform_device.h>
+#include <linux/clk-provider.h>
+#include <linux/of_address.h>
+#include <linux/reboot.h>
+#include <linux/iopoll.h>
+#include <linux/delay.h>
+#include <linux/clk.h>
+#include <linux/io.h>
+
+#include "pll.h"
+
+/* All LSP and some Matrix registers contain both resets and clock gates, so access to them needs
+ * to be synchronized between the reset and clock callbacks.
+ */
+static DEFINE_SPINLOCK(reg_lock);
+
+struct zx29_reset_reg {
+	void __iomem *reg;
+	u32 mask, wait_mask;
+};
+
+struct zx29_clk_controller {
+	struct clk_hw_onecell_data *clocks;
+	struct reset_controller_dev rcdev;
+	struct zx29_reset_reg resets[];
+};
+
+static int __zx297520v3_rst_assert(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	struct zx29_clk_controller *data = container_of(rcdev, struct zx29_clk_controller,
+							    rcdev);
+	u32 val;
+
+	val = readl(data->resets[id].reg);
+	val &= ~data->resets[id].mask;
+	writel(val, data->resets[id].reg);
+
+	return 0;
+}
+
+static int zx297520v3_rst_assert(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	unsigned long flags;
+	int res;
+
+	spin_lock_irqsave(&reg_lock, flags);
+	res = __zx297520v3_rst_assert(rcdev, id);
+	spin_unlock_irqrestore(&reg_lock, flags);
+
+	return res;
+}
+
+static int __zx297520v3_rst_deassert(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	struct zx29_clk_controller *data = container_of(rcdev, struct zx29_clk_controller,
+							    rcdev);
+	u32 val;
+
+	val = readl(data->resets[id].reg);
+	val |= data->resets[id].mask;
+	writel(val, data->resets[id].reg);
+
+	/* This is a special case used only by USB reset */
+	if (data->resets[id].wait_mask) {
+		return readl_poll_timeout(data->resets[id].reg + 4, val,
+					  val & data->resets[id].wait_mask, 1, 100);
+	}
+
+	return 0;
+}
+
+static int zx297520v3_rst_deassert(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	unsigned long flags;
+	int res;
+
+	spin_lock_irqsave(&reg_lock, flags);
+	res = __zx297520v3_rst_deassert(rcdev, id);
+	spin_unlock_irqrestore(&reg_lock, flags);
+
+	return res;
+}
+
+static int zx297520v3_rst_reset(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	unsigned long flags;
+	int res;
+
+	spin_lock_irqsave(&reg_lock, flags);
+
+	res = __zx297520v3_rst_assert(rcdev, id);
+	if (res)
+		goto unlock;
+	udelay(100);
+	res = __zx297520v3_rst_deassert(rcdev, id);
+
+unlock:
+	spin_unlock_irqrestore(&reg_lock, flags);
+	return res;
+}
+
+static int zx297520v3_rst_status(struct reset_controller_dev *rcdev,
+			       unsigned long id)
+{
+	struct zx29_clk_controller *data = container_of(rcdev, struct zx29_clk_controller,
+							    rcdev);
+	u32 val;
+
+	val = readl(data->resets[id].reg);
+
+	return val & data->resets[id].mask;
+}
+
+const struct reset_control_ops zx297520v3_rst_ops = {
+	.assert		= zx297520v3_rst_assert,
+	.deassert	= zx297520v3_rst_deassert,
+	.reset		= zx297520v3_rst_reset,
+	.status		= zx297520v3_rst_status,
+};
+
+/* Used for gates where we don't know the parent input(s). Assume general bus clock. */
+static const char * const clk_unknown[] = {
+	"osc26m",
+};
+
+/* Used for gates where we know it is using the 26 mhz main clock. */
+static const char * const clk_main[] = {
+	"osc26m",
+};
+
+/* Top and matrix clocks are chaotic - I haven't found a consistent pattern behind their register
+ * and bit locations. Generally there are two gates (pclk, wclk), one mux, one reset and sometimes
+ * one divider, but exceptions apply. For some devices there is only a reset and some general
+ * (parent) clocks need setup. This structure plus macro handles the somewhat regular parts.
+ *
+ * There are some patterns that can be observed.
+ * mux 0x3c, div 0x48, gate 0x54
+ * mux 0x40, div 0x4c, gate 0x5c
+ * mux 0x44, div 0x50, gate 0x60
+ *
+ * For a 0 - 0xc - 0x18 pattern. Muxes from 0x3c to 0x44, dividers from 0x48 to 0x50, gates 0x54 to
+ * 0x60. The pattern is broken for timer t17 though.
+ *
+ * Gates have 4 bits per clock - bit 0 for wclk, bit 1 for pclk, bit 2 for something the ZTE kernel
+ * calls "gate" (the bits we use here are called "en"), which I don't know what it does, and bit 3
+ * seems unused. E.g. offset 0x54 accepts all bits in 0xF77F7F7F - suggesting RTC, I2C0 have an
+ * extra gate bit.
+ */
+struct zx297520v3_composite {
+	u32 reset_id, wclk_id, pclk_id;
+	const char *name;
+	u32 reset_reg, reset_shift;
+	u32 gate_reg, wclk_gate_shift, pclk_gate_shift;
+	const char *pclk_parent;
+	u32 mux_reg, mux_shift, mux_size;
+	const char * const *mux_sel;
+	u32 mux_sel_count;
+	u32 div_reg, div_shift, div_size;
+	u32 flags;
+};
+
+struct zx297520v3_gate {
+	u32 id;
+	const char *name, *parent;
+	u32 reg, shift;
+};
+
+#define _ZX_CLK(name, reset_reg, reset_shift, gate_reg, wclk_shift, pclk_shift, pclk_parent,\
+		mux_reg, mux_shift, mux_size, mux_sel,\
+		div_reg, div_shift, div_size, flags) \
+		{ZX297520V3_##name##_RESET, ZX297520V3_##name##_WCLK, ZX297520V3_##name##_PCLK,\
+		 #name, reset_reg, reset_shift, gate_reg, wclk_shift, pclk_shift, pclk_parent,\
+		 mux_reg, mux_shift, mux_size, mux_sel, ARRAY_SIZE(mux_sel),\
+		 div_reg, div_shift, div_size, flags}
+
+#define ZX_CLK(name, reset_reg, reset_shift, gate_reg, wclk_shift, pclk_shift,\
+	       mux_reg, mux_shift, mux_size, mux_sel,\
+	       div_reg, div_shift, div_size) \
+	       _ZX_CLK(name, reset_reg, reset_shift, gate_reg, wclk_shift, pclk_shift, "osc26m",\
+		mux_reg, mux_shift, mux_size, mux_sel,\
+		div_reg, div_shift, div_size, 0)
+
+#define ZX_CLK_CRIT(name, reset_reg, reset_shift, gate_reg, wclk_shift, pclk_shift,\
+	       mux_reg, mux_shift, mux_size, mux_sel,\
+	       div_reg, div_shift, div_size) \
+	       _ZX_CLK(name, reset_reg, reset_shift, gate_reg, wclk_shift, pclk_shift, "osc26m",\
+		mux_reg, mux_shift, mux_size, mux_sel,\
+		div_reg, div_shift, div_size, CLK_IS_CRITICAL)
+
+/* The default mpll settings multiply the 26 MHz reference clock times 24. A mux selection of 26 MHz
+ * could mean using the 26 MHz oscillator directly, or passing it through the PLL and divide by 24.
+ *
+ * If a UART is set to mpl_d6 (default 104 MHz), changing the mpll multipliers does affect UART
+ * timing as it should. This does not happen when the UART is set to 26 MHz input or timers that
+ * read 26 MHz input. This suggests 26 MHz clocks use the reference clock directly.
+ */
+static const char * const ahb_sel[] = {
+	"osc26m",
+	"mpll_d6",	/* 104 mhz */
+	"mpll_d8",	/* 78 mhz */
+	"mpll_d8",	/* 78 mhz */
+};
+
+static const char * const timer_top_sel[] = {
+	"osc32k",
+	"osc26m",
+};
+
+static const char * const uart_top_sel[] = {
+	"osc26m",
+	"mpll_d6",	/* 104 mhz */
+};
+
+static const char * const m0_sel[] = {
+	"osc26m",
+	"mpll_d6",	/* 104 mhz */
+	"mpll_d8",	/* 78 mhz */
+	"osc32k",	/* Yes, tested. It is SLLLLOOOOOWWW. */
+};
+
+static const struct zx297520v3_composite top_clocks[] = {
+	/*    (NAME,       RESET,     GATE,         MUX,                        DIV        ), */
+
+	/* AHB: Don't turn this one off. The clock mux works and impact can be tested e.g. with
+	 * iperf speed testing of the USB network connection. Values 2 and 3 give the same speed.
+	 */
+	ZX_CLK_CRIT(AHB,   0x70,  0,  0x54, 12, 13, 0x3c,  4, 2, ahb_sel,       0,     0, 0),
+
+	/* Pinmux (AON, TOP, IOCFG but not PDCFG). Critical as well until we have a driver that
+	 * consumes it. I don't think we'll realistically shut this off ever.
+	 *
+	 * Setting either bit 0 or 1 in register 0x58 makes the device work.
+	 */
+	ZX_CLK_CRIT(PMM,   0x74,  0,  0x58,  0,  1, 0x00,  0, 0, clk_unknown,   0,     0, 0),
+
+	/* Timers. We don't use any of them, just shut them off. The timers are named and sorted
+	 * by the IO address of the main timer controls. Some of the controls are documented in
+	 * ZTE's kernel. Some I found by trial and error.
+	 *
+	 * Timer T17 is used by the ZSP firmware. The rproc driver will enable them as needed.
+	 */
+	ZX_CLK(TIMER_T08,  0x78,   4, 0x5c,  8,  9, 0x40,  1, 1, timer_top_sel, 0x4c,   8, 4),
+	ZX_CLK(TIMER_T09,  0x78,   2, 0x5c,  4,  5, 0x40,  0, 1, timer_top_sel, 0x4c,   0, 4),
+	ZX_CLK(TIMER_T12,  0x74,   6, 0x54,  4,  5, 0x3c,  0, 1, timer_top_sel, 0x48,   0, 4),
+	ZX_CLK(TIMER_T13,  0x7c,   0, 0x60,  0,  1, 0x44,  0, 1, timer_top_sel, 0x50,   0, 4),
+	ZX_CLK(TIMER_T14,  0x7c,   2, 0x60,  4,  5, 0x44,  1, 1, timer_top_sel, 0x50,   4, 4),
+	ZX_CLK(TIMER_T15,  0x74,  10, 0x54, 20, 21, 0x3c,  3, 1, timer_top_sel, 0x48,   4, 4),
+	ZX_CLK(TIMER_T16,  0x7c,   4, 0x60,  8,  9, 0x44,  2, 1, timer_top_sel, 0x50,   8, 4),
+	ZX_CLK(TIMER_T17,  0x12c,  0, 0x128, 0,  1, 0x120, 0, 1, timer_top_sel, 0x124,  0, 4),
+
+	/* This watchdog is set up by the bootloader and in normal operation the m0 firmware will
+	 * feed the dog. The m0 firmware in turn wants to be fed in its own way. Since we normally
+	 * don't run any m0 firmware we shut it off by default and expose it to userspace via the
+	 * watchdog driver.
+	 */
+	ZX_CLK(WDT_T18,    0x74,  12, 0x54, 24, 25, 0x3c,  6, 1, timer_top_sel, 0x48,   8, 4),
+
+	ZX_CLK(I2C0,       0x74,   8, 0x54,  8,  9, 0x3c,  1, 1, uart_top_sel,  0,      0, 0),
+	ZX_CLK(UART0,      0x78,   6, 0x5c, 12, 13, 0x40,  2, 1, uart_top_sel,  0,      0, 0),
+
+	/* How does this RTC work? I don't know, the ZTE kernel does not talk to it. It has an
+	 * external RTC connected to I2C0.
+	 */
+	ZX_CLK(RTC,        0x74,   4, 0x54,  0,  1, 0x00,  0, 0, timer_top_sel, 0,      0, 0),
+
+	/* This doesn't see to be talking to the physical SIM card. I can turn it off on the ZTE
+	 * firmware without breaking LTE, and the "uicc" IRQ count keeps climbing. I think this is
+	 * a eSim-like chip that can be provisioned with data at runtime, but I have no idea how to
+	 * do it.
+	 */
+	ZX_CLK(USIM1,      0x74,  14, 0x54, 28, 29, 0x00,  0, 0, clk_main,      0x48,  12, 1),
+
+	/*    (NAME,       RESET,     GATE,         MUX,                        DIV         ), */
+};
+
+/* Stand-alone topclk gates. */
+static const struct zx297520v3_gate top_gates[] = {
+	{ZX297520V3_USB_24M,		"usb_24m",	"mpll_d26",	0x6c,	  3},
+	{ZX297520V3_USB_AHB,		"usb_ahb",	"AHB_wclk",	0x6c,	  4},
+	/* LTE: gate only as far as I can see. I looked for resets and did not find any. There may
+	 * be mux/div, but without understanding the behavior of this hardware it is impossible to
+	 * tell. They are sorted by physical MMIO address of the devices, which happens to be the
+	 * inverse order of the bits.
+	 *
+	 * I don't know what "LPM", "TD" and "W" mean. I copied them from ZTE's names.
+	 */
+	{ZX297520V3_LPM_GSM_WCLK,	"LPM_GSM_wclk",	clk_unknown[0],	0x58,	10},
+	{ZX297520V3_LPM_GSM_PCLK,	"LPM_GSM_pclk",	clk_unknown[0],	0x58,	11},
+	{ZX297520V3_LPM_LTE_WCLK,	"LPM_LTE_wclk",	clk_unknown[0],	0x58,	 8},
+	{ZX297520V3_LPM_LTE_PCLK,	"LPM_LTE_pclk",	clk_unknown[0],	0x58,	 9},
+	{ZX297520V3_LPM_TD_WCLK,	"LPM_TD_wclk",	clk_unknown[0],	0x58,	 6},
+	{ZX297520V3_LPM_TD_PCLK,	"LPM_TD_pclk",	clk_unknown[0],	0x58,	 7},
+	{ZX297520V3_LPM_W_WCLK,		"LPM_W_wclk",	clk_unknown[0],	0x58,	 4},
+	{ZX297520V3_LPM_W_PCLK,		"LPM_W_pclk",	clk_unknown[0],	0x58,	 5},
+	/* There are PCLKs for BROM/SRAM2 in 0x54, bit 16 and SRAM1 in 0x54, bit 18. Turning them
+	 * off locks up the Cortex M0 coproc. Not added to the kernel until a way is found to
+	 * recover the Cortex M0 or evidence of power savings.
+	 */
+
+	/* 4 Clock signals can be exposed to GPIO 15 (OUT0), 16 (OUT1), 17 (OUT2) and 18 (OUT32K).
+	 * It looks like OUT1 and OUT2 feed an optional camera. OUT0 feeds an optional sound codec.
+	 * Turning them off reduces noise in GPIO dumps. WCLK only although the ZTE camera code
+	 * talks about a "software control enable" bit (0x1) that needs to be set for OUT1 and OUT2.
+	 *
+	 * CLK_OUT1 has a MUX in top + 0x34 bits 6 and 7 and is the only clock that has upll as a
+	 * possible parent. CLK_OUT2 has a mux in bit 8, where 1 (default) selects osc26m. 0 is an
+	 * unknown clock.
+	 */
+	{ZX297520V3_OUT0_WCLK,		"OUT0_wclk",	clk_unknown[0],	0x34,	 0},
+	{ZX297520V3_OUT1_WCLK,		"OUT1_wclk",	"upll_d5",	0x90,	 2},
+	{ZX297520V3_OUT2_WCLK,		"OUT2_wclk",	"osc26m",	0x94,	 2},
+	{ZX297520V3_OUT32K_WCLK,	"OUT32k_wclk",	"osc32k",	0x34,	 1},
+};
+
+static const char * const cpu_sel[] = {
+	"osc26m",
+	"mpll",		/* 624 MHz */
+	"mpll_d2",	/* 312 MHz */
+	"mpll_d4",	/* 156 MHz */
+};
+
+static const char * const sd0_sel[] = {
+	"osc26m",
+	"mpll_d4",	/* 156 MHz */
+	"gpll_d2",	/* 100 MHz */
+	"mpll_d8",	/* 78 MHz */
+	"gpll_d4",	/* 50 MHz */
+	"gpll_d8",	/* 25 MHz */
+};
+
+static const char * const sd1_sel[] = {
+	"osc26m",
+	"gpll_d2",	/* 100 MHz */
+	"mpll_d8",	/* 78 MHz */
+	"gpll_d4",	/* 50 MHz */
+	"mpll_d16",	/* 39 MHz */
+	"gpll_d8",	/* 25 MHz */
+};
+
+static const char * const nand_sel[] = {
+	"mpll_d4",	/* 156 MHz */
+	"osc26m",
+};
+
+static const char * const edcp_sel[] = {
+	"osc26m",
+	"mpll_d4",	/* 156 MHz */
+	"mpll_d5",	/* 124.8 MHz */
+	"mpll_d6",	/* 104 MHz */
+};
+
+static const char * const tdm_sel[] = {
+	"osc26m",
+	"dpll_d4",	/* 122.88 MHz */
+	"mpll_d6",	/* 104 MHz */
+};
+
+static const struct zx297520v3_composite matrix_clocks[] = {
+	/* Both 0x24 and 0x28 bits 1 and 2 stop the CPU. There is also a bit in topclk+0x138, which
+	 * ZTE's uboot calls "A53 reset", which also stops the CPU. I can't really tell the
+	 * difference between matrix+28 and top+138. The clock can be disabled and enabled from the
+	 * Cortex M0 and it will nicely stop and restart the A53, retaining all state.
+	 *
+	 * 0x50, bits 0-3 have the DDR clock. A lot of DDR gates and resets are in 0x100.
+	 */
+	ZX_CLK_CRIT(CPU,    0x28,  1,  0x24,  1,  2, 0x20,  0, 2, cpu_sel,     0,     0, 0),
+	ZX_CLK(SD0,         0x58,  1,  0x54, 12, 13, 0x50,  4, 3, sd0_sel,     0,     0, 0),
+	ZX_CLK(SD1,         0x58,  0,  0x54,  4,  5, 0x50,  8, 3, sd1_sel,     0,     0, 0),
+	/* This is some "denali" NAND, not the qspi connected one. */
+	ZX_CLK(NAND,        0x58,  4,  0x54, 20, 21, 0x50, 12, 2, nand_sel,    0,     0, 0),
+	ZX_CLK(SSC,         0x94, 24,  0x84,  1,  2, 0,     0, 0, clk_unknown, 0,     0, 0),
+	ZX_CLK(EDCP,        0x68,  0,  0x64,  2,  1, 0x50, 16, 2, edcp_sel,    0,     0, 0),
+	/* PDCFG. Like PMM, either clock bit will allow the device to function. */
+	ZX_CLK_CRIT(PDCFG,  0x94, 20,  0x88,  0,  1, 0,     0, 0, clk_unknown, 0,     0, 0),
+	/* There are a lot more VOU related controls in these registers, but turning off the main
+	 * clock seems to shut off the entire VOU MMIO range.
+	 */
+	ZX_CLK(VOU,        0x16c,  0, 0x168,  0,  1, 0,     0, 0, clk_main,       0,     0, 0),
+};
+
+static const struct zx297520v3_gate matrix_gates[] = {
+	/* ZTE's driver has a statemt to the effect of *(matrix->base+0x11C) = 5, with a comment
+	 * suggesting that this sets a 50 mhz clock. The clock code itself lists the parents of
+	 * these clock as 50mhz pll output, but the GMAC driver never enables the clocks.
+	 *
+	 * The clocks below are enabled by the boot loader though, so they are on. And it turns
+	 * out that they are necessary for proper operation of the ethernet hardware. As far as
+	 * I can see trough experimentation, bit 1 affects the PHY whereas 0 and 2 affect the
+	 * MAC chip itself.
+	 *
+	 * Chain the wclk and rmii clk together for now. I haven't found a way to make either
+	 * the mdio node or the phy node enable a clock. According to ethernet-phy.yaml it is
+	 * supposed to be possible, but I can't find code to that effect in of_mdio.c.
+	 */
+	{ZX297520V3_GMAC_RMII,	"gmac_rmii",		"gpll_d4",	0x110,	  1},
+	{ZX297520V3_GMAC_WCLK,	"gmac_wclk",		"gmac_rmii",	0x110,	  2},
+	{ZX297520V3_GMAC_PCLK,	"gmac_pclk",		"gpll_d4",	0x110,	  0},
+
+	/* ZSP aka LTE DSP clock. I think there is a mux at matrix+0x30, but I have no idea
+	 * about the frequencies it selects. Gate is at matrix+0x3c.
+	 */
+	{ZX297520V3_ZSP_WCLK,	"zsp_wclk",		"osc26m",	0x3c,	  0},
+
+	/* Mailbox. I haven't found a reset for this. It seems to have a PCLK only - turning it off
+	 * makes the MMIO area read 0x0. It looks like it does not need a WCLK. It generates IRQs
+	 * fine with just bit 2 set. Bits 1 and 3 are 0 by default in this register.
+	 */
+	{ZX297520V3_MBOX_PCLK,	"mbox_pclk",		"osc26m",	0x88,	  2},
+
+	/* DMA Controller. It has a reset and PCLK, but no WCLK. */
+	{ZX297520V3_DMA_PCLK,	"dma_pclk",		"osc26m",	0x94,	  3},
+
+	/* There is another clock controlling some "GSM" IP at 0xF3000000 in 0x88, bit 8. It appears
+	 * to be a PCLK, but I have not found a matching WCLK or reset yet.
+	 */
+
+	/* I don't know how this clock works. Card detection in the way the dwc,mmc driver uses it
+	 * appears broken no matter this clock's setting.
+	 */
+	{ZX297520V3_SD0_CDET,	"sd0_cdet",		"osc32k",	0x54,	  14},
+	{ZX297520V3_SD1_CDET,	"sd1_cdet",		"osc32k",	0x54,	  6},
+
+	/* LSP uplink clocks. The PCLK is fairly obvious (disabling it shuts off the entire LSP
+	 * register area). The WCLK speeds were deduced by setting timers and qspi muxes to a
+	 * specific speed and seeing which bit in matrix+0x7c needs to be enabled for the device
+	 * to work.
+	 *
+	 * Due to the timers I am certain about the 26mhz and 32khz clocks. I cannot directly
+	 * observe the qspi mux frequency, so the clock rates depend on ZTE's qspi mux selection
+	 * being correct.
+	 *
+	 * Two additional bits are specific to sound components - the mux for the LSP's TDM IP is
+	 * in matrixclk and gets passed down. I2S has a mux in LSP, which can select the dpll_d4
+	 * clock.
+	 *
+	 * This code is commented out until the next patch because disabling unused clocks without
+	 * an LSP consumer breaks the UART.
+	 */
+	{ZX297520V3_LSP_MPLL_D5_WCLK,	"lsp_mpll_d5",	"mpll_d5",	0x7c,	  0},
+	{ZX297520V3_LSP_MPLL_D4_WCLK,	"lsp_mpll_d4",	"mpll_d4",	0x7c,	  1},
+	{ZX297520V3_LSP_MPLL_D6_WCLK,	"lsp_mpll_d6",	"mpll_d6",	0x7c,	  2},
+	{ZX297520V3_LSP_MPLL_D8_WCLK,	"lsp_mpll_d8",	"mpll_d8",	0x7c,	  3},
+	{ZX297520V3_LSP_MPLL_D12_WCLK,	"lsp_mpll_d12",	"mpll_d12",	0x7c,	  4},
+	{ZX297520V3_LSP_OSC26M_WCLK,	"lsp_osc26m",	"osc26m",	0x7c,	  5},
+	{ZX297520V3_LSP_OSC32K_WCLK,	"lsp_osc32k",	"osc32k",	0x7c,	  6},
+	{ZX297520V3_LSP_PCLK,		"lsp_pclk",	"osc26m",	0x7c,	  7},
+	{ZX297520V3_LSP_TDM_WCLK,	"lsp_tdm_wclk",	"tdm_mux",	0x7c,	  8},
+	{ZX297520V3_LSP_DPLL_D4_WCLK,	"lsp_dpll_d4",	"dpll_d4",	0x7c,	  9},
+};
+
+static int zx297520v3_composite(struct device *dev, void __iomem *base,
+				struct clk_hw_onecell_data *clocks, struct zx29_reset_reg *resets,
+				const struct zx297520v3_composite *input, size_t size)
+{
+	char pclk_name[32], wclk_name[32], mux_name[32], div_name[32];
+	const char *wclk_parent, *div_parent;
+	struct clk_hw *hw;
+	unsigned int i;
+
+	for (i = 0; i < size; ++i) {
+		snprintf(wclk_name, ARRAY_SIZE(wclk_name), "%s_wclk", input[i].name);
+		snprintf(pclk_name, ARRAY_SIZE(pclk_name), "%s_pclk", input[i].name);
+		snprintf(mux_name, ARRAY_SIZE(mux_name), "%s_mux", input[i].name);
+		snprintf(div_name, ARRAY_SIZE(div_name), "%s_div", input[i].name);
+
+		resets[input[i].reset_id].reg = base + input[i].reset_reg;
+		resets[input[i].reset_id].mask = BIT(input[i].reset_shift) +
+						 BIT(input[i].reset_shift + 1);
+
+		if (input[i].div_size)
+			wclk_parent = div_name;
+		else if (input[i].mux_size)
+			wclk_parent = mux_name;
+		else
+			wclk_parent = input[i].mux_sel[0];
+
+		hw = devm_clk_hw_register_gate(dev, pclk_name, input[i].pclk_parent, input[i].flags,
+					       base + input[i].gate_reg, input[i].pclk_gate_shift,
+					       0, &reg_lock);
+		if (IS_ERR(hw))
+			return PTR_ERR(hw);
+		clocks->hws[input[i].pclk_id] = hw;
+
+		if (input[i].mux_size) {
+			hw = devm_clk_hw_register_mux(dev, mux_name, input[i].mux_sel,
+						      input[i].mux_sel_count, 0,
+						      base + input[i].mux_reg,
+						      input[i].mux_shift, input[i].mux_size, 0,
+						      &reg_lock);
+			if (IS_ERR(hw))
+				return PTR_ERR(hw);
+			div_parent = mux_name;
+		} else {
+			div_parent = input[i].mux_sel[0];
+		}
+
+		hw = devm_clk_hw_register_gate(dev, wclk_name, wclk_parent,
+					       input[i].flags | CLK_SET_RATE_PARENT,
+					       base + input[i].gate_reg, input[i].wclk_gate_shift,
+					       0, &reg_lock);
+		if (IS_ERR(hw))
+			return PTR_ERR(hw);
+		clocks->hws[input[i].wclk_id] = hw;
+
+		if (!input[i].div_size)
+			continue;
+
+		hw = devm_clk_hw_register_divider(dev, div_name, div_parent, CLK_SET_RATE_PARENT,
+						  base + input[i].div_reg, input[i].div_shift,
+						  input[i].div_size, 0, &reg_lock);
+		if (IS_ERR(hw))
+			return PTR_ERR(hw);
+	}
+
+	return 0;
+}
+
+static int zx297520v3_gate(struct device *dev, void __iomem *base,
+			   struct clk_hw_onecell_data *clocks,
+			   const struct zx297520v3_gate *input, size_t size)
+{
+	struct clk_hw *hw;
+	unsigned int i;
+
+	for (i = 0; i < size; ++i) {
+		hw = devm_clk_hw_register_gate(dev, input[i].name, input[i].parent,
+					       CLK_SET_RATE_PARENT, base + input[i].reg,
+					       input[i].shift, 0, &reg_lock);
+		if (IS_ERR(hw))
+			return PTR_ERR(hw);
+		clocks->hws[input[i].id] = hw;
+	}
+
+	return 0;
+}
+
+static int zx_restart_handle(struct sys_off_data *data)
+{
+	void __iomem *top_base = data->cb_data;
+
+	writel(1, top_base);
+	mdelay(1000);
+
+	pr_emerg("Unable to restart system\n");
+	return NOTIFY_DONE;
+}
+
+static const char * const dpll_sel[] = {
+	"unknownpll_d2",
+	"osc26m",
+	"osc26m",
+	"osc26m",
+};
+
+static const struct zx29_pll_desc zx297520_plls[] = {
+	/* Default setting: 0x48040c11. 624/312/156. Only a single possible parent. This is the
+	 * PLL for pretty much everything, including CPU, RAM and USB.
+	 *
+	 * Changing this PLL makes it possible to overclock the CPU or do more fine grained
+	 * underclocking than the CPU's mux allows. It does run into two problems though: The USB
+	 * device uses this PLL's output directly and is *very* sensitive to differences. DRAM
+	 * is also fed by this clock and needs to be re-trained on larger changes, which needs to
+	 * be done by the stage 1 boot loader.
+	 */
+	{0x8,	"mpll",		clk_main, ARRAY_SIZE(clk_main)},
+
+	/* ZTE's code calls this PLL "upll". The only possible consumer I found is clk_out1, which
+	 * outputs this clock on GPIO 16. The device that consumes this is an SPI camera, which I
+	 * haven't seen in any device so far. clk_out1 has a gate in top + 0x90, bits 0 and 2. A mux
+	 * is in top + 0x34, bits 2 and 3.
+	 *
+	 * Long story short, shut it off.
+	 */
+	{0x10,	"upll",		clk_main, ARRAY_SIZE(clk_main)},
+
+	/* Default value 0x4834902d. Feeds dpll. 46.08 MHz. Bit 25 can be set, so two parents are
+	 * possible. It looks like both values select the 26 MHz oscillator though.
+	 */
+	{0x100,	"unknownpll",	clk_main, ARRAY_SIZE(clk_main)},
+
+	/* The documentation says 491.52 MHz and measurement with the LSP TDM device supports this.
+	 * The default value is 0x480C2011, but not all boot loaders set it up. To get to 491.52
+	 * with these settings it needs a 23.04 MHz reference clock, which matches unknownpll_d2.
+	 * If unknownpll is disabled, dpll loses its lock. We set the frequency on this PLL if we
+	 * find it is not enabled by the boot loader.
+	 *
+	 * The proprietary LTE driver or coproc enables and disables it. TDM and I2S can use it.
+	 *
+	 * It accepts parent values 0, 1, 2 and 3. Parent 0 is unknownpll_d2. The others look like
+	 * osc26m. With a parent != 0 dpll never loses its lock even when all other PLLs are off
+	 * and the TDM counter register increases at a rate consistent with a 26.0/23.04 clock
+	 * increase.
+	 */
+	{0x18,	"dpll",		dpll_sel, ARRAY_SIZE(dpll_sel), 491520000},
+
+	/* "g" is either for "general" or "gigahertz". The VCO runs at 1GHz. Output clocks are 200,
+	 * 100, 50, 25 MHz. It is only used by SDIO though, so not very general.
+	 */
+	{0x110,	"gpll",		clk_main, ARRAY_SIZE(clk_main)},
+};
+
+static int zx297520_topclk_probe(struct platform_device *pdev)
+{
+	void __iomem *top_base, *matrix_base;
+	struct zx29_clk_controller *top;
+	struct device *dev = &pdev->dev;
+	struct clk_hw *hw;
+	struct clk *clk;
+	unsigned int i;
+	int res;
+
+	top = devm_kzalloc(dev, offsetof(struct zx29_clk_controller,
+					 resets[ZX297520V3_TOPRST_END]), GFP_KERNEL);
+	if (!top)
+		return -ENOMEM;
+
+	top->clocks = devm_kzalloc(dev, struct_size(top->clocks, hws,
+				   ZX297520V3_TOPCLK_END), GFP_KERNEL);
+	if (!top->clocks)
+		return -ENOMEM;
+	top->clocks->num = ZX297520V3_TOPCLK_END;
+
+	top_base = devm_platform_ioremap_resource_byname(pdev, "top");
+	if (IS_ERR(top_base))
+		return PTR_ERR(top_base);
+	matrix_base = devm_platform_ioremap_resource_byname(pdev, "matrix");
+	if (IS_ERR(matrix_base))
+		return PTR_ERR(matrix_base);
+
+
+	/* Offset 0x0 is the global board reset
+	 * Offset 0x4 gives some static boot information - raw NAND or SPI NAND
+	 */
+
+	clk = devm_clk_get(dev, "osc32k");
+	if (IS_ERR(clk)) {
+		dev_err(dev, "32 KHz input clock not found\n");
+		return PTR_ERR(clk);
+	}
+
+	clk = devm_clk_get(dev, clk_main[0]);
+	if (IS_ERR(clk)) {
+		dev_err(dev, "26 MHz input clock not found\n");
+		return PTR_ERR(clk);
+	}
+
+	res = zx29_register_plls(dev, top_base, zx297520_plls, ARRAY_SIZE(zx297520_plls));
+	if (res)
+		return res;
+
+	res = zx297520v3_composite(dev, top_base, top->clocks, top->resets,
+				 top_clocks, ARRAY_SIZE(top_clocks));
+	if (res)
+		return res;
+	res = zx297520v3_composite(dev, matrix_base, top->clocks, top->resets,
+				   matrix_clocks, ARRAY_SIZE(matrix_clocks));
+	if (res)
+		return res;
+
+	res = zx297520v3_gate(dev, top_base, top->clocks, top_gates, ARRAY_SIZE(top_gates));
+	if (res)
+		return res;
+	res = zx297520v3_gate(dev, matrix_base, top->clocks,
+			      matrix_gates, ARRAY_SIZE(matrix_gates));
+	if (res)
+		return res;
+
+	/* The Cortex M0 coprocessor. It is responsible for booting the board and runs some power
+	 * management helper code on the stock firmware, but isn't critical. We can run custom code
+	 * on it but currently do not.  These bits control the speed and the values are mentioned in
+	 * ZTE's uboot. It isn't clear to me if this is directly responsible for the m0 clock, or
+	 * if it is the input to another clock. I also haven't found a gate that shuts the m0 off
+	 * and allows restarting. There don't seem to be resets either.
+	 *
+	 * Also note the comment about SRAM1 and SRAM2 PCLKs. They can be turned off, which will
+	 * crash the M0 if it reads instructions from them.
+	 */
+	hw = devm_clk_hw_register_mux(dev, "m0_wclk", m0_sel, ARRAY_SIZE(m0_sel),
+				      0, top_base + 0x38, 0, 2, 0, &reg_lock);
+	if (IS_ERR(hw))
+		return PTR_ERR(hw);
+	top->clocks->hws[ZX297520V3_M0_WCLK] = hw;
+
+	/* One stray matrix mux: The TDM mux is in matrixclk and it is passed to the LSP controller.
+	 * In a way the matrix-LSP link gate (LSP_TDM_WCLK) could be considered a matching gate, but
+	 * there is no reset and no pclk.
+	 */
+	hw = devm_clk_hw_register_mux(dev, "tdm_mux", tdm_sel, ARRAY_SIZE(tdm_sel), 0,
+				      matrix_base + 0x50, 24, 2, 0, &reg_lock);
+	if (IS_ERR(hw))
+		return PTR_ERR(hw);
+
+	/* This is to catch holes in the tables rather than registration errors */
+	for (i = 0; i < ZX297520V3_TOPCLK_END; i++) {
+		if (!top->clocks->hws[i]) {
+			dev_err(dev, "Clock %u not registered\n", i);
+			return -ENODEV;
+		}
+	}
+
+	res = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, top->clocks);
+	if (res)
+		return res;
+
+
+	res = devm_register_restart_handler(dev, zx_restart_handle, top_base);
+	if (res)
+		dev_err(dev, "can't register restart handler (res=%d)\n", res);
+
+	/* Stray reset bits follow.
+	 *
+	 * I haven't found any clocks for GPIO. It probably wouldn't make much
+	 * sense anyway. Only one bit per controller.
+	 */
+	top->resets[ZX297520V3_GPIO8_RESET].reg = top_base + 0x74;
+	top->resets[ZX297520V3_GPIO8_RESET].mask = BIT(2);
+	top->resets[ZX297520V3_GPIO_RESET].reg = top_base + 0x74;
+	top->resets[ZX297520V3_GPIO_RESET].mask = BIT(3);
+
+	/* USB reset. This is slightly special because it needs to wait for a ready bit after
+	 * deasserting.
+	 */
+	top->resets[ZX297520V3_USB_RESET].reg = top_base + 0x80;
+	top->resets[ZX297520V3_USB_RESET].mask = BIT(3) | BIT(4) | BIT(5);
+	top->resets[ZX297520V3_USB_RESET].wait_mask = BIT(1);
+
+	/* This bit is set by ZTE's cpko.ko blob, it looks like a reset bit for the LTE DSP
+	 * coprocessor. Clocks for it are in matrixclk.
+	 */
+	top->resets[ZX297520V3_ZSP_RESET].reg = top_base + 0x13c;
+	top->resets[ZX297520V3_ZSP_RESET].mask = BIT(0);
+
+	top->resets[ZX297520V3_DMA_RESET].reg = matrix_base + 0x70;
+	top->resets[ZX297520V3_DMA_RESET].mask = BIT(0) | BIT(1);
+	top->resets[ZX297520V3_GMAC_RESET].reg = matrix_base + 0x114;
+	top->resets[ZX297520V3_GMAC_RESET].mask = BIT(0) | BIT(1);
+
+	for (i = 0; i < ZX297520V3_TOPRST_END; ++i) {
+		if (!(top->resets[i].reg && top->resets[i].mask)) {
+			dev_err(dev, "zx297520v3 reset %u has no register or mask\n", i);
+			return -ENODEV;
+		}
+	}
+
+	top->rcdev.owner = THIS_MODULE;
+	top->rcdev.nr_resets = ZX297520V3_TOPRST_END;
+	top->rcdev.ops = &zx297520v3_rst_ops;
+	top->rcdev.of_node = dev->of_node;
+	return devm_reset_controller_register(dev, &top->rcdev);
+}
+
+static const struct of_device_id of_match_zx297520v3_topclk[] = {
+	{ .compatible = "zte,zx297520v3-topclk"},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, of_match_zx297520v3_topclk);
+
+static struct platform_driver clk_zx297520v3_topclk = {
+	.probe = zx297520_topclk_probe,
+	.driver = {
+		.name = "clk-zx297520v3-topclk",
+		.of_match_table = of_match_zx297520v3_topclk,
+	},
+};
+module_platform_driver(clk_zx297520v3_topclk);
+
+MODULE_AUTHOR("Stefan Dösinger <stefandoesinger@gmail.com>");
+MODULE_DESCRIPTION("ZTE zx297520v3 clock driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/zte/pll.c b/drivers/clk/zte/pll.c
new file mode 100644
index 000000000000..b1b74b8057e9
--- /dev/null
+++ b/drivers/clk/zte/pll.c
@@ -0,0 +1,450 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Stefan Dösinger
+ */
+#include <linux/platform_device.h>
+#include <linux/clk-provider.h>
+#include <linux/of_address.h>
+#include <linux/rational.h>
+#include <linux/iopoll.h>
+#include <linux/units.h>
+#include <linux/clk.h>
+#include <linux/io.h>
+
+#include "pll.h"
+
+/* This code has only been tested with zx297520v3 PLLs, but from reading the zx296718 clock code it
+ * looks like PLL registers are similar. ZTE's sources explain the PLL register contents only in a
+ * .cmm file (A Lauterback TRACE32 script) and some unused headers in their U-Boot code dump, which
+ * may not be accurate. When calculating the frequencies from the default PLL configuration the
+ * results match the fixed rate clocks from their clock driver.
+ *
+ * The 26mhz and 32khz clocks can be easily observed with the timers. The 104mhz output can be
+ * observed through the UART. One 122.88 PLL can be observed through the TDM device. All others can
+ * only be indirectly infered, e.g. by comparing CPU speed or SDIO transfer rate between the fixed
+ * 26 MHz oscillator and the provided PLL frequency.
+ *
+ * The formula to calculate the clock is ((ref / refdiv) * fbdiv) / postdiv1 / postdiv2. The masks
+ * are given below. There are a few control flags:
+ *
+ * Bit 31: Disables the PLL, but passes the reference through unmodified. If POSTDIV_OUT_DISABLE
+ *         still matters is different between PLLs.
+ * Bit 30: Returns if the PLL is locked
+ * Bit 29: Not named in ZTE's code, but can be set. There is no obvious impact. Lock times are
+ *         unchanged, so it doesn't influence or bypass lock detection. It doesn't raise any IRQs or
+ *         influence GPIOs.
+ * Bit 27: Given its name it likely disables the Delta-Sigma Modulator, if one exists at all. The
+ *         boot ROM sets it on every PLL. Unsetting it marginally decreases the time it takes to
+ *         lock to the reference clock (from ~400us to ~300us). Regardless of this bit I could not
+ *         make the supposed fractional part in register 2 work.
+ * Bit 24: Bypasses the VCO, but still applies refdiv and postdiv. Doesn't matter if PLL_DISABLE=1.
+ */
+
+#define ZX29_PLL_DISABLE			BIT(31)
+#define ZX29_PLL_LOCKED				BIT(30)
+#define ZX29_PLL_LOCK_FILTER			BIT(29)
+#define ZX29_PLL_DSM_DISABLE			BIT(27)
+#define ZX29_PLL_PARENT_MASK			GENMASK(26, 25)
+#define ZX29_PLL_PARENT_SHIFT			25
+#define ZX29_PLL_BYPASS				BIT(24)
+#define ZX29_PLL_REFDIV_MASK			GENMASK(23, 18)
+#define ZX29_PLL_REFDIV_SHIFT			18
+#define ZX29_PLL_FBDIV_MASK			GENMASK(17, 6)
+#define ZX29_PLL_FBDIV_SHIFT			6
+#define ZX29_PLL_POSTDIV1_MASK			GENMASK(5, 3)
+#define ZX29_PLL_POSTDIV1_SHIFT			3
+#define ZX29_PLL_POSTDIV2_MASK			GENMASK(2, 0)
+#define ZX29_PLL_POSTDIV2_SHIFT			0
+
+/* The second register is supposed to have another 24 bit value that gets added to fbdiv but it is
+ * always 0 in the preconfigured values. I could not observe any effect from setting it to something
+ * other than 0, regardless of the DSM disable bit. It is possible that it is only supported by
+ * dpll, which is a possible parent for i2s.
+ *
+ * Bits 28:25 contain more flags:
+ *
+ * Bit 27: Setting ZX29_PLL_DACAP slows down the lock time and obivates the speed gained from
+ *         !DSM_DISABLE. No other effect observed.
+ *
+ * Bit 26: ZX29_PLL_4PHASE_OUT_DISABLE is set on some PLLs on boot but not on others. It is set on
+ *         boot on mpll and upll, but not gpll, dpll or unknownpll. I am not sure what it does
+ *         either. The SDIO devices break if they are fed from gpll with this flag set, but they
+ *         work ok if they are fed from mpll without this flag set.
+ *
+ * Bit 25: ZX29_PLL_POSTDIV_OUT_DISABLE seems to disable the PLL output entirely. Whether it is
+ *         bypassed by PLL_DISABLE differs between PLLs. gpll still produces an output clock if
+ *         PLL_DISABLE = 1 and POSTDIV_DISABLE = 1, but produces no output if PLL_DISABLE = 0 and
+ *         POSTDIV_DISABLE = 1. The dpll feeder ("unknownpll") at 0x100 produces no output clock
+ *         if both PLL_DISABLE and POSTDIV_DISABLE are set to 1.
+ *
+ * Bit 24: ZX29_PLL_VCO_OUT_DISABLE probably disables the output of the VCO clock without
+ *         post-VCO-dividers, but the raw VCO output is not a possible parent of any consumer clock,
+ *         so I could not confirm  this. It does not disable the VCO entirely - that's what
+ *         PLL_DISABLE does.
+ *
+ * A spinlock should not be needed. PLLs don't share their registers with anything else and the
+ * global prepare mutex and enable spinlock should be enough. Beware of conflicts in reg2 between
+ * POSTDIV_OUT_DISABLE and the fractional value in case you find out how fractional dividers work
+ * and add support for them.
+ */
+#define ZX29_PLL_REG2_OFFSET			4
+#define ZX29_PLL_DACAP				BIT(27)
+#define ZX29_PLL_4PHASE_OUT_DISABLE		BIT(26)
+#define ZX29_PLL_POSTDIV_OUT_DISABLE		BIT(25)
+#define ZX29_PLL_VCO_OUT_DISABLE		BIT(24)
+
+/* The VCO's frequency range is limited. The stock settings run the VCO between 960 and 1248 MHz.
+ * Ad-hoc testing with gpll suggests that at least this PLL remains stable down to about 7 MHz and
+ * up to 2 GHz and produces a clock that can be used by the SDIO controller. Attempting to run the
+ * mpll VCO at 624 MHz and setting postdiv1 = postdiv2 = 1 - which should result in the same output
+ * frequency - or running it at 1872 MHz with an effective post divider of 3 crashes the CPU. Most
+ * likely the PLLs become unstable outside their core range and the SDIO controller is much more
+ * forgiving than CPU and DRAM are.
+ */
+#define ZX29_PLL_VCO_MAX_FREQ			(1300*HZ_PER_MHZ)
+#define ZX29_PLL_VCO_MIN_FREQ			(900*HZ_PER_MHZ)
+
+struct zx29_clk_pll {
+	struct device	*dev;
+	struct clk_hw	hw;
+	void __iomem	*base;
+};
+
+static inline struct zx29_clk_pll *to_zx29_clk_pll(struct clk_hw *hw)
+{
+	return container_of(hw, struct zx29_clk_pll, hw);
+}
+
+static int zx29_pll_is_prepared(struct clk_hw *hw)
+{
+	struct zx29_clk_pll *pll = to_zx29_clk_pll(hw);
+
+	return !(readl(pll->base) & ZX29_PLL_DISABLE);
+}
+
+static int zx29_pll_prepare(struct clk_hw *hw)
+{
+	struct zx29_clk_pll *pll = to_zx29_clk_pll(hw);
+	u32 val;
+	int res;
+
+	val = readl(pll->base);
+	val &= ~ZX29_PLL_DISABLE;
+	writel(val, pll->base);
+
+	/* Lock duration is usually between 300us to 500us */
+	res = readl_poll_timeout(pll->base, val, val & ZX29_PLL_LOCKED, 50, 2000);
+	dev_dbg(pll->dev, "%s: Enable result %u val 0x%08x\n", clk_hw_get_name(&pll->hw), res, val);
+	return res;
+}
+
+static void zx29_pll_unprepare(struct clk_hw *hw)
+{
+	struct zx29_clk_pll *pll = to_zx29_clk_pll(hw);
+	u32 val;
+
+	val = readl(pll->base);
+	val |= ZX29_PLL_DISABLE;
+	writel(val, pll->base);
+}
+
+static int zx29_pll_is_enabled(struct clk_hw *hw)
+{
+	struct zx29_clk_pll *pll = to_zx29_clk_pll(hw);
+	u32 val, val2;
+
+	val = readl(pll->base);
+	val2 = readl(pll->base + ZX29_PLL_REG2_OFFSET);
+
+	return !(val & ZX29_PLL_BYPASS) && !(val2 & ZX29_PLL_POSTDIV_OUT_DISABLE);
+}
+
+static int zx29_pll_enable(struct clk_hw *hw)
+{
+	struct zx29_clk_pll *pll = to_zx29_clk_pll(hw);
+	u32 val;
+
+	val = readl(pll->base);
+	val &= ~ZX29_PLL_BYPASS;
+	writel(val, pll->base);
+
+	val = readl(pll->base + ZX29_PLL_REG2_OFFSET);
+	val &= ~ZX29_PLL_POSTDIV_OUT_DISABLE;
+	writel(val, pll->base + ZX29_PLL_REG2_OFFSET);
+
+	return 0;
+}
+
+static void zx29_pll_disable(struct clk_hw *hw)
+{
+	struct zx29_clk_pll *pll = to_zx29_clk_pll(hw);
+	u32 val;
+
+	/* FIXME: Should we bother to set ZX29_PLL_BYPASS? It shouldn't make a difference because
+	 * ZX29_PLL_POSTDIV_OUT_DISABLE cuts the output anyway.
+	 */
+
+	val = readl(pll->base + ZX29_PLL_REG2_OFFSET);
+	val |= ZX29_PLL_POSTDIV_OUT_DISABLE;
+	writel(val, pll->base + ZX29_PLL_REG2_OFFSET);
+}
+
+static unsigned long zx29_pll_get_rate(const struct zx29_clk_pll *pll, unsigned long parent_rate,
+				       u32 setting)
+{
+	unsigned long refdiv, fbdiv, postdiv1, postdiv2, freq;
+	const char *name = clk_hw_get_name(&pll->hw);
+	u64 vco;
+
+	refdiv = (setting & ZX29_PLL_REFDIV_MASK) >> ZX29_PLL_REFDIV_SHIFT;
+	fbdiv = (setting & ZX29_PLL_FBDIV_MASK) >> ZX29_PLL_FBDIV_SHIFT;
+	postdiv1 = (setting & ZX29_PLL_POSTDIV1_MASK) >> ZX29_PLL_POSTDIV1_SHIFT;
+	postdiv2 = (setting & ZX29_PLL_POSTDIV2_MASK) >> ZX29_PLL_POSTDIV2_SHIFT;
+	dev_dbg(pll->dev, "%s: reference clock %lu HZ, PLL setting 0x%08x\n",
+		name, parent_rate, setting);
+
+	vco = div_u64((u64)parent_rate * fbdiv, refdiv);
+	freq = div_u64(div_u64(vco, postdiv1), postdiv2);
+	dev_dbg(pll->dev, "%s: refdiv %lu fbdiv %lu\n", name, refdiv, fbdiv);
+	dev_dbg(pll->dev, "%s: postdiv1 %lu postdiv2 %lu\n", name, postdiv1, postdiv2);
+
+	dev_dbg(pll->dev, "%s: %lu MHZ\n", name, freq / HZ_PER_MHZ);
+
+	return freq;
+}
+
+static unsigned long zx29_pll_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
+{
+	struct zx29_clk_pll *pll = to_zx29_clk_pll(hw);
+	u32 val = readl(pll->base);
+
+	return zx29_pll_get_rate(pll, parent_rate, val);
+}
+
+static u32 zx29_pll_calc_values(const struct zx29_clk_pll *pll, unsigned long parent_rate,
+				unsigned long rate)
+{
+	const unsigned int postdiv1_max = (1 << hweight32(ZX29_PLL_POSTDIV1_MASK)) - 1;
+	const unsigned int postdiv2_max = (1 << hweight32(ZX29_PLL_POSTDIV2_MASK)) - 1;
+	u32 postdiv1 = 0, postdiv2 = 0, i, j, setting;
+	const char *name = clk_hw_get_name(&pll->hw);
+	unsigned long fbdiv, refdiv, best_fbdiv = 0, best_refdiv = 0;
+	long best = LONG_MAX;
+
+	/* This code produces the same VCO settings that the boot loader and stock firmware use for
+	 * the standard frequencies. It has seen only very little manual testing beyond that.
+	 *
+	 * The goal is to find a VCO setting that gets us as close as possible to the desired output
+	 * rate, while being within the VCO's operating limits and achievable with the input value
+	 * range. It is iterating over possible post-VCO diver values (1-7)*(1-7) to look for valid
+	 * VCO target frequencies and then looks for refdiv and fbdiv values to achieve the VCO
+	 * frequency from the reference frequency.
+	 */
+	for (j = 1; j <= postdiv2_max; j++) {
+		for (i = 1; i <= postdiv1_max; i++) {
+			u64 vco = (u64)rate * i * j;
+			long out;
+
+			if (vco > ZX29_PLL_VCO_MAX_FREQ || vco < ZX29_PLL_VCO_MIN_FREQ)
+				continue;
+
+			rational_best_approximation(rate * i * j,
+						parent_rate,
+						(1 << hweight32(ZX29_PLL_FBDIV_MASK)) - 1,
+						(1 << hweight32(ZX29_PLL_REFDIV_MASK)) - 1,
+						&fbdiv, &refdiv);
+			setting = fbdiv << ZX29_PLL_FBDIV_SHIFT;
+			setting |= refdiv << ZX29_PLL_REFDIV_SHIFT;
+			setting |= i << ZX29_PLL_POSTDIV1_SHIFT;
+			setting |= j << ZX29_PLL_POSTDIV2_SHIFT;
+			out = zx29_pll_get_rate(pll, parent_rate, setting);
+
+			if (abs(out - rate) > best)
+				continue;
+
+			if (abs(out - rate) < best) {
+				postdiv1 = i;
+				postdiv2 = j;
+				best_fbdiv = fbdiv;
+				best_refdiv = refdiv;
+				best = abs(out - rate);
+
+				/* It won't get any better. */
+				if (!best)
+					goto search_done;
+			}
+		}
+	}
+search_done:
+
+	if (!postdiv1) {
+		dev_err(pll->dev, "Did not find a setting for %lu Hz, parent %lu Hz\n",
+			rate, parent_rate);
+		return 0;
+	}
+
+	dev_dbg(pll->dev, "%s: parent rate %lu\n", name, parent_rate);
+	dev_dbg(pll->dev, "%s: found VCO dividers %u and %u\n", name, postdiv1, postdiv2);
+	dev_dbg(pll->dev, "%s: VCO target rate %lu\n", name, rate * postdiv1 * postdiv2);
+
+	dev_dbg(pll->dev, "%s: Got fbdiv = %lu refdiv = %lu\n", name, best_fbdiv, best_refdiv);
+
+	setting = best_fbdiv << ZX29_PLL_FBDIV_SHIFT;
+	setting |= best_refdiv << ZX29_PLL_REFDIV_SHIFT;
+	setting |= postdiv1 << ZX29_PLL_POSTDIV1_SHIFT;
+	setting |= postdiv2 << ZX29_PLL_POSTDIV2_SHIFT;
+	dev_dbg(pll->dev, "%s: Final setting 0x%08x\n", name, setting);
+
+	return setting;
+}
+
+static int zx29_pll_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
+{
+	struct zx29_clk_pll *pll = to_zx29_clk_pll(hw);
+	unsigned long new_rate, parent_rate = clk_hw_get_rate(clk_hw_get_parent(&pll->hw));
+	u32 setting;
+
+	setting = zx29_pll_calc_values(pll, parent_rate, req->rate);
+	if (!setting)
+		return -EINVAL;
+
+	new_rate = zx29_pll_get_rate(pll, parent_rate, setting);
+	if (new_rate != req->rate) {
+		dev_warn(pll->dev, "Did not find an exact match. Want %lu, got %lu\n",
+			 req->rate, new_rate);
+	}
+
+	return 0;
+}
+
+static int zx29_pll_set_rate(struct clk_hw *hw, unsigned long rate,
+		      unsigned long parent_rate)
+{
+	struct zx29_clk_pll *pll = to_zx29_clk_pll(hw);
+	u32 setting, val;
+	int res = -EINVAL;
+
+	setting = zx29_pll_calc_values(pll, parent_rate, rate);
+	if (zx29_pll_get_rate(pll, parent_rate, setting) == rate) {
+		val = readl(pll->base) & 0xff000000;
+		val |= setting;
+		dev_info(pll->dev, "%s: Setting rate: 0x%08x\n", clk_hw_get_name(hw), val);
+		writel(val, pll->base);
+
+		res = 0;
+	}
+
+	return res;
+}
+
+static u8 zx29_pll_get_parent(struct clk_hw *hw)
+{
+	struct zx29_clk_pll *pll = to_zx29_clk_pll(hw);
+	u32 val = readl(pll->base);
+
+	val = (val & ZX29_PLL_PARENT_MASK) >> ZX29_PLL_PARENT_SHIFT;
+	dev_dbg(pll->dev, "%s: Parent 0x%x\n", clk_hw_get_name(hw), val);
+
+	return val;
+}
+
+static int zx29_pll_set_parent(struct clk_hw *hw, u8 index)
+{
+	struct zx29_clk_pll *pll = to_zx29_clk_pll(hw);
+	u32 val;
+
+	val = readl(pll->base);
+	val &= ~ZX29_PLL_PARENT_MASK;
+	val |= index << ZX29_PLL_PARENT_SHIFT;
+	writel(val, pll->base);
+
+	val = (readl(pll->base) & ZX29_PLL_PARENT_MASK) >> ZX29_PLL_PARENT_SHIFT;
+
+	if (val != index) {
+		dev_err(pll->dev, "Hardware rejected PLL parent %u\n", index);
+		return -EINVAL;
+	}
+	return 0;
+}
+
+const struct clk_ops zx29_pll_ops = {
+	.is_prepared	= zx29_pll_is_prepared,
+	.prepare	= zx29_pll_prepare,
+	.unprepare	= zx29_pll_unprepare,
+	.is_enabled	= zx29_pll_is_enabled,
+	.enable		= zx29_pll_enable,
+	.disable	= zx29_pll_disable,
+	.recalc_rate	= zx29_pll_recalc_rate,
+	.determine_rate = zx29_pll_determine_rate,
+	.get_parent	= zx29_pll_get_parent,
+	.set_parent	= zx29_pll_set_parent,
+	.set_rate	= zx29_pll_set_rate,
+};
+
+int zx29_register_plls(struct device *dev, void __iomem *base, const struct zx29_pll_desc *desc,
+		       unsigned int count)
+{
+	/* These are the fractionals of the PLLs I have seen. There should be a better way to
+	 * generate them than hardcode the list.
+	 */
+	static const unsigned int pll_fract[] = {2, 3, 4, 5, 6, 8, 12, 16, 26};
+
+	struct zx29_clk_pll *pll;
+	unsigned int i, f;
+	struct clk_hw *hw;
+	char plldiv[32];
+	int res;
+	u32 val;
+
+	for (i = 0; i < count; ++i) {
+		struct clk_init_data init = {};
+
+		pll = devm_kzalloc(dev, sizeof(*pll), GFP_KERNEL);
+		if (!pll)
+			return -ENOMEM;
+
+		pll->dev = dev;
+
+		init.name = desc[i].name;
+		init.ops = &zx29_pll_ops;
+		init.parent_names = desc[i].parents;
+		init.num_parents = desc[i].num_parents;
+		pll->hw.init = &init;
+		pll->base = base + desc[i].reg;
+
+		res = devm_clk_hw_register(pll->dev, &pll->hw);
+		if (res)
+			return res;
+
+		val = readl(pll->base);
+		if (val & ZX29_PLL_DISABLE) {
+			if (desc[i].rate) {
+				dev_dbg(dev, "%s: Setting to %lu Hz\n", desc[i].name, desc[i].rate);
+				res = clk_set_rate(pll->hw.clk, desc[i].rate);
+				if (res) {
+					dev_err(dev, "%s: Failed to set rate.\n", desc[i].name);
+					return res;
+				}
+			}
+
+			/* Set ZX29_PLL_POSTDIV_OUT_DISABLE for PLLs that have ZX29_PLL_DISABLE for
+			 * consistency with .enable and .prepare. This ensures that .prepare doesn't
+			 * inadvertedly enable PLLs without .enable being called.
+			 */
+			val = readl(pll->base + ZX29_PLL_REG2_OFFSET);
+			val |= ZX29_PLL_POSTDIV_OUT_DISABLE;
+			writel(val, pll->base + ZX29_PLL_REG2_OFFSET);
+		}
+
+		for (f = 0; f < ARRAY_SIZE(pll_fract); ++f) {
+			snprintf(plldiv, sizeof(plldiv), "%s_d%u", desc[i].name, pll_fract[f]);
+			hw = devm_clk_hw_register_fixed_factor(dev, plldiv, desc[i].name,
+							       0, 1, pll_fract[f]);
+			if (IS_ERR(hw))
+				return PTR_ERR(hw);
+			dev_dbg(dev, "%s: %lu hz\n", clk_hw_get_name(hw), clk_hw_get_rate(hw));
+		}
+	}
+
+	return 0;
+}
diff --git a/drivers/clk/zte/pll.h b/drivers/clk/zte/pll.h
new file mode 100644
index 000000000000..d99693407384
--- /dev/null
+++ b/drivers/clk/zte/pll.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2026 Stefan Dösinger
+ */
+
+#ifndef __DRV_CLK_ZTE_PLL_H
+#define __DRV_CLK_ZTE_PLL_H
+
+#include <linux/clk-provider.h>
+#include <linux/types.h>
+
+struct zx29_pll_desc {
+	u32 reg;
+	const char *name;
+	const char * const *parents;
+	unsigned int num_parents;
+	unsigned long rate;
+};
+
+int zx29_register_plls(struct device *dev, void __iomem *base, const struct zx29_pll_desc *plls,
+		       unsigned int count);
+
+#endif /* __DRV_CLK_ZTE_PLL_H */

-- 
2.53.0

