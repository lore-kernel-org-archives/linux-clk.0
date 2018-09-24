Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
References: <5b7895ac-11c1-ac2d-837b-56726bc6226a@cogentembedded.com> <53539d21-bb00-eb11-bfde-206f3b7e3fe0@cogentembedded.com>
In-Reply-To: <53539d21-bb00-eb11-bfde-206f3b7e3fe0@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Sep 2018 10:04:44 +0200
Message-ID: <CAMuHMdVCa6SgOJnQKXq9xGkhvBeXfj7eo3+F4JaNtDY2QEF8Xg@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r8a77970: add TPU clock
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Wed, Sep 19, 2018 at 8:10 PM Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> The TPU0 clock wasn't present in the original R8A77970 patch by Daisuke
> Matsushita, it was added in a later BSP version...
>
> Based on the original (and large) patch by Vladimir Barinov.
>
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in clk-renesas-for-v4.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
