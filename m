Return-Path: <sboyd@codeaurora.org>
Date: Mon, 19 Sep 2016 12:23:34 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Michael Turquette <mturquette@baylibre.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Wim Van Sebroeck <wim@iguana.be>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-watchdog@vger.kernel.org,
	Russell King <rmk+kernel@armlinux.org.uk>
Subject: Re: [PATCH 1/4] clk: pxa25x: OSTIMER0 clocks from the main oscillator
Message-ID: <20160919192334.GF7243@codeaurora.org>
References: <1474312335-20997-1-git-send-email-robert.jarzmik@free.fr>
 <1474312335-20997-2-git-send-email-robert.jarzmik@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1474312335-20997-2-git-send-email-robert.jarzmik@free.fr>
List-ID: <linux-clk.vger.kernel.org>

On 09/19, Robert Jarzmik wrote:
> From: Russell King - ARM Linux <linux@armlinux.org.uk>
> 
> The OSTIMER0 clock ticks at the main oscillator rate, not the 32kHz
> oscillator rate.  Ensure that it is parented to the main oscillator.
> 
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
> Tested-by: Robert Jarzmik <robert.jarzmik@free.fr>
> ---

Acked-by: Stephen Boyd <sboyd@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
