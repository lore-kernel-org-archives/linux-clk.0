Return-Path: <mturquette@linaro.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Stephen Boyd <sboyd@codeaurora.org>, 
From: Michael Turquette <mturquette@linaro.org>
In-Reply-To: <556F7FFE.4050102@codeaurora.org>
Cc: "Mike Looijmans" <mike.looijmans@topic.nl>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <1433153623-29205-1-git-send-email-mike.looijmans@topic.nl>
 <1433309119-5186-1-git-send-email-mike.looijmans@topic.nl>
 <20150603222504.6017.28097@quantum> <556F7FFE.4050102@codeaurora.org>
Message-ID: <20150603224445.6017.77399@quantum>
Subject: Re: [PATCH v4] Add TI CDCE925 I2C controlled clock synthesizer driver
Date: Wed, 03 Jun 2015 15:44:45 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Stephen Boyd (2015-06-03 15:30:22)
> On 06/03/2015 03:25 PM, Michael Turquette wrote:
> > Quoting Mike Looijmans (2015-06-02 22:25:19)
> >> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> >> index 9897f35..1c31704 100644
> >> --- a/drivers/clk/Kconfig
> >> +++ b/drivers/clk/Kconfig
> >> @@ -78,6 +78,23 @@ config COMMON_CLK_SI570
> >>            This driver supports Silicon Labs 570/571/598/599 programma=
ble
> >>            clock generators.
> >>   =

> >> +config COMMON_CLK_CDCE925
> >> +       tristate "Clock driver for TI CDCE925 devices"
> >> +       depends on I2C
> >> +       depends on OF
> >> +       select REGMAP_I2C
> >> +       help
> >> +       ---help---
> =

> Why two helps?

Obviously to be extra helpful. In the spirit of such helpfulness I've
squashed the following diff into the patch:



diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 1dd4f9d..f2cfbe7 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -83,17 +83,10 @@ config COMMON_CLK_CDCE925
 	depends on I2C
 	depends on OF
 	select REGMAP_I2C
-	help
 	---help---
-	  This driver supports the TI CDCE925 programmable clock synthesizer.
-	  The chip contains two PLLs with spread-spectrum clocking support and
-	  five output dividers. The driver only supports the following setup,
-	  and uses a fixed setting for the output muxes.
-	  Y1 is derived from the input clock
-	  Y2 and Y3 derive from PLL1
-	  Y4 and Y5 derive from PLL2
-	  Given a target output frequency, the driver will set the PLL and
-	  divider to best approximate the desired output.
+	  This driver supports the TI CDCE925 programmable clock
+	  synthesizer.  The chip contains two PLLs with spread-spectrum
+	  clocking support and five output dividers.
 =

 config COMMON_CLK_S2MPS11
 	tristate "Clock driver for S2MPS1X/S5M8767 MFD"



Regards,
Mike
