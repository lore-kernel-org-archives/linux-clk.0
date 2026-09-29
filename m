Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4E65187CA;
	Tue, 29 Sep 2026 10:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790677968; cv=none; b=lH8JpLJTJYfWyjrZZbwu4Pn8lU5DrmMyU575otqV53hd3SVcXqJh7zMKQezegpQwNNA3MmjN+Nl7tZNpEtwh7rWCPcEQ4Fua/2qxt78vJ57LosM4tuFDoN9GQ0rTY1BzVqJWT3Bcj01TCC9jQCa4BJr53mRWAfZ8tc6e7aVeUIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790677968; c=relaxed/simple;
	bh=I7UMdGcCl0DX+Opz1TnjT3UoLaAAZc7x/DvZrufXojM=;
	h=From:Date:Subject:MIME-Version:Message-Id:In-Reply-To:To:Cc:
	 Content-Type:References; b=uSgC84b8aYwMXdHMdgoq7qUXwUQBxpuFKjZ+s7nRnwWGciPWn9heD3BGubmCtpwSJxp9OpVZ7r6YctjHNo3tSdo3MjOuRKJhSSfXhUsmrsN0FFLU5pG+4d3itY+mBlz6WgENcjYlITebMGX6mdK6TdCmetfoA4G8BnB0wnsGcSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=VoJUUOwL; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="VoJUUOwL"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260929103231euoutp01d4d8f15936912f644cd7a91de60a492d~ZxBwU3fzq2203922039euoutp01S;
	Tue, 29 Sep 2026 10:32:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260929103231euoutp01d4d8f15936912f644cd7a91de60a492d~ZxBwU3fzq2203922039euoutp01S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1790677951;
	bh=9NEw7RKkFUyh3R4GTKv1l/ySgAYiNAho9EQ+VxCzyQQ=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=VoJUUOwLwIA5bdY4CGjAjgrWNK13n6Yg92cD6oAsUUvN9hVJkC/Sdn3iaVsnVmGvH
	 6KKp8SSJUaGlfqRt8/NHCdby2bLTUzNk02gZYr2pYLP/l6XK1KiV1G6wRpoLPptTGQ
	 lAtL+87SgZbEyVh8hFmQwasuYzy84p1ZgbamAy+A=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260929103231eucas1p1e7b7a409de871be517c6efad3bf06881~ZxBv-bxT90572605726eucas1p1G;
	Tue, 29 Sep 2026 10:32:31 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260929103229eusmtip174bc2dae28e846d16be34688ae6f217d~ZxBuFcjhu0258202582eusmtip1_;
	Tue, 29 Sep 2026 10:32:29 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Tue, 29 Sep 2026 12:31:09 +0200
Subject: [PATCH v5 12/21] drm/bridge: inno-hdmi: Make the PHY configuration
 table optional
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-jh7110-clean-send-v5-12-82b4d8e3c6c7@samsung.com>
In-Reply-To: <20260929-jh7110-clean-send-v5-0-82b4d8e3c6c7@samsung.com>
To: Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
	<conor+dt@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,  Robert Foss
	<rfoss@kernel.org>,  Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>,  Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,  Andy Yan
	<andy.yan@rock-chips.com>, Philipp Zabel <p.zabel@pengutronix.de>,  Emil
	Renner Berthing <kernel@esmil.dk>,  Hal Feng <hal.feng@starfivetech.com>, 
	Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
	<sboyd@kernel.org>, Heiko Stuebner <heiko@sntech.de>,  Paul Walmsley
	<pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,  Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,  Dominique
	Belhachemi <db@domibel.de>, Brian Masney <bmasney+clk@redhat.com>,  Jerome
	Brunet <jbrunet+clk@baylibre.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,  Marek
	Szyprowski <m.szyprowski@samsung.com>,  Maud Spierings
	<maud_spierings@murena.io>,  Graham Markall <hello@big-grey.co.uk>,  Icenowy
	Zheng <zhengxingda@iscas.ac.cn>,  Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	Joshua Peisach <jpeisach@ubuntu.com>,  =?utf-8?q?Uwe_Kleine-K=C3=B6nig?=
	<u.kleine-koenig@baylibre.com>,  Michal Wilczynski
	<m.wilczynski@samsung.com>
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20260929103231eucas1p1e7b7a409de871be517c6efad3bf06881
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260929103231eucas1p1e7b7a409de871be517c6efad3bf06881
X-EPHeader: CA
X-CMS-RootMailID: 20260929103231eucas1p1e7b7a409de871be517c6efad3bf06881
References: <20260929-jh7110-clean-send-v5-0-82b4d8e3c6c7@samsung.com>
	<CGME20260929103231eucas1p1e7b7a409de871be517c6efad3bf06881@eucas1p1.samsung.com>

