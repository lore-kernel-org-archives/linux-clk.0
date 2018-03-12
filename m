Return-Path: <mturquette@baylibre.com>
Date: Sun, 11 Mar 2018 22:54:08 -0700
From: Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH v2 4/8] clk: migrate the count of orphaned clocks at init
To: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>, Jerome Brunet
	<jbrunet@baylibre.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>,
	Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>
References: <20180214134340.17242-1-jbrunet@baylibre.com>
	<20180214134340.17242-5-jbrunet@baylibre.com> <1970074.VYjjbDuVRv@diego>
In-Reply-To: <1970074.VYjjbDuVRv@diego>
MIME-Version: 1.0
Message-Id: <1520834013.z6bypcssbs.astroid@resonance.none>
Content-Type: text/plain; charset=utf-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>

Excerpts from Heiko St=C3=BCbner's message of February 15, 2018 1:01 pm:
> Am Mittwoch, 14. Februar 2018, 14:43:36 CET schrieb Jerome Brunet:
>> The orphan clocks reparents should migrate any existing count from the
>> orphan clock to its new acestor clocks, otherwise we may have
>> inconsistent counts in the tree and end-up with gated critical clocks
>>=20
>> Assuming we have two clocks, A and B.
>> * Clock A has CLK_IS_CRITICAL flag set.
>> * Clock B is an ancestor of A which can gate. Clock B gate is left
>>   enabled by the bootloader.
>>=20
>> Step 1: Clock A is registered. Since it is a critical clock, it is
>> enabled. The clock being still an orphan, no parent are enabled.
>>=20
>> Step 2: Clock B is registered and reparented to clock A (potentially
>> through several other clocks). We are now in situation where the enable
>> count of clock A is 1 while the enable count of its ancestors is 0, whic=
h
>> is not good.
>>=20
>> Step 3: in lateinit, clk_disable_unused() is called, the enable_count of
>> clock B being 0, clock B is gated and and critical clock A actually gets
>> disabled.
>>=20
>> This situation was found while adding fdiv_clk gates to the meson8b
>> platform.  These clocks parent clk81 critical clock, which is the mother
>> of all peripheral clocks in this system. Because of the issue described
>> here, the system is crashing when clk_disable_unused() is called.
>>=20
>> The situation is solved by reverting
>> commit f8f8f1d04494 ("clk: Don't touch hardware when reparenting during
>> registration"). To avoid breaking again the situation described in this
>> commit
>> description, enabling critical clock should be done before walking the
>> orphan list. This way, a parent critical clock may not be accidentally
>> disabled due to the CLK_OPS_PARENT_ENABLE mechanism.
>>=20
>> Fixes: f8f8f1d04494 ("clk: Don't touch hardware when reparenting during
>> registration") Cc: Stephen Boyd <sboyd@codeaurora.org>
>> Cc: Shawn Guo <shawnguo@kernel.org>
>> Cc: Dong Aisheng <aisheng.dong@nxp.com>
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>=20
> On a rk3288-veyron Chromebook
> Tested-by: Heiko Stuebner <heiko@sntech.de>
>=20
> This made the hdmi on the machine work again with 4.16-rc1 .
> (hdmi-cec clock is sourced from the i2c connected pmic which provides
> the 32kHz clock needed)
>=20
> So it would be really cool if this could make it into 4.16-rc :-)

I separated this patch out into clk-fixes to be set for -rc5 or -rc6.

Regards,
Mike

>=20
>=20
> Heiko
>=20
=
