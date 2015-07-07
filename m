Return-Path: <laurent.pinchart@ideasonboard.com>
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Ulrich Hecht <ulrich.hecht@gmail.com>, linux-sh@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH/RFC 06/11] ARM: shmobile: r8a7790: Link CPG to RST using "renesas,modemr"
Date: Tue, 07 Jul 2015 17:23:10 +0300
Message-ID: <3792169.nKlDE6xfl4@avalon>
In-Reply-To: <1436278217-20522-7-git-send-email-geert+renesas@glider.be>
References: <1436278217-20522-1-git-send-email-geert+renesas@glider.be> <1436278217-20522-7-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Hi Geert,

Thank you for the patches.

On Tuesday 07 July 2015 16:10:12 Geert Uytterhoeven wrote:
> Add a link from the Clock Pulse Generator node to the Reset Controller
> node, so the CPG can read the Mode Monitoring Register (MODEMR) to
> obtain the MD pin values.x
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  arch/arm/boot/dts/r8a7790.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/boot/dts/r8a7790.dtsi b/arch/arm/boot/dts/r8a7790.dtsi
> index 08067ae177643b8f..4ee5523fc3e13e12 100644
> --- a/arch/arm/boot/dts/r8a7790.dtsi
> +++ b/arch/arm/boot/dts/r8a7790.dtsi
> @@ -1115,6 +1115,7 @@
>  					     "lb", "qspi", "sdh", "sd0", "sd1",
>  					     "z", "rcan", "adsp";
>  			#power-domain-cells = <0>;
> +			renesas,modemr = <&rst 0x60>;

I have mixed feelings about this as I don't think it really describes the 
hardware.

Wouldn't it make sense to instead add a standard kernel API to retrieve the 
boot mode value ? It seems to be a pretty common feature of SoCs across all 
vendors.

>  		};
> 
>  		/* Variable factor clocks */

-- 
Regards,

Laurent Pinchart
