Return-Path: <maxime.ripard@free-electrons.com>
Date: Mon, 1 May 2017 18:05:53 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Priit Laes <plaes@plaes.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>, Chen-Yu Tsai <wens@csie.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Rob Herring <robh+dt@kernel.org>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-sunxi@googlegroups.com
Subject: Re: [PATCH v3 4/5] ARM: sun7i: Convert to CCU
Message-ID: <20170501160553.fa67agqy5ltpwo7p@lukather>
References: <cover.908ce010a25e503bb5ad0967759c723219c6ed0d.1493235134.git-series.plaes@plaes.org>
 <560676328328d23f344468f5c43ff1b1533f36f0.1493235134.git-series.plaes@plaes.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="amwjgju27qxirult"
In-Reply-To: <560676328328d23f344468f5c43ff1b1533f36f0.1493235134.git-series.plaes@plaes.org>
List-ID: <linux-clk.vger.kernel.org>


--amwjgju27qxirult
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Apr 26, 2017 at 10:32:24PM +0300, Priit Laes wrote:
>  			compatible =3D "allwinner,simple-framebuffer",
>  				     "simple-framebuffer";
>  			allwinner,pipeline =3D "de_be0-lcd0-hdmi";
> -			clocks =3D <&ahb_gates 36>, <&ahb_gates 43>,
> -				 <&ahb_gates 44>, <&de_be0_clk>,
> -				 <&tcon0_ch1_clk>, <&dram_gates 26>;
> +			clocks =3D <&ccu CLK_AHB_LCD0>, <&ccu CLK_AHB_HDMI0>,
> +				 <&ccu CLK_AHB_DE_BE0>, <&ccu CLK_DE_BE0>,
> +				 <&ccu CLK_TCON0_CH1>, <&ccu CLK_DRAM_DE_BE0>,
> +				 <&ccu CLK_HDMI>;

In order to make merging those patches *much* easier, could you just
use the raw IDs (ie not the defines, but the numbers) for now?

And ideally, send a patch after 4.13-rc1 that will switch to the
defines.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--amwjgju27qxirult
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJZB1zhAAoJEBx+YmzsjxAgoqwP/jaCRFhEzs3l90XfClpp68Xf
UL8a14VdvTE/fciwAcJI0iqImz9NEDUpv22eWrGL4qdk+ChoELHTs6/C5of56873
D7MGBKURw3gIa+0EgPlhw/y4EVM5knPxYEvAY/HQyFB/irVIQ3+8WoUZboIwWv92
bnKMYLaDcCkPkmcoibZqgcCSdxL2EnnKwvKSePlucdkd6RmZU3fdH+KDTBqGMN7j
MaEN+TWGPYufxXqyUDWtM+D/yxiBmLlMNN+MfYjXNbofkQcU+P12uPGd4Se9JH9E
fgYKwXXG4ZcQReAX2El1B3Ql5F9vE7l1ZfoyF7J7LNyKWBrd7GBq+qNGdt6Nxfgz
0oPiWh9wbB0rKizI7dsqcn5gHcUzaDg0zrFJT2RtvambGsxPuGDYC47dsw2c73R+
TF7/x+4ZvTEaJg/GUFrYk4VrL9kCv9eL/yiTtVKdPigxO08uWWFpnPk35zFjQYx5
9WTKoOsf6IRRKTFOlCS2oCEyPCBEEnbfRf6QH1CFbMoHKfUU1iPrKdW2q1tpT054
hetONkltpV4Nr+vHxCQ7g3O6vXE2xPe/8DA4+i87KZnX1PyGuFtEk6wq5Lys70fK
dDxIC3vi8WEYw/wb9W0PvvzzOIq+FKN5N7kO/oyFeXcMMm8DfnoMO+ZKlBHgjhs+
4gAY9DMF6s6sicVxQLOk
=obQp
-----END PGP SIGNATURE-----

--amwjgju27qxirult--
