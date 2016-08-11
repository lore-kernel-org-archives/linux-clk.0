Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <1470915049-15249-1-git-send-email-broonie@kernel.org>
References: <1470915049-15249-1-git-send-email-broonie@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 11 Aug 2016 13:50:08 +0200
Message-ID: <CAMuHMdVhd6qk4g98xEXZYjf4qnwTT5=hKu-o8YRJXWNFQREueQ@mail.gmail.com>
Subject: Re: [PATCH] clk: Make clock framework user selectable
To: Mark Brown <broonie@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Thu, Aug 11, 2016 at 1:30 PM, Mark Brown <broonie@kernel.org> wrote:
> Some architectures like x86 don't use the clock API in architecture code
> but one of the advantages of the common clock API is that it can be used
> by regular devices to represent their clocking structures so we should
> allow users to enable the clock API themselves even if the architecture
> doesn't need it. This is more straightforward than going round every
> architecture and convincing their maintainers to add the select.
>
> Unfortunately some architectures do still provide a custom implementation
> of the clock API which is incompatible with common clock. Provide a config
> option HAS_CUSTOM_CLK which these architectures can select in order to
> prevent COMMON_CLK being enabled.

The list is not that long anymore, so it looks fixable with not too much
effort:

$ git grep '\*clk_get\>'
arch/avr32/mach-at32ap/clock.c:struct clk *clk_get(struct device *dev,
const char *id)
arch/m68k/coldfire/clk.c:struct clk *clk_get(struct device *dev, const char *id)
arch/mips/ar7/clock.c:struct clk *clk_get(struct device *dev, const char *id)
arch/mips/bcm63xx/clk.c:struct clk *clk_get(struct device *dev, const char *id)
arch/mips/loongson64/lemote-2f/clock.c:struct clk *clk_get(struct
device *dev, const char *id)
arch/mips/txx9/generic/setup.c:struct clk *clk_get(struct device *dev,
const char *id)
arch/unicore32/kernel/clock.c:struct clk *clk_get(struct device *dev,
const char *id)
drivers/clk/clkdev.c:struct clk *clk_get(struct device *dev, const char *con_id)

> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -7,7 +7,8 @@ config HAVE_CLK_PREPARE
>         bool
>
>  config COMMON_CLK
> -       bool
> +       bool "Common Clock Framework Support"
> +       depends on !HAVE_CUSTOM_CLK
>         select HAVE_CLK_PREPARE
>         select CLKDEV_LOOKUP
>         select SRCU
> @@ -19,6 +20,9 @@ config COMMON_CLK
>           Architectures utilizing the common struct clk should select
>           this option.
>
> +config HAVE_CUSTOM_CLK

HAVE_LEGACY_CLK, to give a better clue?

> +       bool
> +
>  menu "Common Clock Framework"
>         depends on COMMON_CLK

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
