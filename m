Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C66C31F9A2
	for <linux-clk@vger.kernel.org>; Sun, 10 May 2026 19:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778439696; cv=none; b=qBm7PhYLq4EjSybKRJhCTtd9gIoBghtBp3fL5GGu2+9siSgR2WUCPcdtdPTVMpF5AZDjLKWUp4zFUWrQ7KtFWsra41bODsjmk/vpQ+s6QbxTh7fJU7ANJ45KegpYrFlLh6L9oZfk3HurtNgxIMOdYuF3FnyqSL+74ZaJVtBGHr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778439696; c=relaxed/simple;
	bh=lT0PY5Ih14lC9dDe3Ae8vidP2UICe0uc4N1nVYtyQR0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ID6zjZPx6oDFQM1mQoyYWKYf+SWRQTJDMvUjCMVdUbGrEKLWR6eHWf/P3e2hyZuAwomIhYX3agnahGS7sSHhaQB6nvGrokdTvv9bUi3PHSBYTmseofjbICm3f1nwSnU32BPvQf3qgYwu7k6fRqriieHN+2mGrIf4XEWxtqIIDAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DHH50+wM; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DHH50+wM"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488af9fdaa7so20173245e9.1
        for <linux-clk@vger.kernel.org>; Sun, 10 May 2026 12:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778439693; x=1779044493; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=60aiFMdJ5EF0YuV44E9gs+Z4pT0nbdBQxVcQwSAiePU=;
        b=DHH50+wMOWiuj+hZOcFvIQd7oR/N9Im8ry+tqkT88h9i4JZTm8HXl8+s9+S6Z6K18s
         5MRYDmpXUnuoALv6/hU5KAQnFHdIOV5UuN84lPYatvdNl0r923ffR8/GQO1RH5IizOwp
         NH3WrsMmNzU3A0xfNvUVEMDNuOadRouppzYthcOVgmI2p6B1KcmhChaTKiRGFWNCF4od
         Qj0Y4RA3FnlSqGRrrxIJBjWJ/smzJ6JzL8Muwu7zrCrCpmREg//6GsvpTaE+jrIOChci
         PPWt6cAZcZ/JdYw+A3DGvZQykccBmyXqYS2aJkulr1448dYRQtBB3IELhuu9HKe96fNU
         R+kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778439693; x=1779044493;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=60aiFMdJ5EF0YuV44E9gs+Z4pT0nbdBQxVcQwSAiePU=;
        b=n1Nypa8mdyYnQg443uZwqQHH3kHRgn+tEQwngs7bwFy5BqR/+gMKH8cmgxCD1F9RlK
         TQvMkY5CEPVfPbfx+Nk7fzXmAoK3JJzFtAYUfKaHvYirnjUdEITiViiL8/5YNnWCbedE
         KbYZ1FujJe5MmymuO8pO/H4dZRAm9vl7399XA8rpM6V+HT5QuI5sylAbsb+al/++1f5+
         353b5YMP6Xicmpbd/4Yz7gpIqunA8W6RDHmWaolOPqxlZknd4i/MESuflEeodfmcMTT4
         b8Q0eGOLq+4gfJLrZS6a/qqZiMpMlyorvF2RUKHQsyF23JnkQROy/pHAsvlYcYK4DP8h
         FGAg==
X-Gm-Message-State: AOJu0Yz5FxDnnzunZtTW0S2XU1P3bVvOnjsyX2SHwFcDiGQulz0VBSE7
	Ye5StgepXY9jZpawZrj4jxg4qDF1XUkNS+JJtoNXqJuz0uTN5DipogsO
X-Gm-Gg: Acq92OE+B+/+ZZsmNL7JZMYk/IwDGSm5NL1UAhOsx5LlFZmqYsO7ZJSMxyItkjSXQrR
	FeyUq3krHbSKkyp55WDue5BcjKeA10m+aS0rHYTDxjoPARsBfr1fuacYaFxgizNWw7+Ut9X7mib
	CsD8wwQS1X55Gv+Q43+lZ5i/exVNqwLZ7mPoCopuEFMMeZbRF8NQPgFHjlxVtgvGWF/3zHaf65E
	vk8BZDS1+ck+YuV5A5waGMrxGh39fEKl45GYq90cCtG3yqmVXo7ZRI57eTOwVD4h6hwfjuFElp+
	sifJ3LO7JP6j7Xa4/Jj0hLGwaEODMm6hIPmOqE+djwS8eR/OKKXef8vBZrvfYkhE4LaPILFNb7X
	hkJAGiC2qCL5LA1cO7koKJJ/68B13NXyr31O8aBiAOiT9ClQVTQk8dDRaL87RW+yyJzvf9qElYo
	R/MiOm89UDxI/u/ycNp4fERIKYvKogaGqBgA==
X-Received: by 2002:a05:600c:45c6:b0:48a:93f8:dd02 with SMTP id 5b1f17b1804b1-48e521e6090mr332212165e9.14.1778439692806;
        Sun, 10 May 2026 12:01:32 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e701e9585sm132877475e9.5.2026.05.10.12.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 12:01:31 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Sun, 10 May 2026 22:01:03 +0300
