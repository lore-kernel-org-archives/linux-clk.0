Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E2E5158A7;
	Tue, 29 Sep 2026 10:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790677986; cv=none; b=d9+e2wD839BzN/2Aq85vzsipI20LupoOvi/7nyuzKdX6sk7nFp7E6Z2oNIFQE7PMo338PB93JldIh3OJ+3oCMEaDzMYw5bhHwRdZdJilF+tn2gug6ldXg8NXf3IhWqX5vTIaoZdsWYwqdXnJETLGluyKarGWVA4zm+RGh71023E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790677986; c=relaxed/simple;
	bh=hDZdokczyVzCHMRjtasitcfQ9zoUg+OG5GqWVshh4CA=;
	h=From:Date:Subject:MIME-Version:Message-Id:In-Reply-To:To:Cc:
	 Content-Type:References; b=Oes6wNAZgxFlj9hM/wh4Wu4KYzvEGJU/a3pMJuEaquUZQl6cnRMwVhVBUll+NV0Zjv6MHBIxpzE1pSwXLuSwoslix9upyJ2WYvvVfBA+DRJ4BTOK1VUHo5EPAP5jiNvAilEODlr2uCJyKHPwx2BOBt7bAuHxJcU/LiuLWDepE/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Dip6HfjT; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Dip6HfjT"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260929103250euoutp028c99beba02b74f50a7961d4572873ae2~ZxCCLUUT12627126271euoutp02i;
	Tue, 29 Sep 2026 10:32:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260929103250euoutp028c99beba02b74f50a7961d4572873ae2~ZxCCLUUT12627126271euoutp02i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1790677970;
	bh=r457fqQsZjuEuXBSPoj5rDr27WgbPfP74A0q9KhjNco=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=Dip6HfjTv58iDU4hbp+FJ2c/oDjy6s9wK+vNapH0RJIEEwt6gCQhSb7eizZwa72W7
	 Ms5RYbVo4eIHF1XULMAu1EBZ+VsSk1ovtFdO0W0gTPrmLPuxlQktRqR7FBaXszWrF+
	 vTR+J7nxi31ygx3i4M7gyzUbHyZS1jbfhlU2jwic=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260929103250eucas1p1ea04d70d2cc6c4ddfe11e596ea9814a1~ZxCBhfDIO0556805568eucas1p1V;
	Tue, 29 Sep 2026 10:32:50 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260929103247eusmtip131972b1ab22df47a0a0b5e5a1dbd5012~ZxB-HaPDZ2959829598eusmtip1X;
	Tue, 29 Sep 2026 10:32:47 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Tue, 29 Sep 2026 12:31:18 +0200
Subject: [PATCH v5 21/21] MAINTAINERS: Add StarFive JH7110 display subsystem
 entry
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-jh7110-clean-send-v5-21-82b4d8e3c6c7@samsung.com>
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
X-CMS-MailID: 20260929103250eucas1p1ea04d70d2cc6c4ddfe11e596ea9814a1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260929103250eucas1p1ea04d70d2cc6c4ddfe11e596ea9814a1
X-EPHeader: CA
X-CMS-RootMailID: 20260929103250eucas1p1ea04d70d2cc6c4ddfe11e596ea9814a1
References: <20260929-jh7110-clean-send-v5-0-82b4d8e3c6c7@samsung.com>
	<CGME20260929103250eucas1p1ea04d70d2cc6c4ddfe11e596ea9814a1@eucas1p1.samsung.com>

The JH7110 display subsystem spans a PHY driver, a DRM bridge driver,
a parent device and their bindings, and has no existing maintainer entry.

Add an entry covering them so patches reach someone who can review them.

Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 MAINTAINERS | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 72294ddfa5b757f805640919e3d6d5d7c4c48582..bd0a485744864cb713be759911c62442f0ffdaa5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26076,6 +26076,19 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
 F:	drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
 
+STARFIVE JH7110 DISPLAY SUBSYSTEM
+M:	Michal Wilczynski <m.wilczynski@samsung.com>
+R:	Icenowy Zheng <zhengxingda@iscas.ac.cn>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/bridge/starfive,jh7110-inno-hdmi-controller.yaml
+F:	Documentation/devicetree/bindings/phy/starfive,jh7110-inno-hdmi-phy.yaml
+F:	Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-hdmi-subsystem.yaml
+F:	Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-vout-subsystem.yaml
+F:	drivers/gpu/drm/bridge/jh7110-inno-hdmi.c
+F:	drivers/phy/starfive/phy-jh7110-inno-hdmi.c
+F:	drivers/soc/starfive/jh7110-hdmi-subsystem.c
+F:	drivers/soc/starfive/jh7110-vout-subsystem.c
+
 STARFIVE JH7110 DPHY RX DRIVER
 M:	Jack Zhu <jack.zhu@starfivetech.com>
 M:	Changhuang Liang <changhuang.liang@starfivetech.com>

-- 
2.34.1

