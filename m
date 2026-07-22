Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A260374731
	for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 14:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784731726; cv=none; b=fnTqQZJTVA5gh0iwsJbaWaDsGRpaJZDt93nPMMckHZBJfAmJYOqGfuCfx9ZpMLSN8SzmgAOt3Pqz6aftPCa75WhRE8xrDOLiz9ly+KZjJ3BJhI0pTHdWyo7AnwfTEXtSuULKIzdTW8rvGz0kHDiMiAEA/uafFhI+xuNkhAaM6cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784731726; c=relaxed/simple;
	bh=ZxtEY0Po9koFr9SK/FxQWL9lGl95syc2R11eiKw1uuc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D0we7vog8/AsIjaOJg6ewcDSIV5x3YhZ5Oo8WDGXKqdkxaNjomGoHQ4a7QBvfhsWYseDJDURU0DaJvoKs/TFA2W/8ePlTwgPkPfVOdCmP3jniTaFGDuM46IhO8UEQjKTNOBOzvME16MLZF+M8m0W2qE95VrBSvZpDOvVb9ntlX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=FPTkANFO; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="FPTkANFO"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49557167508so42510935e9.1
        for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 07:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784731721; x=1785336521; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hhejqqk/YejfwiP6Ga/bYKh4OsY78ne2Bp/UpWOM4CI=;
        b=FPTkANFOBeLiFXVc8UTV1XXUOZYkY4O2A0QNDxPAAZIfQR7kjaLfzBAqxeFSPregt0
         Np5qMw08dQBZ+mEdL7aocAvZzj54JFYocrnEe5r/uIJsklaG+j8UR7QMiKyWSP+sbB/S
         aCXLpJbPsqQh7XQRqUsgWe+EtZsXZxqzHAY0t1XOh49AX4Q6QDf+W24w+fOjm+b6+nhu
         Nx0TK71jbnIfUeBx64JYL998xhhacdeqkdrdewraNr2T4A9f5c7howrb/vbGjK0s0/Ie
         OQ+1P5piSA8C+2Ksb0QIFfzrmMwtEI5LiR0OStbA9bNo5m2/s/1Itct22EWps3hhPfPg
         A5bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784731721; x=1785336521;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hhejqqk/YejfwiP6Ga/bYKh4OsY78ne2Bp/UpWOM4CI=;
        b=hu6nDNfslFWOQRgsHu8KmUh85R+Hfb5skvMEeqHbNUpr/j3CiS2XzabVvj2RDTSTU3
         gcrgk0Z3VVt+UAoxiEuIRhEHntvCfv3G55FKg1sDgz32BQlEuN6sUtpaYC81VhSzDN+/
         kIhY3SrlXmPoyjOk1w+D6bxzO8PiRShM/dkF51WyNp8SSZuU6fXBPxrKsA/UvvTWNFOK
         57Ur5PXuQEGLvAMD0jsc3x264hYSUxEZmAgzXT2TgeXvC1BMPNSp6br7NEWsUo0/m6sw
         TfIjGXL2YYK+hFlB97qnDD/HVdySMZS3ZbMVRhlCvROFVAx0L8A0Lu2OUZdv0niaDt3T
         vCnQ==
X-Forwarded-Encrypted: i=1; AHgh+Routdv1Yr5t6mE3UjEmKCP4XOUv/lmy1fgkV5n7cEBDi8pQyl5eHtWvpyqXLC4PC/tBFnhmRI27ib0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywio+uH83NYovMEKOmSQB76IqhlCuy40da9oo+fmI4OP8P+ggeh
	KEctwy1+uxbZkZ5z3vwCC8XXNkbL+XAMxKVweZcMIZHIgWpfXM4hGrM7B+ZpFc+pTCk=
X-Gm-Gg: AR+sD12M8AYqBZ4C32mN2TUR7bLThafOWnDzuQHmiUAtDYl1/pdmKtxiRgfimxTqY2Z
	RWoYlzfLe7lpEoeo3nbN6SYETori3oxZfmWPGCavIfkiIip/PIFeCkRmi9oK1cTtK/sgKeiobft
	iyw0ZtKp2uBu3G5dZ/F2ISAi2shv4dFSU9Uy2QxmsmAbIxOS4XBUYSnZJhzdGqY1YDi+j02cWkm
	x/DBWkn9MSvnLasIKV7Po8FBrnJgoDyA08f3g7R+cdcXmmpI2R5h+y8QMoRS9tPu3+z+yFO+Bqc
	jibGSju4/th45B6drHRkoHRCisDxBVMmpymMbSR9dpWO6eOlocGcttLmVp7uryYKbGUoub+O1AX
	CvnRVTA2j1eDbFqEi9Jp5x9t57oKZFKOuazTZEJyFm7azwR3WMjev4NqnoaXMmyp4Qq1Pfx3QdL
	8L8+ZPL1epDRg=
X-Received: by 2002:a05:600c:6812:b0:495:5eca:f9b3 with SMTP id 5b1f17b1804b1-4955ecafb22mr143440495e9.26.1784731721250;
        Wed, 22 Jul 2026 07:48:41 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:a589:14b5:ba97:3626])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4956a967289sm74385765e9.11.2026.07.22.07.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 07:48:40 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 22 Jul 2026 16:48:22 +0200
Subject: [PATCH v6 4/4] clk: sunxi-ng: sun6i-rtc: add a733 support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-a733-rtc-v6-4-631cca28cc9a@baylibre.com>
References: <20260722-a733-rtc-v6-0-631cca28cc9a@baylibre.com>
In-Reply-To: <20260722-a733-rtc-v6-0-631cca28cc9a@baylibre.com>
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
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqYNg9Waoqq3MZucyId8+AceAKymJeYhrmU7zeh
 UM3CcGJcruJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCamDYPQAKCRDm/A8cN/La
 hdXlD/4vKyXXdx7/8DZD/I9kaq/bXldqR1mvVfp2cVuODKb5kp6rUP+iGMydJY02oSkCtZ0TCzR
 IexfQP9NvFfsSX4jAHij7HCz6EvwMpjEp4aZU8qgfEv3EDrHgwS3ZxQZLKNd1TQvg4Dl6LCtC+R
 ISb2VLG9rOlHeIsWKbztvAm6s9AX2vPSmGjqk0hAqOi9918vSYEwS7XaXRp+i6KuHoHUwwyUscD
 dKdapZ4DKGJd44UCXdeye3ofL2zS+pzWoFn70xXpRuqmpDqpF/5wlB/qMFp8kLNSTMQ51RNa68n
 IAqSF84X0bxNafRprdjF6scSibQmhYDpOCTEL5NU+fGy7ZTzLXOM1zDQh07ML8eHUpeJHZju824
 uLIcmnjvvg3jd53mKyRqJ9QyqWPGj1KSutZyrAeazTYBl/ypfz2FfoyTt2x7FQiwXyYYqW2SS2n
 sCTqusUmjRby13s6/Y0pKVu0EnLis3KyYuQxFsUMmY76PHxSbJIWnV4YMtGEAvX2pLeWrTSEZU9
 QmwPYoRP9r8u+jGZyOLzQSWP9Fc59nsc9U4dgIlIy4alSQ4zFNACCmZVZka6DuIy+/3+17dwPD6
 jBCxzFi/7xyaH1ZvT+iz5HS7hZLgcgvw7if5KmS4qwopsQmUZ+sfu9Biaj595FVP8AjMKKyk/nV
 kF4eMhJhI0Z1DUw==
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

