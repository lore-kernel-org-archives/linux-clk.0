Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1711ACEDF;
	Fri, 10 Jan 2025 11:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736509669; cv=none; b=bRbn8lFlsrj+S+b/DrPhYnpSKV7DG2PBXBIYjzueEn1Wcqk/TYqjEanDreecKdF05A46yO6S7+OFJhlH5uies64Z2tLuXLevXxGK9bVJ+SYuhZqKJGwfOBsV38RLD+XffubPt0R9WP9Pjs8+PEsQL5WWfUjBGahb2Hzbv8QCI6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736509669; c=relaxed/simple;
	bh=+bBN7X5DoKL/XSHDmvrzqb3BA5dGzZ/fj7/IKqsTMjY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GZEOphCqomLT5uxFj1crtyUCLWQdgTXm2JJhDbnKEFRhSfk3LksPNd97iGPJtmBQBMyGntnsFKQ4ZJRMevF29G/grPC9HrahkTztBvSwhiNbId7duy3wzdbZUNneDO6j+KMtbhjtk6pg8RI87FkqrnSGzwJYDmHN8J9XSiu+65Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iqF/c125; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iqF/c125"
Received: by smtp.kernel.org (Postfix) with ESMTPS id F2423C4CEDF;
	Fri, 10 Jan 2025 11:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736509669;
	bh=+bBN7X5DoKL/XSHDmvrzqb3BA5dGzZ/fj7/IKqsTMjY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=iqF/c125JideKK2SjA3m8LpVhBYNBpUbZcmLoqSzRhNp3OKPBTuHX44dbcraWNB33
	 3mT8/wj+Dwr7F14pWce9F2MkpnMbTeTTFa+pxjdYTdlrVOWsmSFDwx0FnNE/p+7t/H
	 HBh4nNyVh43v9/NOsus5TEtBJ96NRsvZia4Vgb1c9W1QTg02xq5Vevg2Pv2Y8FY5ex
	 G9gNHGmhbicV/bUXvQ/bnbQSNsF64rAL0fBW/Wa1RSx+c7fXsP9aCUWgVBVqOYpfLS
	 VmNy6l0Q2hr8FugV3R7z6o5I+W2/4EAzRuaKO1xCg/NYZH1sMkb2C6bqdFsEHEbCSV
	 vB75dyDy4WHKg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E442AE7719E;
	Fri, 10 Jan 2025 11:47:48 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Fri, 10 Jan 2025 19:47:11 +0800
Subject: [PATCH 2/2] clk: amlogic: c3: Limit the rate boundaries of clk_hw
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-limit-rate-range-of-clk-v1-2-dd618adc4aa8@amlogic.com>
References: <20250110-limit-rate-range-of-clk-v1-0-dd618adc4aa8@amlogic.com>
In-Reply-To: <20250110-limit-rate-range-of-clk-v1-0-dd618adc4aa8@amlogic.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736509666; l=5184;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=8XGEQBOCJSgFZ2f2fpSkVtYBK8fi63dUXKYPxwN2M48=;
 b=1XANFRx0lswzvvpEbiIPFHJx220g4DleCItzkvN2v4pK958nuDuGFr6S5LbRx/TDf3QBtEYA9
 dPCCRpv3EIxAvHymsuRLB4hc03O5pFj7q2xOLSPKf653xN1WxT4rHgr
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
Reply-To: chuan.liu@amlogic.com

From: Chuan Liu <chuan.liu@amlogic.com>

The PLL can only stably lock within a limited frequency range.

Due to timing constraints, the maximum frequency of the peripheral clock
cannot exceed the design specifications.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 drivers/clk/meson/c3-peripherals.c | 21 +++++++++++++++++++++
 drivers/clk/meson/c3-pll.c         |  4 ++++
 2 files changed, 25 insertions(+)

diff --git a/drivers/clk/meson/c3-peripherals.c b/drivers/clk/meson/c3-peripherals.c
index 7dcbf4ebee07..9f0a3990f0d6 100644
--- a/drivers/clk/meson/c3-peripherals.c
+++ b/drivers/clk/meson/c3-peripherals.c
@@ -568,6 +568,7 @@ static const struct clk_parent_data pwm_parent_data[] = {
 		.ops = &clk_regmap_gate_ops,			\
 		.parent_names = (const char *[]) { #_name "_div" },\
 		.num_parents = 1,				\
+		.max_rate = 200000000,				\
 		.flags = CLK_SET_RATE_PARENT,			\
 	},							\
 }
@@ -724,6 +725,7 @@ static struct clk_regmap spicc_a = {
 			&spicc_a_div.hw
 		},
 		.num_parents = 1,
