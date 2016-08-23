Return-Path: <york.sun@nxp.com>
From: york sun <york.sun@nxp.com>
To: "sboyd@codeaurora.org" <sboyd@codeaurora.org>
CC: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"pmarrecas@outlook.com" <pmarrecas@outlook.com>, York Sun
	<yorksun@freescale.com>, Mike Turquette <mturquette@baylibre.com>, "Sebastian
 Hesselbarth" <sebastian.hesselbarth@gmail.com>, Guenter Roeck
	<linux@roeck-us.net>, Andrey Filippov <andrey@elphel.com>, Paul Bolle
	<pebolle@tiscali.nl>
Subject: [Resend Patch v7] driver/clk/clk-si5338: Add common clock framework
 driver for si5338
Date: Tue, 23 Aug 2016 17:04:47 +0000
Message-ID: <AM4PR0401MB17320B3CAE8C6903207778429AEB0@AM4PR0401MB1732.eurprd04.prod.outlook.com>
Reply-To: york sun <york.sun@nxp.com>
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

SI5338 is a programmable clock generator. It has 4 sets of inputs,=0A=
PLL, multisynth and dividers to make 4 outputs. This driver splits=0A=
them into multiple clocks to comply with common clock framework.=0A=
=0A=
See Documentation/devicetree/bindings/clock/silabs,si5338.txt for=0A=
details.=0A=
=0A=
Signed-off-by: York Sun <yorksun@freescale.com>=0A=
CC: Mike Turquette <mturquette@baylibre.com>=0A=
CC: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>=0A=
CC: Guenter Roeck <linux@roeck-us.net>=0A=
CC: Andrey Filippov <andrey@elphel.com>=0A=
CC: Paul Bolle <pebolle@tiscali.nl>=0A=
=0A=
---=0A=
Resend. This patch is not shown in the list archive.=0A=
=0A=
Change log:=0A=
   v7: Rebase to clk-next (v4.3.0-rc3)=0A=
       Removed unneeded header file inclusion=0A=
       Add static to local array=0A=
       Remove unneeded casting=0A=
       Update document according to changes=0A=
       Add more checks to catch divided by zero=0A=
       Use devm_clk_get instead of of_clk_get=0A=
       Move devm_clk_get to probe function, only called when needed=0A=
       Remove clk pointers from platform data structure=0A=
=0A=
   v6: Fix multiline comments style=0A=
       Add msleep in loop of polling registers=0A=
       Deal with function return error consistently=0A=
       Remove unnecessary memset calls=0A=
       Fix calling strncat=0A=
       Use IS_ERR_OR_NULL when applicable=0A=
       Add a local function devm_of_clk_get()=0A=
       Remove clk_put in remove function=0A=
       Use clkout name in device tree and platform data if set=0A=
       Add warning if name is too long for clkdev=0A=
       s/if (a =3D=3D 0)/if (!a)=0A=
       s/if (a !=3D 0)/if (a)=0A=
       Remove "if (a)  a =3D 1" and alike=0A=
       Add dealing with -EPROBE_DEFER for of_clk_get()=0A=
       Prepare the clocks before calling post init as required by HW=0A=
       Update module license to GPL v2 be consistent with header=0A=
=0A=
   v5: Rebase to v4.2=0A=
       Move clk-si5338.h file into clk-si5338.c=0A=
       Drop unused macros=0A=
       Add macro HWDATA to replace container_of=0A=
       Collapse functions for using bsearch=0A=
       Use return inside switch {}=0A=
       Separate hardware setting from recalc=0A=
       Rename variable ms and p123=0A=
       Remove casting for returns and write_reg=0A=
       Change device_attr to S_IRUGO=0A=
       Drop sysfs, use debugfs for output status=0A=
       Drop exporting __clk_is_prepared=0A=
       Add "enabled" in device tree binding if the clocks need to be=0A=
         enabled when driver is loaded=0A=
       Add enable/disable ops for clock output=0A=
=0A=
   v4: Add binding silabs,pll-vco=0A=
       Set pll rate initial value=0A=
       Separate COMMON_CLK change from this patch=0A=
=0A=
   v3: Add calling unprepare upon removal=0A=
       Add registering to clkdev so the clk can be acquired when device=0A=
         tree is not in use=0A=
       Add a dev_info message when driver is removed=0A=
       Add missing "static" to two functions in clk-si5338.c=0A=
       Cosmatic fix in dt-bindings.clock/clk-si5338.h=0A=
=0A=
   v2: Fix handling name prefix if the driver is unloaded and loaded again=
=0A=
=0A=
  .../devicetree/bindings/clock/silabs,si5338.txt    |  192 +=0A=
  drivers/clk/Kconfig                                |   12 +=0A=
  drivers/clk/Makefile                               |    1 +=0A=
  drivers/clk/clk-si5338.c                           | 3802 =0A=
++++++++++++++++++++=0A=
  include/dt-bindings/clock/clk-si5338.h             |   68 +=0A=
  include/linux/platform_data/si5338.h               |   48 +=0A=
  6 files changed, 4123 insertions(+)=0A=
  create mode 100644 =0A=
Documentation/devicetree/bindings/clock/silabs,si5338.txt=0A=
  create mode 100644 drivers/clk/clk-si5338.c=0A=
  create mode 100644 include/dt-bindings/clock/clk-si5338.h=0A=
  create mode 100644 include/linux/platform_data/si5338.h=0A=
=0A=
diff --git a/Documentation/devicetree/bindings/clock/silabs,si5338.txt =0A=
b/Documentation/devicetree/bindings/clock/silabs,si5338.txt=0A=
new file mode 100644=0A=
index 0000000..cc7ae8e=0A=
--- /dev/null=0A=
+++ b/Documentation/devicetree/bindings/clock/silabs,si5338.txt=0A=
@@ -0,0 +1,192 @@=0A=
+Binding for Silicon Labs Si5338 programmable i2c clock generator.=0A=
+=0A=
+Reference=0A=
+[1] Si5338 Data Sheet=0A=
+    http://www.silabs.com/Support%20Documents/TechnicalDocs/Si5338.pdf=0A=
+=0A=
+The Si5338 is a programmable i2c clock generators with up to 4 output=0A=
+clocks. It has 4 sets of possible input clocks=0A=
+=0A=
+IN1/IN2: differential=0A=
+IN3: single-ended=0A=
+IN4: single-ended=0A=
+IN5/IN6: differential=0A=
+=0A=
+Additionally, IN1/IN2 can be used as XTAL with different setting.=0A=
+The clock tree looks like below (without support of zero-delay)=0A=
+=0A=
+=0A=
+      IN1/IN2 IN3         IN4 IN5/IN6=0A=
+         |     |           |     |=0A=
+   ------|     |           |     |=0A=
+   |     |     |           |     |=0A=
+   |     \     /           \     /=0A=
+   |      \   /             \   /=0A=
+   |       \ /               \ /=0A=
+ XTAL     REFCLK            FBCLK=0A=
+   |       |  \             /   |=0A=
+   |       |   \           /    |=0A=
+   |       | DIVREFCLK DIVFBCLK |=0A=
+   |       |     \       /      |=0A=
+   |       |      \     /       |=0A=
+   |       |       \   /        |=0A=
+   |       |        PLL         |=0A=
+   |       |      / | | \       |=0A=
+   |       |     /  / \  \      |=0A=
+   |       |    /  /   \  \     |=0A=
+   |       |   /   |   |   \    |=0A=
+   |       |   |   |   |   |    |=0A=
+   |       |  MS0 MS1 MS2 MS3   |=0A=
+   |       |   |   |   |   |    |=0A=
+=0A=
+       OUT0  OUT1  OUT2  OUT3=0A=
+=0A=
+The output clock can choose from any of the above clock as its source, wit=
h=0A=
+exceptions: MS1 can only be used for OUT1, MS2 can only be used for =0A=
OUT2, MS3=0A=
+can only be used for OUT3.=0A=
+=0A=
+=3D=3DI2C device node=3D=3D=0A=
+=0A=
+Required properties:=0A=
+- compatible: shall be "silabs,si5338".=0A=
+- reg: i2c device address, shall be 0x60, 0x61, 0x70, or 0x71=0A=
+- #clock-cells: shall be set to 1 for multiple outputs=0A=
+- clocks: list of parent clocks in the order of <xtal>, <in1/2>, <in3>, =
=0A=
<in4>,=0A=
+	 <in5/6>.=0A=
+	Note, xtal and in1/2 are mutually exclusive. Only one can be set.=0A=
+- clock-names: The name of the clocks in the same order.=0A=
+- #address-cells: shall be set to 1.=0A=
+- #size-cells: shall be set to 0.=0A=
+- silabs,pll-master: If PLL is used, pick one MS (0, 1, 2, or 3) to allow=
=0A=
+	chaning PLL rate. This is arbitrary since MS0/1/2/3 share one PLL.=0A=
+	PLL can be calculated backward to satisfy MS. This node is not=0A=
+	required if PLL is not used, or if silabs,pll-vco is set.=0A=
+=0A=
+Optional properties if not set by platform driver:=0A=
+- silab,name-prefix: name prefix for si5338=0A=
+        If multiple si5338 chips exist, use name-prefix to form unique =0A=
names.=0A=
+	If omitted, i2c bus name will be used as the prefix.=0A=
+- silab,ref-source: source of refclk, valid value is defined as=0A=
+	#define SI5338_REF_SRC_CLKIN12          0=0A=
+	#define SI5338_REF_SRC_CLKIN3           1=0A=
+	#define SI5338_REF_SRC_XTAL             4=0A=
+- silab,fb-source:  source of fbclk, valid value is defined as=0A=
+	#define SI5338_FB_SRC_CLKIN4            2=0A=
+	#define SI5338_FB_SRC_CLKIN56           3=0A=
+	#define SI5338_FB_SRC_NOCLK             5=0A=
+- silabs,pll-source: source of pll, valid value is defined as=0A=
+	#define SI5338_PFD_IN_REF_REFCLK           0=0A=
+	#define SI5338_PFD_IN_REF_FBCLK            1=0A=
+	#define SI5338_PFD_IN_REF_DIVREFCLK        2=0A=
+	#define SI5338_PFD_IN_REF_DIVFBCLK         3=0A=
+	#define SI5338_PFD_IN_REF_XOCLK            4=0A=
+	#define SI5338_PFD_IN_REF_NOCLK            5=0A=
+- silabs,pll-vco: Specify VCO frequency for optimal ratios for all outputs=
.=0A=
+	If specified, silabs,pll-master is ignored.=0A=
+=0A=
+=3D=3DChild nodes=3D=3D=0A=
+=0A=
+Each of the clock outputs can be configured individually by=0A=
+using a child node to the I2C device node. If a child node for a clock=0A=
+output is not set, platform driver has to set up.=0A=
+=0A=
+Required child node properties:=0A=
+- name: name for the child node=0A=
+        It has to be unique. The name prefix is ignored.=0A=
+	If using platform data and the name is not specificed,=0A=
+        clkout0/1/2/3 will be used with name prefix.=0A=
+- reg: number of clock output.=0A=
+=0A=
+Optional child node properties:=0A=
+- silabs,drive-config: the configuration of output driver=0A=
+  The valid value list is long. Please refer to soruce code.=0A=
+- silabs,clock-source: source clock of the output divider=0A=
+	#define SI5338_OUT_MUX_FBCLK            0=0A=
+	#define SI5338_OUT_MUX_REFCLK           1=0A=
+	#deinfe SI5338_OUT_MUX_DIVFBCLK         2=0A=
+	#deinfe SI5338_OUT_MUX_DIVREFCLK        3=0A=
+	#deinfe SI5338_OUT_MUX_XOCLK            4=0A=
+	#deinfe SI5338_OUT_MUX_MS0              5=0A=
+	#deinfe SI5338_OUT_MUX_MSN              6 /* MS0/1/2/3 */=0A=
+	#deinfe SI5338_OUT_MUX_NOCLK            7=0A=
+- silabs,disable-state : clock output disable state, shall be=0A=
+	#define SI5338_OUT_DIS_HIZ              0=0A=
+	#define SI5338_OUT_DIS_LOW              1=0A=
+	#define SI5338_OUT_DIS_HI               2=0A=
+	#define SI5338_OUT_DIS_ALWAYS_ON        3=0A=
+- enabled: the output is enabled by default=0A=
+	The existence of this node enables the output when the driver is loaded=
=0A=
+	otherwise the clock is only enabled when used=0A=
+=0A=
+=3D=3DExample=3D=3D=0A=
+=0A=
+/* 25MHz reference crystal */=0A=
+ref25: ref25M {=0A=
+	compatible =3D "fixed-clock";=0A=
+	#clock-cells =3D <0>;=0A=
+	clock-frequency =3D <25000000>;=0A=
+};=0A=
+clkin56: ref100M {=0A=
+	compatible =3D "fixed-clock";=0A=
+	#clock-cells =3D <0>;=0A=
+	clock-frequency =3D <100000000>;=0A=
+};=0A=
+i2c-master-node {=0A=
+	si5338: clock-generator@70 {=0A=
+		compatible =3D "silabs,si5338";=0A=
+		reg =3D <0x70>;=0A=
+		#address-cells =3D <1>;=0A=
+		#size-cells =3D <0>;=0A=
+		#clock-cells =3D <1>;=0A=
+=0A=
+		/* connect xtal to 25MHz, in5/in6 to 100MHz */=0A=
+		clocks =3D <&ref25>, <0>, <0>, <0>, <&clkin56>;=0A=
+		clock-names =3D "xtal", "in12", "in3", "in4", "in56";=0A=
+=0A=
+		/* connect xtal as source of refclk */=0A=
+		silab,ref-source =3D <SI5338_REF_SRC_XTAL>;=0A=
+=0A=
+		/* connect in5/in6 as source of fbclk */=0A=
+		silab,fb-source =3D <SI5338_FB_SRC_CLKIN56>;=0A=
+=0A=
+		/* connect divrefclk as source of pll */=0A=
+		silab,pll-source =3D <SI5338_PFD_IN_REF_DIVREFCLK>;=0A=
+=0A=
+		/* Choose one MS for pll master */=0A=
+		silabs,pll-master =3D <0>;=0A=
+=0A=
+		/* Specify pll-vco frequency. pll-master is ignored. */=0A=
+		silabs,pll-vco =3D <2450000000>;=0A=
+=0A=
+		/* output */=0A=
+		clkout0 {=0A=
+			reg =3D <0>;=0A=
+			silabs,drive-config =3D "1V8_LVDS";=0A=
+			silabs,clock-source =3D <SI5338_OUT_MUX_MS0>;=0A=
+			silabs,disable-state =3D <SI5338_OUT_DIS_HIZ>;=0A=
+			clock-frequency =3D <125000000>;=0A=
+		};=0A=
+		clkout1 {=0A=
+			reg =3D <1>;=0A=
+			silabs,drive-config =3D "1V8_LVDS";=0A=
+			silabs,clock-source =3D <SI5338_OUT_MUX_MSN>;=0A=
+			silabs,disable-state =3D <SI5338_OUT_DIS_HIZ>;=0A=
+			clock-frequency =3D <125000000>;=0A=
+		};=0A=
+		clkout2 {=0A=
+			reg =3D <2>;=0A=
+			silabs,drive-config =3D "1V8_LVDS";=0A=
+			silabs,clock-source =3D <SI5338_OUT_MUX_MSN>;=0A=
+			silabs,disable-state =3D <SI5338_OUT_DIS_HIZ>;=0A=
+			clock-frequency =3D <125000000>;=0A=
+		};=0A=
+		clkout3 {=0A=
+			reg =3D <3>;=0A=
+			silabs,drive-config =3D "1V8_LVDS";=0A=
+			silabs,clock-source =3D <SI5338_OUT_MUX_MSN>;=0A=
+			silabs,disable-state =3D <SI5338_OUT_DIS_HIZ>;=0A=
+			clock-frequency =3D <125000000>;=0A=
+		};=0A=
+=0A=
+	};=0A=
+};=0A=
diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig=0A=
index eb2b354..4814f10 100644=0A=
--- a/drivers/clk/Kconfig=0A=
+++ b/drivers/clk/Kconfig=0A=
@@ -60,6 +60,18 @@ config COMMON_CLK_RK808=0A=
  	  clocked at 32KHz each. Clkout1 is always on, Clkout2 can off=0A=
  	  by control register.=0A=
  +config COMMON_CLK_SI5338=0A=
+	tristate "Clock driver for SiLabs 5338"=0A=
+	depends on I2C=0A=
+	select REGMAP_I2C=0A=
+	select RATIONAL=0A=
+	---help---=0A=
+	  This driver supports Silicon Labs 5338 programmable clock generators,=
=0A=
+	  using common clock framework. It needs parent clock as input(s).=0A=
+	  Internal clocks are registered with unique names in case multiple=0A=
+	  devices exist. See devicetree/bindings/clock/silabs,si5338.txt=0A=
+	  under Documentation for details.=0A=
+=0A=
  config COMMON_CLK_SI5351=0A=
  	tristate "Clock driver for SiLabs 5351A/B/C"=0A=
  	depends on I2C=0A=
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile=0A=
index e44feca..263c2d7 100644=0A=
--- a/drivers/clk/Makefile=0A=
+++ b/drivers/clk/Makefile=0A=
@@ -35,6 +35,7 @@ obj-$(CONFIG_COMMON_CLK_PALMAS)		+=3D clk-palmas.o=0A=
  obj-$(CONFIG_CLK_QORIQ)			+=3D clk-qoriq.o=0A=
  obj-$(CONFIG_COMMON_CLK_RK808)		+=3D clk-rk808.o=0A=
  obj-$(CONFIG_COMMON_CLK_S2MPS11)	+=3D clk-s2mps11.o=0A=
+obj-$(CONFIG_COMMON_CLK_SI5338)		+=3D clk-si5338.o=0A=
  obj-$(CONFIG_COMMON_CLK_SI5351)		+=3D clk-si5351.o=0A=
  obj-$(CONFIG_COMMON_CLK_SI514)		+=3D clk-si514.o=0A=
  obj-$(CONFIG_COMMON_CLK_SI570)		+=3D clk-si570.o=0A=
