Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83FC364E9E
	for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 21:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780005315; cv=none; b=g8Ox9bb7WGjYGOOSzyv6n2QDSpVN9igwCW1CatTqzkpMs4JNaqtZOHxnt9ze8x2ccsOFPmo87RPNuT9q2CuimFLU+UvvnMe/MY2qzIyT14UQIusnqefF/WJLZiOUvHhChDaRlHYW7dxzfaITqvHSi2rZq8viDICnYAPKWBJBGD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780005315; c=relaxed/simple;
	bh=AVUFgiK7WQ+mMjNIpR/liazNbRKizRRSLTK4vpplnYY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mOqO/Gz/Yhp0Ya7ke5oJ/GuvtjqRQtk6D8CDIlmytcgS3v+PyYerjFVBOa9rd2Pc9/g7yjbGc9kkFnkkPwlSxbhwovbHS6acRtTb6Pbnnqm4SneC4ANECPh1sEfTvRDYUp0AKqKjTJyBffFhP3H/aZE+D/Ei9Go/GzChhE76nyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=boB46W0U; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="boB46W0U"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49048e043e5so55381555e9.1
        for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 14:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780005312; x=1780610112; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r6GY5IuJzx23m60s6A8vYe4mS1IBwBzCIrH9BI78VSQ=;
        b=boB46W0UO6jovSmWv7UD2lkYReYeU/9EOOHi0fVlvUuf/Fwf9HEZGa0DR0KYlMLVFg
         Ol1dM0iqK76cqjbQYf5trkosjM2IIalwChfD2nR+jsRJaIcAg0qEfuXbH15gbSJU9zaN
         tPNHbvWahgPz6hjjCq1fMWJ3mOURCgWRN/53pTHu4vtvtYoy9BIqHYnUdFVLBhWSsTmX
         RXKgsPsvHp6gzPGnjeMxZCUQW1mLSKxd1NIS8Efr18mUe4p1iFpuafPVPZJDOWsY8U/e
         mx2MYvs1chvRI4Z6xui4M+ZLwsD8i9mt6aMz98jMRJfSxoOMJ78LmHe11O+7GwckvzsG
         mAAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780005312; x=1780610112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=r6GY5IuJzx23m60s6A8vYe4mS1IBwBzCIrH9BI78VSQ=;
        b=TIagMM1N7bPtKscsKftp5IP7KsIprHeDhjAo6EaJxCryHQHMa5pa0a67yoGAqypYEe
         EvFycgLrJXccq/XBGrmpP+dj/KTix3zMMe7hgaKcdr1dfdvW9aBpmineYpMWautU94VX
         hkD9oNvrJ2OwVoxZaHXZFFNTAN6ZGqpTJ3rtaXIPNRl5edF1o0Q0yBYSVAEdgX12TlUr
         DQyUpCsFnUN1PRUtRJaxBoeNy/BWg2w2R7pfe0CM6dEltKx8nppa9BpRxV4keXGOYNk0
         ra5JiDQt7bDoonv8/dwFdxpfVh7nA4OugLWj3ZIWpzhxCdrMx52NIXh3BweIWb8Vwa7f
         X9yA==
X-Gm-Message-State: AOJu0YztJPHSLerQUHq33HVHuvgY5hVhc59IUOA6B55cGNjKxQbwZGuG
	+b1jPTrv6eY6IU8pVO5CEkB1L5amoPzZZF5l67tM598L9cKBj1PUl22m
X-Gm-Gg: Acq92OHQi+YlmEmT/+HsCwExXGL2h/kWiPZr9XlAbC4+5vHfjTuEueBK2VE+E/mGqbR
	pM3J9mAe+yy1AvGmDgyIXlni72rCMvAKuTeELjgnDXoCuFXxhH2ypGVTHD1mmA7QLSwq7C3A+CM
	Rw/nFVeRdV7OsQX1WeiBf4dotwUwCprJjiygYaPg6nuCUssyfJy6zDi3pVXOI+a/5Q8GeJLgPuG
	0QQCJyugBLAkyKg9Slr1IU9d9griQkF596PuJrC7PL6LL6KNIZ2SjP/y8EQ3dAV85WtNa9gUUY4
	0fy1ltoeMgxX2c4eR210H1mHarvKNTOUlOzG55MFwn9ntnEw/Mg3V0P1gnZvXUh73H1i0feCopK
	EtDIzcPMdOHJCWHg4Fq31XcAXR+SowF1lazh9m5/rPNKsOTqAAiKUaA3c7LKdOdqVam3+xZ6jYf
	GMbeW9xONxVqV9lLKieuKZP2Np2RNtGtna/MV+/vDJkeZW
