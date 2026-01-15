Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739F33314D7
	for <linux-clk@vger.kernel.org>; Thu, 15 Jan 2026 23:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768520579; cv=none; b=LBgrQLyKeI6pUU3QE0uwWvx+fk7VYppnEnYuVhsn5RdZr85YTI4o6PHFYPOtSisDSNOEDhqLExiKXoXwEbDytIF5UDs5MSHhD1gUqjK9M8XZW1hUOz9LReloYWa5/3RPa5kgWEe6+AgwcT0rc8czc9XDi57i/lYl09YsYeSmx68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768520579; c=relaxed/simple;
	bh=cmy2fP4gv52AHnb7ocyLCvTC2es1NEzo3XvwaM64lS4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iw5lVBuWcGZkUx9Fuxat8PLD7B3Lwp5vbwedYqUTFODVS5ZcgZR7mLy6Icbxh1+QpS/1dVweEDRLtyBMjnDlMFw22T74zrgtg39S9hpkFOuY0TGbpdwM3Ufe8cSBDzddjdD2fLjEqLJi24+AkXJHfgUyejNfEpbovsBqg4f74II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=EJCGrsGA; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="EJCGrsGA"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-78fdb90b670so13969897b3.2
        for <linux-clk@vger.kernel.org>; Thu, 15 Jan 2026 15:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1768520567; x=1769125367; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XYUcrnOKL2EhVu0YATguD6sQn8qoHmkwQfJmeLOqywo=;
        b=EJCGrsGAXJ9CZ+de6uHuHHKgsL/F4pgBOY1TzIzyMJS8PqaHmZRXwZYS9yHxAt+lko
         pUST657waBGwZbTBMK7Vr9C1wmDD/GCFaIqoUswqemU5a7+Y3axOIsux0R3JbtpfhVxZ
         dN3S1Zx3m1qC2aiqxg36s4t0MQ1wfpVg9UCQmU38n71DuBhlxLSLgN7PqP1TCnXECidz
         PuIy7Cybzxg8b9JicPVBPDE7xABODZzMagJOh5OhaPfAOe7AVOp0oOpqfx5RZz8OcqnF
         wm5qyGsKhDUxzm9dFInKoac1BBOmLufgKLdBQfALa9hMnx6gyMfOgxf4jdS3NYmgrw3v
         Qojg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768520567; x=1769125367;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XYUcrnOKL2EhVu0YATguD6sQn8qoHmkwQfJmeLOqywo=;
        b=IR+1GyMCPgkATL84yEUtR03zdhk68rXYut2iS+4H7BUrHWEwDaZKDfrz7OU9vweDJ2
         v2vT/mcztR8Jtx4HuFD/oljc+YJ5n9sxNwR2ZaH3LQcsut0dqCq6f3YkNQEZwkuNP4Ue
         UqhHLjdrIG0rb5f67ObITaJ7D6sGnTGJlJOPhuCNAlWQkDcrYINauACxvmkiebgRSkbh
         XvuUlAGpS4WDtKYi/NyIC/a4+Alhbqhg1wDbONAhOOIBKLBjWyzKQZghA4YuZTquARA4
         pWfIn4KsDw5+Khv3HIplNTvPBNJoJxnP6dij5xOF5HsgJdUAIv/sNwh8cDFRWi3TwoBR
         3JSg==
X-Forwarded-Encrypted: i=1; AJvYcCXA9z9x6iSqNTKOY7KWFXzTi+OiwCiPNu2bxhmOrFtbQXpraXkVO2iQcQ6cERE+pLIm9GxMou1+gt4=@vger.kernel.org
X-Gm-Message-State: AOJu0YybAedTqafexobkhS1omH16sCwflAS3gJua2fXkqgoRQ4FzxySz
	NqqmuhIHrJC6XO0ykPnZw0ZS8qFWz3M40esV3V+ks8c1qLVB/W5IUTq6iAhaQ0lDak+Pl/45/t1
	l4Bt1zgc=
X-Gm-Gg: AY/fxX6redh1zIpGNbf7nI9KGfS3MJ7h/JFfz7sv5ww6obpgjyaR/0ZUrDLyNAbQo0N
	RqdCHAKvzXXBqX6xAMx4PrUKN3HXgHmkwYJB9as9C9rLQ59yd7Er55g+md33RksSZfHqUYpywLI
	i88yH9pe6tmWp+JzqDeiC0k5m1ip9mqzG4RGmPrU3zsnP1HnCXN2XD0lt/IzuEbesboKisJx+QX
	JGadANjXwrloo3Z9KfSyeVX0cTbZoU8jPgd/jKWWU65cME82wdQ7QwHiEkDi7LCK3NTAhHg+x4I
	0KzxvVLND0arhKE/LqhWAWvCd/J9cCJo7sr04erLBs/aA6LXNAPyvPt8ZflOhMaWtXTGxwWLmje
	VVbWTVnkj9pt49/eLvV1d1K6N33lkxHj+SMdbU8UbnVztxuPfyWf0pVLoIjaf4kRj3uPT4Dg6OQ
	AsN/rPR5RHkIPV2iXe9K+30XnC1+GRcTifHMibL5Gg7GKtTJkLnXrEgDDY51LiLeFu0BVhVP8=
X-Received: by 2002:a05:690c:45c9:b0:786:98d8:c1c7 with SMTP id 00721157ae682-793c5264c0cmr12770987b3.18.1768520567501;
        Thu, 15 Jan 2026 15:42:47 -0800 (PST)
Received: from [192.168.5.15] ([68.95.197.245])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-793c66c72aesm3027117b3.11.2026.01.15.15.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 15:42:47 -0800 (PST)
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Thu, 15 Jan 2026 17:42:02 -0600
Subject: [PATCH 3/8] clk: tenstorrent: Add Atlantis clock controller driver
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-atlantis-clocks-v1-3-7356e671f28b@oss.tenstorrent.com>
References: <20260115-atlantis-clocks-v1-0-7356e671f28b@oss.tenstorrent.com>
In-Reply-To: <20260115-atlantis-clocks-v1-0-7356e671f28b@oss.tenstorrent.com>
To: Drew Fustini <dfustini@oss.tenstorrent.com>, 
 Joel Stanley <jms@oss.tenstorrent.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, joel@jms.id.au, 
 fustini@kernel.org, mpe@kernel.org, mpe@oss.tenstorrent.com, 
 npiggin@oss.tenstorrent.com, agross@kernel.org, agross@oss.tenstorrent.com
X-Mailer: b4 0.14.3

Add driver for syscon block in Tenstorrent Atlantis SoC. This version of
the driver coves clocks from RCPU syscon.

