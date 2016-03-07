Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <1457315065-28705-1-git-send-email-horms+renesas@verge.net.au>
References: <1457315065-28705-1-git-send-email-horms+renesas@verge.net.au>
Date: Mon, 7 Mar 2016 08:59:01 +0100
Message-ID: <CAMuHMdVo3KQ2TJbYKsuqNMm_H8_tiDw5mWqNXLho_3cjbTE3rw@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: Rename header file renesas.h
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Mike Turquette <mturquette@baylibre.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>,
	linux-clk <linux-clk@vger.kernel.org>, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Mon, Mar 7, 2016 at 2:44 AM, Simon Horman <horms+renesas@verge.net.au> wrote:
> This is part of an ongoing process to migrate from ARCH_SHMOBILE to
> ARCH_RENESAS the motivation for which being that RENESAS seems to be a more
> appropriate name than SHMOBILE for the majority of Renesas ARM based SoCs.
>
> Along with the above mentioned Kconfig changes it seems appropriate
> to also rename files.
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

BTW, the sooner it goes in, the better.

Thank!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
