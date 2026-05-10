Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B614C34D4CE
	for <linux-clk@vger.kernel.org>; Sun, 10 May 2026 21:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778449829; cv=none; b=TZNmEKSzgkYvnEYcPVmsV+abWyWcXW92sfULsHEC1PZQFnqqqwJiVs12XG/Ju3WAqwr/jAIXWvDUQzp8nXz9Af/sPaVPA9WwEDWnpx5nJZmnj3Q2miYjaTPyB/uLpZB4hZpAIIq82XFB+nHmzIaPRy7CaEdRwGWLOcf59KAUKNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778449829; c=relaxed/simple;
	bh=BPZww5hE1dLIIGa/RUA+R8wjr/jhPw5RMGELLQxayFk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nGbcGsDUAcTPLtq5gaESroWBvezWfHpqSh0wkpxG1rDKFBEwSaScGFBis1dYn3CHHOoHYGrHJvgwMzbLHpOMBoRvC2N37yqjM4620UnyAiW60sIf29PYb2FSdtcS7EO+I5g7lXc0WTFNPeRtcw84D4u7872W+EY5w5ltfm0aqgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CpgzyMhS; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CpgzyMhS"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-44a14580111so2685989f8f.0
        for <linux-clk@vger.kernel.org>; Sun, 10 May 2026 14:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778449826; x=1779054626; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F6Q2LdCcfc0b7tOZw82gElqK7SvqjvWQpF13mGE0gJs=;
        b=CpgzyMhSOTZhe8HF5VmT+/0eH5aBJXLYKUiQ349dseIvmEgmOcnkPnU2U6kq9HqzGS
         AUBj4xokVSYfObjJ619wT5i3pZE+lQcN6r8lBoJJ0gyrhElKWrS+/SrNsBoT7c468Z9A
         aBhTc2ghFXKUPfwLirXXvex2tJSCyQwPuKpUv+qxhhP3L1BxNbrSLMjAMPty/0zWDsOr
         p6WZCYudKj7YKGBvBBJwkXuq6Z+KBRcVUZweE4+/kiXPwtmOzlCJbOxFeeV7wRAHDi8P
         TrqpQjainG0x+obbtLXhcC68NvHp9oybUt7uoFA3oR9zdbxpooqnu2yOrhXDmbv0OzqQ
         ftTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778449826; x=1779054626;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F6Q2LdCcfc0b7tOZw82gElqK7SvqjvWQpF13mGE0gJs=;
        b=VjUBT7A6ElMgFITiHPXQIxZnExKqroQPX1lEjYgQFLIGHoAqCMEqBs4B9zH5eZsCXF
         GkVdILTt4X61JH3FaZ/9act+GpSj9swN2DxWz6ab0gYmRxiZ8+ahh5fXw30zWRTIdocD
         81+ARyepArXEfkwpfq2nVyWQqE1iOr8F+LdvlnzMd2BXpeB8mE6PadEgtj6ioSRtDPhE
         fuTrEgJP20ZuaxRy6H5msspN8CFddoop8JOGPZ9Fp9275kSp6P3NUbYmtuzRCVPPUpRl
         cuOXDxJSMKRrznXoW8dsIN5KrMUlerf959iYaRI33kFtIyCQek9kty0bFSH6aLSDJHwR
         kwXA==
X-Gm-Message-State: AOJu0Yw4qv0JkhbrPRJBvp8nRbBAlfToONYFkIp1aNs2yHn1+qTm5XMd
	laZQZ+Qn0NyDxJBds1xHfcdvfUiJ6MBqRoC0uLnhd/F+IW73rJjFTCyLbbqh2A+7O+s=
