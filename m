Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <CAMuHMdVYA9z0DFsaj662=E3+3b1QCnWHYzEKZ23sykKbXu4Ong@mail.gmail.com>
References: <1492624001-3758-9-git-send-email-ykaneko0929@gmail.com> <CAMuHMdVYA9z0DFsaj662=E3+3b1QCnWHYzEKZ23sykKbXu4Ong@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 21 Apr 2017 15:06:47 +0200
Message-ID: <CAMuHMdW6wV01BzCwJEaZXqmqtp_yDNZN8pHuGe9BT647iFb7Cg@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r8a7796: Add USB-DMAC clocks
To: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc: linux-clk <linux-clk@vger.kernel.org>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Thu, Apr 20, 2017 at 8:36 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Wed, Apr 19, 2017 at 7:46 PM, Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
>> From: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
>>
>> This patch adds USB-DMAC{0,1} clocks for R8A7796 SoC.
>>
>> Signed-off-by: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
>> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
>> ---
>> This patch is based on the clk-next branch of linux-clk tree.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> I.e. will queue in clk-renesas-for-v4.13.

and after correcting sort order:

> >         DEF_MOD("rwdt",                  402,   R8A7796_CLK_R),
> > +       DEF_MOD("usb-dmac0",             330,   R8A7796_CLK_S3D1),
> > +       DEF_MOD("usb-dmac1",             331,   R8A7796_CLK_S3D1),
> >         DEF_MOD("intc-ap",               408,   R8A7796_CLK_S3D1),

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
