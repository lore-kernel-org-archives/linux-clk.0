Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Icenowy Zheng <icenowy@aosc.io>
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
        Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-sunxi@googlegroups.com,
        Icenowy Zheng <icenowy@aosc.io>
Subject: [RFC PATCH 05/11] drm: sun4i: add compatible for H3 display engine
Date: Thu, 18 May 2017 00:43:48 +0800
Message-Id: <20170517164354.16399-6-icenowy@aosc.io>
In-Reply-To: <20170517164354.16399-1-icenowy@aosc.io>
References: <20170517164354.16399-1-icenowy@aosc.io>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Add a compatible string for H3 display engine in sun4i_drv code.

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
---
 drivers/gpu/drm/sun4i/sun4i_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
index 29bf1325ded6..c0de0741c923 100644
--- a/drivers/gpu/drm/sun4i/sun4i_drv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
@@ -324,6 +324,7 @@ static const struct of_device_id sun4i_drv_of_table[] = {
 	{ .compatible = "allwinner,sun6i-a31-display-engine" },
 	{ .compatible = "allwinner,sun6i-a31s-display-engine" },
 	{ .compatible = "allwinner,sun8i-a33-display-engine" },
+	{ .compatible = "allwinner,sun8i-h3-display-engine" },
 	{ .compatible = "allwinner,sun8i-v3s-display-engine" },
 	{ }
 };
-- 
2.12.2
