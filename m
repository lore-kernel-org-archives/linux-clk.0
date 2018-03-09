Return-Path: <LW@karo-electronics.de>
Date: Fri, 9 Mar 2018 17:02:21 +0100
From: Lothar =?UTF-8?B?V2HDn21hbm4=?= <LW@KARO-electronics.de>
To: Martin Kaiser <martin@kaiser.cx>
Cc: Fabio Estevam <festevam@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel
 <linux-kernel@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio
 Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, linux-clk
 <linux-clk@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM
 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] clk: imx25: set correct parents for ssi ipg clocks
Message-ID: <20180309170221.1c8bf8a1@karo-electronics.de>
In-Reply-To: <20180308164654.GA31199@botnar.kaiser.cx>
References: <1520373735-13699-1-git-send-email-martin@kaiser.cx>
	<CAOMZO5A7W4rbPbZB8ERs518obrg+6F6mDeojkwJaGComFAJB0A@mail.gmail.com>
	<20180308140851.GA25601@botnar.kaiser.cx>
	<CAOMZO5BdBWExt9FvPrfUG74Y62e4EUs6cqFyfVs5JuUtym00hQ@mail.gmail.com>
	<20180308164654.GA31199@botnar.kaiser.cx>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi,

On Thu, 8 Mar 2018 17:46:54 +0100 Martin Kaiser wrote:
> Hi Fabio,
>=20
> thanks for the quick response.
>=20
> Thus wrote Fabio Estevam (festevam@gmail.com):
>=20
> > Hi Martin,
>=20
> > On Thu, Mar 8, 2018 at 11:08 AM, Martin Kaiser <martin@kaiser.cx> wrote:
> > > Hi Fabio,
>=20
> > > Thus wrote Fabio Estevam (festevam@gmail.com):
>=20
> > >> I get audio working from SSI1, but I guess this is due to the fact
> > >> that the bootloader enables the SSI clock:
>=20
> > >> I have the following in U-Boot:
>=20
> > >> /* Enable the clocks */
> > >> DATA 4 0x53f8000c 0x1fffffff
> > >> DATA 4 0x53f80010 0xffffffff
> > >> DATA 4 0x53f80014 0xfdfff
>=20
> > > I'm using the same initial settings.
>=20
> > > Nevertheless, ssi1_ipg_per is disbled after loading the kernel.
>=20
> > > Digging into this a bit more, it turned out that without my patch,
> > > clk_disable_unused() recognizes ssi1_ipg_per as unused and disables i=
t.
>=20
> > > If my patch is applied and ssi1_ipg_per is declared as parent of
> > > ssi1_ipg, clk_disable_unused() will not disable it and fsl_ssi_startu=
p()
> > > will enable both ssi1_ipg_per and ssi1_ipg before playing sound.
>=20
> > I can get audio to work fine without your patch on a mx25pdk.
>=20
> this is surprising. How come the ssi1_ipg_per clock is not turned off by
> clk_disable_unused()? Where is it used? Do you have
>=20
> <&clks 55>
>=20
> anywhere in your DT?
>=20
> > In the other i.MX clock drivers we have this same pattern:
>=20
> > clks[IMX6SL_CLK_SSI1_IPG]     =3D imx_clk_gate2_shared("ssi1_ipg",     =
"ipg",
>=20
> It seems to the that imx25 uses a different clock hierarchy for ssi than =
other
> imx chips.
>=20
> Documentation/devicetree/bindings/clock/imx25-clock.txt: ssi1_ipg_per    =
  55
> Documentation/devicetree/bindings/clock/imx25-clock.txt: ssi2_ipg_per    =
  56
> Documentation/devicetree/bindings/clock/imx25-clock.txt: ssi1_ipg    117
> Documentation/devicetree/bindings/clock/imx25-clock.txt: ssi2_ipg    118
> Documentation/devicetree/bindings/clock/imx31-clock.txt: ssi1_gate       =
     32
> Documentation/devicetree/bindings/clock/imx31-clock.txt: ssi2_gate       =
     52
> Documentation/devicetree/bindings/clock/imx35-clock.txt: ssi_sel        22
> Documentation/devicetree/bindings/clock/imx35-clock.txt: ssi1_div_pre    =
  23
> Documentation/devicetree/bindings/clock/imx35-clock.txt: ssi1_div_post   =
  24
> Documentation/devicetree/bindings/clock/imx35-clock.txt: ssi2_div_pre    =
  25
> Documentation/devicetree/bindings/clock/imx35-clock.txt: ssi2_div_post   =
  26
> Documentation/devicetree/bindings/clock/imx35-clock.txt: ssi1_gate      68
> Documentation/devicetree/bindings/clock/imx35-clock.txt: ssi2_gate      69
>=20
> Others don't have ssiX_ipg_per.
>=20
> > It is not clear to me what is the real issue this patch is trying to fi=
x.
>=20
> True. This needs clarification.
>=20
> I found that, in oder to get a tx clock out of the SSI, both ssi1_ipg_per=
 and
> ssi1_ipg clocks must be active.
>=20
> The fsl_ssi driver only activates ssi1_ipg.
>=20
> If I activate ssi1_ipg_per in the bootloader, clk_disable_unused() deacti=
vates it.
>=20
> (My codec chip does not use a dedicated clock line. It takes the bit cloc=
k that
> is the output of SSI. Are you maybe using ssi1_ipg_per for your codec and
> enable it there?)
>=20
> In my first mail, I was wondering about imx25 uart1, where we also have
> uart1_ipg and uart_ipg_per and the clock seeting is
>=20
>    clk[uart1_ipg] =3D imx_clk_gate("uart1_ipg", "ipg", ccm(CCM_CGCR2), 14=
);
>=20
> In this case, both uart1 and uart_ipg_per are listed in the device tree
>=20
>          uart1: serial@43f90000 {                                        =
                                                             =20
> ...
>             clocks =3D <&clks 120>, <&clks 57>;                          =
                                                               =20
>             clock-names =3D "ipg", "per";                                =
                                                               =20
>          };                                                              =
                                                             =20
>=20
> Documentation/devicetree/bindings/clock/imx25-clock.txt
>    uart_ipg_per      57
>    uart1_ipg      120
>=20
> and the driver enables both clocks explicitly. So they are not unused.
>=20
>=20
> Doing something like this is not an option for ssi, this will not work wi=
th
> imx31, 35 etc.
>=20
> Therefore, I suggest setting ssi1_ipg_per as parent of ssi1_ipg.
>
The right wayto fix this is to add the missing ipg_per clock to the DTB
rather than introducing a bogus clock relationship that doesn't exist
in hardware.
The sound/soc/fsl/fsl_ssi.c driver does already handle a second clock
as bitclock. It only needs to be specified in the DTB:
&ssi1 {
	clocks =3D <&clks 117>, <&clk 55>;
	clock-names =3D "ipg", "baud";
};


Lothar Wa=C3=9Fmann
