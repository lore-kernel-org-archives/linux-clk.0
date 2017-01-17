Return-Path: <maxime.ripard@free-electrons.com>
Date: Tue, 17 Jan 2017 17:41:11 +0100
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
Subject: Re: [PATCH v2 01/10] ASoC: sun4i-i2s: Increase DMA max burst to 8
Message-ID: <20170117164111.76mefaj32fy64f7o@lukather>
References: <20170117140230.23142-1-mylene.josserand@free-electrons.com>
 <20170117140230.23142-2-mylene.josserand@free-electrons.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2gweboskz7ujobya"
In-Reply-To: <20170117140230.23142-2-mylene.josserand@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>


--2gweboskz7ujobya
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 17, 2017 at 03:02:21PM +0100, Myl=E8ne Josserand wrote:
> As done previously for sun4i-codec, the DMA maxburst of 4
> is not supported by every SoCs so the DMA controller engine
> returns "unsupported value".
>=20
> As a maxburst of 8 is supported by all variants, this patch
> increases it to 8.
>=20
> For more details, see commit from Chen-Yu Tsai:
> commit 730e2dd0cbc7 ("ASoC: sun4i-codec: Increase DMA max burst to 8")

Those details could have been included directly in the commit log.

Otherwise,
Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--2gweboskz7ujobya
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYfkknAAoJEBx+YmzsjxAgPaIQAIK/zBjeQja/p8TCOIYY/Q5P
k6tBGE8os+KjiXv9tJq+MX8p+8423SGlQ0VsRhMb1dNwyr7Qs95HBdBwFv4GyAj2
Zo7EXeR8s5VQiNTYWxYA+d5VCwgAvByhMDffchYa0/3IiEb1VnBpeuASOvWxmk5J
9+eeT3ozYi7gRgvCdZ9ZQpX/itG7sIFaydmrc/NfEz9WfyWGXx0JHz/8a4f6+h/i
NsXEJplTf8mtAFyDnPYZ9xoCzPBvvfeAP680zACN8lR+fvq9qlZcSYei84QnvGHn
tLy5iZeaF5g6MhHS9B88ImfBEQC3lzkEFBio539yKlR2yCQNv1Ogh5qmnzWFpc5E
YNOcIy5mtiwREY+Si+qG1exO8CXOsCNM6ny1CI+xcVBSBvW5Jk4gvMaOpwAZqRmQ
2af8htLvl63gThRRy4nKcncDPQPXDoigTQdVfrhk2TECduEU5o7kUXzS5Qk0HGI0
9HFtZ//U/S6sRlRuYXtl8ey9PNk4KfAnVMExj9nrfW1H38togDxpLQi8C5Pp4M72
iQkkOOv7noWqlPcIKm0YeotLJ3iya75/cHst3+7jNmdAPqCnd3yWkqizzA8mxuZI
4gm9JC3BfcRws218k2Icm8aBVUqolYnRzxZp/Tkv4U2pqpveFx1dHsNoFFIUNMIt
iE7xdIM/mUO6jW83Qc8G
=3lxr
-----END PGP SIGNATURE-----

--2gweboskz7ujobya--
