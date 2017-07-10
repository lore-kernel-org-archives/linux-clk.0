Return-Path: <oliver@schinagl.nl>
Subject: Re: [linux-sunxi] [PATCH v5 6/6] ARM: sun4i: Convert to CCU
To: plaes@plaes.org, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Chen-Yu Tsai <wens@csie.org>, Russell King <linux@armlinux.org.uk>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.23e9103a2becf2261d7e145bb1516221a5cfb8a4.1499197129.git-series.plaes@plaes.org>
 <796d0ecb0fe0204891387910b8222bfa43a93326.1499197129.git-series.plaes@plaes.org>
Cc: linux-sunxi@googlegroups.com, Jonathan Liu <net147@gmail.com>
From: Olliver Schinagl <oliver@schinagl.nl>
Message-ID: <c52b7297-76c6-1f87-e87d-149a3f469bef@schinagl.nl>
Date: Mon, 10 Jul 2017 13:44:18 +0200
MIME-Version: 1.0
In-Reply-To: <796d0ecb0fe0204891387910b8222bfa43a93326.1499197129.git-series.plaes@plaes.org>
Content-Type: text/plain; charset=utf-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>

Hi Pritt,

On 04-07-17 22:05, Priit Laes wrote:
> Convert sun4i-a10.dtsi to new CCU driver.
>
> Tested on Gemei G9 tablet.
>
> Signed-off-by: Priit Laes <plaes@plaes.org>
> ---
>  arch/arm/boot/dts/sun4i-a10.dtsi | 646 +++-----------------------------
>  1 file changed, 73 insertions(+), 573 deletions(-)
>
> diff --git a/arch/arm/boot/dts/sun4i-a10.dtsi b/arch/arm/boot/dts/sun4i-a10.dtsi
> index 41c2579..fc23c41 100644
> --- a/arch/arm/boot/dts/sun4i-a10.dtsi
> +++ b/arch/arm/boot/dts/sun4i-a10.dtsi
> @@ -45,7 +45,6 @@
>
>  #include <dt-bindings/thermal/thermal.h>
>
> -#include <dt-bindings/clock/sun4i-a10-pll2.h>
>  #include <dt-bindings/dma/sun4i-a10.h>

I think the same includes are missing here as well?

Olliver
