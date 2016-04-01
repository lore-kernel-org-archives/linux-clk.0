Return-Path: <narmstrong@baylibre.com>
Return-Path: <narmstrong@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
To: linux-clk@vger.kernel.org,
	mturquette@baylibre.com,
	sjan@baylibre.com,
	ahaslam@baylibre.com,
	abailon@baylibre.com
Cc: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 4/5] dt-bindings: clock: add schrodinger clock bindings
Date: Fri,  1 Apr 2016 13:37:14 +0200
Message-Id: <1459510635-8204-5-git-send-email-narmstrong@baylibre.com>
In-Reply-To: <1459510635-8204-1-git-send-email-narmstrong@baylibre.com>
References: <1459510635-8204-1-git-send-email-narmstrong@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../devicetree/bindings/clock/schrodinger.txt          | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/schrodinger.txt

diff --git a/Documentation/devicetree/bindings/clock/schrodinger.txt b/Documentation/devicetree/bindings/clock/schrodinger.txt
new file mode 100644
index 0000000..ecb1a51
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/schrodinger.txt
@@ -0,0 +1,18 @@
+Binding for schrodinger Quantum clock sources.
+
+This binding uses the common clock binding[1].
+
+[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
+
+Required properties:
+- compatible : shall be "schrodinger-clock".
+- #clock-cells : from common clock binding; shall be set to 0.
+
+Optional properties:
+- clock-output-names : From common clock binding.
+
+Example:
+	cat {
+		compatible = "schrodinger-clock";
+		#clock-cells = <0>;
+	};
-- 
1.9.1
