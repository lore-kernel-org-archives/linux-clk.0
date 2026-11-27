Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=119.15.109.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795774125;
	b=jGTe5kfVE1YISCt6sp9HtrjXXyB5YeW559p7zBxi3gHc8fHVNA+UQAe1dBnFWLwXFxUU
	 QFg/txXLWvAJ2L4FMLSxklq/6oxzpgQ0rCmbh2sBcG05g/5Urggzrn5B6VGOZkva4syGg
	 tbI4b7ZSscsmRX3gtgjGmkt58v5ZIuKEVQQBTv8BRRUVM/UAHB0L06y8f4Kq9h89UZTsV
	 3lsBHYxHjz+KEUZNXc7S5Kjkn1T0I9avw6m6DK34OubFpsn/SdCY73tlQ3Pcm1cJGkLuE
	 v4GjDMz7Q4VWSfJ1DXKN1Ipe9w7SVcEFVkmZksWRn9jIKqKJde3i5h6CqCxaBsfjs6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774125;
	h=DMARC-Filter:Received:DKIM-Signature:X-GPT-Reason:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mAsmRzP5owm/v51bster72w+t73Y0qNN12iG0u355nY=;
	b=mOBFzHfv6UwGapGVSMmUrGvzk6K2k55Yp30gYyVpXDmA/Qq44xdXQCiGSkVLRdktQnkv
	 R9Q2c16xSy/aCdfHAXPE3QEd4eeKTXCCbJo7pcl/QX1HNTx2hGnpyjaevUoxeOlpjaNAj
	 d6bvoufCA+ip5YT64LTVoQVc5c9BElfTN53nVl6Ul7lm5+H8ITS4qfdW0G5LgYTORO4n0
	 HAVP6gVr6xivUme6JvtN4xDjFhuV2hq0y2aL9etynAW5VMKuZlRkFMxEgghdab+tXoFaF
	 aQm9lFkJllfueH+3jsAyU1VAIgXKQilCXfZYqNYJr3u6V+d1yz4SFNjmZAJ8MFuJT8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=d-silva.org;
	spf=pass smtp.mailfrom=d-silva.org;
	dkim=pass header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=zocfg4sp;
	arc=none smtp.remote-ip=119.15.109.137
