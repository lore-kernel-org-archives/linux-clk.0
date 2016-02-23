Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <1456189051-519-1-git-send-email-horms+renesas@verge.net.au>
References: <1456189051-519-1-git-send-email-horms+renesas@verge.net.au>
Date: Tue, 23 Feb 2016 09:19:27 +0100
Message-ID: <CAMuHMdVDneo95F3JyFuvGZ_Bk4dL=ve41XONHj4b8DC4X7NMcQ@mail.gmail.com>
Subject: Re: [PATCH] clk: shmobile: Remove ARCH_SHMOBILE_MULTI
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>,
	linux-clk <linux-clk@vger.kernel.org>, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

CC The New Mike ;-)

On Tue, Feb 23, 2016 at 1:57 AM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> As of 9b5ba0df4ea4 ("ARM: shmobile: Introduce ARCH_RENESAS") all platforms
> that use Renesas clock drivers now select ARCH_RENESAS. As it is present in
> drivers/clk/Makefile ARCH_SHMOBILE_MULTI may now be removed.
>
> This is part of an ongoing process to migrate from ARCH_SHMOBILE to
> ARCH_RENESAS the motivation for which being that RENESAS seems to be a more
> appropriate name than SHMOBILE for the majority of Renesas ARM based SoCs.
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

> ---
>  drivers/clk/Makefile | 1 -
>  1 file changed, 1 deletion(-)
>
>  Based on clk-next
>
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index bae4be6501df..b19af449d2f3 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -70,7 +70,6 @@ obj-$(CONFIG_COMMON_CLK_PXA)          += pxa/
>  obj-$(CONFIG_COMMON_CLK_QCOM)          += qcom/
>  obj-$(CONFIG_ARCH_ROCKCHIP)            += rockchip/
>  obj-$(CONFIG_COMMON_CLK_SAMSUNG)       += samsung/
> -obj-$(CONFIG_ARCH_SHMOBILE_MULTI)      += shmobile/

Should we rename clk/shmobile/ to clk/renesas/?
Or is that too much of a hassle?

>  obj-$(CONFIG_ARCH_RENESAS)             += shmobile/
>  obj-$(CONFIG_ARCH_SIRF)                        += sirf/
>  obj-$(CONFIG_ARCH_SOCFPGA)             += socfpga/

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
