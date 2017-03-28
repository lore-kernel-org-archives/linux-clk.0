Return-Path: <tony@atomide.com>
Date: Mon, 27 Mar 2017 17:18:00 -0700
From: Tony Lindgren <tony@atomide.com>
To: Tero Kristo <t-kristo@ti.com>
Cc: linux-clk@vger.kernel.org, linux-omap@vger.kernel.org,
	sboyd@codeaurora.org, mturquette@baylibre.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCHv2 9/9] ARM: dts: omap4: convert to use the new clkctrl
 clocks for the drivers
Message-ID: <20170328001800.GR10760@atomide.com>
References: <1489741781-12816-1-git-send-email-t-kristo@ti.com>
 <1489741781-12816-10-git-send-email-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1489741781-12816-10-git-send-email-t-kristo@ti.com>
List-ID: <linux-clk.vger.kernel.org>

* Tero Kristo <t-kristo@ti.com> [170317 02:12]:
> Convert the drivers to use the new clkctrl clocks.
> 
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> ---
>  arch/arm/boot/dts/omap4.dtsi | 164 ++++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 146 insertions(+), 18 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/omap4.dtsi b/arch/arm/boot/dts/omap4.dtsi
> index 3ecf616..c39304a 100644
> --- a/arch/arm/boot/dts/omap4.dtsi
> +++ b/arch/arm/boot/dts/omap4.dtsi
> @@ -94,16 +94,22 @@
>  			compatible = "ti,omap4-mpu";
>  			ti,hwmods = "mpu";
>  			sram = <&ocmcram>;
> +			clocks = <&mpuss_clkctrl OMAP4_MPU_CLKCTRL 0>;
> +			clock-names = "clkctrl";
>  		};

Oh one more thing. I don't think we should add the clocks
here as they are now wrongly allocated to the device within
the interconnect target module. These clocks really belong
to each interconnect target module that we don't have in the
dts yet.

So we're better off adding the clockctrl clocks and then
changing the dts to use the interconnect target modules
with the clockctrl clocks.

Regards,

Tony
