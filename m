Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <1495183565-21679-1-git-send-email-geert+renesas@glider.be>
References: <1495183565-21679-1-git-send-email-geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 19 May 2017 11:00:41 +0200
Message-ID: <CAMuHMdVcQXfyY_mG1-iZ4F62JsxLgZwpEt8Sm=MVphFJdZFx1w@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] clk: renesas: rcar-gen2: Add new CPG/MSSR drivers
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>,
	linux-clk <linux-clk@vger.kernel.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Fri, May 19, 2017 at 10:45 AM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> Currently Renesas R-Car Gen2 SoCs use the common clk-rcar-gen2,
> clk-mstp, and clk-div6 drivers, which depend on most clocks being
> described in DT.  Especially the module (MSTP) clocks are cumbersome and
> error prone, due to 3 arrays (clocks, clock-indices, and
> clock-output-names) to be kept in sync. In addition, the clk-mstp driver
> cannot be extended easily to also support module resets, which are
> provided by the same hardware module.
>
> Hence when developing support for R-Car Gen3 SoCs, another approach was
> chosen, which led to the CPG/MSSR driver core, and SoC-specific
> subdrivers (initially for R-Car Gen3, but later also for RZ/G1).
>
> This series introduces new clock drivers for all supported R-Car Gen2
> SoCs, using the CPG/MSSR driver core, and the support for RZ/G1.  They
> provide all clocks supported by the old driver, plus a few more.
> The old driver can still be used through a Kconfig option, to preserve
> backward compatibility with old DTBs.
>
> This series does not include the corresponding DTS updates.  These will
> be posted as a separate series later.

>  .../devicetree/bindings/clock/renesas,cpg-mssr.txt |  10 +-
>  drivers/clk/renesas/Kconfig                        |  22 +-
>  drivers/clk/renesas/Makefile                       |   4 +
>  drivers/clk/renesas/r8a7790-cpg-mssr.c             | 278 ++++++++++++++++++++
>  drivers/clk/renesas/r8a7791-cpg-mssr.c             | 286 +++++++++++++++++++++
>  drivers/clk/renesas/r8a7792-cpg-mssr.c             | 221 ++++++++++++++++
>  drivers/clk/renesas/r8a7794-cpg-mssr.c             | 255 ++++++++++++++++++
>  drivers/clk/renesas/renesas-cpg-mssr.c             |  29 +++
>  drivers/clk/renesas/renesas-cpg-mssr.h             |   4 +
>  include/dt-bindings/clock/r8a7790-cpg-mssr.h       |  52 ++++
>  include/dt-bindings/clock/r8a7791-cpg-mssr.h       |  48 ++++
>  include/dt-bindings/clock/r8a7792-cpg-mssr.h       |  43 ++++
>  include/dt-bindings/clock/r8a7793-cpg-mssr.h       |  48 ++++
>  include/dt-bindings/clock/r8a7794-cpg-mssr.h       |  47 ++++
>  14 files changed, 1341 insertions(+), 6 deletions(-)

BTW, the above diffstat should be combined with the diffstat for the DTS
conversion:

 arch/arm/boot/dts/r8a7790-lager.dts   |   7 +-
 arch/arm/boot/dts/r8a7790.dtsi        | 557 ++++++----------------------------
 arch/arm/boot/dts/r8a7791-koelsch.dts |   4 +-
 arch/arm/boot/dts/r8a7791-porter.dts  |   4 +-
 arch/arm/boot/dts/r8a7791.dtsi        | 557 +++++++---------------------------
 arch/arm/boot/dts/r8a7792-blanche.dts |   3 +-
 arch/arm/boot/dts/r8a7792-wheat.dts   |   3 +-
 arch/arm/boot/dts/r8a7792.dtsi        | 333 ++++----------------
 arch/arm/boot/dts/r8a7793-gose.dts    |   4 +-
 arch/arm/boot/dts/r8a7793.dtsi        | 459 +++++-----------------------
 arch/arm/boot/dts/r8a7794-alt.dts     |   3 +-
 arch/arm/boot/dts/r8a7794-silk.dts    |   3 +-
 arch/arm/boot/dts/r8a7794.dtsi        | 528 +++++---------------------------
 13 files changed, 430 insertions(+), 2035 deletions(-)

Giving a net removal of 270 lines.
That is, before removal of the backward compatibility of the drivers with
old DTBs, which would remove ca. 500 more lines.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
