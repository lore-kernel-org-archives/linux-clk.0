Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <CAK7LNASny6C=TmVX4uRvf1kF4pNF_ovQQgw9UEhR=xLn+Fy2Jw@mail.gmail.com>
References: <1462435037-27979-1-git-send-email-yamada.masahiro@socionext.com>
 <146863507652.73491.7469412916688579441@resonance> <CAK7LNASny6C=TmVX4uRvf1kF4pNF_ovQQgw9UEhR=xLn+Fy2Jw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 20 Jul 2016 12:58:20 +0200
Message-ID: <CAMuHMdVJhc-9EQ6rKFqwyGoUVgrMX-_ANTc+NZyP38UTtMPedA@mail.gmail.com>
Subject: Re: [PATCH] clk: probe common clock drivers earlier
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk <linux-clk@vger.kernel.org>,
	Jay Sternberg <jay.e.sternberg@intel.com>, Jens Axboe <axboe@fb.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dan Williams <dan.j.williams@intel.com>,
	=?UTF-8?Q?Matias_Bj=C3=B8rling?= <m@bjorling.me>,
	Krzysztof Kozlowski <k.kozlowski@samsung.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Valentin Rothberg <valentinrothberg@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Sat, Jul 16, 2016 at 6:57 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> 2016-07-16 11:11 GMT+09:00 Michael Turquette <mturquette@baylibre.com>:
>> Quoting Masahiro Yamada (2016-05-05 00:57:17)
>>> Several SoCs implement platform drivers for clocks rather than
>>> CLK_OF_DECLARE().  Clocks should come earlier because they are
>>> prerequisites for many of other drivers.  It will help to mitigate

As are regulators, DMA engines, power domains, ..., but the actual ordering
needed depends on the SoC.

>>> EPROBE_DEFER issues.
>>>
>>> Also, drop the comment since it does not look valuable.
>>>
>>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>>
>> Acked-by: Michael Turquette <mturquette@baylibre.com>
>
> Thanks for taking a look at this patch.
>
> While I was wondering where is the best place for
> "obj-y += clk/", I thought it can be probed even earlier.
>
> So, v2 is here:
> https://patchwork.kernel.org/patch/9129749/
>
> Please consider it as a applicable candidate.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
