Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
From: Icenowy Zheng <icenowy@aosc.io>
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
 Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [PATCH 08/13] [NOT FOR REVIEW NOW] drm: bridge: Enable polling hpd
 event in dw_hdmi
Date: Tue,  1 Aug 2017 21:12:59 +0800
Message-Id: <20170801131304.7741-9-icenowy@aosc.io>
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
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

From: Jernej Skrabec <jernej.skrabec@siol.net>

Some custom phys don't support hpd interrupts. Add support for polling
such events.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 60faf2d2bc6b..6c6466c6297c 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -1942,7 +1942,11 @@ static int dw_hdmi_bridge_attach(struct drm_bridge *bridge)
 	struct drm_connector *connector = &hdmi->connector;
 
 	connector->interlace_allowed = 1;
-	connector->polled = DRM_CONNECTOR_POLL_HPD;
+	if (hdmi->phy.ops->setup_hpd)
+		connector->polled = DRM_CONNECTOR_POLL_HPD;
+	else
+		connector->polled = DRM_CONNECTOR_POLL_CONNECT |
+				    DRM_CONNECTOR_POLL_DISCONNECT;
 
 	drm_connector_helper_add(connector, &dw_hdmi_connector_helper_funcs);
 
-- 
2.13.0


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
