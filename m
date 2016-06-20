Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <20160620154341.2242033-1-arnd@arndb.de>
References: <20160620154341.2242033-1-arnd@arndb.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 20 Jun 2016 22:27:34 +0200
Message-ID: <CAMuHMdXJjm0WFLggbH7t84NSfpbLyGeqTsH+ZUgBPin0W3njEw@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: build clk-rcar-gen2.o for R8A7792
To: Arnd Bergmann <arnd@arndb.de>
Cc: Simon Horman <horms+renesas@verge.net.au>, Magnus Damm <damm+renesas@opensource.se>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-clk <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Arnd,

On Mon, Jun 20, 2016 at 5:43 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> The newly added support for R8A7792 causes build failures
> because we try to call rcar_gen2_clocks_init but that is not
> built into the kernel:
>
> arch/arm/mach-shmobile/built-in.o: In function `rcar_gen2_timer_init':
> :(.init.text+0x3b0): undefined reference to `rcar_gen2_clocks_init'
>
> This changes the clk Makefile to match the other platforms, though
> I guess it would be better to find another way to do this, e.g.
> by not requiring the external function call by relying on
> CLK_OF_DECLARE(), or by making the ARCH_RCAR_GEN2 also control
> the compilation of the clk driver.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Fixes: 3ebee0adbfe7 ("ARM: shmobile: r8a7792: basic SoC support")
> ---
>  drivers/clk/renesas/Makefile | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/clk/renesas/Makefile b/drivers/clk/renesas/Makefile
> index ead8bb843524..3cdb9aaf8717 100644
> --- a/drivers/clk/renesas/Makefile
> +++ b/drivers/clk/renesas/Makefile
> @@ -6,6 +6,7 @@ obj-$(CONFIG_ARCH_R8A7778)              += clk-r8a7778.o
>  obj-$(CONFIG_ARCH_R8A7779)             += clk-r8a7779.o
>  obj-$(CONFIG_ARCH_R8A7790)             += clk-rcar-gen2.o clk-div6.o
>  obj-$(CONFIG_ARCH_R8A7791)             += clk-rcar-gen2.o clk-div6.o
> +obj-$(CONFIG_ARCH_R8A7792)             += clk-rcar-gen2.o
>  obj-$(CONFIG_ARCH_R8A7793)             += clk-rcar-gen2.o clk-div6.o
>  obj-$(CONFIG_ARCH_R8A7794)             += clk-rcar-gen2.o clk-div6.o
>  obj-$(CONFIG_ARCH_R8A7795)             += r8a7795-cpg-mssr.o

There's already a similar patch in my clk-renesas-for-v4.8 branch.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
