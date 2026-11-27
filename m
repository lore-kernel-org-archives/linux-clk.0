Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=119.15.109.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795764813;
	b=bTm9/7Ac/5A4F7hzU0Za0/qcry3bkafklUqQaa9AuwpB3t+pTI2YKfQ9JZvbcxVM+OF6
	 tuMbfm5yY+ZB7HvpfBsqt4Z/fg3QPl6tUZaUhz4dN5tPwxiNM40agEmCj4rPoBKfyUU5m
	 tVGZjTEDdHWcvi5RrhoNMvONpfHklofFpO+RgDR1Xg8/YJ5dUGnPCGPg2NPZK8QuolHnA
	 phVvFyk/WM/TG9KZI+qXcjLzYF4Nzl6iLevIDxr5Um5bJoW+yAq+IBz+wlXkwiBE2eNBW
	 McFOvR87tKXD9lj7H1hsBitVzIuGwA3i2bb1/yt90PpY0DUzeCV0/YGdaq0/D6ZtUvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795764813;
	h=DMARC-Filter:Received:DKIM-Signature:X-GPT-Reason:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zTu/1ImTI4tOlv2GcAIJWCSSfk3/OTQaMLB3rak/epY=;
	b=qz7MryeZg/JmyIqYExpln68xFbtyiLOP4mmMCc43P4zvdfXOHbroBRHFh99vyKwwTfvk
	 jGMRXoZD8VOHuou24+YsYwURGAbxeP4MGOQIte+A0az47i2ozO9Z+HTcyfc7FEt1vA3zD
	 qShyLTLO9RpUAdu9IaWqp+f6aHUgCN+Qnlkm4YL5d1eLN7doNx+0zOtRSmUtIBgA9r8Nc
	 q0YMn6mJkJNMKQ7cAwxNmaRmqtR0GSt9wqq89fKwJUK3KjMf+VpxBhbfLtAzqPSePPJzE
	 WT3kz9wjY1PzfC9cVesBW6Ol5TSlgH01c1LV9TjZuRuIY3HOh6exjdwraPkec1clvpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=d-silva.org;
	spf=pass smtp.mailfrom=d-silva.org;
	dkim=pass header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=2tBC7JsP;
	arc=none smtp.remote-ip=119.15.109.137
