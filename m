Return-Path: <heiko@sntech.de>
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Xing Zheng <zhengxing@rock-chips.com>, linux-rockchip@lists.infradead.org, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/9] clk: rockchip: add new clock type and controller for rk3036
Date: Thu, 01 Oct 2015 01:32:19 +0200
Message-ID: <4123121.bNYOPIrL2s@diego>
In-Reply-To: <20150922231900.GL23081@codeaurora.org>
References: <1442478540-15068-1-git-send-email-zhengxing@rock-chips.com> <2850967.rjRj3AZerS@diego> <20150922231900.GL23081@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen,

Am Dienstag, 22. September 2015, 16:19:00 schrieb Stephen Boyd:
> On 09/23, Heiko St=FCbner wrote:
> > Am Dienstag, 22. September 2015, 15:41:25 schrieb Stephen Boyd:
> > > On 09/17, Xing Zheng wrote:
> > > > +
> > > > +static void rockchip_rk3036_pll_init(struct clk_hw *hw)
> > >=20
> > > init ops are "discouraged". Could we do this through assigned
> > > rates instead?
> >=20
> > really? According to Mike that was a valid use-case when we looked =
for an
> > initial place for that on the rk3288 :-) .
>=20
> A comment in clk.c indicates init ops are discouraged. Maybe this
> is a valid use-case on other platforms so it was allowed, but
> pretty much every time we see a new init op we have to think
> about it and justify it. Hooray!

for the rk3288-variant Mike said
"Looks good to me. I think rk3xxx might be the first user of the .init
callback!" [0]
so it looks like he was convinced of our reasoning at the time :-) .


[0] http://lists.infradead.org/pipermail/linux-rockchip/2014-November/0=
01570.html


> > > > +{
> > > > +=09struct rockchip_clk_pll *pll =3D to_rockchip_clk_pll(hw);
> > > > +=09const struct rockchip_pll_rate_table *rate;
> > > > +=09unsigned int fbdiv, postdiv1, refdiv, postdiv2, dsmpd, frac=
;
> > > > +=09unsigned long drate;
> > > > +=09u32 pllcon;
> > > > +
> > > > +=09if (!(pll->flags & ROCKCHIP_PLL_SYNC_RATE))
> > > > +=09=09return;
> > >=20
> > > I don't understand what this one does though. This check isn't in=

> > > the set rate ops.
> >=20
> > And it shouldn't be :-)
> >=20
> > The issue this whole thing is trying to solve is aligning the pll s=
ettings
> > which what we have in the rate table, not what the bootloader set.
> >=20
> > For example the bootloader could set up a pll at 594MHz with one se=
t of
> > parameters and after some time - when you don't want to exchange
> > bootloaders on shipping devices anymore - it comes to light that a
> > different set of parameters for the same frequency produces for exa=
mple a
> > more stable hdmi signal [I think that was the main reason for the i=
nitial
> > change].
> >=20
> > So we're not changing the frequency x -> y, which could be easily d=
one
> > [and is done already] via assigned-rates, but instead
> >=20
> > =09x {params a,b,c} -> x {params d,e,f}
> >=20
> > so the rate itself stays the same, only the frequency generation is=

> > adapted.
> Ok. It would be nice if this sort of information was made into a
> comment and put in the code. Or at least the commit text for the
> change.
>=20
> And is there any reason that we need to get the parent clock and
> parent rate to align the PLL settings?
> It would be nice if we
> avoided using clk_* APIs in here, by extracting the pll set rate
> code into another function that we can call from init to make the
> values the same without all the fallback to old rates, etc.

I guess you want Xing Zheng to change his pll code somewhat like the
following, right? While starting off as proof-of-concept, that change
below actually does work quite nicely on rk3288 boards.

---------------- 8< --------------------
From: Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH] clk: rockchip: don't use clk_ APIs in the pll init-cal=
lback

Separate the update of pll registers from the actual set_rate function
so that the init callback does not need to access clk-API functions.

As we now have separated the getting and setting of the pll parameters
we can also directly use these new functions in other places too.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/clk/rockchip/clk-pll.c | 135 ++++++++++++++++++++++-----------=
--------
 1 file changed, 74 insertions(+), 61 deletions(-)

