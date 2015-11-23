Return-Path: <jszhang@marvell.com>
Date: Mon, 23 Nov 2015 15:21:58 +0800
From: Jisheng Zhang <jszhang@marvell.com>
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
CC: <robh+dt@kernel.org>, <pawel.moll@arm.com>, <mark.rutland@arm.com>,
        <ijc+devicetree@hellion.org.uk>, <galak@codeaurora.org>,
        <catalin.marinas@arm.com>, <will.deacon@arm.com>,
        <mturquette@baylibre.com>, <sboyd@codeaurora.org>,
        <antoine.tenart@free-electrons.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v2 6/6] arm64: dts: berlin4ct: add pll and clock nodes
Message-ID: <20151123152158.483aa6b5@xhacker>
In-Reply-To: <564F8B73.7070403@gmail.com>
References: <1448008952-1787-1-git-send-email-jszhang@marvell.com>
	<1448008952-1787-7-git-send-email-jszhang@marvell.com>
	<564F8B73.7070403@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
List-ID: <linux-clk.vger.kernel.org>

Dear Sebastian,

On Fri, 20 Nov 2015 22:06:59 +0100
Sebastian Hesselbarth wrote:

> On 20.11.2015 09:42, Jisheng Zhang wrote:
> > Add syspll, mempll, cpupll, gateclk and berlin-clk nodes.
> >=20
> > Signed-off-by: Jisheng Zhang <jszhang@marvell.com>
> > ---
> >  arch/arm64/boot/dts/marvell/berlin4ct.dtsi | 38 ++++++++++++++++++++++=
++++++++
> >  1 file changed, 38 insertions(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/marvell/berlin4ct.dtsi b/arch/arm64/bo=
ot/dts/marvell/berlin4ct.dtsi
> > index a4a1876..808a997 100644
> > --- a/arch/arm64/boot/dts/marvell/berlin4ct.dtsi
> > +++ b/arch/arm64/boot/dts/marvell/berlin4ct.dtsi
> > @@ -42,6 +42,7 @@
> >   *     OTHER DEALINGS IN THE SOFTWARE.
> >   */
> > =20
> > +#include <dt-bindings/clock/berlin4ct.h>
> >  #include <dt-bindings/interrupt-controller/arm-gic.h>
> > =20
> >  / {
> > @@ -135,6 +136,22 @@
> >  			interrupts =3D <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_=
HIGH)>;
> >  		};
> > =20
> > +		cpupll: cpupll {
> > +			compatible =3D "marvell,berlin-pll";
> > +			reg =3D <0x922000 0x14>, <0xea0710 4>;
> > +			#clock-cells =3D <0>;
> > +			clocks =3D <&osc>, <&clk CLK_CPUFASTREF>;
> > +			bypass-shift =3D /bits/ 8 <2>;
> > +		};
> > +
> > +		mempll: mempll {
> > +			compatible =3D "marvell,berlin-pll";
> > +			reg =3D <0x940034 0x14>, <0xea0710 4>; =20
>=20
> Whenever you see overlapping/repeating reg ranges, e.g. <0xea0710 4>
> you can be sure you are not representing HW structure but driver
> structure here.
>=20
> Please merge clocks/gates/plls to a single clock complex node
> and deal with the internals by using "simple-mfd" and "syscon" regmaps.
>=20
> > +			#clock-cells =3D <0>;
> > +			clocks =3D <&osc>, <&clk CLK_MEMFASTREF>;
> > +			bypass-shift =3D /bits/ 8 <1>;
> > +		};
> > +
> >  		apb@e80000 {
> >  			compatible =3D "simple-bus";
> >  			#address-cells =3D <1>;
> > @@ -225,6 +242,27 @@
> >  			};
> >  		};
> > =20
> > +		syspll: syspll {
> > +			compatible =3D "marvell,berlin-pll";
> > +			reg =3D <0xea0200 0x14>, <0xea0710 4>;
> > +			#clock-cells =3D <0>;
> > +			clocks =3D <&osc>;
> > +			bypass-shift =3D /bits/ 8 <0>;
> > +		};
> > +
> > +		gateclk: gateclk {
> > +			compatible =3D "marvell,berlin4ct-gateclk";
> > +			reg =3D <0xea0700 4>;
> > +			#clock-cells =3D <1>;
> > +		};
> > +
> > +		clk: clk {
> > +			compatible =3D "marvell,berlin4ct-clk";
> > +			reg =3D <0xea0720 0x144>; =20
>=20
> Looking at the reg ranges, I'd say that they are all clock related
> and pretty close to each other:
>=20
> gateclk: reg =3D <0xea0700 4>;
> bypass:  reg =3D <0xea0710 4>;
> clk:     reg =3D <0xea0720 0x144>;

Although these ranges sit close, but we should represent HW structure as you
said.

First of all, let me describe the clks/plls in BG4CT. BG4CT contains:

two kinds of PLL: normal PLL and AVPLL. These PLLs are put with their users
together. For example: mempll pll registers <0xf7940034, 0x14> is put toget=
her
with mem controller registers. AVPLL control registers are put with AV devi=
ces.
You can also check mempll, cpupll and syspll ranges:

cpupll: <0x922000 0x14>

mempll: <0x940034 0x14>

syspll: <0xea0200 0x14>


We have three normal PLLS: cpupll, mempll and syspll. All these three PLLs =
use
25MHZ osc as clocksource. These plls can be bypassed. when syspll is bypass=
ed
the 25MHZ osc is directly output to syspllclk. When mempll/cpupll is bypass=
ed,
its corresponding fastrefclk is directly output to ddrphyclk/cpuclk:=20


       ---25MHZ osc----------|\
           ________            | |-- syspllclk
       ---| SYSPLL |---------|/



       ---cpufastrefclk------|\
           ________            | |-- cpuclk
       ---| CPUPLL |---------|/


       ---memfastrefclk------|\
           ________            | |-- ddrphyclk
       ---| MEMPLL |---------|/

NOTE: the fastrefclk is the so called normal clk below.



two kinds of clk: normal clk and gate clk. The normal clk supports changing
divider, selecting clock source, disabling/enabling etc. The gate clk only
supports disabling/enabling. normal clks use syspllclk as clocksource, while
gate clks use perifsysclk as clocksource.


So what's the representing HW structure in fact? Here is my proposal:

1. have mempll, cpupll and syspll node in dts

2. one gateclk node in dts for gateclks

3. one normalclk node in dts for normal clks

4. one ccf clock-mux for cpuclk, ddrphyclk and syspllclk.

what do you think?


=46rom another side, let's have a look at driver/clk/mvebu. As can be seen,
different clks register are close each other, for example, gateclk and core=
clk
in arch/arm/boot/dts/armada-xp.dtsi.

And drivers/clk/sunxi, arch/arm/boot/dts/sun7i-a20.dtsi, the pll4, pll12, g=
t_clk
and ahb*, apb* etc...=20

why these SoCs don't merge clocks/gates/plls to a single clock complex node=
?=20
I think that's because they are representing real HW structure.

Thanks,
Jisheng


>=20
> So, please just follow the OF/driver structure we already
> have for Berlin2.
>=20
> Sebastian
>=20
> > +			#clock-cells =3D <1>;
> > +			clocks =3D <&syspll>;
> > +		};
> > +
> >  		soc_pinctrl: pin-controller@ea8000 {
> >  			compatible =3D "marvell,berlin4ct-soc-pinctrl";
> >  			reg =3D <0xea8000 0x14>;
> >  =20
>=20
