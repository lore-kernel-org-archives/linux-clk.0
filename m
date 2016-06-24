Return-Path: <julian.calaby@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20160623192104.18720-12-megous@megous.com>
References: <20160623192104.18720-1-megous@megous.com> <20160623192104.18720-12-megous@megous.com>
From: Julian Calaby <julian.calaby@gmail.com>
Date: Fri, 24 Jun 2016 12:53:19 +1000
Message-ID: <CAGRGNgWU88xwRRA3Q9tnKc79zq1TfJw6iTB10c3TOmmdH=L3qA@mail.gmail.com>
Subject: Re: [linux-sunxi] [PATCH 11/14] ARM: sun8i: clk: Add clk-factor rate
 application method
To: megous@megous.com
Cc: Linux Sunxi <dev@linux-sunxi.org>,
	"Mailing List, Arm" <linux-arm-kernel@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>,
	Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>,
	=?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Ondrej,

On Fri, Jun 24, 2016 at 5:21 AM,  <megous@megous.com> wrote:
> From: Ondrej Jirman <megous@megous.com>
>
> PLL1 on H3 requires special factors application algorithm,
> when the rate is changed. This algorithm was extracted
> from the arisc code that handles frequency scaling
> in the BSP kernel.
>
> This commit adds optional apply function to
> struct factors_data, that can implement non-trivial
> factors application method, when necessary.
>
> Also struct clk_factors_config is extended with position
> of the PLL lock flag.
>
> Signed-off-by: Ondrej Jirman <megous@megous.com>
> ---
>  arch/arm/boot/dts/sun8i-h3.dtsi |  2 +-
>  drivers/clk/sunxi/clk-factors.c | 34 +++++++++----------
>  drivers/clk/sunxi/clk-factors.h | 12 +++++++
>  drivers/clk/sunxi/clk-sunxi.c   | 72 +++++++++++++++++++++++++++++++++++++++--
>  4 files changed, 98 insertions(+), 22 deletions(-)

Shouldn't the .dtsi changes be in a separate patch?

Thanks,

-- 
Julian Calaby

Email: julian.calaby@gmail.com
Profile: http://www.google.com/profiles/julian.calaby/
