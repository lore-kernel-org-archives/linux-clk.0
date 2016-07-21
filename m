Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wm0-f43.google.com ([74.125.82.43]:38479 "EHLO
	mail-wm0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752269AbcGUMw3 (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Thu, 21 Jul 2016 08:52:29 -0400
Received: by mail-wm0-f43.google.com with SMTP id o80so24053282wme.1
        for <linux-clk@vger.kernel.org>; Thu, 21 Jul 2016 05:52:29 -0700 (PDT)
Date: Thu, 21 Jul 2016 14:52:24 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, Wan Zongshun <vw@iommu.org>,
	devicetree@vger.kernel.org, jason@lakedaemon.net,
	Wan Zongshun <mcuos.com@gmail.com>,
	linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
	p.zabel@pengutronix.de, Thomas Gleixner <tglx@linutronix.de>,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 03/10] Clocksource: add nuc970 clocksource driver
Message-ID: <20160721125224.GA10047@linaro.org>
References: <1468135649-19980-1-git-send-email-vw@iommu.org>
 <3277576.eNgdG7zPqq@wuerfel>
 <57849D2B.60305@iommu.org>
 <26830152.1oBSpuVOM0@wuerfel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <26830152.1oBSpuVOM0@wuerfel>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Tue, Jul 12, 2016 at 10:28:35AM +0200, Arnd Bergmann wrote:

[ ... ]

> > > Also the init function has changed its return type in linux-next:
> > >
> > >> +static void __init nuc970_timer_of_init(struct device_node *node)
> > >
> > > This now needs to return an error code or we get:
> > >
> > > ../include/linux/of.h:1004:20: error: comparison of distinct pointer types lacks a cast [-Werror]
> > >          .data = (fn == (fn_type)NULL) ? fn : fn  }
> > >
> > > Daniel Lezcano seems to have implemented a migration strategy, but I
> > > can't see what you are supposed to do here, since the
> > > CLOCKSOURCE_OF_DECLARE_RET macro is no longer part of linux-next.
> > 
> > Wait for Daniel's comments? or what should I do now?
> 
> Yes, let's see what he says. I guess from the timing, this will probably
> have to wait for linux-4.9 anyway, and then we have no problem because the
> API change will make it into 4.8.

CLOCKSOURCE_OF_DECLARE_RET was renamed back to CLOCKSOURCE_OF_DECLARE but it 
expects now an init function returning an 'int'.

These changes are now in tip/timers/core, so in linux-next.
