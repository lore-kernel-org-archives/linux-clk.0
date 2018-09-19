Return-Path: <andy.tang@nxp.com>
From: andy.tang@nxp.com
To: mturquette@baylibre.com,
	oss@buserror.net
Cc: sboyd@kernel.org,
	robh+dt@kernel.org,
	mark.rutland@arm.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Yuantian Tang <andy.tang@nxp.com>
Subject: [PATCH 1/3] clk: qoriq: add t1023 soc support
Date: Wed, 19 Sep 2018 15:39:04 +0800
Message-Id: <20180919073906.34187-1-andy.tang@nxp.com>
List-ID: <linux-clk.vger.kernel.org>

From: Yuantian Tang <andy.tang@nxp.com>

Add t1023 clock compatible string to the bindings.

Signed-off-by: Tang Yuantian <andy.tang@nxp.com>
---
 .../devicetree/bindings/clock/qoriq-clock.txt      |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qoriq-clock.txt b/Documentation/devicetree/bindings/clock/qoriq-clock.txt
index 97f46ad..34e1933 100644
--- a/Documentation/devicetree/bindings/clock/qoriq-clock.txt
+++ b/Documentation/devicetree/bindings/clock/qoriq-clock.txt
@@ -37,6 +37,7 @@ Required properties:
 	* "fsl,ls1046a-clockgen"
 	* "fsl,ls1088a-clockgen"
 	* "fsl,ls2080a-clockgen"
+	* "fsl,t1023-clockgen"
 	Chassis-version clock strings include:
 	* "fsl,qoriq-clockgen-1.0": for chassis 1.0 clocks
 	* "fsl,qoriq-clockgen-2.0": for chassis 2.0 clocks
-- 
1.7.1