5 types of clocks generated by this controller: PLLs (PLLs
with bypass functionality and an additional Gate clk at output), Shared
Gates (Multiple Gate clks that share an enable bit), standard Muxes,
Dividers and Gates. All clocks are derived from a 24 Mhz oscillator.

Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
---
 MAINTAINERS                            |   1 +
 drivers/clk/Kconfig                    |   1 +
 drivers/clk/Makefile                   |   1 +
 drivers/clk/tenstorrent/Kconfig        |  14 +
 drivers/clk/tenstorrent/Makefile       |   3 +
 drivers/clk/tenstorrent/atlantis-ccu.c | 932 +++++++++++++++++++++++++++++++++
 6 files changed, 952 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4a2017d647b0..93d941d2886b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22537,6 +22537,7 @@ T:	git https://github.com/tenstorrent/linux.git
 F:	Documentation/devicetree/bindings/riscv/tenstorrent.yaml
 F:	Documentation/devicetree/bindings/soc/tenstorrent/tenstorrent,atlantis-syscon.yaml
 F:	arch/riscv/boot/dts/tenstorrent/
+F:	drivers/clk/tenstorrent/
 F:	include/dt-bindings/clock/tenstorrent,atlantis-syscon.h
 F:	include/soc/tenstorrent/
 
diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 3a1611008e48..643084887257 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -542,6 +542,7 @@ source "drivers/clk/starfive/Kconfig"
 source "drivers/clk/sunxi/Kconfig"
 source "drivers/clk/sunxi-ng/Kconfig"
 source "drivers/clk/tegra/Kconfig"
+source "drivers/clk/tenstorrent/Kconfig"
 source "drivers/clk/thead/Kconfig"
 source "drivers/clk/stm32/Kconfig"
 source "drivers/clk/ti/Kconfig"
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 61ec08404442..f88c116d315f 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -156,6 +156,7 @@ obj-y					+= starfive/
 obj-$(CONFIG_ARCH_SUNXI)		+= sunxi/
 obj-y					+= sunxi-ng/
 obj-$(CONFIG_ARCH_TEGRA)		+= tegra/
+obj-y					+= tenstorrent/
 obj-$(CONFIG_ARCH_THEAD)		+= thead/
 obj-y					+= ti/
 obj-$(CONFIG_CLK_UNIPHIER)		+= uniphier/