Received: from www.nmnhosting.com (watt.d-silva.org [119.15.109.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00945606A31E;
	Fri, 27 Nov 2026 10:08:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00945606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-silva.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=zocfg4sp
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id 50D6C4C982;
	Fri, 27 Nov 2026 21:08:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795774116;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mAsmRzP5owm/v51bster72w+t73Y0qNN12iG0u355nY=;
	b=zocfg4spa1AI3vBYpfXiFqwjHgQTyHyFwen2lahrzlAjKpMFELpdRYmDBU+dHHLrXALIpv
	sto41vrYhk3m4nvkq8tmuyq10/4KpyOohVK5Wz98ulllbgwJjHSRhh5ktwgyWCqmEnKaK0
	gta3ibTy3XBBRrWuMRPRGSRW/QXOjjzi1/zh/rXL9EaG/neVEWorjzJVq9RZqLIpPsl1lm
	a96ZcsPSR7GVoXbau5j9H6qNvS13xrrWkW9If0RDoKBFY1S48rvixSlAvvKxiouTdtb5fN
	ej1yEJjt9X6L6TfsH3S6iGOlfVVxtJMjpZFwdNGwcXAUGBpV3+U9D4YRCcp8Lg==
X-GPT-Reason: legitimate; This email is a technical software patch
	description that perfectly aligns with the personal mailbox of
	alastair@d-silva.org. The sender's domain (d-silva.org) matches
	the recipient's domain exactly, and the content is a standard "Signed-off-by" commit
	message for a Linux kernel or driver modification. There are no
	phishing indicators, no links, no urgency, and the technical nature
	of the "phy: allwinner" subject line is consistent with a developer's
	correspondence.
From: Alastair D'Silva <alastair@d-silva.org>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-usb@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alastair D'Silva <alastair@d-silva.org>
Subject: [PATCH 4/6] phy: allwinner: sun4i-usb: Add Allwinner A733 support
Date: Fri, 27 Nov 2026 21:08:06 +1100
Message-ID: <20261127100808.2292229-5-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127100808.2292229-1-alastair@d-silva.org>
References: <20261127100808.2292229-1-alastair@d-silva.org>
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

Add support for the Allwinner A733 (sun60i-a733) USB 2.0 PHY.

Enable the PHY register bus clock (bus) during PHY init, and keep PHY0 out
of reset and SIDDQ while any PHY is active.

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 drivers/phy/allwinner/phy-sun4i-usb.c | 119 +++++++++++++++++++-------
 1 file changed, 88 insertions(+), 31 deletions(-)

diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinner/phy-sun4i-usb.c
index f26eed0db17e..e1f20d00d593 100644
--- a/drivers/phy/allwinner/phy-sun4i-usb.c
+++ b/drivers/phy/allwinner/phy-sun4i-usb.c
@@ -102,7 +102,9 @@ struct sun4i_usb_phy_cfg {
 	u32 hci_phy_ctl_clear;
 	u8 phyctl_offset;
 	bool dedicated_clocks;
+	bool has_bus_clk;
 	bool phy0_dual_route;
+	bool needs_phy0_siddq;
 	bool needs_phy2_siddq;
 	bool siddq_in_base;
 	bool poll_vbusen;
@@ -111,9 +113,11 @@ struct sun4i_usb_phy_cfg {
 
 struct sun4i_usb_phy_data {
 	void __iomem *base;
+	struct clk *bus_clk;
 	const struct sun4i_usb_phy_cfg *cfg;
 	enum usb_dr_mode dr_mode;
 	spinlock_t reg_lock; /* guard access to phyctl reg */
+	unsigned int phy0_siddq_users;
 	int num_phys;
 	struct sun4i_usb_phy {
 		struct phy *phy;
@@ -257,24 +261,39 @@ static int sun4i_usb_phy_init(struct phy *_phy)
 {
 	struct sun4i_usb_phy *phy = phy_get_drvdata(_phy);
 	struct sun4i_usb_phy_data *data = to_sun4i_usb_phy_data(phy);
+	unsigned long flags;
 	int ret;
 	u32 val;
 
-	ret = clk_prepare_enable(phy->clk);
+	ret = clk_prepare_enable(data->bus_clk);
 	if (ret)
 		return ret;
 
+	ret = clk_prepare_enable(phy->clk);
+	if (ret)
+		goto err_disable_bus_clk;
+
 	ret = clk_prepare_enable(phy->clk2);
-	if (ret) {
-		clk_disable_unprepare(phy->clk);
-		return ret;
-	}
+	if (ret)
+		goto err_disable_clk;
 
 	ret = reset_control_deassert(phy->reset);
-	if (ret) {
-		clk_disable_unprepare(phy->clk2);
-		clk_disable_unprepare(phy->clk);
-		return ret;
+	if (ret)
+		goto err_disable_clk2;
+
+	/* Some PHYs on some SoCs need the help of PHY0 to work. */
+	if (data->cfg->needs_phy0_siddq && phy->index != 0) {
+		struct sun4i_usb_phy *phy0 = &data->phys[0];
+
+		ret = clk_prepare_enable(phy0->clk);
+		if (ret)
+			goto err_assert_reset;
+
+		ret = reset_control_deassert(phy0->reset);
+		if (ret) {
+			clk_disable_unprepare(phy0->clk);
+			goto err_assert_reset;
+		}
 	}
 
 	/* Some PHYs on some SoCs need the help of PHY2 to work. */
@@ -282,20 +301,13 @@ static int sun4i_usb_phy_init(struct phy *_phy)
 		struct sun4i_usb_phy *phy2 = &data->phys[2];
 
 		ret = clk_prepare_enable(phy2->clk);
-		if (ret) {
-			reset_control_assert(phy->reset);
-			clk_disable_unprepare(phy->clk2);
-			clk_disable_unprepare(phy->clk);
-			return ret;
-		}
+		if (ret)
+			goto err_assert_reset;
 
 		ret = reset_control_deassert(phy2->reset);
 		if (ret) {
 			clk_disable_unprepare(phy2->clk);
-			reset_control_assert(phy->reset);
-			clk_disable_unprepare(phy->clk2);
-			clk_disable_unprepare(phy->clk);
-			return ret;
+			goto err_assert_reset;
 		}
 
 		/*
@@ -306,10 +318,7 @@ static int sun4i_usb_phy_init(struct phy *_phy)
 		if (ret) {
 			reset_control_assert(phy2->reset);
 			clk_disable_unprepare(phy2->clk);
-			reset_control_assert(phy->reset);
-			clk_disable_unprepare(phy->clk2);
-			clk_disable_unprepare(phy->clk);
-			return ret;
+			goto err_assert_reset;
 		}
 
 		if (phy2->pmu && data->cfg->hci_phy_ctl_clear) {
@@ -328,11 +337,16 @@ static int sun4i_usb_phy_init(struct phy *_phy)
 	}
 
 	if (data->cfg->siddq_in_base) {
-		if (phy->index == 0) {
+		if (phy->index == 0 || data->cfg->needs_phy0_siddq) {
+			spin_lock_irqsave(&data->reg_lock, flags);
 			val = readl(data->base + data->cfg->phyctl_offset);
-			val |= PHY_CTL_VBUSVLDEXT;
+			if (phy->index == 0)
+				val |= PHY_CTL_VBUSVLDEXT;
 			val &= ~PHY_CTL_SIDDQ;
 			writel(val, data->base + data->cfg->phyctl_offset);
+			if (data->cfg->needs_phy0_siddq)
+				data->phy0_siddq_users++;
+			spin_unlock_irqrestore(&data->reg_lock, flags);
 		}
 	} else {
 		/* Enable USB 45 Ohm resistor calibration */
@@ -363,27 +377,48 @@ static int sun4i_usb_phy_init(struct phy *_phy)
 	}
 
 	return 0;
+
+err_assert_reset:
+	reset_control_assert(phy->reset);
+err_disable_clk2:
+	clk_disable_unprepare(phy->clk2);
+err_disable_clk:
+	clk_disable_unprepare(phy->clk);
+err_disable_bus_clk:
+	clk_disable_unprepare(data->bus_clk);
+	return ret;
 }
 
 static int sun4i_usb_phy_exit(struct phy *_phy)
 {
 	struct sun4i_usb_phy *phy = phy_get_drvdata(_phy);
 	struct sun4i_usb_phy_data *data = to_sun4i_usb_phy_data(phy);
+	unsigned long flags;
 
-	if (phy->index == 0) {
-		if (data->cfg->siddq_in_base) {
-			void __iomem *phyctl = data->base +
-				data->cfg->phyctl_offset;
+	if (data->cfg->siddq_in_base &&
+	    (phy->index == 0 || data->cfg->needs_phy0_siddq)) {
+		void __iomem *phyctl = data->base + data->cfg->phyctl_offset;
 
+		spin_lock_irqsave(&data->reg_lock, flags);
+		if (!data->cfg->needs_phy0_siddq || --data->phy0_siddq_users == 0)
 			writel(readl(phyctl) | PHY_CTL_SIDDQ, phyctl);
-		}
+		spin_unlock_irqrestore(&data->reg_lock, flags);
+	}
 
+	if (phy->index == 0) {
 		/* Disable pull-ups */
 		sun4i_usb_phy0_update_iscr(_phy, ISCR_DPDM_PULLUP_EN, 0);
 		sun4i_usb_phy0_update_iscr(_phy, ISCR_ID_PULLUP_EN, 0);
 		data->phy0_init = false;
 	}
 
+	if (data->cfg->needs_phy0_siddq && phy->index != 0) {
+		struct sun4i_usb_phy *phy0 = &data->phys[0];
+
+		reset_control_assert(phy0->reset);
+		clk_disable_unprepare(phy0->clk);
+	}
+
 	if (data->cfg->needs_phy2_siddq && phy->index != 2) {
 		struct sun4i_usb_phy *phy2 = &data->phys[2];
 
@@ -395,6 +430,7 @@ static int sun4i_usb_phy_exit(struct phy *_phy)
 	reset_control_assert(phy->reset);
 	clk_disable_unprepare(phy->clk2);
 	clk_disable_unprepare(phy->clk);
+	clk_disable_unprepare(data->bus_clk);
 
 	return 0;
 }
@@ -739,6 +775,13 @@ static int sun4i_usb_phy_probe(struct platform_device *pdev)
 	if (IS_ERR(data->base))
 		return PTR_ERR(data->base);
 
+	if (data->cfg->has_bus_clk) {
+		data->bus_clk = devm_clk_get(dev, "bus");
+		if (IS_ERR(data->bus_clk))
+			return dev_err_probe(dev, PTR_ERR(data->bus_clk),
+					     "failed to get bus clock\n");
+	}
+
 	data->id_det_gpio = devm_gpiod_get_optional(dev, "usb0_id_det",
 						    GPIOD_IN);
 	if (IS_ERR(data->id_det_gpio)) {
@@ -787,7 +830,10 @@ static int sun4i_usb_phy_probe(struct platform_device *pdev)
 			continue;
 
 		snprintf(name, sizeof(name), "usb%d_reset", i);
-		phy->reset = devm_reset_control_get(dev, name);
+		if (i == 0 && data->cfg->needs_phy0_siddq)
+			phy->reset = devm_reset_control_get_shared(dev, name);
+		else
+			phy->reset = devm_reset_control_get(dev, name);
 		if (IS_ERR(phy->reset)) {
 			if (PTR_ERR(phy->reset) == -ENOENT)
 				break;
@@ -1013,6 +1059,16 @@ static const struct sun4i_usb_phy_cfg sun50i_h616_cfg = {
 	.siddq_in_base = true,
 };
 
+static const struct sun4i_usb_phy_cfg sun60i_a733_cfg = {
+	.phyctl_offset = REG_PHYCTL_A33,
+	.dedicated_clocks = true,
+	.has_bus_clk = true,
+	.hci_phy_ctl_clear = PHY_CTL_SIDDQ,
+	.phy0_dual_route = true,
+	.needs_phy0_siddq = true,
+	.siddq_in_base = true,
+};
+
 static const struct of_device_id sun4i_usb_phy_of_match[] = {
 	{ .compatible = "allwinner,sun4i-a10-usb-phy", .data = &sun4i_a10_cfg },
 	{ .compatible = "allwinner,sun5i-a13-usb-phy", .data = &sun5i_a13_cfg },
@@ -1029,6 +1085,7 @@ static const struct of_device_id sun4i_usb_phy_of_match[] = {
 	  .data = &sun50i_a64_cfg},
 	{ .compatible = "allwinner,sun50i-h6-usb-phy", .data = &sun50i_h6_cfg },
 	{ .compatible = "allwinner,sun50i-h616-usb-phy", .data = &sun50i_h616_cfg },
+	{ .compatible = "allwinner,sun60i-a733-usb-phy", .data = &sun60i_a733_cfg },
 	{ .compatible = "allwinner,suniv-f1c100s-usb-phy",
 	  .data = &suniv_f1c100s_cfg },
 	{ },
-- 
2.53.0

