Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Wed, 15 Mar 2017 12:37:53 -0500
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
Subject: Re: [PATCH 7/15] dt-bindings: display: sun4i: Add
 allwinner,tcon-channel property
Message-ID: <20170315173753.6zywfxapdczu2i34@rob-hp-laptop>
References: <cover.bc06ffa88f847ddd9ddd7c259415d5f61b55307b.1488876832.git-series.maxime.ripard@free-electrons.com>
 <46fdec2d680d539652f87d79c627973b3a568438.1488876832.git-series.maxime.ripard@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <46fdec2d680d539652f87d79c627973b3a568438.1488876832.git-series.maxime.ripard@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

On Tue, Mar 07, 2017 at 09:56:26AM +0100, Maxime Ripard wrote:
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

I think perhaps TCON channels should have been ports rather than 
endpoints. The fact that the channels are mutually exclusive can be 
handled in the driver and doesn't really matter in the binding. How 
painful would it be to rework things to move TCON channel 1 from port 0, 
endpoint 1 to port 1? 

Rob
