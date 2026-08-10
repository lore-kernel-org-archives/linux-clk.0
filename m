Received: from mail.zlab.su (mail.zlab.su [109.73.193.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D1E3D6485;
	Mon, 10 Aug 2026 12:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.73.193.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786364160; cv=none; b=QhZYRrVz0LsLp6YPH5QNCeiOgupxI2H4rZtJ1kYyide3ybjD5xRkhX6THxGZUTgl8+iqs5UqY/V9paLgS/gqnEOC05Ppo2dla22jz9oRTNiF9NRKc4B5lhxCIWF9aocTImS+RZGhTmt9j6RCdRA/N8bxhdtSmvoI54tQdxPUPtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786364160; c=relaxed/simple;
	bh=gkLbLbqn9POYmI7xz286NeF2c4v8eoSTSq1XUHNTNhY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NPNV7RurStRHv4dzGkNC8JL27YJLdXhypDziYuqENzqTeBlbYLR3PBcvCm1OkeFx8w5xzqGqQulSS6lmiSsXZGCn4M8uwfDyC64Qk1Df08NhSiBvi0vzRCkaOvygdxY9VxJoz4pXwPwq1ttZJ4tuVayXR889AudSr/69d2rCRpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zlab.su; spf=pass smtp.mailfrom=zlab.su; dkim=pass (2048-bit key) header.d=zlab.su header.i=@zlab.su header.b=FFft6+Da; arc=none smtp.client-ip=109.73.193.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zlab.su
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zlab.su
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zlab.su header.i=@zlab.su header.b="FFft6+Da"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3A3CCC0518;
	Mon, 10 Aug 2026 15:15:55 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zlab.su; s=dkim;
	t=1786364156; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=/IfKtls+le+9BtiQy6PvVE/vxklhPQZSTDxsy6J1Qqo=;
	b=FFft6+DamO6uqBIaV1j4bG9OPKSXmQMbA8epNg8w4oJqnuxpSl9D9MDtP/1EZSMgSBQ1tq
	sy4lLhZJow2WOyuWHYuGkqpNqikZBCp4izHL2QP5PVVfjYiL5CZmK/RZdaKWqmrJpopbjP
	uQvC9BNHwk0LnOBipT1Hc4T3SH0XS3We6lj+J7oOILiUO/Y1XkxKn8rOwVFcsVVwNcj1XD
	MvLw0/6BP43TM0ysFWzCPPjAj8+TUK7UWn4EFd5gn5mFmI0kLjrMUFyEOBcZ84E0q4aa7+
	M7FZBPqOXIHPGYtq6UNJ1DC4fsdP93W6NXkHWarS5JsqUXF6G+XUGnOL2dydfg==
From: Vladislav Leonov <vlad@zlab.su>
To: linux-rockchip@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vladislav Leonov <vlad@zlab.su>,
	Heiko Stuebner <heiko@sntech.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	linux-phy@lists.infradead.org
Subject: [PATCH 08/25] phy: rockchip: inno-usb2: Add support for RV1106
Date: Mon, 10 Aug 2026 15:10:59 +0300
Message-ID: <20260810121121.210040-9-vlad@zlab.su>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260810121121.210040-1-vlad@zlab.su>
References: <20260810121121.210040-1-vlad@zlab.su>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The RV1106 has a single USB2 PHY with only an OTG port, so add its
phy_cfgs entry with the OTG port's control/status/detect bit offsets
and charger-detection register layout.

Also add rv1106_usb2phy_tuning() to apply the vendor HS PHY tuning:
enable pre-emphasis in all line states, raise the Tx pre-emphasis
strength and eye height, increase the 45ohm HS ODT drive strength,
lower the Rx squelch trigger point, bypass squelch detector
calibration, disable the differential receiver to save power, and
switch the HS disconnect detector to single-ended mode (needed for
reliable unplug detection).

The register offsets and values are ported from the Rockchip vendor
BSP kernel; one difference is that the BSP driver additionally lowered
the Tx pre-emphasis strength on newer chip revisions via
rockchip_get_cpu_version(), which has no mainline equivalent, so only
the new revision's tuning value is kept here.

Signed-off-by: Vladislav Leonov <vlad@zlab.su>
---

 drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 76 +++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
index 7d8a533f24ae..ee24382a732a 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
@@ -1617,6 +1617,38 @@ static int rk3588_usb2phy_tuning(struct rockchip_usb2phy *rphy)
 	return ret;
 }
 
+static int rv1106_usb2phy_tuning(struct rockchip_usb2phy *rphy)
+{
+	int ret;
+
+	/* Always enable pre-emphasis in SOF & EOP & chirp & non-chirp state */
+	ret = regmap_update_bits(rphy->phy_base, 0x30, GENMASK(2, 0), 0x07);
+
+	/* Set Tx HS pre_emphasize strength to 3'b001 */
+	ret |= regmap_update_bits(rphy->phy_base, 0x40, GENMASK(5, 3), 0x01 << 3);
+
+	/* Set RX Squelch trigger point configure to 4'b0000 (112.5 mV) */
+	ret |= regmap_update_bits(rphy->phy_base, 0x64, GENMASK(6, 3), 0x00 << 3);
+
+	/* Turn off differential receiver by default to save power */
+	ret |= regmap_update_bits(rphy->phy_base, 0x100, BIT(6), 0);
+
+	/* Set 45ohm HS ODT value to 5'b10111 to increase driver strength */
+	ret |= regmap_update_bits(rphy->phy_base, 0x11c, GENMASK(4, 0), 0x17);
+
+	/* Set Tx HS eye height tuning to 3'b011 (462 mV) */
+	ret |= regmap_update_bits(rphy->phy_base, 0x124, GENMASK(4, 2), 0x03 << 2);
+
+	/* Bypass Squelch detector calibration */
+	ret |= regmap_update_bits(rphy->phy_base, 0x1a4, GENMASK(7, 4), 0x01 << 4);
+	ret |= regmap_update_bits(rphy->phy_base, 0x1b4, GENMASK(7, 4), 0x01 << 4);
+
+	/* Set HS disconnect detect mode to single ended detect mode */
+	ret |= regmap_update_bits(rphy->phy_base, 0x70, BIT(2), BIT(2));
+
+	return ret;
+}
+
 static const struct rockchip_usb2phy_cfg rk3036_phy_cfgs[] = {
 	{
 		.reg = 0x17c,
@@ -2324,6 +2356,49 @@ static const struct rockchip_usb2phy_cfg rk3588_phy_cfgs[] = {
 	{ /* sentinel */ }
 };
 
+static const struct rockchip_usb2phy_cfg rv1106_phy_cfgs[] = {
+	{
+		.reg = 0xff3e0000,
+		.num_ports	= 1,
+		.phy_tuning	= rv1106_usb2phy_tuning,
+		.clkout_ctl	= { 0x0058, 4, 4, 1, 0 },
+		.port_cfgs	= {
+			[USB2PHY_PORT_OTG] = {
+				.phy_sus	= { 0x0050, 8, 0, 0, 0x1d1 },
+				.bvalid_det_en	= { 0x0100, 2, 2, 0, 1 },
+				.bvalid_det_st	= { 0x0104, 2, 2, 0, 1 },
+				.bvalid_det_clr = { 0x0108, 2, 2, 0, 1 },
+				.idfall_det_en	= { 0x0100, 5, 5, 0, 1 },
+				.idfall_det_st	= { 0x0104, 5, 5, 0, 1 },
+				.idfall_det_clr = { 0x0108, 5, 5, 0, 1 },
+				.idrise_det_en	= { 0x0100, 4, 4, 0, 1 },
+				.idrise_det_st	= { 0x0104, 4, 4, 0, 1 },
+				.idrise_det_clr = { 0x0108, 4, 4, 0, 1 },
+				.ls_det_en	= { 0x0100, 0, 0, 0, 1 },
+				.ls_det_st	= { 0x0104, 0, 0, 0, 1 },
+				.ls_det_clr	= { 0x0108, 0, 0, 0, 1 },
+				.utmi_avalid	= { 0x0060, 10, 10, 0, 1 },
+				.utmi_bvalid	= { 0x0060, 9, 9, 0, 1 },
+				.utmi_id	= { 0x0060, 6, 6, 0, 1 },
+				.utmi_ls	= { 0x0060, 5, 4, 0, 1 },
+			},
+		},
+		.chg_det = {
+			.opmode		= { 0x0050, 8, 0, 0, 0x1d7 },
+			.cp_det		= { 0x0060, 13, 13, 0, 1 },
+			.dcp_det	= { 0x0060, 12, 12, 0, 1 },
+			.dp_det		= { 0x0060, 14, 14, 0, 1 },
+			.idm_sink_en	= { 0x0058, 8, 8, 0, 1 },
+			.idp_sink_en	= { 0x0058, 7, 7, 0, 1 },
+			.idp_src_en	= { 0x0058, 9, 9, 0, 1 },
+			.rdm_pdwn_en	= { 0x0058, 10, 10, 0, 1 },
+			.vdm_src_en	= { 0x0058, 12, 12, 0, 1 },
+			.vdp_src_en	= { 0x0058, 11, 11, 0, 1 },
+		},
+	},
+	{ /* sentinel */ }
+};
+
 static const struct rockchip_usb2phy_cfg rv1108_phy_cfgs[] = {
 	{
 		.reg = 0x100,
@@ -2380,6 +2455,7 @@ static const struct of_device_id rockchip_usb2phy_dt_match[] = {
 	{ .compatible = "rockchip,rk3568-usb2phy", .data = &rk3568_phy_cfgs },
 	{ .compatible = "rockchip,rk3576-usb2phy", .data = &rk3576_phy_cfgs },
 	{ .compatible = "rockchip,rk3588-usb2phy", .data = &rk3588_phy_cfgs },
+	{ .compatible = "rockchip,rv1106-usb2phy", .data = &rv1106_phy_cfgs },
 	{ .compatible = "rockchip,rv1108-usb2phy", .data = &rv1108_phy_cfgs },
 	{}
 };
-- 
2.47.3

