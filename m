Return-Path: <moinejf@free.fr>
Date: Fri, 1 May 2015 11:14:06 +0200
From: Jean-Francois Moine <moinejf@free.fr>
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Mike Turquette <mturquette@linaro.org>, Stephen Boyd
 <sboyd@codeaurora.org>, Michael Welling <mwelling@ieee.org>, Russell King
 <rmk+linux@arm.linux.org.uk>, Jason Cooper <jason@lakedaemon.net>, Andrew
 Lunn <andrew@lunn.ch>, Gregory Clement
 <gregory.clement@free-electrons.com>, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] clk: si5351: Some fixes
Message-ID: <20150501111406.0aa23c7b@armhf>
In-Reply-To: <1430415954-29517-1-git-send-email-sebastian.hesselbarth@gmail.com>
References: <1430415954-29517-1-git-send-email-sebastian.hesselbarth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Thu, 30 Apr 2015 19:45:50 +0200
Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com> wrote:

> For Si5351 clock driver, Michael Welling and Jean-Francois Moine reported
> issues with recent v4.x kernels due to broken/missing/wrong parent clock
> claming. This patch set now deals with the issues reported.
>=20
> Patch 1 amends the binding documentation mention clock-names property
> for the "xtal" and "clkin" parent clock inputs of Si5351 variants.
>=20
> Patch 2 adds the clock-names property for the SolidRun CuBox using Si5351
> with a fixed oscillator connected to "xtal" input.
>=20
> Patch 3 reworks the way we claim parent clocks by using devm_clk_get()
> for both DT and platform_data based registration. Also, properly check
> for errors returned by devm_clk_get() and prepare/enable the parent clock=
s.
>=20
> Patch 4 introduces a function to reset PLLs on rate change. This should
> improve generated clock output stability. I currently have no scope at ha=
nd
> to actually test that properly, so there may be more issues remaining.
>=20
> @Michael, Jean-Francois: Please test and report if there are still
> issues remaining.

I applied the patches 2 and 3, and the audio and video in the Cubox
work fine again. Thanks.

--=20
Ken ar c'henta=C3=B1	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/