diff --git a/drivers/clk/rockchip/clk-pll.c b/drivers/clk/rockchip/clk-=
pll.c
index 7737a1d..4881eb8 100644
--- a/drivers/clk/rockchip/clk-pll.c
+++ b/drivers/clk/rockchip/clk-pll.c
@@ -126,11 +126,32 @@ static int rockchip_pll_wait_lock(struct rockchip=
_clk_pll *pll)
 #define RK3066_PLLCON3_PWRDOWN=09=09(1 << 1)
 #define RK3066_PLLCON3_BYPASS=09=09(1 << 0)
=20
+static void rockchip_rk3066_pll_get_params(struct rockchip_clk_pll *pl=
l,
+=09=09=09=09=09struct rockchip_pll_rate_table *rate)
+{
+=09u32 pllcon;
+
+=09pllcon =3D readl_relaxed(pll->reg_base + RK3066_PLLCON(0));
+=09rate->nr =3D ((pllcon >> RK3066_PLLCON0_NR_SHIFT)
+=09=09=09=09& RK3066_PLLCON0_NR_MASK) + 1;
+=09rate->no =3D ((pllcon >> RK3066_PLLCON0_OD_SHIFT)
+=09=09=09=09& RK3066_PLLCON0_OD_MASK) + 1;
+
+=09pllcon =3D readl_relaxed(pll->reg_base + RK3066_PLLCON(1));
+=09rate->nf =3D ((pllcon >> RK3066_PLLCON1_NF_SHIFT)
+=09=09=09=09& RK3066_PLLCON1_NF_MASK) + 1;
+
+=09pllcon =3D readl_relaxed(pll->reg_base + RK3066_PLLCON(2));
+=09rate->nb =3D ((pllcon >> RK3066_PLLCON2_NB_SHIFT)
+=09=09=09=09& RK3066_PLLCON2_NB_MASK) + 1;
+}
+
 static unsigned long rockchip_rk3066_pll_recalc_rate(struct clk_hw *hw=
,
 =09=09=09=09=09=09     unsigned long prate)
 {
 =09struct rockchip_clk_pll *pll =3D to_rockchip_clk_pll(hw);
-=09u64 nf, nr, no, rate64 =3D prate;
+=09struct rockchip_pll_rate_table cur;
+=09u64 rate64 =3D prate;
 =09u32 pllcon;
=20
 =09pllcon =3D readl_relaxed(pll->reg_base + RK3066_PLLCON(3));
@@ -140,53 +161,31 @@ static unsigned long rockchip_rk3066_pll_recalc_r=
ate(struct clk_hw *hw,
 =09=09return prate;
 =09}
=20
-=09pllcon =3D readl_relaxed(pll->reg_base + RK3066_PLLCON(1));
-=09nf =3D (pllcon >> RK3066_PLLCON1_NF_SHIFT) & RK3066_PLLCON1_NF_MASK=
;
-
-=09pllcon =3D readl_relaxed(pll->reg_base + RK3066_PLLCON(0));
-=09nr =3D (pllcon >> RK3066_PLLCON0_NR_SHIFT) & RK3066_PLLCON0_NR_MASK=
;
-=09no =3D (pllcon >> RK3066_PLLCON0_OD_SHIFT) & RK3066_PLLCON0_OD_MASK=
;
+=09rockchip_rk3066_pll_get_params(pll, &cur);
=20
-=09rate64 *=3D (nf + 1);
-=09do_div(rate64, nr + 1);
-=09do_div(rate64, no + 1);
+=09rate64 *=3D cur.nf;
+=09do_div(rate64, cur.nr);
+=09do_div(rate64, cur.no);
=20
 =09return (unsigned long)rate64;
 }
