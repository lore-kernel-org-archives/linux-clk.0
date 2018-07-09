Return-Path: <Jian.Hu@amlogic.com>
From: Jian Hu <jian.hu@amlogic.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong
	<narmstrong@baylibre.com>
CC: Jian Hu <jian.hu@amlogic.com>, Kevin Hilman <khilman@baylibre.com>, "Carlo
 Caione" <carlo@caione.org>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Yixun Lan <yixun.lan@amlogic.com>, "Qiufang
 Dai" <qiufang.dai@amlogic.com>, Bo.yang <bo.yang@amlogic.com>, Xingyu.chen
	<xingyu.chen@amlogic.com>, "Qianggui,song" <qianggui.song@amlogic.com>,
	Sunny.luo <sunny.luo@amlogic.com>, <linux-clk@vger.kernel.org>,
	<linux-amlogic@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH 1/3] dt-bindings: clk: g12a: New binding for Meson-G12A SoC
Date: Mon, 9 Jul 2018 19:12:45 +0800
Message-ID: <1531134767-29927-2-git-send-email-jian.hu@amlogic.com>
In-Reply-To: <1531134767-29927-1-git-send-email-jian.hu@amlogic.com>
References: <1531134767-29927-1-git-send-email-jian.hu@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: jian.hu@amlogic.com
List-ID: <linux-clk.vger.kernel.org>

Add new binding for Meson-G12A SoC Everything-Else part

Signed-off-by: Jian Hu <jian.hu@amlogic.com>
---
 Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt b/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
index e950599..0833006 100644
--- a/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
+++ b/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
@@ -9,6 +9,7 @@ Required Properties:
 		"amlogic,gxbb-clkc" for GXBB SoC,
 		"amlogic,gxl-clkc" for GXL and GXM SoC,
 		"amlogic,axg-clkc" for AXG SoC.
+		"amlogic,g12a-clkc" for G12A SoC.
 
 - #clock-cells: should be 1.
 
-- 
1.9.1
