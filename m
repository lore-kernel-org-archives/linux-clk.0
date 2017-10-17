Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH 08/23] dt-bindings: panel: lvds: Document power-supply property
Date: Tue, 17 Oct 2017 11:06:15 +0200
Message-Id: <89bee8042b5fa50c8c3dbf52cc0c14b34beef9df.1508231063.git-series.maxime.ripard@free-electrons.com>
In-Reply-To: <cover.fe3d65d1ee05a55224d26e7d113388c428592b26.1508231063.git-series.maxime.ripard@free-electrons.com>
References: <cover.fe3d65d1ee05a55224d26e7d113388c428592b26.1508231063.git-series.maxime.ripard@free-electrons.com>
In-Reply-To: <cover.fe3d65d1ee05a55224d26e7d113388c428592b26.1508231063.git-series.maxime.ripard@free-electrons.com>
References: <cover.fe3d65d1ee05a55224d26e7d113388c428592b26.1508231063.git-series.maxime.ripard@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, plaes@plaes.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Quentin Schulz <quentin.schulz@free-electrons.com>,
 Rob Herring <robh+dt@kernel.org>,
 Mylene Josserand <mylene.josserand@free-electrons.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 icenowy@aosc.io
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

The power-supply property is used be a vast majority of panels, including
panel-simple. Let's document it as a common property

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 Documentation/devicetree/bindings/display/panel/panel-common.txt | 6 ++++++
 Documentation/devicetree/bindings/display/panel/panel-lvds.txt   | 1 +
 2 files changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-common.txt b/Documentation/devicetree/bindings/display/panel/panel-common.txt
index ec52c472c845..125ea68052af 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-common.txt
+++ b/Documentation/devicetree/bindings/display/panel/panel-common.txt
@@ -78,6 +78,12 @@ used for panels that implement compatible control signals.
   while active. Active high reset signals can be supported by inverting the
   GPIO specifier polarity flag.
 
+Power
+-----
+
+- power-supply: many display panels need an additional power supply in
+  order to be fully powered-up. For such panels, power-supply contains
+  a phandle to the regulator powering the panel.
 
 Backlight
 ---------
diff --git a/Documentation/devicetree/bindings/display/panel/panel-lvds.txt b/Documentation/devicetree/bindings/display/panel/panel-lvds.txt
index b938269f841e..250850a2150b 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-lvds.txt
+++ b/Documentation/devicetree/bindings/display/panel/panel-lvds.txt
@@ -32,6 +32,7 @@ Optional properties:
 - label: See panel-common.txt.
 - gpios: See panel-common.txt.
 - backlight: See panel-common.txt.
+- power-supply: See panel-common.txt.
 - data-mirror: If set, reverse the bit order described in the data mappings
   below on all data lanes, transmitting bits for slots 6 to 0 instead of
   0 to 6.
-- 
git-series 0.9.1

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
