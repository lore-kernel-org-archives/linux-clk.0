Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1725E42E00D
	for <linux-clk@vger.kernel.org>; Fri, 17 Jul 2026 15:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784301926; cv=none; b=iVaWUlPfqsGtuRGU0M7Hw0TL9K/ewP0D2F3BWPst8wC0Gc86Sjg9XqX4V7COwtL2BCXMxxHLNZ0Ia/rplw8IxxBR0vqbN8fIiMCPsvcm3ZAmevNXwkuFakEggi4V381ymHhZbemWCCD3DTRvVu8oThMqzWkKFQzpIJO2Jm3gIfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784301926; c=relaxed/simple;
	bh=ZxtEY0Po9koFr9SK/FxQWL9lGl95syc2R11eiKw1uuc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=usOtLSXNZFSKHsomKW3X0tpBvCWjXs7xYOT7SQ+HDUrlJxuJtD9xyYZ/Zmo6M72XUMkHJdHFD7m1d7W9HsRO9rw4gGBp9JFyn+oXoEJdrMQQ/y6Bu5rX9z0Ono+3vzaKWFxxgfB0NB5/zrR5OLIu8uQGgoSmu0bypIUzf8ievO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=l8euRs2j; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="l8euRs2j"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47d6c634f45so4521621f8f.3
        for <linux-clk@vger.kernel.org>; Fri, 17 Jul 2026 08:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784301917; x=1784906717; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hhejqqk/YejfwiP6Ga/bYKh4OsY78ne2Bp/UpWOM4CI=;
        b=l8euRs2jivY/jDXbwNz559W1BhOxWQKDQCXokfL5KZmhDr2kvcvFRrF/dNN8r/xYPM
         lwPLLlqoidAf0p87o4nlEy1d4sF9eN00coEbinR2dSExPMqKFHJwg9d1Edx8vv4uuAyE
         2COHWwZpntkulL6SHVSSdpJIh8kqtS/LlWM8hkuKGe5pTTXY58MjeLhoNElmArsOsPNz
         YXX24ewp16FfH6IKoEvLS5FFU1WPR+kZZIvq4mFEM3WhyPkl7+pnCmAudiI6HQzaMepf
         9dyEysbuVEdMtxEJ5eC3cWbJ9+0hwzshiOHsorAVu2EvR1fLn7Qccz/Wc/X/lTuv5taM
         DyWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784301917; x=1784906717;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hhejqqk/YejfwiP6Ga/bYKh4OsY78ne2Bp/UpWOM4CI=;
        b=C0Con7BliunlsDrKzPdQ2ChjsmDXFGAPvw8Do+A7YQozG/LuY5opZoAO9+aQdmcaO7
         eVpuV5CRQgM5jkzet58DmYW+uEGyZC8wxpSrKKYCwsom6ky0QZmNq/BW3JZiFYKoKSL7
         2nhIPb+/eHK1PimPnjoXfVaXeFGmnbBf+jL6tpE6iYXGlPvXY4qoI/uwnsO2LP0Tk+KA
         XxhPQKj2w8b2cGmwiMleivXIRLZVI0CZXxOwNK9C5G/4OSDoSsl/fA+RKvtEplZTIeYe
         JR+ug4v+OVs7kpsragmwVVFcXu9weU+FMSTk8GsaWkXiB4D7NcglTRCWv7ij9X4QT4cJ
         SrdA==
X-Forwarded-Encrypted: i=1; AHgh+RqTF2efZZZaG2y/2D2RHIaA43ZSFHTIRv6a1hsSLvjksBPzcWybEhzeKhcwlwCspW+cUCmk+EJn7IA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1LCD/wjE9nUwsUvsAzcNz486GWND7d2wThEy7M2OGTDQ6BOK2
	J4YcGIE9eeHxXbSgC/Sy/f94LqpYHex6er47JZkKC+OkdMxDi60+iEQy5IRvgd5CLVnPbKlJehX
	p4p6N
