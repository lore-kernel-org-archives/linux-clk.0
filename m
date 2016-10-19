Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <13815645.d8PJGpIqtG@wasted.cogentembedded.com>
References: <19700058.YBgRO3SXUI@wasted.cogentembedded.com> <13815645.d8PJGpIqtG@wasted.cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 19 Oct 2016 10:57:34 +0200
Message-ID: <CAMuHMdU0aLmvC7X4F1v4kiNJ2pDDK=G-xvF9e+5bVKezCy3CvA@mail.gmail.com>
Subject: Re: [PATCH 1/3] clk: renesas: cpg-mssr: add common R-Car Gen2 support
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk <linux-clk@vger.kernel.org>,
	Stephen Boyd <sboyd@codeaurora.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Wed, Oct 5, 2016 at 10:52 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Add the common R-Car  Gen2 (and RZ/G) Clock Pulse Generator / Module Standby
> and Software Reset support code, using the CPG/MSSR driver core.
>
> Based on the proof-of-concept R8A7791 CPG/MSSR patch by Geert Uytterhoeven
> <geert+renesas@glider.be>.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
