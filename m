Return-Path: <yamada.masahiro@socionext.com>
MIME-Version: 1.0
In-Reply-To: <146863507652.73491.7469412916688579441@resonance>
References: <1462435037-27979-1-git-send-email-yamada.masahiro@socionext.com> <146863507652.73491.7469412916688579441@resonance>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 16 Jul 2016 13:57:51 +0900
Message-ID: <CAK7LNASny6C=TmVX4uRvf1kF4pNF_ovQQgw9UEhR=xLn+Fy2Jw@mail.gmail.com>
Subject: Re: [PATCH] clk: probe common clock drivers earlier
To: Michael Turquette <mturquette@baylibre.com>
Cc: linux-clk@vger.kernel.org, Jay Sternberg <jay.e.sternberg@intel.com>,
        Jens Axboe <axboe@fb.com>,
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

2016-07-16 11:11 GMT+09:00 Michael Turquette <mturquette@baylibre.com>:
> Quoting Masahiro Yamada (2016-05-05 00:57:17)
>> Several SoCs implement platform drivers for clocks rather than
>> CLK_OF_DECLARE().  Clocks should come earlier because they are
>> prerequisites for many of other drivers.  It will help to mitigate
>> EPROBE_DEFER issues.
>>
>> Also, drop the comment since it does not look valuable.
>>
>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>
> Acked-by: Michael Turquette <mturquette@baylibre.com>
>
> Regards,
> Mike
>

Thanks for taking a look at this patch.

While I was wondering where is the best place for
"obj-y += clk/", I thought it can be probed even earlier.

So, v2 is here:
https://patchwork.kernel.org/patch/9129749/

Please consider it as a applicable candidate.

Thanks!


-- 
Best Regards
Masahiro Yamada
