Return-Path: <broonie@sirena.org.uk>
Date: Fri, 15 Jul 2016 13:56:43 +0100
From: Mark Brown <broonie@kernel.org>
To: njaigane@codeaurora.org
Cc: linux-arm-msm@vger.kernel.org, linux@qca.qualcomm.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	twp@codeaurora.org, andy.gross@linaro.org, david.brown@linaro.org,
	robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com,
	ijc+devicetree@hellion.org.uk, galak@codeaurora.org,
	linux@armlinux.org.uk, mturquette@baylibre.com,
	sboyd@codeaurora.org, linus.walleij@linaro.org, plai@codeaurora.org,
	bgoswami@codeaurora.org, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, bjorn.andersson@linaro.org, varada@codeaurora.org,
	pradeepb@codeaurora.org, snlakshm@codeaurora.org,
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
	alsa-devel@alsa-project.org, bselvara@codeaurora.org
Message-ID: <20160715125643.GK30372@sirena.org.uk>
References: <1468566426-19598-1-git-send-email-njaigane@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rwbb4r/vLufKlfJs"
In-Reply-To: <1468566426-19598-1-git-send-email-njaigane@codeaurora.org>
Subject: Re: [PATCH 0/4] Qualcomm IPQ4019 Audio driver addition
List-ID: <linux-clk.vger.kernel.org>


--rwbb4r/vLufKlfJs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 15, 2016 at 12:37:02PM +0530, njaigane@codeaurora.org wrote:
> From: Jaiganesh Narayanan <njaigane@codeaurora.org>
>=20
> These patches add the support for Qualcomm IPQ4019 ASoC
> with the ALSA based audio drivers. The patches are broken
>=20
> 1. Device Tree support
> 2. Audio clock driver support
> 3. TLMM / Pinctrl support
> 4. ALSA based audio drivers

You need to completely rework how you're posting this so it can be
reviewed, probably splitting it into separate patch serieses - please
see SubmittingPatches for an overview of what people are expecting, and
as I said in reply to one of the patches looking at git can also be
helpful.  I'd suggest sending the drivers for each subsystem as a
separate patch series, there will be some interdependency in terms of
getting things running but not in terms of getting the patches applied.

--rwbb4r/vLufKlfJs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXiN2LAAoJECTWi3JdVIfQ3JIH/37/lIH1kHbO9kE/nWm3km1l
nvCEq8vPeuzcb09Q7knbhU16bcLq2UMmCwsjWBON+RGdr6QI+JNVIEt2Perk3KZF
cxZb3ULPRxMOetxrVfngyhTWWmiyvHEqXpV2zqUTU7ed4B3KvITPvIh4AOqUIhYT
HDURwkORAzl6VFVtmQ7NlqvODlEWIMTZJBzmO/3acavW5GQ55W93G/AR8zCYSWQZ
62khTWrCG4Hz/KBq/ROYMv22Tk+o9Tv2V1V+q9SjMWrWBFlbHKr8p0eVrAqG3M1q
1HxJnwHfrYu1ktJfQc75PIHgwtVP7wqDjpE4vcp528TfeNj8Z0Q+y5MiYCbo+HA=
=kxnM
-----END PGP SIGNATURE-----

--rwbb4r/vLufKlfJs--
