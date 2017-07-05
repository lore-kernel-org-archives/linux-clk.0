Return-Path: <wens@csie.org>
MIME-Version: 1.0
In-Reply-To: <805048a548031cafc890e6ea06ee773bdfb199d0.1499197129.git-series.plaes@plaes.org>
References: <cover.23e9103a2becf2261d7e145bb1516221a5cfb8a4.1499197129.git-series.plaes@plaes.org>
 <805048a548031cafc890e6ea06ee773bdfb199d0.1499197129.git-series.plaes@plaes.org>
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 5 Jul 2017 12:06:47 +0800
Message-ID: <CAGb2v677TzO7fWF6YU4o5J4_EJ8cWLWHFzkW4ZU9FCptGjgJ=Q@mail.gmail.com>
Subject: Re: [PATCH v5 1/6] clk: sunxi-ng: div: Add support for fixed post-divider
To: Priit Laes <plaes@plaes.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>,
	Russell King <linux@armlinux.org.uk>, Philipp Zabel <p.zabel@pengutronix.de>,
	linux-clk <linux-clk@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>,
	Jonathan Liu <net147@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Wed, Jul 5, 2017 at 4:04 AM, Priit Laes <plaes@plaes.org> wrote:
> SATA clock on sun4i/sun7i is of type (parent) / M / 6 where
> 6 is fixed post-divider.
>
> Signed-off-by: Priit Laes <plaes@plaes.org>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
