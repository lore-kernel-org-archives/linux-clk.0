Return-Path: <maxime.ripard@free-electrons.com>
Date: Fri, 21 Jul 2017 09:20:39 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-mmc@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH v2 04/10] mmc: sunxi: Support controllers that can use
 both old and new timings
Message-ID: <20170721072039.qsko2vtradiosdqk@flea>
References: <20170720034452.15920-1-wens@csie.org>
 <20170720034452.15920-5-wens@csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5aoxigudzrnhotcx"
In-Reply-To: <20170720034452.15920-5-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>


--5aoxigudzrnhotcx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 20, 2017 at 11:44:46AM +0800, Chen-Yu Tsai wrote:
> On the SoCs that introduced the new timing mode for MMC controllers,
> both the old (where the clock delays are set in the CCU) and new
> (where the clock delays are set in the MMC controller) timing modes
> are available, and we have to support them both. However there are
> two bits that control which mode is active. One is in the CCU, the
> other is in the MMC controller. The settings on both sides must be
> the same, or nothing will work.
>=20
> The sunxi-ng clock driver provides an API to query and set the
> active timing mode. At probe time, we try to set the active mode
> to the "new timing mode". If it succeeds, we can then use the MMC
> controller in the new mode. If not, we fall back to the old mode.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Thanks!
Maxime
--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--5aoxigudzrnhotcx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZcatHAAoJEBx+YmzsjxAgqloP+waQe7R4Dc6Vlas65wb477oh
5EHgIaFnZWnBoLQkhzDLsjJvetnn1+PcnmlOW8YKkLQsHdLE2WYgUeFnYdH0Pzh0
ulikYxaHsUg/lIHHnLpCPJrOSNjUZ4a5Gy4n5TqTCo5/DBNwNb67Jyc+LzsuY+/N
PmYcgAOfspmbWP8F4GEqgdhknlFkDOwz8LP/FH2XKbkWxwqepZoEHZJrk7D7Bi1n
ehDingd2znlz6xepT4qVBWSZB4L5knEMeuYA1FAiQkgMlelBucNk5y8y1d3W6JHI
dR6Y5jGxyJLm6Y8lL2yhoMEBpxb//20tz/FQjOKuPBiX8zIze0HXda+GhQjcJ5Eo
R0YfEoVrvuni49pvtQ/lsyzK2svMXfdwSE+J6C0+WjRCyxsvDgIjm6obDroTscCA
dRu9NmC0zFjB4mKcMm4A/olCF3HL814viz88t69Czt1cfbH0UouBe1+58hSlpaA0
0e0YJ3Ryn/WMdR34iAwyAWddPrCBXTr9RQye7f9gu2NL6UNKPbczBhNrHV4ecymE
tNAYSiRJOCc0CM6mJQWCR4GJ2vlSGkys0asI1KzfyfA3nnvzGiG9YKyapMqYWWxl
TJHPT6/Y8N/fyXte6D6cd9YCy0LOOqQhl/NWFlG69ylMdInNSGgNT1piWnI+8rN0
Ak5UG2JBsQmY6kMgfgv5
=E3cZ
-----END PGP SIGNATURE-----

--5aoxigudzrnhotcx--
