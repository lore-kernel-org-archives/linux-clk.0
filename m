Return-Path: <horms@verge.net.au>
Date: Thu, 12 Jul 2018 16:35:31 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Takeshi Kihara <takeshi.kihara.df@renesas.com>,
	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 00/11] clk: renesas: rcar-gen3: OSC and RCLK improvements
Message-ID: <20180712143530.gi2oez5jypsqbhyx@verge.net.au>
References: <20180711142100.3765-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20180711142100.3765-1-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

On Wed, Jul 11, 2018 at 04:20:49PM +0200, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> This patch series contains various improvements for OSC and RCLK
> handling on R-Car Gen3 SoCs.
> 
> This has been tested on R-Car H3 ES1.0/ES2.0, R-Car M3-W ES1.0, R-Car
> D3, and R-Car E3.
> The R-Car V3H (r8a77980) patches were compile-tested only due to lack of
> hardware.
> 
> Thanks for your comments!

I made a few minor comments but nothing else stood out.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>


> 
> Geert Uytterhoeven (11):
>   clk: renesas: rcar-gen3: Add support for OSC EXTAL predivider
>   clk: renesas: r8a7795: Add OSC EXTAL predivider configuration
>   clk: renesas: r8a7796: Add OSC EXTAL predivider configuration
>   clk: renesas: r8a77965: Add OSC EXTAL predivider configuration
>   clk: renesas: r8a77980: Add OSC predivider configuration and clock
>   clk: renesas: cpg-mssr: Add support for fixed rate clocks
>   clk: renesas: rcar-gen3: Add support for RCKSEL clock selection
>   clk: renesas: r8a77990: Correct RCLK handling
>   clk: renesas: r8a77995: Correct RCLK handling
>   clk: renesas: rcar-gen3: Add support for mode pin clock selection
>   clk: renesas: r8a77980: Add RCLK for watchdog timer
> 
>  drivers/clk/renesas/r8a7795-cpg-mssr.c  | 66 ++++++++++++-------------
>  drivers/clk/renesas/r8a7796-cpg-mssr.c  | 66 ++++++++++++-------------
>  drivers/clk/renesas/r8a77965-cpg-mssr.c | 66 ++++++++++++-------------
>  drivers/clk/renesas/r8a77980-cpg-mssr.c | 28 ++++++-----
>  drivers/clk/renesas/r8a77990-cpg-mssr.c |  9 +++-
>  drivers/clk/renesas/r8a77995-cpg-mssr.c |  9 +++-
>  drivers/clk/renesas/rcar-gen3-cpg.c     | 40 +++++++++++----
>  drivers/clk/renesas/rcar-gen3-cpg.h     | 25 ++++++++--
>  drivers/clk/renesas/renesas-cpg-mssr.c  |  5 ++
>  drivers/clk/renesas/renesas-cpg-mssr.h  |  3 ++
>  10 files changed, 189 insertions(+), 128 deletions(-)
> 
> -- 
> 2.17.1
> 
> Gr{oetje,eeting}s,
> 
> 						Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
> 							    -- Linus Torvalds
> 
