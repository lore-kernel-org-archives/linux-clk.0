Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:33568 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751410AbdFHSDa (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 8 Jun 2017 14:03:30 -0400
Subject: Re: [PATCH 0/2] Add bcm2835aux interrupt controller
To: Phil Elwell <phil@raspberrypi.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Eric Anholt <eric@anholt.net>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <6dc301c8-e5a2-1334-c476-1ce7e303787f@raspberrypi.org>
 <b3d5b3c1-a9ab-99bf-a1b2-3a1e4579c0ff@gmail.com>
 <846fcded-190e-e3f7-c0cd-b7c9281e41e0@raspberrypi.org>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <8501ed97-dea7-3e00-1ba6-7e123950ff27@gmail.com>
Date: Thu, 8 Jun 2017 11:03:12 -0700
MIME-Version: 1.0
In-Reply-To: <846fcded-190e-e3f7-c0cd-b7c9281e41e0@raspberrypi.org>
Content-Type: text/plain; charset=utf-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 06/08/2017 02:55 AM, Phil Elwell wrote:
> On 07/06/2017 21:58, Florian Fainelli wrote:
>> On 06/07/2017 04:11 AM, Phil Elwell wrote:
>>> Devices in the AUX block share a common interrupt line, with a register
>>> indicating which devices have active IRQs. Expose this as a nested
>>> interrupt controller to avoid IRQ sharing problems (easily observed if
>>> UART1 and SPI1/2 are enabled simultaneously).
>>>
>>> The interrupt functionality could arguably be forked off as a separate
>>> irqchip driver, but the clock driver has already claimed the AUX_IRQ
>>> register so some driver and DT surgery would still be required.
>>> Eric Anholt thought that including it here is reasonable, but I'm
>>> prepared to split it out if this is considered too hacky.
>>
>> You probably remember your fix to the irqchip drive being flamed because
>> the irqchip driver was re-purposed as an ARM SMP secondary core bringup
>> method, maybe we can avoid doing the same mistake and having this a
>> separate interrupt controller be under drivers/irqchip/*?
>>
>> Even if the clock driver already claims the AUX_IRQ register space, we
>> can still have an irqchip ioremap() the two register offsets that it
>> cares about (AUXIRQ, AUXENB) and just manage that 8 bytes worth of
>> register space. We just need to make sure that the clock driver really
>> does not touch those (why would it) and that there won't be any
>> conflicting request_mem_region() against the same register range.
>>
>> Thanks!
> 
> The "clock" driver (it's really just a block enabler) and IRQ functionality
> each use one of two adjacent word registers. Is it not simpler, clearer and
> more accurate to represent those as separate nodes in the device tree,
> rather than continuing to allow the clock node to claim the neighbouring
> register and expecting the IRQ driver to use other mechanisms to locate
> (phandle node reference? hard-coded base address?) and use the register that
> rightfully belongs to it?

There is a possible DT binary compatibility here, although in that
particular case, that would not be a problem, but I was thinking more in
the lines of:

- keeping the current clock controller node's "reg" property with the
extra 8 bytes
- add an interrupt controller node with a re "reg" property that covers
these 8 bytes for AUX{IRQ,ENB} purposes

You could have a subsequent patch that removes the 8 extra bytes from
the clock controller node's at some point, but if we are guaranteed that
a) the clock controller does not exclusively manage this region, and b)
does not touch it, we are neither breaking DT binary compatibility, nor
are we introducing problems.

I don't think phandles or cross-node references of any kind would be
necessary here.
-- 
Florian
