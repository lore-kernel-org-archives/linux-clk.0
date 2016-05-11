Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:41531 "EHLO
	conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751076AbcEKBwP (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Tue, 10 May 2016 21:52:15 -0400
MIME-Version: 1.0
In-Reply-To: <20160510112622.GL19473@dell>
References: <1462873862-30940-1-git-send-email-yamada.masahiro@socionext.com>
	<1462873862-30940-2-git-send-email-yamada.masahiro@socionext.com>
	<20160510112622.GL19473@dell>
Date: Wed, 11 May 2016 10:51:51 +0900
Message-ID: <CAK7LNATmuN647=avdqAMahLU+9Bq4m4TkXe5f7q=pi8m=UrXBg@mail.gmail.com>
Subject: Re: [RFC PATCH 01/21] mfd: uniphier: add UniPhier MFD driver
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: Lee Jones <lee.jones@linaro.org>
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
Content-Type: text/plain; charset=UTF-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Lee,

2016-05-10 20:26 GMT+09:00 Lee Jones <lee.jones@linaro.org>:
>> +};
>> +MODULE_DEVICE_TABLE(of, uniphier_mfd_match);
>
> NACK.  Please do not mix MFD and DT registration.

OK, thanks for review.


My basic thought was:

  - Add an MFD node to my DTS only once.
    If I need to expand it in the future, I will just
    need to modify drivers/mtd/uniphier-mfd.c.
    It is just kernel-internal modification, so it does not
    bother DT binding at all.

  - Simplify the node topology of DTS.

-- 
Best Regards
Masahiro Yamada
