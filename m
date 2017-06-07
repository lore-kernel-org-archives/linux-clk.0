Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-qt0-f196.google.com ([209.85.216.196]:35924 "EHLO
        mail-qt0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751574AbdFGU63 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 7 Jun 2017 16:58:29 -0400
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
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <b3d5b3c1-a9ab-99bf-a1b2-3a1e4579c0ff@gmail.com>
Date: Wed, 7 Jun 2017 13:58:25 -0700
MIME-Version: 1.0
In-Reply-To: <6dc301c8-e5a2-1334-c476-1ce7e303787f@raspberrypi.org>
Content-Type: text/plain; charset=utf-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 06/07/2017 04:11 AM, Phil Elwell wrote:
> Devices in the AUX block share a common interrupt line, with a register
> indicating which devices have active IRQs. Expose this as a nested
> interrupt controller to avoid IRQ sharing problems (easily observed if
> UART1 and SPI1/2 are enabled simultaneously).
> 
> The interrupt functionality could arguably be forked off as a separate
> irqchip driver, but the clock driver has already claimed the AUX_IRQ
> register so some driver and DT surgery would still be required.
> Eric Anholt thought that including it here is reasonable, but I'm
> prepared to split it out if this is considered too hacky.

You probably remember your fix to the irqchip drive being flamed because
the irqchip driver was re-purposed as an ARM SMP secondary core bringup
method, maybe we can avoid doing the same mistake and having this a
separate interrupt controller be under drivers/irqchip/*?

Even if the clock driver already claims the AUX_IRQ register space, we
can still have an irqchip ioremap() the two register offsets that it
cares about (AUXIRQ, AUXENB) and just manage that 8 bytes worth of
register space. We just need to make sure that the clock driver really
does not touch those (why would it) and that there won't be any
conflicting request_mem_region() against the same register range.

Thanks!

> 
> Phil Elwell (2):
>   clk: bcm2835: Add AUX interrupt controller
>   ARM: dts: bcm283x: Enable AUX interrupt controller
> 
>  arch/arm/boot/dts/bcm283x.dtsi    |  12 +++-
>  drivers/clk/bcm/clk-bcm2835-aux.c | 120 ++++++++++++++++++++++++++++++++++++++
>  2 files changed, 129 insertions(+), 3 deletions(-)
> 


-- 
Florian
