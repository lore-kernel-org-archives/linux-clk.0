Return-Path: <maxime.ripard@free-electrons.com>
Date: Mon, 5 Oct 2015 11:44:24 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Mike Turquette <mturquette@baylibre.com>,
	Emilio Lopez <emilio@elopez.com.ar>,
	linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
	Hans de Goede <hdegoede@redhat.com>, linux-clk@vger.kernel.org,
	linux-sunxi@googlegroups.com
Subject: Re: [PATCH v3 5/5] clk: sunxi: mod1 clock support
Message-ID: <20151005094424.GG2696@lukather>
References: <1443512353-28073-1-git-send-email-maxime.ripard@free-electrons.com>
 <1443512353-28073-6-git-send-email-maxime.ripard@free-electrons.com>
 <20151002204555.GA12338@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="i3lJ51RuaGWuFYNw"
In-Reply-To: <20151002204555.GA12338@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>


--i3lJ51RuaGWuFYNw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 02, 2015 at 01:45:55PM -0700, Stephen Boyd wrote:
> On 09/29, Maxime Ripard wrote:
> > + * (at your option) any later version.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
> > + */
> > +
> > +#include <linux/clk-provider.h>
> > +#include <linux/clkdev.h>
>=20
> Is this include used?

Fixed.

> > +	if (!gate)
> > +		goto err_free_mux;
> > +
> > +	of_property_read_string(node, "clock-output-names", &clk_name);
> > +
> > +	while (i < SUN4I_MOD1_MAX_PARENTS &&
> > +	       (parents[i] =3D of_clk_get_parent_name(node, i)) !=3D NULL)
>=20
> Can we use of_clk_parent_fill() here?

We can, I switched to it.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--i3lJ51RuaGWuFYNw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWEkZ4AAoJEBx+YmzsjxAgAAEP/iShQleVJFS/yYtkbfyhj1g5
mapu2yNRa5pzqo1Pxwj211yLWmY0FkqCtFTiQMbOm+AG3FWXZROhYyvPK2XypPF4
i7SjfYH1nf+376IJJedBc+GXEz9QCzCAYuiUAdnD4s1DlB6WrrHz8g+JkbdCTM5f
P6Vzt/B/42uMomK8kHGEBA+U70TTiqr7HmZ1Jxs2qj+HQHdeMvzgMb9t4kMb4Htz
ezK/ZsR9++poILSzZD/Y0PuUFCxQK9oHoZBfh+sDNdmyLL6rLiJjphEshZHfxNrS
w2IDmDBm86T6a6a98nLCGa5MFPWsprwpER0zS+M+OweIhHtJkQCDR6NZS/aA4JNd
wdFwzZZfdDHXeDKlSuLKekgzyy2VcguJ8W0XyNEM+zYiT3sXalu0M6vGG4z7TUx8
B05GOnC5CXJK5vjniajepAykhaw3jIoOY2EMRrN/aIWWtod7Xroo94kpoRYx9on3
IXFguupzTF9/1Xb2q4pft4PeWapqTtHg49b0AkBNRupDPfk7qKvccIEzYFRT2emA
94uhdn/SAz8PL0id1h7KhXEI5SzBnykgg4YaSbdWeCLHiyr3q0TztacXilAuZBYc
I05QRxxVTS0jF9ffV75KmLVcD4s5YQz3mqEtpghQPho9/x2zI0PIwd5Cc4QQ5NzV
tNoKTVpy1kvkEzQa4Iud
=oY+D
-----END PGP SIGNATURE-----

--i3lJ51RuaGWuFYNw--
