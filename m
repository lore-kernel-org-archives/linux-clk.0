Return-Path: <repk@triplefau.lt>
Date: Mon, 7 Dec 2015 19:17:52 +0100
From: Remi Pommarel <repk@triplefau.lt>
To: Stefan Wahren <info@lategoodbye.de>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Eric Anholt <eric@anholt.net>,
	Lee Jones <lee@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 4/4] clk: bcm2835: Add PWM clock support to the device
 tree
Message-ID: <20151207181752.GA453@cruxbox>
References: <1449418969-5565-1-git-send-email-repk@triplefau.lt>
 <1449418969-5565-5-git-send-email-repk@triplefau.lt>
 <5664A5A9.4030204@lategoodbye.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <5664A5A9.4030204@lategoodbye.de>
List-ID: <linux-clk.vger.kernel.org>

Hi Stefan,

On Sun, Dec 06, 2015 at 10:16:25PM +0100, Stefan Wahren wrote:
> Hi Remi,
> 
> please send this patch to devicetree@vger.kernel.org.

Ok, just to be sure I understand the process here. I should resend a new
version of the whole patchset including the devicetree mailing list as
recipent. Then the first 3 patches will eventually get pushed by a clock
subsystem maintainer. And finally this last patch will be pushed by a
devicetree maintainer.

Am I right here ?

> 
> Am 06.12.2015 um 17:22 schrieb Remi Pommarel:
> >Signed-off-by: Remi Pommarel <repk@triplefau.lt>
> >---
> >  arch/arm/boot/dts/bcm2835-rpi.dtsi | 4 ++++
> >  arch/arm/boot/dts/bcm2835.dtsi     | 9 +++++++++
> >  2 files changed, 13 insertions(+)
> >
> >diff --git a/arch/arm/boot/dts/bcm2835-rpi.dtsi b/arch/arm/boot/dts/bcm2835-rpi.dtsi
> >index 3572f03..55801e0 100644
> >--- a/arch/arm/boot/dts/bcm2835-rpi.dtsi
> >+++ b/arch/arm/boot/dts/bcm2835-rpi.dtsi
> >@@ -60,3 +60,7 @@
> >  	status = "okay";
> >  	bus-width = <4>;
> >  };
> >+
> >+&pwm {
> >+	status = "okay";
> >+};
> >diff --git a/arch/arm/boot/dts/bcm2835.dtsi b/arch/arm/boot/dts/bcm2835.dtsi
> >index aef64de..641f7f4 100644
> >--- a/arch/arm/boot/dts/bcm2835.dtsi
> >+++ b/arch/arm/boot/dts/bcm2835.dtsi
> >@@ -149,6 +149,15 @@
> >  			status = "disabled";
> >  		};
> >
> >+		pwm: pwm@7e20c000 {
> >+			compatible = "brcm,bcm2835-pwm";
> >+			reg = <0x7e20c000 0x28>;
> >+			clocks = <&clocks BCM2835_CLOCK_PWM>;
> 
> Looks like #pwm-cells is missing.
> 

Yes will do. Thank you.

Regards

-- 
Remi
