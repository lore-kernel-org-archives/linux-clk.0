Return-Path: <khilman@baylibre.com>
Return-Path: <khilman@baylibre.com>
From: Kevin Hilman <khilman@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>
Cc: linux-clk@vger.kernel.org,  linux-amlogic@lists.infradead.org,  carlo@endlessm.com,  victor.wan@amlogic.com,  jerry.cao@amlogic.com,  xing.xu@amlogic.com
Subject: Re: [PATCH 0/7] Add support for AmLogic GXBB clock controller
References: <1465518774-26924-1-git-send-email-mturquette@baylibre.com>
Date: Tue, 14 Jun 2016 11:59:10 -0700
In-Reply-To: <1465518774-26924-1-git-send-email-mturquette@baylibre.com>
	(Michael Turquette's message of "Thu, 9 Jun 2016 17:32:47 -0700")
Message-ID: <m2d1njsikh.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

Hi Mike,

Michael Turquette <mturquette@baylibre.com> writes:

> This series is based on the AmLogic Meson8b rewrite/cleanup[0]. The
> AmLogic GXBB is an ARMv8-based SoC, fed by a 24MHZ xtal, and it provides
> several PLLs, muxes dividers and gates to drive CPUs and peripherals.
>
> While based on the Meson8b clock controller driver, this series adds
> supports for Multi-phase Locked Loops (mpll) and support for PLLs with
> fractional rates.
>
> This series introduces the clock controller driver for the gxbb,
> including the DT binding description and accompanying change in the gxbb
> dtsi. Only three clocks are exposed via the headers in the dt-bindings
> include-chroot. More can be added later, but since these values
> represent an ABI I wanted to start small. I'm not sure about the names
> for the gate clocks, so I especially tried to avoid putting those in the
> binding (with the exception of the Ethernet gate, which Kevin has needed
> for a while).

I tested this on top of my integration branch for v4.7-rc[1] along with
the ethernet driver.

First, I modified the ethernet node to use the new clock[2], and then I
added the ethernet driver to the build as modules[3] since
unloading/reloading the module is testing the clock API[3].

Then, I tested unloading/reloading the dwmac-meson module on
meson-gxbb-p200 and meson-gxbb-odroidc2 and found that the system hung
on module reload.

As you suggested off-list, this might be because it's walking up the
tree and disabling clk81, which would cause such a problem, so I added
CLK_IS_CRITICAL to clk81, and that got things working just fine.

With that change, I can now unload/reload the ethernet module (which is
prepare/enable'ing and unprepare/disable'ing the clocks.

Tested-by: Kevin Hilman <khilman@baylibre.com>

Kevin

[1] https://git.kernel.org/cgit/linux/kernel/git/khilman/linux-amlogic.git/log/?h=v4.7/integ
[2]
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index e3210eb89bc8..834258a36cfb 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -45,6 +45,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/gpio/meson-gxbb-gpio.h>
 #include <dt-bindings/reset/amlogic,meson-gxbb-reset.h>
+#include <dt-bindings/clock/gxbb-clkc.h>
 
 / {
 	compatible = "amlogic,meson-gxbb";
@@ -332,7 +333,7 @@
 			       0x0 0xc8834540 0x0 0x4>;
 			interrupts = <0 8 1>;
 			interrupt-names = "macirq";
-			clocks = <&xtal>;
+			clocks = <&clkc CLKID_ETH>;
 			clock-names = "stmmaceth";
 			phy-mode = "rgmii";
 			status = "disabled";

[3]
CONFIG_STMMAC_ETH=m
CONFIG_PHYLIB=m
CONFIG_MICREL_PHY=m
CONFIG_REALTEK_PHY=m

[4]
diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index 26c78a2a614d..007b7157cf4b 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -558,7 +558,7 @@ static struct clk_gate gxbb_clk81 = {
 		.ops = &clk_gate_ops,
 		.parent_names = (const char *[]){ "mpeg_clk_div" },
 		.num_parents = 1,
-		.flags = (CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED),
+		.flags = (CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED | CLK_IS_CRITICAL),
 	},
 };
