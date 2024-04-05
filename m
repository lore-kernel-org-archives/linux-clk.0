Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B164146594;
	Fri,  5 Apr 2024 08:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712305026; cv=none; b=bSoObrM8XwFnPVv6K+rN4b4u4Ez1I0tSqXovhI3ioJzBpXtI7iQUox1K+J4ZQa/6RmUb/Arc75Uu0IduLUhbffWhT/cppqQYwXUiuStZLoFFAsCX9kYr+FYUPk8JDwsjpDTDx2ZXt2Vn6ftP5+6hR2+HVyLCiLtLxAY0J59XxLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712305026; c=relaxed/simple;
	bh=kQskCbsP/oHyzSY7rJKANCSHc9bKHugr17JluR87UFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OmNYd++i6UTgrdih1P8EQdGqVJN9mDLetgWFu3rHriVitdj/Kg+JPgjtrDa+q9zlsOqxO8EGpoc/agB6aBpych3NK6wD+OnSFGAdmZ9oTWh+HEJF6LgTDrtmB9AEhCDTet8AZQDgdqEPZvUf/FNz+LSpCZ6ZGyXBO8nz/T0KW3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ub7y1Y+p; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ub7y1Y+p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 969E6C433C7;
	Fri,  5 Apr 2024 08:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712305026;
	bh=kQskCbsP/oHyzSY7rJKANCSHc9bKHugr17JluR87UFk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ub7y1Y+pKR34NbpbDK0iWxgLxKbpoEJZ99OJQUGG2uZcj4IlZ8qorHVAsmnIsIs2S
	 /1KwB89JC5q38tBlzq014CwLylluTFvowAjoRZdxFjzd+SE/eqo2kiF9lmDVKOPtOD
	 2tDNXJ7oBvZ6vn4Mh5k79LVdQo8ERwpTeTLVqUFf7A/dhUb+rF14M5wThwSv5sNe4B
	 t1wTs1wzckuSdvwt/5rRJcvjCfGU4hYBHEmz8DZVBrHWVFEBt5WZQAbaHTg/QmJU+Q
	 rO1mlgn7h/fBT5QoEnqweQNbq+AE/XR/8qN7isUA3FPvSTljqC6fke3i/sL2aPV7EW
	 JlVMD3lc/eI3w==
Date: Fri, 5 Apr 2024 10:17:02 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-clk@vger.kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
	linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	nbd@nbd.name, john@phrozen.org, devicetree@vger.kernel.org,
	dd@embedd.com, catalin.marinas@arm.com, will@kernel.org,
	upstream@airoha.com, lorenzo.bianconi83@gmail.com
Subject: Re: [PATCH 4/4] clk: en7523: add EN7581 support
Message-ID: <Zg-zfiCTIS5zij2w@lore-desk>
References: <cover.1712160869.git.lorenzo@kernel.org>
 <3aaf638b846ecfdbfc1c903206b7d519d56c9130.1712160869.git.lorenzo@kernel.org>
 <0297a8ab-2f62-4f03-b2ed-87180a47c57c@collabora.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1WYQnZ6cJ3WK870d"
Content-Disposition: inline
In-Reply-To: <0297a8ab-2f62-4f03-b2ed-87180a47c57c@collabora.com>


--1WYQnZ6cJ3WK870d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Il 03/04/24 18:20, Lorenzo Bianconi ha scritto:
> > Introduce EN7581 clock support to clk-en7523 driver.
> >=20
> > Tested-by: Zhengping Zhang <zhengping.zhang@airoha.com>
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > ---
> >   drivers/clk/clk-en7523.c | 130 +++++++++++++++++++++++++++++++++++++--
> >   1 file changed, 125 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
> > index c7def87b74c6..51a6c0cc7f58 100644
> > --- a/drivers/clk/clk-en7523.c
> > +++ b/drivers/clk/clk-en7523.c
> > @@ -4,13 +4,16 @@
> >   #include <linux/clk-provider.h>
> >   #include <linux/io.h>
> >   #include <linux/of.h>
> > +#include <linux/of_device.h>
> >   #include <linux/platform_device.h>
> >   #include <dt-bindings/clock/en7523-clk.h>
> >   #define REG_PCI_CONTROL			0x88
> >   #define   REG_PCI_CONTROL_PERSTOUT	BIT(29)
> >   #define   REG_PCI_CONTROL_PERSTOUT1	BIT(26)
> > +#define   REG_PCI_CONTROL_REFCLK_EN0	BIT(23)
> >   #define   REG_PCI_CONTROL_REFCLK_EN1	BIT(22)
> > +#define   REG_PCI_CONTROL_PERSTOUT2	BIT(16)
> >   #define REG_GSW_CLK_DIV_SEL		0x1b4
> >   #define REG_EMI_CLK_DIV_SEL		0x1b8
> >   #define REG_BUS_CLK_DIV_SEL		0x1bc
> > @@ -18,10 +21,25 @@
> >   #define REG_SPI_CLK_FREQ_SEL		0x1c8
> >   #define REG_NPU_CLK_DIV_SEL		0x1fc
> >   #define REG_CRYPTO_CLKSRC		0x200
> > -#define REG_RESET_CONTROL		0x834
> > +#define REG_RESET_CONTROL2		0x830
>=20
> Wait what? The RESET2 register comes before RESET1 ?!?!
>=20
> Is this a typo? :-)

