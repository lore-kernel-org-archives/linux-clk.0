Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <20170721201650.GC19878@codeaurora.org>
References: <1492624001-3758-11-git-send-email-ykaneko0929@gmail.com> <20170721201650.GC19878@codeaurora.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 17 Aug 2017 14:43:28 +0200
Message-ID: <CAMuHMdUa05_6qfq5FXrrRq14J-OOrE4CRuo1Qhtmh58k2FLBYw@mail.gmail.com>
Subject: Re: [PATCH] clk: cs2000: Add cs2000_set_saved_rate
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Yoshihiro Kaneko <ykaneko0929@gmail.com>, linux-clk <linux-clk@vger.kernel.org>,
	Michael Turquette <mturquette@baylibre.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen,

On Fri, Jul 21, 2017 at 10:16 PM, Stephen Boyd <sboyd@codeaurora.org> wrote:
> On 04/20, Yoshihiro Kaneko wrote:
>> From: Gaku Inami <gaku.inami.xw@bp.renesas.com>
>>
>> This patch adds the common function to reset the clk rate in order to
>> be able to use it in other cases.
>>
>> Signed-off-by: Gaku Inami <gaku.inami.xw@bp.renesas.com>
>> Signed-off-by: Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>
>> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
>> ---
>> This patch is based on the clk-next branch of linux-clk tree.
>
> Geert?

The CS2000 clock generator is not a Renesas part, so please take it directly.
Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
