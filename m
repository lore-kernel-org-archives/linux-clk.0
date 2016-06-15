Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Kevin Hilman <khilman@baylibre.com>, 
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <m260tbsigp.fsf@baylibre.com>
Cc: linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org,
 carlo@endlessm.com, victor.wan@amlogic.com, jerry.cao@amlogic.com,
 xing.xu@amlogic.com
References: <1465518774-26924-1-git-send-email-mturquette@baylibre.com>
 <1465518774-26924-8-git-send-email-mturquette@baylibre.com>
 <m260tbsigp.fsf@baylibre.com>
Message-ID: <20160615014148.5467.29763@quark.deferred.io>
Subject: Re: [PATCH 7/7] arm64: dts: gxbb clock controller
Date: Tue, 14 Jun 2016 18:41:48 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Kevin Hilman (2016-06-14 12:01:26)
> Michael Turquette <mturquette@baylibre.com> writes:
> =

> > Add the clock controller node for the AmLogic GXBB machine.
> >
> > Signed-off-by: Michael Turquette <mturquette@baylibre.com>
> > ---
> >  arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/b=
oot/dts/amlogic/meson-gxbb.dtsi
> > index 832815d..3badfab 100644
> > --- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
> > +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
> > @@ -174,5 +174,12 @@
> >                       #size-cells =3D <2>;
> >                       ranges =3D <0x0 0x0 0x0 0xd0000000 0x0 0x200000>;
> >               };
> > +
> > +             clkc: clock-controller@c883c000 {
> > +                     compatible =3D "amlogic,gxbb-clkc";
> > +                     #clock-cells =3D <1>;
> > +                     reg =3D <0x0 0xc883c000 0x0 0x3db>;
> > +             };
> > +
> >       };
> >  };
> =

> minor nit: could you put this under the (recently added) hibus node (at
> offset 0).  See the DT in my for-next branch for reference:

Ah, I had wondered about that. Will do.

Thanks for reviewing,
Mike

> =

> https://git.kernel.org/cgit/linux/kernel/git/khilman/linux-amlogic.git/lo=
g/?h=3Dfor-next
> =

> Thanks,
> =

> Kevin
