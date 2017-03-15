Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Wed, 15 Mar 2017 12:26:22 -0500
From: Rob Herring <robh@kernel.org>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, Chen-Yu Tsai <wens@csie.org>,
	dri-devel@lists.freedesktop.org,
	Daniel Vetter <daniel.vetter@intel.com>,
	David Airlie <airlied@linux.ie>,
	Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH 6/15] dt-bindings: display: sun4i: Add HDMI display
 bindings
Message-ID: <20170315172622.lb6vy7cmbwaf7crn@rob-hp-laptop>
References: <cover.bc06ffa88f847ddd9ddd7c259415d5f61b55307b.1488876832.git-series.maxime.ripard@free-electrons.com>
 <f1d46b79f933df724a6750d557ebe9517b6339b5.1488876832.git-series.maxime.ripard@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <f1d46b79f933df724a6750d557ebe9517b6339b5.1488876832.git-series.maxime.ripard@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

On Tue, Mar 07, 2017 at 09:56:25AM +0100, Maxime Ripard wrote:
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
> +
> +  - ports: A ports node with endpoint definitions as defined in
> +    Documentation/devicetree/bindings/media/video-interfaces.txt. The
> +    first port should be the input endpoint.

You need an output port to an HDMI connector node and an audio port.

> +
>  TV Encoder
>  ----------
>  
> -- 
> git-series 0.8.11