actually not :)

>=20
> > +#define   REG_RESET2_CONTROL_PCIE2	BIT(27)
> > +#define REG_RESET_CONTROL1		0x834
> >   #define   REG_RESET_CONTROL_PCIEHB	BIT(29)
> >   #define   REG_RESET_CONTROL_PCIE1	BIT(27)
> >   #define   REG_RESET_CONTROL_PCIE2	BIT(26)
> > +/* EN7581 */
> > +#define REG_PCIE0_MEM			0x00
> > +#define REG_PCIE0_MEM_MASK		0x04
> > +#define REG_PCIE1_MEM			0x08
> > +#define REG_PCIE1_MEM_MASK		0x0c
> > +#define REG_PCIE2_MEM			0x10
> > +#define REG_PCIE2_MEM_MASK		0x14
> > +#define REG_PCIE_RESET_OPEN_DRAIN	0x018c
> > +#define REG_PCIE_RESET_OPEN_DRAIN_MASK	GENMASK(2, 0)
> > +#define REG_NP_SCU_PCIC			0x88
> > +#define REG_NP_SCU_SSTR			0x9c
> > +#define REG_PCIE_XSI0_SEL_MASK		GENMASK(14, 13)
> > +#define REG_PCIE_XSI1_SEL_MASK		GENMASK(12, 11)
> >   struct en_clk_desc {
> >   	int id;
> > @@ -207,14 +225,14 @@ static int en7523_pci_prepare(struct clk_hw *hw)
> >   	usleep_range(1000, 2000);
> >   	/* Reset to default */
> > -	val =3D readl(np_base + REG_RESET_CONTROL);
> > +	val =3D readl(np_base + REG_RESET_CONTROL1);
> >   	mask =3D REG_RESET_CONTROL_PCIE1 | REG_RESET_CONTROL_PCIE2 |
> >   	       REG_RESET_CONTROL_PCIEHB;
> > -	writel(val & ~mask, np_base + REG_RESET_CONTROL);
> > +	writel(val & ~mask, np_base + REG_RESET_CONTROL1);
> >   	usleep_range(1000, 2000);
> > -	writel(val | mask, np_base + REG_RESET_CONTROL);
> > +	writel(val | mask, np_base + REG_RESET_CONTROL1);
> >   	msleep(100);
> > -	writel(val & ~mask, np_base + REG_RESET_CONTROL);
> > +	writel(val & ~mask, np_base + REG_RESET_CONTROL1);
> >   	usleep_range(5000, 10000);
> >   	/* Release device */
> > @@ -262,6 +280,64 @@ static struct clk_hw *en7523_register_pcie_clk(str=
uct device *dev,
> >   	return &cg->hw;
> >   }
> > +static int en7581_pci_is_enabled(struct clk_hw *hw)
> > +{
> > +	struct en_clk_gate *cg =3D container_of(hw, struct en_clk_gate, hw);
> > +	u32 val, mask;
> > +
> > +	mask =3D REG_PCI_CONTROL_REFCLK_EN0 | REG_PCI_CONTROL_REFCLK_EN1;
> > +	val =3D readl(cg->base + REG_PCI_CONTROL);
> > +	return (val & mask) =3D=3D mask;
> > +}
> > +
> > +static int en7581_pci_prepare(struct clk_hw *hw)
> > +{
> > +	struct en_clk_gate *cg =3D container_of(hw, struct en_clk_gate, hw);
> > +	void __iomem *np_base =3D cg->base;
> > +	u32 val, mask;
> > +
> > +	mask =3D REG_RESET_CONTROL_PCIE1 | REG_RESET_CONTROL_PCIE2 |
> > +	       REG_RESET_CONTROL_PCIEHB;
> > +	val =3D readl(np_base + REG_RESET_CONTROL1);
> > +	writel(val & ~mask, np_base + REG_RESET_CONTROL1);
> > +	val =3D readl(np_base + REG_RESET_CONTROL2);
> > +	writel(val & ~REG_RESET2_CONTROL_PCIE2, np_base + REG_RESET_CONTROL2);
> > +	usleep_range(5000, 10000);
> > +
> > +	mask =3D REG_PCI_CONTROL_REFCLK_EN0 | REG_PCI_CONTROL_REFCLK_EN1 |
> > +	       REG_PCI_CONTROL_PERSTOUT1 | REG_PCI_CONTROL_PERSTOUT2 |
> > +	       REG_PCI_CONTROL_PERSTOUT;
>=20
> I'm not sure that this is actually something to control in a clock driver=
=2E..
>=20
> the right thing to do would be to add a reset controller to this clock dr=
iver
> and then assert/deassert reset in the PCIe PHY/MAC driver.
>=20
> Perhaps REFCLK_EN0/EN1 can be manipulated in a .enable() callback, treati=
ng
> this really just as what it appears to really be: a gate clock! (hint: ch=
eck
> clk-gate.c)

ack, I will look into it.

>=20
> > +	val =3D readl(np_base + REG_PCI_CONTROL);
> > +	writel(val | mask, np_base + REG_PCI_CONTROL);
> > +	msleep(250);
> > +
> > +	return 0;
> > +}
> > +
> > +static void en7581_pci_unprepare(struct clk_hw *hw)
> > +{
> > +	struct en_clk_gate *cg =3D container_of(hw, struct en_clk_gate, hw);
> > +	void __iomem *np_base =3D cg->base;
> > +	u32 val, mask;
> > +
> > +	mask =3D REG_PCI_CONTROL_REFCLK_EN0 | REG_PCI_CONTROL_REFCLK_EN1 |
>=20
> ...and this should be a clk-gate .disable() callback, I guess :-)

ack, I will look into it.

>=20
> > +	       REG_PCI_CONTROL_PERSTOUT1 | REG_PCI_CONTROL_PERSTOUT2 |
> > +	       REG_PCI_CONTROL_PERSTOUT;
> > +	val =3D readl(np_base + REG_PCI_CONTROL);
> > +	writel(val & ~mask, np_base + REG_PCI_CONTROL);
> > +	usleep_range(1000, 2000);
> > +
> > +	mask =3D REG_RESET_CONTROL_PCIE1 | REG_RESET_CONTROL_PCIE2 |
> > +	       REG_RESET_CONTROL_PCIEHB;
> > +	val =3D readl(np_base + REG_RESET_CONTROL1);
> > +	writel(val | mask, np_base + REG_RESET_CONTROL1);
> > +	mask =3D REG_RESET_CONTROL_PCIE1 | REG_RESET_CONTROL_PCIE2;
> > +	writel(val | mask, np_base + REG_RESET_CONTROL1);
> > +	val =3D readl(np_base + REG_RESET_CONTROL2);
> > +	writel(val | REG_RESET_CONTROL_PCIE2, np_base + REG_RESET_CONTROL2);
> > +	msleep(100);
> > +}
> > +
> >   static void en7523_register_clocks(struct device *dev, struct clk_hw_=
onecell_data *clk_data,
> >   				   void __iomem *base, void __iomem *np_base)
> >   {
> > @@ -291,6 +367,37 @@ static void en7523_register_clocks(struct device *=
dev, struct clk_hw_onecell_dat
> >   	clk_data->num =3D EN7523_NUM_CLOCKS;
> >   }
> > +static int en7581_clk_hw_init(struct platform_device *pdev,
> > +			      void __iomem *base,
> > +			      void __iomem *np_base)
> > +{
> > +	void __iomem *pb_base;
> > +	u32 val;
> > +
> > +	pb_base =3D devm_platform_ioremap_resource(pdev, 2);
> > +	if (IS_ERR(pb_base))
> > +		return PTR_ERR(pb_base);
> > +
> > +	val =3D readl(np_base + REG_NP_SCU_SSTR);
> > +	val &=3D ~(REG_PCIE_XSI0_SEL_MASK | REG_PCIE_XSI1_SEL_MASK);
> > +	writel(val, np_base + REG_NP_SCU_SSTR);
> > +	val =3D readl(np_base + REG_NP_SCU_PCIC);
> > +	writel(val | 3, np_base + REG_NP_SCU_PCIC);
>=20
> What is 3?
>=20
> #define SOMETHING 3 ??

actullay I do not know what it means since write in the pcie_ctrl subfield =
of
REG_NP_SCU_PCIC but it is a GENMASK(7, 0) and I do not have any more info
about it.

>=20
> > +
> > +	writel(0x20000000, pb_base + REG_PCIE0_MEM);
> > +	writel(0xfc000000, pb_base + REG_PCIE0_MEM_MASK);
> > +	writel(0x24000000, pb_base + REG_PCIE1_MEM);
> > +	writel(0xfc000000, pb_base + REG_PCIE1_MEM_MASK);
> > +	writel(0x28000000, pb_base + REG_PCIE2_MEM);
> > +	writel(0xfc000000, pb_base + REG_PCIE2_MEM_MASK);
>=20
> And... this is .. some BIT() and some GENMASK() as far as I understand...
> do we have any clue about what you're setting to those registers?

same as above, they seems undocumented.
@airoha folks: any input about them?

>=20
> Can MediaTek/Airoha help with this, please?
>=20
> #define SOMETHING BIT(29) /* this is 0x20000000 */
> #define SOME_MASK GENMASK(31, 26) /* this is 0xfc00000 */
>=20
> > +
> > +	val =3D readl(base + REG_PCIE_RESET_OPEN_DRAIN);
> > +	writel(val | REG_PCIE_RESET_OPEN_DRAIN_MASK,
> > +	       base + REG_PCIE_RESET_OPEN_DRAIN);
> > +
> > +	return 0;
> > +}
> > +
> >   static int en7523_clk_probe(struct platform_device *pdev)
> >   {
> >   	struct device_node *node =3D pdev->dev.of_node;
> > @@ -306,6 +413,12 @@ static int en7523_clk_probe(struct platform_device=
 *pdev)
> >   	if (IS_ERR(np_base))
> >   		return PTR_ERR(np_base);
> > +	if (of_device_is_compatible(node, "airoha,en7581-scu")) {
> > +		r =3D en7581_clk_hw_init(pdev, base, np_base);
> > +		if (r)
> > +			return r;
> > +	}
> > +
> >   	clk_data =3D devm_kzalloc(&pdev->dev,
> >   				struct_size(clk_data, hws, EN7523_NUM_CLOCKS),
> >   				GFP_KERNEL);
> > @@ -329,8 +442,15 @@ static const struct clk_ops en7523_pcie_ops =3D {
> >   	.unprepare =3D en7523_pci_unprepare,
> >   };
>=20
> static const struct clk_en7523_pdata en7581_pdata =3D {
> 	.init =3D en7581_clk_hw_init, /* if (pdata->init) pdata->init(x, y, z) */
> 	.ops =3D en7581_pcie_ops,
> };
>=20
> or, alternatively:
>=20
> static const struct .... =3D {
> 	.init =3D ...,
> 	.ops =3D (const struct clk_ops) {
> 		.is_enabled =3D en7581_pci_is_enabled,
> 		.... etc
> 	}

ack, I will fix it.

Regards,
Lorenzo

> };
>=20
> Cheers,
> Angelo
>=20
> > +static const struct clk_ops en7581_pcie_ops =3D {
> > +	.is_enabled =3D en7581_pci_is_enabled,
> > +	.prepare =3D en7581_pci_prepare,
> > +	.unprepare =3D en7581_pci_unprepare,
> > +};
> > +
> >   static const struct of_device_id of_match_clk_en7523[] =3D {
> >   	{ .compatible =3D "airoha,en7523-scu", .data =3D &en7523_pcie_ops },
> > +	{ .compatible =3D "airoha,en7581-scu", .data =3D &en7581_pcie_ops },
> >   	{ /* sentinel */ }
> >   };
>=20
> -

--1WYQnZ6cJ3WK870d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZg+zfgAKCRA6cBh0uS2t
rEeeAQCU1mJguiAAnl9h/mLdiepwXe+MApNVgH7ZMSH0lyr7lAEAnOZc1GK3p5Zs
sdp+Zn+7Su6SW2P4NaCCwwro4/yGTQQ=
=4hwU
-----END PGP SIGNATURE-----

--1WYQnZ6cJ3WK870d--
