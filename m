Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <20150828091624.21731.11014.sendpatchset@little-apple>
References: <20150828091550.21731.85227.sendpatchset@little-apple>
	<20150828091624.21731.11014.sendpatchset@little-apple>
Date: Sat, 29 Aug 2015 10:46:46 +0200
Message-ID: <CAMuHMdWcHvi19tBGSKSfLbb0WuqB+GkfAenXCwkeZNy99gk1Ew@mail.gmail.com>
Subject: Re: [PATCH v3 03/04] clk: shmobile: Add Renesas R-Car Gen3 CPG support
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-clk@vger.kernel.org,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Linux-sh list <linux-sh@vger.kernel.org>,
	Michael Turquette <mturquette@baylibre.com>, Gaku Inami <gaku.inami.xw@bp.renesas.com>,
	Stephen Boyd <sboyd@codeaurora.org>, Simon Horman <horms@verge.net.au>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Fri, Aug 28, 2015 at 11:16 AM, Magnus Damm <magnus.damm@gmail.com> wrote:
> From: Gaku Inami <gaku.inami.xw@bp.renesas.com>
>
> This patch adds very initial CPG support.
> R-Car Gen3 write function should use CPG write protection method
> which is shared with MSTP driver. This patch has it but not used.

The last sentence is very confusing. I think it should be removed?

> Signed-off-by: Gaku Inami <gaku.inami.xw@bp.renesas.com>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
