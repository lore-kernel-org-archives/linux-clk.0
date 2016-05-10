Return-Path: <maxime.ripard@free-electrons.com>
Date: Tue, 10 May 2016 08:36:18 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Mike Turquette <mturquette@baylibre.com>,
	David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>,
	Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
	Hans de Goede <hdegoede@redhat.com>, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com,
	dri-devel@lists.freedesktop.org,
	Boris Brezillon <boris.brezillon@free-electrons.com>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	Alexander Kaplan <alex@nextthing.co>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v4 01/11] clk: sunxi: Add display and TCON0 clocks driver
Message-ID: <20160510063618.GI3733@lukather>
References: <1461590572-4027-1-git-send-email-maxime.ripard@free-electrons.com>
 <1461590572-4027-2-git-send-email-maxime.ripard@free-electrons.com>
 <20160506223002.GE3492@codeaurora.org>
 <20160508200308.GF6167@lukather>
 <20160509223238.GW3492@codeaurora.org>
 <20160509223924.GX3492@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DesjdUuHQDwS2t4N"
In-Reply-To: <20160509223924.GX3492@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>


--DesjdUuHQDwS2t4N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Mon, May 09, 2016 at 03:39:24PM -0700, Stephen Boyd wrote:
> On 05/09, Stephen Boyd wrote:
> >=20
> > Ok I applied this one to clk-next.
> >=20
>=20
> And I squashed this in to silence the following checker warning.
>=20
> drivers/clk/sunxi/clk-sun4i-display.c:110:33: warning: Variable
> length array is used.

Thanks, just out of curiosity, which checker are you talking about?
sparse?

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--DesjdUuHQDwS2t4N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXMYFiAAoJEBx+YmzsjxAg2M4QAI5KqvcFz7Ga7Rd8uhMLXNfu
wTqfzZw8hGLL2xzPTc0ThMbqQZcj/s1iWSyri0N6RHrytsusB1m2UFuAw0i7cKmL
2H3uUxMs4CEWYPEFV9cz6Xz45AZkdoD4La+U2qLlmw3zgaEsQCv4HwNzFDMLUuQw
HAIYwmIW4vcUfhUTU5B2pPracXIiNeK3iWEM31ZeowAkVeHGy640rSweLE1x5jIr
AeVPJRNzJ2M30t7B49sdyiCOtnt24bK4oMqksUDcdv9b+zZG0RhtlUsjg4RTWGVk
xZG3oaEEFilK1G96IFu28AgfkdrJijuMP5hcG7JW8XbQx6VirkJBdsRt9gVDc6NZ
T1h7hTaEVuPEukdCb4GDC7PBvKYgZe1A8p0jXVrITKZWHQJzbgls1Gx9tynDcoEk
gP65bdwYapd85ZeJxmxjyfJpcXuAoxtYLOFCuUpo6I995riz8d8gw9ApDPFDlq5k
NtHXashr+wyWEhKPRXPDfPgABbX1JR2DHWM2O3jXV5It590BijoPKoAq+PC+oi0P
iXZ8mMmL2nzMDgako1k4aXE/7dq7HmJ94evcnMCEXuFldZzD+k6m8i0etirefj9w
rDgmMZ0ivIqdN/NbRAKvTVuieNitOtGPs/c/UfJvaEu6PMt1Rx2KZ8jKsygtWn2U
KAgabX1iEVJR/6JrJTkL
=EqTW
-----END PGP SIGNATURE-----

--DesjdUuHQDwS2t4N--
