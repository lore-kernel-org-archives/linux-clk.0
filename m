Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
References: <5b7895ac-11c1-ac2d-837b-56726bc6226a@cogentembedded.com> <32394fbc-1b10-5708-2769-38cc2eff5042@cogentembedded.com>
In-Reply-To: <32394fbc-1b10-5708-2769-38cc2eff5042@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 3 Sep 2018 09:48:10 +0200
Message-ID: <CAMuHMdV8tkGMgezJWx3C6FFVBOfa+XcSE=DhNPWXSD4zQhy-TA@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r8a77980: add CMT clocks
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Sat, Sep 1, 2018 at 8:54 PM Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Now that RCLK has been added by Geert, we can add the CMT module clocks.
>
> Based on the original (and large) patch by Vladimir Barinov.
>
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in clk-renesas-for-v4.20 with s/add/Add/.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
