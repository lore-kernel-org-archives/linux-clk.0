Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Chen-Yu Tsai <wens@csie.org>, "Chen-Yu Tsai" <wens@csie.org>
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <CAGb2v64-=1Byzo-h=7Pq=HK9Xx01KaTKT89Nx6jVWUc_kqthyg@mail.gmail.com>
Cc: "Maxime Ripard" <maxime.ripard@free-electrons.com>,
 "Stephen Boyd" <sboyd@codeaurora.org>,
 "linux-arm-kernel" <linux-arm-kernel@lists.infradead.org>,
 "linux-clk" <linux-clk@vger.kernel.org>
References: <1438364782-3968-1-git-send-email-maxime.ripard@free-electrons.com>
 <1438364782-3968-6-git-send-email-maxime.ripard@free-electrons.com>
 <CAGb2v64nvA1K=Ya7_99-2G1LtFjcuj+qQbO1GJaqsL+yPF+Xdw@mail.gmail.com>
 <CAGb2v64-=1Byzo-h=7Pq=HK9Xx01KaTKT89Nx6jVWUc_kqthyg@mail.gmail.com>
Message-ID: <20150811175019.2416.93864@quantum>
Subject: Re: [PATCH v2 5/7] ARM: sun8i: Add clock indices
Date: Tue, 11 Aug 2015 10:50:19 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Chen-Yu Tsai (2015-08-10 21:49:54)
> On Sat, Aug 8, 2015 at 12:21 AM, Chen-Yu Tsai <wens@csie.org> wrote:
> > On Sat, Aug 1, 2015 at 1:46 AM, Maxime Ripard
> > <maxime.ripard@free-electrons.com> wrote:
> >> The A23 and A33 gates have a non continuous set of clock IDs that are
> >> valid. Add the clock-indices property to the DT to express this.
> >>
> >> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> >> ---
> >>  arch/arm/boot/dts/sun8i-a23-a33.dtsi | 15 +++++++++++++++
> >>  1 file changed, 15 insertions(+)
> >>
> >> diff --git a/arch/arm/boot/dts/sun8i-a23-a33.dtsi b/arch/arm/boot/dts/=
sun8i-a23-a33.dtsi
> >> index 7abd0ae3143d..c318c770b6c1 100644
> >> --- a/arch/arm/boot/dts/sun8i-a23-a33.dtsi
> >> +++ b/arch/arm/boot/dts/sun8i-a23-a33.dtsi
> >> @@ -180,6 +180,15 @@
> >>                         compatible =3D "allwinner,sun8i-a23-ahb1-gates=
-clk";
> >>                         reg =3D <0x01c20060 0x8>;
> >>                         clocks =3D <&ahb1>;
> >> +                       clock-indices =3D <1>, <6>,
> >
> > Turns out the A33 (and I assume the same with the A23) has
> > an ahb1 clock gate for the Security System at clock-index <5>.
> =

> Looks like the A23 does not have this one, nor the SS mod clock.
> =

> > This is found in the updated A33 user manual.
> >
> >> +                                       <8>, <9>, <10>,
> >> +                                       <13>, <14>,
> >> +                                       <19>, <20>,
> >> +                                       <21>, <24>, <26>,
> >> +                                       <29>, <32>, <36>,
> >> +                                       <40>, <44>, <46>,
> >> +                                       <52>, <54>,
> >
> > <53> is ahb1 clock gate for msgbox, again found in A33 manual.
> =

> A23 has this one. Found in Allwinner kernel sources.
> =

> >> +                                       <57>;
> >
> > <58> is ahb1 clock gate for SAT, which seems to be part of the
> > display pipeline.
> =

> This one is A33 only.
> =

> I guess we should do a separate compatible for A33 AHB1 clock gates.

ChenYu,

I believe Maxime is on vacation. I told him that I would pick these
patches directly. It looks like your comments can be fixed up in
follow-up patches at a later date, correct?

If so then I will apply them to clk-next.

Regards,
Mike

> =

> ChenYu
> =

> >>                         clock-output-names =3D "ahb1_mipidsi", "ahb1_d=
ma",
> >>                                         "ahb1_mmc0", "ahb1_mmc1", "ahb=
1_mmc2",
> >>                                         "ahb1_nand", "ahb1_sdram",
> >> @@ -196,6 +205,8 @@
> >>                         compatible =3D "allwinner,sun8i-a23-apb1-gates=
-clk";
> >>                         reg =3D <0x01c20068 0x4>;
> >>                         clocks =3D <&apb1>;
> >> +                       clock-indices =3D <0>, <5>,
> >> +                                       <12>, <13>;
> >>                         clock-output-names =3D "apb1_codec", "apb1_pio=
",
> >>                                         "apb1_daudio0", "apb1_daudio1";
> >>                 };
> >> @@ -213,6 +224,10 @@
> >>                         compatible =3D "allwinner,sun8i-a23-apb2-gates=
-clk";
> >>                         reg =3D <0x01c2006c 0x4>;
> >>                         clocks =3D <&apb2>;
> >> +                       clock-indices =3D <0>, <1>,
> >> +                                       <2>, <16>,
> >> +                                       <17>, <18>,
> >> +                                       <19>, <20>;
> >>                         clock-output-names =3D "apb2_i2c0", "apb2_i2c1=
",
> >>                                         "apb2_i2c2", "apb2_uart0",
> >>                                         "apb2_uart1", "apb2_uart2",
> >> --
> >> 2.4.6
> >>
> >
> > Not sure if you want to add the clocks I mentioned together
> > in this patch, or do a separate patch.
> >
> > The rest look good.
> >
> > ChenYu
> =

> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
