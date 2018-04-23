Return-Path: <matthias.bgg@kernel.org>
From: matthias.bgg@kernel.org
To: ulrich.hecht+renesas@gmail.com,
	laurent.pinchart@ideasonboard.com,
	ck.hu@mediatek.com,
	p.zabel@pengutronix.de,
	airlied@linux.ie,
	robh+dt@kernel.org,
	mark.rutland@arm.com,
	mturquette@baylibre.com,
	sboyd@codeaurora.org,
	lee.jones@linaro.org
Cc: davem@davemloft.net,
	gregkh@linuxfoundation.org,
	mchehab@kernel.org,
	rdunlap@infradead.org,
	pi-cheng.chen@linaro.org,
	sean.wang@mediatek.com,
	linux-clk@vger.kernel.org,
	linux@armlinux.org.uk,
	matthias.bgg@gmail.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <mbrugger@suse.com>
Subject: [v2 10/10] MAINTAINERS: update Mediatek Soc entry
Date: Mon, 23 Apr 2018 18:13:59 +0200
Message-Id: <0fd5bf87d227fdb44bd0ddd2f83c5595380957fb.1524497268.git.mbrugger@suse.com>
In-Reply-To: <cover.1524497268.git.mbrugger@suse.com>
References: <cover.1524497268.git.mbrugger@suse.com>
In-Reply-To: <cover.1524497268.git.mbrugger@suse.com>
References: <cover.1524497268.git.mbrugger@suse.com>
List-ID: <linux-clk.vger.kernel.org>

From: Matthias Brugger <mbrugger@suse.com>

Mediatek SoCs include several soc specific drivers as well
as a mfd device. Add these to the maintainers file.

Signed-off-by: Matthias Brugger <mbrugger@suse.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0a1410d5a621..74f7ea345096 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1621,6 +1621,8 @@ F:	arch/arm/boot/dts/mt7*
 F:	arch/arm/boot/dts/mt8*
 F:	arch/arm/mach-mediatek/
 F:	arch/arm64/boot/dts/mediatek/
+F:	drivers/soc/mediatek/
+F:	drivers/mfd/mtk-mmsys.c
 N:	mtk
 K:	mediatek
 
-- 
2.16.3
