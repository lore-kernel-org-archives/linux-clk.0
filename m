Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <87d1cjyeb4.wl%kuninori.morimoto.gx@renesas.com>
References: <87fuhfyedq.wl%kuninori.morimoto.gx@renesas.com> <87d1cjyeb4.wl%kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Apr 2017 10:35:24 +0200
Message-ID: <CAMuHMdU=8yRF9GggrM7wiFhZckAH-caso=6nL1sELXpykqLp6g@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: cs2000: add AUX_OUT pin select support
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Morimoto-san,

On Tue, Apr 11, 2017 at 2:36 AM, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Tested-by: Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>
> ---
>  .../devicetree/bindings/clock/cs2000-cp.txt        |  9 +++
>  drivers/clk/clk-cs2000-cp.c                        | 73 +++++++++++++++++++++-
>  2 files changed, 80 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/clock/cs2000-cp.txt b/Documentation/devicetree/bindings/clock/cs2000-cp.txt
> index 54e6df0..4c2f9cb 100644
> --- a/Documentation/devicetree/bindings/clock/cs2000-cp.txt
> +++ b/Documentation/devicetree/bindings/clock/cs2000-cp.txt
> @@ -8,6 +8,15 @@ Required properties:
>  - clock-names:         CLK_IN : clk_in, XTI/REF_CLK : ref_clk
>  - #clock-cells:                must be <0>
>
> +Option properties:
> +
> +- auxoutsrc:           select AUX_OUT source from these.
> +                               refclk:         Timing Reference Clock
> +                               clk_in:         Frequency Reference Clock
> +                               pllclkout:      PLL Clock Output
> +                               push-pull:      PLL Lock/Unlock Indication
> +                               open-drain:     PLL Lock/Unlock Indication

AUX_OUT is an output pin?
Hence, isn't this software configuration instead of hardware description?

Selection of refclk vs. clk_in vs. pllclkout can be implemented as a mux clock
driver with three parents.

PLL Lock/Unlock Indication and its pinctrl are something different.
How to support that?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
