Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A0147F2EC
	for <linux-clk@vger.kernel.org>; Thu,  2 Jul 2026 12:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782995497; cv=none; b=FjoNcO0FAMNcX0beaw1vbqLjSxDnIEAQHr7CPbJrNoLIFrUrYL3yxPjFgdgUqKw+yoEhzxteCoVbxXq53DC5gJs0pmlTUCwtUHnnYsWtE+3/VtgVRcAasSWPopTufnMcmSaSS/GIT+C4mpQ64/Iwh/6qApNBHVDzb3c040Hz+/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782995497; c=relaxed/simple;
	bh=F1BW2OtB1L4atzHir5xyMPhq9vhCUockLhS79uDA0Kc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QN9CnxJmqIHLOFtNpErCqh1uGkV+fHS0wDM2vory1OfZDUPGAQPwhGXVyNfU307/+14l4OhDN7kvRN8aFCmItIKg/WzVQ72wD9l3oh9w4/DOAgwJ/Ax1Nhs05Us4wyQbHZ/pW/5F2CXQWlWZuYHSkouSKVZDbP8qDztlJDHF+to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TI2hPzRv; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TI2hPzRv"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493b27c7451so5354725e9.0
        for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 05:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782995487; x=1783600287; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M14rQTlPNoEhf0b8ahlEf8t6l4fnbwAvdy1RJM8PIGg=;
        b=TI2hPzRva5HQvOrPZnZLa+LFXgkxfNy5Z/KeOhbrvWg2ATQFGcpjUsb9vW6CH9ULPR
         cZX5bigY1aSZXvUxbO/ccf212w3DKQeODWURv7GOGnhpHqmaoRRuK0GC+ZeBjgjYV2uI
         VBgoWnvlRMw8es/VXnSAkz5Ar+sJ8TV7YlGbBoyQWAc+Tova1iKE8kMnPtm6RwqA8OVx
         IB3sEqcvFseJtM8WVOH9jDFxel4j/E2lMoEggkNFPIxSIu3QIz/ow221yjfYV7pQbSTh
         t4MZle4/c7+FnIpv1957WZk3srJUEoeKapg5kUgh7RQJ4r77z7RajgmWmpNC//BUI/WI
         fBsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782995487; x=1783600287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M14rQTlPNoEhf0b8ahlEf8t6l4fnbwAvdy1RJM8PIGg=;
        b=QmnAnNDoqyeai4RXaP4WoD5Gw6kAl9NZAlVNh48T+BkseHOq+N5fclM3MJ4S3CZwwV
         T59MSa7hfADXIiPogYmhwfDCq0JTEVFrQyiS/KkZb7Ig2d8VbLQ928s6eXGrcjH1YI7M
         6ZL+JfZ6r1aXPlO4grvC/OLDKxdEV7Rirx74Aw94gXZo7qK2QS8ReArojFMrRdlxzZIV
         NERU7b1key+HYIzVLW2GnhFI3Mu86rWwlJeB242W5W78I6fkiF1FwyUORkF8xTR1rEWy
         YseKxfyo5LB/fWrd1zR10ttruYPisK/QQmCA0CymRnNHzsm9odBcSKp2JFaYhxauxXqv
         8mjg==
X-Forwarded-Encrypted: i=1; AHgh+Rr4BmwZRnMS2EfP2/AsGZNv25C3+mYrVKPQ1u4c66c33uc5BDfWgv7yF2hBa2bFDEh8CtDpiC+tnNA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQewHN+aQ6KbHcxQV3xr7NGFXydXySAK9f4+u6veZLXPpzhGNQ
	cKMTfT90GOiCpXhgrDr/spui9LZ4f4Kt4bpcsBvLoFANyd2Us+rSzjZB
