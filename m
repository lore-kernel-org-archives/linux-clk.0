Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-oi0-f68.google.com ([209.85.218.68]:36843 "EHLO
	mail-oi0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751080AbcGOVx6 (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Fri, 15 Jul 2016 17:53:58 -0400
MIME-Version: 1.0
In-Reply-To: <1462435037-27979-1-git-send-email-yamada.masahiro@socionext.com>
References: <1462435037-27979-1-git-send-email-yamada.masahiro@socionext.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 16 Jul 2016 06:53:56 +0900
Message-ID: <CA+55aFyi1M72bMn8xKz-btG6BxuSyfY+8FR6gu3Fd5jy7RhbFg@mail.gmail.com>
Subject: Re: [PATCH] clk: probe common clock drivers earlier
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-clk@vger.kernel.org,
	Jay Sternberg <jay.e.sternberg@intel.com>,
	Jens Axboe <axboe@fb.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Dan Williams <dan.j.williams@intel.com>,
	=?UTF-8?Q?Matias_Bj=C3=B8rling?= <m@bjorling.me>,
	Krzysztof Kozlowski <k.kozlowski@samsung.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Valentin Rothberg <valentinrothberg@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

This is still in my "what happened to this" patch list..

I'm dropping it as I'll be without internet for a week and I'm trying
to make sure my pile is empty, but I'd like somebody to take a look at
it (Greg?) since it feels right to me.

             Linus

On Thu, May 5, 2016 at 4:57 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
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
>  drivers/Makefile | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/Makefile b/drivers/Makefile
> index 8f5d076..a2a4922 100644
> --- a/drivers/Makefile
> +++ b/drivers/Makefile
> @@ -44,6 +44,7 @@ obj-$(CONFIG_REGULATOR)               += regulator/
>
>  # reset controllers early, since gpu drivers might rely on them to initialize
>  obj-$(CONFIG_RESET_CONTROLLER) += reset/
> +obj-y                          += clk/
>
>  # tty/ comes before char/ so that the VT console is the boot-time
>  # default.
> @@ -141,8 +142,6 @@ obj-$(CONFIG_VHOST_RING)    += vhost/
>  obj-$(CONFIG_VLYNQ)            += vlynq/
>  obj-$(CONFIG_STAGING)          += staging/
>  obj-y                          += platform/
> -#common clk code
> -obj-y                          += clk/
>
>  obj-$(CONFIG_MAILBOX)          += mailbox/
>  obj-$(CONFIG_HWSPINLOCK)       += hwspinlock/
> --
> 1.9.1
>
