Return-Path: <prvs=0612a99263=mike.looijmans@topicproducts.com>
Subject: Re: [PATCH] clk: Add driver for the si544 clock generator chip
To: Dan Carpenter <dan.carpenter@oracle.com>, <kbuild@01.org>
CC: <kbuild-all@01.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <robh+dt@kernel.org>,
	<mark.rutland@arm.com>
References: <20180315103517.qkdqagrasoogp3yj@mwanda>
From: Mike Looijmans <mike.looijmans@topic.nl>
Message-ID: <846a65b6-0a4e-7f64-d421-840573917630@topic.nl>
Date: Thu, 15 Mar 2018 12:05:06 +0100
MIME-Version: 1.0
In-Reply-To: <20180315103517.qkdqagrasoogp3yj@mwanda>
Content-Type: text/plain; charset="utf-8"; format=flowed
List-ID: <linux-clk.vger.kernel.org>

=EF=BB=BFOn 15-03-18 11:35, Dan Carpenter wrote:
> Hi Mike,
>=20
> Thank you for the patch! Perhaps something to improve:
>=20
> [auto build test WARNING on v4.16-rc4]
> [also build test WARNING on next-20180314]
> [if your patch is applied to the wrong git tree, please drop us a note to=
 help improve the system]
>=20
> url:    https://github.com/0day-ci/linux/commits/Mike-Looijmans/clk-Add-d=
river-for-the-si544-clock-generator-chip/20180314-122736
>=20
> smatch warnings:
> drivers/clk/clk-si544.c:188 si544_calc_muldiv() warn: impossible conditio=
n '((frequency * tmp) >=3D 10800000000) =3D> (0-u32max >=3D 10800000000)'

Indeed, there's a u64 cast missing.

I've also missed that the hs_div cannot be odd when ls_div is non-zero.

I'll compose a v2 patch fixing these issues.

> # https://github.com/0day-ci/linux/commit/aba3d3de8751c1457bcf0b75bcc901f=
289a18426
> git remote add linux-review https://github.com/0day-ci/linux
> git remote update linux-review
> git checkout aba3d3de8751c1457bcf0b75bcc901f289a18426
> vim +188 drivers/clk/clk-si544.c
>=20
> aba3d3de Mike Looijmans 2018-03-13  168
> aba3d3de Mike Looijmans 2018-03-13  169  /* Calculate divider settings fo=
r a given frequency */
> aba3d3de Mike Looijmans 2018-03-13  170  static int si544_calc_muldiv(str=
uct clk_si544_muldiv *settings,
> aba3d3de Mike Looijmans 2018-03-13  171  	unsigned long frequency)
> aba3d3de Mike Looijmans 2018-03-13  172  {
> aba3d3de Mike Looijmans 2018-03-13  173  	u64 vco;
> aba3d3de Mike Looijmans 2018-03-13  174  	u32 ls_freq;
> aba3d3de Mike Looijmans 2018-03-13  175  	u32 tmp;
> aba3d3de Mike Looijmans 2018-03-13  176  	u8 res;
> aba3d3de Mike Looijmans 2018-03-13  177
> aba3d3de Mike Looijmans 2018-03-13  178  	/* Determine the minimum value =
of LS_DIV and resulting target freq. */
> aba3d3de Mike Looijmans 2018-03-13  179  	ls_freq =3D frequency;
> aba3d3de Mike Looijmans 2018-03-13  180  	settings->ls_div_bits =3D 0;
> aba3d3de Mike Looijmans 2018-03-13  181
> aba3d3de Mike Looijmans 2018-03-13  182  	if (frequency >=3D (FVCO_MIN / =
HS_DIV_MAX))
> aba3d3de Mike Looijmans 2018-03-13  183  		settings->ls_div_bits =3D 0;
> aba3d3de Mike Looijmans 2018-03-13  184  	else {
> aba3d3de Mike Looijmans 2018-03-13  185  		res =3D 1;
> aba3d3de Mike Looijmans 2018-03-13  186  		tmp =3D 2 * HS_DIV_MAX;
> aba3d3de Mike Looijmans 2018-03-13  187  		while (tmp <=3D (HS_DIV_MAX * =
32)) {
> aba3d3de Mike Looijmans 2018-03-13 @188  			if ((frequency * tmp) >=3D FV=
CO_MIN)
> aba3d3de Mike Looijmans 2018-03-13  189  				break;
> aba3d3de Mike Looijmans 2018-03-13  190  			++res;
> aba3d3de Mike Looijmans 2018-03-13  191  			tmp <<=3D 1;
> aba3d3de Mike Looijmans 2018-03-13  192  		}
> aba3d3de Mike Looijmans 2018-03-13  193  		settings->ls_div_bits =3D res;
> aba3d3de Mike Looijmans 2018-03-13  194  		ls_freq =3D frequency << res;
> aba3d3de Mike Looijmans 2018-03-13  195  	}
> aba3d3de Mike Looijmans 2018-03-13  196
> aba3d3de Mike Looijmans 2018-03-13  197  	/* Determine minimum HS_DIV by =
rounding up */
> aba3d3de Mike Looijmans 2018-03-13  198  	vco =3D FVCO_MIN + ls_freq - 1;
> aba3d3de Mike Looijmans 2018-03-13  199  	do_div(vco, ls_freq);
> aba3d3de Mike Looijmans 2018-03-13  200  	settings->hs_div =3D vco;
> aba3d3de Mike Looijmans 2018-03-13  201  	/* round up to even number if n=
eeded */
> aba3d3de Mike Looijmans 2018-03-13  202  	if ((settings->hs_div > HS_DIV_=
MAX_ODD) && (settings->hs_div & 1))
> aba3d3de Mike Looijmans 2018-03-13  203  		++settings->hs_div;
> aba3d3de Mike Looijmans 2018-03-13  204  	/* Calculate VCO frequency (in =
10..12GHz range) */
> aba3d3de Mike Looijmans 2018-03-13  205  	vco =3D (u64)ls_freq * settings=
->hs_div;
> aba3d3de Mike Looijmans 2018-03-13  206  	/* Calculate the integer part o=
f the feedback divider */
> aba3d3de Mike Looijmans 2018-03-13  207  	tmp =3D do_div(vco, FXO);
> aba3d3de Mike Looijmans 2018-03-13  208  	settings->fb_div_int =3D vco;
> aba3d3de Mike Looijmans 2018-03-13  209  	/* And the fractional bits usin=
g the remainder */
> aba3d3de Mike Looijmans 2018-03-13  210  	vco =3D (u64)tmp << 32;
> aba3d3de Mike Looijmans 2018-03-13  211  	do_div(vco, FXO);
> aba3d3de Mike Looijmans 2018-03-13  212  	settings->fb_div_frac =3D vco;
> aba3d3de Mike Looijmans 2018-03-13  213
> aba3d3de Mike Looijmans 2018-03-13  214  	return 0;
> aba3d3de Mike Looijmans 2018-03-13  215  }
> aba3d3de Mike Looijmans 2018-03-13  216
>=20
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Ce=
nter
> https://lists.01.org/pipermail/kbuild-all                   Intel Corpora=
tion
>=20



Kind regards,

Mike Looijmans
System Expert

TOPIC Products
Materiaalweg 4, NL-5681 RJ Best
Postbus 440, NL-5680 AK Best
Telefoon: +31 (0) 499 33 69 79
E-mail: mike.looijmans@topicproducts.com
Website: www.topicproducts.com

Please consider the environment before printing this e-mail
