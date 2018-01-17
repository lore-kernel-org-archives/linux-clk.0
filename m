Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <1516107034-6600-1-git-send-email-fabio.estevam@nxp.com>
References: <1516107034-6600-1-git-send-email-fabio.estevam@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Jan 2018 09:14:18 +0100
Message-ID: <CAMuHMdXyEBaaGq8yS8Xdxj-0s-CirV3htBaVpN_oK_n9iWLArg@mail.gmail.com>
Subject: Re: [PATCH v2] clk: Print the clock name and warning cause
To: Fabio Estevam <fabio.estevam@nxp.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>,
	Fabio Estevam <festevam@gmail.com>, linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Tue, Jan 16, 2018 at 1:50 PM, Fabio Estevam <fabio.estevam@nxp.com> wrote:
> When getting the clock related warnings, it is useful to know what
> is the clock name that is causing the problem and the cause of the
> problem.
>
> Add the clock name and the the warning cause to the log, so that the
> output becomes clearer like this:
>
> [    2.383969] ------------[ cut here ]------------
> [    2.388720] WARNING: CPU: 0 PID: 1 at drivers/clk/clk.c:814 clk_core_disable+0xd4/0xf8
> [    2.396658] uart4_ipg_gate already disabled
>
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
