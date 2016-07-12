Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mr213139.mail.yeah.net ([223.252.213.139]:55402 "EHLO
	mr213139.mail.yeah.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750748AbcGLHEu (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Tue, 12 Jul 2016 03:04:50 -0400
Subject: Re: [PATCH v2 02/10] irqchip: add irqchip driver for nuc900
To: Arnd Bergmann <arnd@arndb.de>
References: <1468135649-19980-1-git-send-email-vw@iommu.org>
 <1468135649-19980-3-git-send-email-vw@iommu.org> <1761342.TGgYi16yul@wuerfel>
Cc: devicetree@vger.kernel.org, jason@lakedaemon.net,
	Wan Zongshun <mcuos.com@gmail.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	linux-kernel@vger.kernel.org, p.zabel@pengutronix.de,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
From: Wan Zongshun <vw@iommu.org>
Message-ID: <5784968A.7080007@iommu.org>
Date: Tue, 12 Jul 2016 15:04:42 +0800
MIME-Version: 1.0
In-Reply-To: <1761342.TGgYi16yul@wuerfel>
Content-Type: text/plain; charset=UTF-8; format=flowed
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>



On 2016年07月11日 23:46, Arnd Bergmann wrote:
> On Sunday, July 10, 2016 3:27:22 PM CEST Wan Zongshun wrote:
>> +
>> +#if !defined(CONFIG_SOC_NUC900)
>>   #define NR_IRQS                (IRQ_ADC+1)
>> +#else
>> +#define NR_IRQS                62
>> +#endif
>>
>
> The Kconfig symbols are a bit confusing here: CONFIG_SOC_NUC900
> controls the compilation of the soc_device driver, but I guess
> what you actually mean here is CONFIG_SOC_NUC970, which is the
> support for the actual chip.
>
> Maybe rename the former to something less confusing and change
> this to CONFIG_SOC_NUC970?

You are right, it should _NUC970. Many thanks!

>
> Ideally, this should just go away once we use SPARSE_IRQ.

This platform also can use SPARSE_IRQ? this just a simple irq map and no 
more irq number in this Soc.

>
> 	Arnd
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>
>
