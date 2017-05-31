Return-Path: <stefan.wahren@i2se.com>
Subject: Re: [PATCH v2 0/2] clk: bcm2835: PCM clock improvements
To: Phil Elwell <phil@raspberrypi.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, Eric Anholt <eric@anholt.net>,
 Florian Fainelli <f.fainelli@gmail.com>, linux-clk@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <4c11ad43-ef4e-3fbd-500a-02b2b46e0fbd@raspberrypi.org>
 <c44d1f29-4ec6-6b87-59a4-71aeb1f5c4d7@raspberrypi.org>
From: Stefan Wahren <stefan.wahren@i2se.com>
Message-ID: <d9c1303d-a170-bb83-f9a9-94f201e4ac2c@i2se.com>
Date: Wed, 31 May 2017 16:58:01 +0200
MIME-Version: 1.0
In-Reply-To: <c44d1f29-4ec6-6b87-59a4-71aeb1f5c4d7@raspberrypi.org>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

Am 31.05.2017 um 11:18 schrieb Phil Elwell:
> The switch to using the upstream bcm2835_cprman clock driver caused a
> few problems for users of PCM (I2S) peripherals. Audio applications
> require accurate, stable clocks, and the cprman driver wasn't
> conservative enough in its choice of clock sources.
>
> These patches restrict the clock sources for the PCM peripheral in two
> ways: the first causes all possible sources except OSC and PLLD_PER
> to be ignored, while the second allows clocks to be specified as
> "low_jitter", causing the effects of fractional divisors to be taken
> into account when comparing potential clocks for accuracy. In practice,
> the combined effect of the two patches is to choose OSC as a source if
> an integer divisor can be used, otherwise PLLD_PER is chosen.
>
> Changes in v2:
> * Extended bcm2835_pcm_per_parents to cover the pllh_aux slot, and gave
>   it a comment in patch 1.
> * Added a REGISTER_PCM_CLK analagous to REGISTER_PER_CLK in patch 1.
> * Renamed temporary variable idiv to int_div in patch 2.
>
> Phil Elwell (2):
>   clk: bcm2835: Limit PCM clock to OSC and PLLD_PER
>   clk: bcm2835: Minimise clock jitter for PCM clock
>
>  drivers/clk/bcm/clk-bcm2835.c | 50 ++++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 45 insertions(+), 5 deletions(-)
>
For the whole series:

Acked-by: Stefan Wahren <stefan.wahren@i2se.com>

I hope Eric as the author of the driver has a chance to look over the
patches.

Stefan
