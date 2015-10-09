Return-Path: <swarren@wwwdotorg.org>
Subject: Re: [PATCH v7] clk: bcm2835: Add support for programming the audio
 domain clocks
To: Eric Anholt <eric@anholt.net>
References: <1444354644-31997-1-git-send-email-eric@anholt.net>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Lee Jones <lee@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>,
 Mike Turquette <mturquette@baylibre.com>
From: Stephen Warren <swarren@wwwdotorg.org>
Message-ID: <561720F9.1080206@wwwdotorg.org>
Date: Thu, 8 Oct 2015 20:05:45 -0600
MIME-Version: 1.0
In-Reply-To: <1444354644-31997-1-git-send-email-eric@anholt.net>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

On 10/08/2015 07:37 PM, Eric Anholt wrote:
> This adds support for enabling, disabling, and setting the rate of the
> audio domain clocks.  It will be necessary for setting the pixel clock
> for HDMI in the VC4 driver and let us write a cpufreq driver.  It will
> also improve compatibility with user changes to the firmware's
> config.txt, since our previous fixed clocks are unaware of it.
> 
> The firmware also has support for configuring the clocks through the
> mailbox channel, but the pixel clock setup by the firmware doesn't
> work, and it's Raspberry Pi specific anyway.  The only conflicts we
> should have with the firmware would be if we made firmware calls that
> result in clock management (like opening firmware V3D or ISP access,
> which we don't support in upstream), or on hardware over-thermal or
> under-voltage (when the firmware would rewrite PLLB to take the ARM
> out of overclock).  If that happens, our cached .recalc_rate() results
> would be incorrect, but that's no worse than our current state where
> we used fixed clocks.
> 
> The existing fixed clocks in the code are left in place to provide
> backwards compatibility with old device tree files.

Acked-by: Stephen Warren <swarren@wwwdotorg.org>