Received: from www.nmnhosting.com (watt.d-silva.org [119.15.109.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7709606A31C;
	Fri, 27 Nov 2026 07:33:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7709606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-silva.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=2tBC7JsP
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id 7006A4C96B;
	Fri, 27 Nov 2026 18:33:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795764804;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zTu/1ImTI4tOlv2GcAIJWCSSfk3/OTQaMLB3rak/epY=;
	b=2tBC7JsP2uKXL20A/pSN8dgTXlfP5vRFcnDpk8PInhIc7/JzCd4apdsb6zeg5FRP29MEa0
	G1HBXfqi41tmnOBzZ1oZK6Whl+3+ieskYhUqf3JjECL2WJEEhzpY+mBjTdc2vZCQPT+QtU
	i4vvfP51o6f79p1BGc+YbCAgvDvXTdkZcu0YgTHAZbcjPLtdNWPjD96Jf1f9gIZPzkftBg
	HwhENE24ySpnR3Lq+lP2aUEXDtZIMvrpzIH1U+ehqbaIPiIqrRA07nVmLpS4ICssq/L1M1
	6+V2UfJavuW1w8ArFCeHA5ecvrbI0fshA/BGgb837gRqhgPPnN2J/A2PDS9vMg==
X-GPT-Reason: legitimate; the email is a technical patch notification
	that perfectly aligns with the mailbox purpose (alastair@d-silva.org),
	the sender's identity (alastair@d-silva.org) matches the From
	and Return-Path domains, and the content contains specific, non-promotional
	technical code updates (USB 3.0 PHY mode) with no presence of
	urgency, phishing links, or marketing tactics.
From: Alastair D'Silva <alastair@d-silva.org>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-usb@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alastair D'Silva <alastair@d-silva.org>
Subject: [PATCH 07/11] phy: allwinner: sun60i-combophy: Add USB 3.0 PHY mode support
Date: Fri, 27 Nov 2026 18:32:27 +1100
Message-ID: <20261127073231.1776847-8-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127073231.1776847-1-alastair@d-silva.org>
References: <20261127073231.1776847-1-alastair@d-silva.org>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add combophy0 USB 3.0 initialization, calibrate callback, and shared
syscon read-modify-write updates.

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 drivers/phy/allwinner/Kconfig               |   5 +-
 drivers/phy/allwinner/phy-sun60i-combophy.c | 573 +++++++++++++++++++-
 2 files changed, 553 insertions(+), 25 deletions(-)

diff --git a/drivers/phy/allwinner/Kconfig b/drivers/phy/allwinner/Kconfig
index f8dc4931378b..e3e8f7260ede 100644
--- a/drivers/phy/allwinner/Kconfig
+++ b/drivers/phy/allwinner/Kconfig
@@ -61,13 +61,14 @@ config PHY_SUN50I_USB3
 config PHY_SUN60I_COMBOPHY
 	tristate "Allwinner A733 SerDes ComboPHY driver"
 	depends on ARCH_SUNXI || COMPILE_TEST
-	depends on HAS_IOMEM && OF
+	depends on HAS_IOMEM && COMMON_CLK && OF
 	depends on RESET_CONTROLLER
 	select GENERIC_PHY
 	select MFD_SYSCON
 	help
 	  Enable this to support the SerDes ComboPHY controller on
-	  Allwinner A733 SoCs.
+	  Allwinner A733 SoCs. This driver configures the shared SerDes
+	  subsystem and lane routing for USB 3.0 and PCIe PHYs.
 
 config PHY_SUN60I_U2PHY
 	tristate "Allwinner A733 USB 2.0 PHY driver"
diff --git a/drivers/phy/allwinner/phy-sun60i-combophy.c b/drivers/phy/allwinner/phy-sun60i-combophy.c
index ed7a0d432ae2..4f9779171df0 100644
--- a/drivers/phy/allwinner/phy-sun60i-combophy.c
+++ b/drivers/phy/allwinner/phy-sun60i-combophy.c
@@ -7,15 +7,16 @@
 
 #include <dt-bindings/phy/phy.h>
 #include <linux/bitfield.h>
+#include <linux/bits.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/io.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
@@ -24,28 +25,74 @@
 #define SERDES_PCIE_BGR				0x0004
 #define   SERDES_PCIE_GATING			GENMASK(18, 16)
 #define   SERDES_PCIE_RST			GENMASK(3, 0)
+#define SERDES_USB3P1_BGR			0x0008
+#define   USB3P1_ONLY_UTMI_CLK_SEL		BIT(21)
+#define   USB3P1_ONLY_PIPE_CLK_SEL		BIT(20)
+#define   USB3P1_ACLK_EN			BIT(17)
+#define   USB3P1_HCLK_EN			BIT(16)
+#define   USB3P1_USB2P0_PHY_RSTN		BIT(4)
+#define   USB3P1_BGR_RST_MASK			(BIT(5) | BIT(1) | BIT(0))
 #define SERDES_DBG_CTL				0x00f0
+#define   SERDES_DISABLE_COMBO0_AUTOGATING	BIT(28)
 #define   SERDES_DISABLE_COMBO1_AUTOGATING	BIT(29)
 
+#define SERDES_COMB0_TOP			0x1000
+#define SERDES_COMB0_LINK_CTRL0			(SERDES_COMB0_TOP + 0x0000)
+#define   PHY0_TYPEC_CONN_DIR			BIT(12)
+#define   PHY0_DP_LINK_RESET_N_SOFT		BIT(8)
+#define   PHY0_PIPE_LINK_RESET_N_SOFT		BIT(4)
+#define   PHY0_RESET_N				BIT(0)
+#define SERDES_COMB0_LINK_CTRL1			(SERDES_COMB0_TOP + 0x0004)
+#define   PHY0_PMA_CMN_PLL1_REFCLK_SEL		BIT(24)
+#define   PHY0_PMA_CMN_PLL0_REFCLK_SEL		BIT(20)
+#define   PHY0_PMA_CMN_REFCLK_DIG_SEL		BIT(0)
+#define SERDES_COMB0_LINK_CTRL2			(SERDES_COMB0_TOP + 0x0008)
+#define   PHY0_IDDQ_EN_SEL			BIT(1)
+#define   PHY0_IDDQ_EN_SOFT			BIT(0)
+#define SERDES_COMB0_LINK_CTRL3			(SERDES_COMB0_TOP + 0x000c)
+#define   PHY0_PMA_XCVR_POWER_STATE_REQ_MASK	GENMASK(9, 4)
+#define   PHY0_PMA_XCVR_POWER_STATE_REQ_LN(n)	\
+	FIELD_PREP(PHY0_PMA_XCVR_POWER_STATE_REQ_MASK, (n))
+#define   PHY0_PMA_XCVR_PLLCLK_EN_LN		BIT(0)
+#define SERDES_COMB0_LINK_STUS0			(SERDES_COMB0_TOP + 0x0900)
+#define   PHY0_PMA_CMN_READY			BIT(0)
+
 #define SERDES_COMB1_TOP			0x2000
 #define SERDES_COMB1_LINK_CTRL0			(SERDES_COMB1_TOP + 0x0000)
-#define   PHY1_LINK_CFG_LN(n)			(((n) & 0x3) << 4)
+#define   PHY1_LINK_CFG_LN_MASK			GENMASK(5, 4)
+#define   PHY1_LINK_CFG_LN(n)			FIELD_PREP(PHY1_LINK_CFG_LN_MASK, (n))
 #define   PHY1_RESET_N				BIT(0)
 #define SERDES_COMB1_LINK_CTRL1			(SERDES_COMB1_TOP + 0x0004)
 #define   PHY1_EN_REFCLK			BIT(28)
 #define SERDES_COMB1_LANE0_CTRL0		(SERDES_COMB1_TOP + 0x0100)
-#define   PHY1_L00_MODE(n)			(((n) & 0x3) << 4)
+#define   PHY1_L00_MODE_MASK			GENMASK(5, 4)
+#define   PHY1_L00_MODE(n)			FIELD_PREP(PHY1_L00_MODE_MASK, (n))
 #define   PHY1_L00_RESET_N_SW			BIT(0)
 #define SERDES_COMB1_LINK_STUS0			(SERDES_COMB1_TOP + 0x0900)
 #define   PHY1_PMA_CMN_READY			BIT(0)
 
 #define SERDES_TOP_COMBO			0x6000
+#define SERDES_TOP_ISOLATION_CTRL		(SERDES_TOP_COMBO + 0x0004)
+#define   SERDES_TOP_ISO_USB3_MASK		0x0ff1
+#define SERDES_USB3P1_PIPE_CLK_MAP_CTRL		(SERDES_TOP_COMBO + 0x0100)
+#define SERDES_USB3P1_PIPE_RXD_MAP_CTRL		(SERDES_TOP_COMBO + 0x0104)
+#define   USB3P1_PIPE_MAP_MASK			GENMASK(3, 0)
+#define SERDES_TOP_PIPE_MAP			(SERDES_TOP_COMBO + 0x0c24)
+#define   SERDES_TOP_PIPE_MAP_MASK		GENMASK(15, 0)
+#define SERDES_TOP_COMBO0_SEL			(SERDES_TOP_COMBO + 0x0c40)
+#define   SERDES_TOP_COMBO0_SEL_MASK		GENMASK(3, 0)
 #define SERDES_COMB1_PIPE			(SERDES_TOP_COMBO + 0x0c44)
+#define   SERDES_COMB1_PIPE_MASK		GENMASK(3, 0)
 #define   SERDES_COMB1_PIPE_PCIE		0x1
 
+#define COMB0_PMA_CMN_CTRL			0xc008
+#define   COMB0_PMA_CMN_CTRL_RST_MASK		GENMASK(11, 8)
+
 struct sun60i_combophy;
 
 struct sun60i_combophy_cfg {
+	u32 supported_type;
+	unsigned long serdes_rate;
 	int (*init)(struct sun60i_combophy *cphy);
 	int (*exit)(struct sun60i_combophy *cphy);
 };
@@ -59,15 +106,409 @@ struct sun60i_combophy {
 	struct reset_control *reset;
 	struct regulator *supply;
 	struct phy *phy;
-	u32 type;
 	const struct sun60i_combophy_cfg *cfg;
 };
 
+enum sun60i_combophy_clk_id {
+	SUN60I_COMBOPHY_CLK_SERDES,
+	SUN60I_COMBOPHY_CLK_AHB,
+	SUN60I_COMBOPHY_CLK_MBUS,
+	SUN60I_COMBOPHY_CLK_REF,
+};
+
 static const char * const sun60i_combophy_clks[] = {
-	"serdes",
-	"ahb",
-	"mbus",
-	"ref",
+	[SUN60I_COMBOPHY_CLK_SERDES] = "serdes",
+	[SUN60I_COMBOPHY_CLK_AHB] = "ahb",
+	[SUN60I_COMBOPHY_CLK_MBUS] = "mbus",
+	[SUN60I_COMBOPHY_CLK_REF] = "ref",
+};
+
+struct sun60i_combophy_reg {
+	u16 offset;
+	u16 val;
+};
+
+/*
+ * Vendor BSP Cadence Torrent USB3 PHY tuning sequence:
+ * CMN PLL0/1 configuration, lane Tx/Rx equalization, and PMA isolation.
+ */
+/* Cadence Torrent PHY register offsets */
+#define TX_LANE(ln, reg)		(0x4000 + ((ln) << 9) + (reg))
+#define RX_LANE(ln, reg)		(0x8000 + ((ln) << 9) + (reg))
+
+#define CMN_SSM_BIAS_TMR                0x0022
+#define CMN_PLLSM0_PLLPRE_TMR           0x002a
+#define CMN_PLLSM0_PLLLOCK_TMR          0x002c
+#define CMN_PLLSM1_PLLPRE_TMR           0x0032
+#define CMN_PLLSM1_PLLLOCK_TMR          0x0034
+#define CMN_CDIAG_CDB_PWRI_OVRD         0x0041
+#define CMN_CDIAG_XCVRC_PWRI_OVRD       0x0047
+#define CMN_BGCAL_INIT_TMR              0x0064
+#define CMN_BGCAL_ITER_TMR              0x0065
+#define CMN_IBCAL_INIT_TMR              0x0074
+#define CMN_PLL0_VCOCAL_TCTRL           0x0082
+#define CMN_PLL0_VCOCAL_INIT_TMR        0x0084
+#define CMN_PLL0_VCOCAL_ITER_TMR        0x0085
+#define CMN_PLL0_VCOCAL_REFTIM_START    0x0086
+#define CMN_PLL0_VCOCAL_PLLCNT_START    0x0088
+#define CMN_PLL0_INTDIV_M0              0x0090
+#define CMN_PLL0_FRACDIVL_M0            0x0091
+#define CMN_PLL0_FRACDIVH_M0            0x0092
+#define CMN_PLL0_HIGH_THR_M0            0x0093
+#define CMN_PLL0_DSM_DIAG_M0            0x0094
+#define CMN_PLL0_SS_CTRL1_M0            0x0098
+#define CMN_PLL0_SS_CTRL2_M0            0x0099
+#define CMN_PLL0_SS_CTRL3_M0            0x009a
+#define CMN_PLL0_SS_CTRL4_M0            0x009b
+#define CMN_PLL0_LOCK_REFCNT_START      0x009c
+#define CMN_PLL0_LOCK_PLLCNT_START      0x009e
+#define CMN_PLL0_LOCK_PLLCNT_THR        0x009f
+#define CMN_PLL1_VCOCAL_TCTRL           0x00c2
+#define CMN_PLL1_VCOCAL_INIT_TMR        0x00c4
+#define CMN_PLL1_VCOCAL_ITER_TMR        0x00c5
+#define CMN_PLL1_VCOCAL_REFTIM_START    0x00c6
+#define CMN_PLL1_VCOCAL_PLLCNT_START    0x00c8
+#define CMN_PLL1_INTDIV_M0              0x00d0
+#define CMN_PLL1_FRACDIVL_M0            0x00d1
+#define CMN_PLL1_FRACDIVH_M0            0x00d2
+#define CMN_PLL1_HIGH_THR_M0            0x00d3
+#define CMN_PLL1_DSM_DIAG_M0            0x00d4
+#define CMN_PLL1_SS_CTRL1_M0            0x00d8
+#define CMN_PLL1_SS_CTRL2_M0            0x00d9
+#define CMN_PLL1_SS_CTRL3_M0            0x00da
+#define CMN_PLL1_SS_CTRL4_M0            0x00db
+#define CMN_PLL1_LOCK_REFCNT_START      0x00dc
+#define CMN_PLL1_LOCK_PLLCNT_START      0x00de
+#define CMN_PLL1_LOCK_PLLCNT_THR        0x00df
+#define CMN_TXPUCAL_TUNE                0x0103
+#define CMN_TXPUCAL_INIT_TMR            0x0104
+#define CMN_TXPUCAL_ITER_TMR            0x0105
+#define CMN_TXPDCAL_TUNE                0x010b
+#define CMN_TXPDCAL_INIT_TMR            0x010c
+#define CMN_TXPDCAL_ITER_TMR            0x010d
+#define CMN_RXCAL_INIT_TMR              0x0114
+#define CMN_RXCAL_ITER_TMR              0x0115
+#define CMN_SD_CAL_INIT_TMR             0x0124
+#define CMN_SD_CAL_ITER_TMR             0x0125
+#define CMN_SD_CAL_REFTIM_START         0x0126
+#define CMN_SD_CAL_PLLCNT_START         0x0128
+#define CMN_PDIAG_PLL0_CTRL_M0          0x01a0
+#define CMN_PDIAG_PLL0_CLK_SEL_M0       0x01a1
+#define CMN_PDIAG_PLL0_CP_PADJ_M0       0x01a4
+#define CMN_PDIAG_PLL0_CP_IADJ_M0       0x01a5
+#define CMN_PDIAG_PLL0_FILT_PADJ_M0     0x01a6
+#define CMN_PDIAG_PLL1_CTRL_M0          0x01c0
+#define CMN_PDIAG_PLL1_CLK_SEL_M0       0x01c1
+#define CMN_PDIAG_PLL1_CP_PADJ_M0       0x01c4
+#define CMN_PDIAG_PLL1_CP_IADJ_M0       0x01c5
+#define CMN_PDIAG_PLL1_FILT_PADJ_M0     0x01c6
+
+#define TX_TXCC_CTRL                    0x0040
+#define TX_TXCC_CPOST_MULT_01           0x004d
+#define XCVR_DIAG_PLLDRC_CTRL           0x00e5
+#define XCVR_DIAG_HSCLK_SEL             0x00e6
+#define XCVR_DIAG_HSCLK_DIV             0x00e7
+#define XCVR_DIAG_BIDI_CTRL             0x00ea
+#define XCVR_DIAG_PSC_OVRD              0x00eb
+#define TX_PSC_A0                       0x0100
+#define TX_PSC_A1                       0x0101
+#define TX_PSC_A2                       0x0102
+#define TX_PSC_A3                       0x0103
+#define TX_RCVDET_ST_TMR                0x0123
+
+#define RX_PSC_A0                       0x0000
+#define RX_PSC_A1                       0x0001
+#define RX_PSC_A2                       0x0002
+#define RX_PSC_A3                       0x0003
+#define RX_SDCAL0_INIT_TMR              0x0044
+#define RX_SDCAL0_ITER_TMR              0x0045
+#define RX_SDCAL1_INIT_TMR              0x004c
+#define RX_SDCAL1_ITER_TMR              0x004d
+#define RX_CDRLF_CNFG                   0x0080
+#define RX_CDRLF_CNFG3                  0x0082
+#define RX_SIGDET_HL_FILT_TMR           0x0090
+#define RX_REE_GCSM1_CTRL               0x0108
+#define RX_REE_ATTEN_THR                0x0149
+#define RX_REE_TAP1_CLIP                0x0171
+#define RX_REE_TAP2TON_CLIP             0x0172
+#define RX_REE_SMGM_CTRL1               0x0177
+#define RX_REE_SMGM_CTRL2               0x0178
+#define RX_DIAG_DFE_AMP_TUNE_2          0x01e2
+#define RX_DIAG_DFE_AMP_TUNE_3          0x01e3
+#define RX_DIAG_NQST_CTRL               0x01e5
+#define RX_DIAG_SIGDET_TUNE             0x01e8
+#define RX_DIAG_PI_RATE                 0x01f4
+#define RX_DIAG_PI_CAP                  0x01f5
+#define RX_DIAG_ACYA                    0x01ff
+
+#define PHY_PMA_ISOLATION_CTRL          0xc010
+#define PHY_PMA_ISOLATION_DATA0         0xc011
+#define PHY_PMA_ISOLATION_DATA1         0xc018
+#define PHY_PMA_ISOLATION_DATA2         0xc01a
+#define PHY_PMA_ISOLATION_DATA3         0xc01b
+#define PHY_PCS_PLL_RAW_CTRL            0xe003
+
+static const struct sun60i_combophy_reg sun60i_combophy0_usb3_regs[] = {
+	{ CMN_SSM_BIAS_TMR, 0x001a },
+	{ CMN_PLLSM0_PLLPRE_TMR, 0x0034 },
+	{ CMN_PLLSM0_PLLLOCK_TMR, 0x00da },
+	{ CMN_PLLSM1_PLLPRE_TMR, 0x0034 },
+	{ CMN_PLLSM1_PLLLOCK_TMR, 0x00da },
+	{ CMN_BGCAL_INIT_TMR, 0x0082 },
+	{ CMN_BGCAL_ITER_TMR, 0x0082 },
+	{ CMN_IBCAL_INIT_TMR, 0x001a },
+	{ CMN_TXPUCAL_INIT_TMR, 0x0020 },
+	{ CMN_TXPUCAL_ITER_TMR, 0x0007 },
+	{ CMN_TXPDCAL_INIT_TMR, 0x0020 },
+	{ CMN_TXPDCAL_ITER_TMR, 0x0007 },
+	{ CMN_RXCAL_INIT_TMR, 0x030c },
+	{ CMN_RXCAL_ITER_TMR, 0x0007 },
+	{ CMN_SD_CAL_INIT_TMR, 0x0007 },
+	{ CMN_SD_CAL_ITER_TMR, 0x0003 },
+	{ CMN_SD_CAL_REFTIM_START, 0x000f },
+	{ CMN_SD_CAL_PLLCNT_START, 0x0132 },
+	{ RX_LANE(0, RX_SDCAL0_INIT_TMR), 0x001a },
+	{ RX_LANE(1, RX_SDCAL0_INIT_TMR), 0x001a },
+	{ RX_LANE(2, RX_SDCAL0_INIT_TMR), 0x001a },
+	{ RX_LANE(3, RX_SDCAL0_INIT_TMR), 0x001a },
+	{ RX_LANE(0, RX_SDCAL0_ITER_TMR), 0x0082 },
+	{ RX_LANE(1, RX_SDCAL0_ITER_TMR), 0x0082 },
+	{ RX_LANE(2, RX_SDCAL0_ITER_TMR), 0x0082 },
+	{ RX_LANE(3, RX_SDCAL0_ITER_TMR), 0x0082 },
+	{ RX_LANE(0, RX_SDCAL1_INIT_TMR), 0x001a },
+	{ RX_LANE(1, RX_SDCAL1_INIT_TMR), 0x001a },
+	{ RX_LANE(2, RX_SDCAL1_INIT_TMR), 0x001a },
+	{ RX_LANE(3, RX_SDCAL1_INIT_TMR), 0x001a },
+	{ RX_LANE(0, RX_SDCAL1_ITER_TMR), 0x0082 },
+	{ RX_LANE(1, RX_SDCAL1_ITER_TMR), 0x0082 },
+	{ RX_LANE(2, RX_SDCAL1_ITER_TMR), 0x0082 },
+	{ RX_LANE(3, RX_SDCAL1_ITER_TMR), 0x0082 },
+	{ TX_LANE(0, TX_RCVDET_ST_TMR), 0x0a28 },
+	{ TX_LANE(1, TX_RCVDET_ST_TMR), 0x0a28 },
+	{ TX_LANE(2, TX_RCVDET_ST_TMR), 0x0a28 },
+	{ TX_LANE(3, TX_RCVDET_ST_TMR), 0x0a28 },
+	{ CMN_PDIAG_PLL0_CLK_SEL_M0, 0x8600 },
+	{ CMN_PDIAG_PLL1_CLK_SEL_M0, 0x0701 },
+	{ TX_LANE(2, XCVR_DIAG_PLLDRC_CTRL), 0x0012 },
+	{ TX_LANE(3, XCVR_DIAG_PLLDRC_CTRL), 0x0012 },
+	{ TX_LANE(0, XCVR_DIAG_HSCLK_SEL), 0x0000 },
+	{ TX_LANE(1, XCVR_DIAG_HSCLK_SEL), 0x0000 },
+	{ TX_LANE(0, XCVR_DIAG_HSCLK_DIV), 0x0001 },
+	{ TX_LANE(1, XCVR_DIAG_HSCLK_DIV), 0x0001 },
+	{ TX_LANE(0, XCVR_DIAG_PLLDRC_CTRL), 0x0012 },
+	{ TX_LANE(1, XCVR_DIAG_PLLDRC_CTRL), 0x0012 },
+	{ TX_LANE(0, XCVR_DIAG_PLLDRC_CTRL), 0x0041 },
+	{ TX_LANE(1, XCVR_DIAG_PLLDRC_CTRL), 0x0041 },
+	{ TX_LANE(2, XCVR_DIAG_HSCLK_SEL), 0x0001 },
+	{ TX_LANE(3, XCVR_DIAG_HSCLK_SEL), 0x0001 },
+	{ TX_LANE(2, XCVR_DIAG_HSCLK_DIV), 0x0001 },
+	{ TX_LANE(3, XCVR_DIAG_HSCLK_DIV), 0x0001 },
+	{ TX_LANE(2, XCVR_DIAG_PLLDRC_CTRL), 0x0019 },
+	{ TX_LANE(3, XCVR_DIAG_PLLDRC_CTRL), 0x0019 },
+	{ CMN_PLL0_DSM_DIAG_M0, 0x0004 },
+	{ CMN_PLL1_DSM_DIAG_M0, 0x0004 },
+	{ CMN_PDIAG_PLL0_CP_PADJ_M0, 0x0509 },
+	{ CMN_PDIAG_PLL1_CP_PADJ_M0, 0x0509 },
+	{ CMN_PDIAG_PLL0_CP_IADJ_M0, 0x0f00 },
+	{ CMN_PDIAG_PLL1_CP_IADJ_M0, 0x0f00 },
+	{ CMN_PDIAG_PLL0_FILT_PADJ_M0, 0x0f08 },
+	{ CMN_PDIAG_PLL1_FILT_PADJ_M0, 0x0f08 },
+	{ CMN_PLL0_INTDIV_M0, 0x0180 },
+	{ CMN_PLL1_INTDIV_M0, 0x019f },
+	{ CMN_PLL0_FRACDIVL_M0, 0x9d8a },
+	{ CMN_PLL1_FRACDIVL_M0, 0x6276 },
+	{ CMN_PLL0_FRACDIVH_M0, 0x0002 },
+	{ CMN_PLL1_FRACDIVH_M0, 0x0002 },
+	{ CMN_PLL0_HIGH_THR_M0, 0x0102 },
+	{ CMN_PLL1_HIGH_THR_M0, 0x0116 },
+	{ CMN_PDIAG_PLL0_CTRL_M0, 0x0002 },
+	{ CMN_PDIAG_PLL1_CTRL_M0, 0x0002 },
+	{ CMN_PLL0_SS_CTRL1_M0, 0x0001 },
+	{ CMN_PLL1_SS_CTRL1_M0, 0x0002 },
+	{ CMN_PLL0_SS_CTRL2_M0, 0x045f },
+	{ CMN_PLL1_SS_CTRL2_M0, 0x04c4 },
+	{ CMN_PLL0_SS_CTRL3_M0, 0x006b },
+	{ CMN_PLL1_SS_CTRL3_M0, 0x006a },
+	{ CMN_PLL0_SS_CTRL4_M0, 0x0004 },
+	{ CMN_PLL1_SS_CTRL4_M0, 0x0004 },
+	{ CMN_PLL0_VCOCAL_INIT_TMR, 0x0104 },
+	{ CMN_PLL1_VCOCAL_INIT_TMR, 0x0104 },
+	{ CMN_PLL0_VCOCAL_ITER_TMR, 0x0005 },
+	{ CMN_PLL1_VCOCAL_ITER_TMR, 0x0005 },
+	{ CMN_PLL0_VCOCAL_REFTIM_START, 0x0337 },
+	{ CMN_PLL1_VCOCAL_REFTIM_START, 0x0337 },
+	{ CMN_PLL0_VCOCAL_PLLCNT_START, 0x0335 },
+	{ CMN_PLL1_VCOCAL_PLLCNT_START, 0x0335 },
+	{ CMN_PLL0_VCOCAL_TCTRL, 0x0003 },
+	{ CMN_PLL1_VCOCAL_TCTRL, 0x0003 },
+	{ CMN_PLL0_LOCK_REFCNT_START, 0x00cf },
+	{ CMN_PLL1_LOCK_REFCNT_START, 0x00cf },
+	{ CMN_PLL0_LOCK_PLLCNT_START, 0x00ce },
+	{ CMN_PLL1_LOCK_PLLCNT_START, 0x00ce },
+	{ CMN_PLL0_LOCK_PLLCNT_THR, 0x0005 },
+	{ CMN_PLL1_LOCK_PLLCNT_THR, 0x0005 },
+	{ PHY_PMA_ISOLATION_CTRL, 0x5100 },
+	{ PHY_PMA_ISOLATION_DATA0, 0x0100 },
+	{ PHY_PMA_ISOLATION_DATA1, 0x0a0a },
+	{ PHY_PMA_ISOLATION_DATA2, 0x1000 },
+	{ PHY_PMA_ISOLATION_DATA3, 0x0010 },
+	{ CMN_CDIAG_CDB_PWRI_OVRD, 0x8200 },
+	{ CMN_CDIAG_XCVRC_PWRI_OVRD, 0x8200 },
+	{ TX_LANE(3, TX_PSC_A0), 0x00fb },
+	{ TX_LANE(3, TX_PSC_A1), 0x04af },
+	{ TX_LANE(3, TX_PSC_A2), 0x04aa },
+	{ TX_LANE(3, TX_PSC_A3), 0x04aa },
+	{ RX_LANE(2, RX_PSC_A0), 0x091d },
+	{ RX_LANE(2, RX_PSC_A1), 0x091d },
+	{ RX_LANE(2, RX_PSC_A2), 0x0900 },
+	{ RX_LANE(2, RX_PSC_A3), 0x0000 },
+	{ TX_LANE(3, TX_TXCC_CTRL), 0x08a4 },
+	{ TX_LANE(3, TX_TXCC_CPOST_MULT_01), 0x0011 },
+	{ RX_LANE(2, RX_SIGDET_HL_FILT_TMR), 0x000c },
+	{ RX_LANE(2, RX_REE_GCSM1_CTRL), 0x0009 },
+	{ RX_LANE(2, RX_REE_ATTEN_THR), 0x0c02 },
+	{ RX_LANE(2, RX_REE_SMGM_CTRL1), 0x06f6 },
+	{ RX_LANE(2, RX_REE_SMGM_CTRL2), 0x4606 },
+	{ TX_LANE(2, XCVR_DIAG_PSC_OVRD), 0x0006 },
+	{ RX_LANE(2, RX_REE_TAP1_CLIP), 0x0519 },
+	{ RX_LANE(2, RX_REE_TAP2TON_CLIP), 0x0519 },
+	{ RX_LANE(2, RX_DIAG_SIGDET_TUNE), 0x1002 },
+	{ RX_LANE(2, RX_DIAG_NQST_CTRL), 0x0b98 },
+	{ RX_LANE(2, RX_DIAG_DFE_AMP_TUNE_2), 0x0c01 },
+	{ RX_LANE(2, RX_DIAG_DFE_AMP_TUNE_3), 0x0000 },
+	{ RX_LANE(2, RX_DIAG_PI_CAP), 0x0000 },
+	{ RX_LANE(2, RX_DIAG_PI_RATE), 0x0311 },
+	{ RX_LANE(2, RX_DIAG_ACYA), 0x0000 },
+	{ RX_LANE(3, RX_DIAG_ACYA), 0x0000 },
+	{ RX_LANE(2, RX_CDRLF_CNFG), 0x010a },
+	{ RX_LANE(2, RX_CDRLF_CNFG3), 0x0003 },
+	{ TX_LANE(3, XCVR_DIAG_BIDI_CTRL), 0x000f },
+	{ TX_LANE(2, XCVR_DIAG_BIDI_CTRL), 0x000f },
+	{ TX_LANE(0, TX_PSC_A0), 0x02ff },
+	{ TX_LANE(0, TX_PSC_A1), 0x06af },
+	{ TX_LANE(0, TX_PSC_A2), 0x06ae },
+	{ TX_LANE(0, TX_PSC_A3), 0x06ae },
+	{ RX_LANE(1, RX_PSC_A0), 0x0d1d },
+	{ RX_LANE(1, RX_PSC_A1), 0x0d1d },
+	{ RX_LANE(1, RX_PSC_A2), 0x0d00 },
+	{ RX_LANE(1, RX_PSC_A3), 0x0500 },
+	{ TX_LANE(0, TX_TXCC_CTRL), 0x2a82 },
+	{ TX_LANE(0, TX_TXCC_CPOST_MULT_01), 0x0014 },
+	{ RX_LANE(1, RX_SIGDET_HL_FILT_TMR), 0x0013 },
+	{ RX_LANE(1, RX_REE_GCSM1_CTRL), 0x0000 },
+	{ RX_LANE(1, RX_REE_ATTEN_THR), 0x0c02 },
+	{ RX_LANE(1, RX_REE_SMGM_CTRL1), 0x0330 },
+	{ RX_LANE(1, RX_REE_SMGM_CTRL2), 0x0300 },
+	{ TX_LANE(1, XCVR_DIAG_PSC_OVRD), 0x0003 },
+	{ RX_LANE(1, RX_REE_TAP1_CLIP), 0x0019 },
+	{ RX_LANE(1, RX_REE_TAP2TON_CLIP), 0x0019 },
+	{ RX_LANE(1, RX_DIAG_SIGDET_TUNE), 0x1004 },
+	{ RX_LANE(1, RX_DIAG_NQST_CTRL), 0x00f9 },
+	{ RX_LANE(1, RX_DIAG_DFE_AMP_TUNE_2), 0x0c01 },
+	{ RX_LANE(1, RX_DIAG_DFE_AMP_TUNE_3), 0x0002 },
+	{ RX_LANE(1, RX_DIAG_PI_CAP), 0x0000 },
+	{ RX_LANE(1, RX_DIAG_PI_RATE), 0x0031 },
+	{ RX_LANE(1, RX_DIAG_ACYA), 0x0001 },
+	{ RX_LANE(0, RX_DIAG_ACYA), 0x0002 },
+	{ RX_LANE(1, RX_CDRLF_CNFG), 0x018c },
+	{ RX_LANE(1, RX_CDRLF_CNFG3), 0x0003 },
+	{ TX_LANE(0, XCVR_DIAG_BIDI_CTRL), 0x000f },
+	{ TX_LANE(1, XCVR_DIAG_BIDI_CTRL), 0x00f0 },
+	{ PHY_PCS_PLL_RAW_CTRL, 0x0003 },
+	{ CMN_TXPUCAL_TUNE, 0x007f },
+	{ CMN_TXPDCAL_TUNE, 0x007f },
+};
+
+static int sun60i_combophy0_usb3_init(struct sun60i_combophy *cphy)
+{
+	u32 val;
+	u16 reg16;
+	int i, ret;
+
+	/* Keep CCU PIPE and UTMI clocks selected until controller resets finish. */
+	regmap_set_bits(cphy->syscon, SERDES_USB3P1_BGR,
+			USB3P1_ONLY_UTMI_CLK_SEL | USB3P1_ONLY_PIPE_CLK_SEL |
+			USB3P1_ACLK_EN | USB3P1_HCLK_EN |
+			USB3P1_USB2P0_PHY_RSTN | USB3P1_BGR_RST_MASK);
+	regmap_clear_bits(cphy->syscon, SERDES_DBG_CTL,
+			  SERDES_DISABLE_COMBO0_AUTOGATING);
+	regmap_set_bits(cphy->syscon, SERDES_TOP_ISOLATION_CTRL,
+			SERDES_TOP_ISO_USB3_MASK);
+	regmap_clear_bits(cphy->syscon, SERDES_USB3P1_PIPE_CLK_MAP_CTRL,
+			  USB3P1_PIPE_MAP_MASK);
+	regmap_clear_bits(cphy->syscon, SERDES_USB3P1_PIPE_RXD_MAP_CTRL,
+			  USB3P1_PIPE_MAP_MASK);
+	regmap_update_bits(cphy->syscon, SERDES_TOP_PIPE_MAP,
+			   SERDES_TOP_PIPE_MAP_MASK, SERDES_TOP_PIPE_MAP_MASK);
+	regmap_clear_bits(cphy->syscon, SERDES_TOP_COMBO0_SEL,
+			  SERDES_TOP_COMBO0_SEL_MASK);
+
+	regmap_clear_bits(cphy->syscon, SERDES_COMB0_LINK_CTRL2,
+			  PHY0_IDDQ_EN_SEL | PHY0_IDDQ_EN_SOFT);
+	regmap_set_bits(cphy->syscon, SERDES_COMB0_LINK_CTRL1,
+			PHY0_PMA_CMN_PLL1_REFCLK_SEL |
+			PHY0_PMA_CMN_PLL0_REFCLK_SEL |
+			PHY0_PMA_CMN_REFCLK_DIG_SEL);
+
+	for (i = 0; i < ARRAY_SIZE(sun60i_combophy0_usb3_regs); i++)
+		writew(sun60i_combophy0_usb3_regs[i].val,
+		       cphy->base + (sun60i_combophy0_usb3_regs[i].offset << 1));
+
+	regmap_clear_bits(cphy->syscon, SERDES_COMB0_LINK_CTRL0,
+			  PHY0_RESET_N | PHY0_TYPEC_CONN_DIR);
+	usleep_range(1000, 1500);
+	/* Release DP soft reset alongside PIPE reset to unblock PMA ready. */
+	regmap_set_bits(cphy->syscon, SERDES_COMB0_LINK_CTRL0,
+			PHY0_DP_LINK_RESET_N_SOFT |
+			PHY0_RESET_N | PHY0_PIPE_LINK_RESET_N_SOFT);
+	usleep_range(1000, 1500);
+
+	regmap_set_bits(cphy->syscon, SERDES_COMB0_LINK_CTRL3,
+			PHY0_PMA_XCVR_PLLCLK_EN_LN |
+			PHY0_PMA_XCVR_POWER_STATE_REQ_LN(1));
+
+	ret = regmap_read(cphy->syscon, SERDES_COMB0_LINK_STUS0, &val);
+	if (ret)
+		return ret;
+
+	if (!(val & PHY0_PMA_CMN_READY)) {
+		/* Clear PMA common reset bits if PMA is not ready yet. */
+		usleep_range(10000, 12000);
+		reg16 = readw(cphy->base + (COMB0_PMA_CMN_CTRL << 1));
+		reg16 &= ~COMB0_PMA_CMN_CTRL_RST_MASK;
+		writew(reg16, cphy->base + (COMB0_PMA_CMN_CTRL << 1));
+
+		ret = regmap_read_poll_timeout(cphy->syscon,
+					       SERDES_COMB0_LINK_STUS0, val,
+					       val & PHY0_PMA_CMN_READY,
+					       50, 50000);
+		if (ret) {
+			dev_err(cphy->dev, "combo0 PMA common ready timeout\n");
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int sun60i_combophy0_exit(struct sun60i_combophy *cphy)
+{
+	regmap_clear_bits(cphy->syscon, SERDES_COMB0_LINK_CTRL3,
+			  PHY0_PMA_XCVR_PLLCLK_EN_LN |
+			  PHY0_PMA_XCVR_POWER_STATE_REQ_LN(0x3f));
+	regmap_clear_bits(cphy->syscon, SERDES_COMB0_LINK_CTRL0,
+			  PHY0_DP_LINK_RESET_N_SOFT |
+			  PHY0_PIPE_LINK_RESET_N_SOFT | PHY0_RESET_N);
+	regmap_set_bits(cphy->syscon, SERDES_COMB0_LINK_CTRL2,
+			PHY0_IDDQ_EN_SEL | PHY0_IDDQ_EN_SOFT);
+	return 0;
+}
+
+static const struct sun60i_combophy_cfg sun60i_combophy0_cfg = {
+	.supported_type = PHY_TYPE_USB3,
+	.serdes_rate = 100000000,
+	.init = sun60i_combophy0_usb3_init,
+	.exit = sun60i_combophy0_exit,
 };
 
 static int sun60i_combophy1_pcie_init(struct sun60i_combophy *cphy)
@@ -79,10 +520,11 @@ static int sun60i_combophy1_pcie_init(struct sun60i_combophy *cphy)
 			SERDES_PCIE_GATING | SERDES_PCIE_RST);
 	regmap_set_bits(cphy->syscon, SERDES_DBG_CTL,
 			SERDES_DISABLE_COMBO1_AUTOGATING);
-	regmap_write(cphy->syscon, SERDES_COMB1_PIPE, SERDES_COMB1_PIPE_PCIE);
+	regmap_update_bits(cphy->syscon, SERDES_COMB1_PIPE,
+			   SERDES_COMB1_PIPE_MASK, SERDES_COMB1_PIPE_PCIE);
 
-	regmap_write(cphy->syscon, SERDES_COMB1_LINK_CTRL1,
-		     PHY1_EN_REFCLK | 0x01100001);
+	regmap_update_bits(cphy->syscon, SERDES_COMB1_LINK_CTRL1,
+			   PHY1_EN_REFCLK, PHY1_EN_REFCLK);
 	regmap_set_bits(cphy->syscon, SERDES_COMB1_LINK_CTRL0,
 			PHY1_LINK_CFG_LN(1) | PHY1_RESET_N);
 	regmap_set_bits(cphy->syscon, SERDES_COMB1_LANE0_CTRL0,
@@ -97,14 +539,6 @@ static int sun60i_combophy1_pcie_init(struct sun60i_combophy *cphy)
 	return ret;
 }
 
-static int sun60i_combophy1_init(struct sun60i_combophy *cphy)
-{
-	if (cphy->type != PHY_TYPE_PCIE)
-		return -EINVAL;
-
-	return sun60i_combophy1_pcie_init(cphy);
-}
-
 static int sun60i_combophy1_exit(struct sun60i_combophy *cphy)
 {
 	regmap_clear_bits(cphy->syscon, SERDES_COMB1_LINK_CTRL0, PHY1_RESET_N);
@@ -112,7 +546,9 @@ static int sun60i_combophy1_exit(struct sun60i_combophy *cphy)
 }
 
 static const struct sun60i_combophy_cfg sun60i_combophy1_cfg = {
-	.init = sun60i_combophy1_init,
+	.supported_type = PHY_TYPE_PCIE,
+	.serdes_rate = 100000000,
+	.init = sun60i_combophy1_pcie_init,
 	.exit = sun60i_combophy1_exit,
 };
 
@@ -121,16 +557,27 @@ static int sun60i_combophy_init(struct phy *phy)
 	struct sun60i_combophy *cphy = phy_get_drvdata(phy);
 	int ret;
 
+	ret = pm_runtime_resume_and_get(cphy->dev);
+	if (ret)
+		return ret;
+
 	if (cphy->supply) {
 		ret = regulator_enable(cphy->supply);
 		if (ret)
-			return ret;
+			goto err_pm;
 	}
 
 	ret = reset_control_deassert(cphy->reset);
 	if (ret)
 		goto err_regulator;
 
+	if (cphy->cfg->supported_type != PHY_TYPE_USB3) {
+		ret = clk_set_rate(cphy->clks[SUN60I_COMBOPHY_CLK_SERDES].clk,
+				   cphy->cfg->serdes_rate);
+		if (ret)
+			goto err_reset;
+	}
+
 	ret = clk_bulk_prepare_enable(cphy->num_clks, cphy->clks);
 	if (ret)
 		goto err_reset;
@@ -148,26 +595,46 @@ static int sun60i_combophy_init(struct phy *phy)
 err_regulator:
 	if (cphy->supply)
 		regulator_disable(cphy->supply);
+err_pm:
+	pm_runtime_put_sync(cphy->dev);
 	return ret;
 }
 
 static int sun60i_combophy_exit(struct phy *phy)
 {
 	struct sun60i_combophy *cphy = phy_get_drvdata(phy);
+	int ret = 0;
 
 	if (cphy->cfg->exit)
-		cphy->cfg->exit(cphy);
+		ret = cphy->cfg->exit(cphy);
 
 	clk_bulk_disable_unprepare(cphy->num_clks, cphy->clks);
 	reset_control_assert(cphy->reset);
 	if (cphy->supply)
 		regulator_disable(cphy->supply);
+	pm_runtime_put_sync(cphy->dev);
+
+	return ret;
+}
+
+static int sun60i_combophy_calibrate(struct phy *phy)
+{
+	struct sun60i_combophy *cphy = phy_get_drvdata(phy);
+
+	if (cphy->cfg->supported_type == PHY_TYPE_USB3) {
+		/* Hand over PIPE and UTMI clocks to SerDes after reset. */
+		regmap_update_bits(cphy->syscon, SERDES_USB3P1_BGR,
+				   USB3P1_ONLY_UTMI_CLK_SEL |
+				   USB3P1_ONLY_PIPE_CLK_SEL |
+				   USB3P1_BGR_RST_MASK, 0);
+	}
 
 	return 0;
 }
 
 static const struct phy_ops sun60i_combophy_ops = {
 	.init = sun60i_combophy_init,
+	.calibrate = sun60i_combophy_calibrate,
 	.exit = sun60i_combophy_exit,
 	.owner = THIS_MODULE,
 };
@@ -180,11 +647,61 @@ static struct phy *sun60i_combophy_xlate(struct device *dev,
 	if (args->args_count != 1)
 		return ERR_PTR(-EINVAL);
 
-	cphy->type = args->args[0];
+	if (args->args[0] != cphy->cfg->supported_type)
+		return ERR_PTR(-EINVAL);
 
 	return cphy->phy;
 }
 
+static void sun60i_combophy_usb3_bgr_disable(void *data)
+{
+	struct sun60i_combophy *cphy = data;
+
+	regmap_clear_bits(cphy->syscon, SERDES_USB3P1_BGR,
+			  USB3P1_ACLK_EN | USB3P1_HCLK_EN |
+			  USB3P1_USB2P0_PHY_RSTN | USB3P1_BGR_RST_MASK);
+	clk_bulk_disable_unprepare(cphy->num_clks, cphy->clks);
+	reset_control_assert(cphy->reset);
+	pm_runtime_put_sync(cphy->dev);
+}
+
+static int sun60i_combophy_usb3_bgr_enable(struct sun60i_combophy *cphy)
+{
+	int ret;
+
+	ret = pm_runtime_resume_and_get(cphy->dev);
+	if (ret)
+		return ret;
+
+	ret = reset_control_deassert(cphy->reset);
+	if (ret)
+		goto err_pm;
+
+	ret = clk_set_rate(cphy->clks[SUN60I_COMBOPHY_CLK_SERDES].clk,
+			   cphy->cfg->serdes_rate);
+	if (ret)
+		goto err_reset;
+
+	ret = clk_bulk_prepare_enable(cphy->num_clks, cphy->clks);
+	if (ret)
+		goto err_reset;
+
+	/* Un-gate USB3P1 BGR before DWC3 reads GSNPSID during probe. */
+	/* Keep CCU PIPE and UTMI clocks selected until controller resets finish. */
+	regmap_set_bits(cphy->syscon, SERDES_USB3P1_BGR,
+			USB3P1_ACLK_EN | USB3P1_HCLK_EN |
+			USB3P1_USB2P0_PHY_RSTN | USB3P1_BGR_RST_MASK);
+
+	return devm_add_action_or_reset(cphy->dev,
+					sun60i_combophy_usb3_bgr_disable, cphy);
+
+err_reset:
+	reset_control_assert(cphy->reset);
+err_pm:
+	pm_runtime_put_sync(cphy->dev);
+	return ret;
+}
+
 static int sun60i_combophy_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -244,6 +761,12 @@ static int sun60i_combophy_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	if (cphy->cfg->supported_type == PHY_TYPE_USB3) {
+		ret = sun60i_combophy_usb3_bgr_enable(cphy);
+		if (ret)
+			return ret;
+	}
+
 	cphy->phy = devm_phy_create(dev, NULL, &sun60i_combophy_ops);
 	if (IS_ERR(cphy->phy))
 		return dev_err_probe(dev, PTR_ERR(cphy->phy),
@@ -256,6 +779,10 @@ static int sun60i_combophy_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id sun60i_combophy_of_match[] = {
+	{
+		.compatible = "allwinner,sun60i-a733-combophy0",
+		.data = &sun60i_combophy0_cfg,
+	},
 	{
 		.compatible = "allwinner,sun60i-a733-combophy1",
 		.data = &sun60i_combophy1_cfg,
-- 
2.53.0

