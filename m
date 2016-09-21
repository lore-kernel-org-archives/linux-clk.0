Return-Path: <sboyd@codeaurora.org>
Date: Tue, 20 Sep 2016 17:04:20 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: Nicolas Ferre <nicolas.ferre@atmel.com>,
	Boris Brezillon <boris.brezillon@free-electrons.com>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 2/5] clk: at91: Add sama5d4 sckc support
Message-ID: <20160921000420.GI8319@codeaurora.org>
References: <20160920205833.19638-1-alexandre.belloni@free-electrons.com>
 <20160920205833.19638-3-alexandre.belloni@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20160920205833.19638-3-alexandre.belloni@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

On 09/20, Alexandre Belloni wrote:
> Starting with sama5d4, the crystal oscillator is always enabled at startup
> and the SCKC doesn't have an OSC32EN bit anymore.
> 
> Add support for that new controller.
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
