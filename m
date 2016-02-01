Return-Path: <moinejf@free.fr>
Date: Mon, 1 Feb 2016 19:40:00 +0100
From: Jean-Francois Moine <moinejf@free.fr>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai
 <wens@csie.org>, linux-sunxi@googlegroups.com, Arnd Bergmann
 <arnd@arndb.de>, Emilio =?ISO-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, Jens Kuske
 <jenskuske@gmail.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 06/11] clk: sunxi: add generic multi-parent bus clock
 gates driver
Message-Id: <20160201194000.282a253b14a2ab35df8b8cc7@free.fr>
In-Reply-To: <1454348370-3816-7-git-send-email-andre.przywara@arm.com>
References: <1454348370-3816-1-git-send-email-andre.przywara@arm.com>
	<1454348370-3816-7-git-send-email-andre.przywara@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
List-ID: <linux-clk.vger.kernel.org>

On Mon,  1 Feb 2016 17:39:25 +0000
Andre Przywara <andre.przywara@arm.com> wrote:

> The Allwinner H3 SoC introduced bus clock gates with potentially
> different parents per clock gate. The H3 driver chose to hardcode the
> actual parent clock relation in the code.
> Add a new driver (which has the potential to drive the H3 and also
> the simple clock gates as well) which uses the power of DT to describe
> this relationship in an elegant and flexible way.
> Using one subnode for every parent clock we get away with a single
> DT compatible match, which can be used as a fallback value in the
> actual DTs without the need to add specific compatible strings to the
> code.  This avoids adding a new driver or function for every new SoC.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
> Changelog RFC .. v1:
> - fix IRQ muxes to cover the three banks of the SoC
> - amend naming of PCM pins
>=20
>  drivers/clk/sunxi/Makefile          |   1 +
>  drivers/clk/sunxi/clk-multi-gates.c | 105 ++++++++++++++++++++++++++++++=
++++++
>  2 files changed, 106 insertions(+)
>  create mode 100644 drivers/clk/sunxi/clk-multi-gates.c
	[snip]

Glad to see that things are moving to the right way. Thanks.

Acked-by: Jean-Francois Moine <moinejf@free.fr>

--=20
Ken ar c'henta=F1	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/
