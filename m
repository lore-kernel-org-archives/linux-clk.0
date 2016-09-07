Return-Path: <maxime.ripard@free-electrons.com>
Date: Wed, 7 Sep 2016 22:37:14 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Mylene Josserand <mylene.josserand@free-electrons.com>,
	linux-clk <linux-clk@vger.kernel.org>,
	devicetree <devicetree@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH v2 7/7] ARM: sun8i: Convert the A23 and A33 to the CCU
Message-ID: <20160907203714.GG28134@lukather>
References: <20160906121837.7517-1-maxime.ripard@free-electrons.com>
 <20160906121837.7517-8-maxime.ripard@free-electrons.com>
 <CAGb2v64r-vURPZNhPhKv2+7kByckdxW=fPH-9qAfBLxH992qWQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7SAgGoIHugoKhRwh"
In-Reply-To: <CAGb2v64r-vURPZNhPhKv2+7kByckdxW=fPH-9qAfBLxH992qWQ@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--7SAgGoIHugoKhRwh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Sep 06, 2016 at 10:08:05PM +0800, Chen-Yu Tsai wrote:
> On Tue, Sep 6, 2016 at 8:18 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > Now that we have support for the CCU driver in sunxi-ng, convert the A23
> > and A33 DTs to that driver.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
>=20
> Acked-by: Chen-Yu Tsai <wens@csie.org>
>=20
> TODO note for later:
>=20
>     The usb_otg and usbphy node definitions can be moved to the common dt=
si
>     file, and there compatibles and regs (for usbphy) defined in the SoC
>     dtsi.

Yes, I noticed that too :)

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--7SAgGoIHugoKhRwh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJX0Hp6AAoJEBx+YmzsjxAghWYP/AxZaW88XQ1UPoaHs+F2iPS9
O3/Lli+0rvKgWT4f1vtvM2k1I0WFafBmXNl6u/MzMTb8BlyoBHzp/JeIitiYivKC
KzrIaRSLNgyhJDRd1RlsUk+pcc68bz7roYv3x9cERbtcY685H5nYlssUnytKzO36
MxVv1TsTr+RhLLawo6OLDd/Wv/bUFPNw5rFG5xUSt4jSegEbLlikVKd59VMTj+1g
2AufvfZ1A8RT0LH9SoZ9VDldDDC8kORfGxd9+jBMhJpz8j/tJ9NuwGpnqsxvrUFS
Ts8Y+XQzr48uvCEwzItKtNrbnphkIuUcUcj710jNLGYaTsfwKIwiZwXasXGaW84Z
J0IXg88QlDFM8qCfEjuccmtW6TU0saNaun2WOE3BeXCRb7X1ZuMdOBUHxoYBJfgT
JVS4ydZfjEaD456yrbB9XG1ovaSQMOms7kut9dZuMYAo/7vJvjLKpsCcltkWKF6P
nlE6rA0lIGrOkE1QNbMn1Dve1bN38SfVbnf2vgtMo1U06mexbQkvGh9FCOkXHCxz
GtQ1wjHkCVvhLnmmVkhao+AJjvvsza7W8UJPYOY47ZiE5qeFWaf8tA4fIgb5fnY8
dY8UctaHQoTkUtgtr6C+moKYp9s/7Tw/HKeYWgGyjMKvkVkCVIgpTQBD3J+H2drD
/+mcFNmcOA/3FHoDwPLN
=n14z
-----END PGP SIGNATURE-----

--7SAgGoIHugoKhRwh--
