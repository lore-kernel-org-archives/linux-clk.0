Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
From: Jernej Skrabec <jernej.skrabec@siol.net>
To: maxime.ripard@bootlin.com,
	wens@csie.org,
	robh+dt@kernel.org
Subject: [PATCH v2 09/27] drm/sun4i: Don't skip TCONs if they don't have
 channel 0
Date: Tue, 12 Jun 2018 22:00:18 +0200
Message-Id: <20180612200036.21483-10-jernej.skrabec@siol.net>
In-Reply-To: <20180612200036.21483-1-jernej.skrabec@siol.net>
References: <20180612200036.21483-1-jernej.skrabec@siol.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, airlied@linux.ie,
 gustavo@padovan.org, maarten.lankhorst@linux.intel.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-sunxi@googlegroups.com, seanpaul@chromium.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

TV TCONs (channel 1 only) are always connected to TV or HDMI encoder.
Because of that, all output endpoints on such TCON node will point to a
encoder which is part of component framework.

Correct current graph traversing algorithm in such way that it doesn't
skip output enpoints with id 0 on TV TCONs.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/gpu/drm/sun4i/sun4i_drv.c | 52 +++++++++++++++++++++----------
 1 file changed, 35 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
index e6c62c079146..6ddf4eaccb40 100644
--- a/drivers/gpu/drm/sun4i/sun4i_drv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
@@ -198,6 +198,22 @@ static bool sun4i_drv_node_is_tcon(struct device_node *node)
 	return !!of_match_node(sun4i_tcon_of_table, node);
 }
 
+static bool sun4i_drv_node_is_tcon_with_ch0(struct device_node *node)
+{
+	const struct of_device_id *match;
+
+	match = of_match_node(sun4i_tcon_of_table, node);
+	if (match) {
+		struct sun4i_tcon_quirks *quirks;
+
+		quirks = (struct sun4i_tcon_quirks *)match->data;
+
+		return quirks->has_channel_0;
+	}
+
+	return false;
+}
+
 static bool sun4i_drv_node_is_tcon_top(struct device_node *node)
 {
 	return !!of_match_node(sun8i_tcon_top_of_table, node);
@@ -256,14 +272,7 @@ static void sun4i_drv_traverse_endpoints(struct endpoint_list *list,
 			continue;
 		}
 
-		/*
-		 * If the node is our TCON, the first port is used for
-		 * panel or bridges, and will not be part of the
-		 * component framework.
-		 */
 		if (sun4i_drv_node_is_tcon(node)) {
-			struct of_endpoint endpoint;
-
 			/*
 			 * TCON TOP is always probed before TCON. However, TCON
 			 * points back to TCON TOP when it is source for HDMI.
@@ -276,16 +285,25 @@ static void sun4i_drv_traverse_endpoints(struct endpoint_list *list,
 				continue;
 			}
 
-			if (of_graph_parse_endpoint(ep, &endpoint)) {
-				DRM_DEBUG_DRIVER("Couldn't parse endpoint\n");
-				of_node_put(remote);
-				continue;
-			}
-
-			if (!endpoint.id) {
-				DRM_DEBUG_DRIVER("Endpoint is our panel... skipping\n");
-				of_node_put(remote);
-				continue;
+			/*
+			 * If the node is our TCON with channel 0, the first
+			 * port is used for panel or bridges, and will not be
+			 * part of the component framework.
+			 */
+			if (sun4i_drv_node_is_tcon_with_ch0(node)) {
+				struct of_endpoint endpoint;
+
+				if (of_graph_parse_endpoint(ep, &endpoint)) {
+					DRM_DEBUG_DRIVER("Couldn't parse endpoint\n");
+					of_node_put(remote);
+					continue;
+				}
+
+				if (!endpoint.id) {
+					DRM_DEBUG_DRIVER("Endpoint is our panel... skipping\n");
+					of_node_put(remote);
+					continue;
+				}
 			}
 		}
 
-- 
2.17.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
