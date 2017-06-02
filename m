Return-Path: <maxime.ripard@free-electrons.com>
Date: Fri, 2 Jun 2017 14:15:32 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Chen-Yu Tsai <wens@csie.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Tobias Regnery <tobias.regnery@gmail.com>,
	linux-clk@vger.kernel.org,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	Icenowy Zheng <icenowy@aosc.io>
Subject: Re: [PATCH] clk: sunxi-ng: select SUNXI_CCU_MULT for sun8i-a83t
Message-ID: <20170602121532.glfjkxp333ynvcwm@flea.lan>
References: <20170522202951.2896280-1-arnd@arndb.de>
 <20170523005553.GH20170@codeaurora.org>
 <20170523071940.xbnahikb4d5dge7v@wens.csie.org>
 <CAK8P3a37CT0tzdy4V8Hj=-Mu=JrdR08zv2fqVH5Y+hzT7OK4Vg@mail.gmail.com>
 <20170601071750.GP20170@codeaurora.org>
 <CAK8P3a2-hoVKFOr455ZseM4UrmHGFXTE7VbXpSd2Jdp7rnrKyA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kzympabir2usixkv"
In-Reply-To: <CAK8P3a2-hoVKFOr455ZseM4UrmHGFXTE7VbXpSd2Jdp7rnrKyA@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--kzympabir2usixkv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 01, 2017 at 11:07:46AM +0200, Arnd Bergmann wrote:
> On Thu, Jun 1, 2017 at 9:17 AM, Stephen Boyd <sboyd@codeaurora.org> wrote:
> > On 05/23, Arnd Bergmann wrote:
> >> On Tue, May 23, 2017 at 9:19 AM, Chen-Yu Tsai <wens@csie.org> wrote:
> >> An alternative would be to remove all the dependencies as 'lib-y'
> >> in the Makefile and remove the individual Kconfig symbols. That
> >> way, we would always build all of them when CONFIG_SUNXI_CCU
> >> is enabled, but the linker would drop the ones that do not get
> >> referenced.
> >
> > In this case you're right, and we should change them to lib-y in
> > the Makefile and then let the linker figure this all out. No more
> > dependency patches. I think we only need to do this sort of
> > Kconfig stuff when we want to make a library .ko file that each
> > SoC specific driver depends on for common code.
> >
> > It would be cool if the build system could figure that all out
> > for us, and let us have something like modlib-y that makes it a
> > library (archive) if all objects depending on it are builtin and
> > we have CONFIG_MODULES=3Dn, or makes it into an object file if
> > something is builtin that depends on it, or makes it into a
> > module if everything that depends on it is a module.
>=20
> In this case, there are no loadable modules, the sunxi clk drivers
> can only be built-in, which should simplify the problem a lot.

Using the linker to drop the useless stuff seems like a good idea. Do
you want to send a patch for it?

Maxim

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--kzympabir2usixkv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZMVbkAAoJEBx+YmzsjxAg+cIP/32bc72xSYamHriQ/sjr0N0M
U4QiE2ANaFw4lKsp9l15UEcB6C3r3OaAGbbnvqlM/UTsMy2pBDzI4mx88GcY/UEl
PhMV95+tvcjbrxe9XmpXo3KHqgwzs8z+jVb4RjSIf1POFtFxx3IuSh7tjb92e889
k3mryPSNMOJcCy3eZAwb/+eOilNnU84Er7stly/2w/b6u8F7QQREGg8VGg1qX/6S
fqX76OQqfjqbHWBWxHcJ3rEXgAK9Pi6iXd3LJMV+wX9lAhv1rVMjQm31w/fa9l7V
LRoADj4TjOrAhzKu2EzCz3M3M5B3AxnOZ3hTP2XmVPZDTk2H6qNgWWrvcIfwoegK
uWfK+CATW6IHhcXjaJIw9ovGxrowExGAqz597DbWweicjt5X3pKYVAz67UHDa+ea
5NqDvYOeNRDPUa1l+2TGiEJMpDnxMvaQRVMKS9QULjXI6bRf/fKDUDpjin/c1FWv
WY+2cjKef1nS3ZdDGsAVTXZAkdRJD5ORXj6gwIplpRhSZEWqnY2UI3l5gTGDN75z
jwFJo3AFpxu3K/OlMdf8mX0RrHvOMUplHiRQKuda8kBJi1fdPI8IGd8cc4lBURuC
aLNbBTx3vMYM7XEDyHs9zje7C4owyO7Sz/fCeAuQkpEergh5YPrQPBw3wFhxtCGc
N47IFW+Pc7fOSIAlKmd7
=S4Aj
-----END PGP SIGNATURE-----

--kzympabir2usixkv--