Subject: [PATCH RFC 4/4] clk: zte: Introduce a driver for zx297520v3 LSP
 clocks and resets.
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260510-zx29clk-v1-4-e1bacfffe967@gmail.com>
References: <20260510-zx29clk-v1-0-e1bacfffe967@gmail.com>
In-Reply-To: <20260510-zx29clk-v1-0-e1bacfffe967@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7176;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=lT0PY5Ih14lC9dDe3Ae8vidP2UICe0uc4N1nVYtyQR0=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqANX6KYEJuO+6GM3YtADEJWSukHdj2xJi9mUzX
 Nm+gxNizbWJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCagDV+hsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiLGKRAAlF8qgbBoYBwUAKhOl3BIKIT6G9WGh50
 9kTI/pwGC+KlmgvE/ovevGLOdlV7vG2hD0VCtxrPInVEO9d8ZgXvkgQ3U6Xe9U0aHEiWk92sE7l
 5k/oQCpw9pB6XKlmmmFDFWoXwjo0HwjtJ99JDpEIc6FAo59XdD6PAul3ftFUxm/m4VcORllzt0T
 XegVmC2WRnwYDxTUORx/zUdWq5NxnzodpjMi0BWcqOhgYTOQPIq1o0eiLuq8/dLczzymwKeAY7g
 WSoTEBmxI6ztxHa8vaHI4X4vpu3OcesZ4n8XH8qC5wAUftaaVsV9zC+MITotUYSvelAno7JPSaf
 qrpwxpQv+Ag989LjXcBu0t6rbMRTYF0wrV0Z6pzGBAOCE7zNd+yM92JyhY7ABGfjyECePEHNLKH
 rlUGICfrSs4SZxraxdjYrLG+mExSE05bM1mK3hsmkqXZGrxfNu840Tf6+LUgcmM8i5j9a0JIasr
 PaFFpyLMGbKbWpnx0GodduaVFM70YV8hYBxTxIpqJVFoEMhTDRBHVq4CokujPM0MzKTAQp0GDuf
 HeVixbtwAxsznfhuD2rk3g1XOKvSgEAfADWuAIQfaMedLC7/uYr4QdRE63BTv6FwDsRSVVrUWAD
 J5TCm7fGR3oUfkYcmmeA1bLAEXqznTlPqP84P3Xd6sZCz7UCJd/s=
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
 drivers/clk/zte/clk-zx297520v3.c | 183 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 183 insertions(+)

diff --git a/drivers/clk/zte/clk-zx297520v3.c b/drivers/clk/zte/clk-zx297520v3.c
index 0c06add433ee..e69be686c1b1 100644
--- a/drivers/clk/zte/clk-zx297520v3.c
+++ b/drivers/clk/zte/clk-zx297520v3.c
@@ -792,6 +792,189 @@ static struct platform_driver clk_zx297520v3_matrixclk = {
 };
 module_platform_driver(clk_zx297520v3_matrixclk);
 
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
+	static const char * const *parent_names[] = { "mpll_d5", "mpll_d4", "mpll_d6", "mpll_d8",
+						      "mpll_d12", "osc26m", "osc32k", "pclk" };
+
+	struct zx29_clk_controller *lsp;
+	struct device *dev = &pdev->dev;
+	struct clk *parent;
+	unsigned int i;
+	int res;
+
+	dev_info(dev, "Registering zx297520v3 LSP clocks and resets\n");
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
+	lsp->base = devm_platform_ioremap_resource(pdev, 0);
+	WARN_ON(!lsp->base);
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
+	res = zx297520v3_composite(dev, lsp->base, lsp->clocks, lsp->resets,
+				 lsp_clocks, ARRAY_SIZE(lsp_clocks));
+	if (res)
+		return res;
+
+	res = of_clk_add_hw_provider(dev->of_node, of_clk_hw_onecell_get, lsp->clocks);
+	if (res)
+		return res;
+
+	lsp->rcdev.owner = THIS_MODULE;
+	lsp->rcdev.nr_resets = ZX297520V3_LSPRST_END;
+	lsp->rcdev.ops = &zx297520v3_rst_ops;
+	lsp->rcdev.of_node = dev->of_node;
+	return devm_reset_controller_register(dev, &lsp->rcdev);
+}
+
+static const struct of_device_id of_match_zx297520v3_lspclk[] = {
+	{ .compatible = "zte,zx297520v3-lspclk"},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, of_match_zx297520v3_lspclk);
+
+static struct platform_driver zx297520v3_lspclk = {
+	.probe = zx297520_lspclk_probe,
+	.driver = {
+		.name = "clk-zx297520v3-lspclk",
+		.of_match_table = of_match_zx297520v3_lspclk,
+	},
+};
+module_platform_driver(zx297520v3_lspclk);
+
 MODULE_AUTHOR("Stefan Dösinger <stefandoesinger@gmail.com>");
 MODULE_DESCRIPTION("ZTE zx297520v3 clock driver");
 MODULE_LICENSE("GPL");

-- 
2.53.0

