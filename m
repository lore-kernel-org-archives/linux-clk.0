Return-Path: <moinejf@free.fr>
Date: Tue, 2 Feb 2016 07:52:39 +0100
From: Jean-Francois Moine <moinejf@free.fr>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Mike Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, Jens Kuske <jenskuske@gmail.com>,
 Vishnu Patekar <vishnupatekar0510@gmail.com>, Hans de Goede
 <hdegoede@redhat.com>, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 2/2] clk: sunxi: Refactor A31 PLL6 so that it can be
 reused
Message-Id: <20160202075239.e4318e9dced1eeed29c593f6@free.fr>
In-Reply-To: <20160201201754.GI4652@lukather>
References: <1454008958-12655-1-git-send-email-maxime.ripard@free-electrons.com>
	<1454008958-12655-2-git-send-email-maxime.ripard@free-electrons.com>
	<20160130185714.7abcf1de9ef8108c2f48c7fe@free.fr>
	<20160201201754.GI4652@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
List-ID: <linux-clk.vger.kernel.org>

On Mon, 1 Feb 2016 21:17:54 +0100
Maxime Ripard <maxime.ripard@free-electrons.com> wrote:

> > Also, for the H3 PLL periph1 (aka PLL8), why didn't you create a
> > 'pll8x2' clock with 'pll8' as a divider?
>=20
> No one seems to use it. We can always add it later in a separate
> patch when someone will.

Well, then, I don't understand. The pll periph/peripheral/periph0,
aka PLL6 works well for many SoCs and there is no need to change
its DT definition.

In the patch header, you wrote:

> Remove the fixed dividers from the PLL6 driver to be able to have a
> reusable driver that can be used across several SoCs that share the same
> controller, but don't have the same set of dividers for this clock, and to
> also be reused multiple times in the same SoC, since we're droping the
> clock name.

then, for the H3, you do
(the comment should be "until pll8 can be reused"),

> -		/* dummy clock until pll6 can be reused */
> -		pll8: pll8_clk {
> +		pll8: clk@01c20044 {
>  			#clock-cells =3D <0>;
> -			compatible =3D "fixed-clock";
> -			clock-frequency =3D <1>;
> +			compatible =3D "allwinner,sun6i-a31-pll6-clk";
> +			reg =3D <0x01c20044 0x4>;
> +			clocks =3D <&osc24M>;
>  			clock-output-names =3D "pll8";
>  		};

that is, you add the PLL8, don't you?

And, further, you change the MMC clocks:

> @@ -243,7 +243,7 @@
>  			#clock-cells =3D <1>;
>  			compatible =3D "allwinner,sun4i-a10-mmc-clk";
>  			reg =3D <0x01c20088 0x4>;
> -			clocks =3D <&osc24M>, <&pll6 0>, <&pll8>;
> +			clocks =3D <&osc24M>, <&pll6>, <&pll8>;
>  			clock-output-names =3D "mmc0",
>  					     "mmc0_output",
>  					     "mmc0_sample";

where the PLL8 is already used.

So, how can you say

> No one seems to use it. We can always add it later in a separate
> patch when someone will.

?

--=20
Ken ar c'henta=F1	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/
