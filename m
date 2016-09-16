Return-Path: <yamada.masahiro@socionext.com>
MIME-Version: 1.0
In-Reply-To: <1463755793-9131-1-git-send-email-yamada.masahiro@socionext.com>
References: <1463755793-9131-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 16 Sep 2016 16:53:51 +0900
Message-ID: <CAK7LNATY9wTjHjsLtGHAJ-DueqXcCHdrw_uoSfyTOEmpp-ZPGw@mail.gmail.com>
Subject: Re: [PATCH v2] clk: probe common clock drivers earlier
To: linux-clk <linux-clk@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Stephen Boyd <sboyd@codeaurora.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Jay Sternberg <jay.e.sternberg@intel.com>, Jens Axboe <axboe@fb.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        =?UTF-8?Q?Matias_Bj=C3=B8rling?= <m@bjorling.me>,
        Krzysztof Kozlowski <k.kozlowski@samsung.com>,
        Alan Tull <atull@opensource.altera.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Valentin Rothberg <valentinrothberg@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen, Greg,


2016-05-20 23:49 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> Several SoCs implement platform drivers for clocks rather than
> CLK_OF_DECLARE().  Clocks should come earlier because they are
> prerequisites for many of other drivers.  It will help to mitigate
> EPROBE_DEFER issues.
>
> Also, drop the comment since it does not look valuable.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
> Changes in v2:
>   - Move clk/ above dma/ since DMA drivers generally enable clk
>
>  drivers/Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/Makefile b/drivers/Makefile
> index 8f5d076..ff39051 100644
> --- a/drivers/Makefile
> +++ b/drivers/Makefile
> @@ -29,6 +29,8 @@ obj-$(CONFIG_SFI)             += sfi/
>  # was used and do nothing if so
>  obj-$(CONFIG_PNP)              += pnp/
>  obj-y                          += amba/
> +
> +obj-y                          += clk/
>  # Many drivers will want to use DMA so this has to be made available
>  # really early.
>  obj-$(CONFIG_DMADEVICES)       += dma/
> @@ -141,8 +143,6 @@ obj-$(CONFIG_VHOST_RING)    += vhost/
>  obj-$(CONFIG_VLYNQ)            += vlynq/
>  obj-$(CONFIG_STAGING)          += staging/
>  obj-y                          += platform/
> -#common clk code
> -obj-y                          += clk/
>
>  obj-$(CONFIG_MAILBOX)          += mailbox/
>  obj-$(CONFIG_HWSPINLOCK)       += hwspinlock/


What do you think of this patch?


Linus game me a positive comment:
https://lkml.org/lkml/2016/7/15/722



-- 
Best Regards
Masahiro Yamada
