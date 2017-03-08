Return-Path: <wens@csie.org>
MIME-Version: 1.0
In-Reply-To: <46fdec2d680d539652f87d79c627973b3a568438.1488876832.git-series.maxime.ripard@free-electrons.com>
References: <cover.bc06ffa88f847ddd9ddd7c259415d5f61b55307b.1488876832.git-series.maxime.ripard@free-electrons.com>
 <46fdec2d680d539652f87d79c627973b3a568438.1488876832.git-series.maxime.ripard@free-electrons.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 8 Mar 2017 11:38:48 +0800
Message-ID: <CAGb2v66o79wX9x4+ByNryoSOGrcixsbKKyDmfzeQcMAGLV_SBQ@mail.gmail.com>
Subject: Re: [PATCH 7/15] dt-bindings: display: sun4i: Add allwinner,tcon-channel
 property
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
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Acked-by: Chen-Yu Tsai <wens@csie.org>
