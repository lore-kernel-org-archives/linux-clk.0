Return-Path: <maxime.ripard@free-electrons.com>
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	David Airlie <airlied@linux.ie>,
	Thierry Reding <thierry.reding@gmail.com>
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
	Wynter Woods <wynter@nextthing.co>,
	Boris Brezillon <boris.brezillon@free-electrons.com>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	Rob Clark <robdclark@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH 06/19] clk: sunxi: Add Allwinner R8 AHB gates support
Date: Fri, 30 Oct 2015 15:20:52 +0100
Message-Id: <1446214865-3972-7-git-send-email-maxime.ripard@free-electrons.com>
In-Reply-To: <1446214865-3972-1-git-send-email-maxime.ripard@free-electrons.com>
References: <1446214865-3972-1-git-send-email-maxime.ripard@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

The R8 has yet another array of gates for AHB. Let's add it to the list of
compatibles we can deal with.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 drivers/clk/sunxi/clk-simple-gates.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/sunxi/clk-simple-gates.c b/drivers/clk/sunxi/clk-simple-gates.c
index 5666c767fa14..e3190a8687a8 100644
--- a/drivers/clk/sunxi/clk-simple-gates.c
+++ b/drivers/clk/sunxi/clk-simple-gates.c
@@ -158,5 +158,7 @@ CLK_OF_DECLARE(sun5i_a10s_ahb, "allwinner,sun5i-a10s-ahb-gates-clk",
 	       sun4i_a10_ahb_init);
 CLK_OF_DECLARE(sun5i_a13_ahb, "allwinner,sun5i-a13-ahb-gates-clk",
 	       sun4i_a10_ahb_init);
+CLK_OF_DECLARE(sun5i_r8_ahb, "allwinner,sun5i-r8-ahb-gates-clk",
+	       sun4i_a10_ahb_init);
 CLK_OF_DECLARE(sun7i_a20_ahb, "allwinner,sun7i-a20-ahb-gates-clk",
 	       sun4i_a10_ahb_init);
-- 
2.6.2
