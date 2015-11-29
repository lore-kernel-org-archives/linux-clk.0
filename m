Return-Path: <repk@triplefau.lt>
Date: Sun, 29 Nov 2015 23:25:49 +0100
From: Remi Pommarel <repk@triplefau.lt>
To: Stefan Wahren <info@lategoodbye.de>
Cc: Eric Anholt <eric@anholt.net>, Lee Jones <lee@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-rpi-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bart Tanghe <bart.tanghe@thomasmore.be>
Subject: Re: [PATCH v2 0/3] Add PWM clock support for bcm2835
Message-ID: <20151129222549.GI491@cruxbox>
References: <1447251765-16297-1-git-send-email-repk@triplefau.lt>
 <565A13F7.3020905@lategoodbye.de>
 <20151129003121.GH491@cruxbox>
 <565B6CA0.2070702@lategoodbye.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <565B6CA0.2070702@lategoodbye.de>
List-ID: <linux-clk.vger.kernel.org>

On Sun, Nov 29, 2015 at 10:22:40PM +0100, Stefan Wahren wrote:
> Hi Remi,
> 
> Am 29.11.2015 um 01:31 schrieb Remi Pommarel:
> >Hi Stefan,
> >
> >On Sat, Nov 28, 2015 at 09:52:07PM +0100, Stefan Wahren wrote:
> >>i applied the series including the devicetree modification, but it
> >>doesn't work for me.
> >>
> >>First of all i get an ugly division by zero warning from the pwm
> >>driver. The pwm driver still assume a fixed clock and doesn't handle
> >>the error cases of clk_get_rate(). I attached a patch at the end.
> >
> >Yes the devicetree patch from patchset version one does not work with
> >this version.
> 
> thanks. I successfully tested the pwm with the led pwm driver.
> 

Good news, thank you.

> >I haven't sent the modified devicetree because Eric said
> >it is better to send it in a separate patchset. If you want to test it I
> >attached the working devicetree patch at the end.
> 
> I don't think that he said that. He wanted you to send the
> devicetree changes as a separate patch. So it should be okay if it's
> part of the same patchset.
> 

I could have misunderstood him, sorry about that. I will send a
devicetree separated patch with the next version if Eric agrees with the
GENMASK logic used in my first patch.

Best Regards,

-- 
Remi
