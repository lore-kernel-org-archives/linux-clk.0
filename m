Return-Path: <linux-arm-kernel-bounces+mturquette=linaro.org@lists.infradead.org>
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Mike Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/5] ARM: sun5i: Add R8 DTSI
Date: Fri, 18 Sep 2015 10:48:47 +0200
Message-Id: <1442566130-3497-3-git-send-email-maxime.ripard@free-electrons.com>
In-Reply-To: <1442566130-3497-1-git-send-email-maxime.ripard@free-electrons.com>
References: <1442566130-3497-1-git-send-email-maxime.ripard@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: linux-sunxi@googlegroups.com, linux-kernel@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <maxime.ripard@free-electrons.com>, linux-clk@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=linaro.org@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

The R8 is very close to the A13, but it still has a few differences,
notably a composite output, which the A13 lacks.

Add a DTSI based on the A13's to hold those differences.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 arch/arm/boot/dts/sun5i-r8.dtsi | 61 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 arch/arm/boot/dts/sun5i-r8.dtsi

diff --git a/arch/arm/boot/dts/sun5i-r8.dtsi b/arch/arm/boot/dts/sun5i-r8.dtsi
new file mode 100644
index 000000000000..c9ed854687ca
--- /dev/null
+++ b/arch/arm/boot/dts/sun5i-r8.dtsi
@@ -0,0 +1,61 @@
+/*
+ * Copyright 2015 Free Electrons
+ * Copyright 2015 NextThing Co
+ *
+ * Maxime Ripard <maxime.ripard@free-electrons.com>
+ *
+ * This file is dual-licensed: you can use it either under the terms
+ * of the GPL or the X11 license, at your option. Note that this dual
+ * licensing only applies to this file, and not this project as a
+ * whole.
+ *
+ *  a) This file is free software; you can redistribute it and/or
+ *     modify it under the terms of the GNU General Public License as
+ *     published by the Free Software Foundation; either version 2 of the
+ *     License, or (at your option) any later version.
+ *
+ *     This file is distributed in the hope that it will be useful,
+ *     but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *     GNU General Public License for more details.
+ *
+ * Or, alternatively,
+ *
+ *  b) Permission is hereby granted, free of charge, to any person
+ *     obtaining a copy of this software and associated documentation
+ *     files (the "Software"), to deal in the Software without
+ *     restriction, including without limitation the rights to use,
+ *     copy, modify, merge, publish, distribute, sublicense, and/or
+ *     sell copies of the Software, and to permit persons to whom the
+ *     Software is furnished to do so, subject to the following
+ *     conditions:
+ *
+ *     The above copyright notice and this permission notice shall be
+ *     included in all copies or substantial portions of the Software.
+ *
+ *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+ *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
+ *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+ *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
+ *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
+ *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ *     OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+#include "skeleton.dtsi"
+
+#include "sun5i-a13.dtsi"
+
+/ {
+	chosen {
+		framebuffer@1 {
+			compatible = "allwinner,simple-framebuffer",
+				     "simple-framebuffer";
+			allwinner,pipeline = "de_be0-lcd0-tve0";
+			clocks = <&pll5 1>, <&ahb_gates 34>, <&ahb_gates 36>,
+				 <&ahb_gates 44>;
+			status = "disabled";
+		}; 
+	};
+};
-- 
2.5.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
