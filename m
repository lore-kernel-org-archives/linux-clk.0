Return-Path: <sboyd@codeaurora.org>
Date: Fri, 26 Jan 2018 16:37:59 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Paul Cercueil <paul@crapouillou.net>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Jason Cooper <jason@lakedaemon.net>,
	Marc Zyngier <marc.zyngier@arm.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Lee Jones <lee.jones@linaro.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 7/9] clk: ingenic: Add JZ47xx TCU clocks driver
Message-ID: <20180127003759.GH28313@codeaurora.org>
References: <20180101143344.2099-1-paul@crapouillou.net>
 <20180110224838.16711-1-paul@crapouillou.net>
 <20180110224838.16711-7-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20180110224838.16711-7-paul@crapouillou.net>
List-ID: <linux-clk.vger.kernel.org>

On 01/10, Paul Cercueil wrote:
> The TCU (Timer Counter Unit) of the Ingenic JZ47xx SoCs features 8
> channels, each one having its own clock, that can be started and
> stopped, reparented, and reclocked.
> 
> This driver only modifies the bits of the registers of the TCU that are
> related to clocks control. It provides one clock per TCU channel (plus
> one for the watchdog and one for the OS timer) that can be used by other
> drivers.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---

Acked-by: Stephen Boyd <sboyd@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