diff --git a/drivers/clk/clk-si5338.c b/drivers/clk/clk-si5338.c=0A=
new file mode 100644=0A=
index 0000000..c58f9f8=0A=
--- /dev/null=0A=
+++ b/drivers/clk/clk-si5338.c=0A=
@@ -0,0 +1,3802 @@=0A=
+/*=0A=
+ * clk-si5338.c: Silicon Labs Si5338 I2C Clock Generator=0A=
+ *=0A=
+ * Copyright 2015 Freescale Semiconductor=0A=
+ * York Sun <yorksun@freescale.com>=0A=
+ *=0A=
+ * Some code is taken from si5338.c by Andrey Filippov  <andrey@elphel.com=
>=0A=
+ * Copyright 2013 Elphel, Inc.=0A=
+ *=0A=
+ * SI5338 has several blocks, including=0A=
+ *   Inputs (IN1/IN2, IN3, IN4, IN5/IN6, XTAL)=0A=
+ *   PLL (Synthesis stage 1)=0A=
+ *   MultiSynth (Synthesis state 2)=0A=
+ *   Outputs (OUT0/1/2/3)=0A=
+ * Each block is registered as a clock device to form a tree structure.=0A=
+ * See Documentation/devicetree/bindings/clock/silabs,si5338.txt for =0A=
details.=0A=
+ *=0A=
+ * This driver uses regmap to cache register values to reduce transactions=
=0A=
+ * on I2C bus. Volatile registers are specified.=0A=
+ *=0A=
+ * This program is free software; you can redistribute  it and/or modify i=
t=0A=
+ * under  the terms of  the GNU General  Public License as published by th=
e=0A=
+ * Free Software Foundation;  either version 2 of the  License, or (at you=
r=0A=
+ * option) any later version.=0A=
+ */=0A=
+=0A=
+#include <dt-bindings/clock/clk-si5338.h>=0A=
+#include <linux/bsearch.h>=0A=
+#include <linux/clk.h>=0A=
+#include <linux/clkdev.h>=0A=
+#include <linux/clk-provider.h>=0A=
+#include <linux/debugfs.h>=0A=
+#include <linux/delay.h>=0A=
+#include <linux/err.h>=0A=
+#include <linux/errno.h>=0A=
+#include <linux/kernel.h>=0A=
+#include <linux/i2c.h>=0A=
+#include <linux/math64.h>=0A=
+#include <linux/module.h>=0A=
+#include <linux/platform_data/si5338.h>=0A=
+#include <linux/regmap.h>=0A=
+#include <linux/slab.h>=0A=
+#include <linux/string.h>=0A=
+=0A=
+#define REG5338_PAGE			255=0A=
+#define REG5338_PAGE_MASK		1=0A=
+#define REG5338_DEV_CONFIG2		2=0A=
+#define REG5338_DEV_CONFIG2_MASK	0x3f=0A=
+#define REG5338_DEV_CONFIG2_VAL		38 /* last 2 digits of part number */=0A=
+#define LAST_REG			347=0A=
+=0A=
+#define FVCOMIN			2200000000LL=0A=
+#define FVCOMAX			2840000000LL=0A=
+#define XTAL_FREQMIN		8000000LL=0A=
+#define XTAL_FREQMAX		30000000LL=0A=
+#define INFREQMIN		5000000LL=0A=
+#define INFREQMAX		710000000LL=0A=
+#define INFREQMAX34		200000000LL=0A=
+#define INFREQDIV		40000000LL /* divide input frequency if above */=0A=
+=0A=
+#define MSINT_MIN		4 /* need to exclude 5, 7 in the code */=0A=
+#define MSINT_MAX		567=0A=
+=0A=
+#define AWE_INT_MASK		0x061d=0A=
+=0A=
+#define AWE_IN_MUX		0x1d18=0A=
+#define AWE_IN_MUX1		0x1c1c=0A=
+#define AWE_FB_MUX		0x1e18=0A=
+#define AWE_FB_MUX1		0x1c20=0A=
+=0A=
+#define AWE_XTAL_FREQ		0x1c03=0A=
+#define AWE_PFD_REF		0x1de0=0A=
+#define AWE_PFD_FB		0x1ee0=0A=
+#define AWE_P1DIV		0x1d07=0A=
+#define AWE_P2DIV		0x1e07=0A=
+#define AWE_DRV0_PDN		0x1f01=0A=
+#define AWE_MS0_PDN		0x1f02=0A=
+#define AWE_R0DIV		0x1f1c=0A=
+#define AWE_R0DIV_IN		0x1fe0=0A=
+#define AWE_DRV1_PDN		0x2001=0A=
+#define AWE_MS1_PDN		0x2002=0A=
+#define AWE_R1DIV		0x201c=0A=
+#define AWE_R1DIV_IN		0x20e0=0A=
+#define AWE_DRV2_PDN		0x2101=0A=
+#define AWE_MS2_PDN		0x2102=0A=
+#define AWE_R2DIV		0x211c=0A=
+#define AWE_R2DIV_IN		0x21e0=0A=
+#define AWE_DRV3_PDN		0x2201=0A=
+#define AWE_MS3_PDN		0x2202=0A=
+#define AWE_R3DIV		0x221c=0A=
+#define AWE_R3DIV_IN		0x22e0=0A=
+=0A=
+#define AWE_DRV0_VDDO		0x2303=0A=
+#define AWE_DRV1_VDDO		0x230c=0A=
+#define AWE_DRV2_VDDO		0x2330=0A=
+#define AWE_DRV3_VDDO		0x23c0=0A=
+#define AWE_DRV0_FMT		0x2407=0A=
+#define AWE_DRV0_INV		0x2418=0A=
+#define AWE_DRV1_FMT		0x2507=0A=
+#define AWE_DRV1_INV		0x2518=0A=
+#define AWE_DRV2_FMT		0x2607=0A=
+#define AWE_DRV2_INV		0x2618=0A=
+#define AWE_DRV3_FMT		0x2707=0A=
+#define AWE_DRV3_INV		0x2718=0A=
+=0A=
+#define AWE_DRV0_TRIM		0x281f=0A=
+#define AWE_DRV1_TRIM_A		0x28e0=0A=
+#define AWE_DRV1_TRIM_B		0x2903=0A=
+#define AWE_DRV2_TRIM		0x297c=0A=
+#define AWE_DRV3_TRIM		0x2a1f=0A=
+=0A=
+#define AWE_FCAL_OVRD_07_00	0x2dff=0A=
+#define AWE_FCAL_OVRD_15_08	0x2eff=0A=
+#define AWE_FCAL_OVRD_17_15	0x2f03=0A=
+#define AWE_REG47_72		0x2ffc=0A=
+#define AWE_PFD_EXTFB		0x3080=0A=
+#define AWE_PLL_KPHI		0x307f=0A=
+#define AWE_FCAL_OVRD_EN	0x3180=0A=
+#define AWE_VCO_GAIN		0x3170=0A=
+#define AWE_RSEL		0x310c=0A=
+#define AWE_BWSEL		0x3103=0A=
+#define AWE_VCO_GAIN_RSEL_BWSEL	0x317f=0A=
+=0A=
+#define AWE_PLL_EN		0x32c0=0A=
+#define AWE_MSCAL		0x323f=0A=
+#define AWE_MS3_HS		0x3380=0A=
+#define AWE_MS2_HS		0x3340=0A=
+#define AWE_MS1_HS		0x3320=0A=
+#define AWE_MS0_HS		0x3310=0A=
+#define AWE_MS_PEC		0x3307=0A=
+=0A=
+#define AWE_MS0_P1_07_00	0x35ff=0A=
+#define AWE_MS0_P1_15_08	0x36ff=0A=
+#define AWE_MS0_P1_17_16	0x3703=0A=
+#define AWE_MS0_P2_05_00	0x37fc=0A=
+#define AWE_MS0_P2_13_06	0x38ff=0A=
+#define AWE_MS0_P2_21_14	0x39ff=0A=
+#define AWE_MS0_P2_29_22	0x3aff=0A=
+#define AWE_MS0_P3_07_00	0x3bff=0A=
+#define AWE_MS0_P3_15_08	0x3cff=0A=
+#define AWE_MS0_P3_23_16	0x3dff=0A=
+#define AWE_MS0_P3_29_24	0x3e3f=0A=
+=0A=
+#define AWE_MS1_P1_07_00	0x40ff=0A=
+#define AWE_MS1_P1_15_08	0x41ff=0A=
+#define AWE_MS1_P1_17_16	0x4203=0A=
+#define AWE_MS1_P2_05_00	0x42fc=0A=
+#define AWE_MS1_P2_13_06	0x43ff=0A=
+#define AWE_MS1_P2_21_14	0x44ff=0A=
+#define AWE_MS1_P2_29_22	0x45ff=0A=
+#define AWE_MS1_P3_07_00	0x46ff=0A=
+#define AWE_MS1_P3_15_08	0x47ff=0A=
+#define AWE_MS1_P3_23_16	0x48ff=0A=
+#define AWE_MS1_P3_29_24	0x493f=0A=
+=0A=
+#define AWE_MS2_P1_07_00	0x4bff=0A=
+#define AWE_MS2_P1_15_08	0x4cff=0A=
+#define AWE_MS2_P1_17_16	0x4d03=0A=
+#define AWE_MS2_P2_05_00	0x4dfc=0A=
+#define AWE_MS2_P2_13_06	0x4eff=0A=
+#define AWE_MS2_P2_21_14	0x4fff=0A=
+#define AWE_MS2_P2_29_22	0x50ff=0A=
+#define AWE_MS2_P3_07_00	0x51ff=0A=
+#define AWE_MS2_P3_15_08	0x52ff=0A=
+#define AWE_MS2_P3_23_16	0x53ff=0A=
+#define AWE_MS2_P3_29_24	0x543f=0A=
+=0A=
+#define AWE_MS3_P1_07_00	0x56ff=0A=
+#define AWE_MS3_P1_15_08	0x57ff=0A=
+#define AWE_MS3_P1_17_16	0x5803=0A=
+#define AWE_MS3_P2_05_00	0x58fc=0A=
+#define AWE_MS3_P2_13_06	0x59ff=0A=
+#define AWE_MS3_P2_21_14	0x5aff=0A=
+#define AWE_MS3_P2_29_22	0x5bff=0A=
+#define AWE_MS3_P3_07_00	0x5cff=0A=
+#define AWE_MS3_P3_15_08	0x5dff=0A=
+#define AWE_MS3_P3_23_16	0x5eff=0A=
+#define AWE_MS3_P3_29_24	0x5f3f=0A=
+=0A=
+#define AWE_MSN_P1_07_00	0x61ff=0A=
+#define AWE_MSN_P1_15_08	0x62ff=0A=
+#define AWE_MSN_P1_17_16	0x6303=0A=
+#define AWE_MSN_P2_05_00	0x63fc=0A=
+#define AWE_MSN_P2_13_06	0x64ff=0A=
+#define AWE_MSN_P2_21_14	0x65ff=0A=
+#define AWE_MSN_P2_29_22	0x66ff=0A=
+#define AWE_MSN_P3_07_00	0x67ff=0A=
+#define AWE_MSN_P3_15_08	0x68ff=0A=
+#define AWE_MSN_P3_23_16	0x69ff=0A=
+#define AWE_MSN_P3_29_24	0x6a3f=0A=
+=0A=
+#define AWE_OUT0_DIS_STATE	0x6ec0=0A=
+#define AWE_OUT1_DIS_STATE	0x72c0=0A=
+#define AWE_OUT2_DIS_STATE	0x76c0=0A=
+#define AWE_OUT3_DIS_STATE	0x7ac0=0A=
+=0A=
+#define AWE_STATUS			0xdaff=0A=
+#define AWE_STATUS_PLL_LOL		0xda10=0A=
+#define AWE_STATUS_PLL_LOS_FDBK		0xda08=0A=
+#define AWE_STATUS_PLL_LOS_CLKIN	0xda04=0A=
+#define AWE_STATUS_PLL_SYS_CAL		0xda01=0A=
+=0A=
+#define AWE_MS_RESET		0xe204=0A=
+=0A=
+#define AWE_OUT0_DIS		0xe601=0A=
+#define AWE_OUT1_DIS		0xe602=0A=
+#define AWE_OUT2_DIS		0xe604=0A=
+#define AWE_OUT3_DIS		0xe608=0A=
+#define AWE_OUT_ALL_DIS		0xe610=0A=
+=0A=
+#define AWE_FCAL_07_00		0xebff=0A=
+#define AWE_FCAL_15_08		0xecff=0A=
+#define AWE_FCAL_17_16		0xed03=0A=
+=0A=
+#define AWE_DIS_LOS		0xf180=0A=
+#define AWE_REG241		0xf1ff=0A=
+=0A=
+#define AWE_SOFT_RESET		0xf602=0A=
+=0A=
+#define AWE_MISC_47		0x2ffc /* write 0x5 */=0A=
+#define AWE_MISC_106		0x6a80 /* write 0x1 */=0A=
+#define AWE_MISC_116		0x7480 /* write 0x1 */=0A=
+#define AWE_MISC_42		0x2a20 /* write 0x1 */=0A=
+#define AWE_MISC_06A		0x06e0 /* write 0x0 */=0A=
+#define AWE_MISC_06B		0x0602 /* write 0x0 */=0A=
+#define AWE_MISC_28		0x1cc0 /* write 0x0 */=0A=
+=0A=
+#define MS_POWER_DOWN		1=0A=
+#define MS_POWER_UP		0=0A=
+#define OUT_DISABLE		1=0A=
+#define OUT_ENABLE		0=0A=
+#define DRV_POWERDOWN		1=0A=
+#define DRV_POWERUP		0=0A=
+=0A=
+struct si5338_drv_t {=0A=
+	const char *description;=0A=
+	u8 fmt;=0A=
+	u8 vdd;=0A=
+	u8 trim;=0A=
+	/* bits [1:0} data,=0A=
+	 * [3:2] - don't care ([3]=3D=3D1 - [1] - any, [2]=3D=3D1 - [0] - any=0A=
+	 */=0A=
+	u8 invert;=0A=
+};=0A=
+=0A=
+#define MAX_NAME_PREFIX 30 /* max 30 characters for the name_prefix */=0A=
+#define MAX_NAME_LENGTH 40 /* max 40 charactors for the internal names */=
=0A=
+=0A=
+struct si5338_driver_data;=0A=
+=0A=
+/*=0A=
+ * Internal parameters used by PLL and MS=0A=
+ * They are used in recalc rate functions before being=0A=
+ * written to the device.=0A=
+ */=0A=
+struct si5338_parameters {=0A=
+	u32	p[3];=0A=
+	bool	valid;=0A=
+};=0A=
+=0A=
+/*=0A=
+ * This structure saves params and num variable for clocks=0A=
+ * Internal clocks with parameters of multiple input/output=0A=
+ * use this structure.=0A=
+ */=0A=
+struct si5338_hw_data {=0A=
+	struct clk_hw			hw;=0A=
+	struct si5338_driver_data	*drvdata;=0A=
+	/* params is only used for PLL and multisynth clocks */=0A=
+	struct si5338_parameters	params;=0A=
+	/*=0A=
+	 * For clkin, clkout, multisynth: index of itself=0A=
+	 * For refclk, fbclk, pll: index of its source=0A=
+	 */=0A=
+	u8				num;=0A=
+};=0A=
+#define HWDATA(x) \=0A=
+	((struct si5338_hw_data *)container_of(x, struct si5338_hw_data, hw))=0A=
+=0A=
+struct si5338_driver_data {=0A=
+	struct i2c_client	*client;=0A=
+	struct regmap		*regmap;=0A=
+	struct clk_onecell_data onecell;=0A=
+=0A=
+	/*=0A=
+	 * The structure of clocks are=0A=
+	 * Input clocks: pclkin12 - IN1/2=0A=
+	 *		 pclkin3  - IN3=0A=
+	 *		 pclkin4  - IN4=0A=
+	 *		 pclkin56 - IN5/6=0A=
+	 *		 pxtal    - IN1/2 XTAL=0A=
+	 * Internal clocks:=0A=
+	 *		 xoclk		- from pxtal=0A=
+	 *		 refclk		- from one of IN1/2, IN3, XTAL=0A=
+	 *		 divrefclk	- from refclk with divider=0A=
+	 *		 fbclk		- from IN4 or IN5/6=0A=
+	 *		 divfbclk	- from fbclk=0A=
+	 *		 MS0/1/2/3	- from one of xoclk, refclk=0A=
+	 *				  diverefclk, fbclk, divfbclk=0A=
+	 * Output clocks:=0A=
+	 *		 clkout0/1/2/3	- from one of internal clocks=0A=
+	 */=0A=
+	/* parent clocks */=0A=
+	struct clk		*pxtal;=0A=
+	const char		*pxtal_name;=0A=
+	struct clk		*pclkin[4];=0A=
+	const char		*pclkin_name[4];=0A=
+=0A=
+	/* internal and output clocks */=0A=
+	char name_prefix[MAX_NAME_PREFIX];=0A=
+	struct clk_hw		xtal;=0A=
+	struct si5338_hw_data	clkin[4];=0A=
+	struct si5338_hw_data	refclk;=0A=
+	struct clk_hw		divrefclk;=0A=
+	struct si5338_hw_data	fbclk;=0A=
+	struct clk_hw		divfbclk;=0A=
+	struct si5338_hw_data	pll;=0A=
+	struct si5338_hw_data	*msynth;=0A=
+	struct si5338_hw_data	*clkout;=0A=
+	struct clk_lookup	*lookup[4];=0A=
+};=0A=
+=0A=
+static const char * const si5338_input_names[] =3D {=0A=
+	"in1/in2", "in3", "in4", "in5/in6", "xtal", "noclk"=0A=
+};=0A=
+=0A=
+static const char * const si5338_pll_src_names[] =3D {=0A=
+	"refclk", "fbclk", "divrefclk", "divfbclk", "xtal", "noclk"=0A=
+};=0A=
+=0A=
+static const char * const si5338_msynth_src_names[] =3D {=0A=
+	"pll"=0A=
+};=0A=
+=0A=
+static const char * const si5338_msynth_names[] =3D {=0A=
+	"ms0", "ms1", "ms2", "ms3"=0A=
+};=0A=
+static const char * const si5338_clkout_names[] =3D {=0A=
+	"clkout0", "clkout1", "clkout2", "clkout3"=0A=
+};=0A=
+static const char * const si5338_clkout_src_names[] =3D {=0A=
+	"fbclk", "refclk", "divfbclk", "divrefclk", "xtal",=0A=
+	"ms0",=0A=
+	"msn", /* it is actually ms0, ms1, ms2, ms3 dependings on clkout */=0A=
+	"noclk",=0A=
+};=0A=
+=0A=
+/*=0A=
+ * This array is used to determine if a register is writable. The mask is=
=0A=
+ * not used in this driver. The data is in format of 0xAAAMM where AAA is=
=0A=
+ * address, MM is bit mask. 1 means the corresponding bit is writable.=0A=
+ * Created from SiLabs ClockBuilder output.=0A=
+ * Note: Register 226, 230, 241, 246, 255 are not included in header file=
=0A=
+ *	 from ClockBuilder v2.7 or later. Manually added here.=0A=
+ */=0A=
+static const u32 register_masks[] =3D {=0A=
+	0x61d, 0x1b80, 0x1cff, 0x1dff, 0x1eff, 0x1fff, 0x20ff, 0x21ff,=0A=
+	0x22ff, 0x23ff, 0x241f, 0x251f, 0x261f, 0x271f, 0x28ff, 0x297f,=0A=
+	0x2a3f, 0x2dff, 0x2eff, 0x2f3f, 0x30ff, 0x31ff, 0x32ff, 0x33ff,=0A=
+	0x34ff, 0x35ff, 0x36ff, 0x37ff, 0x38ff, 0x39ff, 0x3aff, 0x3bff,=0A=
+	0x3cff, 0x3dff, 0x3e3f, 0x3fff, 0x40ff, 0x41ff, 0x42ff, 0x43ff,=0A=
+	0x44ff, 0x45ff, 0x46ff, 0x47ff, 0x48ff, 0x493f, 0x4aff, 0x4bff,=0A=
+	0x4cff, 0x4dff, 0x4eff, 0x4fff, 0x50ff, 0x51ff, 0x52ff, 0x53ff,=0A=
+	0x543f, 0x55ff, 0x56ff, 0x57ff, 0x58ff, 0x59ff, 0x5aff, 0x5bff,=0A=
+	0x5cff, 0x5dff, 0x5eff, 0x5f3f, 0x61ff, 0x62ff, 0x63ff, 0x64ff,=0A=
+	0x65ff, 0x66ff, 0x67ff, 0x68ff, 0x69ff, 0x6abf, 0x6bff, 0x6cff,=0A=
+	0x6dff, 0x6eff, 0x6fff, 0x70ff, 0x71ff, 0x72ff, 0x73ff, 0x74ff,=0A=
+	0x75ff, 0x76ff, 0x77ff, 0x78ff, 0x79ff, 0x7aff, 0x7bff, 0x7cff,=0A=
+	0x7dff, 0x7eff, 0x7fff, 0x80ff, 0x810f, 0x820f, 0x83ff, 0x84ff,=0A=
+	0x85ff, 0x86ff, 0x87ff, 0x88ff, 0x89ff, 0x8aff, 0x8bff, 0x8cff,=0A=
+	0x8dff, 0x8eff, 0x8fff, 0x90ff, 0x98ff, 0x99ff, 0x9aff, 0x9bff,=0A=
+	0x9cff, 0x9dff, 0x9e0f, 0x9f0f, 0xa0ff, 0xa1ff, 0xa2ff, 0xa3ff,=0A=
+	0xa4ff, 0xa5ff, 0xa6ff, 0xa7ff, 0xa8ff, 0xa9ff, 0xaaff, 0xabff,=0A=
+	0xacff, 0xadff, 0xaeff, 0xafff, 0xb0ff, 0xb1ff, 0xb2ff, 0xb3ff,=0A=
+	0xb4ff, 0xb50f, 0xb6ff, 0xb7ff, 0xb8ff, 0xb9ff, 0xbaff, 0xbbff,=0A=
+	0xbcff, 0xbdff, 0xbeff, 0xbfff, 0xc0ff, 0xc1ff, 0xc2ff, 0xc3ff,=0A=
+	0xc4ff, 0xc5ff, 0xc6ff, 0xc7ff, 0xc8ff, 0xc9ff, 0xcaff, 0xcb0f,=0A=
+	0xccff, 0xcdff, 0xceff, 0xcfff, 0xd0ff, 0xd1ff, 0xd2ff, 0xd3ff,=0A=
+	0xd4ff, 0xd5ff, 0xd6ff, 0xd7ff, 0xd8ff, 0xd9ff, 0xe204, 0xe6ff,=0A=
+	0xf1ff, 0xf202, 0xf6ff, 0xffff, 0x11fff,=0A=
+	0x120ff, 0x121ff, 0x122ff, 0x123ff, 0x124ff, 0x125ff, 0x126ff, 0x127ff,=
=0A=
+	0x128ff, 0x129ff, 0x12aff, 0x12b0f, 0x12fff, 0x130ff, 0x131ff, 0x132ff,=
=0A=
+	0x133ff, 0x134ff, 0x135ff, 0x136ff, 0x137ff, 0x138ff, 0x139ff, 0x13aff,=
=0A=
+	0x13b0f, 0x13fff, 0x140ff, 0x141ff, 0x142ff, 0x143ff, 0x144ff, 0x145ff,=
=0A=
+	0x146ff, 0x147ff, 0x148ff, 0x149ff, 0x14aff, 0x14b0f, 0x14fff, 0x150ff,=
=0A=
+	0x151ff, 0x152ff, 0x153ff, 0x154ff, 0x155ff, 0x156ff, 0x157ff, 0x158ff,=
=0A=
+	0x159ff, 0x15aff, 0x15b0f=0A=
+};=0A=
+=0A=
+/*=0A=
+ * Si5338 i2c regmap=0A=
+ */=0A=
+static inline u8 si5338_reg_read(struct si5338_driver_data *drvdata,=0A=
+				 u16 reg, u8 *data)=0A=
+{=0A=
+	u32 val;=0A=
+	int ret;=0A=
+=0A=
+	ret =3D regmap_read(drvdata->regmap, reg, &val);=0A=
+	*data =3D (u8)val;	/* si5338 has u8 value */=0A=
+=0A=
+	return ret;=0A=
+}=0A=
+=0A=
+static inline int si5338_reg_write(struct si5338_driver_data *drvdata,=0A=
+				   u16 reg, u8 val, u8 mask)=0A=
+{=0A=
+	if (mask !=3D 0xff)=0A=
+		return regmap_update_bits(drvdata->regmap, reg, mask, val);=0A=
+=0A=
+	return regmap_write(drvdata->regmap, reg, val);=0A=
+}=0A=
+=0A=
+static int write_field(struct si5338_driver_data *drvdata, u8 data, u32 =
=0A=
awe)=0A=
+{=0A=
+	int rc, nshift;=0A=
+	u8 mask, reg_data;=0A=
+	u16 reg;=0A=
+=0A=
+	reg =3D awe >> 8;=0A=
+	mask =3D awe & 0xff;=0A=
+	if (mask) {=0A=
+		nshift =3D 0;=0A=
+		while (!((1 << nshift) & mask))=0A=
+			nshift++;=0A=
+		reg_data =3D (data & 0xff) << nshift;=0A=
+		rc =3D si5338_reg_write(drvdata, reg, reg_data, mask);=0A=
+		if (rc < 0)=0A=
+			return rc;=0A=
+	}=0A=
+=0A=
+	return 0;=0A=
+}=0A=
+=0A=
+static int write_multireg64(struct si5338_driver_data *drvdata,=0A=
+				u64 data, const u32 *awe)=0A=
+{=0A=
+	int i, rc, nshift, nbits;=0A=
+	u8 mask, reg_data;=0A=
+	u16 reg;=0A=
+=0A=
+	for (i =3D 0; awe[i]; i++) {=0A=
+		reg =3D awe[i] >> 8;=0A=
+		mask =3D awe[i] & 0xff;=0A=
+		if (mask) {=0A=
+			nshift =3D 0;=0A=
+			nbits =3D 1;=0A=
+			while (!((1 << nshift) & mask))=0A=
+				nshift++;=0A=
+			while ((1 << (nshift + nbits)) & mask)=0A=
+				nbits++;=0A=
+			/*=0A=
+			 * may have some garbage in high bits,=0A=
+			 * will be cut of by mask=0A=
+			 */=0A=
+			reg_data =3D (data & 0xff) << nshift;=0A=
+			data >>=3D nbits;=0A=
+			rc =3D si5338_reg_write(drvdata, reg, reg_data, mask);=0A=
+			if (rc < 0)=0A=
+				return rc;=0A=
+		}=0A=
+	}=0A=
+=0A=
+	return 0;=0A=
+}=0A=
+=0A=
+/*=0A=
+ * The function forms a 64-bit value from multiple registers.=0A=
+ * The lastest value used by si5338 is 48-bit.=0A=
+ */=0A=
+static int read_multireg64(struct si5338_driver_data *drvdata,=0A=
+			   const u32 *awe, u64 *data)=0A=
+{=0A=
+	int i, rc, nshift, nbits, full_shift =3D 0;=0A=
+	u8 val, mask;=0A=
+	u16 reg;=0A=
+=0A=
+	*data =3D 0;=0A=
+=0A=
+	for (i =3D 0; awe[i]; i++) {=0A=
+		reg =3D awe[i] >> 8;=0A=
+		mask =3D awe[i] & 0xff;=0A=
+		if (mask) {=0A=
+			nshift =3D 0;=0A=
+			nbits =3D 1;=0A=
+			while (!((1 << nshift) & mask))=0A=
+				nshift++;=0A=
+			while ((1 << (nshift + nbits)) & mask)=0A=
+				nbits++;=0A=
+			rc =3D si5338_reg_read(drvdata, reg, &val);=0A=
+			if (rc < 0)=0A=
+				return rc;=0A=
+=0A=
+			*data |=3D (((s64)val & mask) >> nshift) << full_shift;=0A=
+			full_shift +=3D nbits;=0A=
+		}=0A=
+	}=0A=
+=0A=
+	return 0;=0A=
+}=0A=
+=0A=
+static int read_field(struct si5338_driver_data *drvdata, u32 awe)=0A=
+{=0A=
+	int rc, nshift;=0A=
+	u8 val, mask;=0A=
+	u16 reg;=0A=
+=0A=
+	reg =3D awe >> 8;=0A=
+	mask =3D awe & 0xff;=0A=
+=0A=
+	if (mask) {=0A=
+		nshift =3D 0;=0A=
+		while (!((1 << nshift) & mask))=0A=
+			nshift++;=0A=
+		rc =3D si5338_reg_read(drvdata, reg, &val);=0A=
+		if (rc < 0)=0A=
+			return rc;=0A=
+=0A=
+		return (val & mask) >> nshift;=0A=
+	}=0A=
+=0A=
+	return 0;=0A=
+}=0A=
+=0A=
+static int si5338_find_mask(const void *key, const void *elt)=0A=
+{=0A=
+	const u32 *reg =3D key;=0A=
+	const u32 *register_mask =3D elt;=0A=
+=0A=
+	if (*reg > *register_mask >> 8)=0A=
+		return 1;=0A=
+	if (*reg < *register_mask >> 8)=0A=
+		return -1;=0A=
+=0A=
+	return 0;=0A=
+}=0A=
+=0A=
+static bool si5338_regmap_is_writeable(struct device *dev, unsigned int =
=0A=
reg)=0A=
+{=0A=
+	return bsearch(&reg, register_masks, ARRAY_SIZE(register_masks),=0A=
+		       sizeof(u32), si5338_find_mask) !=3D NULL;=0A=
+}=0A=
+=0A=
+static bool si5338_regmap_is_volatile(struct device *dev, unsigned int reg=
)=0A=
+{=0A=
+	switch (reg) {=0A=
+	case (AWE_STATUS >> 8):=0A=
+	case (AWE_SOFT_RESET >> 8):=0A=
+	case (AWE_FCAL_07_00 >> 8):=0A=
+	case (AWE_FCAL_15_08 >> 8):=0A=
+	case (AWE_FCAL_17_16 >> 8):=0A=
+		return true;=0A=
+	}=0A=
+=0A=
+	return false;=0A=
+}=0A=
+static const struct regmap_range_cfg si5338_regmap_range[] =3D {=0A=
+	{=0A=
+		.selector_reg =3D REG5338_PAGE,		/* 255 */=0A=
+		.selector_mask  =3D REG5338_PAGE_MASK,	/* 1 */=0A=
+		.selector_shift =3D 0,=0A=
+		.window_start =3D 0,=0A=
+		.window_len =3D 256,=0A=
+		.range_min =3D 0,=0A=
+		.range_max =3D 347,=0A=
+	},=0A=
+};=0A=
+=0A=
+static const struct regmap_config si5338_regmap_config =3D {=0A=
+	.reg_bits =3D 8,=0A=
+	.val_bits =3D 8,=0A=
+	.cache_type =3D REGCACHE_RBTREE,=0A=
+	.max_register =3D 347,=0A=
+	.ranges =3D si5338_regmap_range,=0A=
+	.num_ranges =3D ARRAY_SIZE(si5338_regmap_range),=0A=
+	.writeable_reg =3D si5338_regmap_is_writeable,=0A=
+	.volatile_reg =3D si5338_regmap_is_volatile,=0A=
+};=0A=
+=0A=
+/*=0A=
+ * SI5338 register access=0A=
+ */=0A=
+static int _verify_output_channel(int chn)=0A=
+{=0A=
+	if (chn < 0 || chn > 3) {=0A=
+		pr_err("Invalid output channel: %d (only 0..3 are allowed)\n",=0A=
+			chn);=0A=
+		return -EINVAL;=0A=
+	}=0A=
+=0A=
+	return 0;=0A=
+}=0A=
+=0A=
+static int set_in_mux(struct si5338_driver_data *drvdata, int data)=0A=
+{=0A=
+	int data1, rc;=0A=
+=0A=
+	switch (data) {=0A=
+	case 0:=0A=
+		data1 =3D 0;=0A=
+		break;=0A=
+	case 1:=0A=
+		data1 =3D 2;=0A=
+		break;=0A=
+	case 2:=0A=
+		data1 =3D 5;=0A=
+		break;=0A=
+	default:=0A=
+		dev_err(&drvdata->client->dev,=0A=
+			"Invalid value for input multiplexer %d\n", data);=0A=
+		return -EINVAL;=0A=
+	}=0A=
+	rc =3D write_field(drvdata, data, AWE_IN_MUX);=0A=
+	if (rc < 0)=0A=
+		return rc;=0A=
+=0A=
+	rc =3D write_field(drvdata, data1, AWE_IN_MUX1);=0A=
+	if (rc < 0)=0A=
+		return rc;=0A=
+=0A=
+	return 0;=0A=
+}=0A=
+=0A=
+static int set_fb_mux(struct si5338_driver_data *drvdata, int data)=0A=
+{=0A=
+	int data1, rc;=0A=
+=0A=
+	switch (data) {=0A=
+	case 0:=0A=
+		data1 =3D 0;=0A=
+		break;=0A=
+	case 1:=0A=
+		data1 =3D 1;=0A=
+		break;=0A=
+	case 2:=0A=
+		data1 =3D 0;=0A=
+		break;=0A=
+	default:=0A=
+		dev_err(&drvdata->client->dev,=0A=
+			"Invalid value for feedback multiplexer %d\n", data);=0A=
+		return -EINVAL;=0A=
+	}=0A=
+	rc =3D write_field(drvdata, data, AWE_FB_MUX);=0A=
+	if (rc < 0)=0A=
+		return rc;=0A=
+=0A=
+	rc =3D write_field(drvdata, data1, AWE_FB_MUX1);=0A=
+	if (rc < 0)=0A=
+		return rc;=0A=
+=0A=
+	return 0;=0A=
+}=0A=
+=0A=
+/*=0A=
+ * PLL has two inputs, each has multiple sources=0A=
+ * 0 - pfd_in_ref=0A=
+ * 1 - pfd_in_fb=0A=
+ */=0A=
+static int get_in_pfd_ref_fb(struct si5338_driver_data *drvdata, int chn)=
=0A=
+{=0A=
+	return read_field(drvdata, chn ? AWE_PFD_FB : AWE_PFD_REF);=0A=
+}=0A=
+=0A=
+static int set_in_pfd_ref_fb(struct si5338_driver_data *drvdata,=0A=
+				u8 val, int chn)=0A=
+{=0A=
+	int rc;=0A=
+=0A=
+	if (val > SI5338_PFD_IN_REF_NOCLK) {=0A=
+		dev_err(&drvdata->client->dev,=0A=
+			"Invalid value for input pfd selector: %d\n", val);=0A=
+		return -EINVAL;=0A=
+	}=0A=
+	rc =3D write_field(drvdata, val, chn ? AWE_PFD_FB : AWE_PFD_REF);=0A=
+	if (rc < 0)=0A=
+		return rc;=0A=
+=0A=
+	return 0;=0A=
+}=0A=
+=0A=
+/*=0A=
+ * Set div for the two dividers=0A=
+ * 0 - p1div=0A=
+ * 1 - p2div=0A=
+ * The dividers have value of 1, 2, 4, 8, 16, 32=0A=
+ */=0A=
+static int set_in_pdiv(struct si5338_driver_data *drvdata, int div, int =
=0A=
chn)=0A=
+{=0A=
+	u8 val;=0A=
+	u32 awe =3D chn ? AWE_P2DIV : AWE_P1DIV;=0A=
+=0A=
+	for (val =3D 0; val < 6; val++) {=0A=
+		if ((1 << val) =3D=3D div)=0A=
+			return write_field(drvdata, val, awe);=0A=
+	}=0A=
+	dev_err(&drvdata->client->dev,=0A=
+		"Invalid value for input divider: %d\n", div);=0A=
+=0A=
+	return -EINVAL;=0A=
+}=0A=
+=0A=
+/*=0A=
+ * Si5338 xtal clock input=0A=
+ * The clock needs to be within [8MHz .. 30MHz]=0A=
+ */=0A=
+static int si5338_xtal_prepare(struct clk_hw *hw)=0A=
+{=0A=
+	struct si5338_driver_data *drvdata =3D=0A=
+		container_of(hw, struct si5338_driver_data, xtal);=0A=
+	unsigned long rate =3D clk_hw_get_rate(hw);=0A=
+	int xtal_mode;=0A=
+=0A=
+	if (rate < XTAL_FREQMIN) {=0A=
+		dev_err(&drvdata->client->dev,=0A=
+			"Xtal input frequency too low: %lu < %llu\n",=0A=
+			rate, XTAL_FREQMIN);=0A=
+		return -EINVAL;=0A=
+	}=0A=
+	if (rate > XTAL_FREQMAX) {=0A=
+		dev_err(&drvdata->client->dev,=0A=
+			"Xtal input frequency too high: %lu > %llu\n",=0A=
+			rate, XTAL_FREQMAX);=0A=
+		return -EINVAL;=0A=
+	}=0A=
+=0A=
+	if (rate > 26000000ll)=0A=
+		xtal_mode =3D 3;=0A=
+	else if (rate > 19000000ll)=0A=
+		xtal_mode =3D 2;=0A=
+	else if (rate > 11000000ll)=0A=
+		xtal_mode =3D 1;=0A=
+	else=0A=
+		xtal_mode =3D 0;=0A=
+=0A=
+	return write_field(drvdata, xtal_mode, AWE_XTAL_FREQ);=0A=
+}=0A=
+=0A=
+static const struct clk_ops si5338_xtal_ops =3D {=0A=
+	.prepare =3D si5338_xtal_prepare,=0A=
+};=0A=
+=0A=
+static unsigned long si5338_clkin_recalc_rate(struct clk_hw *hw,=0A=
+						unsigned long parent_rate)=0A=
+{=0A=
+	struct si5338_hw_data *hwdata =3D HWDATA(hw);=0A=
+	struct si5338_driver_data *drvdata =3D hwdata->drvdata;=0A=
+	unsigned long max_rate;=0A=
+=0A=
+	max_rate =3D (hwdata->num =3D=3D SI5338_INPUT_CLK12 ||=0A=
+		    hwdata->num =3D=3D SI5338_INPUT_CLK56) ?=0A=
+			INFREQMAX : INFREQMAX34;=0A=
+	if (parent_rate  < INFREQMIN) {=0A=
+		dev_err(&drvdata->client->dev,=0A=
+			"Input frequency too low: %lu < %llu\n",=0A=
+			parent_rate, INFREQMIN);=0A=
+		return -EINVAL;=0A=
+	}=0A=
+	if (parent_rate > max_rate) {=0A=
+		dev_err(&drvdata->client->dev,=0A=
+			"Input frequency too high: %lu > %lu\n",=0A=
+			parent_rate, max_rate);=0A=
+		return -EINVAL;=0A=
+	}=0A=
+=0A=
+	return parent_rate;=0A=
+}=0A=
+=0A=
+static const struct clk_ops si5338_clkin_ops =3D {=0A=
+	.recalc_rate =3D si5338_clkin_recalc_rate,=0A=
+};=0A=
+=0A=
+/*=0A=
+ * Si5338 refclk inputs=0A=
+ * Input frequency range=0A=
+ *	IN1/IN2 differential clock [5MHz..710MHz]=0A=
+ *	IN3 single-ended clock [5MHz..200MHz]=0A=
+ * Enforced by si5338_clkin_recalc_rate=0A=
+ */=0A=
+static int si5338_refclk_reparent(struct si5338_driver_data *drvdata, =0A=
u8 index)=0A=
+{=0A=
+	struct si5338_hw_data *hwdata =3D &drvdata->refclk;=0A=
+=0A=
+	hwdata->num =3D SI5338_FB_SRC_NOCLK;=0A=
+	switch (index) {=0A=
+	case SI5338_REF_SRC_XTAL:=0A=
+		/* in mux to XO */=0A=
+		hwdata->num =3D 2;=0A=
+		return set_in_mux(drvdata, 2);=0A=
+	case SI5338_REF_SRC_CLKIN12:=0A=
+		/* in mux to IN12 */=0A=
+		hwdata->num =3D 0;=0A=
+		return set_in_mux(drvdata, 0);=0A=
+	case SI5338_REF_SRC_CLKIN3:=0A=
+		hwdata->num =3D 1;=0A=
+		return set_in_mux(drvdata, 1);=0A=
+	}=0A=
+	dev_err(&drvdata->client->dev,=0A=
+		"Invalid parent (%d) for refclk\n", index);=0A=
+=0A=
+	return -EINVAL;=0A=
+}=0A=
+=0A=
+/*=0A=
+ * refclk's parent=0A=
+ * 0 - IN1/IN2=0A=
+ * 1 - IN3=0A=
+ * 2 - XTAL=0A=
+ */=0A=
+static int si5338_refclk_set_parent(struct clk_hw *hw, u8 index)=0A=
+{=0A=
+	struct si5338_hw_data *hwdata =3D HWDATA(hw);=0A=
+	struct si5338_driver_data *drvdata =3D hwdata->drvdata;=0A=
+=0A=
+	switch (index) {=0A=
+	case 0:=0A=
+		return si5338_refclk_reparent(drvdata, SI5338_REF_SRC_CLKIN12);=0A=
+	case 1:=0A=
+		return si5338_refclk_reparent(drvdata, SI5338_REF_SRC_CLKIN3);=0A=
+	case 2:=0A=
+		return si5338_refclk_reparent(drvdata, SI5338_REF_SRC_XTAL);=0A=
+	}=0A=
+	dev_err(&drvdata->client->dev,=0A=
+		"Invalid parent index for refclk: %d\n", index);=0A=
+=0A=
+	return -EINVAL;=0A=
+}=0A=
+=0A=
+static u8 si5338_refclk_get_parent(struct clk_hw *hw)=0A=
+{=0A=
+	struct si5338_hw_data *hwdata =3D HWDATA(hw);=0A=
+	struct si5338_driver_data *drvdata =3D hwdata->drvdata;=0A=
+=0A=
+	/* get input mux */=0A=
+	return read_field(drvdata, AWE_IN_MUX);=0A=
+}=0A=
+=0A=
+static const struct clk_ops si5338_refclk_ops =3D {=0A=
+	.set_parent =3D si5338_refclk_set_parent,=0A=
+	.get_parent =3D si5338_refclk_get_parent,=0A=
+};=0A=
+=0A=
+/*=0A=
+ * divrefclk's parent is refclk=0A=
+ */=0A=
+static int si5338_divrefclk_prepare(struct clk_hw *hw)=0A=
+{=0A=
+	struct si5338_driver_data *drvdata =3D=0A=
+		container_of(hw, struct si5338_driver_data, divrefclk);=0A=
+	int idiv;=0A=
+	unsigned long parent_rate =3D clk_hw_get_rate(clk_hw_get_parent(hw));=0A=
+=0A=
+	/*=0A=
+	 * Calculate the lowest ratio to divide the input frequency to 40MHz=0A=
+	 * or less=0A=
+	 */=0A=
+	for (idiv =3D 0; idiv < 5; idiv++) {=0A=
+		if ((parent_rate >> idiv) <=3D INFREQDIV)=0A=
+			break;=0A=
+	}=0A=
+=0A=
+	return set_in_pdiv(drvdata, 1 << idiv, 0);=0A=
+}=0A=
+=0A=
+static unsigned long si5338_divrefclk_recalc_rate(struct clk_hw *hw,=0A=
+					   unsigned long parent_rate)=0A=
+{=0A=
+	int idiv;=0A=
+=0A=
+	/*=0A=
+	 * Calculate the lowest ratio to divide the input frequency to 40MHz=0A=
+	 * or less=0A=
+	 */=0A=
+	for (idiv =3D 0; idiv < 5; idiv++) {=0A=
+		if ((parent_rate >> idiv) <=3D INFREQDIV)=0A=
+			break;=0A=
+	}=0A=
+=0A=
+	return parent_rate >> idiv;=0A=
+}=0A=
+=0A=
+static const struct clk_ops si5338_divrefclk_ops =3D {=0A=
+	.recalc_rate =3D si5338_divrefclk_recalc_rate,=0A=
+	.prepare =3D si5338_divrefclk_prepare,=0A=
+};=0A=
+=0A=
+/*=0A=
+ * Si5338 fbclk inputs=0A=
+ * Input frequency range=0A=
+ *	IN4 single-ended clock [5MHz..200MHz]=0A=
+ *	IN5/IN6 differential clock [5MHz..710MHz]=0A=
+ * Enforced by si5338_clkin_recalc_rate=0A=
+ */=0A=
+static int si5338_fbclk_reparent(struct si5338_driver_data *drvdata, u8 =
=0A=
index)=0A=
+{=0A=
+	struct si5338_hw_data *hwdata =3D &drvdata->fbclk;=0A=
+=0A=
+	hwdata->num =3D SI5338_FB_SRC_NOCLK;=0A=
+	switch (index) {=0A=
+	case SI5338_FB_SRC_CLKIN4:=0A=
+		/* in mux to IN4 */=0A=
+		hwdata->num =3D 0;=0A=
+		return set_fb_mux(drvdata, 1);=0A=
+	case SI5338_FB_SRC_CLKIN56:=0A=
+		/* in mux to IN56 */=0A=
+		hwdata->num =3D 1;=0A=
+		return set_fb_mux(drvdata, 0);=0A=
+	case SI5338_FB_SRC_NOCLK:=0A=
+		hwdata->num =3D 2;=0A=
+		return set_fb_mux(drvdata, 2);=0A=
+	}=0A=
+	dev_err(&drvdata->client->dev,=0A=
+		"Invalid parent (%d) for fbclk\n", index);=0A=
+=0A=
+	return -EINVAL;=0A=
+}=0A=
+=0A=
+/*=0A=
+ * fbclk's parent can be=0A=
+ * 0 - IN4=0A=
+ * 1 - IN5/IN6=0A=
+ * 2 - NOCLK=0A=
+ */=0A=
+static int si5338_fbclk_set_parent(struct clk_hw *hw, u8 index)=0A=
+{=0A=
+	struct si5338_hw_data *hwdata =3D HWDATA(hw);=0A=
+	struct si5338_driver_data *drvdata =3D hwdata->drvdata;=0A=
+=0A=
+	switch (index) {=0A=
+	case 0:=0A=
+		return si5338_fbclk_reparent(drvdata, SI5338_FB_SRC_CLKIN4);=0A=
+	case 1:=0A=
+		return si5338_fbclk_reparent(drvdata, SI5338_FB_SRC_CLKIN56);=0A=
+	case 2:=0A=
+		return si5338_fbclk_reparent(drvdata, SI5338_FB_SRC_NOCLK);=0A=
+	}=0A=
+	dev_err(&drvdata->client->dev,=0A=
+		"Invalid parent index for fbclk\n");=0A=
+=0A=
+	return -EINVAL;=0A=
+}=0A=
+=0A=
+static u8 si5338_fbclk_get_parent(struct clk_hw *hw)=0A=
+{=0A=
+	struct si5338_hw_data *hwdata =3D HWDATA(hw);=0A=
+	struct si5338_driver_data *drvdata =3D hwdata->drvdata;=0A=
+	int rc;=0A=
+=0A=
+	/* Return value 0: IN5/IN6=0A=
+	 *		1: IN4=0A=
+	 *		2: noclk=0A=
+	 */=0A=
+	rc =3D read_field(drvdata, AWE_FB_MUX);=0A=
+	switch (rc) {=0A=
+	case 0:=0A=
+		return 1;=0A=
+	case 1:=0A=
+		return 0;=0A=
+	case 2:=0A=
+		return 2;=0A=
+	default:=0A=
+		break;=0A=
+	}=0A=
+=0A=
+	return rc;=0A=
+}=0A=
+=0A=
+static const struct clk_ops si5338_fbclk_ops =3D {=0A=
+	.set_parent =3D si5338_fbclk_set_parent,=0A=
+	.get_parent =3D si5338_fbclk_get_parent,=0A=
+};=0A=
+=0A=
+/*=0A=
+ * divfbclk's parent is fbclk=0A=
+ */=0A=
+static int si5338_divfbclk_prepare(struct clk_hw *hw)=0A=
+{=0A=
+	struct si5338_driver_data *drvdata =3D=0A=
+		container_of(hw, struct si5338_driver_data, divfbclk);=0A=
+	int idiv;=0A=
+	unsigned long parent_rate =3D clk_hw_get_rate(clk_hw_get_parent(hw));=0A=
+=0A=
+	for (idiv =3D 0; idiv < 5; idiv++) {=0A=
+		if ((parent_rate >> idiv) <=3D INFREQDIV)=0A=
+			break;=0A=
+	}=0A=
+=0A=
+	return set_in_pdiv(drvdata, 1 << idiv, 1);=0A=
+}=0A=
+=0A=
+static unsigned long si5338_divfbclk_recalc_rate(struct clk_hw *hw,=0A=
+					   unsigned long parent_rate)=0A=
+{=0A=
+	int idiv;=0A=
+=0A=
+	for (idiv =3D 0; idiv < 5; idiv++) {=0A=
+		if ((parent_rate >> idiv) <=3D INFREQDIV)=0A=
+			break;=0A=
+	}=0A=
+=0A=
+	return parent_rate >> idiv;=0A=
+}=0A=
+=0A=
+static const struct clk_ops si5338_divfbclk_ops =3D {=0A=
+	.recalc_rate =3D si5338_divfbclk_recalc_rate,=0A=
+	.prepare =3D si5338_divfbclk_prepare,=0A=
+};=0A=
+=0A=
+/*=0A=
+ * PLL and MultiSynth=0A=
+ */=0A=
+static int remove_common_factor(u64 *num_denom)=0A=
+{=0A=
+	u64 a, b, r;=0A=
+=0A=
+	if (!num_denom[1])=0A=
+		return -1; /* zero denominator */=0A=
+=0A=
+	if (!num_denom[0]) {=0A=
+		num_denom[1] =3D 1;=0A=
+		return 1;=0A=
+	}=0A=
+=0A=
+	a =3D max(num_denom[0], num_denom[1]);=0A=
+	b =3D min(num_denom[0], num_denom[1]);=0A=
+	r =3D b;=0A=
+	while (r > 1) {=0A=
+		r =3D a - b * div64_u64(a, b);=0A=
+		if (!r) {=0A=
+			num_denom[0] =3D div64_u64(num_denom[0], b);=0A=
+			num_denom[1] =3D div64_u64(num_denom[1], b);=0A=
+			return 1;=0A=
+		}=0A=
+		a =3D b;=0A=
+		b =3D r;=0A=
+	}=0A=
+=0A=
+	return 0; /* nothing done */=0A=
+}=0A=
+=0A=
+static const u32 awe_msx[5][3][5] =3D {=0A=
+	{=0A=
+		{=0A=
+			AWE_MS0_P1_07_00,=0A=
+			AWE_MS0_P1_15_08,=0A=
+			AWE_MS0_P1_17_16,=0A=
+			0,=0A=
+			0=0A=
+		},=0A=
+		{=0A=
+			AWE_MS0_P2_05_00,=0A=
+			AWE_MS0_P2_13_06,=0A=
+			AWE_MS0_P2_21_14,=0A=
+			AWE_MS0_P2_29_22,=0A=
+			0=0A=
+		},=0A=
+		{=0A=
+			AWE_MS0_P3_07_00,=0A=
+			AWE_MS0_P3_15_08,=0A=
+			AWE_MS0_P3_23_16,=0A=
+			AWE_MS0_P3_29_24,=0A=
+			0=0A=
+		}=0A=
+	},=0A=
+	{=0A=
+		{=0A=
+			AWE_MS1_P1_07_00,=0A=
+			AWE_MS1_P1_15_08,=0A=
+			AWE_MS1_P1_17_16,=0A=
+			0,=0A=
+			0=0A=
+		},=0A=
+		{=0A=
+			AWE_MS1_P2_05_00,=0A=
+			AWE_MS1_P2_13_06,=0A=
+			AWE_MS1_P2_21_14,=0A=
+			AWE_MS1_P2_29_22,=0A=
+			0=0A=
+		},=0A=
+		{=0A=
+			AWE_MS1_P3_07_00,=0A=
+			AWE_MS1_P3_15_08,=0A=
+			AWE_MS1_P3_23_16,=0A=
+			AWE_MS1_P3_29_24,=0A=
+			0=0A=
+		}=0A=
+	},=0A=
+	{=0A=
+		{=0A=
+			AWE_MS2_P1_07_00,=0A=
+			AWE_MS2_P1_15_08,=0A=
+			AWE_MS2_P1_17_16,=0A=
+			0,=0A=
+			0=0A=
+		},=0A=
+		{=0A=
+			AWE_MS2_P2_05_00,=0A=
+			AWE_MS2_P2_13_06,=0A=
+			AWE_MS2_P2_21_14,=0A=
+			AWE_MS2_P2_29_22,=0A=
+			0=0A=
+		},=0A=
+		{=0A=
+			AWE_MS2_P3_07_00,=0A=
+			AWE_MS2_P3_15_08,=0A=
+			AWE_MS2_P3_23_16,=0A=
+			AWE_MS2_P3_29_24,=0A=
+			0=0A=
+		}=0A=
+	},=0A=
+	{=0A=
+		{=0A=
+			AWE_MS3_P1_07_00,=0A=
+			AWE_MS3_P1_15_08,=0A=
+			AWE_MS3_P1_17_16,=0A=
+			0,=0A=
+			0=0A=
+		},=0A=
+		{=0A=
+			AWE_MS3_P2_05_00,=0A=
+			AWE_MS3_P2_13_06,=0A=
+			AWE_MS3_P2_21_14,=0A=
+			AWE_MS3_P2_29_22,=0A=
+			0=0A=
+		},=0A=
+		{=0A=
+			AWE_MS3_P3_07_00,=0A=
+			AWE_MS3_P3_15_08,=0A=
+			AWE_MS3_P3_23_16,=0A=
+			AWE_MS3_P3_29_24,=0A=
+			0=0A=
+		}=0A=
+	},=0A=
+	{=0A=
+		{=0A=
+			AWE_MSN_P1_07_00,=0A=
+			AWE_MSN_P1_15_08,=0A=
+			AWE_MSN_P1_17_16,=0A=
+			0,=0A=
+			0=0A=
+		},=0A=
+		{=0A=
+			AWE_MSN_P2_05_00,=0A=
+			AWE_MSN_P2_13_06,=0A=
+			AWE_MSN_P2_21_14,=0A=
+			AWE_MSN_P2_29_22,=0A=
+			0=0A=
+		},=0A=
+		{=0A=
+			AWE_MSN_P3_07_00,=0A=
+			AWE_MSN_P3_15_08,=0A=
+			AWE_MSN_P3_23_16,=0A=
+			AWE_MSN_P3_29_24,=0A=
+			0=0A=
+		}=0A=
+	}=0A=
+};=0A=
+=0A=
+static int _verify_ms_channel(struct device *dev, int chn)=0A=
+{=0A=
+	if (chn < 0 || chn > 4) {=0A=
+		dev_err(dev,=0A=
+			"Invalid channel %d. Only 0,1,2,3 and 4 (for MSN) are supported\n",=0A=
+			chn);=0A=
+		return -EINVAL;=0A=
+	}=0A=
+=0A=
+	return 0;=0A=
+}=0A=
+=0A=
+/*=0A=
+ * Read parameters of=0A=
+ * 0 - MS0=0A=
+ * 1 - MS1=0A=
+ * 2 - MS2=0A=
+ * 3 - MS3=0A=
+ * 4 - MSN (PLL)=0A=
+ */=0A=
+static int get_ms_p(struct si5338_driver_data *drvdata, u32 *p, int chn)=
=0A=
+{=0A=
+	int i, rc;=0A=
+	u64 data;=0A=
+=0A=
+	rc =3D _verify_ms_channel(&drvdata->client->dev, chn);=0A=
+	if (rc < 0)=0A=
+		return rc;=0A=
+=0A=
+	for (i =3D 0; i < 3; i++) {=0A=
+		rc =3D read_multireg64(drvdata, awe_msx[chn][i], &data);=0A=
+		if (rc < 0)=0A=
+			return rc;=0A=
+=0A=
+		p[i] =3D (u32)data;	/* only use up to 30 bit here */=0A=
+	}=0A=
+=0A=
+	return 0;=0A=
+}=0A=
+=0A=
+/*=0A=
+ * Calculte MS ratio from parameters=0A=
+ * ms =3D a + b / c, where=0A=
+ *	a =3D ms[0], b =3D ms[1], c =3D ms[2]=0A=
+ * SI5338 RM states the formula of parameters as:=0A=
+ *	p1 =3D floor(((a * c + b) * 128) / c - 512)=0A=
+ *	p2 =3D mod((b * 128), c)=0A=
+ *	p3 =3D c=0A=
+ * To reverse the formula, we have=0A=
+ *	b * 128 =3D k * c + p2; k < 128, p2 < c=0A=
+ *	p1 =3D floor(((a * c + b) * 128) / c - 512)=0A=
+ *	   =3D a * 128 + floor((b * 128) / c) - 512=0A=
+ *	   =3D a * 128 + k - 512=0A=
+ *	k =3D mod(p1, 128) =3D p1 & 0x7f=0A=
+ *	c =3D p3=0A=
+ *	b =3D (k * c + p2) / 128 =3D ((p1 & 0x7f) * p3 + p2) >> 7=0A=
+ *	a =3D (p1 + 512) >> 7 =3D (p1 >> 7) + 4=0A=
+ */=0A=
+static int p_to_ms(u64 *ms, u32 *p)=0A=
+{=0A=
+	if (!p[0] && !p[1] && !p[2]) {=0A=
+		/* uninitialized parameters in device */=0A=
+		ms[0] =3D 0;=0A=
+		ms[1] =3D 0;=0A=
+		ms[2] =3D 1;=0A=
+	} else {=0A=
+		/* c =3D p3 */=0A=
+		ms[2] =3D p[2];=0A=
+		/* b =3D (c * (p1 & 0x7f) + p2) >> 7 */=0A=
+		ms[1] =3D (ms[2] * (p[0] & 0x7f) + p[1]) >> 7;=0A=
+		/* a =3D (p1 >> 7) + 4 */=0A=
+		ms[0] =3D (p[0] >> 7) + 4;=0A=
+	}=0A=
+	pr_debug("ms[]=3D%llu + %llu/%llu, p=3D%u %u %u\n",=0A=
+		 ms[0], ms[1], ms[2], p[0], p[1], p[2]);=0A=
+=0A=
+	return 0;=0A=
+}=0A=
+=0A=
+static const u32 awe_ms_hs[] =3D {=0A=
+	AWE_MS0_HS,=0A=
+	AWE_MS1_HS,=0A=
+	AWE_MS2_HS,=0A=
+	AWE_MS3_HS=0A=
+};=0A=
+=0A=
+/*=0A=
+ * Read parameters of=0A=
+ * 0 - MS0=0A=
+ * 1 - MS1=0A=
+ * 2 - MS2=0A=
+ * 3 - MS3=0A=
+ * 4 - MSN (PLL)=0A=
+ */=0A=
+static int set_ms_p(struct si5338_driver_data *drvdata,=0A=
+			u32 *p, int chn)=0A=
+{=0A=
+	int i, rc, hs =3D 0;=0A=
+=0A=
+	rc =3D _verify_ms_channel(&drvdata->client->dev, chn);=0A=
+	if (rc < 0)=0A=
+		return rc;=0A=
+=0A=
+	/* high speed bit programming */=0A=
+	if (p[0] < 512) { /* div less than 8 */=0A=
+		if (p[0] < 128)=0A=
+			p[0] =3D 0;=0A=
+		else=0A=
+			p[0] =3D 256;=0A=
+		p[1] =3D 0;=0A=
+		p[2] =3D 1;=0A=
+		hs =3D 1;=0A=
+		dev_dbg(&drvdata->client->dev,=0A=
+			"Using high speed divider option on ms%d",=0A=
+			chn);=0A=
+	}=0A=
+=0A=
+	rc =3D write_field(drvdata, hs, awe_ms_hs[chn]);=0A=
+	if (rc < 0)=0A=
+		return rc;=0A=
+=0A=
+	for (i =3D 0; i < 3; i++) {=0A=
+		rc =3D write_multireg64(drvdata, (u64)p[i],=0A=
+				      awe_msx[chn][i]);=0A=
+		if (rc < 0)=0A=
+			return rc;=0A=
+	}=0A=
+=0A=
+	return 0;=0A=
+}=0A=
+=0A=
+/*=0A=
+ * Calculate parameters=0A=
+ * ms =3D ms[0] + ms[1] / ms[2]=0A=
+ *=0A=
+ * SI5338 RM stats the fomula of parameters as=0A=
+ *	p[0] =3D floor(((ms[0] * ms[2] + ms[1]) * 128) / ms[2] - 512)=0A=
+ *	p[1] =3D mod((ms[1] * 128), ms[2])=0A=
+ *	p[2] =3D ms[2]=0A=
+ */=0A=
+static int ms_to_p(u64 *ms, u32 *p)=0A=
+{=0A=
+	u64 d;=0A=
+	u64 ms_denom =3D ms[2], ms_num =3D ms[1], ms_int =3D ms[0];=0A=
+=0A=
+	while (ms_denom >=3D (1 << 30) || !((ms_denom | ms_num) & 1)) {=0A=
+		ms_denom >>=3D 1;=0A=
+		ms_num >>=3D 1;=0A=
+	}=0A=
+	if (!ms_num || !ms_denom) {=0A=
+		ms_denom =3D 1;=0A=
+		ms_num =3D 0;=0A=
+	}=0A=
+	d =3D (ms_int * ms_denom + ms_num) << 7;=0A=
+	p[0] =3D (u32)(div64_u64(d, ms_denom) - 512);=0A=
+	d =3D div64_u64((ms_num << 7), ms_denom);=0A=
+	p[1] =3D (u32)((ms_num << 7) - d * ms_denom);=0A=
+	p[2] =3D ms_denom;=0A=
+	pr_debug("ms[]=3D%llu + %llu/%llu Hz, ms_int=3D%llu, ms_num=3D%llu, =0A=
ms_denom=3D%llu p=3D%u %u %u\n",=0A=
+		 ms[0], ms[1], ms[2], ms_int, ms_num, ms_denom,=0A=
+		 p[0], p[1], p[2]);=0A=
+=0A=
+	return 0;=0A=
+}=0A=
+=0A=
+/*=0A=
+ * Calculate MultiSynth divider (MS0..MS3) for specified output frequency=
=0A=
+ */=0A=
+static void cal_ms_p(unsigned long numerator,=0A=
+			unsigned long denominator,=0A=
+			u32 *p)=0A=
+{=0A=
+	u64 ms[3];=0A=
+=0A=
+	ms[1] =3D numerator;=0A=
+	ms[2] =3D denominator;=0A=
+	ms[0] =3D div64_u64(ms[1], ms[2]);=0A=
+	ms[1] -=3D ms[0] * ms[2];=0A=
+	while (ms[2] >=3D (1 << 30)) { /* trim */=0A=
+		ms[2] >>=3D 1;=0A=
+		ms[1] >>=3D 1;=0A=
+	}=0A=
+	remove_common_factor(&ms[1]);=0A=
+=0A=
+	if (ms[0] < MSINT_MIN) {=0A=
+		pr_warn("Calculated MSN ratio is too low: %llu < %u\n",=0A=
+			ms[0], MSINT_MIN);=0A=
+		ms[0] =3D MSINT_MIN;=0A=
+	} else if (ms[0] =3D=3D 5 || ms[0] =3D=3D 7) {=0A=
+		pr_warn("MSN ratio %llu is invalid\n", ms[0]);=0A=
+		ms[0] +=3D 1;=0A=
+	} else if (ms[0] > MSINT_MAX) {=0A=
+		pr_warn("Calculated MSN ratio is too high: %llu > %u\n",=0A=
+			ms[0], MSINT_MAX);=0A=
+		ms[0] =3D MSINT_MAX;=0A=
+	}=0A=
+	pr_debug("MS divider: %llu+%llu/%llu\n", ms[0], ms[1], ms[2]);=0A=
+=0A=
+	ms_to_p(ms, p);=0A=
+}=0A=
+=0A=
+/*=0A=
+ * Si5338 pll section=0A=
+ */=0A=
+static int si5338_pll_prepare(struct clk_hw *hw)=0A=
+{=0A=
+	struct si5338_hw_data *hwdata =3D HWDATA(hw);=0A=
+	struct si5338_driver_data *drvdata =3D hwdata->drvdata;=0A=
+	int rc;=0A=
+	s64 pll_in_freq;=0A=
+	s64 K, Q, kphi_num, kphi_denom, fvco_mhz, fpfd_mhz;=0A=
+	int rsel, bwsel, vco_gain, pll_kphi, mscal, ms_pec;=0A=
+	u8 vco_gain_rsel_bwsel;=0A=
+=0A=
+	pll_in_freq =3D clk_hw_get_rate(clk_hw_get_parent(hw));=0A=
+	if (!pll_in_freq) {=0A=
+		dev_err(&drvdata->client->dev, "Invalid input clock for pll\n");=0A=
+		return -EINVAL;=0A=
+	}=0A=
+	if (!clk_get_rate(hw->clk)) {=0A=
+		dev_err(&drvdata->client->dev, "Invalid clock rate for pll\n");=0A=
+		return -EINVAL;=0A=
+	}=0A=
+=0A=
+	fvco_mhz =3D div64_u64(clk_hw_get_rate(hw), 1000000ll);=0A=
+	fpfd_mhz =3D div64_u64(pll_in_freq, 1000000ll);=0A=
+	if (fpfd_mhz >=3D 15) {=0A=
+		K =3D 925;=0A=
+		rsel =3D 0;=0A=
+		bwsel =3D 0;=0A=
+	} else if (fpfd_mhz >=3D 8) {=0A=
+		K =3D 325;=0A=
+		rsel =3D 1;=0A=
+		bwsel =3D 1;=0A=
+	} else {=0A=
+		K =3D 185;=0A=
+		rsel =3D 3;=0A=
+		bwsel =3D 2;=0A=
+	}=0A=
+	if (fvco_mhz > 2425) {=0A=
+		Q =3D 3;=0A=
+		vco_gain =3D 0;=0A=
+	} else {=0A=
+		Q =3D 4;=0A=
+		vco_gain =3D 1;=0A=
+	}=0A=
+	kphi_num =3D K * 2500LL * 2500LL * 2500LL;=0A=
+	kphi_denom =3D 533LL * Q * fpfd_mhz * fvco_mhz * fvco_mhz;=0A=
+	pll_kphi =3D (int)div64_u64(kphi_num + (kphi_denom >> 1), kphi_denom);=0A=
+	if (pll_kphi < 1 || pll_kphi > 127) {=0A=
+		dev_warn(&drvdata->client->dev,=0A=
+			"Calculated PLL_KPHI does not fit 1<=3D%d<=3D127\n",=0A=
+			pll_kphi);=0A=
+		if (pll_kphi < 1)=0A=
+			pll_kphi =3D 1;=0A=
+		else if (pll_kphi > 127)=0A=
+			pll_kphi =3D 127;=0A=
+	}=0A=
+	mscal =3D (int)div64_u64(2067000 - 667 * fvco_mhz + 50000, 100000ll);=0A=
+	if (mscal < 0 || mscal > 63) {=0A=
+		dev_warn(&drvdata->client->dev,=0A=
+			"Calculated MSCAL does not fit 0<=3D%d<=3D63\n",=0A=
+			mscal);=0A=
+		if (mscal < 0)=0A=
+			mscal =3D 0;=0A=
+		else if (mscal > 63)=0A=
+			mscal =3D 63;=0A=
+	}=0A=
+	ms_pec =3D 7;=0A=
+	dev_dbg(&drvdata->client->dev,=0A=
+		"Calculated values: PLL_KPHI=3D%d K=3D%lld RSEL=3D%d BWSEL=3D%d VCO_GAIN=
=3D%d =0A=
MSCAL=3D%d MS_PEC=3D%d\n",=0A=
+		pll_kphi, K, rsel, bwsel, vco_gain, mscal, ms_pec);=0A=
+=0A=
+	/* setting actual registers */=0A=
+	rc =3D write_field(drvdata, pll_kphi, AWE_PLL_KPHI);=0A=
+	if (rc < 0)=0A=
+		return rc;=0A=
+=0A=
+	vco_gain_rsel_bwsel =3D (vco_gain & 7) << 4;=0A=
+	vco_gain_rsel_bwsel |=3D (rsel & 3) << 2;=0A=
+	vco_gain_rsel_bwsel |=3D bwsel & 3;=0A=
+	rc =3D write_field(drvdata, vco_gain_rsel_bwsel, AWE_VCO_GAIN_RSEL_BWSEL)=
;=0A=
+	if (rc < 0)=0A=
+		return rc;=0A=
+=0A=
+	rc =3D write_field(drvdata, mscal, AWE_MSCAL);=0A=
+	if (rc < 0)=0A=
+		return rc;=0A=
+=0A=
+	rc =3D write_field(drvdata, ms_pec, AWE_MS_PEC);=0A=
+	if (rc < 0)=0A=
+		return rc;=0A=
+=0A=
+	rc =3D write_field(drvdata, 3, AWE_PLL_EN);=0A=
+	if (rc < 0)=0A=
+		return rc; /* enable PLL */=0A=
+=0A=
+	return 0;=0A=
+}=0A=
+=0A=
+static int si5338_pll_reparent(struct si5338_driver_data *drvdata,=0A=
+				u8 index)=0A=
+{=0A=
+	struct si5338_hw_data *hwdata =3D &drvdata->pll;=0A=
+	int rc =3D -EINVAL;=0A=
+=0A=
+	hwdata->num =3D SI5338_PFD_IN_REF_NOCLK;=0A=
+	switch (index) {=0A=
+	case SI5338_PFD_IN_REF_REFCLK:=0A=
+	case SI5338_PFD_IN_REF_FBCLK:=0A=
+	case SI5338_PFD_IN_REF_DIVREFCLK:=0A=
+	case SI5338_PFD_IN_REF_DIVFBCLK:=0A=
+	case SI5338_PFD_IN_REF_XOCLK:=0A=
+	case SI5338_PFD_IN_REF_NOCLK:=0A=
+		/* pfd_in_ref mux */=0A=
+		rc =3D set_in_pfd_ref_fb(drvdata, index, 0);=0A=
+		break;=0A=
+	default:=0A=
+		dev_err(&drvdata->client->dev,=0A=
+			"Invalid pfd_in_ref mux selection %d\n",=0A=
+			index);=0A=
+		break;=0A=
+	}=0A=
+=0A=
+	if (!rc)=0A=
+		hwdata->num =3D index;	/* record the source of pll */=0A=
+=0A=
+	return rc;=0A=
+}=0A=
+=0A=
+static unsigned char si5338_pll_get_parent(struct clk_hw *hw)=0A=
+{=0A=
+	struct si5338_hw_data *hwdata =3D HWDATA(hw);=0A=
+	struct si5338_driver_data *drvdata =3D hwdata->drvdata;=0A=
+	int pfd_in_ref;=0A=
+=0A=
+	/* Get pfd_in_ref mux value */=0A=
+	pfd_in_ref =3D get_in_pfd_ref_fb(drvdata, 0);=0A=
+	if (pfd_in_ref < 0) {=0A=
+		dev_err(&drvdata->client->dev,=0A=
+			"Error getting pfd_in_ref mux\n");=0A=
+		/* In case reading register fails, set to 0 */=0A=
+		pfd_in_ref =3D 0;=0A=
+	}=0A=
+	hwdata->num =3D pfd_in_ref;=0A=
+=0A=
+	return pfd_in_ref;=0A=
+}=0A=
+=0A=
+static int si5338_pll_set_parent(struct clk_hw *hw, u8 index)=0A=
+{=0A=
+	struct si5338_hw_data *hwdata =3D HWDATA(hw);=0A=
+=0A=
+	return si5338_pll_reparent(hwdata->drvdata, index);=0A=
+}=0A=
+=0A=
+static unsigned long si5338_pll_recalc_rate(struct clk_hw *hw,=0A=
+					    unsigned long parent_rate)=0A=
+{=0A=
+	struct si5338_hw_data *hwdata =3D HWDATA(hw);=0A=
+	struct si5338_driver_data *drvdata =3D hwdata->drvdata;=0A=
+	int rc;=0A=
+	u64 rate[3], ms[3], ms_scaled;=0A=
+=0A=
+	if (!hwdata->params.valid) {=0A=
+		rc =3D get_ms_p(drvdata, hwdata->params.p, 4);=0A=
+		if (rc < 0) {=0A=
+			dev_err(&drvdata->client->dev,=0A=
+				"Error reading ms register\n");=0A=
+			return 0;=0A=
+		}=0A=
+		hwdata->params.valid =3D true;=0A=
+	}=0A=
+=0A=
+	p_to_ms(ms, hwdata->params.p);=0A=
+	if (unlikely(!ms[2])) {=0A=
+		/*=0A=
+		 * This should not happen. Instead of crashing the system,=0A=
+		 * set divisor to 1 and let the calculation continue.=0A=
+		 */=0A=
+		dev_warn(&drvdata->client->dev,=0A=
+			"Error %s calculating pll\n", __func__);=0A=
+		ms[2] =3D 1;=0A=
+	}=0A=
+	ms_scaled =3D ms[0] * ms[2] + ms[1];=0A=
+	if (!ms_scaled)	/* uninitialzied */=0A=
+		return 0;=0A=
+=0A=
+	rate[2] =3D ms[2];=0A=
+	rate[1] =3D parent_rate * ms_scaled;=0A=
+	rate[0] =3D div64_u64(rate[1], rate[2]);=0A=
+	rate[1] -=3D rate[0] * rate[2];=0A=
+	remove_common_factor(&rate[1]);=0A=
+	dev_dbg(&drvdata->client->dev,=0A=
+		"PLL output frequency: %llu+%llu/%llu Hz\n",=0A=
+		rate[0], rate[1], rate[2]);=0A=
+=0A=
+	return rate[0];=0A=
+}=0A=
+=0A=
+static long si5338_pll_round_rate(struct clk_hw *hw, unsigned long rate,=
=0A=
+				  unsigned long *parent_rate)=0A=
+{=0A=
+	struct si5338_hw_data *hwdata =3D HWDATA(hw);=0A=
+	struct si5338_driver_data *drvdata =3D hwdata->drvdata;=0A=
+	u64 ms[] =3D {0, 0, 1};=0A=
+	u64 new_rate[3], ms_scaled;=0A=
+=0A=
+	if (unlikely(rate < FVCOMIN))=0A=
+		rate =3D FVCOMIN;=0A=
+	else if (unlikely(rate > FVCOMAX))=0A=
+		rate =3D FVCOMAX;=0A=
+=0A=
+	cal_ms_p(rate, *parent_rate, hwdata->params.p);=0A=
+	hwdata->params.valid =3D true;=0A=
+=0A=
+	p_to_ms(ms, hwdata->params.p);=0A=
+	ms_scaled =3D ms[0] * ms[2] + ms[1];=0A=
+=0A=
+	new_rate[2] =3D ms[2];=0A=
+	new_rate[1] =3D *parent_rate * ms_scaled;=0A=
+	new_rate[0] =3D div64_u64(new_rate[1], new_rate[2]);=0A=
+	new_rate[1] -=3D new_rate[0] * new_rate[2];=0A=
+	remove_common_factor(&new_rate[1]);=0A=
+	dev_dbg(&drvdata->client->dev,=0A=
+		"PLL output frequency: %llu+%llu/%llu Hz\n",=0A=
+		new_rate[0], new_rate[1], new_rate[2]);=0A=
+=0A=
+	return new_rate[0];=0A=
+}=0A=
+=0A=
+static int si5338_pll_set_rate(struct clk_hw *hw, unsigned long rate,=0A=
+				unsigned long parent_rate)=0A=
+{=0A=
+	struct si5338_hw_data *hwdata =3D HWDATA(hw);=0A=
+	struct si5338_driver_data *drvdata =3D hwdata->drvdata;=0A=
+=0A=
+	if (unlikely(rate < FVCOMIN))=0A=
+		rate =3D FVCOMIN;=0A=
+	else if (unlikely(rate > FVCOMAX))=0A=
+		rate =3D FVCOMAX;=0A=
+	cal_ms_p(rate, parent_rate, hwdata->params.p);=0A=
+	hwdata->params.valid =3D true;=0A=
+=0A=
+	return set_ms_p(drvdata, hwdata->params.p, 4);=0A=
+}=0A=
+=0A=
+static const struct clk_ops si5338_pll_ops =3D {=0A=
+	.prepare =3D si5338_pll_prepare,=0A=
+	.set_parent =3D si5338_pll_set_parent,=0A=
+	.get_parent =3D si5338_pll_get_parent,=0A=
+	.recalc_rate =3D si5338_pll_recalc_rate,=0A=
+	.round_rate =3D si5338_pll_round_rate,=0A=
+	.set_rate =3D si5338_pll_set_rate,=0A=
+};=0A=
+=0A=
+/*=0A=
+ * Si5338 multisynth divider=0A=
+ */=0A=
+=0A=
+static const u32 awe_ms_powerdown[] =3D {=0A=
+	AWE_MS0_PDN,=0A=
+	AWE_MS1_PDN,=0A=
+	AWE_MS2_PDN,=0A=
+	AWE_MS3_PDN=0A=
+};=0A=
+=0A=
+static int set_ms_powerdown(struct si5338_driver_data *drvdata,=0A=
+			     int down, int chn)=0A=
+{=0A=
+	if (chn < 0 || chn > 3)=0A=
+		return -EINVAL;=0A=
+=0A=
+	return write_field(drvdata, down, awe_ms_powerdown[chn]);=0A=
+}=0A=
+=0A=
+static int si5338_msynth_prepare(struct clk_hw *hw)=0A=
+{=0A=
+	struct si5338_hw_data *hwdata =3D HWDATA(hw);=0A=
+	struct si5338_driver_data *drvdata =3D hwdata->drvdata;=0A=
+=0A=
+	return set_ms_powerdown(drvdata, MS_POWER_UP, hwdata->num);=0A=
+}=0A=
+=0A=
+static void si5338_msynth_unprepare(struct clk_hw *hw)=0A=
+{=0A=
+	struct si5338_hw_data *hwdata =3D HWDATA(hw);=0A=
+	struct si5338_driver_data *drvdata =3D hwdata->drvdata;=0A=
+=0A=
+	set_ms_powerdown(drvdata, MS_POWER_DOWN, hwdata->num);=0A=
+}=0A=
+=0A=
+static unsigned long si5338_msynth_recalc_rate(struct clk_hw *hw,=0A=
+					       unsigned long parent_rate)=0A=
+{=0A=
+	struct si5338_hw_data *hwdata =3D HWDATA(hw);=0A=
+	struct si5338_driver_data *drvdata =3D hwdata->drvdata;=0A=
+	int rc;=0A=
+	u64 rate[3], ms[3], ms_scaled;=0A=
+=0A=
+	if (!hwdata->params.valid) {=0A=
+		rc =3D get_ms_p(drvdata, hwdata->params.p, hwdata->num);=0A=
+		if (rc < 0)=0A=
+			return 0;=0A=
+		hwdata->params.valid =3D true;=0A=
+	}=0A=
+=0A=
+	p_to_ms(ms, hwdata->params.p);=0A=
+	if (unlikely(!ms[2])) {=0A=
+		/* This should not happen */=0A=
+		dev_warn(&drvdata->client->dev,=0A=
+			"Error %s calculating MS%d\n", __func__, hwdata->num);=0A=
+		ms[2] =3D 1;=0A=
+	}=0A=
+	/* trim MS divider fraction */=0A=
+	while (ms[2] >=3D 0x1000) {=0A=
+		ms[1] >>=3D 1;=0A=
+		ms[2] >>=3D 1;=0A=
+	}=0A=
+	ms_scaled =3D ms[0] * ms[2] + ms[1];=0A=
+	if (!ms_scaled)	/* uninitialized */=0A=
+		return 0;=0A=
+=0A=
+	rate[2] =3D ms_scaled;=0A=
+	rate[1] =3D parent_rate * ms[2];=0A=
+	rate[0] =3D div64_u64(rate[1], rate[2]);=0A=
+	rate[1] -=3D rate[0] * rate[2];=0A=
+	remove_common_factor(&rate[1]);=0A=
+	dev_dbg(&drvdata->client->dev,=0A=
+		"MS%d output frequency: %llu+%llu/%llu Hz\n",=0A=
+		hwdata->num, rate[0], rate[1], rate[2]);=0A=
+=0A=
+	return rate[0];=0A=
+}=0A=
+=0A=
+/*=0A=
+ * Based on PLL input clock, estimate best ratio for desired output=0A=
+ * if pll vco is not specified.=0A=
+ */=0A=
+static long si5338_msynth_round_rate(struct clk_hw *hw, unsigned long rate=
,=0A=
+				     unsigned long *parent_rate)=0A=
+{=0A=
+	struct si5338_hw_data *hwdata =3D HWDATA(hw);=0A=
+	struct si5338_driver_data *drvdata =3D hwdata->drvdata;=0A=
+	s64 rate_scaled, pll_in_freq;=0A=
+	s64 center, center_diff, best_center_diff =3D 0;=0A=
+	s64 out_div, best_out_div =3D 1;=0A=
+	s64 d, in_div, best_in_div;=0A=
+	s64 err, best_err =3D 0;=0A=
+	s64 synth_out;=0A=
+	u64 ms[3];=0A=
+=0A=
+	if (__clk_get_flags(hw->clk) & CLK_SET_RATE_PARENT) {=0A=
+		/*=0A=
+		 * Get rate of the parent of PLL=0A=
+		 * (could be refclk, fbclk, etc.)=0A=
+		 */=0A=
+		pll_in_freq =3D clk_hw_get_rate(=0A=
+				clk_hw_get_parent(clk_hw_get_parent(hw)));=0A=
+		if (!pll_in_freq) {=0A=
+			dev_err(&drvdata->client->dev,=0A=
+				"Invalid input clock for MS%d\n",=0A=
+				hwdata->num);=0A=
+			return -EINVAL;=0A=
+		}=0A=
+=0A=
+		center =3D (FVCOMAX + FVCOMIN) >> 1;=0A=
+=0A=
+		best_in_div =3D 0;=0A=
+		for (out_div =3D 4; out_div <=3D MSINT_MAX; out_div++) {=0A=
+			if (out_div =3D=3D 5 || out_div =3D=3D 7)=0A=
+				continue;=0A=
+=0A=
+			/* here scaled by denominator */=0A=
+			rate_scaled =3D rate * out_div;=0A=
+			if (rate_scaled < FVCOMIN || rate_scaled > FVCOMAX)=0A=
+				continue;=0A=
+=0A=
+			in_div =3D div64_u64(rate_scaled +=0A=
+					   (pll_in_freq >> 1),=0A=
+					   pll_in_freq); /* round */=0A=
+=0A=
+			/* actual pll frequency scaled by out_denom */=0A=
+			d =3D pll_in_freq * in_div;=0A=
+			synth_out =3D div64_u64(d + (out_div >> 1), out_div);=0A=
+			center_diff =3D d - center;=0A=
+			if (center_diff < 0)=0A=
+				center_diff =3D -center_diff;=0A=
+			err =3D synth_out - rate;=0A=
+			if (err < 0)=0A=
+				err =3D -err;=0A=
+			if (!best_in_div || err < best_err ||=0A=
+			    (err =3D=3D best_err &&=0A=
+			     center_diff < best_center_diff)) {=0A=
+				dev_dbg(&drvdata->client->dev,=0A=
+					"synth_out: %lld center: %lld rate:%lu err: %lld (%lld) =0A=
center_diff:%lld(%lld)\n",=0A=
+					synth_out, center, rate, err, best_err,=0A=
+					center_diff, best_center_diff);=0A=
+				best_err =3D err;=0A=
+				best_in_div =3D in_div;=0A=
+				best_out_div =3D out_div;=0A=
+				best_center_diff =3D center_diff;=0A=
+			}=0A=
+		}=0A=
+		if (!best_in_div) {=0A=
+			dev_warn(&drvdata->client->dev,=0A=
+				 "Failed to find suitable integer coefficients for pll input %lld =0A=
Hz\n",=0A=
+				 pll_in_freq);=0A=
+		}=0A=
+		*parent_rate =3D pll_in_freq * best_in_div;=0A=
+		rate =3D *parent_rate / (unsigned long)best_out_div;=0A=
+		dev_dbg(&drvdata->client->dev,=0A=
+			"Best MS output frequency: %lu Hz, MS input divider: %lld, MS output =
=0A=
divider: %lld\n",=0A=
+			rate, best_in_div, best_out_div);=0A=
+	} else {=0A=
+		ms[1] =3D *parent_rate;=0A=
+		ms[2] =3D rate;=0A=
+		if (!rate) {=0A=
+			dev_err(&drvdata->client->dev,=0A=
+				"Invalid rate for MS%d\n", hwdata->num);=0A=
+			return -EINVAL;=0A=
+		}=0A=
+		ms[0] =3D div64_u64(ms[1], ms[2]);=0A=
+		ms[1] -=3D ms[0] * ms[2];=0A=
+		remove_common_factor(&ms[1]);=0A=
+		if (ms[0]  =3D=3D 5 || ms[0] =3D=3D 7)=0A=
+			out_div++;=0A=
+		rate =3D div64_u64(*parent_rate * ms[2], ms[1] + ms[0] * ms[2]);=0A=
+		dev_dbg(&drvdata->client->dev,=0A=
+			"Cloest MS output frequency: %lu Hz, output divider %llu+%llu/%llu\n",=
=0A=
+			rate, ms[0], ms[1], ms[2]);=0A=
+	}=0A=
+=0A=
+	cal_ms_p(*parent_rate, rate, hwdata->params.p);=0A=
+	hwdata->params.valid =3D true;=0A=
+=0A=
+	return rate;=0A=
+}=0A=
+=0A=
+/*=0A=
+ * multisynth's parent is PLL=0A=
+ */=0A=
+static int si5338_msynth_set_rate(struct clk_hw *hw, unsigned long rate,=
=0A=
+				  unsigned long parent_rate)=0A=
+{=0A=
+	struct si5338_hw_data *hwdata =3D HWDATA(hw);=0A=
+	struct si5338_driver_data *drvdata =3D hwdata->drvdata;=0A=
+=0A=
+	if (!rate)=0A=
+		rate =3D div64_u64(parent_rate + MSINT_MAX - 1, MSINT_MAX);=0A=
+=0A=
+	cal_ms_p(parent_rate, rate, hwdata->params.p);=0A=
+	hwdata->params.valid =3D true;=0A=
+=0A=
+	return set_ms_p(drvdata, hwdata->params.p, hwdata->num);=0A=
+}=0A=
+=0A=
+static const struct clk_ops si5338_msynth_ops =3D {=0A=
+	.prepare =3D si5338_msynth_prepare,=0A=
+	.unprepare =3D si5338_msynth_unprepare,=0A=
+	.recalc_rate =3D si5338_msynth_recalc_rate,=0A=
+	.round_rate =3D si5338_msynth_round_rate,=0A=
+	.set_rate =3D si5338_msynth_set_rate,=0A=
+};=0A=
+=0A=
+/*=0A=
+ * Si5338 clkout=0A=
+ */=0A=
+=0A=
+static const u32 awe_out_disable[] =3D {=0A=
+	AWE_OUT0_DIS,=0A=
+	AWE_OUT1_DIS,=0A=
+	AWE_OUT2_DIS,=0A=
+	AWE_OUT3_DIS,=0A=
+	AWE_OUT_ALL_DIS=0A=
+};=0A=
+=0A=
+static int set_out_disable(struct si5338_driver_data *drvdata,=0A=
+			   int dis, int chn)=0A=
+{=0A=
+	int rc;=0A=
+=0A=
+	rc =3D _verify_output_channel(chn);=0A=
+	if (rc < 0)=0A=
+		return rc;=0A=
+=0A=
+	return write_field(drvdata, dis, awe_out_disable[chn]);=0A=
+}=0A=
+=0A=
+static const u32 awe_drv_dis_state[] =3D {=0A=
+	AWE_OUT0_DIS_STATE,=0A=
+	AWE_OUT1_DIS_STATE,=0A=
+	AWE_OUT2_DIS_STATE,=0A=
+	AWE_OUT3_DIS_STATE=0A=
+};=0A=
+=0A=
+static int si5338_clkout_set_disable_state(struct si5338_driver_data =0A=
*drvdata,=0A=
+					   int chn, int typ)=0A=
+{=0A=
+	int rc;=0A=
+=0A=
+	rc =3D _verify_output_channel(chn);=0A=
+	if (rc < 0)=0A=
+		return rc;=0A=
+=0A=
+	if (typ < 0 || typ > 3) {=0A=
+		dev_err(&drvdata->client->dev,=0A=
+			"Invalid disabled state %d. Only 0..3 are supported\n",=0A=
+			typ);=0A=
+		return -EINVAL;=0A=
+	}=0A=
+=0A=
+	return write_field(drvdata, typ, awe_drv_dis_state[chn]);=0A=
+}=0A=
+=0A=
+static const u32 awe_rdiv_in[] =3D {=0A=
+	AWE_R0DIV_IN,=0A=
+	AWE_R1DIV_IN,=0A=
+	AWE_R2DIV_IN,=0A=
+	AWE_R3DIV_IN=0A=
+};=0A=
+=0A=
+/*=0A=
+ * src	0: fbclk=0A=
+ *	1: refclk=0A=
+ *	2: divfbclk=0A=
+ *	3: divrefclk=0A=
+ *	4: xoclk=0A=
+ *	5: MS0=0A=
+ *	6: MS1/2/3 respetivelly=0A=
+ */=0A=
+static int set_out_mux(struct si5338_driver_data *drvdata, int chn, int =
=0A=
src)=0A=
+{=0A=
+	int rc;=0A=
+=0A=
+	rc =3D _verify_output_channel(chn);=0A=
+	if (rc < 0)=0A=
+		return rc;=0A=
+=0A=
+	if (src < 0 || src > 7) {=0A=
+		dev_err(&drvdata->client->dev,=0A=
+			"Invalid source %d. Only 0...7 are supported\n",=0A=
+			src);=0A=
+		return -EINVAL;=0A=
+	}=0A=
+=0A=
+	return write_field(drvdata, src, awe_rdiv_in[chn]);=0A=
+}=0A=
+=0A=
+static int get_out_mux(struct si5338_driver_data *drvdata, int chn)=0A=
+{=0A=
+	int rc;=0A=
+=0A=
+	rc =3D _verify_output_channel(chn);=0A=
+	if (rc < 0)=0A=
+		return rc;=0A=
+=0A=
+	return read_field(drvdata, awe_rdiv_in[chn]);=0A=
+}=0A=
+=0A=
+static const u32 awe_drv_fmt[] =3D {=0A=
+	AWE_DRV0_FMT,=0A=
+	AWE_DRV1_FMT,=0A=
+	AWE_DRV2_FMT,=0A=
+	AWE_DRV3_FMT=0A=
+};=0A=
+=0A=
+static int set_drv_type(struct si5338_driver_data *drvdata, int typ, =0A=
int chn)=0A=
+{=0A=
+	int rc;=0A=
+=0A=
+	rc =3D _verify_output_channel(chn);=0A=
+	if (rc < 0)=0A=
+		return rc;=0A=
+=0A=
+	if (typ < 0 || typ > 7) {=0A=
+		dev_err(&drvdata->client->dev,=0A=
+			"Invalid output type %d. Only 0..7 are supported\n",=0A=
+			typ);=0A=
+		return -EINVAL;=0A=
+	}=0A=
+=0A=
+	return write_field(drvdata, typ, awe_drv_fmt[chn]);=0A=
+}=0A=
+=0A=
+static const u32 awe_drv_vddo[] =3D {=0A=
+	AWE_DRV0_VDDO,=0A=
+	AWE_DRV1_VDDO,=0A=
+	AWE_DRV2_VDDO,=0A=
+	AWE_DRV3_VDDO=0A=
+};=0A=
+=0A=
+static int set_drv_vdd(struct si5338_driver_data *drvdata, int vdd, int =
=0A=
chn)=0A=
+{=0A=
+	int rc;=0A=
+=0A=
+	rc =3D _verify_output_channel(chn);=0A=
+	if (rc < 0)=0A=
+		return rc;=0A=
+=0A=
+	if (vdd < 0 || vdd > 7) {=0A=
+		dev_err(&drvdata->client->dev,=0A=
+			"Invalid output type %d. Only 0..3 are supported\n",=0A=
+			vdd);=0A=
+		return -EINVAL;=0A=
+	}=0A=
+=0A=
+	return write_field(drvdata, vdd, awe_drv_vddo[chn]);=0A=
+}=0A=
+=0A=
+static const u32 awe_drv_trim[][3] =3D {=0A=
+	{ AWE_DRV0_TRIM, 0, 0 },=0A=
+	{ AWE_DRV1_TRIM_A, AWE_DRV1_TRIM_B, 0},=0A=
+	{ AWE_DRV2_TRIM, 0, 0},=0A=
+	{ AWE_DRV3_TRIM, 0, 0}=0A=
+};=0A=
+=0A=
+static int set_drv_trim_any(struct si5338_driver_data *drvdata,=0A=
+			    int trim, int chn)=0A=
+{=0A=
+	int rc;=0A=
+=0A=
+	rc =3D _verify_output_channel(chn);=0A=
+	if (rc < 0)=0A=
+		return rc;=0A=
+=0A=
+	if (trim < 0 || trim > 31) {=0A=
+		dev_err(&drvdata->client->dev,=0A=
+			"Invalid output type %d. Only 0..31 are supported\n",=0A=
+			trim);=0A=
+		return -EINVAL;=0A=
+	}=0A=
+=0A=
+	return write_multireg64(drvdata, trim, awe_drv_trim[chn]);=0A=
+}=0A=
+=0A=
+static const u32 awe_drv_invert[] =3D {=0A=
+	AWE_DRV0_INV,=0A=
+	AWE_DRV1_INV,=0A=
+	AWE_DRV2_INV,=0A=
+	AWE_DRV3_INV=0A=
+};=0A=
+=0A=
+static int set_drv_invert(struct si5338_driver_data *drvdata, int typ, =0A=
int chn)=0A=
+{=0A=
+	int rc;=0A=
+=0A=
+	rc =3D _verify_output_channel(chn);=0A=
+	if (rc < 0)=0A=
+		return rc;=0A=
+=0A=
+	if (typ < 0 || typ > 3) {=0A=
+		dev_err(&drvdata->client->dev,=0A=
+			"Invalid invert drivers %d. Only 0..3 are supported\n",=0A=
+			typ);=0A=
+		return -EINVAL;=0A=
+	}=0A=
+=0A=
+	return write_field(drvdata, typ, awe_drv_invert[chn]);=0A=
+}=0A=
+=0A=
+static const u32 awe_drv_powerdown[] =3D {=0A=
+	AWE_DRV0_PDN,=0A=
+	AWE_DRV1_PDN,=0A=
+	AWE_DRV2_PDN,=0A=
+	AWE_DRV3_PDN=0A=
+};=0A=
+=0A=
+static int set_drv_powerdown(struct si5338_driver_data *drvdata,=0A=
+			     int typ, int chn)=0A=
+{=0A=
+	int rc;=0A=
+=0A=
+	rc =3D _verify_output_channel(chn);=0A=
+	if (rc < 0)=0A=
+		return rc;=0A=
+=0A=
+	return write_field(drvdata, typ, awe_drv_powerdown[chn]);=0A=
+}=0A=
+=0A=
+static const struct si5338_drv_t const drv_configs[] =3D {=0A=
+	{"3V3_CMOS_A+",	0x1, 0x0, 0x17, 0x8}, /* bX0 */=0A=
+	{"3V3_CMOS_A-",	0x1, 0x0, 0x17, 0x9}, /* bX1 */=0A=
+	{"3V3_CMOS_B+",	0x2, 0x0, 0x17, 0x4}, /* b0X */=0A=
+	{"3V3_CMOS_B-",	0x2, 0x0, 0x17, 0x6}, /* b1X */=0A=
+	{"3V3_CMOS_A+B+", 0x3, 0x0, 0x17, 0x8},=0A=
+	{"3V3_CMOS_A-B+", 0x3, 0x0, 0x17, 0x9},=0A=
+	{"3V3_CMOS_A+B-", 0x3, 0x0, 0x17, 0x4},=0A=
+	{"3V3_CMOS_A-B-", 0x3, 0x0, 0x17, 0x6},=0A=
+=0A=
+	{"2V5_CMOS_A+",	0x1, 0x1, 0x13, 0x8},=0A=
+	{"2V5_CMOS_A-",	0x1, 0x1, 0x13, 0x9},=0A=
+	{"2V5_CMOS_B+",	0x2, 0x1, 0x13, 0x4},=0A=
+	{"2V5_CMOS_B-",	0x2, 0x1, 0x13, 0x6},=0A=
+	{"2V5_CMOS_A+B+", 0x3, 0x1, 0x13, 0x8},=0A=
+	{"2V5_CMOS_A-B+", 0x3, 0x1, 0x13, 0x9},=0A=
+	{"2V5_CMOS_A+B-", 0x3, 0x1, 0x13, 0x4},=0A=
+	{"2V5_CMOS_A-B-", 0x3, 0x1, 0x13, 0x6},=0A=
+=0A=
+	{"1V8_CMOS_A+",	0x1, 0x2, 0x15, 0x8},=0A=
+	{"1V8_CMOS_A-",	0x1, 0x2, 0x15, 0x9},=0A=
+	{"1V8_CMOS_B+",	0x2, 0x2, 0x15, 0x4},=0A=
+	{"1V8_CMOS_B-",	0x2, 0x2, 0x15, 0x6},=0A=
+	{"1V8_CMOS_A+B+", 0x3, 0x2, 0x15, 0x8},=0A=
+	{"1V8_CMOS_A-B+", 0x3, 0x2, 0x15, 0x9},=0A=
+	{"1V8_CMOS_A+B-", 0x3, 0x2, 0x15, 0x4},=0A=
+	{"1V8_CMOS_A-B-", 0x3, 0x2, 0x15, 0x6},=0A=
+=0A=
+	{"1V5_HSTL_A+",	0x1, 0x3, 0x1f, 0x8},=0A=
+	{"1V5_HSTL_A-",	0x1, 0x3, 0x1f, 0x9},=0A=
+	{"1V5_HSTL_B+",	0x2, 0x3, 0x1f, 0x4},=0A=
+	{"1V5_HSTL_B-",	0x2, 0x3, 0x1f, 0x6},=0A=
+	{"1V5_HSTL_A+B+", 0x3, 0x3, 0x1f, 0x8},=0A=
+	{"1V5_HSTL_A-B+", 0x3, 0x3, 0x1f, 0x9},=0A=
+	{"1V5_HSTL_A+B-", 0x3, 0x3, 0x1f, 0x4},=0A=
+	{"1V5_HSTL_A-B-", 0x3, 0x3, 0x1f, 0x6},=0A=
+=0A=
+	{"3V3_SSTL_A+",	0x1, 0x0, 0x04, 0x8},=0A=
+	{"3V3_SSTL_A-",	0x1, 0x0, 0x04, 0x9},=0A=
+	{"3V3_SSTL_B+",	0x2, 0x0, 0x04, 0x4},=0A=
+	{"3V3_SSTL_B-",	0x2, 0x0, 0x04, 0x6},=0A=
+	{"3V3_SSTL_A+B+", 0x3, 0x0, 0x04, 0x8},=0A=
+	{"3V3_SSTL_A-B+", 0x3, 0x0, 0x04, 0x9},=0A=
+	{"3V3_SSTL_A+B-", 0x3, 0x0, 0x04, 0x5},=0A=
+	{"3V3_SSTL_A-B-", 0x3, 0x0, 0x04, 0x6},=0A=
+=0A=
+	{"2V5_SSTL_A+",	0x1, 0x1, 0x0d, 0x8},=0A=
+	{"2V5_SSTL_A-",	0x1, 0x1, 0x0d, 0x9},=0A=
+	{"2V5_SSTL_B+",	0x2, 0x1, 0x0d, 0x4},=0A=
+	{"2V5_SSTL_B-",	0x2, 0x1, 0x0d, 0x6},=0A=
+	{"2V5_SSTL_A+B+", 0x3, 0x1, 0x0d, 0x8},=0A=
+	{"2V5_SSTL_A-B+", 0x3, 0x1, 0x0d, 0x9},=0A=
+	{"2V5_SSTL_A+B-", 0x3, 0x1, 0x0d, 0x5},=0A=
+	{"2V5_SSTL_A-B-", 0x3, 0x1, 0x0d, 0x6},=0A=
+=0A=
+	{"1V8_SSTL_A+",	0x1, 0x2, 0x17, 0x8},=0A=
+	{"1V8_SSTL_A-",	0x1, 0x2, 0x17, 0x9},=0A=
+	{"1V8_SSTL_B+",	0x2, 0x2, 0x17, 0x4},=0A=
+	{"1V8_SSTL_B-",	0x2, 0x2, 0x17, 0x6},=0A=
+	{"1V8_SSTL_A+B+", 0x3, 0x2, 0x17, 0x8},=0A=
+	{"1V8_SSTL_A-B+", 0x3, 0x2, 0x17, 0x9},=0A=
+	{"1V8_SSTL_A+B-", 0x3, 0x2, 0x17, 0x4},=0A=
+	{"1V8_SSTL_A-B-", 0x3, 0x2, 0x17, 0x6},=0A=
+=0A=
+	{"3V3_LVPECL",	0x4, 0x0, 0x0f, 0xc},=0A=
+	{"2V5_LVPECL",	0x4, 0x1, 0x10, 0xc},=0A=
+	{"3V3_LVDS",	0x6, 0x0, 0x03, 0xc},=0A=
+	{"2V5_LVDS",	0x6, 0x1, 0x04, 0xc},=0A=
+	{"1V8_LVDS",	0x6, 0x2, 0x04, 0xc},=0A=
+=0A=
+	{},=0A=
+};=0A=
+=0A=
+static int find_drive_config(const char *name)=0A=
+{=0A=
+	int i;=0A=
+=0A=
+	for (i =3D 0; drv_configs[i].description; i++) {=0A=
+		if (!strcmp(name, drv_configs[i].description))=0A=
+			return i;=0A=
+	}=0A=
+=0A=
+	return -EINVAL;=0A=
+}=0A=
+=0A=
+static int si5338_clkout_set_drive_config(struct si5338_driver_data =0A=
*drvdata,=0A=
+				   int chn, const char *name)=0A=
+{=0A=
+	int i, rc;=0A=
+=0A=
+	rc =3D _verify_output_channel(chn);=0A=
+	if (rc < 0)=0A=
+		return rc;=0A=
+=0A=
+	i =3D find_drive_config(name);=0A=
+	if (i < 0) {=0A=
+		dev_err(&drvdata->client->dev,=0A=
+			"Invalid driver configuration\n");=0A=
+		return -EINVAL;=0A=
+	}=0A=
+=0A=
+	rc =3D set_drv_type(drvdata, drv_configs[i].fmt, chn);=0A=
+	if (rc < 0)=0A=
+		return rc;=0A=
+=0A=
+	rc =3D set_drv_vdd(drvdata, drv_configs[i].vdd, chn);=0A=
+	if (rc < 0)=0A=
+		return rc;=0A=
+=0A=
+	rc =3D set_drv_trim_any(drvdata, drv_configs[i].trim, chn);=0A=
+	if (rc < 0)=0A=
+		return rc;=0A=
+=0A=
+	rc =3D set_drv_invert(drvdata,=0A=
+			    drv_configs[i].invert & 3, chn);=0A=
+	if (rc < 0)=0A=
+		return rc;=0A=
+=0A=
+	return 0;=0A=
+}=0A=
+=0A=
+static const u32 awe_rdiv_k[] =3D {=0A=
+	AWE_R0DIV,=0A=
+	AWE_R1DIV,=0A=
+	AWE_R2DIV,=0A=
+	AWE_R3DIV=0A=
+};=0A=
+=0A=
+static const u8 out_div_values[] =3D {=0A=
+	1, 2, 4, 8, 16, 32=0A=
+};=0A=
+=0A=
+static int get_out_div(struct si5338_driver_data *drvdata, int chn)=0A=
+{=0A=
+	int rc;=0A=
+=0A=
+	rc =3D _verify_output_channel(chn);=0A=
+	if (rc < 0)=0A=
+		return rc;=0A=
+=0A=
+	rc =3D read_field(drvdata, awe_rdiv_k[chn]);=0A=
+	if (rc < 0)=0A=
+		return rc;=0A=
+=0A=
+	if (rc >=3D ARRAY_SIZE(out_div_values)) {=0A=
+		dev_err(&drvdata->client->dev,=0A=
+			"Invalid value for output divider: %d\n",=0A=
+			rc);=0A=
+		return -EINVAL;=0A=
+	}=0A=
+=0A=
+	return out_div_values[rc];=0A=
+}=0A=
+=0A=
+static int set_out_div(struct si5338_driver_data *drvdata, int div, int =
=0A=
chn)=0A=
+{=0A=
+	int rc;=0A=
+	u8 val;=0A=
+=0A=
+	rc =3D _verify_output_channel(chn);=0A=
+	if (rc < 0)=0A=
+		return rc;=0A=
+=0A=
+	for (val =3D 0; val < ARRAY_SIZE(out_div_values); val++) {=0A=
+		if (out_div_values[val] =3D=3D div) {=0A=
+			rc =3D write_field(drvdata, val, awe_rdiv_k[chn]);=0A=
+			if (rc < 0)=0A=
+				return rc;=0A=
+=0A=
+			return 0;=0A=
+		}=0A=
+	}=0A=
+	dev_err(&drvdata->client->dev,=0A=
+		"Invalid value for output divider: %d\n",=0A=
+		div);=0A=
+=0A=
+	return -EINVAL;=0A=
+}=0A=
+=0A=
+static int get_status(struct si5338_driver_data *drvdata)=0A=
+{=0A=
+	return read_field(drvdata, AWE_STATUS);=0A=
+}=0A=
+=0A=
+static int power_up_down_needed_ms(struct si5338_driver_data *drvdata)=0A=
+{=0A=
+	int rc, chn, out_src;=0A=
+	int ms_used =3D 0;=0A=
+=0A=
+	for (chn =3D 0; chn < 4; chn++) {=0A=
+		out_src =3D get_out_mux(drvdata, chn);=0A=
+		if (out_src < 0)=0A=
+			return out_src;=0A=
+=0A=
+		switch (out_src) {=0A=
+		case 5:=0A=
+			ms_used |=3D 1;=0A=
+			break;=0A=
+		case 6:=0A=
+			ms_used |=3D (1 << chn);=0A=
+			break;=0A=
+		}=0A=
+	}=0A=
+	for (chn =3D 0; chn < 4; chn++) {=0A=
+		rc =3D set_ms_powerdown(drvdata,=0A=
+				      (ms_used & (1 << chn)) ? MS_POWER_UP :=0A=
+							       MS_POWER_DOWN,=0A=
+				      chn);=0A=
+		if (rc < 0)=0A=
+			return rc;=0A=
+	}=0A=
+=0A=
+	return 0;=0A=
+}=0A=
+=0A=
+static const u32 awe_fcal[] =3D {=0A=
+	AWE_FCAL_07_00,=0A=
+	AWE_FCAL_15_08,=0A=
+	AWE_FCAL_17_16,=0A=
+	0=0A=
+};=0A=
+=0A=
+static const u32 awe_fcal_ovrd[] =3D {=0A=
+	AWE_FCAL_OVRD_07_00,=0A=
+	AWE_FCAL_OVRD_15_08,=0A=
+	AWE_FCAL_OVRD_17_15,=0A=
+	0=0A=
+};=0A=
+=0A=
+static int reset_ms(struct si5338_driver_data *drvdata)=0A=
+{=0A=
+	int rc;=0A=
+=0A=
+	dev_dbg(&drvdata->client->dev, "Resetting MS dividers");=0A=
+	/* SET MS RESET =3D 1 */=0A=
+	rc =3D write_field(drvdata, 1, AWE_MS_RESET);=0A=
+	if (rc)=0A=
+		return rc;=0A=
+=0A=
+	/* Wait for 20ms */=0A=
+	msleep(20);=0A=
+=0A=
+	/* SET MS RESET =3D 0 */=0A=
+	rc =3D write_field(drvdata, 0, AWE_MS_RESET);=0A=
+	if (rc)=0A=
+		return rc;=0A=
+=0A=
+	return 0;=0A=
+}=0A=
+=0A=
+static int set_misc_registers(struct si5338_driver_data *drvdata)=0A=
+{=0A=
+	/* ST52238 Reference Manual R1.2 p.28 */=0A=
+	int rc;=0A=
+=0A=
+	rc =3D write_field(drvdata, 0x5, AWE_MISC_47);=0A=
+	if (rc)=0A=
+		return rc;=0A=
+=0A=
+	rc =3D write_field(drvdata, 0x1, AWE_MISC_106);=0A=
+	if (rc)=0A=
+		return rc;=0A=
+=0A=
+	rc =3D write_field(drvdata, 0x1, AWE_MISC_116);=0A=
+	if (rc)=0A=
+		return rc;=0A=
+=0A=
+	rc =3D write_field(drvdata, 0x1, AWE_MISC_42);=0A=
+	if (rc)=0A=
+		return rc;=0A=
+=0A=
+	rc =3D write_field(drvdata, 0x0, AWE_MISC_06A);=0A=
+	if (rc)=0A=
+		return rc;=0A=
+=0A=
+	rc =3D write_field(drvdata, 0x0, AWE_MISC_06B);=0A=
+	if (rc)=0A=
+		return rc;=0A=
+=0A=
+	rc =3D write_field(drvdata, 0x0, AWE_MISC_28);=0A=
+	if (rc)=0A=
+		return rc;=0A=
+=0A=
+	return 0;=0A=
+}=0A=
+=0A=
+/* Disable interrupt, all outputs */=0A=
+static int pre_init(struct si5338_driver_data *drvdata)=0A=
+{=0A=
+	int rc, chn;=0A=
+=0A=
+	/* Disable interrupts */=0A=
+	rc =3D write_field(drvdata, 0x1d, AWE_INT_MASK);=0A=
+	if (rc)=0A=
+		return rc;=0A=
+=0A=
+	/* setup miscelalneous registers */=0A=
+	rc =3D set_misc_registers(drvdata);=0A=
+	if (rc)=0A=
+		return rc;=0A=
+=0A=
+	/* disable all outputs */=0A=
+	rc =3D write_field(drvdata, 1, AWE_OUT_ALL_DIS);=0A=
+	if (rc)=0A=
+		return rc;=0A=
+=0A=
+	/* pause LOL */=0A=
+	rc =3D write_field(drvdata, 1, AWE_DIS_LOS);=0A=
+	if (rc)=0A=
+		return rc;=0A=
+=0A=
+	/* clears outputs pll input/fb muxes to be set later */=0A=
+	for (chn =3D 0; chn < 4; chn++) {=0A=
+		rc =3D set_ms_powerdown(drvdata, MS_POWER_DOWN, chn);=0A=
+		if (rc)=0A=
+			return rc;=0A=
+		rc =3D set_out_disable(drvdata, OUT_DISABLE, chn);=0A=
+		if (rc)=0A=
+			return rc;=0A=
+	}=0A=
+	/* to be explicitly enabled if needed */=0A=
+	rc =3D set_in_pfd_ref_fb(drvdata, 5, 0);	/* noclk */=0A=
+	if (rc)=0A=
+		return rc;=0A=
+=0A=
+	rc =3D set_in_pfd_ref_fb(drvdata, 5, 1);	/* noclk */=0A=
+	if (rc)=0A=
+		return rc;=0A=
+=0A=
+	return 0;=0A=
+}=0A=
+=0A=
+#define INIT_TIMEOUT		10	/* max 10 loops */=0A=
+=0A=
+/* See SI5338 RM for programming procedure */=0A=
+static int post_init(struct si5338_driver_data *drvdata)=0A=
+{=0A=
+	int rc =3D 0, i, in_src, fb_src, ext_fb, check_los =3D 0;=0A=
+	int timeout =3D INIT_TIMEOUT;=0A=
+	u64 fcal;=0A=
+=0A=
+	/* validate input clock status */=0A=
+	in_src =3D get_in_pfd_ref_fb(drvdata, 0);=0A=
+	if (in_src < 0)=0A=
+		return in_src;=0A=
+=0A=
+	switch (in_src) {=0A=
+	case SI5338_PFD_IN_REF_REFCLK:=0A=
+	case SI5338_PFD_IN_REF_DIVREFCLK:=0A=
+	case SI5338_PFD_IN_REF_XOCLK:=0A=
+		check_los |=3D AWE_STATUS_PLL_LOS_CLKIN;=0A=
+		break;=0A=
+	case SI5338_PFD_IN_REF_FBCLK:=0A=
+	case SI5338_PFD_IN_REF_DIVFBCLK:=0A=
+		check_los |=3D AWE_STATUS_PLL_LOS_FDBK;=0A=
+		break;=0A=
+	}=0A=
+	ext_fb =3D read_field(drvdata, AWE_PFD_EXTFB);=0A=
+	if (ext_fb < 0)=0A=
+		return ext_fb;=0A=
+=0A=
+	if (ext_fb) {=0A=
+		fb_src =3D get_in_pfd_ref_fb(drvdata, 1);=0A=
+		if (fb_src < 0)=0A=
+			return fb_src;=0A=
+=0A=
+		switch (in_src) {=0A=
+		case SI5338_PFD_IN_FB_REFCLK:=0A=
+		case SI5338_PFD_IN_FB_DIVREFCLK:=0A=
+			check_los |=3D AWE_STATUS_PLL_LOS_CLKIN;=0A=
+			break;=0A=
+		case SI5338_PFD_IN_FB_FBCLK:=0A=
+		case SI5338_PFD_IN_FB_DIVFBCLK:=0A=
+			check_los |=3D AWE_STATUS_PLL_LOS_FDBK;=0A=
+			break;=0A=
+		}=0A=
+	}=0A=
+	check_los &=3D 0xf;=0A=
+	for (i =3D 0; i < timeout; i++) {=0A=
+		rc =3D get_status(drvdata);=0A=
+		if (rc < 0)=0A=
+			return rc;=0A=
+=0A=
+		if (!(rc & check_los))=0A=
+			break; /* inputs OK */=0A=
+		msleep(100);	/* wait for 100ms before polling */=0A=
+	}=0A=
+=0A=
+	if (i >=3D timeout) {=0A=
+		dev_err(&drvdata->client->dev,=0A=
+			"Timeout waiting for input clocks, status=3D0x%x, mask=3D0x%x\n",=0A=
+			rc, check_los);=0A=
+		return -ETIMEDOUT;=0A=
+	}=0A=
+	dev_dbg(&drvdata->client->dev,=0A=
+		"Validated input clocks, t=3D%d cycles (timeout=3D %d cycles), status =
=0A=
=3D0x%x, mask=3D0x%x\n",=0A=
+		i, timeout, rc, check_los);=0A=
+=0A=
+	/* Configure PLL for locking, set FCAL_OVRD_EN =3D 0 */=0A=
+	rc =3D write_field(drvdata, 0, AWE_FCAL_OVRD_EN);=0A=
+	if (rc < 0)=0A=
+		return rc;=0A=
+=0A=
+	/* Configure PLL for locking, set SOFT_RESET =3D 1 (ignore i2c error) */=
=0A=
+	write_field(drvdata, 1, AWE_SOFT_RESET);=0A=
+	msleep(25);=0A=
+=0A=
+	/* re-enable LOL, set reg 241 =3D 0x65 */=0A=
+	rc =3D write_field(drvdata, 0x65, AWE_REG241);=0A=
+	if (rc < 0)=0A=
+		return rc;=0A=
+=0A=
+	check_los |=3D AWE_STATUS_PLL_LOL | AWE_STATUS_PLL_SYS_CAL;=0A=
+	check_los &=3D 0xf;=0A=
+	for (i =3D 0; i < timeout; i++) {=0A=
+		rc =3D get_status(drvdata);=0A=
+		if (rc < 0)=0A=
+			return rc;=0A=
+=0A=
+		if (!(rc & check_los))=0A=
+			break; /* alarms not set OK */=0A=
+		msleep(100);	/* wait for 100ms before polling */=0A=
+	}=0A=
+	if (i >=3D timeout) {=0A=
+		dev_err(&drvdata->client->dev,=0A=
+			"Timeout (%d) waiting for PLL lock, status=3D0x%x, mask=3D0x%x\n",=0A=
+			i, rc, check_los);=0A=
+		return -ETIMEDOUT;=0A=
+	}=0A=
+	dev_dbg(&drvdata->client->dev,=0A=
+		"Validated PLL locked, t=3D%d cycles (timeout=3D %d cycles), status =0A=
=3D0x%x, mask=3D0x%x\n",=0A=
+		i, timeout, rc, check_los);=0A=
+=0A=
+	/* copy FCAL values to active registers */=0A=
+	rc =3D read_multireg64(drvdata, awe_fcal, &fcal);=0A=
+	if (rc)=0A=
+		return rc;=0A=
+=0A=
+	rc =3D write_multireg64(drvdata, fcal, awe_fcal_ovrd);=0A=
+	if (rc)=0A=
+		return rc;=0A=
+=0A=
+	dev_dbg(&drvdata->client->dev, "Copied FCAL data 0x%llx\n", fcal);=0A=
+	/* Set 47[7:2] to 000101b */=0A=
+	rc =3D write_field(drvdata, 5, AWE_REG47_72);=0A=
+	if (rc)=0A=
+		return rc;=0A=
+=0A=
+	/* SET PLL to use FCAL values, set FCAL_OVRD_EN=3D1 */=0A=
+	rc =3D write_field(drvdata, 1, AWE_FCAL_OVRD_EN);=0A=
+	if (rc)=0A=
+		return rc;=0A=
+=0A=
+	/* only needed if using down-spread. Won't hurt to do anyway */=0A=
+	rc =3D reset_ms(drvdata);=0A=
+	if (rc)=0A=
+		return rc;=0A=
+=0A=
+	/* Enable all (enabled individually) outputs */=0A=
+	rc =3D write_field(drvdata, 0, AWE_OUT_ALL_DIS);=0A=
+	if (rc)=0A=
+		return rc;=0A=
+=0A=
+	/* Clearing */=0A=
+	write_field(drvdata, 0, AWE_SOFT_RESET);=0A=
+=0A=
+	/* Power up MS if used, otherwise power down */=0A=
+	rc =3D power_up_down_needed_ms(drvdata);=0A=
+	if (rc)=0A=
+		return rc;=0A=
+=0A=
+	return 0;=0A=
+}=0A=
+=0A=
+static int si5338_clkout_prepare(struct clk_hw *hw)=0A=
+{=0A=
+	struct si5338_hw_data *hwdata =3D HWDATA(hw);=0A=
+	struct si5338_driver_data *drvdata =3D hwdata->drvdata;=0A=
+	int rc;=0A=
+=0A=
+	rc =3D set_drv_powerdown(drvdata, DRV_POWERUP, hwdata->num);=0A=
+	if (rc) {=0A=
+		dev_err(&drvdata->client->dev,=0A=
+			"Error power up clkout%d\n", hwdata->num);=0A=
+	}=0A=
+	dev_dbg(&drvdata->client->dev, "Clkout%d prepared\n", hwdata->num);=0A=
+=0A=
+	return rc;=0A=
+}=0A=
+=0A=
+static int si5338_clkout_enable(struct clk_hw *hw)=0A=
+{=0A=
+=0A=
+	struct si5338_hw_data *hwdata =3D HWDATA(hw);=0A=
+	struct si5338_driver_data *drvdata =3D hwdata->drvdata;=0A=
+	int rc;=0A=
+=0A=
+	rc =3D set_out_disable(drvdata, OUT_ENABLE, hwdata->num);=0A=
+	if (rc) {=0A=
+		dev_err(&drvdata->client->dev,=0A=
+			"Error enabling clkout%d\n", hwdata->num);=0A=
+	}=0A=
+	dev_dbg(&drvdata->client->dev, "Clkout%d enabled\n", hwdata->num);=0A=
+=0A=
+	return rc;=0A=
+}=0A=
+=0A=
+static void si5338_clkout_disable(struct clk_hw *hw)=0A=
+{=0A=
+	struct si5338_hw_data *hwdata =3D HWDATA(hw);=0A=
+	struct si5338_driver_data *drvdata =3D hwdata->drvdata;=0A=
+=0A=
+	set_out_disable(drvdata, OUT_DISABLE, hwdata->num);=0A=
+	dev_dbg(&drvdata->client->dev, "Clkout%d disable\n", hwdata->num);=0A=
+}=0A=
+=0A=
+static void si5338_clkout_unprepare(struct clk_hw *hw)=0A=
+{=0A=
+	struct si5338_hw_data *hwdata =3D HWDATA(hw);=0A=
+	struct si5338_driver_data *drvdata =3D hwdata->drvdata;=0A=
+=0A=
+	set_drv_powerdown(drvdata, DRV_POWERDOWN, hwdata->num);=0A=
+	dev_dbg(&drvdata->client->dev, "Clkout%d unprepared\n", hwdata->num);=0A=
+}=0A=
+=0A=
+static int si5338_clkout_reparent(struct si5338_driver_data *drvdata,=0A=
+				   int num, u8 parent)=0A=
+{=0A=
+	return set_out_mux(drvdata, num, parent);=0A=
+}=0A=
+=0A=
+static u8 si5338_clkout_get_parent(struct clk_hw *hw)=0A=
+{=0A=
+	struct si5338_hw_data *hwdata =3D HWDATA(hw);=0A=
+	struct si5338_driver_data *drvdata =3D hwdata->drvdata;=0A=
+=0A=
+	return get_out_mux(drvdata, hwdata->num);=0A=
+}=0A=
+=0A=
+static int si5338_clkout_set_parent(struct clk_hw *hw, u8 index)=0A=
+{=0A=
+	struct si5338_hw_data *hwdata =3D HWDATA(hw);=0A=
+	struct si5338_driver_data *drvdata =3D hwdata->drvdata;=0A=
+=0A=
+	return si5338_clkout_reparent(drvdata, hwdata->num, index);=0A=
+}=0A=
+=0A=
+static unsigned long si5338_clkout_recalc_rate(struct clk_hw *hw,=0A=
+					       unsigned long parent_rate)=0A=
+{=0A=
+	struct si5338_hw_data *hwdata =3D HWDATA(hw);=0A=
+	struct si5338_driver_data *drvdata =3D hwdata->drvdata;=0A=
+	unsigned long rate =3D parent_rate;=0A=
+	int rc;=0A=
+=0A=
+	rc =3D get_out_div(drvdata, hwdata->num);=0A=
+	if (rc <=3D 0) {=0A=
+		rate =3D 0;=0A=
+		dev_warn(&drvdata->client->dev,=0A=
+			"Error recalculating rate for clk%d\n", hwdata->num);=0A=
+	} else {=0A=
+		rate /=3D rc;=0A=
+	}=0A=
+	dev_dbg(&drvdata->client->dev, "Recalculated clkout%d rate %lu\n",=0A=
+		hwdata->num, rate);=0A=
+=0A=
+	return rate;=0A=
+}=0A=
+=0A=
+static long si5338_clkout_round_rate(struct clk_hw *hw, unsigned long rate=
,=0A=
+				     unsigned long *parent_rate)=0A=
+{=0A=
+	struct si5338_hw_data *hwdata =3D HWDATA(hw);=0A=
+	struct si5338_driver_data *drvdata =3D hwdata->drvdata;=0A=
+	u64 out_freq_scaled, scaled_max;=0A=
+	unsigned long err, new_rate, new_err;=0A=
+	u8 r_div =3D 1;=0A=
+=0A=
+	out_freq_scaled =3D rate;=0A=
+	/* Request frequency if multisynth master */=0A=
+	if (__clk_get_flags(hw->clk) & CLK_SET_RATE_PARENT) {=0A=
+		scaled_max =3D div64_u64(FVCOMAX,  MSINT_MAX);=0A=
+		while (r_div < 32 && out_freq_scaled < scaled_max) {=0A=
+			out_freq_scaled <<=3D 1;=0A=
+			r_div <<=3D 1;=0A=
+		}=0A=
+		if (out_freq_scaled < scaled_max) {=0A=
+			dev_warn(&drvdata->client->dev,=0A=
+				 "Specified output frequency is too low: %lu < %lld\n",=0A=
+				 rate, scaled_max >> 5);=0A=
+			r_div =3D 32;=0A=
+			*parent_rate =3D scaled_max;=0A=
+		} else {=0A=
+			*parent_rate =3D out_freq_scaled;=0A=
+		}=0A=
+	} else {=0A=
+		/* round to closest r_div */=0A=
+		new_rate =3D *parent_rate;=0A=
+		new_err =3D abs(new_rate - rate);=0A=
+		do {=0A=
+			err =3D new_err;=0A=
+			new_rate >>=3D 1;=0A=
+			r_div <<=3D 1;=0A=
+			new_err =3D abs(new_rate - rate);=0A=
+		} while (new_err < err && r_div < 32);=0A=
+		r_div >>=3D 1;=0A=
+	}=0A=
+	rate =3D *parent_rate / r_div;=0A=
+=0A=
+	dev_dbg(&drvdata->client->dev,=0A=
+		"%s - %s: r_div =3D %u, rate =3D %lu, requesting parent_rate =3D %lu\n",=
=0A=
+		__func__, __clk_get_name(hwdata->hw.clk), r_div,=0A=
+		rate, *parent_rate);=0A=
+=0A=
+	return rate;=0A=
+}=0A=
+=0A=
+static int si5338_clkout_set_rate(struct clk_hw *hw, unsigned long rate,=
=0A=
+				  unsigned long parent_rate)=0A=
+{=0A=
+	struct si5338_hw_data *hwdata =3D HWDATA(hw);=0A=
+	struct si5338_driver_data *drvdata =3D hwdata->drvdata;=0A=
+	unsigned long err, new_rate, new_err;=0A=
+	int r_div =3D 1;=0A=
+=0A=
+	/* round to closest r_div */=0A=
+	new_rate =3D parent_rate;=0A=
+	new_err =3D abs(new_rate - rate);=0A=
+	do {=0A=
+		err =3D new_err;=0A=
+		new_rate >>=3D 1;=0A=
+		r_div <<=3D 1;=0A=
+		new_err =3D abs(new_rate - rate);=0A=
+	} while (new_err < err && r_div < 32);=0A=
+	r_div >>=3D 1;=0A=
+=0A=
+	dev_dbg(&drvdata->client->dev,=0A=
+		"%s - %s: r_div =3D %u, parent_rate =3D %lu, rate =3D %lu\n",=0A=
+		__func__, __clk_get_name(hwdata->hw.clk), r_div,=0A=
+		parent_rate, rate);=0A=
+=0A=
+	return set_out_div(drvdata, r_div, hwdata->num);=0A=
+}=0A=
+=0A=
+static const struct clk_ops si5338_clkout_ops =3D {=0A=
+	.prepare =3D si5338_clkout_prepare,=0A=
+	.unprepare =3D si5338_clkout_unprepare,=0A=
+	.enable =3D si5338_clkout_enable,=0A=
+	.disable =3D si5338_clkout_disable,=0A=
+	.set_parent =3D si5338_clkout_set_parent,=0A=
+	.get_parent =3D si5338_clkout_get_parent,=0A=
+	.recalc_rate =3D si5338_clkout_recalc_rate,=0A=
+	.round_rate =3D si5338_clkout_round_rate,=0A=
+	.set_rate =3D si5338_clkout_set_rate,=0A=
+};=0A=
+=0A=
+#ifdef CONFIG_DEBUG_FS=0A=
+=0A=
+static int get_ms_powerdown(struct si5338_driver_data *drvdata, int chn)=
=0A=
+{=0A=
+	int rc;=0A=
+=0A=
+	rc =3D _verify_output_channel(chn);=0A=
+	if (rc < 0)=0A=
+		return rc;=0A=
+=0A=
+	return read_field(drvdata, awe_ms_powerdown[chn]);=0A=
+}=0A=
+=0A=
+static int get_out_disable(struct si5338_driver_data *drvdata, int chn)=0A=
+{=0A=
+	int rc;=0A=
+=0A=
+	rc =3D _verify_output_channel(chn);=0A=
+	if (chn !=3D 4 && rc < 0)=0A=
+		return rc;=0A=
+=0A=
+	return read_field(drvdata, awe_out_disable[chn]);=0A=
+}=0A=
+=0A=
+static int get_drv_disabled_state(struct si5338_driver_data *drvdata, =0A=
int chn)=0A=
+{=0A=
+	int rc;=0A=
+=0A=
+	rc =3D _verify_output_channel(chn);=0A=
+	if (rc < 0)=0A=
+		return rc;=0A=
+=0A=
+	return read_field(drvdata, awe_drv_dis_state[chn]);=0A=
+}=0A=
+=0A=
+static int get_drv_type(struct si5338_driver_data *drvdata, int chn)=0A=
+{=0A=
+	int rc;=0A=
+=0A=
+	rc =3D _verify_output_channel(chn);=0A=
+	if (rc < 0)=0A=
+		return rc;=0A=
+=0A=
+	return read_field(drvdata, awe_drv_fmt[chn]);=0A=
+}=0A=
+=0A=
+static int get_drv_vdd(struct si5338_driver_data *drvdata, int chn)=0A=
+{=0A=
+	int rc;=0A=
+=0A=
+	rc =3D _verify_output_channel(chn);=0A=
+	if (rc < 0)=0A=
+		return rc;=0A=
+=0A=
+	return read_field(drvdata, awe_drv_vddo[chn]);=0A=
+}=0A=
+=0A=
+static int get_drv_trim(struct si5338_driver_data *drvdata, int chn)=0A=
+{=0A=
+	int rc;=0A=
+	u64 data;=0A=
+=0A=
+	rc =3D _verify_output_channel(chn);=0A=
+	if (rc < 0)=0A=
+		return rc;=0A=
+=0A=
+	rc =3D read_multireg64(drvdata, awe_drv_trim[chn], &data);=0A=
+	if (rc < 0)=0A=
+		return rc;=0A=
+=0A=
+	return data;	/* 5-bit data */=0A=
+}=0A=
+=0A=
+static int get_drv_invert(struct si5338_driver_data *drvdata, int chn)=0A=
+{=0A=
+	int rc;=0A=
+=0A=
+	rc =3D _verify_output_channel(chn);=0A=
+	if (rc < 0)=0A=
+		return rc;=0A=
+=0A=
+	return read_field(drvdata, awe_drv_invert[chn]);=0A=
+}=0A=
+=0A=
+static int get_drv_powerdown(struct si5338_driver_data *drvdata, int chn)=
=0A=
+{=0A=
+	int rc;=0A=
+=0A=
+	rc =3D _verify_output_channel(chn);=0A=
+	if (rc < 0)=0A=
+		return rc;=0A=
+=0A=
+	return read_field(drvdata, awe_drv_powerdown[chn]);=0A=
+}=0A=
+=0A=
+/*=0A=
+ * Create debugfs files for status for each si5338 clkout=0A=
+ */=0A=
+=0A=
+static int clkout_status_show(struct seq_file *s, void *data)=0A=
+{=0A=
+	struct si5338_hw_data *clkout =3D s->private;=0A=
+	struct si5338_driver_data *drvdata =3D clkout->drvdata;=0A=
+	int i, j, match =3D 0;=0A=
+	int drv_type, drv_vdd, drv_trim, drv_invert;=0A=
+	int out_src, src_group =3D 0, src =3D 0;=0A=
+	const int in_numbers[] =3D {=0A=
+		12, 3, 4, 56=0A=
+	};=0A=
+=0A=
+	i =3D clkout->num;=0A=
+	seq_printf(s, "%d: ", i);=0A=
+	if (get_out_disable(drvdata, i)) {=0A=
+		seq_puts(s, "disabled");=0A=
+		switch (get_drv_disabled_state(drvdata, i)) {=0A=
+		case SI5338_OUT_DIS_HIZ:=0A=
+			seq_puts(s, " (high-Z)\n");=0A=
+			break;=0A=
+		case SI5338_OUT_DIS_LOW:=0A=
+			seq_puts(s, " (low)\n");=0A=
+			break;=0A=
+		case SI5338_OUT_DIS_HI:=0A=
+			seq_puts(s, " (high)\n");=0A=
+			break;=0A=
+		case SI5338_OUT_DIS_ALWAYS_ON:=0A=
+			seq_puts(s, " (always on)\n");=0A=
+			break;=0A=
+		}=0A=
+		return 0;=0A=
+	}=0A=
+=0A=
+	seq_puts(s, "enabled ");=0A=
+	drv_type =3D get_drv_type(drvdata, i);=0A=
+	if (drv_type < 0)=0A=
+		return drv_type;=0A=
+=0A=
+	drv_vdd =3D  get_drv_vdd(drvdata, i);=0A=
+	if (drv_vdd < 0)=0A=
+		return drv_vdd;=0A=
+=0A=
+	drv_trim =3D get_drv_trim(drvdata, i);=0A=
+	if (drv_trim < 0)=0A=
+		return drv_trim;=0A=
+=0A=
+	drv_invert =3D get_drv_invert(drvdata, i);=0A=
+	if (drv_invert < 0)=0A=
+		return drv_invert;=0A=
+=0A=
+	for (j =3D 0; drv_configs[j].description; j++) {=0A=
+		if (drv_configs[j].fmt =3D=3D drv_type &&=0A=
+		    drv_configs[j].vdd =3D=3D drv_vdd &&=0A=
+		    drv_configs[j].trim =3D=3D drv_trim &&=0A=
+		    (drv_invert | (drv_configs[j].invert >> 2)) =3D=3D=0A=
+			((drv_configs[j].invert & 3) |=0A=
+			 (drv_configs[j].invert>>2)))=0A=
+			seq_puts(s, drv_configs[j].description);=0A=
+			match =3D 1;=0A=
+	}=0A=
+=0A=
+	if (!match) {=0A=
+		seq_printf(s, "Invalid output configuration: type =3D %d, vdd=3D%d, =0A=
trim=3D%d, invert=3D%d\n",=0A=
+			   drv_type, drv_vdd, drv_trim, drv_invert);=0A=
+	}=0A=
+=0A=
+	seq_printf(s, ", R%d and out %d power %s", i, i,=0A=
+		  get_drv_powerdown(drvdata, i) ? "down" : "up");=0A=
+	seq_puts(s, ", Output route ");=0A=
+=0A=
+	out_src =3D get_out_mux(drvdata, i);=0A=
+	if (out_src < 0)=0A=
+		return out_src;=0A=
+=0A=
+	switch (out_src) {=0A=
+	case 0: /* p2div in */=0A=
+	case 2: /* p2div out */=0A=
+		src =3D read_field(drvdata, AWE_FB_MUX);=0A=
+		if (src < 0)=0A=
+			return src;=0A=
+=0A=
+		src_group =3D 0;=0A=
+		src =3D src ? 2 : 3; /* mod src: 0 - IN56, 1 - IN4 */=0A=
+		break;=0A=
+	case 1: /* p1div in */=0A=
+	case 3: /* p1div out */=0A=
+		src =3D read_field(drvdata, AWE_IN_MUX);=0A=
+		if (src < 0)=0A=
+			return src;=0A=
+=0A=
+		if (src =3D=3D 2) {=0A=
+			src_group =3D 1;=0A=
+			src =3D 0;=0A=
+		} else {=0A=
+			src_group =3D 0; /* keep src: 0 - IN12, 1 - IN3 */=0A=
+		}=0A=
+		break;=0A=
+	case 4:=0A=
+		src_group =3D 1;=0A=
+		break;=0A=
+	case 5:=0A=
+		src_group =3D 2;=0A=
+		src =3D 0;=0A=
+		break;=0A=
+	case 6:=0A=
+		src_group =3D 2;=0A=
+		src =3D i;=0A=
+		 break;=0A=
+	case 7:=0A=
+		src_group =3D 3;=0A=
+		break;=0A=
+	}=0A=
+	switch (src_group) {=0A=
+	case 0:=0A=
+		seq_printf(s, "IN%d", in_numbers[src]);=0A=
+		break;=0A=
+	case 1:=0A=
+		seq_puts(s, "XO");=0A=
+		break;=0A=
+	case 2:=0A=
+		seq_printf(s, "MS%d", src);=0A=
+		break;=0A=
+	case 3:=0A=
+		seq_puts(s, "No clock");=0A=
+		break;=0A=
+	}=0A=
+=0A=
+	if (out_src =3D=3D 5 || out_src =3D=3D 6) {=0A=
+		seq_printf(s, " power %s",=0A=
+			   get_ms_powerdown(drvdata, i) ? "down" : "up");=0A=
+	}=0A=
+=0A=
+	seq_puts(s, "\n");=0A=
+=0A=
+	return 0;=0A=
+}=0A=
+=0A=
+static int clkout_status_open(struct inode *inode, struct file *file)=0A=
+{=0A=
+	return single_open(file, clkout_status_show, inode->i_private);=0A=
+}=0A=
+=0A=
+static const struct file_operations clkout_status_fops =3D {=0A=
+	.open		=3D clkout_status_open,=0A=
+	.read		=3D seq_read,=0A=
+	.llseek		=3D seq_lseek,=0A=
+	.release	=3D single_release,=0A=
+};=0A=
+=0A=
+static int register_debugfs_status(struct si5338_hw_data *clkout)=0A=
+{=0A=
+	struct dentry *d;=0A=
+=0A=
+	d =3D clk_debugfs_add_file(&clkout->hw, "output_status", S_IRUGO,=0A=
+				clkout, &clkout_status_fops);=0A=
+	if (!d)=0A=
+		return -ENOMEM;=0A=
+=0A=
+	return 0;=0A=
+}=0A=
+=0A=
+#else=0A=
+static int register_debugfs_status(struct si5338_hw_data *clkout)=0A=
+{=0A=
+	return 0;=0A=
+}=0A=
+#endif /* CONFIG_DEBUG_FS */=0A=
+=0A=
+/*=0A=
+ * Si5351 i2c probe and device tree parsing=0A=
+ */=0A=
+#ifdef CONFIG_OF=0A=
+static const struct of_device_id si5338_dt_ids[] =3D {=0A=
+	{ .compatible =3D "silabs,si5338" },=0A=
+	{ }=0A=
+};=0A=
+MODULE_DEVICE_TABLE(of, si5338_dt_ids);=0A=
+=0A=
+static int si5338_dt_parse(struct i2c_client *client)=0A=
+{=0A=
+	struct device_node *child, *np =3D client->dev.of_node;=0A=
+	struct si5338_platform_data *pdata;=0A=
+	u32 val, num;=0A=
+=0A=
+	if (np =3D=3D NULL)=0A=
+		return 0;=0A=
+=0A=
+	pdata =3D devm_kzalloc(&client->dev, sizeof(*pdata), GFP_KERNEL);=0A=
+	if (!pdata)=0A=
+		return -ENOMEM;=0A=
+=0A=
+	/* property silab,name-prefix */=0A=
+	of_property_read_string(np, "silab,name-prefix", &pdata->name_prefix);=0A=
+=0A=
+	/* property silab,ref-source */=0A=
+	if (!of_property_read_u32(np, "silab,ref-source", &val)) {=0A=
+		switch (val) {=0A=
+		case SI5338_REF_SRC_CLKIN12:=0A=
+		case SI5338_REF_SRC_CLKIN3:=0A=
+		case SI5338_REF_SRC_XTAL:=0A=
+			pdata->ref_src =3D val;=0A=
+			dev_dbg(&client->dev, "ref-source =3D %d\n", val);=0A=
+			break;=0A=
+		default:=0A=
+			dev_err(&client->dev,=0A=
+				"Invalid source for refclk %u\n", val);=0A=
+			return -EINVAL;=0A=
+		}=0A=
+	}=0A=
+=0A=
+	/* property silab,fb-source */=0A=
+	if (!of_property_read_u32(np, "silab,fb-source", &val)) {=0A=
+		switch (val) {=0A=
+		case SI5338_FB_SRC_CLKIN4:=0A=
+		case SI5338_FB_SRC_CLKIN56:=0A=
+		case SI5338_FB_SRC_NOCLK:=0A=
+			pdata->fb_src =3D val;=0A=
+			dev_dbg(&client->dev, "fb-source =3D %d\n", val);=0A=
+			break;=0A=
+		default:=0A=
+			dev_err(&client->dev,=0A=
+				"Invalid source for fbclk %u\n", val);=0A=
+			return -EINVAL;=0A=
+		}=0A=
+	}=0A=
+=0A=
+	/* property silab,pll-source */=0A=
+	if (!of_property_read_u32(np, "silab,pll-source", &val)) {=0A=
+		switch (val) {=0A=
+		case SI5338_PFD_IN_REF_REFCLK:=0A=
+		case SI5338_PFD_IN_REF_FBCLK:=0A=
+		case SI5338_PFD_IN_REF_DIVREFCLK:=0A=
+		case SI5338_PFD_IN_REF_DIVFBCLK:=0A=
+		case SI5338_PFD_IN_REF_XOCLK:=0A=
+		case SI5338_PFD_IN_REF_NOCLK:=0A=
+			pdata->pll_src =3D val;=0A=
+			dev_dbg(&client->dev, "pll-source =3D %d\n", val);=0A=
+			break;=0A=
+		default:=0A=
+			dev_err(&client->dev,=0A=
+				"Invalid source for pll %u\n", val);=0A=
+			return -EINVAL;=0A=
+		}=0A=
+	}=0A=
+=0A=
+	/* property silab,pll-vco */=0A=
+	if (!of_property_read_u32(np, "silab,pll-vco", &val)) {=0A=
+		if (val < FVCOMIN || val > FVCOMAX) {=0A=
+			dev_err(&client->dev,=0A=
+				"pll-vco out of range [%lldu..%lldu]\n",=0A=
+				FVCOMIN, FVCOMAX);=0A=
+			return -EINVAL;=0A=
+		}=0A=
+		pdata->pll_vco =3D val;=0A=
+	}=0A=
+=0A=
+	if (!of_property_read_u32(np, "silab,pll-master", &val)) {=0A=
+		if (val > 3) {=0A=
+			dev_err(&client->dev,=0A=
+				"Invalid pll-master %u\n", val);=0A=
+			return -EINVAL;=0A=
+		}=0A=
+		pdata->pll_master =3D val;=0A=
+		dev_dbg(&client->dev, "pll-master =3D %d\n", val);=0A=
+	}=0A=
+=0A=
+	/* per clock out */=0A=
+	for_each_child_of_node(np, child) {=0A=
+		if (of_property_read_u32(child, "reg", &num)) {=0A=
+			dev_err(&client->dev, "Missing reg property of %s\n",=0A=
+				child->name);=0A=
+			return -EINVAL;=0A=
+		}=0A=
+		if (num > 4) {=0A=
+			dev_err(&client->dev, "Invalid clkout %u\n", num);=0A=
+			return -EINVAL;=0A=
+		}=0A=
+=0A=
+		of_property_read_string(child, "name",=0A=
+					&pdata->clkout[num].name);=0A=
+=0A=
+		if (!of_property_read_u32(child, "silabs,clock-source", &val)) {=0A=
+			switch (val) {=0A=
+			case SI5338_OUT_MUX_FBCLK:=0A=
+			case SI5338_OUT_MUX_REFCLK:=0A=
+			case SI5338_OUT_MUX_DIVFBCLK:=0A=
+			case SI5338_OUT_MUX_DIVREFCLK:=0A=
+			case SI5338_OUT_MUX_XOCLK:=0A=
+			case SI5338_OUT_MUX_MS0:=0A=
+			case SI5338_OUT_MUX_MSN:=0A=
+			case SI5338_OUT_MUX_NOCLK:=0A=
+				pdata->clkout[num].clkout_src =3D val;=0A=
+				dev_dbg(&client->dev, "clkout_src =3D %d\n", val);=0A=
+				break;=0A=
+			default:=0A=
+				dev_err(&client->dev,=0A=
+					"Invalid source for output %u\n", num);=0A=
+				return -EINVAL;=0A=
+			}=0A=
+		}=0A=
+		if (!of_property_read_string(child, "silabs,drive-config",=0A=
+					     &pdata->clkout[num].drive)) {=0A=
+			if (find_drive_config(pdata->clkout[num].drive) < 0) {=0A=
+				dev_err(&client->dev,=0A=
+					"Invalid drive config for output %u\n",=0A=
+					num);=0A=
+				return -EINVAL;=0A=
+			}=0A=
+			dev_dbg(&client->dev, "drive-config =3D %s\n",=0A=
+				pdata->clkout[num].drive);=0A=
+		}=0A=
+		if (!of_property_read_u32(child,=0A=
+					  "silabs,disable-state",=0A=
+					  &val)) {=0A=
+			switch (val) {=0A=
+			case SI5338_OUT_DIS_HIZ:=0A=
+			case SI5338_OUT_DIS_LOW:=0A=
+			case SI5338_OUT_DIS_HI:=0A=
+			case SI5338_OUT_DIS_ALWAYS_ON:=0A=
+				pdata->clkout[num].disable_state =3D val;=0A=
+				dev_dbg(&client->dev,=0A=
+					"disable-state =3D %d\n", val);=0A=
+				break;=0A=
+			default:=0A=
+				dev_err(&client->dev,=0A=
+					"Invalid disable state for output %u\n",=0A=
+					num);=0A=
+				return -EINVAL;=0A=
+			}=0A=
+		}=0A=
+		if (!of_property_read_u32(child, "clock-frequency", &val)) {=0A=
+			pdata->clkout[num].rate =3D val;=0A=
+			dev_dbg(&client->dev, "clock-frequency =3D %d\n", val);=0A=
+		}=0A=
+		if (of_find_property(child, "enabled", NULL))=0A=
+			pdata->clkout[num].enabled =3D true;=0A=
+	}=0A=
+	/* Replace platform data with device tree */=0A=
+	client->dev.platform_data =3D pdata;=0A=
+=0A=
+	return 0;=0A=
+}=0A=
+#else=0A=
+static int si5338_dt_parse(struct i2c_client *client)=0A=
+{=0A=
+	return 0;=0A=
+}=0A=
+#endif /* CONFIG_OF */=0A=
+=0A=
+/*=0A=
+ * Returns the clk registered, or an error code. If successful, the clk =
=0A=
pointer=0A=
+ * is also save in hw->clk.=0A=
+ */=0A=
+static struct clk *si5338_register_clock(struct device *dev,=0A=
+			      struct clk_hw *hw,=0A=
+			      const char *name,=0A=
+			      const char **parent_names,=0A=
+			      u8 num_parents,=0A=
+			      const struct clk_ops *ops,=0A=
+			      unsigned long flags)=0A=
+{=0A=
+	struct clk *clk;=0A=
+	struct clk_init_data init;=0A=
+=0A=
+	memset(&init, 0, sizeof(init));=0A=
+	init.name =3D name;=0A=
+	init.ops =3D ops;=0A=
+	init.flags =3D flags;=0A=
+	init.parent_names =3D parent_names;=0A=
+	init.num_parents =3D num_parents;=0A=
+	hw->init =3D &init;=0A=
+	dev_dbg(dev, "Registering %s\n", name);=0A=
+	clk =3D devm_clk_register(dev, hw);=0A=
+=0A=
+	if (IS_ERR(clk))=0A=
+		dev_err(dev, "unable to register %s\n", name);=0A=
+=0A=
+	return clk;=0A=
+}=0A=
+=0A=
+#define STRNCAT_LENGTH (MAX_NAME_LENGTH - name_prefix_length)=0A=
+static int si5338_i2c_probe(struct i2c_client *client,=0A=
+			    const struct i2c_device_id *id)=0A=
+{=0A=
+	struct si5338_platform_data *pdata;=0A=
+	struct si5338_driver_data *drvdata;=0A=
+	struct clk *clk =3D NULL;=0A=
+	char name_buf[8][MAX_NAME_LENGTH];=0A=
+	char register_name[MAX_NAME_LENGTH];=0A=
+	const char *pclkin[4] =3D {"in12", "in3", "in4", "in56"};=0A=
+	const char *parent_names[8] =3D {=0A=
+		name_buf[0], name_buf[1], name_buf[2], name_buf[3],=0A=
+		name_buf[4], name_buf[5], name_buf[6], name_buf[7]=0A=
+	};=0A=
+	int ret, n, name_prefix_length;=0A=
+	bool require_xtal =3D false;=0A=
+	bool require_ref =3D false;=0A=
+	bool require_fb =3D false;=0A=
+	bool require_pll =3D false;=0A=
+	unsigned long flags;=0A=
+=0A=
+	ret =3D si5338_dt_parse(client);=0A=
+	if (ret)=0A=
+		return ret;=0A=
+=0A=
+	pdata =3D client->dev.platform_data;=0A=
+	if (!pdata)=0A=
+		return -EINVAL;=0A=
+=0A=
+	drvdata =3D devm_kzalloc(&client->dev, sizeof(*drvdata), GFP_KERNEL);=0A=
+	if (drvdata =3D=3D NULL)=0A=
+		return -ENOMEM;=0A=
+=0A=
+	i2c_set_clientdata(client, drvdata);=0A=
+	drvdata->client =3D client;=0A=
+	if (!pdata->name_prefix) {=0A=
+		strlcpy(drvdata->name_prefix,=0A=
+			dev_name(&client->dev), MAX_NAME_PREFIX - 2);=0A=
+		strncat(drvdata->name_prefix, "-", 1);=0A=
+	} else {=0A=
+		strlcpy(drvdata->name_prefix,=0A=
+			pdata->name_prefix, MAX_NAME_PREFIX);=0A=
+	}=0A=
+	name_prefix_length =3D strlen(drvdata->name_prefix);=0A=
+=0A=
+	/* Check if clkout config is valid */=0A=
+	for (n =3D 0; n < 4; n++) {=0A=
+		/* check clkout source config */=0A=
+		switch (pdata->clkout[n].clkout_src) {=0A=
+		case SI5338_OUT_MUX_NOCLK:=0A=
+			if (pdata->clkout[n].rate)=0A=
+				pdata->clkout[n].rate =3D 0;=0A=
+			break;=0A=
+		case SI5338_OUT_MUX_REFCLK:=0A=
+		case SI5338_OUT_MUX_DIVREFCLK:=0A=
+			require_ref =3D true;=0A=
+			break;=0A=
+		case SI5338_OUT_MUX_FBCLK:=0A=
+		case SI5338_OUT_MUX_DIVFBCLK:=0A=
+			require_fb =3D true;=0A=
+			break;=0A=
+		case SI5338_OUT_MUX_XOCLK:=0A=
+			require_xtal =3D true;=0A=
+			break;=0A=
+		case SI5338_OUT_MUX_MS0:=0A=
+		case SI5338_OUT_MUX_MSN:=0A=
+			require_pll =3D true;=0A=
+			break;=0A=
+		default:=0A=
+			dev_err(&client->dev, "Invalid clkout source\n");=0A=
+			return -EINVAL;=0A=
+		}=0A=
+=0A=
+		/* check clkout drive config */=0A=
+		if (find_drive_config(pdata->clkout[n].drive) < 0) {=0A=
+			dev_err(&client->dev,=0A=
+				"Invalid drive config for output %u\n", n);=0A=
+			return -EINVAL;=0A=
+		}=0A=
+=0A=
+		/* check clkout disable state config */=0A=
+		switch (pdata->clkout[n].disable_state) {=0A=
+		case SI5338_OUT_DIS_HIZ:=0A=
+		case SI5338_OUT_DIS_LOW:=0A=
+		case SI5338_OUT_DIS_HI:=0A=
+		case SI5338_OUT_DIS_ALWAYS_ON:=0A=
+			break;=0A=
+		default:=0A=
+			dev_err(&client->dev,=0A=
+				"Invalid disable state for output %u\n", n);=0A=
+			return -EINVAL;=0A=
+		}=0A=
+=0A=
+	}=0A=
+	/* check pll source */=0A=
+	if (require_pll) {=0A=
+		switch (pdata->pll_src) {=0A=
+		case SI5338_PFD_IN_REF_XOCLK:=0A=
+			require_xtal =3D true;=0A=
+			break;=0A=
+		case SI5338_PFD_IN_REF_REFCLK:=0A=
+		case SI5338_PFD_IN_REF_DIVREFCLK:=0A=
+			require_ref =3D true;=0A=
+			break;=0A=
+		case SI5338_PFD_IN_REF_FBCLK:=0A=
+		case SI5338_PFD_IN_REF_DIVFBCLK:=0A=
+			require_fb =3D true;=0A=
+			break;=0A=
+		case SI5338_PFD_IN_REF_NOCLK:=0A=
+		default:=0A=
+			dev_err(&client->dev, "Invalid pll source\n");=0A=
+			return -EINVAL;=0A=
+		}=0A=
+	}=0A=
+	/* check refclk source */=0A=
+	if (require_ref) {=0A=
+		switch (pdata->ref_src) {=0A=
+		case SI5338_REF_SRC_CLKIN12:=0A=
+			if (require_xtal) {=0A=
+				dev_err(&client->dev,=0A=
+					"Error in configuration: IN1/IN2 and XTAL are mutually exclusive\n");=
=0A=
+				return -EINVAL;=0A=
+			}=0A=
+			drvdata->pclkin[0] =3D devm_clk_get(&client->dev,=0A=
+							  pclkin[0]);=0A=
+			if (PTR_ERR(drvdata->pclkin[0]) =3D=3D -EPROBE_DEFER)=0A=
+				return -EPROBE_DEFER;=0A=
+			if (IS_ERR_OR_NULL(drvdata->pclkin[0])) {=0A=
+				dev_err(&client->dev,=0A=
+					"IN1/IN2 doesn't a have source\n");=0A=
+				return -EINVAL;=0A=
+			}=0A=
+			break;=0A=
+		case SI5338_REF_SRC_CLKIN3:=0A=
+			drvdata->pclkin[1] =3D devm_clk_get(&client->dev,=0A=
+							  pclkin[1]);=0A=
+			if (PTR_ERR(drvdata->pclkin[1]) =3D=3D -EPROBE_DEFER)=0A=
+				return -EPROBE_DEFER;=0A=
+			if (IS_ERR_OR_NULL(drvdata->pclkin[1])) {=0A=
+				dev_err(&client->dev,=0A=
+					"IN3 doesn't have a source\n");=0A=
+				return -EINVAL;=0A=
+			}=0A=
+			break;=0A=
+		default:=0A=
+			dev_err(&client->dev,=0A=
+				"Invalid source for refclk\n");=0A=
+			return -EINVAL;=0A=
+		}=0A=
+	}=0A=
+	/* check fbclk source */=0A=
+	if (require_fb) {=0A=
+		switch (pdata->fb_src) {=0A=
+		case SI5338_FB_SRC_CLKIN4:=0A=
+			drvdata->pclkin[2] =3D devm_clk_get(&client->dev,=0A=
+							  pclkin[2]);=0A=
+			if (PTR_ERR(drvdata->pclkin[2]) =3D=3D -EPROBE_DEFER)=0A=
+				return -EPROBE_DEFER;=0A=
+			if (IS_ERR_OR_NULL(drvdata->pclkin[2])) {=0A=
+				dev_err(&client->dev,=0A=
+					"IN4 doesn't have a source\n");=0A=
+				return -EINVAL;=0A=
+			}=0A=
+			break;=0A=
+		case SI5338_FB_SRC_CLKIN56:=0A=
+			drvdata->pclkin[3] =3D devm_clk_get(&client->dev,=0A=
+							  pclkin[3]);=0A=
+			if (PTR_ERR(drvdata->pclkin[3]) =3D=3D -EPROBE_DEFER)=0A=
+				return -EPROBE_DEFER;=0A=
+			if (IS_ERR_OR_NULL(drvdata->pclkin[3])) {=0A=
+				dev_err(&client->dev,=0A=
+					"IN5/IN6 doesn't have a source\n");=0A=
+				return -EINVAL;=0A=
+			}=0A=
+			break;=0A=
+		case SI5338_FB_SRC_NOCLK:=0A=
+		default:=0A=
+			dev_err(&client->dev,=0A=
+				"Invalid source for fbclk\n");=0A=
+			return -EINVAL;=0A=
+		}=0A=
+	}=0A=
+	/* check xtal */=0A=
+	if (require_xtal) {=0A=
+		drvdata->pxtal =3D devm_clk_get(&client->dev, "xtal");=0A=
+		if (PTR_ERR(drvdata->pxtal) =3D=3D -EPROBE_DEFER)=0A=
+			return -EPROBE_DEFER;=0A=
+		if (IS_ERR_OR_NULL(drvdata->pxtal)) {=0A=
+			dev_err(&client->dev,=0A=
+				"XTAL doesn't have a source\n");=0A=
+			return -EINVAL;=0A=
+		}=0A=
+	}=0A=
+=0A=
+	/* Register regmap */=0A=
+	drvdata->regmap =3D devm_regmap_init_i2c(client, &si5338_regmap_config);=
=0A=
+	if (IS_ERR(drvdata->regmap)) {=0A=
+		dev_err(&client->dev, "failed to allocate register map\n");=0A=
+		return PTR_ERR(drvdata->regmap);=0A=
+	}=0A=
+=0A=
+	ret =3D regmap_read(drvdata->regmap, REG5338_DEV_CONFIG2, &n);=0A=
+	if (ret) {=0A=
+		dev_err(&client->dev, "Failed to access regmap\n");=0A=
+		return ret;=0A=
+	}=0A=
+=0A=
+	/* Check if si5338 exists */=0A=
+	if ((n & REG5338_DEV_CONFIG2_MASK) !=3D REG5338_DEV_CONFIG2_VAL) {=0A=
+		dev_err(&client->dev,=0A=
+			"Chip returned unexpected value from reg 0x%x: 0x%x, expected 0x%x. =0A=
It is not %s\n",=0A=
+			REG5338_DEV_CONFIG2, n, REG5338_DEV_CONFIG2_VAL,=0A=
+			id->name);=0A=
+		return -ENODEV;=0A=
+	}=0A=
+=0A=
+	dev_dbg(&client->dev, "Chip %s is found\n", id->name);=0A=
+=0A=
+	ret =3D pre_init(drvdata);		/* Disable all */=0A=
+	if (ret)=0A=
+		return ret;=0A=
+=0A=
+	/*=0A=
+	 * Set up clock structure=0A=
+	 * These clocks have fixed parent=0A=
+	 *	xtal =3D> xoclk=0A=
+	 *	refclk =3D> divrefclk=0A=
+	 *	fbclk =3D> divfbclk=0A=
+	 *	pll =3D> multisynth=0A=
+	 */=0A=
+=0A=
+	/* setup refclk parent */=0A=
+	ret =3D si5338_refclk_reparent(drvdata, pdata->ref_src);=0A=
+	if (ret) {=0A=
+		dev_err(&client->dev,=0A=
+			"failed to reparent refclk to %d\n", pdata->ref_src);=0A=
+		return ret;=0A=
+	}=0A=
+=0A=
+	/* setup fbclk parent */=0A=
+	ret =3D si5338_fbclk_reparent(drvdata, pdata->fb_src);=0A=
+	if (ret) {=0A=
+		dev_err(&client->dev,=0A=
+			"failed to reparent fbclk to %d\n", pdata->fb_src);=0A=
+		return ret;=0A=
+	}=0A=
+=0A=
+	/* setup pll parent */=0A=
+	ret =3D si5338_pll_reparent(drvdata, pdata->pll_src);=0A=
+	if (ret) {=0A=
+		dev_err(&client->dev,=0A=
+			"failed to reparent pll %d to %d\n",=0A=
+			n, pdata->pll_src);=0A=
+		return ret;=0A=
+	}=0A=
+=0A=
+	for (n =3D 0; n < 4; n++) {=0A=
+		ret =3D si5338_clkout_reparent(drvdata, n,=0A=
+					      pdata->clkout[n].clkout_src);=0A=
+		if (ret) {=0A=
+			dev_err(&client->dev,=0A=
+				"failed to reparent clkout %d to %d\n",=0A=
+				n, pdata->clkout[n].clkout_src);=0A=
+			return ret;=0A=
+		}=0A=
+=0A=
+		ret =3D si5338_clkout_set_drive_config(drvdata, n,=0A=
+					      pdata->clkout[n].drive);=0A=
+		if (ret) {=0A=
+			dev_err(&client->dev,=0A=
+				"failed set drive config of clkout%d to %s\n",=0A=
+				n, pdata->clkout[n].drive);=0A=
+			return ret;=0A=
+		}=0A=
+=0A=
+		ret =3D si5338_clkout_set_disable_state(drvdata, n,=0A=
+						pdata->clkout[n].disable_state);=0A=
+		if (ret) {=0A=
+			dev_err(&client->dev,=0A=
+				"failed set disable state of clkout%d to %d\n",=0A=
+				n, pdata->clkout[n].disable_state);=0A=
+			return ret;=0A=
+		}=0A=
+	}=0A=
+=0A=
+	/*=0A=
+	 * To form clock names, concatentate name prefix with each name.=0A=
+	 * The result string is up to MAX_NAME_LENGTH including termination.=0A=
+	 */=0A=
+=0A=
+	/* Register xtal input clock */=0A=
+	if (!IS_ERR_OR_NULL(drvdata->pxtal)) {=0A=
+		strlcpy(register_name, drvdata->name_prefix, MAX_NAME_PREFIX);=0A=
+		strncat(register_name, si5338_input_names[4], STRNCAT_LENGTH);=0A=
+		drvdata->pxtal_name =3D __clk_get_name(drvdata->pxtal);=0A=
+		clk =3D si5338_register_clock(&client->dev, &drvdata->xtal,=0A=
+					 register_name, &drvdata->pxtal_name, 1,=0A=
+					 &si5338_xtal_ops, 0);=0A=
+		if (IS_ERR(clk))=0A=
+			return PTR_ERR(clk);=0A=
+	}=0A=
+=0A=
+	/* Register clkin input clock */=0A=
+	for (n =3D 0; n < 4; n++) {=0A=
+		if (IS_ERR_OR_NULL(drvdata->pclkin[n]))=0A=
+			continue;=0A=
+=0A=
+		drvdata->clkin[n].drvdata =3D drvdata;=0A=
+		drvdata->clkin[n].num =3D n;=0A=
+		strlcpy(register_name, drvdata->name_prefix, MAX_NAME_PREFIX);=0A=
+		strncat(register_name, si5338_input_names[n], STRNCAT_LENGTH);=0A=
+		drvdata->pclkin_name[n] =3D __clk_get_name(drvdata->pclkin[n]);=0A=
+=0A=
+		clk =3D si5338_register_clock(&client->dev,=0A=
+					    &drvdata->clkin[n].hw,=0A=
+					    register_name,=0A=
+					    &drvdata->pclkin_name[n],=0A=
+					    1,=0A=
+					    &si5338_clkin_ops,=0A=
+					    0);=0A=
+		if (IS_ERR(clk))=0A=
+			return PTR_ERR(clk);=0A=
+	}=0A=
+=0A=
+	/*=0A=
+	 * Create unique internal names in case multiple devices exist=0A=
+	 *=0A=
+	 * Register refclk, parents can be in1/in2, in3, xtal, noclk=0A=
+	 */=0A=
+	drvdata->refclk.drvdata =3D drvdata;=0A=
+	strlcpy(name_buf[0], drvdata->name_prefix, MAX_NAME_PREFIX);=0A=
+	strlcpy(name_buf[1], drvdata->name_prefix, MAX_NAME_PREFIX);=0A=
+	strlcpy(name_buf[2], drvdata->name_prefix, MAX_NAME_PREFIX);=0A=
+	strlcpy(name_buf[3], drvdata->name_prefix, MAX_NAME_PREFIX);=0A=
+	strncat(name_buf[0], si5338_input_names[0], STRNCAT_LENGTH);=0A=
+	strncat(name_buf[1], si5338_input_names[1], STRNCAT_LENGTH);=0A=
+	strncat(name_buf[2], si5338_input_names[4], STRNCAT_LENGTH);=0A=
+	strncat(name_buf[3], si5338_input_names[5], STRNCAT_LENGTH);=0A=
+	strlcpy(register_name, drvdata->name_prefix, MAX_NAME_PREFIX);=0A=
+	strncat(register_name, si5338_pll_src_names[0], STRNCAT_LENGTH);=0A=
+=0A=
+	clk =3D si5338_register_clock(&client->dev, &drvdata->refclk.hw,=0A=
+				 register_name, parent_names, 4,=0A=
+				 &si5338_refclk_ops, 0);=0A=
+	if (IS_ERR(clk))=0A=
+		return PTR_ERR(clk);=0A=
+=0A=
+	/* Register divrefclk, parent is refclk */=0A=
+	strlcpy(name_buf[0], drvdata->name_prefix, MAX_NAME_PREFIX);=0A=
+	strncat(name_buf[0], si5338_pll_src_names[0], STRNCAT_LENGTH);=0A=
+	strlcpy(register_name, drvdata->name_prefix, MAX_NAME_PREFIX);=0A=
+	strncat(register_name, si5338_pll_src_names[2], STRNCAT_LENGTH);=0A=
+=0A=
+	clk =3D si5338_register_clock(&client->dev, &drvdata->divrefclk,=0A=
+				 register_name, parent_names, 1,=0A=
+				 &si5338_divrefclk_ops, 0);=0A=
+	if (IS_ERR(clk))=0A=
+		return PTR_ERR(clk);=0A=
+=0A=
+	/* Register fbclk, parents can be in4, in5/in6, noclk */=0A=
+	drvdata->fbclk.drvdata =3D drvdata;=0A=
+	strlcpy(name_buf[0], drvdata->name_prefix, MAX_NAME_PREFIX);=0A=
+	strlcpy(name_buf[1], drvdata->name_prefix, MAX_NAME_PREFIX);=0A=
+	strlcpy(name_buf[2], drvdata->name_prefix, MAX_NAME_PREFIX);=0A=
+	strncat(name_buf[0], si5338_input_names[2], STRNCAT_LENGTH);=0A=
+	strncat(name_buf[1], si5338_input_names[3], STRNCAT_LENGTH);=0A=
+	strncat(name_buf[2], si5338_input_names[5], STRNCAT_LENGTH);=0A=
+	strlcpy(register_name, drvdata->name_prefix, MAX_NAME_PREFIX);=0A=
+	strncat(register_name, si5338_pll_src_names[1], STRNCAT_LENGTH);=0A=
+=0A=
+	clk =3D si5338_register_clock(&client->dev, &drvdata->fbclk.hw,=0A=
+				 register_name, parent_names, 3,=0A=
+				 &si5338_fbclk_ops, 0);=0A=
+	if (IS_ERR(clk))=0A=
+		return PTR_ERR(clk);=0A=
+=0A=
+	/* Register divfbclk, parent is fbclk */=0A=
+	strlcpy(name_buf[0], drvdata->name_prefix, MAX_NAME_PREFIX);=0A=
+	strncat(name_buf[0], si5338_pll_src_names[1], STRNCAT_LENGTH);=0A=
+	strlcpy(register_name, drvdata->name_prefix, MAX_NAME_PREFIX);=0A=
+	strncat(register_name, si5338_pll_src_names[3], STRNCAT_LENGTH);=0A=
+=0A=
+	clk =3D si5338_register_clock(&client->dev, &drvdata->divfbclk,=0A=
+				 register_name, parent_names, 1,=0A=
+				 &si5338_divfbclk_ops, 0);=0A=
+	if (IS_ERR(clk))=0A=
+		return PTR_ERR(clk);=0A=
+=0A=
+	/* register PLL */=0A=
+	drvdata->pll.drvdata =3D drvdata;=0A=
+	for (n =3D 0; n < ARRAY_SIZE(si5338_pll_src_names); n++) {=0A=
+		strlcpy(name_buf[n], drvdata->name_prefix, MAX_NAME_PREFIX);=0A=
+		strncat(name_buf[n], si5338_pll_src_names[n], STRNCAT_LENGTH);=0A=
+	}=0A=
+	strlcpy(register_name, drvdata->name_prefix, MAX_NAME_PREFIX);=0A=
+	strncat(register_name, si5338_msynth_src_names[0], STRNCAT_LENGTH);=0A=
+	clk =3D si5338_register_clock(&client->dev, &drvdata->pll.hw,=0A=
+				 register_name, parent_names, 5,=0A=
+				 &si5338_pll_ops, 0);=0A=
+	if (IS_ERR(clk))=0A=
+		return PTR_ERR(clk);=0A=
+=0A=
+	/* If pll_vco is specified, always use it to set pll clock */=0A=
+	if (require_pll && pdata->pll_vco) {=0A=
+		if (pdata->pll_vco > FVCOMIN && pdata->pll_vco < FVCOMAX) {=0A=
+			dev_dbg(&client->dev, "Setting pll vco rate to %u\n",=0A=
+				pdata->pll_vco);=0A=
+			ret =3D clk_set_rate(clk, pdata->pll_vco);=0A=
+			if (ret) {=0A=
+				dev_err(&client->dev, "Cannot set pll vco rate : %d\n",=0A=
+					ret);=0A=
+				return ret;=0A=
+			}=0A=
+		} else {=0A=
+			pdata->pll_vco =3D 0;=0A=
+		}=0A=
+	}=0A=
+=0A=
+	/* register clk multisync and clk out divider */=0A=
+	drvdata->msynth =3D devm_kzalloc(&client->dev, 4 *=0A=
+				       sizeof(*drvdata->msynth), GFP_KERNEL);=0A=
+	if (!drvdata->msynth)=0A=
+		return -ENOMEM;=0A=
+=0A=
+	drvdata->clkout =3D devm_kzalloc(&client->dev, 4 *=0A=
+				       sizeof(*drvdata->clkout), GFP_KERNEL);=0A=
+	if (!drvdata->clkout)=0A=
+		return -ENOMEM;=0A=
+=0A=
+	drvdata->onecell.clk_num =3D 4;=0A=
+	drvdata->onecell.clks =3D devm_kzalloc(&client->dev,=0A=
+		4 * sizeof(*drvdata->onecell.clks), GFP_KERNEL);=0A=
+=0A=
+	if (!drvdata->onecell.clks)=0A=
+		return -ENOMEM;=0A=
+=0A=
+	for (n =3D 0; n < 4; n++) {=0A=
+		drvdata->msynth[n].num =3D n;=0A=
+		drvdata->msynth[n].drvdata =3D drvdata;=0A=
+		strlcpy(name_buf[0], drvdata->name_prefix, MAX_NAME_PREFIX);=0A=
+		strncat(name_buf[0], si5338_msynth_src_names[0],=0A=
+			STRNCAT_LENGTH);=0A=
+		strlcpy(register_name, drvdata->name_prefix, MAX_NAME_PREFIX);=0A=
+		strncat(register_name, si5338_msynth_names[n], STRNCAT_LENGTH);=0A=
+		flags =3D (!pdata->pll_vco && n =3D=3D pdata->pll_master) ?=0A=
+			CLK_SET_RATE_PARENT : 0;=0A=
+=0A=
+		clk =3D si5338_register_clock(&client->dev,=0A=
+					    &drvdata->msynth[n].hw,=0A=
+					    register_name,=0A=
+					    parent_names,=0A=
+					    1,=0A=
+					    &si5338_msynth_ops,=0A=
+					    flags);=0A=
+		if (IS_ERR(clk))=0A=
+			return PTR_ERR(clk);=0A=
+=0A=
+	}=0A=
+=0A=
+	/*=0A=
+	 * ms0 is available for all clkout=0A=
+	 * ms0/ms1/ms2/ms3 is available for each clkout respectivelly=0A=
+	 */=0A=
+	for (n =3D 0; n < 8; n++) {=0A=
+		strlcpy(name_buf[n], drvdata->name_prefix, MAX_NAME_PREFIX);=0A=
+		strncat(name_buf[n], si5338_clkout_src_names[n],=0A=
+			STRNCAT_LENGTH);=0A=
+	}=0A=
+=0A=
+	for (n =3D 0; n < 4; n++) {=0A=
+		drvdata->clkout[n].num =3D n;=0A=
+		drvdata->clkout[n].drvdata =3D drvdata;=0A=
+		/*=0A=
+		 * Update source=0A=
+		 * ms0 for clkout0=0A=
+		 * ms1 for clkout1=0A=
+		 * ms2 for clkout2=0A=
+		 * ms3 for clkout3=0A=
+		 */=0A=
+		strlcpy(name_buf[6], drvdata->name_prefix, MAX_NAME_PREFIX);=0A=
+		strncat(name_buf[6], si5338_msynth_names[n], STRNCAT_LENGTH);=0A=
+		/*=0A=
+		 * Use clkout_name from device tree or platform data ignoring=0A=
+		 * name_prefix. The clkout_name must be unique for each clock.=0A=
+		 */=0A=
+		if (pdata->clkout[n].name) {=0A=
+			if (strlen(pdata->clkout[n].name) >=3D MAX_NAME_LENGTH) {=0A=
+				dev_warn(&client->dev,=0A=
+					 "clkout[%d] name %s too long\n",=0A=
+					 n, pdata->clkout[n].name);=0A=
+			}=0A=
+			strlcpy(register_name, pdata->clkout[n].name,=0A=
+				MAX_NAME_LENGTH);=0A=
+		} else {=0A=
+			strlcpy(register_name, drvdata->name_prefix,=0A=
+				MAX_NAME_PREFIX);=0A=
+			strncat(register_name, si5338_clkout_names[n],=0A=
+				STRNCAT_LENGTH);=0A=
+		}=0A=
+=0A=
+		clk =3D si5338_register_clock(&client->dev,=0A=
+					    &drvdata->clkout[n].hw,=0A=
+					    register_name,=0A=
+					    parent_names,=0A=
+					    8,=0A=
+					    &si5338_clkout_ops,=0A=
+					    CLK_SET_RATE_PARENT);=0A=
+		if (IS_ERR(clk))=0A=
+			return PTR_ERR(clk);=0A=
+=0A=
+		if (register_debugfs_status(&drvdata->clkout[n])) {=0A=
+			dev_warn(&client->dev,=0A=
+				 "Failed to register clkout status in debugfs\n");=0A=
+		}=0A=
+=0A=
+		drvdata->onecell.clks[n] =3D clk;=0A=
+=0A=
+		/* set initial clkout rate */=0A=
+		if (pdata->clkout[n].rate) {=0A=
+			dev_dbg(&client->dev, "Setting clkout%d rate to %lu\n",=0A=
+				n, pdata->clkout[n].rate);=0A=
+			ret =3D clk_set_rate(clk, pdata->clkout[n].rate);=0A=
+			if (ret) {=0A=
+				dev_err(&client->dev,=0A=
+					"Cannot set rate for clkout%d: %d\n",=0A=
+					n, ret);=0A=
+				return ret;=0A=
+			}=0A=
+			/* clocks need to be prepared before post init */=0A=
+			ret =3D clk_prepare(clk);=0A=
+			if (ret) {=0A=
+				dev_err(&client->dev,=0A=
+					"Cannot prepare clk%d\n", n);=0A=
+				return ret;=0A=
+			}=0A=
+		}=0A=
+	}=0A=
+=0A=
+	/*=0A=
+	 * Important: Go through the procedure to check PLL locking=0A=
+	 * and other steps required by si5338 reference manual.=0A=
+	 */=0A=
+	ret =3D post_init(drvdata);=0A=
+	if (ret)=0A=
+		return ret;=0A=
+=0A=
+	for (n =3D 0; n < 4; n++) {=0A=
+		if (pdata->clkout[n].rate) {=0A=
+			if (pdata->clkout[n].enabled) {=0A=
+				ret =3D clk_enable(drvdata->onecell.clks[n]);=0A=
+				if (ret)=0A=
+					return ret;=0A=
+			} else {=0A=
+				clk_unprepare(drvdata->onecell.clks[n]);=0A=
+			}=0A=
+		}=0A=
+	}=0A=
+=0A=
+	dev_dbg(&client->dev, "%s clocks are registered\n", id->name);=0A=
+=0A=
+#ifdef CONFIG_OF=0A=
+	ret =3D of_clk_add_provider(client->dev.of_node,=0A=
+				  of_clk_src_onecell_get,=0A=
+				  &drvdata->onecell);=0A=
+	if (ret) {=0A=
+		dev_err(&client->dev, "unable to add clk provider\n");=0A=
+		return ret;=0A=
+	}=0A=
+#endif=0A=
+	for (n =3D 0; n < 4; n++) {=0A=
+		clk =3D drvdata->clkout[n].hw.clk;=0A=
+		drvdata->lookup[n] =3D clkdev_alloc(clk,=0A=
+						  __clk_get_name(clk),=0A=
+						  NULL);=0A=
+		if (!drvdata->lookup[n]) {=0A=
+			dev_warn(&client->dev,=0A=
+				"Unable to add clkout%d to clkdev\n", n);=0A=
+			continue;=0A=
+		}=0A=
+		if (strlen(drvdata->lookup[n]->con_id) !=3D=0A=
+					strlen(__clk_get_name(clk))) {=0A=
+			dev_warn(&client->dev,=0A=
+				 "Warning: clkdev doesn't support name longer than %zu\n",=0A=
+				 strlen(drvdata->lookup[n]->con_id));=0A=
+		}=0A=
+		clkdev_add(drvdata->lookup[n]);=0A=
+	}=0A=
+=0A=
+	return 0;=0A=
+}=0A=
+=0A=
+static int si5338_i2c_remove(struct i2c_client *client)=0A=
+{=0A=
+	struct si5338_driver_data *drvdata =3D i2c_get_clientdata(client);=0A=
+	int n;=0A=
+=0A=
+#ifdef CONFIG_OF=0A=
+	of_clk_del_provider(client->dev.of_node);=0A=
+#endif=0A=
+=0A=
+	for (n =3D 0; n < 4; n++) {=0A=
+		if (drvdata->lookup[n])=0A=
+			clkdev_drop(drvdata->lookup[n]);=0A=
+	}=0A=
+=0A=
+	dev_dbg(&client->dev, "Removed\n");=0A=
+=0A=
+	return 0;=0A=
+}=0A=
+=0A=
+=0A=
+static const struct i2c_device_id si5338_i2c_ids[] =3D {=0A=
+	{ "si5338", 0 },=0A=
+	{ }=0A=
+};=0A=
+MODULE_DEVICE_TABLE(i2c, si5338_i2c_ids);=0A=
+=0A=
+static struct i2c_driver si5338_driver =3D {=0A=
+	.driver =3D {=0A=
+		.name =3D "si5338",=0A=
+		.of_match_table =3D of_match_ptr(si5338_dt_ids),=0A=
+	},=0A=
+	.probe =3D si5338_i2c_probe,=0A=
+	.remove =3D si5338_i2c_remove,=0A=
+	.id_table =3D si5338_i2c_ids,=0A=
+};=0A=
+module_i2c_driver(si5338_driver);=0A=
+=0A=
+MODULE_AUTHOR("York Sun <yorksun@freescale.com");=0A=
+MODULE_DESCRIPTION("Silicon Labs Si5338 clock generator driver");=0A=
+MODULE_LICENSE("GPL v2");=0A=
diff --git a/include/dt-bindings/clock/clk-si5338.h =0A=
b/include/dt-bindings/clock/clk-si5338.h=0A=
new file mode 100644=0A=
index 0000000..545c80d=0A=
--- /dev/null=0A=
+++ b/include/dt-bindings/clock/clk-si5338.h=0A=
@@ -0,0 +1,68 @@=0A=
+/*=0A=
+ * This header provides constants for SI5338 I2C clock generator=0A=
+ *=0A=
+ * The constants defined in this header are used in dts files=0A=
+ *=0A=
+ * Copyright 2015 Freescale Semiconductor=0A=
+ *=0A=
+ * York Sun <yorksun@freescale.com>=0A=
+ *=0A=
+ * This program is free software; you can redistribute it and/or modify=0A=
+ * it under the terms of the GNU General Public License version 2 as=0A=
+ * published by the Free Software Foundation.=0A=
+ *=0A=
+ * This program is distributed "as is" WITHOUT ANY WARRANTY of any=0A=
+ * kind, whether express or implied; without even the implied warranty=0A=
+ * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the=0A=
+ * GNU General Public License for more details.=0A=
+ */=0A=
+=0A=
+#ifndef _DT_BINDINGS_CLK_SI5338_H=0A=
+#define _DT_BINDINGS_CLK_SI5338_H=0A=
+=0A=
+/* Used to identify input clock */=0A=
+#define SI5338_INPUT_CLK12		0=0A=
+#define SI5338_INPUT_CLK3		1=0A=
+#define SI5338_INPUT_CLK4		2=0A=
+#define SI5338_INPUT_CLK56		3=0A=
+=0A=
+/* Used to identify the mux source */=0A=
+#define SI5338_REF_SRC_CLKIN12		0=0A=
+#define SI5338_REF_SRC_CLKIN3		1=0A=
+#define SI5338_FB_SRC_CLKIN4		2=0A=
+#define SI5338_FB_SRC_CLKIN56		3=0A=
+#define SI5338_REF_SRC_XTAL		4=0A=
+#define SI5338_FB_SRC_NOCLK		5=0A=
+=0A=
+/* Used to identify the pfd_in_ref mux source */=0A=
+#define SI5338_PFD_IN_REF_REFCLK	0=0A=
+#define SI5338_PFD_IN_REF_FBCLK		1=0A=
+#define SI5338_PFD_IN_REF_DIVREFCLK	2=0A=
+#define SI5338_PFD_IN_REF_DIVFBCLK	3=0A=
+#define SI5338_PFD_IN_REF_XOCLK		4=0A=
+#define SI5338_PFD_IN_REF_NOCLK		5=0A=
+=0A=
+/* Used to identify the pfd_in_fb mux source */=0A=
+#define SI5338_PFD_IN_FB_FBCLK		0=0A=
+#define SI5338_PFD_IN_FB_REFCLK		1=0A=
+#define SI5338_PFD_IN_FB_DIVFBCLK	2=0A=
+#define SI5338_PFD_IN_FB_DIVREFCLK	3=0A=
+#define SI5338_PFD_IN_FB_RESERVED	4=0A=
+#define SI5338_PFD_IN_FB_NOCLK		5=0A=
+=0A=
+/* Used to identify the mux source */=0A=
+#define SI5338_OUT_MUX_FBCLK		0=0A=
+#define SI5338_OUT_MUX_REFCLK		1=0A=
+#define SI5338_OUT_MUX_DIVFBCLK		2=0A=
+#define SI5338_OUT_MUX_DIVREFCLK	3=0A=
+#define SI5338_OUT_MUX_XOCLK		4=0A=
+#define SI5338_OUT_MUX_MS0		5=0A=
+#define SI5338_OUT_MUX_MSN		6	/* MS0/1/2/3 respectivelly */=0A=
+#define SI5338_OUT_MUX_NOCLK		7=0A=
+=0A=
+#define SI5338_OUT_DIS_HIZ		0=0A=
+#define SI5338_OUT_DIS_LOW		1=0A=
+#define SI5338_OUT_DIS_HI		2=0A=
+#define SI5338_OUT_DIS_ALWAYS_ON	3=0A=
+=0A=
+#endif /* _DT_BINDINGS_CLK_SI5338_H */=0A=
diff --git a/include/linux/platform_data/si5338.h =0A=
b/include/linux/platform_data/si5338.h=0A=
new file mode 100644=0A=
index 0000000..5422955=0A=
--- /dev/null=0A=
+++ b/include/linux/platform_data/si5338.h=0A=
@@ -0,0 +1,48 @@=0A=
+/*=0A=
+ * Si5338A/B/C programmable clock generator platform_data.=0A=
+ */=0A=
+=0A=
+#ifndef __LINUX_PLATFORM_DATA_SI5338_H__=0A=
+#define __LINUX_PLATFORM_DATA_SI5338_H__=0A=
+=0A=
+struct clk;=0A=
+=0A=
+/*=0A=
+ * struct si5338_clkout_config - Si5338 clock output configuration=0A=
+ * @name: clkout name. If omitted, clkout0/1/2/3 with name_prefix will =0A=
be used=0A=
+ * @clkout_src: clkout source clock=0A=
+ * @drive: output drive strength=0A=
+ * @rate: initial clkout rate, or default if 0=0A=
+ * @enabled: output enabled by default=0A=
+ */=0A=
+struct si5338_clkout_config {=0A=
+	const char *name;=0A=
+	u8 clkout_src;=0A=
+	const char *drive;=0A=
+	u8 disable_state;=0A=
+	unsigned long rate;=0A=
+	bool enabled;=0A=
+};=0A=
+=0A=
+/*=0A=
+ * struct si5338_platform_data - Platform data for the Si5338 clock driver=
=0A=
+ * @name_prefix: prefix to clock names=0A=
+ *		 In case multiple clock chips exist, each can have unique names=0A=
+ * @ref_src: reference clock source=0A=
+ * @fb_src: feedback clock source=0A=
+ * @pll_src: array of pll source clock setting=0A=
+ * @pll_master: index of MS (1 of 4) which can change pll clock=0A=
+ * @pll_vco: set pll vco clock. If this is set, pll_master is ignored=0A=
+ * @clkout: array of clkout configuration=0A=
+ */=0A=
+struct si5338_platform_data {=0A=
+	const char *name_prefix;=0A=
+	u8 ref_src;=0A=
+	u8 fb_src;=0A=
+	u8 pll_src;=0A=
+	u8 pll_master;=0A=
+	u32 pll_vco;=0A=
+	struct si5338_clkout_config clkout[4];=0A=
+};=0A=
+=0A=
+#endif=0A=
-- =0A=
1.7.9.5=0A=
=0A=
