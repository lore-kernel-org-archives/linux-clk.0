Return-Path: <sboyd@codeaurora.org>
Date: Thu, 25 Aug 2016 13:07:44 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>
Subject: Re: [PATCH 2/3 v2] clk: versatile/icst: add Integrator core module
 clocks
Message-ID: <20160825200744.GS19826@codeaurora.org>
References: <1471857574-13125-1-git-send-email-linus.walleij@linaro.org>
 <1471857574-13125-2-git-send-email-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1471857574-13125-2-git-send-email-linus.walleij@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 08/22, Linus Walleij wrote:
> The Integrator/AP and Integrator/CP have special derivatives
> of the ICST525 control registers, where some bits have been
> hardwired but others are possible to adjust, resulting in a
> control register that makes it possible to set an even,
> desired megahertz value.
> 
> The Integrator/AP and Integrator/CP have slightly different
> layout so we support them using different compatible
> strings.
> 
> After adding these clocks, the Integrator-specific cpufreq
> driver can be switched over to use the generic operating
> point device tree cpufreq driver.
> 
> Instead of simply writing a value to the oscillator control
> register we switch to the more elaborate method of providing
> a bitmask and use regmap_update_bits() to poke the right bits
> for the desired frequency, this is needed since these control
> registers sometimes control more than one clock.
> 
> Cc: Russell King <linux@armlinux.org.uk>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
