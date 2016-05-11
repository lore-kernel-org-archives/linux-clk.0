Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from metis.ext.4.pengutronix.de ([92.198.50.35]:34623 "EHLO
	metis.ext.4.pengutronix.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751908AbcEKKiC convert rfc822-to-8bit
	(ORCPT <rfc822;linux-clk@vger.kernel.org>);
	Wed, 11 May 2016 06:38:02 -0400
Message-ID: <1462963078.2924.23.camel@pengutronix.de>
Subject: Re: [RFC PATCH 13/21] reset: uniphier: add reset driver for
 UniPhier PH1-LD4 SoC
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-clk@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Date: Wed, 11 May 2016 12:37:58 +0200
In-Reply-To: <1462962853.2924.19.camel@pengutronix.de>
References: <1462873862-30940-1-git-send-email-yamada.masahiro@socionext.com>
	 <1462873862-30940-14-git-send-email-yamada.masahiro@socionext.com>
	 <1462883138.9155.3.camel@pengutronix.de>
	 <CAK7LNASY=Kg-KOMue09_YRoxrBAnXP00oqG4AC2iQM1HJgLc7A@mail.gmail.com>
	 <1462962853.2924.19.camel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Am Mittwoch, den 11.05.2016, 12:34 +0200 schrieb Philipp Zabel:
> Hi Masahiro,
> 
> Am Mittwoch, den 11.05.2016, 11:52 +0900 schrieb Masahiro Yamada:
> > Hi Philipp,
> > 
> > 
> > 2016-05-10 21:25 GMT+09:00 Philipp Zabel <p.zabel@pengutronix.de>:
> > > Hi Masahiro,
> > >
> > > Am Dienstag, den 10.05.2016, 18:50 +0900 schrieb Masahiro Yamada:
> > >> This series is just for review.
> > >> Please do not apply this patch.
> > >>
> > >> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> > >
> > > No need for all these tiny drivers. If you probe from DT as Lee
> > > requests, you can let of_device_id.data point to a compatible specific
> > > uniphier_reset_data.
> > >
> > 
> > I will need to fill the table a bit more to complete this work,
> > but I do not think this reset driver will become as big as the clk driver.
> > (I guess it will be less than 1000 lines.)
> > 
> > If you prefer a single file for the whole of this SoC family,
> > I can squash all the files into one.
> > (I can split it if I need to do so in the future.)
> 
> I'm fine with split files if you think the complete lists are too long,
> but in that case export the uniphier_reset_data

"... and use them from a single platform driver." I wanted to add here
before I tripped over the send button.

> I don't care about the lists being in a single file so much as I'd
> prefer to avoid the duplicated boilerplate of one module_platform_driver
> per SoC family member.

best regards
Philipp
