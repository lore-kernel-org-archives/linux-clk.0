Return-Path: <wens@csie.org>
MIME-Version: 1.0
In-Reply-To: <f1d46b79f933df724a6750d557ebe9517b6339b5.1488876832.git-series.maxime.ripard@free-electrons.com>
References: <cover.bc06ffa88f847ddd9ddd7c259415d5f61b55307b.1488876832.git-series.maxime.ripard@free-electrons.com>
 <f1d46b79f933df724a6750d557ebe9517b6339b5.1488876832.git-series.maxime.ripard@free-electrons.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 3 May 2017 11:27:20 +0800
Message-ID: <CAGb2v67vJriXzPj8nVH=F9XPXgD-+LwDvqp6dDRxyPT8UyG64A@mail.gmail.com>
Subject: Re: [PATCH 6/15] dt-bindings: display: sun4i: Add HDMI display bindings
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	Chen-Yu Tsai <wens@csie.org>, dri-devel <dri-devel@lists.freedesktop.org>,
	Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
	Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
	devicetree <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Tue, Mar 7, 2017 at 4:56 PM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> One of the possible output of the display pipeline, on the SoCs that have
> it, is the HDMI controller.
>
> Add a binding for it.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> ---
>  Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt | 21 +++++++-
>  1 file changed, 21 insertions(+), 0 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
> index b82c00449468..4b280672658e 100644
> --- a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
> +++ b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
> @@ -4,6 +4,27 @@ Allwinner A10 Display Pipeline
>  The Allwinner A10 Display pipeline is composed of several components
>  that are going to be documented below:
>
> +HDMI Encoder
> +------------
> +
> +The HDMI Encoder supports the HDMI video and audio outputs, and does
> +CEC. It is one end of the pipeline.
> +
> +Required properties:
> +  - compatible: value must be one of:
> +    * allwinner,sun5i-a10s-hdmi
> +  - reg: base address and size of memory-mapped region
> +  - clocks: phandles to the clocks feeding the HDMI encoder
> +    * ahb: the HDMI interface clock
> +    * mod: the HDMI module clock
> +    * pll-0: the first video PLL
> +    * pll-1: the second video PLL
> +  - clock-names: the clock names mentioned above

The audio part needs a DMA handle. May we add this from day one?

Thanks
ChenYu

> +
> +  - ports: A ports node with endpoint definitions as defined in
> +    Documentation/devicetree/bindings/media/video-interfaces.txt. The
> +    first port should be the input endpoint.
> +
>  TV Encoder
>  ----------
>
> --
> git-series 0.8.11