X-Gm-Gg: AfdE7cnYsyD8d8PJ4EkF9R8I4/fXrgM3FnjtKq/55Y8Oh8qpEzKlLoudygb0NU2OTDi
	f70FsJRK1kh8g60+6HaeAOeeDK96E/Q9Gll0MYEp0s432uIxNie/MmCv+znNXWDqaW4LZ6b7K+A
	ClVZsAb84gB/zBGqkX/jfhdlRo9/Gn8wfQ0SF6zjRGuw20bW94uFfGD8VtkNUa+bMDia0x8roDX
	2CByjROXg5YQxJNndYeUkLCE7hhTn+dxDmMUn7KOkF1gaJWV0ZKl2Id3cOBmmZ0r5/ARDa55FXV
	+lUdKBtZ5oRxFO4hc9jTFTBCW9rdUFz+DJQsJcbvWfVjuYfDtb/kfRamNJ0h7/WLEYBm6fakQeT
	UylmrZ3QfB5Lph0HLa6m0pqEFeMubCBGzSJJsXGIgpuQIofYQoM9gp3SAiNKTBk41mDYtm1IhcE
	mRfwLzpdpBcJH0hcNiaQ+koTZ91xr5S6FV7a5NZiTx0It44W5gnBSNWuhzfz6SUj/9K0YA6T1Rc
	F2GQEg4P9rgHRGQfQ5ksq+tkDL62e8rM+i+OQ==
X-Received: by 2002:a5d:5d11:0:b0:46e:5594:7385 with SMTP id ffacd0b85a97d-475e0af6aabmr14521534f8f.25.1782995486857;
        Thu, 02 Jul 2026 05:31:26 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:7a4b:58b4:175e:8c2d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477ddf0f433sm9772923f8f.32.2026.07.02.05.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 05:31:26 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH RFC v2 2/9] clk: renesas: r9a09g077: Add SYSC regmap support
Date: Thu,  2 Jul 2026 13:31:05 +0100
Message-ID: <20260702123112.161160-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260702123112.161160-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260702123112.161160-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add System Controller (SYSC) regmap support for the RZ/T2H SoC.

The RZ/T2H SoC features two System Controller (SYSC) blocks that handle
low-power management and access control. These blocks are defined as child
nodes within the Clock Pulse Generator (CPG) address space in the device
tree. Implement support for creating regmaps for these SYSC blocks.

Register the regmap using of_syscon_register_regmap() against the CPG
device node so that consumers can access SYSC registers via the existing
syscon phandle.

Add a sysc_init() callback to the CPG/MSSR core to allow SoC-specific
initialization of the SYSC regmap.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- Made use of for_each_child_of_node_scoped
- Moved sysc_init() to the end of the probe function
---
 drivers/clk/renesas/Kconfig            |   2 +
 drivers/clk/renesas/r9a09g077-cpg.c    | 164 +++++++++++++++++++++++++
 drivers/clk/renesas/renesas-cpg-mssr.c |   3 +
 drivers/clk/renesas/renesas-cpg-mssr.h |   1 +
 4 files changed, 170 insertions(+)

diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
index 5c0238e878b7..d648ddc02fca 100644
--- a/drivers/clk/renesas/Kconfig
+++ b/drivers/clk/renesas/Kconfig
@@ -219,11 +219,13 @@ config CLK_R9A09G077
 	bool "RZ/T2H clock support" if COMPILE_TEST
 	select CLK_RENESAS_CPG_MSSR
 	select CLK_RZV2H_CPG_LIB
+	select MFD_SYSCON
 
 config CLK_R9A09G087
 	bool "RZ/N2H clock support" if COMPILE_TEST
 	select CLK_RENESAS_CPG_MSSR
 	select CLK_RZV2H_CPG_LIB
+	select MFD_SYSCON
 
 config CLK_SH73A0
 	bool "SH-Mobile AG5 clock support" if COMPILE_TEST
diff --git a/drivers/clk/renesas/r9a09g077-cpg.c b/drivers/clk/renesas/r9a09g077-cpg.c
index 5640c2035e5a..33aec2f272df 100644
--- a/drivers/clk/renesas/r9a09g077-cpg.c
+++ b/drivers/clk/renesas/r9a09g077-cpg.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/bits.h>
 #include <linux/clk-provider.h>
 #include <linux/clk/renesas.h>
 #include <linux/device.h>
