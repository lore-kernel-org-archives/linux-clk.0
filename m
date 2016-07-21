Return-Path: <yamada.masahiro@socionext.com>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVJhc-9EQ6rKFqwyGoUVgrMX-_ANTc+NZyP38UTtMPedA@mail.gmail.com>
References: <1462435037-27979-1-git-send-email-yamada.masahiro@socionext.com>
 <146863507652.73491.7469412916688579441@resonance> <CAK7LNASny6C=TmVX4uRvf1kF4pNF_ovQQgw9UEhR=xLn+Fy2Jw@mail.gmail.com>
 <CAMuHMdVJhc-9EQ6rKFqwyGoUVgrMX-_ANTc+NZyP38UTtMPedA@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 21 Jul 2016 09:59:33 +0900
Message-ID: <CAK7LNAS-pcMuOt13TuQPcO04bbEH-PWa-W8nHAqo3iRb2V2few@mail.gmail.com>
Subject: Re: [PATCH] clk: probe common clock drivers earlier
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        Jay Sternberg <jay.e.sternberg@intel.com>, Jens Axboe <axboe@fb.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Dan Williams <dan.j.williams@intel.com>,
        =?UTF-8?Q?Matias_Bj=C3=B8rling?= <m@bjorling.me>,
        Krzysztof Kozlowski <k.kozlowski@samsung.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Valentin Rothberg <valentinrothberg@gmail.com>,
        Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

2016-07-20 19:58 GMT+09:00 Geert Uytterhoeven <geert@linux-m68k.org>:
> On Sat, Jul 16, 2016 at 6:57 AM, Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
>> 2016-07-16 11:11 GMT+09:00 Michael Turquette <mturquette@baylibre.com>:
>>> Quoting Masahiro Yamada (2016-05-05 00:57:17)
>>>> Several SoCs implement platform drivers for clocks rather than
>>>> CLK_OF_DECLARE().  Clocks should come earlier because they are
>>>> prerequisites for many of other drivers.  It will help to mitigate
>
> As are regulators, DMA engines, power domains, ..., but the actual ordering
> needed depends on the SoC.


Right.


The *mitigate* is a keyword in my git-log.

I am not saying this commit can completely suppress EPROBE_DEFER,
but moving "obj-y += clk/" up is
a right thing for *most* of SoCs.


-- 
Best Regards
Masahiro Yamada
