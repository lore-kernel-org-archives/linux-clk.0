Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
From: Jernej Skrabec <jernej.skrabec@siol.net>
To: maxime.ripard@bootlin.com,
	wens@csie.org,
	robh+dt@kernel.org
Subject: [PATCH 04/15] dt-bindings: display: sunxi-drm: Add TCON TOP
 description
Date: Sat, 19 May 2018 20:31:16 +0200
Message-Id: <20180519183127.2718-5-jernej.skrabec@siol.net>
In-Reply-To: <20180519183127.2718-1-jernej.skrabec@siol.net>
References: <20180519183127.2718-1-jernej.skrabec@siol.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-sunxi@googlegroups.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

TCON TOP main purpose is to configure whole display pipeline. It
determines relationships between mixers and TCONs, selects source TCON
for HDMI, muxes LCD and TV encoder GPIO output, selects TV encoder
clock source and contains additional TV TCON and DSI gates.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 .../bindings/display/sunxi/sun4i-drm.txt      | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
index 3346c1e2a7a0..a099957ab62a 100644
--- a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
+++ b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
@@ -187,6 +187,26 @@ And on the A23, A31, A31s and A33, you need one more clock line:
    - 'lvds-alt': An alternative clock source, separate from the TCON channel 0
                  clock, that can be used to drive the LVDS clock
 
+TCON TOP
+--------
+
+TCON TOPs main purpose is to configure whole display pipeline. It determines
+relationships between mixers and TCONs, selects source TCON for HDMI, muxes
+LCD and TV encoder GPIO output, selects TV encoder clock source and contains
+additional TV TCON and DSI gates.
+
+Required properties:
+  - compatible: value must be one of:
+    * allwinner,sun8i-r40-tcon-top
+  - reg: base address and size of the memory-mapped region.
+  - clocks: phandle to the clocks feeding the TCON TOP
+    * bus: TCON TOP interface clock
+  - clock-names: clock name mentioned above
+  - resets: phandle to the reset line driving the DRC
+    * rst: TCON TOP reset line
+  - reset-names: reset name mentioned above
+  - #clock-cells : must contain 1
+
 DRC
 ---
 
-- 
2.17.0


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
