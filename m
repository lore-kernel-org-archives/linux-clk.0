Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Tue, 18 Aug 2015 17:58:54 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	sboyd@codeaurora.org, lee.jones@linaro.org, s.hauer@pengutronix.de,
	geert@linux-m68k.org
Subject: Re: [PATCH RFC RFT 3/3] clk: introduce CLK_ENABLE_HAND_OFF flag
Message-ID: <20150818155854.GK2547@lukather>
References: <1438974570-20812-1-git-send-email-mturquette@baylibre.com>
 <1438974570-20812-4-git-send-email-mturquette@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="45wMVEkw4XUbiYON"
In-Reply-To: <1438974570-20812-4-git-send-email-mturquette@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--45wMVEkw4XUbiYON
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mike,

On Fri, Aug 07, 2015 at 12:09:30PM -0700, Michael Turquette wrote:
> Some clocks are critical to system operation (e.g. cpu, memory, etc) and
> should not be gated until a driver that knows best claims such a clock
> and expressly gates that clock through the normal clk.h api.
>=20
> The typical way to handle this is for the clk driver or some other early
> code to call clk_prepare_enable on this important clock as soon as it is
> registered and before the clk_disable_unused garbage collector kicks in.
>=20
> This patch introduces a formal way to handle this scenario that is
> provided by the clk framework. Clk driver authors can set the
> CLK_ENABLE_HAND_OFF flag in their clk data, which will cause the clk to
> be enabled in clk_register(). Then when the first clk consumer driver
> comes along and calls clk_get() & clk_prepare_enable(), the reference
> counts taken during clk registration are transfered (or handed off) to
> the clk consumer.
>=20
> At this point handling the clk is the same as any other clock which as
> not set the new CLK_ENABLE_HAND_OFF flag. In fact no changes to any
> clock consumer driver are needed for this to work.

This looks fine, the only thing I'm not really fond of is the name of
the flag itself (and it's usually a good thing when we come to that
kind of bikeshedding).

In my mind, the fact that we hand off the clock reference is a direct
result to the clock being critical (or whatever name we want to call
it). The hand off is a side effect, but the real information we want
to carry is that it should not be gated.

And then the framework will know what behaviour it want to have based
on that information.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--45wMVEkw4XUbiYON
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJV01Y+AAoJEBx+YmzsjxAg9QEP+wXnwZcHp2R9+ljT0yksn6ub
RknuxSJk5mW2FhR6JHMREOjFH2r/6ajD+I4DIAG0+F9JWehDsbFsrB2hzVt/fipq
QWK96Jed8jhpEz36Wx/Vx4oIBjRb/QCiriVKsvFLu5mHRZunly+nx0BxB4RNQffK
Mbm75qFqTW4dCfVnd6JSCF+AAqLhj1gtPlY5Rrd73KMeNAmDpYhxJKZFK7yX3NTb
w4HyuyvGMJvBWXILufuw1ZsFct+HhhICfwEpWUe6kcVJksESELRVv2yjRjZZjZvO
QsLpTZsBsG8iJi46psYn8pQIRk93BEuJhMowWIoWoiiRBzah1xVUHive74P+hFe5
3l6fpLwLBo3vlb0sHQEsYj516z5L5z/CAiNbv6Zdd/FlHGoNcB484tkynNPjNJXB
vGG/ZL5v9s7/pTzewHs1zrNnqe8tnKQZsjoqVgwog6lYSKqJwD5kL6M/xekRuHiB
mLEjjhjpQZb2vzpnWdN52d6bn/OkTBz5pCMq11bCngC7US15JyIPmeyOWQ7gPdio
M9VEupx8GBeMtYGA1qnDurGMqsHotuPiBlHGEdnyKnmO0fD/TaUy23syLjq6kKYV
+cZawsX9E478c3nLE7FMCB2mVpzuaEvf2lgeQ0y+XJWdaBoDFrqQp2ssMPVmkWPu
aE2UpERd8pG3/vFuo79i
=GtIw
-----END PGP SIGNATURE-----

--45wMVEkw4XUbiYON--
