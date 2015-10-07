Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: Xing Zheng <zhengxing@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/9] clk: rockchip: add clock controller for rk3036
Date: Wed, 07 Oct 2015 12:24:32 +0200
Message-ID: <2653032.av3sFfN860@phil>
In-Reply-To: <56036EAE.9040201@rock-chips.com>
References: <1442478540-15068-1-git-send-email-zhengxing@rock-chips.com> <5603683F.4020302@rock-chips.com> <56036EAE.9040201@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
List-ID: <linux-clk.vger.kernel.org>

Hi,

Am Donnerstag, 24. September 2015, 11:31:58 schrieb Xing Zheng:
> On 2015=E5=B9=B409=E6=9C=8824=E6=97=A5 11:04, Xing Zheng wrote:
> >>>   #define RK3066_PLL_RATE(_rate, _nr, _nf, _no)    \
> >>>=20
> >>> @@ -95,12 +106,31 @@ enum rockchip_pll_type {
> >>>=20
> >>>       .nb =3D _nb,                        \
> >>>  =20
> >>>   }
> >>>=20
> >>> +#define RK3036_PLL_RATE(_rate, _refdiv, _fbdiv, _postdiv1,    \
> >>> +            _postdiv2, _dsmpd, _frac)        \
> >>> +{                                \
> >>> +    .rate    =3D _rate##U,                    \
> >>> +    .fbdiv =3D _fbdiv,                    \
> >>> +    .postdiv1 =3D _postdiv1,                    \
> >>> +    .refdiv =3D _refdiv,                    \
> >>> +    .postdiv2 =3D _postdiv2,                    \
> >>> +    .dsmpd =3D _dsmpd,                    \
> >>> +    .frac =3D _frac,                        \
> >>> +}
> >>> +
> >>>=20
> >>>   struct rockchip_pll_rate_table {
> >>>  =20
> >>>       unsigned long rate;
> >>>       unsigned int nr;
> >>>       unsigned int nf;
> >>>       unsigned int no;
> >>>       unsigned int nb;
> >>>=20
> >>> +    /* for RK3036 */
> >>> +    unsigned int fbdiv;
> >>> +    unsigned int postdiv1;
> >>> +    unsigned int refdiv;
> >>> +    unsigned int postdiv2;
> >>> +    unsigned int dsmpd;
> >>> +    unsigned int frac;
> >>=20
> >> same for these 2 ... should be part of the pll addition itself
> >>=20
> >   };
> >=20
> > Done.
>=20
> Sorry, I have one question:
> The "struct rockchip_pll_rate_table" is called in "rockchip/clk-pll.c=
"
> on many functions, I think I could add a struct like:
> struct rk3036_pll_rate_table {
>      unsigned int fbdiv;
>      unsigned int postdiv1;
>      unsigned int refdiv;
>      unsigned int postdiv2;
>      unsigned int dsmpd;
>      unsigned int frac;
> };
> but, it will add many redundancy codes in "rockchip/clk-pll.c" just f=
or
> call "struct rk3036_pll_rate_table".


One possible solution may be to cast to void* in the general functions,=
 so=20
have sturct rk3066_pll_rate_table, rk3036_pll_rate_table, have=20
rockchip_clk_register_pll and friends handle it as void* and then only =
have=20
the rockchip_rk3066_pll_* functions as well as the clk-rkxxxx.c use the=
m as=20
their actual type, as they know which they need.


Heiko
