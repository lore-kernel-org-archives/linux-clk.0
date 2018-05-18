Return-Path: <jernej.skrabec@siol.net>
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To: Sergey Suloev <ssuloev@orpaltech.com>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>, Catalin Marinas <catalin.marinas@arm.com>, Michael Turquette <mturquette@baylibre.com>, linux-sunxi@googlegroups.com, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>, Michael Trimarchi <michael@amarulasolutions.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Icenowy Zheng <icenowy@aosc.io>
Subject: Re: [PATCH v2 12/26] drm/sun4i: Add support for multiple DW HDMI PHY clock parents
Date: Fri, 18 May 2018 17:15:44 +0200
Message-ID: <3135535.HuDyCXIRmt@jernej-laptop>
In-Reply-To: <824c6989-7930-86dc-1195-494580f6cb38@orpaltech.com>
References: <20180518094536.17201-1-jagan@amarulasolutions.com> <4909574.Q3IFWM0xt6@jernej-laptop> <824c6989-7930-86dc-1195-494580f6cb38@orpaltech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

Hi,

Dne petek, 18. maj 2018 ob 17:09:40 CEST je Sergey Suloev napisal(a):
> Hi, guys,
>=20
> On 05/18/2018 05:46 PM, Jernej =C5=A0krabec wrote:
> > Hi,
> >=20
> > Dne petek, 18. maj 2018 ob 12:01:16 CEST je Maxime Ripard napisal(a):
> >> On Fri, May 18, 2018 at 03:15:22PM +0530, Jagan Teki wrote:
> >>> From: Jernej Skrabec <jernej.skrabec@siol.net>
> >>>=20
> >>> Some SoCs with DW HDMI have multiple possible clock parents, like A64
> >>> and R40.
> >>>=20
> >>> Expand HDMI PHY clock driver to support second clock parent.
> >>>=20
> >>> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> >>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> >>> ---
> >>> Changes for v2:
> >>> - new patch
> >>>=20
> >>>   drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h      |  9 ++-
> >>>   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c     | 33 ++++++++---
> >>>   drivers/gpu/drm/sun4i/sun8i_hdmi_phy_clk.c | 89
> >>>   ++++++++++++++++++++++-------- 3 files changed, 96 insertions(+), 35
> >>>   deletions(-)
> >>>=20
> >>> diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
> >>> b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h index 79154f0f674a..303189d66=
02c
> >>> 100644
> >>> --- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
> >>> +++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
> >>> @@ -98,7 +98,8 @@
> >>>=20
> >>>   #define SUN8I_HDMI_PHY_PLL_CFG1_LDO2_EN		BIT(29)
> >>>   #define SUN8I_HDMI_PHY_PLL_CFG1_LDO1_EN		BIT(28)
> >>>   #define SUN8I_HDMI_PHY_PLL_CFG1_HV_IS_33	BIT(27)
> >>>=20
> >>> -#define SUN8I_HDMI_PHY_PLL_CFG1_CKIN_SEL	BIT(26)
> >>> +#define SUN8I_HDMI_PHY_PLL_CFG1_CKIN_SEL_MSK	BIT(26)
> >>> +#define SUN8I_HDMI_PHY_PLL_CFG1_CKIN_SEL_SHIFT	26
> >>>=20
> >>>   #define SUN8I_HDMI_PHY_PLL_CFG1_PLLEN		BIT(25)
> >>>   #define SUN8I_HDMI_PHY_PLL_CFG1_LDO_VSET(x)	((x) << 22)
> >>>   #define SUN8I_HDMI_PHY_PLL_CFG1_UNKNOWN(x)	((x) << 20)
> >>>=20
> >>> @@ -146,7 +147,7 @@
> >>>=20
> >>>   struct sun8i_hdmi_phy;
> >>>  =20
> >>>   struct sun8i_hdmi_phy_variant {
> >>>=20
> >>> -	bool has_phy_clk;
> >>> +	int  phy_clk_num;
> >>>=20
> >>>   	void (*phy_init)(struct sun8i_hdmi_phy *phy);
> >>>   	void (*phy_disable)(struct dw_hdmi *hdmi,
> >>>   =09
> >>>   			    struct sun8i_hdmi_phy *phy);
> >>>=20
> >>> @@ -160,6 +161,7 @@ struct sun8i_hdmi_phy {
> >>>=20
> >>>   	struct clk			*clk_mod;
> >>>   	struct clk			*clk_phy;
> >>>   	struct clk			*clk_pll0;
> >>>=20
> >>> +	struct clk			*clk_pll1;
> >>>=20
> >>>   	unsigned int			rcal;
> >>>   	struct regmap			*regs;
> >>>   	struct reset_control		*rst_phy;
> >>>=20
> >>> @@ -188,6 +190,7 @@ void sun8i_hdmi_phy_remove(struct sun8i_dw_hdmi
> >>> *hdmi);
> >>>=20
> >>>   void sun8i_hdmi_phy_init(struct sun8i_hdmi_phy *phy);
> >>>   const struct dw_hdmi_phy_ops *sun8i_hdmi_phy_get_ops(void);
> >>>=20
> >>> -int sun8i_phy_clk_create(struct sun8i_hdmi_phy *phy, struct device
> >>> *dev);
> >>> +int sun8i_phy_clk_create(struct sun8i_hdmi_phy *phy, struct device
> >>> *dev,
> >>> +			 int clk_num);
> >>>=20
> >>>   #endif /* _SUN8I_DW_HDMI_H_ */
> >>>=20
> >>> diff --git a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
> >>> b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c index
> >>> 5a52fc489a9d..0eadf087fc46
> >>> 100644
> >>> --- a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
> >>> +++ b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
> >>> @@ -183,7 +183,13 @@ static int sun8i_hdmi_phy_config_h3(struct dw_hd=
mi
> >>> *hdmi,>
> >>>=20
> >>>   	regmap_update_bits(phy->regs, SUN8I_HDMI_PHY_ANA_CFG1_REG,
> >>>   =09
> >>>   			   SUN8I_HDMI_PHY_ANA_CFG1_TXEN_MASK, 0);
> >>>=20
> >>> -	regmap_write(phy->regs, SUN8I_HDMI_PHY_PLL_CFG1_REG, pll_cfg1_init);
> >>> +	/*
> >>> +	 * NOTE: We have to be careful not to overwrite PHY parent
> >>> +	 * clock selection bit and clock divider.
> >>> +	 */
> >>> +	regmap_update_bits(phy->regs, SUN8I_HDMI_PHY_PLL_CFG1_REG,
> >>> +			   (u32)~SUN8I_HDMI_PHY_PLL_CFG1_CKIN_SEL_MSK,
> >>> +			   pll_cfg1_init);
> >>>=20
> >>>   	regmap_update_bits(phy->regs, SUN8I_HDMI_PHY_PLL_CFG2_REG,
> >>>   =09
> >>>   			   (u32)~SUN8I_HDMI_PHY_PLL_CFG2_PREDIV_MSK,
> >>>   			   pll_cfg2_init);
> >>>=20
> >>> @@ -232,7 +238,7 @@ static int sun8i_hdmi_phy_config(struct dw_hdmi
> >>> *hdmi,
> >>> void *data,>
> >>>=20
> >>>   	regmap_update_bits(phy->regs, SUN8I_HDMI_PHY_DBG_CTRL_REG,
> >>>   =09
> >>>   			   SUN8I_HDMI_PHY_DBG_CTRL_POL_MASK, val);
> >>>=20
> >>> -	if (phy->variant->has_phy_clk)
> >>> +	if (phy->variant->phy_clk_num)
> >>>=20
> >>>   		clk_set_rate(phy->clk_phy, mode->crtc_clock * 1000);
> >>>   =09
> >>>   	return phy->variant->phy_config(hdmi, phy, mode->crtc_clock * 1000=
);
> >>>=20
> >>> @@ -393,7 +399,7 @@ static const struct sun8i_hdmi_phy_variant
> >>> sun8i_a83t_hdmi_phy =3D {>
> >>>=20
> >>>   };
> >>>  =20
> >>>   static const struct sun8i_hdmi_phy_variant sun8i_h3_hdmi_phy =3D {
> >>>=20
> >>> -	.has_phy_clk =3D true,
> >>> +	.phy_clk_num =3D 1,
> >>>=20
> >>>   	.phy_init =3D &sun8i_hdmi_phy_init_h3,
> >>>   	.phy_disable =3D &sun8i_hdmi_phy_disable_h3,
> >>>   	.phy_config =3D &sun8i_hdmi_phy_config_h3,
> >>>=20
> >>> @@ -464,7 +470,7 @@ int sun8i_hdmi_phy_probe(struct sun8i_dw_hdmi *hd=
mi,
> >>> struct device_node *node)>
> >>>=20
> >>>   		goto err_put_clk_bus;
> >>>   =09
> >>>   	}
> >>>=20
> >>> -	if (phy->variant->has_phy_clk) {
> >>> +	if (phy->variant->phy_clk_num) {
> >>>=20
> >>>   		phy->clk_pll0 =3D of_clk_get_by_name(node, "pll-0");
> >>>   		if (IS_ERR(phy->clk_pll0)) {
> >>>   	=09
> >>>   			dev_err(dev, "Could not get pll-0 clock\n");
> >>>=20
> >>> @@ -472,7 +478,16 @@ int sun8i_hdmi_phy_probe(struct sun8i_dw_hdmi
> >>> *hdmi,
> >>> struct device_node *node)>
> >>>=20
> >>>   			goto err_put_clk_mod;
> >>>   	=09
> >>>   		}
> >>>=20
> >>> -		ret =3D sun8i_phy_clk_create(phy, dev);
> >>> +		if (phy->variant->phy_clk_num) {
> >>> +			phy->clk_pll1 =3D of_clk_get_by_name(node, "pll-1");
> >>> +			if (IS_ERR(phy->clk_pll1)) {
> >>> +				dev_err(dev, "Could not get pll-1 clock\n");
> >>> +				ret =3D PTR_ERR(phy->clk_pll1);
> >>> +				goto err_put_clk_mod;
> >>> +			}
> >>> +		}
> >>> +
> >>=20
> >> You have a bug here. If phy_clk_num =3D=3D 1, you'll still try to look=
up
> >> pll-1.
> >=20
> > This is actually WIP patch taken from my github. This issue was fixed
> > already locally on disk. I thought Jagan will not use it until SRAM C
> > patches land.>=20
> >> And this is a bit sloppy, since if phy_clk_num =3D=3D 3, you won't try=
 to
> >> lookup pll-2 either.
> >=20
> > It is highly unlikely this will be higher than 2, at least for this HDMI
> > PHY, since it has only 1 bit reserved for parent selection. But since I
> > have to fix it, I'll add ">=3D 2"
> >=20
> >>> +		ret =3D sun8i_phy_clk_create(phy, dev, phy->variant->phy_clk_num);
> >>>=20
> >>>   		if (ret) {
> >>>   	=09
> >>>   			dev_err(dev, "Couldn't create the PHY clock\n");
> >>>   			goto err_put_clk_pll0;
> >>>=20
> >>> @@ -515,8 +530,8 @@ int sun8i_hdmi_phy_probe(struct sun8i_dw_hdmi *hd=
mi,
> >>> struct device_node *node)>
> >>>=20
> >>>   err_put_rst_phy:
> >>>   	reset_control_put(phy->rst_phy);
> >>>  =20
> >>>   err_put_clk_pll0:
> >>> -	if (phy->variant->has_phy_clk)
> >>> -		clk_put(phy->clk_pll0);
> >>> +	clk_put(phy->clk_pll0);
> >>> +	clk_put(phy->clk_pll1);
> >>>=20
> >>>   err_put_clk_mod:
> >>>   	clk_put(phy->clk_mod);
> >>>  =20
> >>>   err_put_clk_bus:
> >>> @@ -536,8 +551,8 @@ void sun8i_hdmi_phy_remove(struct sun8i_dw_hdmi
> >>> *hdmi)
> >>>=20
> >>>   	reset_control_put(phy->rst_phy);
> >>>=20
> >>> -	if (phy->variant->has_phy_clk)
> >>> -		clk_put(phy->clk_pll0);
> >>> +	clk_put(phy->clk_pll0);
> >>> +	clk_put(phy->clk_pll1);
> >>>=20
> >>>   	clk_put(phy->clk_mod);
> >>>   	clk_put(phy->clk_bus);
> >>>  =20
> >>>   }
> >>>=20
> >>> diff --git a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy_clk.c
> >>> b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy_clk.c index
> >>> faea449812f8..85b12fc96dbc 100644
> >>> --- a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy_clk.c
> >>> +++ b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy_clk.c
> >>> @@ -22,29 +22,36 @@ static int sun8i_phy_clk_determine_rate(struct
> >>> clk_hw
> >>> *hw,>
> >>>=20
> >>>   {
> >>>  =20
> >>>   	unsigned long rate =3D req->rate;
> >>>   	unsigned long best_rate =3D 0;
> >>>=20
> >>> -	struct clk_hw *parent;
> >>> +	struct clk_hw *best_parent =3D NULL;
> >>> +	struct clk_hw *parent =3D NULL;
> >>>=20
> >>>   	int best_div =3D 1;
> >>>=20
> >>> -	int i;
> >>> +	int i, p;
> >>>=20
> >>> -	parent =3D clk_hw_get_parent(hw);
> >>> -
> >>> -	for (i =3D 1; i <=3D 16; i++) {
> >>> -		unsigned long ideal =3D rate * i;
> >>> -		unsigned long rounded;
> >>> -
> >>> -		rounded =3D clk_hw_round_rate(parent, ideal);
> >>> -
> >>> -		if (rounded =3D=3D ideal) {
> >>> -			best_rate =3D rounded;
> >>> -			best_div =3D i;
> >>> -			break;
> >>> -		}
> >>> +	for (p =3D 0; p < clk_hw_get_num_parents(hw); p++) {
> >>> +		parent =3D clk_hw_get_parent_by_index(hw, p);
> >>> +		if (!parent)
> >>> +			continue;
> >>>=20
> >>> -		if (!best_rate ||
> >>> -		    abs(rate - rounded / i) <
> >>> -		    abs(rate - best_rate / best_div)) {
> >>> -			best_rate =3D rounded;
> >>> -			best_div =3D i;
> >>> +		for (i =3D 1; i <=3D 16; i++) {
> >>> +			unsigned long ideal =3D rate * i;
> >>> +			unsigned long rounded;
> >>> +
> >>> +			rounded =3D clk_hw_round_rate(parent, ideal);
> >>> +
> >>> +			if (rounded =3D=3D ideal) {
> >>> +				best_rate =3D rounded;
> >>> +				best_div =3D i;
> >>> +				best_parent =3D parent;
> >>> +				break;
> >>> +			}
> >>> +
> >>> +			if (!best_rate ||
> >>> +			    abs(rate - rounded / i) <
> >>> +			    abs(rate - best_rate / best_div)) {
> >>> +				best_rate =3D rounded;
> >>> +				best_div =3D i;
> >>> +				best_parent =3D parent;
> >>> +			}
> >>>=20
> >>>   		}
> >>>   =09
> >>>   	}
> >>>=20
> >>> @@ -95,22 +102,58 @@ static int sun8i_phy_clk_set_rate(struct clk_hw
> >>> *hw,
> >>> unsigned long rate,>
> >>>=20
> >>>   	return 0;
> >>>  =20
> >>>   }
> >>>=20
> >>> +static u8 sun8i_phy_clk_get_parent(struct clk_hw *hw)
> >>> +{
> >>> +	struct sun8i_phy_clk *priv =3D hw_to_phy_clk(hw);
> >>> +	u32 reg;
> >>> +
> >>> +	regmap_read(priv->phy->regs, SUN8I_HDMI_PHY_PLL_CFG1_REG, &reg);
> >>> +	reg =3D (reg & SUN8I_HDMI_PHY_PLL_CFG1_CKIN_SEL_MSK) >>
> >>> +	      SUN8I_HDMI_PHY_PLL_CFG1_CKIN_SEL_SHIFT;
> >>> +
> >>> +	return reg;
> >>> +}
> >>> +
> >>> +static int sun8i_phy_clk_set_parent(struct clk_hw *hw, u8 index)
> >>> +{
> >>> +	struct sun8i_phy_clk *priv =3D hw_to_phy_clk(hw);
> >>> +
> >>> +	if (index > 1)
> >>> +		return -EINVAL;
> >>> +
> >>> +	regmap_update_bits(priv->phy->regs, SUN8I_HDMI_PHY_PLL_CFG1_REG,
> >>> +			   SUN8I_HDMI_PHY_PLL_CFG1_CKIN_SEL_MSK,
> >>> +			   index << SUN8I_HDMI_PHY_PLL_CFG1_CKIN_SEL_SHIFT);
> >>> +
> >>> +	return 0;
> >>> +}
> >>> +
> >>=20
> >> The DT bindings changes and the clk changes should be part of separate
> >> patches.
> >=20
> > By DT bindings changes you mean code which reads DT and not DT
> > documentation, right?
> >=20
> > Ok, I'll split it.
> >=20
> > BTW, I'll resend fixed version of this patch for my R40 HDMI series, si=
nce
> > there is nothing to hold it back, unlike for this.
> >=20
> > Best regards,
> > Jernej
> >=20
> >=20
> >=20
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>=20
> you have been talking about SRAM patches, required for A64 DE2, for
> about a half a year.
> May I ask you to explain in a couple of words why they are so important ?
> I am really curious because I have DE2 already working on my A64 without
> those magic patches..
>=20

You probably have HDMI enabled in U-Boot, right? If you disable that driver=
 in=20
U-Boot, Linux driver shouldn't work anymore. There is consensus that Linux =
A64=20
DE2 driver shouldn't rely on U-Boot setting bits. Those SRAM C patches will=
=20
probably also affect how DT DE2 entries are written, especially if it will =
be=20
implemented as a bus, as once proposed by Icenowy.

Best regards,
Jernej
