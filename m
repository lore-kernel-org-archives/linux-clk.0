Return-Path: <sboyd@codeaurora.org>
Date: Wed, 15 Jun 2016 17:27:27 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Sascha Hauer <s.hauer@pengutronix.de>, jeremy.kerr@canonical.com,
	linux-clk@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/3] Convert clk-fixed into module platform driver
Message-ID: <20160616002727.GP28218@codeaurora.org>
References: <1465381201-11537-1-git-send-email-ricardo.ribalda@gmail.com>
 <20160614173910.GB28218@codeaurora.org>
 <CAPybu_1qTTn8tkdvJ8r1ehi4-ooJdPkmYJVvQdg71vsOJwoFUQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CAPybu_1qTTn8tkdvJ8r1ehi4-ooJdPkmYJVvQdg71vsOJwoFUQ@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 06/15, Ricardo Ribalda Delgado wrote:
> Hi Stephen
> 
> Assume this device tree overlay:
> 
> 
> &bus0{
> 
> axi_clk: axi_clk {
> compatible = "fixed-clock";
> #clock-cells = <0x0>;
> clock-frequency = <125000000>;
> };
> 
> iic_0: iic {
> #address-cells = <1>;
> #size-cells = <1>;
> compatible = "xlnx,xps-iic-2.00.a";
> reg = < 0x00030000 0x10000 >;
> interrupt-parent = <&xps_intc_0>;
> interrupts = < 2 2 >;
> clocks = <&axi_clk>;
>  } ;
> 
> }
> 
> Which is basically a new i2c master and a fixed clock definition.
> 
> The fixed clock driver will only be probed to the driver at arch
> initialization, when of_clk_init is called.  The device overlay can be
> added at any point, usually after arch init. Which will result in ii_0
> failing to probe,  because it is missing its clock.
> 
> This changeset allows fixed clocks to be added after of_clk_init is
> called, by converting the driver into a platform driver.
> 

Ok, so this is about supporting clks in overlays. I2C only comes
into the picture here because it's a consumer and happens to also
be on the same overlay.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
