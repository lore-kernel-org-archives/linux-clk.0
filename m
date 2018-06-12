Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
From: Jernej Skrabec <jernej.skrabec@siol.net>
To: maxime.ripard@bootlin.com,
	wens@csie.org,
	robh+dt@kernel.org
Subject: [PATCH v2 06/27] drm/sun4i: Fix releasing node when enumerating
 enpoints
Date: Tue, 12 Jun 2018 22:00:15 +0200
Message-Id: <20180612200036.21483-7-jernej.skrabec@siol.net>
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

sun4i_drv_add_endpoints() has a memory leak since it uses of_node_put()
when remote is equal to NULL and does nothing when remote has a valid
pointer.

Invert the logic to fix memory leak.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/gpu/drm/sun4i/sun4i_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
index 50d19605c38f..e15fa2389e3f 100644
--- a/drivers/gpu/drm/sun4i/sun4i_drv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
@@ -283,7 +283,6 @@ static int sun4i_drv_add_endpoints(struct device *dev,
 		remote = of_graph_get_remote_port_parent(ep);
 		if (!remote) {
 			DRM_DEBUG_DRIVER("Error retrieving the output node\n");
-			of_node_put(remote);
 			continue;
 		}
 
@@ -297,11 +296,13 @@ static int sun4i_drv_add_endpoints(struct device *dev,
 
 			if (of_graph_parse_endpoint(ep, &endpoint)) {
 				DRM_DEBUG_DRIVER("Couldn't parse endpoint\n");
+				of_node_put(remote);
 				continue;
 			}
 
 			if (!endpoint.id) {
 				DRM_DEBUG_DRIVER("Endpoint is our panel... skipping\n");
+				of_node_put(remote);
 				continue;
 			}
 		}
-- 
2.17.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
