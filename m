Return-Path: <sboyd@codeaurora.org>
Date: Mon, 22 Jun 2015 15:48:00 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Mike Turquette <mturquette@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ian Campbell <ijc+devicetree@hellion.org.uk>,
	Kumar Gala <galak@codeaurora.org>,
	Russell King <linux@arm.linux.org.uk>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Kamil Lulko <rev13@wp.pl>, Andreas Farber <afaerber@suse.de>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	patches@linaro.org, linaro-kernel@lists.linaro.org
Subject: Re: [PATCH v3 2/3] clk: stm32: Add clock driver for STM32F4[23]xxx
 devices
Message-ID: <20150622224800.GH22132@codeaurora.org>
References: <1432327273-6810-1-git-send-email-daniel.thompson@linaro.org>
 <1433966978-24422-1-git-send-email-daniel.thompson@linaro.org>
 <1433966978-24422-3-git-send-email-daniel.thompson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1433966978-24422-3-git-send-email-daniel.thompson@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 06/10, Daniel Thompson wrote:
> The driver supports decoding and statically modelling PLL state (i.e.
> we inherit state from bootloader) and provides support for all
> peripherals that support simple one-bit gated clocks. The covers all
> peripherals whose clocks come from the AHB, APB1 or APB2 buses.
> 
> It has been tested on an STM32F429I-Discovery board. The clock counts
> for TIM2, USART1 and SYSTICK are all set correctly and the wall clock
> looks OK when checked with a stopwatch. I have also tested a prototype
> driver for the RNG hardware. The RNG clock is correctly enabled by the
> framework (also did inverse test and proved that by changing DT to
> configure the wrong clock bit then we observe the RNG driver to fail).
> 
> Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
> Reviewed-by: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
