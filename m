Return-Path: <maxime.ripard@free-electrons.com>
Date: Mon, 1 May 2017 18:02:51 +0200
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
Subject: Re: [PATCH v3 1/5] clk: sunxi-ng: Add sun4i/sun7i CCU driver
Message-ID: <20170501160251.rv5uqlq37hfc3ex7@lukather>
References: <cover.908ce010a25e503bb5ad0967759c723219c6ed0d.1493235134.git-series.plaes@plaes.org>
 <528b9b3895e654b6d3cf95187433f9fb7b4eb50c.1493235134.git-series.plaes@plaes.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="owngot3fgiazn3ja"
In-Reply-To: <528b9b3895e654b6d3cf95187433f9fb7b4eb50c.1493235134.git-series.plaes@plaes.org>
List-ID: <linux-clk.vger.kernel.org>


--owngot3fgiazn3ja
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Priit,

Almost good, thanks!

On Wed, Apr 26, 2017 at 10:32:21PM +0300, Priit Laes wrote:
> +/* TODO: GPS CLK 0x0d0 */

You should still create a define in the header for this one.

> +/* Following only exist on sun7i-a20 */
> +#define CLK_MBUS		165
> +#define CLK_HDMI1_SLOW		166
> +#define CLK_HDMI1		167
> +#define CLK_OUT_A		168
> +#define CLK_OUT_B		169

Wouldn't it be better to simply create a new A20-only header that
would include the A10's and add the A20 specific clocks on top?

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--owngot3fgiazn3ja
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJZB1wnAAoJEBx+YmzsjxAgmFkQALK6Vvx4xm40JV7UisV38i8q
oxiZti2C9ZIRUAjVAW0Lasxwcuecl8jnS9aF1UOEbKsjF85BfNHJ/7W8z6v1SzIr
FWCMptML/Y6T3VSctY2gZe7vWwp7T7a/6YVkbk8rlKNca3BATDSy6OZqNhBjPfTQ
ZcVXGozbhfYFzJf2QvjdjH2u8yIoJu/z9IyDAlhE7DLl3pHZAzwTZzEnmJgFNzSL
cBRKaET0POp7RS/R5PjZzDMCvExUPp/MDgfoNNgT/1Tq4A7Y9Q3mxbqVXiYbDK58
ciECACczHHi7A3zXVT6Xd6x+kvgc1X105NECFSrD1X3dNJQYJfH/tznuAeD7MmRV
1Ki4t9RVXOpa/DPm+hiyq4jSDwDYYjOOl85/Po+/iFAlVoDyTcfL+crbVxYAUCPq
HMp0yCMGwXDY8BzMyeVp31j+1mgQBsLV1e8GoCEFUtbo/UKxJCUa/kNYAghyXDXN
E24ns6E19GaBh/b4wHd6pUlH6usaSfjbtBQrbcWKdbWZRaqov2K2O84Eqefp+MKC
5y3V2/rOLRnyky9WtUmyqvfUo7wVvZC4er3d2O3cQN4iqnB2nZOKIfxChaCnPg4h
qCatjtaV8U/tKrPGrJqTdS2vDmM4LmhYTckmRyYutJH8FWcj4SBLdOwZ8nz8rTvt
kgEX5WgeU7j/tPu1ic6s
=fGMc
-----END PGP SIGNATURE-----

--owngot3fgiazn3ja--
