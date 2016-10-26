Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <5038285.9DcXKlHSpF@wasted.cogentembedded.com>
References: <1582226.1VeLLfmmeJ@wasted.cogentembedded.com> <5038285.9DcXKlHSpF@wasted.cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 26 Oct 2016 14:14:25 +0200
Message-ID: <CAMuHMdV9O97qWskZ=EWz-kSy_rV_U5rfrsRDWRHUB2WiFXAq7w@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] clk: renesas: cpg-mssr: add R8A7743 support
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk <linux-clk@vger.kernel.org>,
	Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	Simon Horman <horms+renesas@verge.net.au>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Fri, Oct 21, 2016 at 10:17 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> --- /dev/null
> +++ linux/drivers/clk/renesas/r8a7743-cpg-mssr.c
> @@ -0,0 +1,264 @@

> +static int __init r8a7743_cpg_mssr_init(struct device *dev)
> +{
> +       const struct rcar_gen2_cpg_pll_config *cpg_pll_config;
> +       u32 cpg_mode = rcar_gen2_read_modemr();

It would be good if we could appply "[PATCH v4 00/23] soc: renesas: Add R-Car
RST driver for obtaining mode pin state" first, and change this driveer to
use rcar_rst_read_mode_pins() instead.

> +       cpg_pll_config = &cpg_pll_configs[CPG_PLL_CONFIG_INDEX(cpg_mode)];
> +
> +       return rcar_gen2_cpg_init(cpg_pll_config);
> +}

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
