Return-Path: <rklein@nvidia.com>
Subject: Re: [PATCH] clk: clk_register: Correctly initialize enable_count
To: Michael Turquette <mturquette@baylibre.com>, =?UTF-8?Q?Emilio_L=c3=b3pez?=
	<emilio@elopez.com.ar>, Stephen Boyd <sboyd@codeaurora.org>
References: <1455058120-7398-1-git-send-email-rklein@nvidia.com>
 <56BAA6D9.9090009@elopez.com.ar> <56BB82A8.8010701@nvidia.com>
 <20160211213247.26445.28956@quark.deferred.io>
CC: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>
From: Rhyland Klein <rklein@nvidia.com>
Message-ID: <56BD03F6.1050907@nvidia.com>
Date: Thu, 11 Feb 2016 16:58:14 -0500
MIME-Version: 1.0
In-Reply-To: <20160211213247.26445.28956@quark.deferred.io>
Content-Type: text/plain; charset="utf-8"
Return-Path: rklein@nvidia.com
List-ID: <linux-clk.vger.kernel.org>

On 2/11/2016 4:32 PM, Michael Turquette wrote:
> Quoting Rhyland Klein (2016-02-10 10:34:16)
>> On 2/9/2016 9:56 PM, Emilio L=C3=B3pez wrote:
>>> Hi,
>>>
>>> El 09/02/16 a las 19:48, Rhyland Klein escribi=C3=B3:
>>>> When clocks are registered, they could be enabled already in
>>>> hardware. As of now, the enable count will start at 0. When this
>>>> happens, it means a clock is enabled and the framework doesn't know
>>>> that, so it will always report it as disabled.
...
>=20
> clk_disable_unused() handles the case where spurious clocks were left
> enabled by the bootloader and need to be gated. This sounds like the
> only thing you were after.
>=20
> We also have a case where clocks are gated by clk_disable_unused()
> because no driver has claimed them yet, but we really want those clocks
> to be left enabled. For example, clocks supplying DDR & CPU shouldn't be
> cut, ever. Alternatively, your bootloader put something on the display
> but your display controller module hasn't loaded yet. Cutting the clock
> isn't fatal but causes unnecessary screen flicker because the module has
> not loaded up.
>=20
> To solve those sets of problems there is the critical clocks and handoff
> clocks thread[0].
>=20
> [0] http://lkml.kernel.org/r/<1455225554-13267-1-git-send-email-mturquett=
e@baylibre.com>
>=20
> Best regards,
> Mike
>=20

Thanks. I agree the clk_disable_unused should clear up the situation I
was in. And the critical clocks and handoff logic should be useful. I am
sure we can make use of it once its in for Tegra support.

-rhyland

--=20
nvpublic
