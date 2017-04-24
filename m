Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Mon, 24 Apr 2017 10:51:09 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH v5 02/11] clk: sunxi-ng: add support for DE2 CCU
Message-ID: <20170424085109.p44bmzbyjkuf7ckv@lukather>
References: <20170423103754.50012-1-icenowy@aosc.io>
 <20170423103754.50012-3-icenowy@aosc.io>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="durw7a273rduc6nt"
In-Reply-To: <20170423103754.50012-3-icenowy@aosc.io>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--durw7a273rduc6nt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Apr 23, 2017 at 06:37:45PM +0800, Icenowy Zheng wrote:
> +static const struct of_device_id sunxi_de2_clk_ids[] =3D {
> +	{
> +		.compatible =3D "allwinner,sun8i-a83t-de2-clk",
> +		.data =3D &sun8i_a83t_de2_clk_desc,
> +	},
> +	{
> +		.compatible =3D "allwinner,sun50i-h5-de2-clk",
> +		.data =3D &sun50i_a64_de2_clk_desc,
> +	},
> +	/*
> +	 * The Allwinner A64 SoC needs some bit to be poke in syscon to make
> +	 * DE2 really working.
> +	 * So there's currently no A64 compatible here.
> +	 * H5 shares the same reset line with A64, so here H5 is using the
> +	 * clock description of A64.
> +	 */
> +	{ }
> +};

So that A64 driver would require more than just what you defined in
the binding in order to operate?

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--durw7a273rduc6nt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJY/bx1AAoJEBx+YmzsjxAg/g4P/RL8VLuuS5zS1riDe+pjLPUm
XjfYvFFireCrdFg9i1Bnz5ex6PY2sNkVN/NuHcY47wq1irf2yxzV4475KhS8NKYC
H4CJ4a2A+nPIXmjBXqEsLXHQ9DXgEzT8FnQItV1llePaHnj+sjcvOgUwxUPEaTuJ
tHr9/XfpPnY1ZC4+n1N5N0Zw3sXOT0/gjc4urq5/1F1/QH58vlp+UODvxN5nW1V5
mi380GyWot4sOA2XSXaa7rOcqiHx8FRNx7qmgH/PieUmiWxuYcY7pkiVIOOZMIu6
WNDvQFbAjVGmZ1IjO4mRh1NsjHc5cMkrobS1uRVOKXmgtSI4vyUCZevuZoricvK7
jo/9c64oPZQyQ2h8eVY9ir6eriwp9apqRhGP93C1WcRHbYwORAtHUz5xPkAAHpQH
ujkf5R7cLaJPaougx0Gnuq6WM39OxHuSL16kzX+gqzCj4DvqxG4J6CZujGI6ouJr
/ONcyE/lptj/5qFWjThikfka6u4BaoKP9BWt7dnvbWytinx/Xp8sct8qCVUY4hSE
i41LYmu2C24nO9JiUgbaR2dEyj9GvRHjnu2Q5KKWHVaSgTTQjiLZ49GvqsuEnb60
Bp1nqv+/hEHBaGMl8SlTnHYp+79fMSgIiI64GcT1rHBUZZOyCng6S+rI+1V+gAbI
c3ETp5kWi5TOrxSH/IvA
=xMwC
-----END PGP SIGNATURE-----

--durw7a273rduc6nt--