X-Received: by 2002:a05:600c:1550:b0:490:846d:e2de with SMTP id 5b1f17b1804b1-4909c0bedc5mr4082985e9.28.1780005311929;
        Thu, 28 May 2026 14:55:11 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.223])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c967c6csm1191085e9.2.2026.05.28.14.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 14:55:11 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Fri, 29 May 2026 00:53:01 +0300
Subject: [PATCH RFC v3 4/5] clk: zte: Introduce a driver for zx297520v3 LSP
 clocks and resets.
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260529-zx29clk-v3-4-c7fe54ea388f@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8696;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=AVUFgiK7WQ+mMjNIpR/liazNbRKizRRSLTK4vpplnYY=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqGLmoPxGIR38pv/G8my07awKQKo8toRvnXlCFt
 zwX/d3zrDiJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCahi5qBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiIB3w//SRm4tIyJw2mD8PlafrWszGcNacBB5JI
 rf7yozIEmAdXZOTMGC4yojuWxZ9V3i3GcNs5MptWRW31ajf0IAPWqgN882jNA4HiZMAzrC7QJMh
 yJcQUOyTpzlKop0FBiMc238oW2RWiG81N3AAVkIifcpwVbkXLZlAubmvFLcI0xYrGEuovO9+/oa
 bnM8FR/8Xv7pQD4YeS8EOBgyAnvCU8VOPBlFUEqPEtlvt0Gf0RxC3wdfEvXaJ9CShqFPD+LuZCZ
 85T6MM9TOspgWMH85TOUPCagXV3UKvcHUmMiIr5lil/Ho9jyh1vxyD5J0df2C/vxMcBGCo2Vo6G
 TkFN/lDycLLEIfvVKU3obXMQqISek42+kZF2mmUyfdUD8X+Rjio2uu61AXOqRBHAUxH1oG4EqAI
 cpkcmq8yn8DxMIIwGqyG98ILApYBu9a/kkxNvfu53K8XM53MGFYrHcfgufJlXH5cgQ5Iw5JxX97
 tTxVT4Pvv/u5D5uQR1paP3QnrnQnAuxIJzdB5VIQ9NEl+SLoGR3j7v9AUzdtKXBUvy5+mYPmLS1
 iphv+5qofVIq7Np6Bp+FLWW7Pm0fxy4I7BjIJ14Sy4Ew5zsP4XqDkuMcx8SRBW3vml0OU7xgv27
 dhOLuSR/H0nGW9kknwGtmzuQnUfs4vSxNameIdiBXsluJ3dEvSNE=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

"LSP" is ZTE's term for this part of the SoC, I suspect it stands for
"low speed peripherals". The main UART is here, together with the flash
controller and more surplus proprietary timers.

It also has two more I2C controllers that supposedly connect to a
battery charger, SPI for displays and I2S for analog telephones. The
boards I have don't have any of these components though.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
 drivers/clk/zte/clk-zx297520v3.c | 230 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 229 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/zte/clk-zx297520v3.c b/drivers/clk/zte/clk-zx297520v3.c
index 986042dd4caf..a67b7fe332f3 100644
--- a/drivers/clk/zte/clk-zx297520v3.c
+++ b/drivers/clk/zte/clk-zx297520v3.c
@@ -755,6 +755,191 @@ static int zx297520_topclk_probe(struct platform_device *pdev)
 	return devm_reset_controller_register(dev, &top->rcdev);
 }
 
