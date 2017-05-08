Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Mon, 8 May 2017 11:24:43 -0500
From: Rob Herring <robh@kernel.org>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, Chen-Yu Tsai <wens@csie.org>,
	Daniel Vetter <daniel.vetter@intel.com>,
	David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
	Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH v2 17/20] dt-bindings: display: sun4i: Add
 allwinner,tcon-channel property
Message-ID: <20170508162443.faox4hm6jmfqccwt@rob-hp-laptop>
References: <cover.d697f34bb7b0605c5e76cbc4167a64453e5e0984.1493812478.git-series.maxime.ripard@free-electrons.com>
 <2f00be9d75b68090ffed30654be65132a156a317.1493812478.git-series.maxime.ripard@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <2f00be9d75b68090ffed30654be65132a156a317.1493812478.git-series.maxime.ripard@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

On Wed, May 03, 2017 at 01:59:54PM +0200, Maxime Ripard wrote:
> The Allwinner Timings Controller has two, mutually exclusive, channels.
> When the binding has been introduced, it was assumed that there would be
> only a single user per channel in the system.
> 
> While this is likely for the channel 0 which only connects to LCD displays,
> it turns out that the channel 1 can be connected to multiple controllers in
> the SoC (HDMI and TV encoders for example). And while the simultaneous use
> of HDMI and TV outputs cannot be achieved, switching from one to the other
> at runtime definitely sounds plausible.
> 
> Add an extra property, allwinner,tcon-channel, to specify for a given
> endpoint which TCON channel it is connected to, while falling back to the
> previous mechanism if that property is missing.
> 
> Acked-by: Chen-Yu Tsai <wens@csie.org>
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> ---
>  Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt | 11 ++++---
>  1 file changed, 7 insertions(+), 4 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
