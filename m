Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
References: <1535714796-2211-1-git-send-email-phil.edworthy@renesas.com>
In-Reply-To: <1535714796-2211-1-git-send-email-phil.edworthy@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Sep 2018 15:11:15 +0200
Message-ID: <CAMuHMdWCjHEZsHHq4+tEK2o-Qj3OuGpFZBFiRxHgjRqMJT0PPw@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r9a06g032: Fix UART34567 clock rate
To: Phil Edworthy <phil.edworthy@renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

Hi Phil,

On Fri, Aug 31, 2018 at 1:26 PM Phil Edworthy <phil.edworthy@renesas.com> wrote:
> The clock for UARTs 0 through 2 is UART012, the clock for UARTs 3 through
> 7 is UART34567.
> For UART012, we stop the clock driver from changing the clock rate. This
> is because the Synopsys UART driver simply sets the reference clock to 16x
> the baud rate, but doesn't check if the actual rate is within the required
> tolerance. The RZ/N1 clock divider can't provide this (we have to rely on
> the UART's internal divider to set the correct clock rate), so you end up
> with a clock rate that is way off what you wanted.
>
> In addition, since the clock is shared between multiple UARTs, you don't
> want the driver trying to change the clock rate as it may affect the other
> UARTs (which may not have been configured yet, so you don't know what baud
> rate they will use). Normally, the clock rate is set early on before Linux
> to some very high rate that supports all of the clock rates you want.
>
> This change stops the UART34567 clock rate from changing for the same
> reasons.
>
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in clk-renesas-for-v4.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
