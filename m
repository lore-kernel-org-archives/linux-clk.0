Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
From: Lars Persson <lars.persson@axis.com>
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: [PATCH 1/8] clk: add device tree binding for artpec-6 pll1 clock
Date: Wed, 10 Feb 2016 13:41:50 +0100
Message-Id: <c092f501a595032f9b76f18fc4bf093503a181c8.1455107681.git.larper@axis.com>
In-Reply-To: <cover.1455107681.git.larper@axis.com>
References: <cover.1455107681.git.larper@axis.com>
In-Reply-To: <cover.1455107681.git.larper@axis.com>
References: <cover.1455107681.git.larper@axis.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk,
 Lars Persson <larper@axis.com>, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, galak@codeaurora.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

Signed-off-by: Lars Persson <larper@axis.com>
---
 Documentation/devicetree/bindings/clock/artpec6.txt | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/artpec6.txt

diff --git a/Documentation/devicetree/bindings/clock/artpec6.txt b/Documentation/devicetree/bindings/clock/artpec6.txt
new file mode 100644
index 0000000..e50f7a5
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/artpec6.txt
@@ -0,0 +1,14 @@
+* Clock bindings for Axis ARTPEC-6 chip
+
+Required properties:
+- compatible: Should be "axis,artpec6-pll1-clock"
+- #clock-cells: Should be <1>
+
+Examples:
+
+pll1_clk: pll1_clk {
+	#clock-cells = <1>;
+	compatible = "axis,artpec6-pll1-clock";
+	clocks = <&ext_clk>;
+	status = "okay";
+};
-- 
2.1.4


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