+		.max_rate = 500000000,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -771,6 +773,7 @@ static struct clk_regmap spicc_b = {
 			&spicc_b_div.hw
 		},
 		.num_parents = 1,
+		.max_rate = 500000000,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -829,6 +832,7 @@ static struct clk_regmap spifc = {
 			&spifc_div.hw
 		},
 		.num_parents = 1,
+		.max_rate = 167000000,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -887,6 +891,7 @@ static struct clk_regmap sd_emmc_a = {
 			&sd_emmc_a_div.hw
 		},
 		.num_parents = 1,
+		.max_rate = 250000000,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -934,6 +939,7 @@ static struct clk_regmap sd_emmc_b = {
 			&sd_emmc_b_div.hw
 		},
 		.num_parents = 1,
+		.max_rate = 250000000,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -981,6 +987,7 @@ static struct clk_regmap sd_emmc_c = {
 			&sd_emmc_c_div.hw
 		},
 		.num_parents = 1,
+		.max_rate = 1200000000,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -1074,6 +1081,7 @@ static struct clk_regmap eth_rmii = {
 			&eth_rmii_div.hw
 		},
 		.num_parents = 1,
+		.max_rate = 50000000,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -1132,6 +1140,7 @@ static struct clk_regmap mipi_dsi_meas = {
 			&mipi_dsi_meas_div.hw
 		},
 		.num_parents = 1,
+		.max_rate = 200000000,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -1190,6 +1199,7 @@ static struct clk_regmap dsi_phy = {
 			&dsi_phy_div.hw
 		},
 		.num_parents = 1,
+		.max_rate = 1500000000,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -1248,6 +1258,7 @@ static struct clk_regmap vout_mclk = {
 			&vout_mclk_div.hw
 		},
 		.num_parents = 1,
+		.max_rate = 334000000,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -1306,6 +1317,7 @@ static struct clk_regmap vout_enc = {
 			&vout_enc_div.hw
 		},
 		.num_parents = 1,
+		.max_rate = 200000000,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -1431,6 +1443,7 @@ static struct clk_regmap hcodec = {
 		.ops = &clk_regmap_mux_ops,
 		.parent_data = hcodec_parent_data,
 		.num_parents = ARRAY_SIZE(hcodec_parent_data),
+		.max_rate = 667000000,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -1489,6 +1502,7 @@ static struct clk_regmap vc9000e_aclk = {
 			&vc9000e_aclk_div.hw
 		},
 		.num_parents = 1,
+		.max_rate = 667000000,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -1536,6 +1550,7 @@ static struct clk_regmap vc9000e_core = {
 			&vc9000e_core_div.hw
 		},
 		.num_parents = 1,
+		.max_rate = 400000000,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -1594,6 +1609,7 @@ static struct clk_regmap csi_phy0 = {
 			&csi_phy0_div.hw
 		},
 		.num_parents = 1,
+		.max_rate = 200000000,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -1652,6 +1668,7 @@ static struct clk_regmap dewarpa = {
 			&dewarpa_div.hw
 		},
 		.num_parents = 1,
+		.max_rate = 800000000,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -1710,6 +1727,7 @@ static struct clk_regmap isp0 = {
 			&isp0_div.hw
 		},
 		.num_parents = 1,
+		.max_rate = 400000000,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -1768,6 +1786,7 @@ static struct clk_regmap nna_core = {
 			&nna_core_div.hw
 		},
 		.num_parents = 1,
+		.max_rate = 800000000,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -1826,6 +1845,7 @@ static struct clk_regmap ge2d = {
 			&ge2d_div.hw
 		},
 		.num_parents = 1,
+		.max_rate = 667000000,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -1884,6 +1904,7 @@ static struct clk_regmap vapb = {
 			&vapb_div.hw
 		},
 		.num_parents = 1,
+		.max_rate = 400000000,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
diff --git a/drivers/clk/meson/c3-pll.c b/drivers/clk/meson/c3-pll.c
index 35fda31a19e2..d80d6ee2409d 100644
--- a/drivers/clk/meson/c3-pll.c
+++ b/drivers/clk/meson/c3-pll.c
@@ -286,6 +286,8 @@ static struct clk_regmap gp0_pll_dco = {
 			.fw_name = "top",
 		},
 		.num_parents = 1,
+		.min_rate = 3000000000,
+		.max_rate = 6000000000,
 	},
 };
 
@@ -370,6 +372,8 @@ static struct clk_regmap hifi_pll_dco = {
 			.fw_name = "top",
 		},
 		.num_parents = 1,
+		.min_rate = 3000000000,
+		.max_rate = 6000000000,
 	},
 };
 

-- 
2.42.0


