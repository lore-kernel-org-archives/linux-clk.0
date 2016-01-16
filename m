Return-Path: <plaes@plaes.org>
Message-ID: <1452953281.12419.2.camel@plaes.org>
Subject: Re: [linux-sunxi] [PATCH v2 05/26] clk: sunxi: Add display and
 TCON0 clocks driver
From: Priit Laes <plaes@plaes.org>
To: maxime.ripard@free-electrons.com, Mike Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@codeaurora.org>, David
 Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>, Chen-Yu Tsai <wens@csie.org>,
 Hans de Goede <hdegoede@redhat.com>, Alexander Kaplan <alex@nextthing.co>,
 Boris Brezillon <boris.brezillon@free-electrons.com>, Wynter Woods
 <wynter@nextthing.co>,  Thomas Petazzoni
 <thomas.petazzoni@free-electrons.com>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Date: Sat, 16 Jan 2016 16:08:01 +0200
In-Reply-To: <1452785109-6172-6-git-send-email-maxime.ripard@free-electrons.com>
References: 
	<1452785109-6172-1-git-send-email-maxime.ripard@free-electrons.com>
	 <1452785109-6172-6-git-send-email-maxime.ripard@free-electrons.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

On Thu, 2016-01-14 at 16:24 +0100, Maxime Ripard wrote:
> The A10 SoCs and its relatives has a special clock controller to drive the
> display engines (both frontend and backend), that have a lot in common with
> the clock to drive the first TCON channel.
> 
> Add a driver to support both.

...

> +static void __init sun4i_a10_display_init(struct device_node *node,
> +					  struct sun4i_a10_display_clk_data *data)
> +{
> +	const char *parents[data->parents];
> +	const char *clk_name = node->name;
> +	struct reset_data *reset_data;
> +	struct clk_divider *div = NULL;
> +	struct clk_gate *gate;
> +	struct clk_mux *mux;
> +	void __iomem *reg;
> +	struct clk *clk;
> +	int i;

warning: unused variable 'i'

> +
> +	of_property_read_string(node, "clock-output-names", &clk_name);
> +
> +	reg = of_io_request_and_map(node, 0, of_node_full_name(node));
> +	if (IS_ERR(reg)) {
> +		pr_err("%s: Could not map the clock registers\n", clk_name);
> +		return;
> +	}

...

Thanks for working on this feature ;)

Päikest,
Priit Laes