X-Gm-Gg: AfdE7cnLjDdJT32Ap2Ju2W6x1mX2RLFsA767CntEX4k2FpGqqsr16Sn+13AigMzwgz/
	ouaoVxgpyE79WfneVy5p+/XYlAfoQ7W11ay90VIVgyo4c4jj77SIMkpR4Ajt507BP9edpKIT7aW
	g7F9AlTE1Si+qbe+UnM7vxBMVYuY1eS4sX9spq642vFhMeFau9FKljnDKlekKaiHIVGAggA3wFm
	EZtWddP12Bq7QRStpNlM33LVWhdaTUqRI2F8gA3QSqWgC7AcAJy3co4TpQRfYSQSB6gCkft7tFf
	pPKVk4g/Snq0ajhaBYSk+OlJ8ttdnYelwspNoDt/sFePcW6IVF2n/LS8YROZ/YA6wnA1dGB6RIy
	khOj/KNkCU6Aq9POHeSzh9tbnUZvsL68N2nWKtgWacw9+gxgYdjbQVbA7B1kArOm8ijC0YyW7Z7
	w3
X-Received: by 2002:a5d:588d:0:b0:478:1a24:912d with SMTP id ffacd0b85a97d-47f6233d29fmr4655239f8f.57.1784301917524;
        Fri, 17 Jul 2026 08:25:17 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:8e22:8a15:f33f:dc60])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f63e65644sm4211074f8f.16.2026.07.17.08.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 08:25:16 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 17 Jul 2026 17:24:54 +0200
Subject: [PATCH v5 4/4] clk: sunxi-ng: sun6i-rtc: add a733 support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-a733-rtc-v5-4-3874cc26abf7@baylibre.com>
References: <20260717-a733-rtc-v5-0-3874cc26abf7@baylibre.com>
In-Reply-To: <20260717-a733-rtc-v5-0-3874cc26abf7@baylibre.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6141; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=ZxtEY0Po9koFr9SK/FxQWL9lGl95syc2R11eiKw1uuc=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqWklPYwYKyBd3CWGNFpqn23Bc7xuBlJIXjflvZ
 24rfeAeKe6JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCalpJTwAKCRDm/A8cN/La
 hSo8D/9xWGGY9LduPCVJf9vAXrffcvr112BqVG32PNVM3ZPUe5YFuym+2ounbNhggeMbn4430J7
 H3PrWERDgUypq91xeuRG10p3Pjixg7eudX9T1WtCuOFP+9f+4rSXQ3Fo1jP4hUXOXzn5ejskxbo
 e64YLBQU6HkFCGMpFoJz/Uq/0XCpLgHIpyBKGOk5mNA/7j3xnWRJEbBvS8op0eWxRqGoY16r2Xe
 u5X3PASiKN+EyUwPCu8QP/mcCzkDGM86U9MSY39YYdY7zmXvc2yvQpZfZCUv/raVorhNPEyO0Dt
 QuMoPAyXVkDF3ugO5DNbZjHJ95Mu6GxR02RKwbCAHxiYEluh8FyENX6ilRPjhHG3QkMvyIfPoca
 NXEv4Ux4WOcZKsF5Xba541HHJU5Z/KGNuJxXr8lKMPgCICkdzk4xQvxvday4VzUgTeBUAeU/vhg
 l/dt0giaCDfVz606oy/zsem00a+NvCOQdcMh7FIjUA1wdqp/Jk1LPlPJt+GgGGZY641PVY3Q3/Y
 3VW7jIvd7wIEjr35JGieN2kuij0FgBdBlbf2q6B3TQ++KtlpXKdFACv5iT4ZCSPWDMszWKplci+
 edy8plNwJe4VN+q99eza06QDTpPot4etr/I37u4GZrgqwahUUiSD8UNOJmrvRoZt59zLIAgiw8A
 jMrXPitf3To3d5g==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Add support for the sun60i a733 CCU RTC.

Compared to the a523, this SoC has a different input oscillator divider
which auto-detects the oscillator rate and select a divider to provide
a fixed 32768Hz clock. It also provides several phy reference clocks
with dedicated clock gates.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.c | 77 ++++++++++++++++++++++++++++++++++--
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.h |  2 +-
 2 files changed, 75 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
