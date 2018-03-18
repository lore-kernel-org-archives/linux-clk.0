Return-Path: <sergei.shtylyov@cogentembedded.com>
Return-Path: <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH net-next 03/12] dt-bindings: net: dwmac-sun8i: Clean up
 clock delay chain descriptions
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@bootlin.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 Corentin Labbe <clabbe.montjoie@gmail.com>, Icenowy Zheng <icenowy@aosc.io>
References: <20180317092857.4396-1-wens@csie.org>
 <20180317092857.4396-4-wens@csie.org>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <eb47a027-c678-7496-ef58-fc8e96be7dd9@cogentembedded.com>
Date: Sun, 18 Mar 2018 12:21:44 +0300
MIME-Version: 1.0
In-Reply-To: <20180317092857.4396-4-wens@csie.org>
Content-Type: text/plain; charset=utf-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>

Hello!

On 3/17/2018 12:28 PM, Chen-Yu Tsai wrote:

> The clock delay chains found in the glue layer for dwmac-sun8i are only
> used with RGMII PHYs. They are not intended for non-RGMII PHYs, such as
> MII external PHYs or the internal PHY. Also, a recent SoC has a smaller
> range of possible values for the delay chain.
> 
> This patch reformats the delay chain section of the device tree binding
> to make it clear that the delay chains only apply to RGMII PHYs, and
> make it easier to add the R40-specific bits later.
> 
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>   Documentation/devicetree/bindings/net/dwmac-sun8i.txt | 11 +++++++----
>   1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/dwmac-sun8i.txt b/Documentation/devicetree/bindings/net/dwmac-sun8i.txt
> index 3d6d5fa0c4d5..b8a3028d6c30 100644
> --- a/Documentation/devicetree/bindings/net/dwmac-sun8i.txt
> +++ b/Documentation/devicetree/bindings/net/dwmac-sun8i.txt
> @@ -28,10 +28,13 @@ Required properties:
>     - allwinner,sun8i-a83t-system-controller
>   
>   Optional properties:
> -- allwinner,tx-delay-ps: TX clock delay chain value in ps. Range value is 0-700. Default is 0)
> -- allwinner,rx-delay-ps: RX clock delay chain value in ps. Range value is 0-3100. Default is 0)
> -Both delay properties need to be a multiple of 100. They control the delay for
> -external PHY.
> +- allwinner,tx-delay-ps: TX clock delay chain value in ps.
> +			 Range is 0-700. Default is 0.
> +- allwinner,rx-delay-ps: RX clock delay chain value in ps.
> +			 Range is 0-3100. Default is 0.
> +Both delay properties need to be a multiple of 100. They control the
> +clock delay for external RGMII PHY. They are do apply to the internal

   s/are do/do not/?

> +PHY or external non-RGMII PHYs.
>   
>   Optional properties for the following compatibles:
>     - "allwinner,sun8i-h3-emac",

MBR, Sergei
