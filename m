Return-Path: <repk@triplefau.lt>
Date: Sun, 29 Nov 2015 01:31:21 +0100
From: Remi Pommarel <repk@triplefau.lt>
To: Stefan Wahren <info@lategoodbye.de>
Cc: Eric Anholt <eric@anholt.net>, Stephen Warren <swarren@wwwdotorg.org>,
	Lee Jones <lee@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-rpi-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bart Tanghe <bart.tanghe@thomasmore.be>
Subject: Re: [PATCH v2 0/3] Add PWM clock support for bcm2835
Message-ID: <20151129003121.GH491@cruxbox>
References: <1447251765-16297-1-git-send-email-repk@triplefau.lt>
 <565A13F7.3020905@lategoodbye.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <565A13F7.3020905@lategoodbye.de>
List-ID: <linux-clk.vger.kernel.org>

Hi Stefan,

On Sat, Nov 28, 2015 at 09:52:07PM +0100, Stefan Wahren wrote:
> i applied the series including the devicetree modification, but it
> doesn't work for me.
> 
> First of all i get an ugly division by zero warning from the pwm
> driver. The pwm driver still assume a fixed clock and doesn't handle
> the error cases of clk_get_rate(). I attached a patch at the end.

Yes the devicetree patch from patchset version one does not work with
this version. I haven't sent the modified devicetree because Eric said
it is better to send it in a separate patchset. If you want to test it I
attached the working devicetree patch at the end.

But, yes, that would be nice if pwm driver was protected from this
division by zero.

> 
> The reason in my case why clk_get_rate() returns zero is that the
> pwm clock is orphan ( pwm is listed under
> /sys/kernel/debug/clk_orphan_summary ).
> 
> My suspicion is it has something to do with the clock manager driver.
> The bcm2835_clock_per_parents contains only 8 entries. But according to
> BCM2835-ARM-Peripherals.pdf [1] CM_GP0CTL SRC page 107 has 16
> entries. The upper 8 entries are all mapped to GND. It looks to me
> that the driver doesn't take care of this and so the pwm clock isn't
> able to determine it's parent.
> 

In fact, default parent for pwm after boot up is GND (CM_GP0CTL SRC ==
0). Which means that the default pwm clock rate is 0. The clock appears
to be orphan because in the bcm2835 clock driver, the GND clock is not
registered.

So, IMHO, we have to set the default pwm rate from the devicetree, using
assigned-clock-rates. That what does the following dts patch.

This patch also set the gpio pin 18 to proper alternate function in order
to be able to get pwm output from this gpio.

Thanks

-- 
Remi

---------------------------------->8------------------------------
diff --git a/arch/arm/boot/dts/bcm2835-rpi-b.dts b/arch/arm/boot/dts/bcm2835-rpi-b.dts
index ff6b2d1..478aa79 100644
--- a/arch/arm/boot/dts/bcm2835-rpi-b.dts
+++ b/arch/arm/boot/dts/bcm2835-rpi-b.dts
@@ -13,5 +13,10 @@
 };
 
 &gpio {
-       pinctrl-0 = <&gpioout &alt0 &alt3>;
+       pinctrl-0 = <&gpioout &alt0 &alt3 &gpiopwm>;
+
+       gpiopwm: pwm {
+               brcm,pins = <18>;
+               brcm,function = <BCM2835_FSEL_ALT5>;
+       };
 };
diff --git a/arch/arm/boot/dts/bcm2835-rpi.dtsi b/arch/arm/boot/dts/bcm2835-rpi.dtsi
index 3572f03..55801e0 100644
--- a/arch/arm/boot/dts/bcm2835-rpi.dtsi
+++ b/arch/arm/boot/dts/bcm2835-rpi.dtsi
@@ -60,3 +60,7 @@
        status = "okay";
        bus-width = <4>;
 };
+
+&pwm {
+       status = "okay";
+};
diff --git a/arch/arm/boot/dts/bcm2835.dtsi b/arch/arm/boot/dts/bcm2835.dtsi
index aef64de..567bd35 100644
--- a/arch/arm/boot/dts/bcm2835.dtsi
+++ b/arch/arm/boot/dts/bcm2835.dtsi
@@ -149,6 +149,15 @@
                        status = "disabled";
                };
 
+               pwm: pwm@7e20c000 {
+                       compatible = "brcm,bcm2835-pwm";
+                       reg = <0x7e20c000 0x28>;
+                       clocks = <&clocks BCM2835_CLOCK_PWM>;
+                       assigned-clocks = <&clocks BCM2835_CLOCK_PWM>;
+                       assigned-clock-rates = <9600000>;
+                       status = "disabled";
+               };
+
                sdhci: sdhci@7e300000 {
                        compatible = "brcm,bcm2835-sdhci";
                        reg = <0x7e300000 0x100>;
