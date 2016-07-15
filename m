Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([217.72.192.73]:58344 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751641AbcGUKy5 (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Thu, 21 Jul 2016 06:54:57 -0400
From: Arnd Bergmann <arnd@arndb.de>
To: Wan ZongShun <mcuos.com@gmail.com>
Cc: Wan Zongshun <vw@iommu.org>, Jason Cooper <jason@lakedaemon.net>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	Russell King <linux@armlinux.org.uk>,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Rob Herring <robh@kernel.org>, p.zabel@pengutronix.de
Subject: Re: [PATCH v2 02/10] irqchip: add irqchip driver for nuc900
Date: Fri, 15 Jul 2016 12:02:55 +0200
Message-ID: <1885052.EkH2ZADWZS@wuerfel>
In-Reply-To: <CAKT61h8EkOOkDHou65Uc7NNomJ6Nowvw8o6JnWxNyc0S_=x_JA@mail.gmail.com>
References: <1468135649-19980-1-git-send-email-vw@iommu.org> <16178876.fFBuoBSjbd@wuerfel> <CAKT61h8EkOOkDHou65Uc7NNomJ6Nowvw8o6JnWxNyc0S_=x_JA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Friday, July 15, 2016 5:44:50 PM CEST Wan ZongShun wrote:
> 2016-07-15 15:00 GMT+08:00 Arnd Bergmann <arnd@arndb.de>:
> > On Friday, July 15, 2016 1:15:58 PM CEST Wan Zongshun wrote:
> >>
> >> Actually, I have two choice to implement this function:
> >>
> >> option1:
> >>
> >> void __exception_irq_entry aic_handle_irq(struct pt_regs *regs)
> >> {
> >>         u32 hwirq;
> >>
> >>         (void)readl(aic_base + REG_AIC_IPER);
> >>         hwirq = readl(aic_base + REG_AIC_ISNR);
> >>
> >>         handle_IRQ((irq_find_mapping(aic_domain, hwirq)), regs);
> >> }
> >
> > (side note: I think you want handle_domain_irq())
> >
> >> option2:
> >>
> >> void __exception_irq_entry aic_handle_irq(struct pt_regs *regs)
> >> {
> >>         u32 hwirq;
> >>
> >>         hwirq = readl(aic_base + REG_AIC_IPER);
> >>         hwirq <<= 2;
> >>
> >>         handle_IRQ((irq_find_mapping(aic_domain, hwirq)), regs);
> >> }
> >>
> >> Though the option2 do shift for hwirq, but it seems better than do io
> >> operation by readl,so I prefer to option2, agree?
> >
> > That will only return an irq number that is a multiple of four, which
> > seems wrong since the numbers are not that. Did you mean to write
> >
> >         hwirq = ilog2(hwirq);   ?
> 
> Sorry, my fault, I mean hwirq >>= 2, bit[7:2] indicates which irq is triggering.
> so I have to do right shift 2 for IPER value.

Ok, got it.

> > That assumes that REG_AIC_IPER contains a 32-bit value with one single
> > bit set to indicate which IRQ was triggered.
> >
> > If the difference is only in performance, you could try measuring which
> > of the two ends up being faster.
> 
> It seems hard to measure. I think Do IO operation should be slower
> than shift 2. 

It depends on how fast that particular I/O path is. A lot of readl()
operations are awfully slow, but the hardware design for the interrupt
controller may in fact have optimized this to be reasonably fast.

Another option would be to avoid the shift and just use the raw value
of the REG_AIC_IPER register as the hwirq, with a custom map()
callback that turns shifts the number read from the DT two bits
so it matches the register value.

	Arnd
