Return-Path: <maxime.ripard@free-electrons.com>
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	David Airlie <airlied@linux.ie>,
	Thierry Reding <thierry.reding@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-sunxi@googlegroups.com,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Alexander Kaplan <alex@nextthing.co>,
	Boris Brezillon <boris.brezillon@free-electrons.com>,
	Wynter Woods <wynter@nextthing.co>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	Rob Clark <robdclark@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH v2 12/26] ARM: sun5i: Add TV encoder gate to the DTSI
Date: Thu, 14 Jan 2016 16:24:55 +0100
Message-Id: <1452785109-6172-13-git-send-email-maxime.ripard@free-electrons.com>
In-Reply-To: <1452785109-6172-1-git-send-email-maxime.ripard@free-electrons.com>
References: <1452785109-6172-1-git-send-email-maxime.ripard@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

It turns out that the A13 / R8 also have a tve encoder block, and a gate
for it.

Add it to the DT.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 arch/arm/boot/dts/sun5i-a13.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/sun5i-a13.dtsi b/arch/arm/boot/dts/sun5i-a13.dtsi
index f29163650ca8..618086e0694c 100644
--- a/arch/arm/boot/dts/sun5i-a13.dtsi
+++ b/arch/arm/boot/dts/sun5i-a13.dtsi
@@ -111,8 +111,8 @@
 					<10>, <13>,
 					<14>, <20>,
 					<21>, <22>,
-				        <28>, <32>, <36>,
-				        <40>, <44>,
+					<28>, <32>, <34>,
+					<36>, <40>, <44>,
 					<46>, <51>,
 					<52>;
 			clock-output-names = "ahb_usbotg", "ahb_ehci",
@@ -121,8 +121,8 @@
 					     "ahb_mmc2", "ahb_nand",
 					     "ahb_sdram", "ahb_spi0",
 					     "ahb_spi1", "ahb_spi2",
-					     "ahb_stimer", "ahb_ve", "ahb_lcd",
-					     "ahb_csi", "ahb_de_be",
+					     "ahb_stimer", "ahb_ve", "ahb_tve",
+					     "ahb_lcd", "ahb_csi", "ahb_de_be",
 					     "ahb_de_fe", "ahb_iep",
 					     "ahb_mali400";
 		};
-- 
2.6.4
