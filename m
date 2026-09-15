Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13804ACC8C;
	Tue, 15 Sep 2026 15:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789486358; cv=none; b=XtLd7emMJJPfaCT4ENYQjqAMn3dfqHuRM9jZ6/e0zaszbIVLHoiiRtmC4x2PxIPplRX8TG6jn5Nr1lDtsTfLDDzeggVmR0Lh6bzh/Rn1ukk+c3HfDL2HsODLzxgZmxHC8UbHsbcUYoL3vIRhGxWCKDhkbvljha6ziSerXiBYBAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789486358; c=relaxed/simple;
	bh=AjVlS3078hJJvqFAMwKP30lDqYxZ0LgWGdnJu/ORXNM=;
	h=From:Date:Subject:MIME-Version:Message-Id:In-Reply-To:To:Cc:
	 Content-Type:References; b=oF9ubcTJwR9qYpvgTl0l0KysRxT8dlHYBfHYXNn9ACeNCYVmivy4EqMbsEkK02gxtrb3tFCQf6cvtPE/Eg8sdw5tHTgcHF1baFxP89dBLSVvhw4Huo6ls8HyhWBd+JiihI/oGhXyRHw3N4uS65JHw57wU1xp0vDlZXUa4s+BGns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=RsWwEmyb; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="RsWwEmyb"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260915153230euoutp028e72443038f7f1983c8543776fb898ab~ViFqxIVTb0389103891euoutp02T;
	Tue, 15 Sep 2026 15:32:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260915153230euoutp028e72443038f7f1983c8543776fb898ab~ViFqxIVTb0389103891euoutp02T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1789486350;
	bh=Bs5zHxpobqcI/79TsVELfJrlV+3TKjYDXQ0ZEWhE0S4=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=RsWwEmybH6srBidtOs+4BqSLlL2XXiVoPA6iTlb6l0EdoY5+199PiHwIqM5ubfv+p
	 E9B4VbXrskB5yIBUVs+fukbZekVbj0knOHyeZn89MaOW38aZ17nG07uyuBU24KFEjy
	 FpbVCP2DcTIxVsCYUEgn9HJlY7Iy6WikYx5meeac=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260915153229eucas1p2d1b02b6f3871d6b536f678b9ea293c1c~ViFqeaNRJ1216312163eucas1p2W;
	Tue, 15 Sep 2026 15:32:29 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260915153227eusmtip1beea089f8c4c4e18ab297a0a1e6c6291~ViFovWdGk0419004190eusmtip1o;
	Tue, 15 Sep 2026 15:32:27 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Tue, 15 Sep 2026 17:32:17 +0200
Subject: [PATCH v4 09/20] drm/bridge: inno-hdmi: Add .disable platform
 operation
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-jh7110-clean-send-v4-9-f0e4fd6f2cc8@samsung.com>
In-Reply-To: <20260915-jh7110-clean-send-v4-0-f0e4fd6f2cc8@samsung.com>
To: Vinod Koul <vkoul@kernel.org>,  Neil Armstrong
	<neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,  Krzysztof
	Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>, Andrzej
	Hajda <andrzej.hajda@intel.com>,  Robert Foss <rfoss@kernel.org>,  Laurent
	Pinchart <Laurent.pinchart@ideasonboard.com>,  Jonas Karlman
	<jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,  Luca Ceresoli
	<luca.ceresoli@bootlin.com>,  Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,  Lee Jones <lee@kernel.org>, Andy
	Yan <andy.yan@rock-chips.com>,  Philipp Zabel <p.zabel@pengutronix.de>, 
	Emil Renner Berthing <kernel@esmil.dk>,  Hal Feng
	<hal.feng@starfivetech.com>,  Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Heiko Stuebner <heiko@sntech.de>,  Paul
	Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,  Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,  Dominique
	Belhachemi <db@domibel.de>, Brian Masney <bmasney+clk@redhat.com>,  Jerome
	Brunet <jbrunet+clk@baylibre.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	mfd@lists.linux.dev, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-riscv@lists.infradead.org,  Marek Szyprowski
	<m.szyprowski@samsung.com>,  Maud Spierings <maud_spierings@murena.io>, 
	Graham Markall <hello@big-grey.co.uk>,  Icenowy Zheng
	<zhengxingda@iscas.ac.cn>,  Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	Joshua Peisach <jpeisach@ubuntu.com>,  =?utf-8?q?Uwe_Kleine-K=C3=B6nig?=
	<u.kleine-koenig@baylibre.com>,  Michal Wilczynski
	<m.wilczynski@samsung.com>
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20260915153229eucas1p2d1b02b6f3871d6b536f678b9ea293c1c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260915153229eucas1p2d1b02b6f3871d6b536f678b9ea293c1c
X-EPHeader: CA
X-CMS-RootMailID: 20260915153229eucas1p2d1b02b6f3871d6b536f678b9ea293c1c
References: <20260915-jh7110-clean-send-v4-0-f0e4fd6f2cc8@samsung.com>
	<CGME20260915153229eucas1p2d1b02b6f3871d6b536f678b9ea293c1c@eucas1p2.samsung.com>

The Innosilicon HDMI driver supports platform-specific behavior through
the `inno_hdmi_plat_ops`. While it provides an `.enable` hook for
platform-specific power up sequences (like enabling PHYs), it lacks a
corresponding hook for power down.

This patch adds a new `.disable` op to the `inno_hdmi_plat_ops` struct
and calls it at the beginning of `inno_hdmi_bridge_atomic_disable()`.

This allows platform specific drivers, such as the StarFive JH7110,
to implement their own power down sequence (e.g., calling
phy_power_off() and clk_disable_unprepare()).

Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 drivers/gpu/drm/bridge/inno-hdmi.c | 4 ++++
 include/drm/bridge/inno_hdmi.h     | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/bridge/inno-hdmi.c b/drivers/gpu/drm/bridge/inno-hdmi.c
index 1264152fb1434acda584e4af3d54e4986b57aa3e..06917e83c5e530d158a06ae2a877e78e22ed842d 100644
--- a/drivers/gpu/drm/bridge/inno-hdmi.c
+++ b/drivers/gpu/drm/bridge/inno-hdmi.c
@@ -886,6 +886,10 @@ static void inno_hdmi_bridge_atomic_disable(struct drm_bridge *bridge,
 					    struct drm_atomic_commit *state)
 {
 	struct inno_hdmi *hdmi = bridge_to_inno_hdmi(bridge);
+	const struct inno_hdmi_plat_ops *plat_ops = hdmi->plat_data->ops;
+
+	if (plat_ops && plat_ops->disable)
+		plat_ops->disable(hdmi->dev);
 
 	inno_hdmi_standby(hdmi);
 }
diff --git a/include/drm/bridge/inno_hdmi.h b/include/drm/bridge/inno_hdmi.h
index 81da9d9bcd79db8fe26c6dff4569371e484df608..5fca651c56b056d814124aa9c7e91aa7fd7ed1cd 100644
--- a/include/drm/bridge/inno_hdmi.h
+++ b/include/drm/bridge/inno_hdmi.h
@@ -16,6 +16,7 @@ struct platform_device;
 
 struct inno_hdmi_plat_ops {
 	void (*enable)(struct device *pdev, struct drm_display_mode *mode);
+	void (*disable)(struct device *pdev);
 };
 
 struct inno_hdmi_phy_config {

-- 
2.34.1

