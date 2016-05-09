Return-Path: <moinejf@free.fr>
Date: Mon, 9 May 2016 09:39:58 +0200
From: Jean-Francois Moine <moinejf@free.fr>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@codeaurora.org>, Chen-Yu Tsai <wens@csie.org>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Vishnu Patekar
 <vishnupatekar0510@gmail.com>, Andre Przywara <andre.przywara@arm.com>,
 Hans de Goede <hdegoede@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 15/16] clk: sunxi-ng: Add H3 clocks
Message-Id: <20160509093958.26e9549f8ce78888c0e9586a@free.fr>
In-Reply-To: <1462737711-10017-16-git-send-email-maxime.ripard@free-electrons.com>
References: <1462737711-10017-1-git-send-email-maxime.ripard@free-electrons.com>
	<1462737711-10017-16-git-send-email-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
List-ID: <linux-clk.vger.kernel.org>

On Sun,  8 May 2016 22:01:50 +0200
Maxime Ripard <maxime.ripard@free-electrons.com> wrote:

> Add the list of clocks and resets found in the H3 CCU.
>=20
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> ---
>  drivers/clk/sunxi-ng/Makefile        |   2 +
>  drivers/clk/sunxi-ng/ccu-sun8i-h3.c  | 757 +++++++++++++++++++++++++++++=
++++++
>  include/dt-bindings/clock/sun8i-h3.h | 162 ++++++++
>  include/dt-bindings/reset/sun8i-h3.h | 103 +++++
>  4 files changed, 1024 insertions(+)
>  create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-h3.c
>  create mode 100644 include/dt-bindings/clock/sun8i-h3.h
>  create mode 100644 include/dt-bindings/reset/sun8i-h3.h
>=20
> diff --git a/drivers/clk/sunxi-ng/Makefile b/drivers/clk/sunxi-ng/Makefile
> index c794f57b6fb1..67ff6a92f124 100644
> --- a/drivers/clk/sunxi-ng/Makefile
> +++ b/drivers/clk/sunxi-ng/Makefile
> @@ -13,3 +13,5 @@ obj-y +=3D ccu_nkmp.o
>  obj-y +=3D ccu_nm.o
>  obj-y +=3D ccu_p.o
>  obj-y +=3D ccu_phase.o
> +
> +obj-y +=3D ccu-sun8i-h3.o

+obj-$(CONFIG_MACH_SUN8I) +=3D ccu-sun8i-h3.o

should be better.

--=20
Ken ar c'henta=F1	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/
