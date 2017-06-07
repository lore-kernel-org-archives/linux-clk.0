Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mx08-00252a01.pphosted.com ([91.207.212.211]:46076 "EHLO
        mx08-00252a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751561AbdFGMhz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 7 Jun 2017 08:37:55 -0400
Received: from pps.filterd (m0102629.ppops.net [127.0.0.1])
        by mx08-00252a01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v57CXd6W015104
        for <linux-clk@vger.kernel.org>; Wed, 7 Jun 2017 13:37:43 +0100
Received: from mail-wr0-f199.google.com (mail-wr0-f199.google.com [209.85.128.199])
        by mx08-00252a01.pphosted.com with ESMTP id 2auhket2sq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK)
        for <linux-clk@vger.kernel.org>; Wed, 07 Jun 2017 13:37:43 +0100
Received: by mail-wr0-f199.google.com with SMTP id u101so1433221wrc.2
        for <linux-clk@vger.kernel.org>; Wed, 07 Jun 2017 05:37:43 -0700 (PDT)
Subject: Re: [PATCH 1/2] clk: bcm2835: Add AUX interrupt controller
To: Alexander Stein <alexanders83@web.de>, linux-kernel@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Eric Anholt <eric@anholt.net>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org
References: <79d4534c-49fe-3af4-13d8-2aaf22120d43@raspberrypi.org>
 <3148562.tSrsoIclEp@ws-stein>
From: Phil Elwell <phil@raspberrypi.org>
Message-ID: <369bb235-77fb-60ad-61d8-3de039e0f838@raspberrypi.org>
Date: Wed, 7 Jun 2017 13:37:41 +0100
MIME-Version: 1.0
In-Reply-To: <3148562.tSrsoIclEp@ws-stein>
Content-Type: text/plain; charset=utf-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 07/06/2017 13:07, Alexander Stein wrote:
> On Wednesday 07 June 2017 12:11:45, Phil Elwell wrote:
>> Devices in the AUX block share a common interrupt line, with a register
>> indicating which devices have active IRQs. Expose this as a nested
>> interrupt controller to avoid IRQ sharing problems (easily observed if
>> UART1 and SPI1/2 are enabled simultaneously).
>>
>> Signed-off-by: Phil Elwell <phil@raspberrypi.org>
>> ---
>>  drivers/clk/bcm/clk-bcm2835-aux.c | 120
>> ++++++++++++++++++++++++++++++++++++++ 1 file changed, 120 insertions(+)
>>
>> diff --git a/drivers/clk/bcm/clk-bcm2835-aux.c
>> b/drivers/clk/bcm/clk-bcm2835-aux.c index bd750cf..41e0702 100644
>> --- a/drivers/clk/bcm/clk-bcm2835-aux.c
>> +++ b/drivers/clk/bcm/clk-bcm2835-aux.c
>> [...]
>> +struct auxirq_state {
>> +	void __iomem      *status;
>> +	u32                enables;
>> +	struct irq_domain *domain;
>> +	struct regmap     *local_regmap;
>> +};
>> +
>> +static struct auxirq_state auxirq __read_mostly;
>> +
>> +static irqreturn_t bcm2835_auxirq_handler(int irq, void *dev_id)
>> +{
>> +	u32 stat = readl_relaxed(auxirq.status);
>> +	u32 masked = stat & auxirq.enables;
> 
> Doesn't this hide any spurious interrupts? Is this acceptable? I mean getting 
> informed about spurious interrupts seems nice to me, as it indicates a 
> hardware/configuration problem.

Thanks for the reply. This interrupt handler is capable of dispatching multiple
interrupts but must return a single value - IRQ_HANDLED or IRQ_NONE. I've assumed
that returning IRQ_NONE repeatedly will trigger the spurious interrupt detection.

This implementation returns IRQ_HANDLED if any unmasked interrupts are raised,
otherwise it returns IRQ_NONE. Therefore provided any spurious interrupt isn't
always coincident with a real interrupt then it ought eventually to be identified
as spurious. The alternative - returning IRQ_NONE if there are any spurious
interrupts - seems prone to causing collateral damage.

What did you have in mind?

>> +	if (masked & BCM2835_AUXIRQ_UART_MASK)
>> +		generic_handle_irq(irq_linear_revmap(auxirq.domain,
>> +						     BCM2835_AUXIRQ_UART_IRQ));
>> +
>> +	if (masked & BCM2835_AUXIRQ_SPI1_MASK)
>> +		generic_handle_irq(irq_linear_revmap(auxirq.domain,
>> +						     BCM2835_AUXIRQ_SPI1_IRQ));
>> +
>> +	if (masked & BCM2835_AUXIRQ_SPI2_MASK)
>> +		generic_handle_irq(irq_linear_revmap(auxirq.domain,
>> +						     BCM2835_AUXIRQ_SPI2_IRQ));
>> +
>> +	return (masked & BCM2835_AUXIRQ_ALL_MASK) ? IRQ_HANDLED : IRQ_NONE;
>> +}
> 
> How does interrupt acknowledgement work in these 3 interrupts work?

The interrupt "controller" is just combinatorial logic on the three level-sensitive
interrupt lines from the devices. Interrupts must be acknowledged and cleared at
source.

Phil

