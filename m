Return-Path: <sboyd@codeaurora.org>
Date: Wed, 14 Sep 2016 17:46:42 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: Nicolas Ferre <nicolas.ferre@atmel.com>,
	Boris Brezillon <boris.brezillon@free-electrons.com>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 0/5] AT91: sckc improvements
Message-ID: <20160915004642.GL7243@codeaurora.org>
References: <20160908145146.20422-1-alexandre.belloni@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20160908145146.20422-1-alexandre.belloni@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

On 09/08, Alexandre Belloni wrote:
> Hi,
> 
> This patch set improves the slow clock controller driver.
> 
> The first patch simply moves some code around to avoid having extern
> functions declared.
> 
> The second patch adds support for the SCKC found on sama5d4 and later.
> It is notably missing the OSC32EN bit.
> The third and fourth patches make use of this new driver (DT ABI is not
> broken \o/)
> 
> Finally, there is an optimization. Trying to find wether the slow
> oscillator is already stable to avoid waiting 1.2s twice in the boot
> process.

clk patches look ok. We'll need to move this to use clk_hw
registration based APIs some time, but that isn't critical to
handle now. Will you resend?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
