Return-Path: <ykaneko0929@gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUCZZ4p9tOJ2HxtLH9QSqyprsW=cQmhMwF9hGtZDntSdg@mail.gmail.com>
References: <1486920939-3661-1-git-send-email-ykaneko0929@gmail.com> <CAMuHMdUCZZ4p9tOJ2HxtLH9QSqyprsW=cQmhMwF9hGtZDntSdg@mail.gmail.com>
From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Date: Thu, 16 Feb 2017 03:34:47 +0900
Message-ID: <CAH1o70+HDD6t6z6sM90x70HgatSZywYZfcPGcptx-LbPSDQoWw@mail.gmail.com>
Subject: Re: [PATCH/RFC] clk: renesas: r8a7795: Replace PLL3 multiplication setting
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-clk <linux-clk@vger.kernel.org>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Geert-san,

2017-02-15 18:28 GMT+09:00 Geert Uytterhoeven <geert@linux-m68k.org>:
> Hi Kaneko-san,
>
> On Sun, Feb 12, 2017 at 6:35 PM, Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
>> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>>
>> This patch replaces PLL3 multiplication setting for DDR clock frequency.
>>
>>   - After changes, new PLL3 multiplication setting:
>>     MD19 MD17 : DDR clock frequency
>>     -------------------------------
>>       0    0  : DDR3200
>>       0    1  : DDR2800
>>       1    0  : DDR2400
>>       1    1  : DDR1600
>>
>>   - Before changes, old PLL3 multiplication setting:
>>     MD19 MD17 : DDR clock frequency
>>     -------------------------------
>>       0    0  : DDR3200
>>       0    1  : DDR2133
>>       1    0  : Prohibited setting
>>       1    1  : DDR1600
>>
>> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
>
> JFTR, this patch, and its counterpart for r8a7796, are too experimental
> for upstream.

Thanks for your review.
I withdraw these patches.

Thanks,
Kaneko

>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