index 25dd87e78eb7..98ae10307f43 100644
--- a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
+++ b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
@@ -44,9 +44,15 @@
 #define DCXO_CTRL_REG			0x160
 #define DCXO_CTRL_CLK16M_RC_EN		BIT(0)
 
+#define DCXO_GATING_REG			0x16c
+
+#define CLK_NUMBER_NO_GATES		(CLK_OSC24M_32K_DIV + 1)
+
 struct sun6i_rtc_match_data {
 	bool				have_ext_osc32k		: 1;
 	bool				have_iosc_calibration	: 1;
+	bool				have_dcxo_status	: 1;
+	bool				have_phy_ref_gates	: 1;
 	bool				rtc_32k_single_parent	: 1;
 	const struct clk_parent_data	*osc32k_fanout_parents;
 	u8				osc32k_fanout_nparents;
@@ -213,7 +219,12 @@ static struct ccu_mux osc32k_clk = {
 	},
 };
 
-/* This falls back to the global name for fwnodes without a named reference. */
+/*
+ * This falls back to the global name for fwnodes without a named reference.
+ * NOTE: osc24M name might be misleading the oscillator could also be a 26MHz
+ * or a 19.2MHz one starting with the a733. The original name is kept anyway
+ * in case anything is relying on it.
+ */
 static const struct clk_parent_data osc24M[] = {
 	{ .fw_name = "hosc", .name = "osc24M" }
 };
@@ -227,8 +238,30 @@ static struct clk_fixed_factor osc24M_32k_div_clk = {
 					    0),
 };
 
-static SUNXI_CCU_GATE_HW(osc24M_32k_clk, "osc24M-32k", &osc24M_32k_div_clk.hw,
-			 LOSC_OUT_GATING_REG, BIT(16), 0);
+static struct clk_div_table osc24M_32k_div_a733_table[] = {
+	{ .val = 0, .div = 732 },
+	{ .val = 1, .div = 586 },
+	{ .val = 2, .div = 793 },
+	{ .val = 3, .div = 732 },
+	{ /* Sentinel */ },
+};
+
+static struct ccu_div osc24M_32k_div_a733_clk = {
+	.enable = BIT(1),
+	.div	= _SUNXI_CCU_DIV_TABLE_FLAGS(14, 2,
+					     osc24M_32k_div_a733_table,
+					     CLK_DIVIDER_READ_ONLY),
+	.common	= {
+		.reg		= DCXO_CTRL_REG,
+		.hw.init	= CLK_HW_INIT_PARENTS_DATA("osc24M-32k-div",
+							   osc24M,
+							   &ccu_rodiv_ops,
+							   0),
+	},
+};
+
+static SUNXI_CCU_GATE(osc24M_32k_clk, "osc24M-32k", "osc24M-32k-div",
+		      LOSC_OUT_GATING_REG, BIT(16), 0);
 
 static const struct clk_hw *rtc_32k_parents[] = {
 	&osc32k_clk.common.hw,
@@ -267,6 +300,15 @@ static struct ccu_mux osc32k_fanout_clk = {
 	},
 };
 
