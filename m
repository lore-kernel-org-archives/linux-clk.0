Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <20161021154737.3803065-1-arnd@arndb.de>
References: <20161021154737.3803065-1-arnd@arndb.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 21 Oct 2016 20:01:49 +0200
Message-ID: <CAMuHMdU6nVn=P0B5Xeqh5T-Mn8YEK_4oH1kvAPcpQzkviX669w@mail.gmail.com>
Subject: Re: [PATCH] clk: fix link error for rcar-gen2
To: Arnd Bergmann <arnd@arndb.de>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Magnus Damm <damm+renesas@opensource.se>, Simon Horman <horms+renesas@verge.net.au>,
	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Arnd,

On Fri, Oct 21, 2016 at 5:47 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> The addition of one more rcar-gen2 based SoC caused a build error (again)
> in my randconfig builds:
>
> arch/arm/mach-shmobile/setup-rcar-gen2.o: In function `rcar_gen2_timer_init':
> setup-rcar-gen2.c:(.init.text+0x200): undefined reference to `rcar_gen2_clocks_init'
>
> I think this has happened twice in the past. Instead of adding each SoC
> one at a time, this changes the existing list to always build the
> rcar-gen2 related clk files whenever the generic symbol is selected.

The problem is that the R-Car Gen2 platform code calls into the R-Car Gen2
clock driver[*]. RZ/G1M (r8a7743) uses the R-Car Gen2 core, but not the
R-Car Gen2 clock driver.
Instead it will use the modern CPG/MSSR driver, like R-Car Gen3 does.

[*] That will be fixed by "[PATCH v4 00/23] soc: renesas: Add R-Car RST
    driver for obtaining mode pin state".

> Fixes: 1254f607fc3d ("ARM: shmobile: r8a7743: basic SoC support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/clk/renesas/Makefile | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/drivers/clk/renesas/Makefile b/drivers/clk/renesas/Makefile
> index 90dd0db7d9c6..762d122eddec 100644
> --- a/drivers/clk/renesas/Makefile
> +++ b/drivers/clk/renesas/Makefile
> @@ -4,11 +4,7 @@ obj-$(CONFIG_ARCH_R8A73A4)             += clk-r8a73a4.o clk-div6.o
>  obj-$(CONFIG_ARCH_R8A7740)             += clk-r8a7740.o clk-div6.o
>  obj-$(CONFIG_ARCH_R8A7778)             += clk-r8a7778.o
>  obj-$(CONFIG_ARCH_R8A7779)             += clk-r8a7779.o
> -obj-$(CONFIG_ARCH_R8A7790)             += clk-rcar-gen2.o clk-div6.o
> -obj-$(CONFIG_ARCH_R8A7791)             += clk-rcar-gen2.o clk-div6.o
> -obj-$(CONFIG_ARCH_R8A7792)             += clk-rcar-gen2.o clk-div6.o
> -obj-$(CONFIG_ARCH_R8A7793)             += clk-rcar-gen2.o clk-div6.o
> -obj-$(CONFIG_ARCH_R8A7794)             += clk-rcar-gen2.o clk-div6.o
> +obj-$(CONFIG_ARCH_RCAR_GEN2)           += clk-rcar-gen2.o clk-div6.o
>  obj-$(CONFIG_ARCH_R8A7795)             += r8a7795-cpg-mssr.o rcar-gen3-cpg.o
>  obj-$(CONFIG_ARCH_R8A7796)             += r8a7796-cpg-mssr.o rcar-gen3-cpg.o
>  obj-$(CONFIG_ARCH_SH73A0)              += clk-sh73a0.o clk-div6.o

Please don't fix it this way, as it will make it _harder_ to convert the R-Car
Gen2 SoCs to the modern CPG/MSSR driver later.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
