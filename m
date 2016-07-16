Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Masahiro Yamada <yamada.masahiro@socionext.com>,  linux-clk@vger.kernel.org
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <1462435037-27979-1-git-send-email-yamada.masahiro@socionext.com>
Cc: "Masahiro Yamada" <yamada.masahiro@socionext.com>,
 "Jay Sternberg" <jay.e.sternberg@intel.com>, "Jens Axboe" <axboe@fb.com>,
 linux-kernel@vger.kernel.org, "Dan Williams" <dan.j.williams@intel.com>,
 =?utf-8?q?Matias_Bj=C3=B8rling?= <m@bjorling.me>,
 "Krzysztof Kozlowski" <k.kozlowski@samsung.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Alexander Shishkin" <alexander.shishkin@linux.intel.com>,
 "Valentin Rothberg" <valentinrothberg@gmail.com>
References: <1462435037-27979-1-git-send-email-yamada.masahiro@socionext.com>
Message-ID: <146863507652.73491.7469412916688579441@resonance>
Subject: Re: [PATCH] clk: probe common clock drivers earlier
Date: Fri, 15 Jul 2016 19:11:16 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Masahiro Yamada (2016-05-05 00:57:17)
> Several SoCs implement platform drivers for clocks rather than
> CLK_OF_DECLARE().  Clocks should come earlier because they are
> prerequisites for many of other drivers.  It will help to mitigate
> EPROBE_DEFER issues.
> =

> Also, drop the comment since it does not look valuable.
> =

> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Acked-by: Michael Turquette <mturquette@baylibre.com>

Regards,
Mike

> ---
> =

>  drivers/Makefile | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> =

> diff --git a/drivers/Makefile b/drivers/Makefile
> index 8f5d076..a2a4922 100644
> --- a/drivers/Makefile
> +++ b/drivers/Makefile
> @@ -44,6 +44,7 @@ obj-$(CONFIG_REGULATOR)               +=3D regulator/
>  =

>  # reset controllers early, since gpu drivers might rely on them to initi=
alize
>  obj-$(CONFIG_RESET_CONTROLLER) +=3D reset/
> +obj-y                          +=3D clk/
>  =

>  # tty/ comes before char/ so that the VT console is the boot-time
>  # default.
> @@ -141,8 +142,6 @@ obj-$(CONFIG_VHOST_RING)    +=3D vhost/
>  obj-$(CONFIG_VLYNQ)            +=3D vlynq/
>  obj-$(CONFIG_STAGING)          +=3D staging/
>  obj-y                          +=3D platform/
> -#common clk code
> -obj-y                          +=3D clk/
>  =

>  obj-$(CONFIG_MAILBOX)          +=3D mailbox/
>  obj-$(CONFIG_HWSPINLOCK)       +=3D hwspinlock/
> -- =

> 1.9.1
> =

> --
> To unsubscribe from this list: send the line "unsubscribe linux-clk" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
