Return-Path: <maxime.ripard@free-electrons.com>
Date: Thu, 13 Apr 2017 09:02:09 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH 1/3] clk: sunxi-ng: Add clk notifier to gate then ungate
 PLL clocks
Message-ID: <20170413070209.kjpv27fqc4o4znqs@lukather>
References: <20170413021354.3258-1-wens@csie.org>
 <20170413021354.3258-2-wens@csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mzq73fufaks7ja5e"
In-Reply-To: <20170413021354.3258-2-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>


--mzq73fufaks7ja5e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Chen-Yu,

On Thu, Apr 13, 2017 at 10:13:52AM +0800, Chen-Yu Tsai wrote:
> In common PLL designs, changes to the dividers take effect almost
> immediately, while changes to the multipliers (implemented as
> dividers in the feedback loop) take a few cycles to work into
> the feedback loop for the PLL to stablize.
>=20
> Sometimes when the PLL clock rate is changed, the decrease in the
> divider is too much for the decrease in the multiplier to catch up.
> The PLL clock rate will spike, and in some cases, might lock up
> completely. This is especially the case if the divider changed is
> the pre-divider, which affects the reference frequency.
>=20
> This patch introduces a clk notifier callback that will gate and
> then ungate a clk after a rate change, effectively resetting it,
> so it continues to work, despite any possible lockups. Care must
> be taken to reparent any consumers to other temporary clocks during
> the rate change, and that this notifier callback must be the first
> to be registered.
>=20
> This is intended to fix occasional lockups with cpufreq on newer
> Allwinner SoCs, such as the A33 and the H3. Previously it was
> thought that reparenting the cpu clock away from the PLL while
> it stabilized was enough, as this worked quite well on the A31.
>=20
> On the A33, hangs have been observed after cpufreq was recently
> introduced. With the H3, a more thorough test [1] showed that
> reparenting alone isn't enough. The system still locks up unless
> the dividers are limited to 1.
>=20
> A hunch was if the PLL was stuck in some unknown state, perhaps
> gating then ungating it would bring it back to normal. Tests
> done by Icenowy Zheng using Ondrej's test firmware shows this
> to be a valid solution.
>=20
> [1] http://www.spinics.net/lists/arm-kernel/msg552501.html
>=20
> Reported-by: Ondrej Jirman <megous@megous.com>
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> Tested-by: Icenowy Zheng <icenowy@aosc.io>
> Tested-by: Quentin Schulz <quentin.schulz@free-electrons.com>

Thanks for looking into this, and coming up with a clean solution, and
a great commit log.

However, I wondering, isn't that notifier just a re-implementation of
CLK_SET_RATE_GATE?

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--mzq73fufaks7ja5e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJY7yJtAAoJEBx+YmzsjxAguywP/RAIcSAf2QJEd6XuQVBARkrr
foCkjDDi8k1ydeIakRDQQaFDY+SjZzG0LMgD9Lv2t+l4nZI5ni2ucFS3624fPFgK
rY58t/UvB+cJ8ska8s+apd2X8ozDlb8EYnJlacyrfBSyHz16dTQ0BHRvFEAkQcso
UxVzIAd/V+zJcyN7+7ARpGBHGL0AYYQ6ThBQIjYcwd7GrLDJi4fR/PKp9TzgN0j5
ViaudAPvediqEdDVXLMsEwFIC54C1S6sFxLwYZfbwL12+LzI2lbQXueu/tpU2zNj
rBUhuRwerAnLM3OoDiQT+cQVN/pDnK0fFUXJ2MdavgK9ql1kn0ipuS2I38HYJqk7
FfLvA2DwMMIt/5uBtLK9cMqxvtmOkOlhkWd2gmJD8JQozdXHig57X03rtXsT6bhM
lrMPuK+d+X779FNEr0R/aj8PNO2DsLEW6mLZmrdg7ShwGOyvQrI3AyKDLCWN++8b
iBk6Tbkt6jruayeMrOmg9J2xjebqZ/g/djSV0NQ0G184ejEBaISunZYvEM4iBBOu
a1qDMMIi9ecBZKzyFH1VEl6IpWuEy8uWhlr3283BxV8GqP4s4yArG9D7peuMUq5d
4NGXsUfWksL/Fxco384fMcZBy8D9g89zZ++alAbMPGtyjMZXdIL6iSMSyQERvXoo
MuJNdnXbyFHiixGwurhv
=LLDx
-----END PGP SIGNATURE-----

--mzq73fufaks7ja5e--
