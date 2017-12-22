Return-Path: <sboyd@codeaurora.org>
Date: Thu, 21 Dec 2017 16:34:12 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Romain Izard <romain.izard.pro@gmail.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Alexandre Belloni <alexandre.belloni@free-electrons.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 3/3] clk: at91: pmc: Support backup for programmable
 clocks
Message-ID: <20171222003412.GX7997@codeaurora.org>
References: <20171211165535.5126-1-romain.izard.pro@gmail.com>
 <20171211165535.5126-4-romain.izard.pro@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20171211165535.5126-4-romain.izard.pro@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 12/11, Romain Izard wrote:
> When an AT91 programmable clock is declared in the device tree, register
> it into the Power Management Controller driver. On entering suspend mode,
> the driver saves and restores the Programmable Clock registers to support
> the backup mode for these clocks.
> 
> Signed-off-by: Romain Izard <romain.izard.pro@gmail.com>
> Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