+static SUNXI_CCU_GATE_FW(hosc_serdes1_clk, "hosc-serdes1", "hosc",
+		      DCXO_GATING_REG, BIT(5), 0);
+static SUNXI_CCU_GATE_FW(hosc_serdes0_clk, "hosc-serdes0", "hosc",
+		      DCXO_GATING_REG, BIT(4), 0);
+static SUNXI_CCU_GATE_FW(hosc_hdmi_clk, "hosc-hdmi", "hosc",
+		      DCXO_GATING_REG, BIT(1), 0);
+static SUNXI_CCU_GATE_FW(hosc_ufs_clk, "hosc-ufs", "hosc",
+		      DCXO_GATING_REG, BIT(0), 0);
+
 static struct ccu_common *sun6i_rtc_ccu_clks[] = {
 	&iosc_clk,
 	&iosc_32k_clk,
@@ -275,6 +317,11 @@ static struct ccu_common *sun6i_rtc_ccu_clks[] = {
 	&osc24M_32k_clk.common,
 	&rtc_32k_clk.common,
 	&osc32k_fanout_clk.common,
+	&osc24M_32k_div_a733_clk.common,
+	&hosc_serdes1_clk.common,
+	&hosc_serdes0_clk.common,
+	&hosc_hdmi_clk.common,
+	&hosc_ufs_clk.common,
 };
 
 static struct clk_hw_onecell_data sun6i_rtc_ccu_hw_clks = {
@@ -288,6 +335,10 @@ static struct clk_hw_onecell_data sun6i_rtc_ccu_hw_clks = {
 		[CLK_OSC24M_32K]	= &osc24M_32k_clk.common.hw,
 		[CLK_RTC_32K]		= &rtc_32k_clk.common.hw,
 		[CLK_OSC24M_32K_DIV]	= &osc24M_32k_div_clk.hw,
+		[CLK_HOSC_UFS]		= &hosc_ufs_clk.common.hw,
+		[CLK_HOSC_HDMI]		= &hosc_hdmi_clk.common.hw,
+		[CLK_HOSC_SERDES0]	= &hosc_serdes0_clk.common.hw,
+		[CLK_HOSC_SERDES1]	= &hosc_serdes1_clk.common.hw,
 	},
 };
 
@@ -330,6 +381,15 @@ static const struct sun6i_rtc_match_data sun55i_a523_rtc_ccu_data = {
 	.osc32k_fanout_nparents	= ARRAY_SIZE(sun50i_r329_osc32k_fanout_parents),
 };
 
+static const struct sun6i_rtc_match_data sun60i_a733_rtc_ccu_data = {
+	.have_ext_osc32k	= true,
+	.have_iosc_calibration	= true,
+	.have_dcxo_status	= true,
+	.have_phy_ref_gates	= true,
+	.osc32k_fanout_parents	= sun50i_r329_osc32k_fanout_parents,
+	.osc32k_fanout_nparents	= ARRAY_SIZE(sun50i_r329_osc32k_fanout_parents),
+};
+
 static const struct of_device_id sun6i_rtc_ccu_match[] = {
 	{
 		.compatible	= "allwinner,sun50i-h616-rtc",
@@ -343,6 +403,10 @@ static const struct of_device_id sun6i_rtc_ccu_match[] = {
 		.compatible	= "allwinner,sun55i-a523-rtc",
 		.data		= &sun55i_a523_rtc_ccu_data,
 	},
+	{
+		.compatible	= "allwinner,sun60i-a733-rtc",
+		.data		= &sun60i_a733_rtc_ccu_data,
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, sun6i_rtc_ccu_match);
@@ -375,6 +439,13 @@ int sun6i_rtc_ccu_probe(struct device *dev, void __iomem *reg)
 	osc32k_fanout_init_data.parent_data = data->osc32k_fanout_parents;
 	osc32k_fanout_init_data.num_parents = data->osc32k_fanout_nparents;
 
+	if (data->have_dcxo_status)
+		sun6i_rtc_ccu_hw_clks.hws[CLK_OSC24M_32K_DIV] =
+			&osc24M_32k_div_a733_clk.common.hw;
+
+	if (!data->have_phy_ref_gates)
+		sun6i_rtc_ccu_hw_clks.num = CLK_NUMBER_NO_GATES;
+
 	return devm_sunxi_ccu_probe(dev, reg, &sun6i_rtc_ccu_desc);
 }
 
diff --git a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.h b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.h
index ab7b92b47f59..4f4f4cb00f1d 100644
--- a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.h
+++ b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.h
@@ -11,6 +11,6 @@
 #define CLK_RTC_32K		6
 #define CLK_OSC24M_32K_DIV	7
 
-#define CLK_NUMBER		(CLK_OSC24M_32K_DIV + 1)
+#define CLK_NUMBER		(CLK_HOSC_SERDES1 + 1)
 
 #endif /* _CCU_SUN6I_RTC_H */

-- 
2.47.3

