Return-Path: <kernel@martin.sperl.org>
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
Subject: Re: [PATCH 3/6] clk: bcm2835: enable clocks that have been enabled by firmware
From: Martin Sperl <kernel@martin.sperl.org>
In-Reply-To: <87poutf1gv.fsf@eliezer.anholt.net>
Date: Thu, 17 Mar 2016 19:13:15 +0100
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>,
 Stephen Warren <swarren@wwwdotorg.org>,
 Lee Jones <lee@kernel.org>,
 linux-clk@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Message-Id: <19B78DCB-23E2-4600-ABF6-177AFACF159D@martin.sperl.org>
References: <1456745963-2403-1-git-send-email-kernel@martin.sperl.org> <1456745963-2403-4-git-send-email-kernel@martin.sperl.org> <87vb575ld9.fsf@eliezer.anholt.net> <87poutf1gv.fsf@eliezer.anholt.net>
To: Eric Anholt <eric@anholt.net>
List-ID: <linux-clk.vger.kernel.org>


> On 17.03.2016, at 18:39, Eric Anholt <eric@anholt.net> wrote:
>=20
> Eric Anholt <eric@anholt.net> writes:
>=20
>> kernel@martin.sperl.org writes:
>>=20
>>> From: Martin Sperl <kernel@martin.sperl.org>
>>>=20
>>> If a clock that has been enabled by the firmware gets disabled
>>> by a driver this may right now result in a crash of the system
>>> as then also the corresponding PLL_dividers as well as PLLs
>>> get disabled (if not used) - some of which are used by the
>>> VideoCore GPU (which also runs the firmware)
>>>=20
>>> This patch prepares/enables those clocks that have been
>>> configured by the firmware.
>>>=20
>>> Whenever the clock framework implements either
>>> CLK_IS_CRITICAL or HAND_OFF this can get changed to use this
>>> new mechanism.
>>>=20
>>> For this to be completely successful (i.e not missing a clock
>>> and subsequently a pll) it is recommended to add all the known
>>> clocks of the soc so that this can get applied to all clocks.
>>=20
>> I think this makes sense to have, for now at least.
>>=20
>> Reviewed-by: Eric Anholt <eric@anholt.net>
>=20
> Scratch that, this breaks display.  Since the clkgen clocks are =
flagged
> as needing to be gated in order to change dividers, it means you can't
> set clock rates for anything that was turned on at boot.

See that separate thread that triggered this:
  serial: clk: bcm2835: Strange effects when using aux-uart in console
and this patch fixes this issue.

To summarize the situation figured in the thread:
* you load the module

* you start using the tty (say by using "stty -F /dev/ttyAMA0")
* this opens the device
* this prepare the relevant clock (usage =3D 1)
* this prepares the parent pll-divider (usage =3D 1)
* this prepares the parent pll (usage =3D 1)

* you stop using the tty (stty closes the device)
* this release the clock
*   usage count drops to 0, so disable the clock
* this releases the parent pll-divider
*   usage count drops to 0, so disable the pll-div
* this releases the parent pll (and disables it as usage =3D 0)
*   usage count drops to 0, so disable the pll-div

* system crashes (with a bit of delay)

The prepare should just increase the usage so it never gets to a count =
of 0.

Maybe we need to use those "CLK_IS_CRITICAL=E2=80=9D =E2=80=9CHANDS_OFF=E2=
=80=9D flags instead?
(when/if they become available)

How do you want to solve that - I have not got a DSI display,=20
but HDMI continues to work...

Martin
