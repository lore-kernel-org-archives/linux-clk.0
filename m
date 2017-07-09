Return-Path: <net147@gmail.com>
MIME-Version: 1.0
In-Reply-To: <65066c74b8dedfeb8de27d90b5fecfea3a700178.1499197129.git-series.plaes@plaes.org>
References: <cover.23e9103a2becf2261d7e145bb1516221a5cfb8a4.1499197129.git-series.plaes@plaes.org>
 <65066c74b8dedfeb8de27d90b5fecfea3a700178.1499197129.git-series.plaes@plaes.org>
From: Jonathan Liu <net147@gmail.com>
Date: Sun, 9 Jul 2017 22:25:23 +1000
Message-ID: <CANwerB0d+2rU9gnCSKP4wwXZpzEsHXP6LtBYvxD+GnQAj6QHVQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/6] clk: sunxi-ng: Add sun4i/sun7i CCU driver
To: Priit Laes <plaes@plaes.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>,
	Russell King <linux@armlinux.org.uk>, Philipp Zabel <p.zabel@pengutronix.de>,
	linux-clk@vger.kernel.org, devicetree <devicetree@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

Hi Priit,

On 5 July 2017 at 06:04, Priit Laes <plaes@plaes.org> wrote:
> Introduce a clock controller driver for sun4i A10 and sun7i A20
> series SoCs.
>
> Signed-off-by: Priit Laes <plaes@plaes.org>
> ---
>  drivers/clk/sunxi-ng/Kconfig              |   14 +-
>  drivers/clk/sunxi-ng/Makefile             |    1 +-
>  drivers/clk/sunxi-ng/ccu-sun4i-a10.c      | 1448 ++++++++++++++++++++++-
>  drivers/clk/sunxi-ng/ccu-sun4i-a10.h      |   61 +-
>  include/dt-bindings/clock/sun4i-a10-ccu.h |  200 +++-
>  include/dt-bindings/clock/sun7i-a20-ccu.h |   53 +-
>  include/dt-bindings/reset/sun4i-a10-ccu.h |   67 +-
>  7 files changed, 1844 insertions(+)
>  create mode 100644 drivers/clk/sunxi-ng/ccu-sun4i-a10.c
>  create mode 100644 drivers/clk/sunxi-ng/ccu-sun4i-a10.h
>  create mode 100644 include/dt-bindings/clock/sun4i-a10-ccu.h
>  create mode 100644 include/dt-bindings/clock/sun7i-a20-ccu.h
>  create mode 100644 include/dt-bindings/reset/sun4i-a10-ccu.h
>
[snip]
> diff --git a/drivers/clk/sunxi-ng/ccu-sun4i-a10.c b/drivers/clk/sunxi-ng/ccu-sun4i-a10.c
> new file mode 100644
> index 0000000..49052b7
> --- /dev/null
> +++ b/drivers/clk/sunxi-ng/ccu-sun4i-a10.c
[snip]

> +static const char *const hdmi_parents[] = { "pll-video0", "pll-video0-2x",
> +                                           "pll-video1", "pll-video1-2x" };
> +static SUNXI_CCU_M_WITH_MUX_GATE(hdmi_clk, "hdmi", hdmi_parents,
> +                                0x150, 0, 4, 24, 2, BIT(31), 0);

hdmi_parents is in the wrong order. The correct order is "pll-video0",
"pll-video1", "pll-video0-2x", "pll-video1-2x".

Regards,
Jonathan
