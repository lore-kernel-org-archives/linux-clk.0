Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:49292 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933141AbeAKKlM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 11 Jan 2018 05:41:12 -0500
Date: Thu, 11 Jan 2018 11:41:00 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.io>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-gpio@vger.kernel.org,
        linux-sunxi <linux-sunxi@googlegroups.com>
Subject: Re: [linux-sunxi] [PATCH 1/7] pinctrl: sunxi: add support for pin
 controllers without bus gate
Message-ID: <20180111104100.j5rwitma3wgtdivm@flea.lan>
References: <20180106042326.46519-1-icenowy@aosc.io>
 <2ca1ee96-8dc6-c80b-ae11-45895d6a8484@arm.com>
 <CAGb2v64E-XOHVJG0Q-uZeCAdxF37QSVCDfiYmqtv7ydvseQwrw@mail.gmail.com>
 <ba83f00d-c1e5-6f6a-84df-04169860c7eb@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="7drrvdoa2nxa6d2m"
In-Reply-To: <ba83f00d-c1e5-6f6a-84df-04169860c7eb@arm.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--7drrvdoa2nxa6d2m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 11, 2018 at 10:23:52AM +0000, Andre Przywara wrote:
> Hi,
>=20
> On 11/01/18 10:14, Chen-Yu Tsai wrote:
> > On Thu, Jan 11, 2018 at 6:08 PM, Andre Przywara <andre.przywara@arm.com=
> wrote:
> >> Hi,
> >>
> >> On 06/01/18 04:23, Icenowy Zheng wrote:
> >>> The Allwinner H6 pin controllers (both the main one and the CPUs one)
> >>> have no bus gate clocks.
> >>>
> >>> Add support for this kind of pin controllers.
> >>>
> >>> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> >>> ---
> >>>  drivers/pinctrl/sunxi/pinctrl-sunxi.c | 30 ++++++++++++++++++++-----=
-----
> >>>  drivers/pinctrl/sunxi/pinctrl-sunxi.h |  1 +
> >>>  2 files changed, 21 insertions(+), 10 deletions(-)
> >>>
> >>> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/=
sunxi/pinctrl-sunxi.c
> >>> index 4b6cb25bc796..68cd505679d9 100644
> >>> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> >>> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> >>> @@ -1182,7 +1182,12 @@ static int sunxi_pinctrl_setup_debounce(struct=
 sunxi_pinctrl *pctl,
> >>>       unsigned int hosc_div, losc_div;
> >>>       struct clk *hosc, *losc;
> >>>       u8 div, src;
> >>> -     int i, ret;
> >>> +     int i, ret, clk_count;
> >>> +
> >>> +     if (pctl->desc->without_bus_gate)
> >>> +             clk_count =3D 2;
> >>> +     else
> >>> +             clk_count =3D 3;
> >>>
> >>>       /* Deal with old DTs that didn't have the oscillators */
> >>>       if (of_count_phandle_with_args(node, "clocks", "#clock-cells") =
!=3D 3)
> >>> @@ -1360,15 +1365,19 @@ int sunxi_pinctrl_init_with_variant(struct pl=
atform_device *pdev,
> >>>                       goto gpiochip_error;
> >>>       }
> >>>
> >>> -     clk =3D devm_clk_get(&pdev->dev, NULL);
> >>> -     if (IS_ERR(clk)) {
> >>> -             ret =3D PTR_ERR(clk);
> >>> -             goto gpiochip_error;
> >>> -     }
> >>> +     if (!desc->without_bus_gate) {
> >>
> >> Do we really need explicit support for that case?
> >> Can't we have something that works automatically?
> >>
> >> if (node has clock-names property)              (A)
> >>         use clocks as enumerated and named there
> >=20
> > You still need to know if the hardware has a bus gate or not.
> > If it's missing, and it's disabled, you end up with unusable
> > hardware.
>=20
> Yes. So what? If you have a broken DT, it will not work. Just don't do
> it. I don't understand why we want to defend against this case.

This is not the point, but rather: if we have a way to detect easily
that the device tree is missing a property that is missing in our
binding, why shouldn't we do it?

We're already doing it for reg and interrupts for example, why not for
the clocks?

> > Unless you are fully trusting the device tree to be correct.
>=20
> Sorry, but what else do we trust?
>=20
> > IMHO that makes for hard to find bugs during SoC bringup.
>=20
> I am not sure if that is really an issue. I would expect people
> doing SoC bringup to be able to cope with those kinds of problems.

Riiiight, because it worked so well in the past. We definitely didn't
overlooked some clocks used for debouncing in this particular driver,
or some to get the timekeeping right in the RTC.

The argument that "anyone who codes in the kernel should just know
better" doesn't work, on multiple levels. Because anyone that actually
knows better can make a mistake or overlook some feature (because you
didn't have your morning coffee yet, or because it was undocumented)
and because you just make someone that doesn't feel bad.

So, yes, we cannot not trust the device tree. But if we have a way to
detect simple mistakes in the binding, we should also do it.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--7drrvdoa2nxa6d2m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlpXPzsACgkQ0rTAlCFN
r3STBBAAgzef5mg3tiKwcvnzxF+7bu4TOupVshYzUGF7oNbd1EwADSvm5npmSA7G
4DmjpWK40cge5wl2NoIcY4erpDd7jA4k+v0gI942QTsgYWjr+j+2VWQ16gOXM2mT
Qz+x2JhtRLkHNXXUNNl3yCYIPYKmALF3q4p/3GL0FWlTKYZOV5GxdIrWYcDHBwka
EEtpXSpVRC97d7rFQhB29ecLO8wyZLLe0Af8yTp76FzFOFUqBAFOvlaqN+9F2nFq
ducZNasGbiDXSJ7AXQXCkYwTBNc5y5PjxF5r6mt746tNO9BgiW/8D65VEsw5Znvy
dqhuYFHI9wGAZruQDeSUyoj9eNrrFJLfUJhth1wscnVSqq1okBEoAWSiOM1UDIZz
b5RMUEFCm6fBDiVzOqofwnI6bBCAjkEohhe9vEESIfI8frSfz6pwFHA0uYIK5/C/
vjXyeBRZ1j8KUstH9dDyl30RbCvd1QtQynwRj2av6da7fNqh43xBHJ4EaIZoMUpz
Fed7Ki7KXerVDsjIFwiINd3cBcq+6ZHIZf1C5ifVnTB3H9XKVa2u/RT1lnG/Wf6k
euwIOqPTf4HPldY03fY0Y58sgrKnqAq0Y9VqNMthWOSnrFvNxj+9ZkI8ajfYgXTu
Qfxawe6RF/c0f4aGgJVoGtgdBEYw8AyYszlclFnjrhV20kBlJ64=
=adHW
-----END PGP SIGNATURE-----

--7drrvdoa2nxa6d2m--
