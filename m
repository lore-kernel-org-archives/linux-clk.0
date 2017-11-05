Return-Path: <mylene.josserand@free-electrons.com>
Date: Sun, 5 Nov 2017 17:37:26 +0100
From: Mylene JOSSERAND <mylene.josserand@free-electrons.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: maxime.ripard@free-electrons.com, wens@csie.org,
 mturquette@baylibre.com, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: sunxi-ng: a83t: Fix i2c buses bits
Message-ID: <20171105173726.7be83f08@dell-desktop.home>
In-Reply-To: <20171103151100.GR11011@codeaurora.org>
References: <20171103105747.26335-1-mylene.josserand@free-electrons.com>
	<20171103151100.GR11011@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hello,

Le Fri, 3 Nov 2017 08:11:00 -0700,
Stephen Boyd <sboyd@codeaurora.org> a =C3=A9crit :

> On 11/03, Myl=C3=A8ne Josserand wrote:
> > i2c1 and i2c2 bits for CCU are not bit 0 but bit 1 and bit 2.
> > Because of that, the i2c0 (bit 0) was not correctly configured.
> > Fixed the correct bits for i2c1 and i2c2.
> >=20
> > Signed-off-by: Myl=C3=A8ne Josserand
> > <mylene.josserand@free-electrons.com> --- =20
>=20
> Please add a Fixes tag.
>=20

Sure, I will resend the patch with a Fixes tag.

Thank you,

--=20
Myl=C3=A8ne Josserand, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