@@ -15,7 +16,9 @@
 #include <linux/iopoll.h>
 #include <linux/kernel.h>
 #include <linux/math.h>
+#include <linux/mfd/syscon.h>
 #include <linux/module.h>
+#include <linux/regmap.h>
 #include <linux/types.h>
 #include <linux/units.h>
 
@@ -87,6 +90,16 @@ MODULE_IMPORT_NS("RZV2H_CPG");
 #define CPG_PLL_MON(x)		((x) - 0x10)
 #define CPG_PLL_MON_LOCK	BIT(0)
 
+enum r9a09g077_sysc {
+	RZT2H_SYSC0,
+	RZT2H_SYSC1,
+	RZT2H_MAX_SYSC,
+};
+
+struct r9a09g077_sysc_reg {
+	void __iomem *base;
+};
+
 enum rzt2h_clk_types {
 	CLK_TYPE_RZT2H_DIV = CLK_TYPE_CUSTOM,	/* Clock with divider */
 	CLK_TYPE_RZT2H_MUX,			/* Clock with clock source selector */
@@ -875,6 +888,156 @@ r9a09g077_cpg_clk_register(struct device *dev, const struct cpg_core_clk *core,
 	}
 }
 
+static int rzt2h_regmap_read(void *context, unsigned int reg, unsigned int *val)
+{
+	struct r9a09g077_sysc_reg *sysc = context;
+
+	*val = readl(sysc->base + reg);
+
+	return 0;
+}
+
+static int rzt2h_regmap_write(void *context, unsigned int reg, unsigned int val)
+{
+	struct r9a09g077_sysc_reg *sysc = context;
+
+	writel(val, sysc->base + reg);
+
+	return 0;
+}
+
+static const struct regmap_bus rzt2h_sys_regmap_bus = {
+	.reg_write = rzt2h_regmap_write,
+	.reg_read = rzt2h_regmap_read,
+};
+
+static bool rzt2h_writeable_readable_sysc0(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case 0x0000 ... 0x0008:
+	case 0x1000 ... 0x1164:
+	case 0x2000 ... 0x2024:
+	case 0x2030 ... 0x2054:
+	case 0x2060:
+	case 0x3000 ... 0x300C:
+	case 0x3100 ... 0x310C:
+	case 0x4100:
+	case 0x4200:
+		return true;
+
+	default:
+		return false;
+	}
+}
+
+static bool rzt2h_writeable_readable_sysc1(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case 0x000C:
+	case 0x0034 ... 0x0038:
+	case 0x0048 ... 0x007C:
+	case 0x0100 ... 0x017C:
+	case 0x0200 ... 0x027C:
+	case 0x0308 ... 0x030C:
+	case 0x0320 ... 0x037C:
+	case 0x0480 ... 0x0484:
+	case 0x0580 ... 0x0584:
+	case 0x0680 ... 0x0684:
+	case 0x0780 ... 0x0784:
+	case 0x0880:
+	case 0x0980 ... 0x098C:
+	case 0x1100 ... 0x1118:
+	case 0x1200 ... 0x1204:
+	case 0x1400 ... 0x1484:
+	case 0x1500 ... 0x1584:
+	case 0x1600 ... 0x1680:
+	case 0x1700 ... 0x1780:
+	case 0x1800 ... 0x1884:
+	case 0x1900 ... 0x1984:
+	case 0x1A00 ... 0x1A84:
+	case 0x1B00 ... 0x1B8C:
+	case 0x1C00 ... 0x1C8C:
+	case 0x1D00 ... 0x1D8C:
+	case 0x3000:
+	case 0x3010:
+	case 0x3020:
+	case 0x3030:
+	case 0x4000:
+	case 0x5008 ... 0x500C:
+	case 0x5020 ... 0x503C:
+	case 0x5100 ... 0x5114:
+	case 0x6000:
+		return true;
+
+	default:
+		return false;
+	}
+}
+
+static int r9a09g077_sysc_init(struct device *dev)
+{
+	struct device_node *child, *np = dev->of_node;
+
+	for_each_child_of_node_scoped(np, child) {
+		struct regmap_config *regmap_cfg __free(kfree) = kzalloc_obj(*regmap_cfg);
+		struct r9a09g077_sysc_reg *sysc_reg;
+		struct regmap *regmap;
+		void __iomem *base;
+		char *name;
+		u32 index;
+		int ret;
+
+		if (!of_node_name_eq(child, "system-controller"))
+			continue;
+
+		if (of_property_read_u32(child, "renesas,sys-block", &index))
+			return -EINVAL;
+
+		if (index >= RZT2H_MAX_SYSC)
+			return -EINVAL;
+
+		sysc_reg = devm_kzalloc(dev, sizeof(*sysc_reg), GFP_KERNEL);
+		if (!sysc_reg)
+			return -ENOMEM;
+
+		if (!regmap_cfg)
+			return -ENOMEM;
+
+		name = devm_kasprintf(dev, GFP_KERNEL, "sysc%u", index);
+		if (!name)
+			return -ENOMEM;
+
+		base = devm_of_iomap(dev, child, 0, NULL);
+		if (IS_ERR(base))
+			return PTR_ERR(base);
+
+		sysc_reg->base = base;
+		regmap_cfg->name = name;
+		regmap_cfg->reg_bits = 32;
+		regmap_cfg->reg_stride = 4;
+		regmap_cfg->val_bits = 32;
+		regmap_cfg->fast_io = true;
+		regmap_cfg->max_register = 0x10000;
+		if (index == RZT2H_SYSC0) {
+			regmap_cfg->readable_reg = rzt2h_writeable_readable_sysc0;
+			regmap_cfg->writeable_reg = rzt2h_writeable_readable_sysc0;
+		} else {
+			regmap_cfg->readable_reg = rzt2h_writeable_readable_sysc1;
+			regmap_cfg->writeable_reg = rzt2h_writeable_readable_sysc1;
+		}
+
+		regmap = devm_regmap_init(dev, &rzt2h_sys_regmap_bus, sysc_reg, regmap_cfg);
+		if (IS_ERR(regmap))
+			return PTR_ERR(regmap);
+
+		ret = of_syscon_register_regmap(child, regmap);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 const struct cpg_mssr_info r9a09g077_cpg_mssr_info = {
 	/* Core Clocks */
 	.core_clks = r9a09g077_core_clks,
@@ -889,4 +1052,5 @@ const struct cpg_mssr_info r9a09g077_cpg_mssr_info = {
 
 	.reg_layout = CLK_REG_LAYOUT_RZ_T2H,
 	.cpg_clk_register = r9a09g077_cpg_clk_register,
+	.sysc_init = r9a09g077_sysc_init,
 };
diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index 80f4403ea2ba..dcca7f095052 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -1414,6 +1414,9 @@ static int __init cpg_mssr_probe(struct platform_device *pdev)
 
 	error = cpg_mssr_reset_controller_register(priv);
 
+	if (!error && info->sysc_init)
+		error = info->sysc_init(priv->dev);
+
 reserve_exit:
 	cpg_mssr_reserved_exit(priv);
 
diff --git a/drivers/clk/renesas/renesas-cpg-mssr.h b/drivers/clk/renesas/renesas-cpg-mssr.h
index ad11ab5f0069..2d1b5c2c4472 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.h
+++ b/drivers/clk/renesas/renesas-cpg-mssr.h
@@ -178,6 +178,7 @@ struct cpg_mssr_info {
 
 	/* Callbacks */
 	int (*init)(struct device *dev);
+	int (*sysc_init)(struct device *dev);
 	struct clk *(*cpg_clk_register)(struct device *dev,
 					const struct cpg_core_clk *core,
 					const struct cpg_mssr_info *info,
-- 
2.54.0

