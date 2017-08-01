Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
From: Icenowy Zheng <icenowy@aosc.io>
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
 Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [PATCH 02/13] drm: sun4i: add support for H3 mixers
Date: Tue,  1 Aug 2017 21:12:53 +0800
Message-Id: <20170801131304.7741-3-icenowy@aosc.io>
In-Reply-To: <20170801131304.7741-1-icenowy@aosc.io>
References: <20170801131304.7741-1-icenowy@aosc.io>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com,
 Icenowy Zheng <icenowy@aosc.xyz>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

From: Icenowy Zheng <icenowy@aosc.xyz>

Allwinner H3 SoC has two mixers, one has 1 VI channel and 3 UI channels,
and the other has 1 VI and 1 UI. There's also some graphics post-process
function that is missing on mixer1, however, as we currently support
none of these functions, the only difference that is shown to us is the
channel number difference.

Add support for these two variants.

Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index cb193c5f1686..d658a3a8159a 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -390,11 +390,29 @@ static const struct sun8i_mixer_cfg sun8i_v3s_mixer_cfg = {
 	.ui_num = 1,
 };
 
+static const struct sun8i_mixer_cfg sun8i_h3_mixer0_cfg = {
+	.vi_num = 1,
+	.ui_num = 3,
+};
+
+static const struct sun8i_mixer_cfg sun8i_h3_mixer1_cfg = {
+	.vi_num = 1,
+	.ui_num = 1,
+};
+
 static const struct of_device_id sun8i_mixer_of_table[] = {
 	{
 		.compatible = "allwinner,sun8i-v3s-de2-mixer",
 		.data = &sun8i_v3s_mixer_cfg,
 	},
+	{
+		.compatible = "allwinner,sun8i-h3-de2-mixer0",
+		.data = &sun8i_h3_mixer0_cfg
+	},
+	{
+		.compatible = "allwinner,sun8i-h3-de2-mixer1",
+		.data = &sun8i_h3_mixer1_cfg
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sun8i_mixer_of_table);
-- 
2.13.0


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
