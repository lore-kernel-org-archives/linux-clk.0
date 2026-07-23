Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32F14322E5
	for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 09:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784799617; cv=none; b=ox2AKs7qsNeblBfJhWRydGZaP3N41OaNovaILSCUq3Fa01BThQW79c3Lp1qFSDIw6sng8VYCtsiEnkQZZVdZ4GiFiHC/W9S8Es0FbIBhkhm8zHXPK0FT32mlOKTbvSMEYAq9pmDYryjBzhhS4agFVv3eM84o5M4vNe09/m8D3Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784799617; c=relaxed/simple;
	bh=ZxtEY0Po9koFr9SK/FxQWL9lGl95syc2R11eiKw1uuc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UkxSRUrcDkh1mwIv3jSqUi0gxF1AmghpbNucD6p5CBuljwOU1aEY8d7bDrH/eqNot8VuhZFjW42TBD3fFweWu290biaKwiBU7ez03dgl6z+QMe/ZzvFX4tn8e4zhEbkbJc9dmRDNUvD1DEWYH1wEj69HS0kM3wMTkaFwDPZJwb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=CA+j/qPY; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="CA+j/qPY"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4954dff6536so3565035e9.0
        for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 02:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784799613; x=1785404413; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hhejqqk/YejfwiP6Ga/bYKh4OsY78ne2Bp/UpWOM4CI=;
        b=CA+j/qPYPAvnuEKso71/zs8nPLcbJTPWrAp9pxgjuf8Y9Bj2XOVFRad1ELsUBLz1mW
         CE6aE3UvZNCSuWW4Hi87hNiSgx4lytPxc5DtNx+btAAo6h+dxnxCS0RRVSSk5rb1Zv4t
         38+ISRCaKWqDM6iyQiduUfKaMBtCN1DAfPHc3TdyJAXQQgAWovfYwVwGxddapT8htZQH
         Zt9ATXvdVlnCw/l+vnVcwxtOKuFxBM1T8X6E84O1iLlAvg92dEgOEM5GfVyws3kIK56r
         LLmEtN7Nlx4TKer74RKDJu9WOvGXum07z9vjINmjcTSo46DKQSfPqfqT+yZSmFCHBDHb
         iMsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784799613; x=1785404413;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hhejqqk/YejfwiP6Ga/bYKh4OsY78ne2Bp/UpWOM4CI=;
        b=hFIbIN39oh1HVRyWZlUuM66PfRD8Av+jJ8Yg37uGSdz9ADJJT7aVuanQ1cnhdVg33i
         KzHzF8Wq3e45NYkylBaSq66lngJcnPrAdk4FsyqlRWee1J256pOCVtkrAwB9+VWPL24J
         v8YaLEvcEhLEQxK4+7SOtfddLvDrdO8hPVbQjkB6rnQGPOV2GTA6xLerfeZCIhc1v1Hc
         y1fQEOD4FrznrN/yCltCmV346E83iTXe9lrn/2bXcU11VmVL8/5zOXGWyPq8pJLWodLT
         X1sXl92ePBHOlB517uiCiR3b1TpKl8N0L1zEpfVW3kgJyBvMZbL6vil6UUkme6claSa2
         X8WA==
X-Forwarded-Encrypted: i=1; AHgh+Rpe1Yp++tNR+gGMYd+pCVi42MSX6XnavG746O7POlkc/JcTmp75seFXVnwwe0vkOTfhiEfv03ZqtMs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZwMR4lGioPtAexqKoXXMAquTfDzaPK6N2WGxKoXkJ95zXkeXZ
	QXz6hf1WDTBgqV1FTJ33Wza27OH2ReHrlR4hI3QmcWkLhtw5KNTc8fIVAPtOX+pru4g=
X-Gm-Gg: AR+sD12l2zG6Ij+C04LyqbEi0NOTFzp/LD5HXtq8agrAYUjUw9jHTGit40vwDcLNp+m
	wjWBrvAvpCRuCvCegXHRPjZlvPeLGczg9QjNR1i45jsezZ53urdVZIeoRazZ7UrmSM+vrS3YALT
	AU5AVHJrhXKZo9zEG2uVs4sF+bdgjhxaPru63z8uUNbrKVxfQyIvMpGiCPjo9VTdMAjxfawGIj3
	iCRBsNycizfKSo/P34kHHDtLRXIjTZmMaSad1nS5GIIsy/5ikkOWwCqLbmgC6htGBuCMpsqWdoL
	t3OZuJKexJrGpzcvUsyxzQKB0zvkd6/gNs9RlGdObm62ERQuSxrfjN3XGAJfFDYh3rLnHnHSFdD
	tgZBTj5s167XQ3TG/Gz/Xk/MjAsF7mqPUJK1W1REBcbzGkNbIzuUObfuImxo+KZJNMHiWZsSCe7
	Ha
X-Received: by 2002:a05:600c:1d21:b0:495:4856:2659 with SMTP id 5b1f17b1804b1-49573cca1b0mr23638405e9.9.1784799612784;
        Thu, 23 Jul 2026 02:40:12 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:3274:dbb5:2710:802b])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4956a4f24bcsm158047615e9.1.2026.07.23.02.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 02:40:12 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 23 Jul 2026 11:39:54 +0200
Subject: [PATCH v7 4/4] clk: sunxi-ng: sun6i-rtc: add a733 support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-a733-rtc-v7-4-8fd68aab94ae@baylibre.com>
References: <20260723-a733-rtc-v7-0-8fd68aab94ae@baylibre.com>
In-Reply-To: <20260723-a733-rtc-v7-0-8fd68aab94ae@baylibre.com>
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
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqYeFwGSqTbtJvNIzd3HhhthCSgN4NGzqOMzbJW
 M0apMB3fCqJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCamHhcAAKCRDm/A8cN/La
 heDsD/9HQP7iuGP55hZHz1ZpmKRUvcOZL8sxSbG9MoY3tekyiDTBSVmcTb+vP1YcQdXgUQZsQVY
 fM6OrCU77nlndH8ofR47fnV5/C543J+IdjjW6bsP76vbXwpTV74y5XwUQ0ahZunbh5/iC+HEjDE
 8Vlzl8WrGplwwHqCddqPkexkem7abHcS3UFX3gGk7KograpfM5FqiQAiLq70WtwmlN2rpEUuapQ
 9HFV3vfZ9EebUD2kBQhJHjEDHktPjRebn/VGQ6/FfcgGphj4Rw5ZuVhcN/HThFMeN2ZYy0mu+oi
 p2oBldMsOxnUgp5CZLR5FvLXnWUOcuJvIPUzPXEzGuDpdiwxsF9SGzI62Zvk0TpfYEhABEdrp9S
 TMCYLVbMx0C9Oag9btZttNmQFTQHAS5F0GS8uDqujicn1OHh6vHdxQdaX8jeVgcqbI7kPAVI9tT
 rCpQ2zbBzAWgzzsfNNPfHJ1dlc+oSuYOY7PqInxPDG2wimTuVRAPBz37AUxqCYe46GFMrg7z7/K
 m3Urf44Je/jLHIAYLM06zMMO3dLztHfvbgn7rcmx3HkU3Zx189x8REkplZNzHzv8tXQmON3f3T1
 VCkLjeoCWaCtzmO7Pxv1OInghaBnUq0u/ZUtQ1WvW2/EY9Me0dIHkY4QnVizMH8e9r9gKfBNqNI
 O09Nwa1TS7JZMLA==
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

