Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.13]:49817 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750850AbcGLIUj convert rfc822-to-8bit (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Tue, 12 Jul 2016 04:20:39 -0400
From: Arnd Bergmann <arnd@arndb.de>
To: Wan Zongshun <vw@iommu.org>
Cc: devicetree@vger.kernel.org, jason@lakedaemon.net,
	Wan Zongshun <mcuos.com@gmail.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	linux-kernel@vger.kernel.org, p.zabel@pengutronix.de,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 01/10] ARM: NUC900: Add nuc970 machine support
Date: Tue, 12 Jul 2016 10:23:32 +0200
Message-ID: <7624955.nn13su4oq1@wuerfel>
In-Reply-To: <578498E7.4080709@iommu.org>
References: <1468135649-19980-1-git-send-email-vw@iommu.org> <57847278.8000408@iommu.org> <578498E7.4080709@iommu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Tuesday, July 12, 2016 3:14:47 PM CEST Wan Zongshun wrote:
> On 2016年07月12日 12:30, Wan Zongshun wrote:
> >
> >
> > On 2016年07月12日 00:04, Arnd Bergmann wrote:
> >> On Sunday, July 10, 2016 3:27:21 PM CEST Wan Zongshun wrote:
> >>> +ifeq ($(CONFIG_SOC_NUC970),)
> >>>   obj-y                          := irq.o time.o mfp.o gpio.o clock.o
> >>>   obj-y                          += clksel.o dev.o cpu.o
> >>> +endif
> >>>   # W90X900 CPU support files
> >>
> >> When mfp.o is disabled like this, I get a link error in two drivers
> >> using the exported interface:
> >>
> >> ERROR: "mfp_set_groupg" [drivers/spi/spi-nuc900.ko] undefined!
> >> ERROR: "mfp_set_groupi" [drivers/input/keyboard/w90p910_keypad.ko]
> >> undefined!
> >
> > Why remove mfp modules? this multifunction pin driver should be used for
> > those two drivers, if no mfp_set_groupX, I don't think driver can work.
> >
> > Now mfp has standard driver subsystem?
> >
> >>
> >> Any idea for a better migration strategy?
> 
> Arnd, If you still think the mfp should be removed, we can send a series 
> patches to instead of using mfp interface quickly, and do mfp set in 
> local driver. Do you think it is ok?

I don't think setting it locally in the driver is a good idea.

In the long run, this should go through the pinctrl framework, but
there is no need to implement that right away. Until then, I think
using the existing mfp.o code is fine, it will just need to be
adapted slightly to understand the DT based device names.

	Arnd