diff --git a/drivers/clk/tenstorrent/Kconfig b/drivers/clk/tenstorrent/Kconfig
new file mode 100644
index 000000000000..6bcef9e4feb4
--- /dev/null
+++ b/drivers/clk/tenstorrent/Kconfig
@@ -0,0 +1,14 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config TENSTORRENT_ATLANTIS_CCU
+	tristate "Support for Tenstorrent Atlantis Clock Controllers"
+	depends on ARCH_TENSTORRENT || COMPILE_TEST
+	default ARCH_TENSTORRENT
+	select REGMAP_MMIO
+	select AUXILIARY_BUS
+	select MFD_SYSCON
+	help
+	  Say yes here to support the different clock
+	  controllers found in the Tenstorrent Atlantis SoC.
+	  This includes the clocks from the RCPU, HSIO, MMIO
+	  and PCIE domain.
diff --git a/drivers/clk/tenstorrent/Makefile b/drivers/clk/tenstorrent/Makefile
new file mode 100644
index 000000000000..cc4fc01df75b
--- /dev/null
+++ b/drivers/clk/tenstorrent/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_TENSTORRENT_ATLANTIS_CCU)	+= atlantis-ccu.o
diff --git a/drivers/clk/tenstorrent/atlantis-ccu.c b/drivers/clk/tenstorrent/atlantis-ccu.c
new file mode 100644
index 000000000000..f3a2ea49a82e
--- /dev/null
+++ b/drivers/clk/tenstorrent/atlantis-ccu.c
@@ -0,0 +1,932 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2026 Tenstorrent
+ */
+
+#include <linux/array_size.h>
+#include <linux/auxiliary_bus.h>
+#include <linux/clk-provider.h>
+#include <linux/delay.h>
+#include <linux/idr.h>
+#include <linux/mfd/syscon.h>
+#include <linux/minmax.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+#include <soc/tenstorrent/atlantis-syscon.h>
+
+#include <dt-bindings/clock/tenstorrent,atlantis-syscon.h>
+#include <linux/regmap.h>
+#include <linux/clk-provider.h>
+#include <linux/math.h>
+#include <linux/bitfield.h>
+
+enum atlantis_clk_type {
+	ATLANTIS_CLK_PLL,
+	ATLANTIS_CLK_MUX,
+	ATLANTIS_CLK_DIVIDER,
+	ATLANTIS_CLK_GATE,
+	ATLANTIS_CLK_GATE_SHARED,
+	ATLANTIS_CLK_FIXED_FACTOR,
+};
+
+struct atlantis_clk_common {
+	int clkid;
+	enum atlantis_clk_type clk_type;
+	struct regmap *regmap;
+	struct clk_hw hw;
+};
+
+#define hw_to_atlantis_clk_common(_hw) \
+	container_of((_hw), struct atlantis_clk_common, hw)
+
+struct atlantis_clk_mux_config {
+	u8 shift;
+	u8 width;
+	u32 reg_offset;
+};
+
+struct atlantis_clk_mux {
+	struct atlantis_clk_common common;
+	struct atlantis_clk_mux_config config;
+};
+
+struct atlantis_clk_gate_config {
+	u32 reg_offset;
+	u32 enable;
+};
+
+struct atlantis_clk_gate {
+	struct atlantis_clk_common common;
+	struct atlantis_clk_gate_config config;
+};
+
+struct atlantis_clk_divider_config {
+	u8 shift;
+	u8 width;
+	u32 flags;
+	u32 reg_offset;
+};
+
+struct atlantis_clk_divider {
+	struct atlantis_clk_common common;
+	struct atlantis_clk_divider_config config;
+};
+
+struct atlantis_clk_pll_config {
+	u32 tbl_num;
+	u32 reg_offset;
+	u32 en_reg_offset;
+	u32 cg_reg_offset;
+	u32 cg_reg_enable;
+};
+
+/* Models a PLL with Bypass Functionality and Enable Bit + a Gate Clock at it's output */
+struct atlantis_clk_pll {
+	struct atlantis_clk_common common;
+	struct atlantis_clk_pll_config config;
+};
+
+struct atlantis_clk_gate_shared_config {
+	u32 reg_offset;
+	u32 enable;
+	unsigned int *share_count;
+	spinlock_t *refcount_lock;
+};
+
+struct atlantis_clk_gate_shared {
+	struct atlantis_clk_common common;
+	struct atlantis_clk_gate_shared_config config;
+};
+
+struct atlantis_clk_fixed_factor_config {
+	unsigned int mult;
+	unsigned int div;
+};
+
+struct atlantis_clk_fixed_factor {
+	struct atlantis_clk_fixed_factor_config config;
+	struct atlantis_clk_common common;
+};
+
+static inline struct atlantis_clk_mux *hw_to_atlantis_clk_mux(struct clk_hw *hw)
+{
+	struct atlantis_clk_common *common = hw_to_atlantis_clk_common(hw);
+
+	return container_of(common, struct atlantis_clk_mux, common);
+}
+
+static inline struct atlantis_clk_gate *
+hw_to_atlantis_clk_gate(struct clk_hw *hw)
+{
+	struct atlantis_clk_common *common = hw_to_atlantis_clk_common(hw);
+
+	return container_of(common, struct atlantis_clk_gate, common);
+}
+
+static inline struct atlantis_clk_divider *
+hw_to_atlantis_clk_divider(struct clk_hw *hw)
+{
+	struct atlantis_clk_common *common = hw_to_atlantis_clk_common(hw);
+
+	return container_of(common, struct atlantis_clk_divider, common);
+}
+
+static inline struct atlantis_clk_pll *hw_to_atlantis_pll(struct clk_hw *hw)
+{
+	struct atlantis_clk_common *common = hw_to_atlantis_clk_common(hw);
+
+	return container_of(common, struct atlantis_clk_pll, common);
+}
+
+static inline struct atlantis_clk_gate_shared *
+hw_to_atlantis_clk_gate_shared(struct clk_hw *hw)
+{
+	struct atlantis_clk_common *common = hw_to_atlantis_clk_common(hw);
+
+	return container_of(common, struct atlantis_clk_gate_shared, common);
+}
+
+static inline struct atlantis_clk_fixed_factor *
+hw_to_atlantis_clk_fixed_factor(struct clk_hw *hw)
+{
+	struct atlantis_clk_common *common = hw_to_atlantis_clk_common(hw);
+
+	return container_of(common, struct atlantis_clk_fixed_factor, common);
+}
+
+static int atlantis_clk_pll_is_enabled(struct clk_hw *hw)
+{
+	struct atlantis_clk_pll *pll = hw_to_atlantis_pll(hw);
+	u32 val, en_val, cg_val;
+
+	regmap_read(pll->common.regmap, pll->config.reg_offset, &val);
+	regmap_read(pll->common.regmap, pll->config.en_reg_offset, &en_val);
+	regmap_read(pll->common.regmap, pll->config.cg_reg_offset, &cg_val);
+
+	/* Check if PLL is powered on, locked and Gate clk is enabled */
+	return !!(en_val & PLL_CFG_EN_BIT) && !!(val & PLL_CFG_LOCK_BIT) &&
+	       !!(cg_val && pll->config.cg_reg_enable);
+}
+
+static int atlantis_clk_pll_enable(struct clk_hw *hw)
+{
+	struct atlantis_clk_pll *pll = hw_to_atlantis_pll(hw);
+	u32 val, en_val, cg_val;
+	int ret;
+
+	regmap_read(pll->common.regmap, pll->config.reg_offset, &val);
+	regmap_read(pll->common.regmap, pll->config.en_reg_offset, &en_val);
+	regmap_read(pll->common.regmap, pll->config.cg_reg_offset, &cg_val);
+
+	/* Check if PLL is already enabled, locked and Gate clk is enabled */
+	if ((en_val & PLL_CFG_EN_BIT) && (val & PLL_CFG_LOCK_BIT) &&
+	    (cg_val && pll->config.cg_reg_enable) &&
+	    !(val & PLL_CFG_BYPASS_BIT)) {
+		return 0;
+	}
+
+	/* Step 1: Set bypass mode first */
+	regmap_update_bits(pll->common.regmap, pll->config.reg_offset,
+			   PLL_CFG_BYPASS_BIT, PLL_CFG_BYPASS_BIT);
+
+	/* Step 2: Enable PLL (clear then set power bit) */
+	regmap_update_bits(pll->common.regmap, pll->config.en_reg_offset,
+			   PLL_CFG_EN_BIT, 0);
+
+	regmap_update_bits(pll->common.regmap, pll->config.en_reg_offset,
+			   PLL_CFG_EN_BIT, PLL_CFG_EN_BIT);
+
+	/* Step 3: Wait for PLL lock */
+	ret = regmap_read_poll_timeout(pll->common.regmap,
+				       pll->config.reg_offset, val,
+				       val & PLL_CFG_LOCK_BIT, 10,
+				       PLL_BYPASS_WAIT_US);
+	if (ret) {
+		pr_err("PLL failed to lock within timeout\n");
+		return ret;
+	}
+
+	/* Step 4: Switch from bypass to PLL output */
+	regmap_update_bits(pll->common.regmap, pll->config.reg_offset,
+			   PLL_CFG_BYPASS_BIT, 0);
+
+	/* Enable Gate clk at PLL Output */
+	return regmap_update_bits(pll->common.regmap, pll->config.cg_reg_offset,
+				  pll->config.cg_reg_enable,
+				  pll->config.cg_reg_enable);
+}
+
+static void atlantis_clk_pll_disable(struct clk_hw *hw)
+{
+	struct atlantis_clk_pll *pll = hw_to_atlantis_pll(hw);
+
+	/* Step 1: Switch to bypass mode before disabling */
+	regmap_update_bits(pll->common.regmap, pll->config.reg_offset,
+			   PLL_CFG_BYPASS_BIT, PLL_CFG_BYPASS_BIT);
+	/* Step 2: Power down PLL */
+	regmap_update_bits(pll->common.regmap, pll->config.en_reg_offset,
+			   PLL_CFG_EN_BIT, 0);
+}
+
+static unsigned long atlantis_clk_pll_recalc_rate(struct clk_hw *hw,
+						  unsigned long parent_rate)
+{
+	struct atlantis_clk_pll *pll = hw_to_atlantis_pll(hw);
+
+	u32 val, refdiv, fbdiv, postdiv1, postdiv2;
+	u64 fout;
+
+	regmap_read(pll->common.regmap, pll->config.reg_offset, &val);
+
+	if (val & PLL_CFG_BYPASS_BIT)
+		return parent_rate;
+
+	refdiv = FIELD_GET(PLL_CFG_REFDIV_MASK, val);
+	fbdiv = FIELD_GET(PLL_CFG_FBDIV_MASK, val);
+	postdiv1 = FIELD_GET(PLL_CFG_POSTDIV1_MASK, val);
+	postdiv2 = FIELD_GET(PLL_CFG_POSTDIV2_MASK, val);
+
+	if (!refdiv)
+		refdiv = 1;
+	if (!postdiv1)
+		postdiv1 = 1;
+	if (!postdiv2)
+		postdiv2 = 1;
+	if (!fbdiv)
+		return 0;
+
+	fout = div64_u64((u64)parent_rate * fbdiv,
+			 refdiv * postdiv1 * postdiv2);
+
+	return fout;
+}
+
+const struct clk_ops atlantis_clk_pll_ops = {
+	.enable = atlantis_clk_pll_enable,
+	.disable = atlantis_clk_pll_disable,
+	.recalc_rate = atlantis_clk_pll_recalc_rate,
+	.is_enabled = atlantis_clk_pll_is_enabled,
+};
+
+static int atlantis_clk_gate_shared_enable(struct clk_hw *hw)
+{
+	struct atlantis_clk_gate_shared *gate =
+		hw_to_atlantis_clk_gate_shared(hw);
+	bool need_enable;
+	u32 reg;
+
+	scoped_guard(spinlock_irqsave, gate->config.refcount_lock)
+	{
+		need_enable = (*gate->config.share_count)++ == 0;
+		if (need_enable) {
+			regmap_read(gate->common.regmap,
+				    gate->config.reg_offset, &reg);
+			reg |= gate->config.enable;
+			regmap_write(gate->common.regmap,
+				     gate->config.reg_offset, reg);
+		}
+	}
+
+	if (need_enable) {
+		regmap_read(gate->common.regmap, gate->config.reg_offset, &reg);
+
+		if (!(reg & gate->config.enable)) {
+			pr_warn("%s: gate enable %d failed to enable\n",
+				clk_hw_get_name(hw), gate->config.enable);
+			return -EIO;
+		}
+	}
+
+	return 0;
+}
+
+static void atlantis_clk_gate_shared_disable(struct clk_hw *hw)
+{
+	struct atlantis_clk_gate_shared *gate =
+		hw_to_atlantis_clk_gate_shared(hw);
+	u32 reg;
+
+	scoped_guard(spinlock_irqsave, gate->config.refcount_lock)
+	{
+		if (WARN_ON(*gate->config.share_count == 0))
+			return;
+		if (--(*gate->config.share_count) > 0)
+			return;
+
+		regmap_read(gate->common.regmap, gate->config.reg_offset, &reg);
+		reg &= ~gate->config.enable;
+		regmap_write(gate->common.regmap, gate->config.reg_offset, reg);
+	}
+}
+
+static int atlantis_clk_gate_shared_is_enabled(struct clk_hw *hw)
+{
+	struct atlantis_clk_gate_shared *gate =
+		hw_to_atlantis_clk_gate_shared(hw);
+	u32 reg;
+
+	regmap_read(gate->common.regmap, gate->config.reg_offset, &reg);
+
+	return !!(reg & gate->config.enable);
+}
+
+static void atlantis_clk_gate_shared_disable_unused(struct clk_hw *hw)
+{
+	struct atlantis_clk_gate_shared *gate =
+		hw_to_atlantis_clk_gate_shared(hw);
+
+	u32 reg;
+
+	scoped_guard(spinlock_irqsave, gate->config.refcount_lock)
+	{
+		if (*gate->config.share_count == 0) {
+			regmap_read(gate->common.regmap,
+				    gate->config.reg_offset, &reg);
+			reg &= ~gate->config.enable;
+			regmap_write(gate->common.regmap,
+				     gate->config.reg_offset, reg);
+		}
+	}
+}
+
+const struct clk_ops atlantis_clk_gate_shared_ops = {
+	.enable = atlantis_clk_gate_shared_enable,
+	.disable = atlantis_clk_gate_shared_disable,
+	.disable_unused = atlantis_clk_gate_shared_disable_unused,
+	.is_enabled = atlantis_clk_gate_shared_is_enabled,
+};
+
+#define ATLANTIS_PLL_CONFIG(_reg_offset, _en_reg_offset, _cg_reg_offset, \
+			    _cg_reg_enable)                              \
+	{                                                                \
+		.reg_offset = (_reg_offset),                             \
+		.en_reg_offset = (_en_reg_offset),                       \
+		.cg_reg_offset = (_cg_reg_offset),                       \
+		.cg_reg_enable = (_cg_reg_enable),                       \
+	}
+
+#define ATLANTIS_PLL_DEFINE(_clkid, _name, _parent, _reg_offset,               \
+			    _en_reg_offset, _cg_reg_offset, _cg_reg_enable,    \
+			    _flags)                                            \
+	static struct atlantis_clk_pll _name = {                               \
+		.config = ATLANTIS_PLL_CONFIG(_reg_offset, _en_reg_offset,     \
+					      _cg_reg_offset, _cg_reg_enable), \
+		.common = { .clkid = _clkid,                                   \
+			    .clk_type = ATLANTIS_CLK_PLL,                      \
+			    .hw.init = CLK_HW_INIT_PARENTS_DATA(               \
+				    #_name, _parent, &atlantis_clk_pll_ops,    \
+				    _flags) },                                 \
+	}
+#define ATLANTIS_MUX_CONFIG(_shift, _width, _reg_offset)                    \
+	{                                                                   \
+		.shift = _shift, .width = _width, .reg_offset = _reg_offset \
+	}
+
+#define ATLANTIS_MUX_DEFINE(_clkid, _name, _parents, _reg_offset, _shift,     \
+			    _width, _flags)                                   \
+	static struct atlantis_clk_mux _name = {                              \
+		.config = ATLANTIS_MUX_CONFIG(_shift, _width, _reg_offset),   \
+		.common = { .clkid = _clkid,                                  \
+			    .clk_type = ATLANTIS_CLK_MUX,                     \
+			    .hw.init = CLK_HW_INIT_PARENTS_DATA(              \
+				    #_name, _parents, &clk_mux_ops, _flags) } \
+	}
+
+#define ATLANTIS_DIVIDER_CONFIG(_shift, _width, _flags, _reg_offset) \
+	{                                                            \
+		.shift = _shift, .width = _width, .flags = _flags,   \
+		.reg_offset = _reg_offset                            \
+	}
+
+#define ATLANTIS_DIVIDER_DEFINE(_clkid, _name, _parent, _reg_offset, _shift,   \
+				_width, _divflags, _flags)                     \
+	static struct atlantis_clk_divider _name = {                           \
+		.config = ATLANTIS_DIVIDER_CONFIG(_shift, _width, _divflags,   \
+						  _reg_offset),                \
+		.common = { .clkid = _clkid,                                   \
+			    .clk_type = ATLANTIS_CLK_DIVIDER,                  \
+			    .hw.init =                                         \
+				    CLK_HW_INIT_HW(#_name, &_parent.common.hw, \
+						   &clk_divider_ops, _flags) } \
+	}
+#define ATLANTIS_GATE_CONFIG(_enable, _reg_offset)           \
+	{                                                    \
+		.enable = _enable, .reg_offset = _reg_offset \
+	}
+
+#define ATLANTIS_GATE_DEFINE(_clkid, _name, _parent, _reg_offset, _enable,     \
+			     _flags)                                           \
+	static struct atlantis_clk_gate _name = {                              \
+		.config = ATLANTIS_GATE_CONFIG(_enable, _reg_offset),          \
+		.common = { .clkid = _clkid,                                   \
+			    .clk_type = ATLANTIS_CLK_GATE,                     \
+			    .hw.init = CLK_HW_INIT_HW(#_name,                  \
+						      &_parent.common.hw,      \
+						      &clk_gate_ops, _flags) } \
+	}
+#define ATLANTIS_GATE_SHARED_CONFIG(_reg_offset, _enable, _share_count) \
+	{                                                               \
+		.reg_offset = _reg_offset, .enable = _enable,           \
+		.share_count = _share_count                             \
+	}
+#define ATLANTIS_GATE_SHARED_DEFINE(_clkid, _name, _parent, _reg_offset,     \
+				    _enable, _share_count, _flags)           \
+	static struct atlantis_clk_gate_shared _name = {                     \
+		.config = ATLANTIS_GATE_SHARED_CONFIG(_reg_offset, _enable,  \
+						      _share_count),         \
+		.common = { .clkid = _clkid,                                 \
+			    .clk_type = ATLANTIS_CLK_GATE_SHARED,            \
+			    .hw.init = CLK_HW_INIT_HW(                       \
+				    #_name, &_parent.common.hw,              \
+				    &atlantis_clk_gate_shared_ops, _flags) } \
+	}
+#define ATLANTIS_CLK_FIXED_FACTOR_DEFINE(_clkid, _name, _parent, _mult, _div, \
+					 _flags)                              \
+	static struct atlantis_clk_fixed_factor _name = {                     \
+		.config = { .mult = _mult, .div = _div },                     \
+		.common = { .clkid = _clkid,                                  \
+			    .clk_type = ATLANTIS_CLK_FIXED_FACTOR,            \
+			    .hw.init = CLK_HW_INIT_HW(                        \
+				    #_name, &_parent.common.hw,               \
+				    &clk_fixed_factor_ops, _flags) }          \
+	}
+static void atlantis_ccu_lock(void *_lock)
+{
+	spinlock_t *lock = _lock;
+
+	spin_lock(lock);
+}
+
+static void atlantis_ccu_unlock(void *_lock)
+{
+	spinlock_t *lock = _lock;
+
+	spin_unlock(lock);
+}
+
+static DEFINE_SPINLOCK(lock); /* Lock for Regmap accesses */
+static DEFINE_SPINLOCK(refcount_lock); /* Lock for refcount value accesses */
+
+static const struct regmap_config atlantis_ccu_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0xFFFC,
+	.cache_type = REGCACHE_NONE,
+	.lock = atlantis_ccu_lock,
+	.unlock = atlantis_ccu_unlock,
+	.lock_arg = &lock,
+};
+struct atlantis_ccu {
+	struct device *dev;
+
+	struct regmap *regmap;
+	void __iomem *base;
+
+	struct clk_hw_onecell_data *clk_data;
+};
+
+struct atlantis_ccu_data {
+	struct clk_hw **hws;
+	size_t num;
+};
+
+static const struct clk_parent_data osc_24m_clk[] = {
+	{ .index = 0 },
+};
+
+ATLANTIS_PLL_DEFINE(CLK_RCPU_PLL, rcpu_pll_clk, osc_24m_clk, RCPU_PLL_CFG_REG,
+		    PLL_RCPU_EN_REG, BUS_CG_REG, BIT(7),
+		    CLK_SET_RATE_NO_REPARENT | CLK_SET_RATE_UNGATE |
+			    CLK_IS_CRITICAL);
+
+static const struct clk_parent_data rcpu_root_parents[] = {
+	{ .index = 0 },
+	{ .hw = &rcpu_pll_clk.common.hw },
+};
+
+ATLANTIS_MUX_DEFINE(CLK_RCPU_ROOT, rcpu_root_mux, rcpu_root_parents,
+		    RCPU_DIV_CFG_REG, 0, 1, CLK_SET_RATE_NO_REPARENT);
+
+ATLANTIS_DIVIDER_DEFINE(CLK_RCPU_DIV2, rcpu_div2_clk, rcpu_root_mux,
+			RCPU_DIV_CFG_REG, 2, 4, 0, 0);
+ATLANTIS_DIVIDER_DEFINE(CLK_RCPU_DIV4, rcpu_div4_clk, rcpu_root_mux,
+			RCPU_DIV_CFG_REG, 7, 4, 0, 0);
+ATLANTIS_DIVIDER_DEFINE(CLK_RCPU_RTC, rcpu_rtc_clk, rcpu_div4_clk,
+			RCPU_DIV_CFG_REG, 12, 6, 0, 0);
+
+ATLANTIS_GATE_DEFINE(CLK_SMNDMA0_ACLK, smndma0_aclk, rcpu_div2_clk,
+		     RCPU_BLK_CG_REG, BIT(0), 0);
+ATLANTIS_GATE_DEFINE(CLK_SMNDMA1_ACLK, smndma1_aclk, rcpu_div2_clk,
+		     RCPU_BLK_CG_REG, BIT(1), 0);
+ATLANTIS_GATE_DEFINE(CLK_WDT0_PCLK, wdt0_pclk, rcpu_div4_clk, RCPU_BLK_CG_REG,
+		     BIT(2), 0);
+ATLANTIS_GATE_DEFINE(CLK_WDT1_PCLK, wdt1_pclk, rcpu_div4_clk, RCPU_BLK_CG_REG,
+		     BIT(3), 0);
+ATLANTIS_GATE_DEFINE(CLK_TIMER_PCLK, timer_pclk, rcpu_div4_clk, RCPU_BLK_CG_REG,
+		     BIT(4), 0);
+ATLANTIS_GATE_DEFINE(CLK_PVTC_PCLK, pvtc_pclk, rcpu_div4_clk, RCPU_BLK_CG_REG,
+		     BIT(12), 0);
+ATLANTIS_GATE_DEFINE(CLK_PMU_PCLK, pmu_pclk, rcpu_div4_clk, RCPU_BLK_CG_REG,
+		     BIT(13), 0);
+ATLANTIS_GATE_DEFINE(CLK_MAILBOX_HCLK, mb_hclk, rcpu_div2_clk, RCPU_BLK_CG_REG,
+		     BIT(14), 0);
+ATLANTIS_GATE_DEFINE(CLK_SEC_SPACC_HCLK, sec_spacc_hclk, rcpu_div2_clk,
+		     RCPU_BLK_CG_REG, BIT(26), 0);
+ATLANTIS_GATE_DEFINE(CLK_SEC_OTP_HCLK, sec_otp_hclk, rcpu_div2_clk,
+		     RCPU_BLK_CG_REG, BIT(28), 0);
+ATLANTIS_GATE_DEFINE(CLK_TRNG_PCLK, trng_pclk, rcpu_div4_clk, RCPU_BLK_CG_REG,
+		     BIT(29), 0);
+ATLANTIS_GATE_DEFINE(CLK_SEC_CRC_HCLK, sec_crc_hclk, rcpu_div2_clk,
+		     RCPU_BLK_CG_REG, BIT(30), 0);
+
+ATLANTIS_CLK_FIXED_FACTOR_DEFINE(CLK_SMN_HCLK, rcpu_smn_hclk, rcpu_div2_clk, 1,
+				 1, 0);
+ATLANTIS_CLK_FIXED_FACTOR_DEFINE(CLK_AHB0_HCLK, rcpu_ahb0_hclk, rcpu_div2_clk,
+				 1, 1, 0);
+
+ATLANTIS_CLK_FIXED_FACTOR_DEFINE(CLK_SMN_PCLK, rcpu_smn_pclk, rcpu_div4_clk, 1,
+				 1, 0);
+
+ATLANTIS_CLK_FIXED_FACTOR_DEFINE(CLK_SMN_CLK, rcpu_smn_clk, rcpu_root_mux, 1, 1,
+				 0);
+ATLANTIS_CLK_FIXED_FACTOR_DEFINE(CLK_SCRATCHPAD_CLK, rcpu_scratchpad_aclk,
+				 rcpu_root_mux, 1, 1, 0);
+ATLANTIS_CLK_FIXED_FACTOR_DEFINE(CLK_RCPU_CORE_CLK, rcpu_core_clk,
+				 rcpu_root_mux, 1, 1, 0);
+ATLANTIS_CLK_FIXED_FACTOR_DEFINE(CLK_RCPU_ROM_CLK, rcpu_rom_aclk, rcpu_root_mux,
+				 1, 1, 0);
+
+static struct atlantis_clk_fixed_factor
+	otp_load_clk = { .config = { .mult = 1, .div = 1 },
+			 .common = {
+				 .clkid = CLK_OTP_LOAD_CLK,
+				 .clk_type = ATLANTIS_CLK_FIXED_FACTOR,
+				 .hw.init = CLK_HW_INIT_PARENTS_DATA(
+					 "otp_load_clk", osc_24m_clk,
+					 &clk_fixed_factor_ops,
+					 CLK_SET_RATE_NO_REPARENT),
+			 } };
+
+ATLANTIS_PLL_DEFINE(CLK_NOC_PLL, nocc_pll_clk, osc_24m_clk,
+		    RCPU_NOCC_PLL_CFG_REG, PLL_NOCC_EN_REG, BUS_CG_REG, BIT(0),
+		    CLK_SET_RATE_NO_REPARENT | CLK_SET_RATE_UNGATE |
+			    CLK_IS_CRITICAL);
+
+static const struct clk_parent_data nocc_mux_parents[] = {
+	{ .index = 0 },
+	{ .hw = &nocc_pll_clk.common.hw },
+};
+
+ATLANTIS_MUX_DEFINE(CLK_NOCC_CLK, nocc_clk_mux, nocc_mux_parents,
+		    RCPU_NOCC_CLK_CFG_REG, 0, 1, CLK_SET_RATE_NO_REPARENT);
+
+ATLANTIS_DIVIDER_DEFINE(CLK_NOCC_DIV2, nocc_div2_clk, nocc_clk_mux,
+			RCPU_NOCC_CLK_CFG_REG, 1, 4, 0, 0);
+ATLANTIS_DIVIDER_DEFINE(CLK_NOCC_DIV4, nocc_div4_clk, nocc_clk_mux,
+			RCPU_NOCC_CLK_CFG_REG, 5, 4, 0, 0);
+ATLANTIS_DIVIDER_DEFINE(CLK_NOCC_RTC, nocc_rtc_clk, nocc_div4_clk,
+			RCPU_NOCC_CLK_CFG_REG, 9, 6, 0, 0);
+ATLANTIS_DIVIDER_DEFINE(CLK_NOCC_CAN, nocc_can_div, nocc_clk_mux,
+			RCPU_NOCC_CLK_CFG_REG, 15, 4, 0, 0);
+
+static unsigned int refcnt_qspi;
+ATLANTIS_GATE_SHARED_DEFINE(CLK_QSPI_SCLK, qspi_sclk, nocc_clk_mux,
+			    LSIO_BLK_CG_REG, BIT(0), &refcnt_qspi, 0);
+ATLANTIS_GATE_SHARED_DEFINE(CLK_QSPI_HCLK, qspi_hclk, nocc_div2_clk,
+			    LSIO_BLK_CG_REG, BIT(0), &refcnt_qspi, 0);
+ATLANTIS_GATE_DEFINE(CLK_I2C0_PCLK, i2c0_pclk, nocc_div4_clk, LSIO_BLK_CG_REG,
+		     BIT(1), 0);
+ATLANTIS_GATE_DEFINE(CLK_I2C1_PCLK, i2c1_pclk, nocc_div4_clk, LSIO_BLK_CG_REG,
+		     BIT(2), 0);
+ATLANTIS_GATE_DEFINE(CLK_I2C2_PCLK, i2c2_pclk, nocc_div4_clk, LSIO_BLK_CG_REG,
+		     BIT(3), 0);
+ATLANTIS_GATE_DEFINE(CLK_I2C3_PCLK, i2c3_pclk, nocc_div4_clk, LSIO_BLK_CG_REG,
+		     BIT(4), 0);
+ATLANTIS_GATE_DEFINE(CLK_I2C4_PCLK, i2c4_pclk, nocc_div4_clk, LSIO_BLK_CG_REG,
+		     BIT(5), 0);
+
+ATLANTIS_GATE_DEFINE(CLK_UART0_PCLK, uart0_pclk, nocc_div4_clk, LSIO_BLK_CG_REG,
+		     BIT(6), 0);
+ATLANTIS_GATE_DEFINE(CLK_UART1_PCLK, uart1_pclk, nocc_div4_clk, LSIO_BLK_CG_REG,
+		     BIT(7), 0);
+ATLANTIS_GATE_DEFINE(CLK_UART2_PCLK, uart2_pclk, nocc_div4_clk, LSIO_BLK_CG_REG,
+		     BIT(8), 0);
+ATLANTIS_GATE_DEFINE(CLK_UART3_PCLK, uart3_pclk, nocc_div4_clk, LSIO_BLK_CG_REG,
+		     BIT(9), 0);
+ATLANTIS_GATE_DEFINE(CLK_UART4_PCLK, uart4_pclk, nocc_div4_clk, LSIO_BLK_CG_REG,
+		     BIT(10), 0);
+ATLANTIS_GATE_DEFINE(CLK_SPI0_PCLK, spi0_pclk, nocc_div4_clk, LSIO_BLK_CG_REG,
+		     BIT(11), 0);
+ATLANTIS_GATE_DEFINE(CLK_SPI1_PCLK, spi1_pclk, nocc_div4_clk, LSIO_BLK_CG_REG,
+		     BIT(12), 0);
+ATLANTIS_GATE_DEFINE(CLK_SPI2_PCLK, spi2_pclk, nocc_div4_clk, LSIO_BLK_CG_REG,
+		     BIT(13), 0);
+ATLANTIS_GATE_DEFINE(CLK_SPI3_PCLK, spi3_pclk, nocc_div4_clk, LSIO_BLK_CG_REG,
+		     BIT(14), 0);
+ATLANTIS_GATE_DEFINE(CLK_GPIO_PCLK, gpio_pclk, nocc_div4_clk, LSIO_BLK_CG_REG,
+		     BIT(15), 0);
+
+static unsigned int refcnt_can0;
+ATLANTIS_GATE_SHARED_DEFINE(CLK_CAN0_HCLK, can0_hclk, nocc_div2_clk,
+			    LSIO_BLK_CG_REG, BIT(17), &refcnt_can0, 0);
+ATLANTIS_GATE_SHARED_DEFINE(CLK_CAN0_CLK, can0_clk, nocc_can_div,
+			    LSIO_BLK_CG_REG, BIT(17), &refcnt_can0, 0);
+
+static unsigned int refcnt_can1;
+ATLANTIS_GATE_SHARED_DEFINE(CLK_CAN1_HCLK, can1_hclk, nocc_div2_clk,
+			    LSIO_BLK_CG_REG, BIT(18), &refcnt_can1, 0);
+ATLANTIS_GATE_SHARED_DEFINE(CLK_CAN1_CLK, can1_clk, nocc_can_div,
+			    LSIO_BLK_CG_REG, BIT(18), &refcnt_can1, 0);
+
+ATLANTIS_CLK_FIXED_FACTOR_DEFINE(CLK_CAN0_TIMER_CLK, can0_timer_clk,
+				 nocc_rtc_clk, 1, 1, 0);
+ATLANTIS_CLK_FIXED_FACTOR_DEFINE(CLK_CAN1_TIMER_CLK, can1_timer_clk,
+				 nocc_rtc_clk, 1, 1, 0);
+
+static struct clk_hw *atlantis_rcpu_clks[] = {
+	[CLK_RCPU_PLL] = &rcpu_pll_clk.common.hw,
+	[CLK_RCPU_ROOT] = &rcpu_root_mux.common.hw,
+	[CLK_RCPU_DIV2] = &rcpu_div2_clk.common.hw,
+	[CLK_RCPU_DIV4] = &rcpu_div4_clk.common.hw,
+	[CLK_RCPU_RTC] = &rcpu_rtc_clk.common.hw,
+	[CLK_SMNDMA0_ACLK] = &smndma0_aclk.common.hw,
+	[CLK_SMNDMA1_ACLK] = &smndma1_aclk.common.hw,
+	[CLK_WDT0_PCLK] = &wdt0_pclk.common.hw,
+	[CLK_WDT1_PCLK] = &wdt1_pclk.common.hw,
+	[CLK_TIMER_PCLK] = &timer_pclk.common.hw,
+	[CLK_PVTC_PCLK] = &pvtc_pclk.common.hw,
+	[CLK_PMU_PCLK] = &pmu_pclk.common.hw,
+	[CLK_MAILBOX_HCLK] = &mb_hclk.common.hw,
+	[CLK_SEC_SPACC_HCLK] = &sec_spacc_hclk.common.hw,
+	[CLK_SEC_OTP_HCLK] = &sec_otp_hclk.common.hw,
+	[CLK_TRNG_PCLK] = &trng_pclk.common.hw,
+	[CLK_SEC_CRC_HCLK] = &sec_crc_hclk.common.hw,
+	[CLK_SMN_HCLK] = &rcpu_smn_hclk.common.hw,
+	[CLK_AHB0_HCLK] = &rcpu_ahb0_hclk.common.hw,
+	[CLK_SMN_PCLK] = &rcpu_smn_pclk.common.hw,
+	[CLK_SMN_CLK] = &rcpu_smn_clk.common.hw,
+	[CLK_SCRATCHPAD_CLK] = &rcpu_scratchpad_aclk.common.hw,
+	[CLK_RCPU_CORE_CLK] = &rcpu_core_clk.common.hw,
+	[CLK_RCPU_ROM_CLK] = &rcpu_rom_aclk.common.hw,
+	[CLK_OTP_LOAD_CLK] = &otp_load_clk.common.hw,
+	[CLK_NOC_PLL] = &nocc_pll_clk.common.hw,
+	[CLK_NOCC_CLK] = &nocc_clk_mux.common.hw,
+	[CLK_NOCC_DIV2] = &nocc_div2_clk.common.hw,
+	[CLK_NOCC_DIV4] = &nocc_div4_clk.common.hw,
+	[CLK_NOCC_RTC] = &nocc_rtc_clk.common.hw,
+	[CLK_NOCC_CAN] = &nocc_can_div.common.hw,
+	[CLK_QSPI_SCLK] = &qspi_sclk.common.hw,
+	[CLK_QSPI_HCLK] = &qspi_hclk.common.hw,
+	[CLK_I2C0_PCLK] = &i2c0_pclk.common.hw,
+	[CLK_I2C1_PCLK] = &i2c1_pclk.common.hw,
+	[CLK_I2C2_PCLK] = &i2c2_pclk.common.hw,
+	[CLK_I2C3_PCLK] = &i2c3_pclk.common.hw,
+	[CLK_I2C4_PCLK] = &i2c4_pclk.common.hw,
+	[CLK_UART0_PCLK] = &uart0_pclk.common.hw,
+	[CLK_UART1_PCLK] = &uart1_pclk.common.hw,
+	[CLK_UART2_PCLK] = &uart2_pclk.common.hw,
+	[CLK_UART3_PCLK] = &uart3_pclk.common.hw,
+	[CLK_UART4_PCLK] = &uart4_pclk.common.hw,
+	[CLK_SPI0_PCLK] = &spi0_pclk.common.hw,
+	[CLK_SPI1_PCLK] = &spi1_pclk.common.hw,
+	[CLK_SPI2_PCLK] = &spi2_pclk.common.hw,
+	[CLK_SPI3_PCLK] = &spi3_pclk.common.hw,
+	[CLK_GPIO_PCLK] = &gpio_pclk.common.hw,
+	[CLK_CAN0_HCLK] = &can0_hclk.common.hw,
+	[CLK_CAN0_CLK] = &can0_clk.common.hw,
+	[CLK_CAN1_HCLK] = &can1_hclk.common.hw,
+	[CLK_CAN1_CLK] = &can1_clk.common.hw,
+	[CLK_CAN0_TIMER_CLK] = &can0_timer_clk.common.hw,
+	[CLK_CAN1_TIMER_CLK] = &can1_timer_clk.common.hw,
+};
+
+static const struct atlantis_ccu_data atlantis_ccu_rcpu_data = {
+	.hws = atlantis_rcpu_clks,
+	.num = ARRAY_SIZE(atlantis_rcpu_clks),
+};
+
+static int atlantis_ccu_clocks_register(struct device *dev,
+					struct atlantis_ccu *ccu,
+					const struct atlantis_ccu_data *data)
+{
+	struct regmap *regmap = ccu->regmap;
+	struct clk_hw_onecell_data *clk_data;
+	int i, ret;
+	size_t num_clks = data->num;
+
+	clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, data->num),
+				GFP_KERNEL);
+	if (!clk_data)
+		return -ENOMEM;
+
+	ccu->clk_data = clk_data;
+
+	for (i = 0; i < data->num; i++) {
+		struct clk_hw *hw = data->hws[i];
+		const char *name = hw->init->name;
+		struct atlantis_clk_common *common =
+			hw_to_atlantis_clk_common(hw);
+		common->regmap = regmap;
+
+		/* Fixup missing handle to parent for gates/muxes/dividers */
+		if (hw->init->parent_hws && hw->init->num_parents == 1) {
+			const struct atlantis_clk_common *parent =
+				hw_to_atlantis_clk_common(
+					hw->init->parent_hws[0]);
+			hw->init->parent_hws[0] = clk_data->hws[parent->clkid];
+		}
+
+		switch (common->clk_type) {
+		case ATLANTIS_CLK_MUX:
+			struct atlantis_clk_mux *mux =
+				hw_to_atlantis_clk_mux(hw);
+
+			hw = devm_clk_hw_register_mux_parent_data_table(
+				ccu->dev, name, hw->init->parent_data,
+				hw->init->num_parents, hw->init->flags,
+				ccu->base + mux->config.reg_offset,
+				mux->config.shift, mux->config.width, 0, NULL,
+				&lock);
+
+			if (IS_ERR(hw)) {
+				dev_err(dev, "Cannot register clock %d - %s\n",
+					i, name);
+				return ret;
+			}
+
+			if (data == &atlantis_ccu_rcpu_data) {
+				switch (common->clkid) {
+				case CLK_RCPU_ROOT:
+					ret = clk_hw_set_parent(
+						hw,
+						clk_data->hws[CLK_RCPU_PLL]);
+					if (ret)
+						dev_err(ccu->dev,
+							"Failed to set RCPU ROOT MUX parent: %d\n",
+							ret);
+					break;
+				case CLK_NOCC_CLK:
+					ret = clk_hw_set_parent(
+						hw, clk_data->hws[CLK_NOC_PLL]);
+					if (ret)
+						dev_err(ccu->dev,
+							"Failed to set NOCC Mux parent: %d\n",
+							ret);
+					break;
+				}
+			}
+			break;
+		case ATLANTIS_CLK_DIVIDER:
+			struct atlantis_clk_divider *div =
+				hw_to_atlantis_clk_divider(hw);
+
+			hw = devm_clk_hw_register_divider_parent_hw(
+				ccu->dev, name, common->hw.init->parent_hws[0],
+				div->common.hw.init->flags,
+				ccu->base + div->config.reg_offset,
+				div->config.shift, div->config.width,
+				div->config.flags, &lock);
+
+			if (IS_ERR(hw)) {
+				dev_err(dev, "Cannot register clock %d - %s\n",
+					i, name);
+				return ret;
+			}
+
+			break;
+		case ATLANTIS_CLK_GATE:
+			struct atlantis_clk_gate *gate =
+				hw_to_atlantis_clk_gate(hw);
+
+			hw = devm_clk_hw_register_gate_parent_hw(
+				ccu->dev, name, common->hw.init->parent_hws[0],
+				hw->init->flags,
+				ccu->base + gate->config.reg_offset,
+				ffs(gate->config.enable) - 1, 0, &lock);
+
+			if (IS_ERR(hw)) {
+				dev_err(dev, "Cannot register clock %d - %s\n",
+					i, name);
+				return ret;
+			}
+
+			break;
+		case ATLANTIS_CLK_FIXED_FACTOR:
+			struct atlantis_clk_fixed_factor *factor =
+				hw_to_atlantis_clk_fixed_factor(hw);
+
+			if (hw->init->parent_data) {
+				hw = devm_clk_hw_register_fixed_factor_index(
+					dev, name,
+					hw->init->parent_data[0].index,
+					hw->init->flags, factor->config.mult,
+					factor->config.div);
+			} else {
+				hw = devm_clk_hw_register_fixed_factor_parent_hw(
+					dev, name, hw->init->parent_hws[0],
+					hw->init->flags, factor->config.mult,
+					factor->config.div);
+			}
+			if (IS_ERR(hw)) {
+				dev_err(dev, "Cannot register clock %d - %s\n",
+					i, name);
+				return ret;
+			}
+			break;
+		case ATLANTIS_CLK_GATE_SHARED:
+			struct atlantis_clk_gate_shared *gate_shared =
+				hw_to_atlantis_clk_gate_shared(hw);
+			gate_shared->config.refcount_lock = &refcount_lock;
+
+			ret = devm_clk_hw_register(dev, hw);
+
+			if (ret) {
+				dev_err(dev, "Cannot register clock %d - %s\n",
+					i, name);
+				return ret;
+			}
+
+			break;
+		default:
+
+			ret = devm_clk_hw_register(dev, hw);
+
+			if (ret) {
+				dev_err(dev, "Cannot register clock %d - %s\n",
+					i, name);
+				return ret;
+			}
+
+			break;
+		}
+		clk_data->hws[common->clkid] = hw;
+	}
+
+	clk_data->num = num_clks;
+
+	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data);
+	if (ret)
+		dev_err(dev, "failed to add clock hardware provider (%d)\n",
+			ret);
+
+	return ret;
+}
+
+static int atlantis_ccu_probe(struct platform_device *pdev)
+{
+	const struct atlantis_ccu_data *data;
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	struct atlantis_ccu *ccu = devm_kzalloc(dev, sizeof(*ccu), GFP_KERNEL);
+
+	if (!ccu)
+		return -ENOMEM;
+
+	ccu->dev = dev;
+
+	ccu->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(ccu->base))
+		return dev_err_probe(dev, PTR_ERR(ccu->base),
+				     "Failed to map registers\n");
+
+	ccu->regmap = devm_regmap_init_mmio(dev, ccu->base,
+					    &atlantis_ccu_regmap_config);
+	if (IS_ERR(ccu->regmap))
+		return dev_err_probe(dev, PTR_ERR(ccu->regmap),
+				     "Failed to init regmap\n");
+
+	data = of_device_get_match_data(dev);
+
+	ret = atlantis_ccu_clocks_register(dev, ccu, data);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to register clocks\n");
+
+	return 0;
+}
+
+static const struct of_device_id atlantis_ccu_of_match[] = {
+	{
+		.compatible = "tenstorrent,atlantis-syscon-rcpu",
+		.data = &atlantis_ccu_rcpu_data,
+	},
+	{}
+
+};
+MODULE_DEVICE_TABLE(of, atlantis_ccu_of_match);
+
+static struct platform_driver atlantis_ccu_driver = {
+	.probe = atlantis_ccu_probe,
+	.driver = {
+		.name = "atlantis-ccu",
+		.of_match_table = atlantis_ccu_of_match,
+	},
+};
+module_platform_driver(atlantis_ccu_driver);
+
+MODULE_DESCRIPTION("Tenstorrent Atlantis Clock Controller Driver");
+MODULE_AUTHOR("Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>");
+MODULE_LICENSE("GPL");

-- 
2.43.0

