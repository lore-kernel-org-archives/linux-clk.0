Return-Path: <robh@kernel.org>
Date: Tue, 2 Feb 2016 15:52:14 -0600
From: Rob Herring <robh@kernel.org>
To: Jean-Francois Moine <moinejf@free.fr>
Cc: Dave Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>,
	Emilio Lopez <emilio@elopez.com.ar>,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v4 1/2] clk: sunxi: Add sun6i/8i video support
Message-ID: <20160202215214.GA6738@rob-hp-laptop>
References: <cover.1454435944.git.moinejf@free.fr>
 <3c0e2cdea659e9e682f80ecf42b252c740095f15.1454435944.git.moinejf@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3c0e2cdea659e9e682f80ecf42b252c740095f15.1454435944.git.moinejf@free.fr>
List-ID: <linux-clk.vger.kernel.org>

On Tue, Feb 02, 2016 at 06:35:10PM +0100, Jean-Francois Moine wrote:
> Add the clock types which are used by the sun6i/8i families for video.
> 
> Signed-off-by: Jean-Francois Moine <moinejf@free.fr>
> ---
> v4:
> 	- drivers/clk/sunxi/Makefile was missing (Emil Velikov)
> v3: (no change)
> v2:
> 	- remarks from Chen-Yu Tsai
> 	- DT documentation added
> ---
>  Documentation/devicetree/bindings/clock/sunxi.txt |   2 +

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/clk/sunxi/Makefile                        |   2 +
>  drivers/clk/sunxi/clk-sun6i-display.c             | 106 +++++++++++++
>  drivers/clk/sunxi/clk-sun6i-pll3.c                | 174 ++++++++++++++++++++++
>  4 files changed, 284 insertions(+)
>  create mode 100644 drivers/clk/sunxi/clk-sun6i-display.c
>  create mode 100644 drivers/clk/sunxi/clk-sun6i-pll3.c
