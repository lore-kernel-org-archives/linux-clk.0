Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <1490348353-10989-1-git-send-email-geert+renesas@glider.be>
References: <1490348353-10989-1-git-send-email-geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 31 Mar 2017 11:19:46 +0200
Message-ID: <CAMuHMdUFJ40ojaBBZ82wGm=xE+BkTxiTKAbjxYcvTd6ku0=Mwg@mail.gmail.com>
Subject: Re: [git pull] clk: renesas: Updates for v4.11
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk <linux-clk@vger.kernel.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Mike, Stephen,

On Fri, Mar 24, 2017 at 10:39 AM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> The following changes since commit c1ae3cfa0e89fa1a7ecc4c99031f5e9ae99d9201:
>
>   Linux 4.11-rc1 (2017-03-05 12:59:56 -0800)
>
> are available in the git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/clk-renesas-for-v4.12-tag1
>
> for you to fetch changes up to cecbe87d73006cb321dec79b349e3fefd1a80962:
>
>   clk: renesas: rcar-gen3: Add workaround for PLL0/2/4 errata on H3 ES1.0 (2017-03-21 11:12:23 +0100)
>
> ----------------------------------------------------------------
> clk: renesas: Updates for v4.12
>
>   - Add IMR clocks for R-Car H3 and M3-W,
>   - Add workaround for PLL0/2/4 errata on R-Car H3 ES1.0,
>   - Small fixes and cleanups.
>
> Thanks for pulling!

Obviously the subject should have said "clk: renesas: Updates for v4.12".
Sorry for that.

Thanks for pulling!

> ----------------------------------------------------------------
> Geert Uytterhoeven (7):
>       clk: renesas: r8a7795: Correct parent clock and sort order for Audio DMACs
>       clk: renesas: r8a7795: Correct name of watchdog clock
>       clk: renesas: r8a7796: Correct name of watchdog clock
>       clk: renesas: r8a7795: Reformat core clock table
>       clk: renesas: r8a7796: Reformat core clock table
>       clk: renesas: rcar-gen3-cpg: Pass mode pins to rcar_gen3_cpg_init()
>       clk: renesas: rcar-gen3: Add workaround for PLL0/2/4 errata on H3 ES1.0
>
> Sergei Shtylyov (2):
>       clk: renesas: r8a7795: Add IMR clocks
>       clk: renesas: r8a7796: Add IMR clocks
>
>  drivers/clk/renesas/r8a7795-cpg-mssr.c | 32 ++++++++++++++++++--------------
>  drivers/clk/renesas/r8a7796-cpg-mssr.c | 18 ++++++++++--------
>  drivers/clk/renesas/rcar-gen3-cpg.c    | 28 +++++++++++++++++++++++++++-
>  drivers/clk/renesas/rcar-gen3-cpg.h    |  2 +-
>  4 files changed, 56 insertions(+), 24 deletions(-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
