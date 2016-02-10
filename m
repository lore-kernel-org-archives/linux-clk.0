Return-Path: <rklein@nvidia.com>
Subject: Re: [PATCH] clk: clk_register: Correctly initialize enable_count
To: =?UTF-8?Q?Emilio_L=c3=b3pez?= <emilio@elopez.com.ar>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
References: <1455058120-7398-1-git-send-email-rklein@nvidia.com>
 <56BAA6D9.9090009@elopez.com.ar>
CC: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>
From: Rhyland Klein <rklein@nvidia.com>
Message-ID: <56BB82A8.8010701@nvidia.com>
Date: Wed, 10 Feb 2016 13:34:16 -0500
MIME-Version: 1.0
In-Reply-To: <56BAA6D9.9090009@elopez.com.ar>
Content-Type: text/plain; charset="windows-1252"
Return-Path: rklein@nvidia.com
List-ID: <linux-clk.vger.kernel.org>

On 2/9/2016 9:56 PM, Emilio L=F3pez wrote:
> Hi,
>=20
> El 09/02/16 a las 19:48, Rhyland Klein escribi=F3:
>> When clocks are registered, they could be enabled already in
>> hardware. As of now, the enable count will start at 0. When this
>> happens, it means a clock is enabled and the framework doesn't know
>> that, so it will always report it as disabled.
>=20
> Keep in mind that during the boot process, towards the end, unused
> clocks get disabled, so the state remains in sync. If suddenly the
> enable_count on unused clocks is not 0, this will break and unused
> clocks will remain on, wasting power.

Hmm, I had misread the logic in clk_disable_unused_subtree(), namely I
inverted the check on enable_count when I was looking at it. It does
seem like it would take care of the clocks I was referring to.

>=20
> http://lxr.free-electrons.com/source/drivers/clk/clk.c#L244
>=20
> What issue were you having that prompted you to write this patch?

I ran into the situation where a peripheral clock was enabled before the
kernel loaded, and I was trying to disable it in the clk-tegra210
driver. Calling clk_disable() won't work, as the clock doesn't have an
enable_count.

I do think that the clk_disable_unused_subtree() should pick up the
slack, but I was trying to disable it before the cleanup code to remove
unused clocks ran.

I think you are right and the clean up code should cover the situation I
was looking at.

Thanks.
-rhyland


--=20
nvpublic
