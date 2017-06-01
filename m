Return-Path: <stefan.wahren@i2se.com>
Date: Thu, 1 Jun 2017 11:36:53 +0200 (CEST)
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Phil Elwell <phil@raspberrypi.org>, linux-clk@vger.kernel.org,
	Eric Anholt <eric@anholt.net>, linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	linux-rpi-kernel@lists.infradead.org
Message-ID: <215281225.100959.1496309813326@email.1und1.de>
In-Reply-To: <c6708407-597a-0b08-d992-3bc4852118ec@raspberrypi.org>
References: <c6708407-597a-0b08-d992-3bc4852118ec@raspberrypi.org>
Subject: Re: [PATCH v3 0/2] clk: bcm2835: PCM clock improvements
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

> Phil Elwell <phil@raspberrypi.org> hat am 1. Juni 2017 um 11:10 geschrieben:
> 
> 
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
> Changes in v3:
> * Elimination of temporary variable from patch 2.

Acked-by: Stefan Wahren <stefan.wahren@i2se.com>

still applies to the complete series
