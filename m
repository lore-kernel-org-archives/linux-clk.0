Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <1436569409-27964-8-git-send-email-sboyd@codeaurora.org>
References: <1436569409-27964-1-git-send-email-sboyd@codeaurora.org>
	<1436569409-27964-8-git-send-email-sboyd@codeaurora.org>
Date: Sun, 12 Jul 2015 12:39:48 +0200
Message-ID: <CAMuHMdUHmwSwrdKJe2sdv89mfg2UQKdWEp5f3zO1PNymopdHSA@mail.gmail.com>
Subject: Re: [PATCH 7/7] lib/vsprintf.c: Include clk.h
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Mike Turquette <mturquette@baylibre.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Sat, Jul 11, 2015 at 1:03 AM, Stephen Boyd <sboyd@codeaurora.org> wrote:
> This file uses the clk API so it should include clk.h directly
> instead of indirectly including it through clk-provider.h.
>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
