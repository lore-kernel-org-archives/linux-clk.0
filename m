Return-Path: <maxime.ripard@free-electrons.com>
Date: Tue, 17 Jan 2017 17:49:04 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: =?iso-8859-1?Q?Myl=E8ne?= Josserand <mylene.josserand@free-electrons.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
	wens@csie.org, mturquette@baylibre.com, sboyd@codeaurora.org,
	mark.rutland@arm.com, robh+dt@kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org, linux-sunxi@googlegroups.com,
	thomas.petazzoni@free-electrons.com,
	alexandre.belloni@free-electrons.com
Subject: Re: [PATCH v2 06/10] ASoC: sun8i-codec-analog: Add amplifier event
 to fix first delay
Message-ID: <20170117164904.c22f7tmtu67l23dd@lukather>
References: <20170117140230.23142-1-mylene.josserand@free-electrons.com>
 <20170117140230.23142-7-mylene.josserand@free-electrons.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sh5nscmqg2dbm6ci"
In-Reply-To: <20170117140230.23142-7-mylene.josserand@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>


--sh5nscmqg2dbm6ci
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 17, 2017 at 03:02:26PM +0100, Myl=E8ne Josserand wrote:
> When playing a sound for the first time, a short delay, where the audio
> file is not played, can be noticed.
> On a second play (right after), the sound is played correctly.
> If we wait a short time (~5 sec which corresponds to the aplay
> timeout), the delay is back.
>=20
> This patch fixes it by using an event on headphone amplifier.
> It allows to keep the amplifier enable while playing a sound.
> A delay of 700ms allows to wait that the amplifier is powered-up
> before playing the sound.
>=20
> Signed-off-by: Myl=E8ne Josserand <mylene.josserand@free-electrons.com>

Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--sh5nscmqg2dbm6ci
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYfksAAAoJEBx+YmzsjxAgmvcP/iyTTH7UECcmmXmjr8IurRLT
wziep6YhieePCllWYnYj97xEfXsQ2h6ydb7Iiwfy82vCCZL9+KV/qmMIYEPZDMZu
22cJa304UchxUFiYRyEBEvnU8UqC59m7T7KnSK3XWnFfil3zWcMbAhf43n+Yn2C2
imd/fsl1hpEV5GMpGV4qh63OKNrBiQrgNPEBf/qFE8rXe58iAbkN46J73hA8NBaf
eyp59QmRGD0ISKODuZX7StX6Pw/LL27OXV27LUxsYCMiFZVdY4M+AODabZZkwAB1
4DT2l4Cnhrat5JsTAma02w6Q1qD1Q/I9nO6g2WiKtr6a8Ua7OxuYnFHpjIDLBqKV
+RPNRaGIF5e49y5r4RyZEwfsqQm3TfOdFBGmvtMOnJgaFUm9Z2QdTUMb4Y8HakEL
yDd/2iyfG+6tyPBRWZ7t3/pCNxHKYzpIqlsD0twFO6y2l8OIeQKLSTYdYLlWwx50
qJaAJ2dCFjSt+OVSn8dgWESp3RskuvDrdZVGHOLnTqA51ciIPPVDDv2df/aS+j2Q
E49QuRk2BodC048+jrD/lbLjJaBtx2onbP2tnFXrcfUSqVcdaiY2BeW1naQLC77J
JpDuhCa/uc3MtH90l62ABOduq6ustoQPJgBRJOdB/emJYgwh0D/Git9Wm8RItMP+
egdkzqfxBHhsz2Uxa69V
=nhSU
-----END PGP SIGNATURE-----

--sh5nscmqg2dbm6ci--
