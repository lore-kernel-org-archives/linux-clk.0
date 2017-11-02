Return-Path: <sboyd@codeaurora.org>
Date: Wed, 1 Nov 2017 23:40:31 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Ludovic Desroches <ludovic.desroches@microchip.com>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	boris.brezillon@free-electrons.com, mturquette@baylibre.com,
	nicolas.ferre@microchip.com, alexandre.belloni@free-electrons.com,
	inguin@gmx.de, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] clk: at91: utmi: set the mainck rate
Message-ID: <20171102064031.GC30645@codeaurora.org>
References: <20170906095159.13295-1-ludovic.desroches@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170906095159.13295-1-ludovic.desroches@microchip.com>
List-ID: <linux-clk.vger.kernel.org>

On 09/06, Ludovic Desroches wrote:
> By default, it is assumed that the UTMI clock is generated from a 12 MHz
> reference clock (MAINCK). If it's not the case, the FREQ field of the
> SFR_UTMICKTRIM has to be updated to generate the UTMI clock in the
> proper way.
> 
> The UTMI clock has a fixed rate of 480 MHz. In fact, there is no
> multiplier we can configure. The multiplier is managed internally,
> depending on the reference clock frequency, to achieve the target of
> 480 MHz.
> 
> Signed-off-by: Ludovic Desroches <ludovic.desroches@microchip.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
