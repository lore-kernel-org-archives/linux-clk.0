Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
References: <1536748914-27416-1-git-send-email-fabrizio.castro@bp.renesas.com> <1536748914-27416-3-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1536748914-27416-3-git-send-email-fabrizio.castro@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Sep 2018 13:02:30 +0200
Message-ID: <CAMuHMdXuZkFNPYG4S2Z1HhHxMPZWfz_sME8j7OToFbUyRiJA1Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] clk: renesas: cpg-mssr: Add r8a774c0 support
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>, Simon Horman <horms@verge.net.au>,
	Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Wed, Sep 12, 2018 at 12:42 PM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> Add RZ/G2E (R8A774C0) Clock Pulse Generator / Module Standby and
> Software Reset support.
>
> Based on Table 8.2g of "RZ/G Series, 2nd Generation User's Manual:
> Hardware (Rev. 0.61, June 12, 2018)".
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in clk-renesas-for-v4.20.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
