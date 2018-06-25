Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
References: <1529915064-5014-1-git-send-email-michel.pollet@bp.renesas.com>
In-Reply-To: <1529915064-5014-1-git-send-email-michel.pollet@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 25 Jun 2018 11:20:52 +0200
Message-ID: <CAMuHMdVtkxvpBjSy2+2MHvZ15t5ZTSq-4H+pfgsayOx+EHXnEg@mail.gmail.com>
Subject: Re: [PATCH v10 1/1] clk: renesas: Renesas R9A06G032 clock driver
To: Michel Pollet <michel.pollet@bp.renesas.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms@verge.net.au>,
	Phil Edworthy <phil.edworthy@renesas.com>, Michel Pollet <buserror+upstream@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

Hi Michel,

On Mon, Jun 25, 2018 at 10:29 AM Michel Pollet
<michel.pollet@bp.renesas.com> wrote:
> This provides a clock driver for the Renesas R09A06G032.
> This uses a structure derived from both the RCAR gen2 driver as well as
> the renesas-cpg-mssr driver.
>
> Signed-off-by: Michel Pollet <michel.pollet@bp.renesas.com>

Thanks, updated.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
