Return-Path: <maxime.ripard@free-electrons.com>
Date: Mon, 24 Jul 2017 11:37:26 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	Kevin Hilman <khilman@baylibre.com>, stable@vger.kernel.org
Subject: Re: [PATCH] clk: sunxi-ng: sun5i: Add clk_set_rate_parent to the CPU
 clock
Message-ID: <20170724093726.u3qpvocb7m6fujfx@flea>
References: <20170721161935.18411-1-maxime.ripard@free-electrons.com>
 <CAGb2v64AmFA7qHgTK6+w147-vb0Mv6uh5xx5MXy5jVfKNX_WVg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vhgnvp6ofk5ewxwe"
In-Reply-To: <CAGb2v64AmFA7qHgTK6+w147-vb0Mv6uh5xx5MXy5jVfKNX_WVg@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--vhgnvp6ofk5ewxwe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 22, 2017 at 10:23:19AM +0800, Chen-Yu Tsai wrote:
> On Sat, Jul 22, 2017 at 12:19 AM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > The current CPU clock is missing the option to change the rate of its
> > parents, leading to improper rates calculated by cpufreq, and eventually
> > crashes.
> >
> > Cc: <stable@vger.kernel.org>
> > Fixes: 5e73761786d6 ("clk: sunxi-ng: Add sun5i CCU driver")
> > Reported-by: Kevin Hilman <khilman@baylibre.com>
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
>=20
> Acked-by: Chen-Yu Tsai <wens@csie.org>

Applied as a fix, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--vhgnvp6ofk5ewxwe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZdb/WAAoJEBx+YmzsjxAgs3cQAJ0O8XvXEfcoIdCARkAsDpQc
YE6zynBPDMnQ5aXqcjILUEDHCOzKBpAYg+maghAKGGl1DhB/dltI4Ek4puBFnHy7
HWg8CMDyGlfgTdInx9PHnfizE2p4Eg0s9xRTj5YTxtNhyJ0H3n2/D//6CCpIVLYg
fMWGO3jdNiafGiCtXKTV2N1vxTe1ELgU0Z9+etk2e+PJL7Z3fzdE8aiZoCrcsePP
zP0thLo6jIw14muH0B+cq6/5kJID78QkTVFQxQQt//9jEvb/zfWlC19+TR2DvmBR
ErGLOcekSB3xbT5iKQxnvpo45fgG4TQ9RnIzev4RWrbxa8mj++w0Jmf6JMTdYkXp
AbYoYJAGPqzTGZUz8s95oze0RP2aiszvWvGF5iQjUBRsQAIboUr5HKFlisU2K+kn
0YuWOA3bgOB9MDa1vNqLTzo93elmf5AXFJBEV0x7k6sFRsetBU/CMyx/1+2X7N4N
CEEl4KJGE61pZQO1FpovEBxA4QKzgvhcKcLnNVTvWTysDR+yKEv1IhAgPHvUgW81
/26Y2InoeDYntwYsIuqGY2cq+ZGc5V9AsV3gsG/grsggttIHTV8+FNLqqjopj/1+
F4ciMPBWvnZWnGkBpm4f5i8xxb0zsUNxJkyVXgs0A45ZB/QcpLlrGSRyEiwBj+6x
ZJkd5zguBlnHdbWifrUX
=bZax
-----END PGP SIGNATURE-----

--vhgnvp6ofk5ewxwe--
