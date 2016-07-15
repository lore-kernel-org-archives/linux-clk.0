Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-vk0-f66.google.com ([209.85.213.66]:34892 "EHLO
	mail-vk0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932302AbcGOJpM (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Fri, 15 Jul 2016 05:45:12 -0400
MIME-Version: 1.0
In-Reply-To: <16178876.fFBuoBSjbd@wuerfel>
References: <1468135649-19980-1-git-send-email-vw@iommu.org>
 <20160714135426.GC31509@io.lakedaemon.net> <5788718E.7080708@iommu.org> <16178876.fFBuoBSjbd@wuerfel>
From: Wan ZongShun <mcuos.com@gmail.com>
Date: Fri, 15 Jul 2016 17:44:50 +0800
Message-ID: <CAKT61h8EkOOkDHou65Uc7NNomJ6Nowvw8o6JnWxNyc0S_=x_JA@mail.gmail.com>
Subject: Re: [PATCH v2 02/10] irqchip: add irqchip driver for nuc900
To: Arnd Bergmann <arnd@arndb.de>
Cc: Wan Zongshun <vw@iommu.org>, Jason Cooper <jason@lakedaemon.net>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	Russell King <linux@armlinux.org.uk>,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Rob Herring <robh@kernel.org>, p.zabel@pengutronix.de
Content-Type: text/plain; charset=UTF-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

2016-07-15 15:00 GMT+08:00 Arnd Bergmann <arnd@arndb.de>:
> On Friday, July 15, 2016 1:15:58 PM CEST Wan Zongshun wrote:
>>
>> Actually, I have two choice to implement this function:
>>
>> option1:
>>
>> void __exception_irq_entry aic_handle_irq(struct pt_regs *regs)
>> {
>>         u32 hwirq;
>>
>>         (void)readl(aic_base + REG_AIC_IPER);
>>         hwirq = readl(aic_base + REG_AIC_ISNR);
>>
>>         handle_IRQ((irq_find_mapping(aic_domain, hwirq)), regs);
>> }
>
> (side note: I think you want handle_domain_irq())
>
>> option2:
>>
>> void __exception_irq_entry aic_handle_irq(struct pt_regs *regs)
>> {
>>         u32 hwirq;
>>
>>         hwirq = readl(aic_base + REG_AIC_IPER);
>>         hwirq <<= 2;
>>
>>         handle_IRQ((irq_find_mapping(aic_domain, hwirq)), regs);
>> }
>>
>> Though the option2 do shift for hwirq, but it seems better than do io
>> operation by readl,so I prefer to option2, agree?
>
> That will only return an irq number that is a multiple of four, which
> seems wrong since the numbers are not that. Did you mean to write
>
>         hwirq = ilog2(hwirq);   ?

Sorry, my fault, I mean hwirq >>= 2, bit[7:2] indicates which irq is triggering.
so I have to do right shift 2 for IPER value.

>
> That assumes that REG_AIC_IPER contains a 32-bit value with one single
> bit set to indicate which IRQ was triggered.
>
> If the difference is only in performance, you could try measuring which
> of the two ends up being faster.

It seems hard to measure. I think Do IO operation should be slower
than shift 2. :)

>
>         Arnd



-- 
---
Vincent Wan(Zongshun)
www.mcuos.com
