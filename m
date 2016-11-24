Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <20161124162448.3761610-1-arnd@arndb.de>
References: <20161124162448.3761610-1-arnd@arndb.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 24 Nov 2016 17:38:45 +0100
Message-ID: <CAMuHMdUY2S4gXANwGj3fYwtADQyQH-ZFT6EUQrViSYYq-LQ+xw@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: cpg_mstp: build for R8A774{3,5}
To: Arnd Bergmann <arnd@arndb.de>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Arnd,

On Thu, Nov 24, 2016 at 5:24 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> We get a link failure on R8A7745 and R8A7743 when the other platforms
> are disabled and nothing selects the clk-rcar-gen2 driver:
>
> drivers/clk/renesas/clk-rcar-gen2.o: In function `rcar_gen2_cpg_clocks_init':
> clk-rcar-gen2.c:(.init.text+0x39c): undefined reference to `cpg_mstp_add_clk_domain'

clk-rcar-gen2  is not used on R8A7745 and R8A7743?

> This adds another 'select' statement to get them to build as well.
>
> Fixes: 9127d54bb894 ("clk: renesas: cpg-mssr: Add R8A7745 support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/clk/renesas/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
> index 2586dfa0026b..4ebd9d3d24b7 100644
> --- a/drivers/clk/renesas/Kconfig
> +++ b/drivers/clk/renesas/Kconfig
> @@ -10,6 +10,8 @@ config CLK_RENESAS_CPG_MSTP
>         default y if ARCH_R7S72100
>         default y if ARCH_R8A73A4
>         default y if ARCH_R8A7740
> +       default y if ARCH_R8A7743
> +       default y if ARCH_R8A7745

R8A7745 and R8A7743 don't need the CPG_MSTP driver, they select
CLK_RENESAS_CPG_MSSR instead.

Perhaps you still have your patch "[PATCH] clk: fix link error for rcar-gen2"
applied to enable clk-rcar-gen2.o on R8A7745?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