=20
-static int rockchip_rk3066_pll_set_rate(struct clk_hw *hw, unsigned lo=
ng drate,
-=09=09=09=09=09unsigned long prate)
+static int rockchip_rk3066_pll_set_params(struct rockchip_clk_pll *pll=
,
+=09=09=09=09const struct rockchip_pll_rate_table *rate)
 {
-=09struct rockchip_clk_pll *pll =3D to_rockchip_clk_pll(hw);
-=09const struct rockchip_pll_rate_table *rate;
-=09unsigned long old_rate =3D rockchip_rk3066_pll_recalc_rate(hw, prat=
e);
-=09struct regmap *grf =3D rockchip_clk_get_grf();
-=09struct clk_mux *pll_mux =3D &pll->pll_mux;
 =09const struct clk_ops *pll_mux_ops =3D pll->pll_mux_ops;
+=09struct clk_mux *pll_mux =3D &pll->pll_mux;
+=09struct rockchip_pll_rate_table cur;
 =09int rate_change_remuxed =3D 0;
 =09int cur_parent;
 =09int ret;
=20
-=09if (IS_ERR(grf)) {
-=09=09pr_debug("%s: grf regmap not available, aborting rate change\n",=

-=09=09=09 __func__);
-=09=09return PTR_ERR(grf);
-=09}
-
-=09pr_debug("%s: changing %s from %lu to %lu with a parent rate of %lu=
\n",
-=09=09 __func__, clk_hw_get_name(hw), old_rate, drate, prate);
-
-=09/* Get required rate settings from table */
-=09rate =3D rockchip_get_pll_settings(pll, drate);
-=09if (!rate) {
-=09=09pr_err("%s: Invalid rate : %lu for pll clk %s\n", __func__,
-=09=09=09drate, clk_hw_get_name(hw));
-=09=09return -EINVAL;
-=09}
-
 =09pr_debug("%s: rate settings for %lu (nr, no, nf): (%d, %d, %d)\n",
 =09=09 __func__, rate->rate, rate->nr, rate->no, rate->nf);
=20
+=09rockchip_rk3066_pll_get_params(pll, &cur);
+=09cur.rate =3D 0;
+
 =09cur_parent =3D pll_mux_ops->get_parent(&pll_mux->hw);
 =09if (cur_parent =3D=3D PLL_MODE_NORM) {
 =09=09pll_mux_ops->set_parent(&pll_mux->hw, PLL_MODE_SLOW);
@@ -219,9 +218,9 @@ static int rockchip_rk3066_pll_set_rate(struct clk_=
hw *hw, unsigned long drate,
 =09/* wait for the pll to lock */
 =09ret =3D rockchip_pll_wait_lock(pll);
 =09if (ret) {
-=09=09pr_warn("%s: pll did not lock, trying to restore old rate %lu\n"=
,
-=09=09=09__func__, old_rate);
-=09=09rockchip_rk3066_pll_set_rate(hw, old_rate, prate);
+=09=09pr_warn("%s: pll update unsucessful, trying to restore old param=
s\n",
+=09=09=09__func__);
+=09=09rockchip_rk3066_pll_set_params(pll, &cur);
 =09}
=20
 =09if (rate_change_remuxed)
@@ -230,6 +229,34 @@ static int rockchip_rk3066_pll_set_rate(struct clk=
_hw *hw, unsigned long drate,
 =09return ret;
 }
=20
+static int rockchip_rk3066_pll_set_rate(struct clk_hw *hw, unsigned lo=
ng drate,
+=09=09=09=09=09unsigned long prate)
+{
+=09struct rockchip_clk_pll *pll =3D to_rockchip_clk_pll(hw);
+=09const struct rockchip_pll_rate_table *rate;
+=09unsigned long old_rate =3D rockchip_rk3066_pll_recalc_rate(hw, prat=
e);
+=09struct regmap *grf =3D rockchip_clk_get_grf();
+
+=09if (IS_ERR(grf)) {
+=09=09pr_debug("%s: grf regmap not available, aborting rate change\n",=

+=09=09=09 __func__);
+=09=09return PTR_ERR(grf);
+=09}
+
+=09pr_debug("%s: changing %s from %lu to %lu with a parent rate of %lu=
\n",
+=09=09 __func__, clk_hw_get_name(hw), old_rate, drate, prate);
+
+=09/* Get required rate settings from table */
+=09rate =3D rockchip_get_pll_settings(pll, drate);
+=09if (!rate) {
+=09=09pr_err("%s: Invalid rate : %lu for pll clk %s\n", __func__,
+=09=09=09drate, clk_hw_get_name(hw));
+=09=09return -EINVAL;
+=09}
+
+=09return rockchip_rk3066_pll_set_params(pll, rate);
+}
+
 static int rockchip_rk3066_pll_enable(struct clk_hw *hw)
 {
 =09struct rockchip_clk_pll *pll =3D to_rockchip_clk_pll(hw);
@@ -261,9 +288,8 @@ static void rockchip_rk3066_pll_init(struct clk_hw =
*hw)
 {
 =09struct rockchip_clk_pll *pll =3D to_rockchip_clk_pll(hw);
 =09const struct rockchip_pll_rate_table *rate;
-=09unsigned int nf, nr, no, nb;
+=09struct rockchip_pll_rate_table cur;
 =09unsigned long drate;
-=09u32 pllcon;
=20
 =09if (!(pll->flags & ROCKCHIP_PLL_SYNC_RATE))
 =09=09return;
@@ -275,34 +301,21 @@ static void rockchip_rk3066_pll_init(struct clk_h=
w *hw)
 =09if (!rate)
 =09=09return;
=20
-=09pllcon =3D readl_relaxed(pll->reg_base + RK3066_PLLCON(0));
-=09nr =3D ((pllcon >> RK3066_PLLCON0_NR_SHIFT) & RK3066_PLLCON0_NR_MAS=
K) + 1;
-=09no =3D ((pllcon >> RK3066_PLLCON0_OD_SHIFT) & RK3066_PLLCON0_OD_MAS=
K) + 1;
-
-=09pllcon =3D readl_relaxed(pll->reg_base + RK3066_PLLCON(1));
-=09nf =3D ((pllcon >> RK3066_PLLCON1_NF_SHIFT) & RK3066_PLLCON1_NF_MAS=
K) + 1;
-
-=09pllcon =3D readl_relaxed(pll->reg_base + RK3066_PLLCON(2));
-=09nb =3D ((pllcon >> RK3066_PLLCON2_NB_SHIFT) & RK3066_PLLCON2_NB_MAS=
K) + 1;
+=09rockchip_rk3066_pll_get_params(pll, &cur);
=20
 =09pr_debug("%s: pll %s@%lu: nr (%d:%d); no (%d:%d); nf(%d:%d), nb(%d:=
%d)\n",
-=09=09 __func__, clk_hw_get_name(hw), drate, rate->nr, nr,
-=09=09rate->no, no, rate->nf, nf, rate->nb, nb);
-=09if (rate->nr !=3D nr || rate->no !=3D no || rate->nf !=3D nf
-=09=09=09=09=09     || rate->nb !=3D nb) {
-=09=09struct clk_hw *parent =3D clk_hw_get_parent(hw);
-=09=09unsigned long prate;
-
-=09=09if (!parent) {
-=09=09=09pr_warn("%s: parent of %s not available\n",
-=09=09=09=09__func__, clk_hw_get_name(hw));
+=09=09 __func__, clk_hw_get_name(hw), drate, rate->nr, cur.nr,
+=09=09 rate->no, cur.no, rate->nf, cur.nf, rate->nb, cur.nb);
+=09if (rate->nr !=3D cur.nr || rate->no !=3D cur.no || rate->nf !=3D c=
ur.nf
+=09=09=09=09=09=09     || rate->nb !=3D cur.nb) {
+=09=09struct regmap *grf =3D rockchip_clk_get_grf();
+
+=09=09if (IS_ERR(grf))
 =09=09=09return;
-=09=09}
=20
 =09=09pr_debug("%s: pll %s: rate params do not match rate table, adjus=
ting\n",
 =09=09=09 __func__, clk_hw_get_name(hw));
-=09=09prate =3D clk_hw_get_rate(parent);
-=09=09rockchip_rk3066_pll_set_rate(hw, drate, prate);
+=09=09rockchip_rk3066_pll_set_params(pll, rate);
 =09}
 }
=20
--=20
2.5.3
---------------- 8< --------------------

Heiko
