Return-Path: <maxime.ripard@free-electrons.com>
Date: Fri, 29 Sep 2017 12:20:06 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Mark Brown <broonie@kernel.org>, David Airlie <airlied@linux.ie>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-sunxi@googlegroups.com
Subject: Re: [PATCH v3 04/14] drm/sun4i: tcon: Add support for demuxing TCON
 output on A31
Message-ID: <20170929102006.2wz7wrkpplxwynoh@flea>
References: <20170929082306.16193-1-wens@csie.org>
 <20170929082306.16193-5-wens@csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4aqpdm4bouj2waid"
In-Reply-To: <20170929082306.16193-5-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>


--4aqpdm4bouj2waid
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 29, 2017 at 08:22:56AM +0000, Chen-Yu Tsai wrote:
> On systems with 2 TCONs such as the A31, it is possible to demux the
> output of the TCONs to one encoder.
>=20
> Add support for this for the A31.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  drivers/gpu/drm/sun4i/sun4i_tcon.c | 38 ++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 38 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/s=
un4i_tcon.c
> index 7bf51abaee97..c949309d4285 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> @@ -112,6 +112,21 @@ void sun4i_tcon_enable_vblank(struct sun4i_tcon *tco=
n, bool enable)
>  }
>  EXPORT_SYMBOL(sun4i_tcon_enable_vblank);
> =20
> +static struct sun4i_tcon *sun4i_get_first_tcon(struct drm_device *drm)

Would that make sense to make it a bit more generic, and pass the id
to look for as an argument?

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--4aqpdm4bouj2waid
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZzh5WAAoJEBx+YmzsjxAgLJ0QAMBRHHiy8jOUQGPgKU+JinBs
u2rxDfuS/XBFHB2FjH+ya/blQkirAgW1o2R7YbD8hUh/I410qKDJ19qFsqIRvVcr
F1miAL8p/mCHH4KscvRLDXJzVc20Y3EmI9ApE8ymzVkNtPJ06vTNhRm4KjGvVMOX
ociqYb4s6Bov4yJZwEqy5B+FoUrcYKSUuVZ0V1B9qCqcDypMpsRfUlwh6oMbKP4h
DY2niH/rBxn70E3VjMaL8MQp4fmynJ3jEiSrWx6S9gQzhPWBo7QpMnsLatfNaeVc
ive2NVaXDHxGoaKKmfdn2BUuTwuiCP3Y8oJek5dQRtbNRL1kjR/gRfevNYrFyghG
qBalx4u3UicezKArb7bCb9ihg1UrxY+7EUcpmn96hhgb227Pzb1lYZc7qAUmPBxa
zjnZxCGJgq1NX+5ITSL4X7jQYm+ulSDbGDVDnvMo/30vyU0iZ2h/7mSnNdtEnboW
j20hceoFwBAw/Zi7rKs/21h9WnquqMRwOipNmqKhOnGq0XtZIVx/6ezj3Iouw1DY
ZHVzn5t+CRiGfuO6k0Z0Glu9Mbfw8KcjU9QF3yLr5lwkIDd7RlrPn1Zm3CRK9MpE
NxeZDlzqo2tukQQ3owhZvb4KmGwGlgK4YtVvNdMb79ZIaBBFNND8fDdkSGToSgEu
trapbhPgNPidIJFYqANl
=/1Is
-----END PGP SIGNATURE-----

--4aqpdm4bouj2waid--