X-Gm-Gg: Acq92OFdvbTc7ToXjLc6DF6KLR5Voq1JL7RgPrM/QcHvLJzrNEuaRUyJ1ScuGINhUHh
	Ukx0gBba/+7C+mTxDJRaQicbogzs0CUiFRJY+cDJ/rLvsJ9tzOWwgD9RyZd3pAQkCKzZ6/92eX+
	63uC1tyCjhNqWgp2V5BpNUu9LgstNVOUEPI3F7m/WCt8ol2nKuR2tHdYqKWvY9okaMSwWc/gFm3
	CoCBk0JQJK+ztqP+TAkU5pOHIAWKjdNGa5vNUZrIngpwI2W4CzrqLPS0ODt7YWZ5SvuAy04yAlG
	NX0pKu4RCav9YiseTTgWEHaMG/eqPRPabrU1kZXB8DJkI3m4oZDDYyOhGPGOkcSlOdH0YSlqTmr
	ZLKQotoWUUFLrGRXKmQQFHQAyIUKNqWO7v31TC/x+Mq1AJHsVahbKIf8Vahsl+R0m6lkmKkPNqC
	hl1XlWReu3M95xCb6GEtfFP2MRN8qyklc=
X-Received: by 2002:a05:6000:2311:b0:44d:261:54c5 with SMTP id ffacd0b85a97d-4515d3dc1f3mr33259120f8f.30.1778449825998;
        Sun, 10 May 2026 14:50:25 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.203])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548e6a68ebsm19207317f8f.1.2026.05.10.14.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 14:50:25 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Mon, 11 May 2026 00:49:53 +0300
Subject: [PATCH RFC v2 4/4] clk: zte: Introduce a driver for zx297520v3 LSP
 clocks and resets.
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260511-zx29clk-v2-4-29f0edc300f5@gmail.com>
References: <20260511-zx29clk-v2-0-29f0edc300f5@gmail.com>
In-Reply-To: <20260511-zx29clk-v2-0-29f0edc300f5@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7174;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=BPZww5hE1dLIIGa/RUA+R8wjr/jhPw5RMGELLQxayFk=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqAP2S2Rkd/NDg1wBapyhyI91AEC44X3F8pcuNa
 BHP6T5bWZ+JAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCagD9khsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiIF0Q/+JU7tsyNxlCC3kfGboXXsID8jVZxTuVO
 IuWVRDtADsv8/RSwhKAWmzj2KEbZBsZ2w4Y98RIzyBfxWSmlMcE+uvjMNIHDoCXgRyLjYsFy+XK
 7/J5UzoX0ycpmSTO6SpxH6t4rc/dpVAUQRvCJSwpukl0yMlYnROVidbi7wTLMLoeNd+S59bHkpP
 YdPqtY39I594m+bDnW6Tuv4MnVcx4uAdakJXJttRvJ+tEqgTl0QXvn/m5aF/Cp9nH9icbVIZRDX
 c80JE5wcwc0wJ/9R9Dw36TjRKbZ8nRoC2LLHb0xNP5yYJARrca9eoddPk1pXoA05ka3osnf+aGF
 ZtW+UeinLpyrhj3CDtiUZWRuSkUFFTCgXNpuWCMjBT6zx/Flukm+57wWcYCXw1t/x0CHqleX3rc
 gdgDDzXfvj3X1EPqDlKyF8oWj43sxcsWFqo9XhXCNmnm0USOSAtldU1G4TcUi85j2POixQFINmZ
 htKGndEmgdXAimweY+benZXcgVjwBxS7ta1LtsVa/LPBerr5UJWvagjhs8qRFNqpTZmaXncsrdH
 YFIvRb1fyU38Em9hkJ8SPLd8rp86SVZm+7DHVw7q7xglivlrZP7QlnJcVQg/N1vd9HcQnrTnTqj
 B9X0CxWdOiaU+F5tjtV1anVYv+LA+ikG2wVnVTsxg5RSp0SoDLJ0=
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
index d4b683cb6354..05b02c8f266b 100644
--- a/drivers/clk/zte/clk-zx297520v3.c
+++ b/drivers/clk/zte/clk-zx297520v3.c
@@ -791,6 +791,189 @@ static struct platform_driver clk_zx297520v3_matrixclk = {
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
+	static const char * const parent_names[] = { "mpll_d5", "mpll_d4", "mpll_d6", "mpll_d8",
+						     "mpll_d12", "osc26m", "osc32k", "pclk" };
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

