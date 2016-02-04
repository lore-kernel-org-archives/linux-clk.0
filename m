Return-Path: <maxime.ripard@free-electrons.com>
Date: Thu, 4 Feb 2016 13:05:07 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Jens Kuske <jenskuske@gmail.com>,
	Vishnu Patekar <vishnupatekar0510@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	Jean-Francois Moine <moinejf@free.fr>
Subject: Re: [PATCH v4] clk: sunxi: Refactor A31 PLL6 so that it can be reused
Message-ID: <20160204120507.GC4270@lukather>
References: <1454358000-13594-1-git-send-email-maxime.ripard@free-electrons.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vEao7xgI/oilGqZ+"
In-Reply-To: <1454358000-13594-1-git-send-email-maxime.ripard@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>


--vEao7xgI/oilGqZ+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 01, 2016 at 09:20:00PM +0100, Maxime Ripard wrote:
> Remove the fixed dividers from the PLL6 driver to be able to have a
> reusable driver that can be used across several SoCs that share the same
> controller, but don't have the same set of dividers for this clock, and to
> also be reused multiple times in the same SoC, since we're droping the
> clock name.
>=20
> Acked-by: Chen-Yu Tsai <wens@csie.org>
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Applied.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--vEao7xgI/oilGqZ+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWsz5zAAoJEBx+YmzsjxAgePQP/j0JVCbOuIBGM3EBEe3Vchy+
tMKZVzzLgl07PN6dowwSroi5s6d8Pzt9f3e86b+lG+j1fjk19n6tvLM0jk2L0B2p
iBGKbkCmGX6NEi+bu1iHinN+NrQgpyA/kQPY791FBEiUk5J6gVGET2qTTbwrLmPM
Y5eXXYvx/AaGNRlgcNqFDSc4qNeuNwIt1oLcWVAvOp5oq9FwpMPVwOQLwPkV31G+
n6Nr/vtIJze+X35SyHME9FC5PDqckRGgo7wet8DEMoSN4aTzB39FG9ZJ4weKbJJd
58Zb+hXMN0qWCEkGUbiIKDoEi6VUvDBuZCRuKO1/IL3yojkBxrjv5IR7w/gCppXW
owaWGd9myt1shnu0Lkpq9NzhZg5MygQP8bVkfPcvxtUqXpm/+EPcZv95ZrpdbP7S
+oUmKh+IWYc8XtCzKmFN6kBIUhCYLnEzieHCN/WU/dQHgyRv6wwxjMewKNfeqPFE
Lb/liPL/41biuaGQADvOxXEjo+FsLFhhmMqmqnHzcBHfiDGA3GD13wFFdaic8hjY
ya6QmECuR7sRnb87w5hE6lHy8hPf7G4HDGieppHENWK96xpJgmFyhVxjlciJ1yRJ
mVBa6AS7eDdgfp7qBYigblFo2Fapa8nNlCItfl6sZZjz3jIQ+or5OQ3ymoGz/EZY
XaZzkCF4q/xF4p+80Cyq
=xeQw
-----END PGP SIGNATURE-----

--vEao7xgI/oilGqZ+--