+/* LSP clock entries have a common pattern: Bit 0 for PCLK, Bit 1 for WCLK. Bit 4 (and sometimes
+ * more) for WCLK mux.
+ *
+ * Bit 8 and 9 are reset bits. I don't know the difference between the two, but they both
+ * need to be set to deassert the reset.
+ *
+ * Bits 12-16 can be a divisor, but not all clocks have it. Some clocks have a divisor in 16-20.
+ *
+ * The ID given in this table is the first register in the device's MMIO space. ZTE's drivers
+ * usually call this a version register, but it looks more like a device identifier.
+ *
+ * It looks like the registers map to devices like this:
+ *
+ * Timer reg	function	div	dev offset(lsp + xxxx)	ID
+ * 0x0: Read-only, probably device identifier			0x00752100
+ * 0x4:		timer_l1	Y	0x1000			0x02020000
+ * 0x8:		watchdog_l2	Y	0x2000			0x02020000
+ * 0xc:		watchdog_l3	Y	0x3000			0x02020000
+ * 0x10:	i2c1		N	0x4000			0x01020000
+ * 0x14:	i2s0		Yh	0x5000			0x01030000
+ * 0x18:	always 0	N	-
+ * 0x1c:	i2s1		Yh	0x6000			0x01030000
+ * 0x20:	always 0	N	-
+ * 0x24:	qspi		N	0x7000			0x01040000
+ * 0x28:	uart1		N	0x8000			0x01060000
+ * 0x2c:	i2c2		N	0x9000			0x01020000
+ * 0x30:	spi0		Y	0xa000			0x01040000
+ * 0x34:	timer_lb	Y	0xb000			0x02020000
+ * 0x38:	timer_lc	Y	0xc000			0x02020000
+ * 0x3c:	uart2		N	0xd000			0x01060000
+ * 0x40:	watchdog_le	Y	0xe000			0x02020000
+ * 0x44:	timer_lf	Y	0xf000			0x02020000
+ * 0x48:	spi1		Y	0x10000			0x01040000
+ * 0x4c:	timer_l11	Y	0x11000			0x02020000
+ * 0x50:	tdm		Y	0x12000			0x01040000
+ *
+ * Registers 0x58, 0x5c, 0x60, 0x64, 0x68 seem to contain more controls for i2s and tdm.
+ */
+
+static const char * const timer_lsp_sel[] = {
+	"lsp_osc32k",
+	"lsp_osc26m",
+};
+
+static const char * const uart_lsp_sel[] = {
+	"lsp_osc26m",
+	"lsp_mpll_d6",
+};
+
+static const char * const i2s_lsp_sel[] = {
+	"lsp_osc26m",
+	"lsp_dpll_d4",
+	"lsp_mpll_d6",
+	/* Unknown */
+};
+
+static const char * const tdm_lsp_sel[] = {
+	"lsp_tdm_wclk",
+};
+
+static const char * const spi_lsp_sel[] = {
+	"lsp_osc26m",
+	"lsp_mpll_d4",
+	"lsp_mpll_d6",
+	/* Unknown */
+};
+
+static const char * const qspi_lsp_sel[] = {
+	"lsp_osc26m",
+	"lsp_mpll_d4",
+	"lsp_mpll_d5",
+	"lsp_mpll_d6",
+	"lsp_mpll_d8",
+	"lsp_mpll_d12",
+	"lsp_osc26m",
+	"lsp_osc26m",
+};
+
+#define LSP_CLOCK(offset, name, mux, div_shift, div_size) {\
+		ZX297520V3_##name##_RESET, ZX297520V3_##name##_WCLK, ZX297520V3_##name##_PCLK,\
+		#name, offset, 8, offset, 0, 1, "lsp_pclk", offset, 4, 4, mux, ARRAY_SIZE(mux),\
+		offset, div_shift, div_size, 0}
+
+static const struct zx297520v3_composite lsp_clocks[] =  {
+	LSP_CLOCK(0x4,	TIMER_L1,	timer_lsp_sel,	0,	0),
+	LSP_CLOCK(0x8,	WDT_L2,		timer_lsp_sel,	0,	0),
+	LSP_CLOCK(0xc,	WDT_L3,		timer_lsp_sel,	0,	0),
+	LSP_CLOCK(0x10,	I2C1,		uart_lsp_sel,	0,	0),
+	LSP_CLOCK(0x14,	I2S0,		i2s_lsp_sel,	16,	4),
+	LSP_CLOCK(0x1c,	I2S1,		i2s_lsp_sel,	16,	4),
+	LSP_CLOCK(0x24,	QSPI,		qspi_lsp_sel,	0,	0),
+	LSP_CLOCK(0x28,	UART1,		uart_lsp_sel,	0,	0),
+	LSP_CLOCK(0x2C,	I2C2,		uart_lsp_sel,	0,	0),
+	LSP_CLOCK(0x30,	SPI0,		spi_lsp_sel,	12,	4),
+	LSP_CLOCK(0x34,	TIMER_LB,	timer_lsp_sel,	12,	4),
+	LSP_CLOCK(0x38,	TIMER_LC,	timer_lsp_sel,	12,	4),
+	LSP_CLOCK(0x3c,	UART2,		uart_lsp_sel,	0,	0),
+	LSP_CLOCK(0x40,	WDT_LE,		timer_lsp_sel,	12,	4),
+	LSP_CLOCK(0x44,	TIMER_LF,	timer_lsp_sel,	12,	4),
+	LSP_CLOCK(0x48,	SPI1,		spi_lsp_sel,	12,	4),
+	LSP_CLOCK(0x4c,	TIMER_L11,	timer_lsp_sel,	12,	4),
+	LSP_CLOCK(0x50,	TDM,		tdm_lsp_sel,	16,	4),
+};
+
+#undef LSP_CLOCK
+
+static int zx297520_lspclk_probe(struct platform_device *pdev)
+{
+	static const char * const parent_names[] = { "mpll_d5", "mpll_d4", "mpll_d6", "mpll_d8",
+						     "mpll_d12", "osc26m", "osc32k", "pclk",
+						     "tdm_wclk", "dpll_d4",
+	};
+
+	struct zx29_clk_controller *lsp;
+	struct device *dev = &pdev->dev;
+	void __iomem *base;
+	struct clk *parent;
+	unsigned int i;
+	int res;
+
+	lsp = devm_kzalloc(dev, offsetof(struct zx29_clk_controller,
+					 resets[ZX297520V3_LSPRST_END]), GFP_KERNEL);
+	if (!lsp)
+		return -ENOMEM;
+
+	lsp->clocks = devm_kzalloc(dev, struct_size(lsp->clocks, hws,
+				   ZX297520V3_LSPCLK_END), GFP_KERNEL);
+	if (!lsp->clocks)
+		return -ENOMEM;
+	lsp->clocks->num = ZX297520V3_LSPCLK_END;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	/* TODO: Technically we can disable the pclk if all LSP devices are shut down, but that
+	 * needs custom clk ops to tiptoe around a disabled LSP pclk before attempting to access
+	 * the actual clock. In normal operation it is unlikely that all LSP devices are shut down
+	 * simultaneously though as UART and NAND are located here.
+	 */
+	parent = devm_clk_get_enabled(dev, "pclk");
+	if (IS_ERR(parent)) {
+		dev_err(dev, "failed to find lsp pclk\n");
+		return PTR_ERR(parent);
+	}
+
+	for (i = 0; i < ARRAY_SIZE(parent_names); ++i) {
+		parent = devm_clk_get(dev, parent_names[i]);
+		if (IS_ERR(parent)) {
+			dev_err(dev, "failed to find lsp %s clock\n", parent_names[i]);
+			return PTR_ERR(parent);
+		}
+	}
+
+	res = zx297520v3_composite(dev, base, lsp->clocks, lsp->resets,
+				 lsp_clocks, ARRAY_SIZE(lsp_clocks));
+	if (res)
+		return res;
+
+	/* This is to catch holes in the tables rather than registration errors */
+	for (i = 0; i < ZX297520V3_LSPCLK_END; i++) {
+		if (!lsp->clocks->hws[i]) {
+			dev_err(dev, "Clock %u not registered\n", i);
+			return -ENODEV;
+		}
+	}
+
+	res = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, lsp->clocks);
+	if (res)
+		return res;
+
+	for (i = 0; i < ZX297520V3_LSPRST_END; ++i) {
+		if (!(lsp->resets[i].reg && lsp->resets[i].mask)) {
+			dev_err(dev, "Reset %u has no register or mask\n", i);
+			return -ENODEV;
+		}
+	}
+
+	lsp->rcdev.owner = THIS_MODULE;
+	lsp->rcdev.nr_resets = ZX297520V3_LSPRST_END;
+	lsp->rcdev.ops = &zx297520v3_rst_ops;
+	lsp->rcdev.of_node = dev->of_node;
+	return devm_reset_controller_register(dev, &lsp->rcdev);
+}
+
 static const struct of_device_id of_match_zx297520v3_topclk[] = {
 	{ .compatible = "zte,zx297520v3-topclk"},
 	{ }
@@ -768,7 +953,50 @@ static struct platform_driver clk_zx297520v3_topclk = {
 		.of_match_table = of_match_zx297520v3_topclk,
 	},
 };
