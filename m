Return-Path: <kernel@martin.sperl.org>
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
Subject: Re: [PATCH 5/6] clk: bcm2835: correctly enable fractional clock support
From: Martin Sperl <kernel@martin.sperl.org>
In-Reply-To: <87mvqj5k9r.fsf@eliezer.anholt.net>
Date: Mon, 29 Feb 2016 22:59:43 +0100
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>,
 Stephen Warren <swarren@wwwdotorg.org>,
 Lee Jones <lee@kernel.org>,
 linux-clk@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Message-Id: <0ED2FB7F-B112-487B-B222-08E5FAEE27F9@martin.sperl.org>
References: <1456745963-2403-1-git-send-email-kernel@martin.sperl.org> <1456745963-2403-6-git-send-email-kernel@martin.sperl.org> <87mvqj5k9r.fsf@eliezer.anholt.net>
To: Eric Anholt <eric@anholt.net>
List-ID: <linux-clk.vger.kernel.org>


> On 29.02.2016, at 21:33, Eric Anholt <eric@anholt.net> wrote:
>=20
> kernel@martin.sperl.org writes:
>=20
>> From: Martin Sperl <kernel@martin.sperl.org>
>>=20
>> The current driver calculates the clock divider with
>> fractional support enabled.
>>=20
>> But it does not enable fractional support in the
>> control register itself resulting in an integer only divider,
>> but in clk_set_rate responds back the fractionally divided
>> clock frequency.
>>=20
>> This patch enables fractional support in the control register
>> whenever there is a fractional bit set in the requested clock =
divider.
>>=20
>> Mash clock limits are are also handled for the PWM clock
>> applying the correct divider limits (2 and max_int) applicable to
>> basic fractional divider support (mash order of 1).
>>=20
>> It also adds locking to protect the read/modify/write cycle of
>> the register modification.
>>=20
>> Fixes: 41691b8862e2 ("clk: bcm2835: Add support for programming the
>> audio domain clocks")
>>=20
>> Signed-off-by: Martin Sperl <kernel@martin.sperl.org>
>=20
> Rewrite of the commit message:
>=20
> The driver has been using fractional dividers for all clocks with
> fractional bits.  However, MASH clocks (those used to drive audio) =
only
> do fractional division when in MASH mode, which is used to push clock
> jitter out of the audio band.  The PWM clock (used to drive i2s audio)
> is the only MASH clock currently enabled in the driver.
>=20
> Additional MASH modes are available that widen the frequency range, =
but
> only 1-level MASH is used for now, until we characterize some better
> policy.
>=20
> Fixes: 41691b8862e2 ("clk: bcm2835: Add support for programming the
> audio domain clocks=E2=80=9D)

That is not 100% true - non mash modes have CM_FRAC and CM_FRAC =3D =
CM_MASH0
so these map each other

And for a non-mash clock if CM_FRAC is not set then the factual divider
support is not used and only the integer portion is used.
This results in a frequency that is to high (as the frac bits are =
missing).

Just to giv an example of firmware set clock for the timer:
root@raspcm:~# head /sys/kernel/debug/clk/timer/current_*
=3D=3D> /sys/kernel/debug/clk/timer/current_divf <=3D=3D
819

=3D=3D> /sys/kernel/debug/clk/timer/current_divi <=3D=3D
19

=3D=3D> /sys/kernel/debug/clk/timer/current_frac <=3D=3D
1

=3D=3D> /sys/kernel/debug/clk/timer/current_parent <=3D=3D
xosc

root@raspcm:~# head /sys/kernel/debug/clk/timer/regdump
ctl =3D 0x00000291
div =3D 0x00013333

So this - non mash - clock has frac set by default
and this clock is set up by the firmware!

Similar things for: hsm and uart - all of them are =E2=80=9Cnormal=E2=80=9D=

clocks and they have the CM_FRAC bit set and divf > 0.

So the code essentially sets:
* CM_FRAC for =E2=80=9Cnormal=E2=80=9D clocks
* CM_MASH0 for mash clocks
when the divider has a fract component.

So I believe my description is correct.

But anyway: except for the pcm clocks clk_set_rate
is not really being used right now, as we still consume
the clocks set up by the firmware.

The comment portion about mash-order=3D1 could probably get added.

As for enabling higher order mash modes - at least in the audio
domain using I2S I have done some interresting measurements
making use of all the variations (and clock selections).

The result there was that - at least with the DAC that I=20
am using - the noise level varies widely between
different mash modes and clock dividers.

So the =E2=80=9Clowest=E2=80=9D noise showed the following combinations:
osc-mash3
pllc-mash2
osc-mash1
osc-non-frac (optimized so that we may use integer divider)
osc-mash2
pllc-mash1
pllc-mash3

So the "selection=E2=80=9D of clocks/divider/mash is really requiring
fine tuning and measurement - because there is no real pattern
visible.

Here a graph showing the audio spectrum for the different
modes with a 400Hz signal:
=
https://cloud.githubusercontent.com/assets/2638784/13278003/20e09002-dacd-=
11e5-8d62-17eb7118a4fa.jpg

>=20
> This is just the low bit of the 2-bit CM_MASH field at 9:10.  So =
you're
> enabling MASH mode 1 in this patch.  Similarly, the subject of the =
patch
> should be something like "Fix MASH-based fractional clock support for
> PWM" since all the other clocks work with fractional already.
>=20

As explained above: no they do not work without setting the FRAC bit!

Take again the example of timer:
when not using FRAC you get a timer clock of:
1010526Hz while with FRAC you get 1000002 Hz

So you NEED to set FRAC for all.
>>=20
>>=20
>> +	ctl =3D cprman_read(cprman, data->ctl_reg) & ~CM_FRAC;
>> +	ctl |=3D (div & CM_DIV_FRAC_MASK) ? CM_FRAC : 0;
>> +	cprman_write(cprman, data->ctl_reg, ctl);
>=20
> This should all be under "if (data->is_mash_clock) {}" since it =
doesn't
> do anything on non-mash clocks.
Again: without CM_FRAC you get a frequency that is too high, so it
needs to be implemented for all - independent of if it is a mash clock
or a FRAC clock.
The only cases where it does not apply is for clocks that have no fract
bits at all.
