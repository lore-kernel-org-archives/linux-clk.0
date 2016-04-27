Return-Path: <heiko@sntech.de>
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Joel Stanley <joel@jms.id.au>
Cc: linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Jeremy Kerr <jk@ozlabs.org>, mturquette@baylibre.com, sboyd@codeaurora.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 03/11] doc/devicetree: Add Aspeed clock bindings
Date: Wed, 27 Apr 2016 11:12:41 +0200
Message-ID: <4459295.XmBqACy0jk@diego>
In-Reply-To: <CACPK8XfvLR+yZv77C0Eq=RsPOufrwvQjdPtBhnufNc=eJRLZYg@mail.gmail.com>
References: <1461225849-28074-1-git-send-email-joel@jms.id.au> <4956403.scaVRGhPEf@diego> <CACPK8XfvLR+yZv77C0Eq=RsPOufrwvQjdPtBhnufNc=eJRLZYg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
List-ID: <linux-clk.vger.kernel.org>

Hi Joel,

Am Mittwoch, 27. April 2016, 18:01:00 schrieb Joel Stanley:
> On Thu, Apr 21, 2016 at 8:50 PM, Heiko St=FCbner <heiko@sntech.de> wr=
ote:
> > [+clock-related patches should include clock-maintainers and lists]=

>=20
> Thanks.
>=20
> > Am Donnerstag, 21. April 2016, 17:34:01 schrieb Joel Stanley:
> >> +For example:
> >> +
> >> +     clk_clkin: clk_clkin {
> >> +             #clock-cells =3D <0>;
> >> +             compatible =3D "fixed-clock";
> >> +             clock-frequency =3D <48000000>;
> >> +     };
> >> +
> >> +     clk_hpll: clk_hpll {
> >> +             compatible =3D "aspeed,g4-hpll-clock";
> >> +             #clock-cells =3D <0>;
> >> +             reg =3D <0x1e6e2008 0x4>;
> >> +     };
> >> +
> >> +     clk_apb: clk_apb@1e6e2008 {
> >> +             #clock-cells =3D <0>;
> >> +             compatible =3D "aspeed,g4-apb-clock";
> >> +             reg =3D <0x1e6e2008 0x4>;
> >> +             clocks =3D <&clk_hpll>;
> >> +     };
> >=20
> > You have both the hpll and apb_clk in the same register (probably e=
ven
> > more
> > clocks?) and separate clock instances where each instance will of_i=
omap
> > the
> > register itself (and thus multiple times in general).
>=20
> Yep. I agree that's not ideal.
>=20
> > From what I remember exposing the clock controller as one block (in=
stead
> > of
> > declaring each clock individually in the dts) is still the preferre=
d way
> > but I don't think I can find Mike's mail from back then easily.
>=20
> I can't picture how that would look. I took my lead from the moxart
> clock driver; is there a better example that I should follow?

qcom, samsung, rockchip, hisilicon, imx, ...

I guess the design would depend on the actual layout of your clock- / s=
ystem-
controller - aka what else is contained there.


Heiko
