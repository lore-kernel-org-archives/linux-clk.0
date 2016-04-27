Return-Path: <kernel@martin.sperl.org>
References: <1461660989-11846-1-git-send-email-kernel@martin.sperl.org> <8737q8dv5f.fsf@eliezer.anholt.net> <BC74AA10-C36C-4643-B979-0617D222D605@martin.sperl.org> <87bn4v6dou.fsf@eliezer.anholt.net>
Mime-Version: 1.0 (1.0)
In-Reply-To: <87bn4v6dou.fsf@eliezer.anholt.net>
Content-Type: text/plain;
	charset=us-ascii
Message-Id: <7BC21876-C9EF-489D-9F5A-06C7DD52F05C@martin.sperl.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>,
 Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>,
 linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
From: Martin Sperl <kernel@martin.sperl.org>
Subject: Re: [PATCH V2] clk: bcm2835: mark enabled pll_dividers as critical
Date: Wed, 27 Apr 2016 07:31:05 +0200
To: Eric Anholt <eric@anholt.net>
List-ID: <linux-clk.vger.kernel.org>



> On 27.04.2016, at 03:30, Eric Anholt <eric@anholt.net> wrote:
>=20
> Martin Sperl <kernel@martin.sperl.org> writes:
>=20
>> Sent from my iPad
>>> On 26.04.2016, at 21:31, Eric Anholt <eric@anholt.net> wrote:
>>>=20
>>> kernel@martin.sperl.org writes:
>>>=20
>>>> From: Martin Sperl <kernel@martin.sperl.org>
>>>>=20
>>>> The bcm2835 firmware enables several clocks and plls before
>>>> booting the linux kernel.
>>>>=20
>>>> These plls should never get disabled as it may result in a
>>>> stopped system clock and more.
>>>>=20
>>>> So during probing we check if the pll_divider is enabled
>>>> and if it is then mark that pll_divider as critical.
>>>> As a consequence this will also enable the corresponding parent pll.
>>>>=20
>>>> Here the list of pll_div that are marked as critical:
>>>> [    2.022437] bcm2835-clk 20101000.cprman: found enabled pll_div plla_=
core - marking it as critical
>>>> [    2.031640] bcm2835-clk 20101000.cprman: found enabled pll_div pllb_=
arm - marking it as critical
>>>> [    2.040966] bcm2835-clk 20101000.cprman: found enabled pll_div pllc_=
core0 - marking it as critical
>>>> [    2.050351] bcm2835-clk 20101000.cprman: found enabled pll_div pllc_=
per - marking it as critical
>>>> [    2.059427] bcm2835-clk 20101000.cprman: found enabled pll_div plld_=
core - marking it as critical
>>>> [    2.068590] bcm2835-clk 20101000.cprman: found enabled pll_div plld_=
per - marking it as critical
>>>> [    2.077724] bcm2835-clk 20101000.cprman: found enabled pll_div pllh_=
pix - marking it as critical
>>>=20
>>> Yeah, pllh_pix isn't critical, though.  We want it to get turned off
>>> when the driver asks to disable its clock, or we're going to just waste
>>> a pile of power.
>>>=20
>>> I'm sending out a patch that marks the VPU clock as critical (it's the
>>> also AXI bus, so it certainly is critical), which should solve your
>>> aux_uart clock disabling problem, I think.
>>=20
>> The problem is that it also fails on the pcm clock alone when pllc or=20
>> plld_per are used as parent, but it is fine when osc is used...
>=20
> For that you're going to want the HAND_OFF patches that mturquette is
> working on: Don't let the clock and its parents get turned off until a
> driver has shown up that has referenced the clock and done at least a
> prepare on it once.
That one was the one I thought of as well, but it does not solve the
issue at all, because:

Speaker-test opens the audio device for 32bit 41200 samples
Which in turn uses the i2s driver
Which enable_prepares the clock (uses pllc_per or plld_per)
Plays sound until the end
Then speaker test closes the audio device
Which disables/unprepared the PCM clock
Which disables/unprepares plld_per
Which disables/unprepares plld
Machine crashes

For those last few steps the handsoff still would release the
Pll-div and pll as it has been claimed correctly first.

Maybe handsoff would work if applied to the individual
Clocks (not the pll or pllc), but I am not sure if this is a correct
assumption, as I do not know if handsoff would propagate=20
up the clock tree.

So the critical flag seems the "best" approach for now,
But as you have said: it is not ideal as it never disables
Any clocks when they are not really needed.

But so that we can continue we need something=20
that works now (even if it is not perfect)

Another approach would be knowing the list of clocks=20
that the firmware claims/owns and mark only those as "critical".
