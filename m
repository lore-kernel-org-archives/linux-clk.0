Return-Path: <sboyd@codeaurora.org>
Date: Tue, 12 May 2015 15:31:26 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Joachim Eastwood <manabian@gmail.com>
Cc: mturquette@linaro.org, arnd@arndb.de, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	ariel.dalessandro@gmail.com, ezequiel@vanguardiasur.com.ar
Subject: Re: [PATCH v2 0/4] Clk drivers for NXP LPC18xx family
Message-ID: <20150512223126.GA14873@codeaurora.org>
References: <1430170693-28303-1-git-send-email-manabian@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1430170693-28303-1-git-send-email-manabian@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 04/27, Joachim Eastwood wrote:
> This patch set adds support for the two main clock peripherals in the
> LPC18xx/43xx MCU family.
> 
> The Clock Generation Unit (CGU) is the base source of all clocks. It has
> five external inputs and contains PLLs, dividers and muxes. The outputs
> from the CGU are then routed to a Clock Control Unit (CCU) and a few
> peripherals directly. There are two CCUs in the MCU. The CCU is a
> collection of gates and a few dividers that sits between the CGU and
> most of the peripherals.
> 
> Which clocks that are available depends on the specific device and it's
> peripherals. It's possible in DT to setup the routing between the CGU
> and the CCUs.

Is there any reason why this uses CLK_OF_DECLARE over the
platform device model? Typically we have CLK_OF_DECLARE for cases
where a provider needs to be up and running early during boot for
hardware that can't probe defer (i.e. timers, irq controllers).
Otherwise we should be able to use the standard linux device
model to probe clk providers. It looks like the clocksource is
using something from CCU, but perhaps CGU isn't "special" and
could be using device model.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