-module_platform_driver(clk_zx297520v3_topclk);
+
+static const struct of_device_id of_match_zx297520v3_lspclk[] = {
+	{ .compatible = "zte,zx297520v3-lspclk"},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, of_match_zx297520v3_lspclk);
+
+static struct platform_driver clk_zx297520v3_lspclk = {
+	.probe = zx297520_lspclk_probe,
+	.driver = {
+		.name = "clk-zx297520v3-lspclk",
+		.of_match_table = of_match_zx297520v3_lspclk,
+	},
+};
+
+static int __init zx297520v3_clk_module_init(void)
+{
+	int res;
+
+	res = platform_driver_register(&clk_zx297520v3_topclk);
+	if (res) {
+		pr_err("Failed to register driver %s: %d\n",
+		       clk_zx297520v3_topclk.driver.name, res);
+		return res;
+	}
+	res = platform_driver_register(&clk_zx297520v3_lspclk);
+	if (res) {
+		pr_err("Failed to register driver %s: %d\n",
+		       clk_zx297520v3_lspclk.driver.name, res);
+		platform_driver_unregister(&clk_zx297520v3_topclk);
+		return res;
+	}
+
+	return 0;
+}
+
+static void __exit zx297520v3_clk_module_exit(void)
+{
+	platform_driver_unregister(&clk_zx297520v3_lspclk);
+	platform_driver_unregister(&clk_zx297520v3_topclk);
+}
+
+module_init(zx297520v3_clk_module_init);
+module_exit(zx297520v3_clk_module_exit);
 
 MODULE_AUTHOR("Stefan Dösinger <stefandoesinger@gmail.com>");
 MODULE_DESCRIPTION("ZTE zx297520v3 clock driver");

-- 
2.53.0

