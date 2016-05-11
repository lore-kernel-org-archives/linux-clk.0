Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wm0-f50.google.com ([74.125.82.50]:37654 "EHLO
	mail-wm0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750954AbcEKHiq (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Wed, 11 May 2016 03:38:46 -0400
Received: by mail-wm0-f50.google.com with SMTP id a17so66351030wme.0
        for <linux-clk@vger.kernel.org>; Wed, 11 May 2016 00:38:45 -0700 (PDT)
Date: Wed, 11 May 2016 08:38:55 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Mauro Carvalho Chehab <mchehab@osg.samsung.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Guenter Roeck <linux@roeck-us.net>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jiri Slaby <jslaby@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-clk@vger.kernel.org, Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [RFC PATCH 01/21] mfd: uniphier: add UniPhier MFD driver
Message-ID: <20160511073855.GQ19473@dell>
References: <1462873862-30940-1-git-send-email-yamada.masahiro@socionext.com>
 <1462873862-30940-2-git-send-email-yamada.masahiro@socionext.com>
 <20160510112622.GL19473@dell>
 <CAK7LNATmuN647=avdqAMahLU+9Bq4m4TkXe5f7q=pi8m=UrXBg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
In-Reply-To: <CAK7LNATmuN647=avdqAMahLU+9Bq4m4TkXe5f7q=pi8m=UrXBg@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Wed, 11 May 2016, Masahiro Yamada wrote:

> Hi Lee,
> 
> 2016-05-10 20:26 GMT+09:00 Lee Jones <lee.jones@linaro.org>:
> >> +};
> >> +MODULE_DEVICE_TABLE(of, uniphier_mfd_match);
> >
> > NACK.  Please do not mix MFD and DT registration.
> 
> OK, thanks for review.
> 
> 
> My basic thought was:
> 
>   - Add an MFD node to my DTS only once.
>     If I need to expand it in the future, I will just
>     need to modify drivers/mtd/uniphier-mfd.c.
>     It is just kernel-internal modification, so it does not
>     bother DT binding at all.
> 
>   - Simplify the node topology of DTS.

Just describe the hardware in DT.  If you do so accurately, there
should be no requirement to change it (in theory).

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
