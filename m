Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Wed, 7 Jun 2017 17:37:17 -0500
From: Rob Herring <robh@kernel.org>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>,
	David Airlie <airlied@linux.ie>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH 06/19] dt-bindings: display: sun4i: Add binding for A31
 HDMI controller
Message-ID: <20170607223717.uoh45hhcqugakdk6@rob-hp-laptop>
References: <20170602101024.18940-1-wens@csie.org>
 <20170602101024.18940-7-wens@csie.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170602101024.18940-7-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>

On Fri, Jun 02, 2017 at 06:10:11PM +0800, Chen-Yu Tsai wrote:
> The HDMI controller in the A31 SoC is slightly different from the
> earlier version. In addition to the TMDS clock and DDC controls,
> this version now takes a second DDC clock input.
> 
> Add a compatible string for it, and add the DDC clock input to the
> list of clocks required.
> 
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt | 3 +++
>  1 file changed, 3 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
