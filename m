Return-Path: <linux+mturquette=baylibre.com@armlinux.org.uk>
Date: Thu, 27 Jul 2017 10:11:47 +0100
From: Russell King - ARM Linux <linux@armlinux.org.uk>
To: Sergej Sawazki <sergej@taudac.com>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Stephen Boyd <sboyd@codeaurora.org>, jacob@teenage.engineering,
	mturquette@baylibre.com, linux-clk@vger.kernel.org,
	Rabeeh Khoury <rabeeh@solid-run.com>
Subject: Re: [PATCH] clk: si5351: Apply PLL soft reset before enabling the
 outputs
Message-ID: <20170727091147.GA662@n2100.armlinux.org.uk>
References: <1501010261-7130-1-git-send-email-sergej@taudac.com>
 <20170726011112.GK2146@codeaurora.org>
 <5b9c2982-c376-ce39-e3aa-09c0feefd63c@gmail.com>
 <96cb94f5-1b00-70a4-4027-863b2f8e6ba4@taudac.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <96cb94f5-1b00-70a4-4027-863b2f8e6ba4@taudac.com>
Sender: Russell King - ARM Linux <linux@armlinux.org.uk>
List-ID: <linux-clk.vger.kernel.org>

On Thu, Jul 27, 2017 at 01:10:58AM +0200, Sergej Sawazki wrote:
> Am 26.07.2017 um 06:43 schrieb Sebastian Hesselbarth:
> > On 26.07.2017 03:11, Stephen Boyd wrote:
> >> On 07/25, Sergej Sawazki wrote:
> >>> The "Si5351A/B/C Data Sheet" states to apply a PLLA and PLLB soft reset
> >>> before enabling the outputs [1]. This is required to get a deterministic
> >>> phase relationship between the output clocks.
> >>>
> >>> Without the PLL reset, the phase offset beween the clocks is unpredictable.
> >>>
> >>> References:
> >>> [1] https://www.silabs.com/Support%20Documents/TechnicalDocs/Si5351-B.pdf
> >>>     Figure 12 ("I2C Programming Procedure")
> >>>
> >>> Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
> >>> Cc: Rabeeh Khoury <rabeeh@solid-run.com>
> >>> Signed-off-by: Sergej Sawazki <sergej@taudac.com>
> >>> ---
> >> This is similar to commit 6dc669a22c77 (clk: si5351: Add PLL soft
> >> reset, 2015-11-20)? But I think that commit was causing some
> >> problem for Russell King and there was going to be a patch to
> >> change it but nothing has materialized on the list. Unless this
> >> is that patch?
> > Sergej, Stephen,
> >
> > resetting both PLLs in this driver will not happen as it does have
> > an influence on the other PLL and all clocks on it.
> >
> > I understand that some of the functions of the clk gen will not be
> > available with this driver but it is not the use case of this driver.
> >
> > So, NAK on this one.
> >
> > The patch you are talking about is still pending but I think I just
> > send it in a few days.
> >
> > Sebastian
> 
> Sebastian, Stephen,
> 
> On my setup, the Si5351 provides audio bit and frame clocks. Without
> resetting the PLLs before enabling the output clocks the phase offset
> between the clocks is unpredictable, the clocks are not aligned, this
> corrupts the audio stream.
> 
> I agree, resetting both PLLs is not a good idea. Only one PLL should
> be resetted (the one that the output clocks are connected to).
> 
> I am not changing the rates, I am only enabling/disabling the outputs
> and changing the clkin source. So resetting the PLL in set_rate() does
> not help me.

However you may wish to do this, you must not do it in a way that
regresses other platforms.

In other words, if you need to reset both PLLs, and that disrupts
other platforms, resetting the PLLs needs to be configurable by
some mechanism, so the platforms that need it can have it, but
those that don't (and are positively harmed by it) need it can
remain unaffected.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
