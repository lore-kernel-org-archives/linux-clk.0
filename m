Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mr213139.mail.yeah.net ([223.252.213.139]:34640 "EHLO
	mr213139.mail.yeah.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750743AbcGLEbA (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Tue, 12 Jul 2016 00:31:00 -0400
Subject: Re: [PATCH v2 01/10] ARM: NUC900: Add nuc970 machine support
To: Arnd Bergmann <arnd@arndb.de>
References: <1468135649-19980-1-git-send-email-vw@iommu.org>
 <1468135649-19980-2-git-send-email-vw@iommu.org>
 <18260150.aRRy8ybKlm@wuerfel>
Cc: linux-arm-kernel@lists.infradead.org,
	Russell King <linux@armlinux.org.uk>,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org, robh@kernel.org,
	jason@lakedaemon.net, p.zabel@pengutronix.de,
	Wan Zongshun <mcuos.com@gmail.com>
From: Wan Zongshun <vw@iommu.org>
Message-ID: <57847278.8000408@iommu.org>
Date: Tue, 12 Jul 2016 12:30:48 +0800
MIME-Version: 1.0
In-Reply-To: <18260150.aRRy8ybKlm@wuerfel>
Content-Type: text/plain; charset=UTF-8; format=flowed
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>



On 2016年07月12日 00:04, Arnd Bergmann wrote:
> On Sunday, July 10, 2016 3:27:21 PM CEST Wan Zongshun wrote:
>> +ifeq ($(CONFIG_SOC_NUC970),)
>>   obj-y                          := irq.o time.o mfp.o gpio.o clock.o
>>   obj-y                          += clksel.o dev.o cpu.o
>> +endif
>>   # W90X900 CPU support files
>
> When mfp.o is disabled like this, I get a link error in two drivers
> using the exported interface:
>
> ERROR: "mfp_set_groupg" [drivers/spi/spi-nuc900.ko] undefined!
> ERROR: "mfp_set_groupi" [drivers/input/keyboard/w90p910_keypad.ko] undefined!

Why remove mfp modules? this multifunction pin driver should be used for 
those two drivers, if no mfp_set_groupX, I don't think driver can work.

Now mfp has standard driver subsystem?

>
> Any idea for a better migration strategy?
>
> 	Arnd
>
>
