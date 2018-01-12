Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Fri, 12 Jan 2018 09:51:34 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.io>
Cc: linux-arm-kernel@lists.infradead.org,
        Andre Przywara <andre.przywara@arm.com>,
        Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-sunxi@googlegroups.com,
        linux-clk@vger.kernel.org
Subject: Re: [linux-sunxi] [PATCH 1/7] pinctrl: sunxi: add support for pin
 controllers without bus gate
Message-ID: <20180112085134.dcsikciujsxuuwhx@flea.lan>
References: <20180106042326.46519-1-icenowy@aosc.io>
 <ef82983f-6f91-46c2-1f67-7d4efc10c905@arm.com>
 <3A97A26E-0774-4279-B7B9-8312225E2C72@aosc.io>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="sqfzuowjuk7oe46v"
In-Reply-To: <3A97A26E-0774-4279-B7B9-8312225E2C72@aosc.io>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--sqfzuowjuk7oe46v
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

1;5002;0c
On Thu, Jan 11, 2018 at 09:21:06PM +0800, Icenowy Zheng wrote:
>=20
>=20
> =E4=BA=8E 2018=E5=B9=B41=E6=9C=8811=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=88=
7:48:40, Andre Przywara <andre.przywara@arm.com> =E5=86=99=E5=88=B0:
> >Hi,
> >
> >another take to avoid this patch at all, I just remembered this from an
> >IRC discussion before:
> >
> >On 06/01/18 04:23, Icenowy Zheng wrote:
> >> The Allwinner H6 pin controllers (both the main one and the CPUs one)
> >> have no bus gate clocks.
> >
> >I don't think this is true. The pin controller *needs* an APB clock,
> >it's just not gate-able or not exposed or documented.
> >The "system bus tree" on page 90 in the manual shows that the "GPIO"
> >block is located on the APB1 bus.
> >So can't we just reference this apb clock directly? That would be much
> >cleaner, "more" correct and require less changes: "The best patch is no
> >patch":
>=20
> I can accept this. (In fact I have considered this, but
> I don't dare to directly use bus clock in a device, as it's not
> exported before.
>=20
> Maxime, Chen-Yu, can you agree the following code?

Yes, that works for me.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--sqfzuowjuk7oe46v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlpYdxUACgkQ0rTAlCFN
r3QKiw/9Hae+QLluYxYJP3sdeGHTY9+aEY/fvPXv/9YjXAN2a1UKHtvC7d/tciwA
v5BULn6zZ/Pky/8N3AXttmNcfpjJSFMj7BQCw41dlzWL91RCfCsVet2HEmC1xCrq
3TRmqWEHflDZiHzbG+SNealqOHh7/Ey7wvPMO8YGB/bxNBWb8HTz2nN7s51zD+RS
W3pWUSZDUYAw1PZyV9RONZTJkcPdnlUJceockBxlrWlojJ+Ya8XqWL4mNy5ZEzR5
um6WBGYb7x/mdCmIw+6kWY8OgocNgkdSv5oS+HLxr6Vl0Naz/NEiXFo//iFm0BU8
Db14SUeEdKbwy53WCpr251Nsu/WnXIxnWkPj9d0Pef+XIxh7gt+OcCQsng4tnQ+H
zQVXcAuRn8yW7FuIm2Ok9DzZYEikRUC8KpqP0VgWMQovnwkel0gKKq6jTtBdiree
WE+0h+klY0jdCECIqoySgKh/9GWkSSWTHOJDHvk2XapTDEBbgFww7E7gmKNo4rAi
sFmGqnoL2/wGA4fOrgPF3w+qjabwxxNaQ9Z9YMiWtVVt81xcKfUVGhS1cfkYUir2
0NSufc/EACIwwHMNOlYrvP+PPuXPAd6lLwitEL0lRc13zj0s26BWMQrPW+nMWGY2
SGDuo/nKtHb0a2rloBecsZIT5ZZCN0aigYtt6WSDVQrfEkJob+4=
=jHXY
-----END PGP SIGNATURE-----

--sqfzuowjuk7oe46v--