The pre-emphasis and drive-strength values in inno_hdmi_phy_config, and
the registers they are written to, belong to the PHY integrated into the
controller. A platform whose PHY is a separate device has neither, and
its own .mode_valid already validates the pixel clock against the real
PHY, so the table only bounds the generic check.

Let such a platform omit the table: skip the integrated-PHY register
writes in the power-up path and the table lookup in .mode_valid when it
is absent. Platforms that supply one are unaffected.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 drivers/gpu/drm/bridge/inno-hdmi.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/inno-hdmi.c b/drivers/gpu/drm/bridge/inno-hdmi.c
index 10cfdaa2891bb1a1389002d17cd0dfcec9398212..56f7d41cdae49ae872599a86799412c421158369 100644
--- a/drivers/gpu/drm/bridge/inno-hdmi.c
+++ b/drivers/gpu/drm/bridge/inno-hdmi.c
@@ -538,8 +538,14 @@ static void inno_hdmi_power_up(struct inno_hdmi *hdmi,
 			       unsigned long mpixelclock)
 {
 	struct inno_hdmi_phy_config *phy_config;
-	int ret = inno_hdmi_find_phy_config(hdmi, mpixelclock);
+	int ret;
+
+	inno_hdmi_sys_power(hdmi, false);
+
+	if (!hdmi->plat_data->phy_configs)
+		goto out;
 
+	ret = inno_hdmi_find_phy_config(hdmi, mpixelclock);
 	if (ret < 0) {
 		phy_config = hdmi->plat_data->default_phy_config;
 		DRM_DEV_ERROR(hdmi->dev,
@@ -549,8 +555,6 @@ static void inno_hdmi_power_up(struct inno_hdmi *hdmi,
 		phy_config = &hdmi->plat_data->phy_configs[ret];
 	}
 
-	inno_hdmi_sys_power(hdmi, false);
-
 	hdmi_writeb(hdmi, HDMI_PHY_PRE_EMPHASIS, phy_config->pre_emphasis);
 	hdmi_writeb(hdmi, HDMI_PHY_DRIVER, phy_config->voltage_level_control);
 	hdmi_writeb(hdmi, HDMI_PHY_SYS_CTL, 0x15);
@@ -560,6 +564,7 @@ static void inno_hdmi_power_up(struct inno_hdmi *hdmi,
 	hdmi_writeb(hdmi, HDMI_PHY_SYNC, 0x00);
 	hdmi_writeb(hdmi, HDMI_PHY_SYNC, 0x01);
 
+out:
 	inno_hdmi_sys_power(hdmi, true);
 };
 
@@ -836,7 +841,8 @@ static enum drm_mode_status inno_hdmi_bridge_mode_valid(struct drm_bridge *bridg
 	if (mpixelclk < HDMI_TMDS_CHAR_RATE_MIN_HZ)
 		return MODE_CLOCK_LOW;
 
-	if (inno_hdmi_find_phy_config(hdmi, mpixelclk) < 0)
+	if (hdmi->plat_data->phy_configs &&
+	    inno_hdmi_find_phy_config(hdmi, mpixelclk) < 0)
 		return MODE_CLOCK_HIGH;
 
 	if (plat_ops && plat_ops->mode_valid) {
@@ -1118,11 +1124,6 @@ struct inno_hdmi *inno_hdmi_probe(struct platform_device *pdev,
 	int irq;
 	int ret;
 
-	if (!plat_data->phy_configs || !plat_data->default_phy_config) {
-		dev_err(dev, "Missing platform PHY ops\n");
-		return ERR_PTR(-ENODEV);
-	}
-
 	hdmi = devm_drm_bridge_alloc(dev, struct inno_hdmi, bridge, &inno_hdmi_bridge_funcs);
 	if (IS_ERR(hdmi))
 		return ERR_CAST(hdmi);

-- 
2.34.1

