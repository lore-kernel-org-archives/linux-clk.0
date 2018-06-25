Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
From: Jernej Skrabec <jernej.skrabec@siol.net>
To: maxime.ripard@bootlin.com,
	wens@csie.org,
	robh+dt@kernel.org
Subject: [PATCH v3 08/24] drm/sun4i: Add support for traversing graph with
 TCON TOP
Date: Mon, 25 Jun 2018 14:02:48 +0200
Message-Id: <20180625120304.7543-9-jernej.skrabec@siol.net>
In-Reply-To: <20180625120304.7543-1-jernej.skrabec@siol.net>
References: <20180625120304.7543-1-jernej.skrabec@siol.net>
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

TCON TOP is different from other nodes in graph by having 3 input and 3
output ports. Additionally, connection to TV TCON might lead back to
HDMI mux input port, creating loops.

Add support for traversing such graph.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/gpu/drm/sun4i/sun4i_drv.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
index 20193d6f33ba..e6c62c079146 100644
--- a/drivers/gpu/drm/sun4i/sun4i_drv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
@@ -26,6 +26,7 @@
 #include "sun4i_frontend.h"
 #include "sun4i_framebuffer.h"
 #include "sun4i_tcon.h"
+#include "sun8i_tcon_top.h"
 
 DEFINE_DRM_GEM_CMA_FOPS(sun4i_drv_fops);
 
@@ -197,6 +198,11 @@ static bool sun4i_drv_node_is_tcon(struct device_node *node)
 	return !!of_match_node(sun4i_tcon_of_table, node);
 }
 
+static bool sun4i_drv_node_is_tcon_top(struct device_node *node)
+{
+	return !!of_match_node(sun8i_tcon_top_of_table, node);
+}
+
 static int compare_of(struct device *dev, void *data)
 {
 	DRM_DEBUG_DRIVER("Comparing of node %pOF with %pOF\n",
@@ -258,6 +264,18 @@ static void sun4i_drv_traverse_endpoints(struct endpoint_list *list,
 		if (sun4i_drv_node_is_tcon(node)) {
 			struct of_endpoint endpoint;
 
+			/*
+			 * TCON TOP is always probed before TCON. However, TCON
+			 * points back to TCON TOP when it is source for HDMI.
+			 * We have to skip it here to prevent infinite looping
+			 * between TCON TOP and TCON.
+			 */
+			if (sun4i_drv_node_is_tcon_top(remote)) {
+				DRM_DEBUG_DRIVER("TCON output endpoint is TCON TOP... skipping\n");
+				of_node_put(remote);
+				continue;
+			}
+
 			if (of_graph_parse_endpoint(ep, &endpoint)) {
 				DRM_DEBUG_DRIVER("Couldn't parse endpoint\n");
 				of_node_put(remote);
@@ -318,6 +336,12 @@ static int sun4i_drv_add_endpoints(struct device *dev,
 	/* each node has at least one output */
 	sun4i_drv_traverse_endpoints(list, node, 1);
 
+	/* TCON TOP has second and third output */
+	if (sun4i_drv_node_is_tcon_top(node)) {
+		sun4i_drv_traverse_endpoints(list, node, 3);
+		sun4i_drv_traverse_endpoints(list, node, 5);
+	}
+
 	return count;
 }
 
-- 
2.18.0


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
