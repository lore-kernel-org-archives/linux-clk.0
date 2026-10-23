Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792749196;
	b=NuLOEEM/AybEYHEx5+O+8b84q9SA0XbByHUYJ0SHXf2njxuPcCwzWkxWlhxxkd5zCHJT
	 Pk+p7XLVG2P+BCfTPgQL9RDnz7r6HwDZa1HNs65YoGnOr0WRWnv1yCIclizImWW4cX6W5
	 HgQONmsQV7S8aXk3zVuPC6qjPQDUYaAKljMV2qlLXhtNeMoKuuDhPKbA3N8XnNnueycNs
	 rrzTgVHUwHxQM3JMS3WRrOdasviqaTvV/Qs2trH/IvLDh1kIyNA1BiTH31YHpdtlDQJbt
	 KLS5uBI/UIi4ginEzwGFsw2GCHVPNZOIIITaPl8s6DT6Ise2bYhrE+OWRdXIpkU2zwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792749196;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=OoHuobr1W4Hg3djaW5xGjOqp6InpOS/re/XPCAIVT8Y=;
	b=GCCsEN2lMt9xZxZ+l4iNzsx7PkriVsAJsfwYhd2kgNPKO1T0l1PYI7H3PvTsGpHhbPZ/
	 WssDsJpv9USHBCeA4zeqs3b6YiL+ovxGURqWqs6O3BTdiiEWFwT7Zga099OHjQEDmmSyM
	 XGpswBpjXto16ksNT1q65qp0jEkCJKPLdMh7WStoFNaRoiq8xLAXjOSRrW0g/SUcFy8nc
	 zqT7x9lse+0CE67DEuyzOEnq+DVZkJghMJUIT/ebfYu2up0JEx80HIBrZTxqEUdpmieeG
	 nKqrs/P7a3q5/6++P1yWMAUc4kX3F6jY035Q4Od2l85li9dE1ssOSciq7ZubdxbYaiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QT27aicZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36AB2606A31F;
	Fri, 23 Oct 2026 09:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QT27aicZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 746BD1F01825;
	Fri, 23 Oct 2026 09:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792749195;
	bh=OoHuobr1W4Hg3djaW5xGjOqp6InpOS/re/XPCAIVT8Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QT27aicZiX03/slaIx3sg8DyFkR2Fpt6WJazyoZfS9dPeCvpgXptJPJeH4LFDBQ2z
	 gI7Id0vohALWjOpLItCuJeNYjdh5Nxin3uQm+9Y0ZbrWbpGF09cXQDBk5hhDIc8/Yc
	 LwCl7ntVpgv2MFDqWRjEYJaDSW7yXBUQLcTptnrpr90VcAxIuBD7d2LEXVaekBrxSn
	 RQ+LMsEUQPBEK7lVaUByROlvgb+1DgDCXOIR4TaCS7saumi5y7ySe2LlX7fqLdEiRd
	 IocGAhSTSkXuAzASfdBextvzqVC+sxPXGbSTttqwXBYXF3e/Ji8DPWjYDi36osz/Jb
	 uBoODXnTCw5bQ==
Message-ID: <sashiko-outbox-182643@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/5] clk: cix: Handle Sky1 AUDSS DMA interrupt gates
 as an irqchip
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jelly Jia" <Jelly.Jia@cixtech.com>
Cc: devicetree@vger.kernel.org, dmaengine@vger.kernel.org, linux-clk@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261023093045.3248630-3-Jelly.Jia@cixtech.com>
References: <20261023093045.3248630-1-Jelly.Jia@cixtech.com>
 <20261023093045.3248630-3-Jelly.Jia@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 09:53:15 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] clk: cix: unclocked MMIO access in sky1_audss_irq_teardown() and I=
RQ callbacks
- [High] clk: cix: invalid wait context in sky1_audss_irq_handler() and mas=
k callbacks
- [High] clk: cix: missing irq_dispose_mapping() in sky1_audss_irq_teardown=
()
- [High] clk: cix: level IRQ storm with handle_untracked_irq() on lazy IRQ =
disable
- [Low] clk: cix: missing select IRQ_DOMAIN for CLK_SKY1_AUDSS in Kconfig
--

commit d366d15da9922d1961ddd48a45f4b621f1a77320
Author: Jelly Jia <Jelly.Jia@cixtech.com>

clk: cix: Handle Sky1 AUDSS DMA interrupt gates as an irqchip

This commit adds an irqchip and linear IRQ domain to the CIX Sky1 AUDSS clo=
ck
driver to manage the DMA-350 channel interrupt gates in the INFO_AP_IRQC
register. It installs a chained IRQ handler on the shared parent GIC line a=
nd
registers a devres teardown action to clean up the irqchip.

> diff --git a/drivers/clk/cix/clk-sky1-audss.c b/drivers/clk/cix/clk-sky1-=
audss.c
> index e096b8121df30..789cbba631d16 100644
> --- a/drivers/clk/cix/clk-sky1-audss.c
> +++ b/drivers/clk/cix/clk-sky1-audss.c

[ ... ]

> @@ -928,6 +939,110 @@ static int sky1_audss_clks_enable(struct sky1_audss=
_clks_priv *priv)
>  	return err;
>  }
> =20
> +static void sky1_audss_irq_mask(struct irq_data *d)
> +{
> +	struct sky1_audss_clks_priv *priv =3D irq_data_get_irq_chip_data(d);
> +
> +	regmap_update_bits(priv->regmap_cru, INFO_AP_IRQC,
> +			   BIT(d->hwirq), 0);
> +}
> +
> +static void sky1_audss_irq_unmask(struct irq_data *d)
> +{
> +	struct sky1_audss_clks_priv *priv =3D irq_data_get_irq_chip_data(d);
> +
> +	regmap_update_bits(priv->regmap_cru, INFO_AP_IRQC,
> +			   BIT(d->hwirq), BIT(d->hwirq));
> +}

[Severity: High]
Will calling regmap_update_bits() in sky1_audss_irq_mask() and
sky1_audss_irq_unmask(), as well as regmap_read() in sky1_audss_irq_handler=
(),
trigger an invalid wait context warning under CONFIG_PROVE_RAW_LOCK_NESTING
and sleep in atomic context on PREEMPT_RT?

In drivers/clk/cix/clk-sky1-audss.c, priv->regmap_cru is initialized via
devm_regmap_init_mmio() using sky1_audss_regmap_config:

    static const struct regmap_config sky1_audss_regmap_config =3D {
            .reg_bits =3D 32,
            .val_bits =3D 32,
            .reg_stride =3D 4,
    };

Because sky1_audss_regmap_config does not set .use_raw_spinlock =3D true,
regmap initializes a non-raw spinlock_t for map->spinlock.

The IRQ core invokes .irq_mask and .irq_unmask while holding irq_desc->lock
(a raw_spinlock_t), and sky1_audss_irq_handler() runs in hardirq context.
Acquiring the regmap spinlock_t in those paths violates raw_spinlock_t
nesting rules. Should sky1_audss_regmap_config set .use_raw_spinlock =3D tr=
ue?

> +
> +static struct irq_chip sky1_audss_irq_chip =3D {
> +	.name		=3D "sky1-audss-dmac",
> +	.irq_mask	=3D sky1_audss_irq_mask,
> +	.irq_unmask	=3D sky1_audss_irq_unmask,
> +	.flags		=3D IRQCHIP_SKIP_SET_WAKE,
> +};
> +
> +static int sky1_audss_irq_map(struct irq_domain *d, unsigned int irq,
> +			      irq_hw_number_t hwirq)
> +{
> +	if (hwirq >=3D SKY1_AUDSS_DMAC_IRQS)
> +		return -EINVAL;
> +
> +	irq_set_chip_data(irq, d->host_data);
> +	irq_set_chip_and_handler(irq, &sky1_audss_irq_chip,
> +				 handle_untracked_irq);
> +	irq_set_noprobe(irq);
> +
> +	return 0;
> +}
> +
> +static const struct irq_domain_ops sky1_audss_irq_ops =3D {
> +	.map	=3D sky1_audss_irq_map,
> +	.xlate	=3D irq_domain_xlate_onecell,
> +};
> +
> +static void sky1_audss_irq_handler(struct irq_desc *desc)
> +{
> +	struct sky1_audss_clks_priv *priv =3D irq_desc_get_handler_data(desc);
> +	struct irq_chip *chip =3D irq_desc_get_chip(desc);
> +	unsigned long enabled;
> +	unsigned int hwirq;
> +	u32 val;
> +
> +	chained_irq_enter(chip, desc);
> +
> +	if (!regmap_read(priv->regmap_cru, INFO_AP_IRQC, &val)) {
> +		enabled =3D val & INFO_AP_IRQC_DMAC_MASK;
> +		for_each_set_bit(hwirq, &enabled, SKY1_AUDSS_DMAC_IRQS)
> +			generic_handle_domain_irq(priv->irq_domain, hwirq);
> +	}
> +
> +	chained_irq_exit(chip, desc);
> +}

[Severity: High]
What happens if a child DMA interrupt is disabled via disable_irq(),
disable_irq_nosync(), or suspend_device_irqs() and that channel later
asserts its level-high interrupt?

Because sky1_audss_irq_chip only provides .irq_mask and .irq_unmask (without
.irq_disable or IRQCHIP_MASK_ON_SUSPEND) and sky1_audss_irq_map() does not
set IRQ_DISABLE_UNLAZY, irq_disable() performs a lazy disable: it marks the
interrupt disabled in software without calling sky1_audss_irq_mask(), leavi=
ng
BIT(hwirq) set in INFO_AP_IRQC.

Unlike handle_level_irq() and handle_fasteoi_irq(), handle_untracked_irq()
does not call mask_irq() when an interrupt arrives while disabled:

    void handle_untracked_irq(struct irq_desc *desc)
    {
            raw_spin_lock(&desc->lock);

            if (!irq_can_handle(desc))
                    goto out_unlock;
            ...

When the disabled channel asserts its level interrupt, sky1_audss_irq_handl=
er()
sees BIT(hwirq) set in INFO_AP_IRQC and calls generic_handle_domain_irq() ->
handle_untracked_irq(), which returns immediately without masking the gate =
or
clearing the source. Once chained_irq_exit() unmasks the parent GIC line,
won't the level-high parent interrupt immediately re-fire in an infinite ha=
rd
IRQ storm?

> +
> +static void sky1_audss_irq_teardown(void *data)
> +{
> +	struct sky1_audss_clks_priv *priv =3D data;
> +
> +	regmap_update_bits(priv->regmap_cru, INFO_AP_IRQC,
> +			   INFO_AP_IRQC_DMAC_MASK, 0);
> +	irq_set_chained_handler_and_data(priv->parent_irq, NULL, NULL);
> +	irq_domain_remove(priv->irq_domain);
> +}

[Severity: High]
Does sky1_audss_irq_teardown() leak mapped irq_desc descriptors and leave
dangling pointers when calling irq_domain_remove(priv->irq_domain) without
first disposing of existing mappings?

When a consumer calls platform_get_irq(), irq_create_fwspec_mapping() maps =
the
child virq through sky1_audss_irq_map(), setting desc->irq_data.domain to
priv->irq_domain, desc->irq_data.chip_data to priv, and desc->irq_data.chip=
 to
&sky1_audss_irq_chip. Platform consumers do not call irq_dispose_mapping() =
on
unbind.

Calling irq_domain_remove() directly without iterating over the domain's
hwirqs and calling irq_dispose_mapping(irq_find_mapping(priv->irq_domain,
hwirq)) leaves those virtual IRQ descriptors allocated in the global IRQ tr=
ee
with dangling pointers to the freed domain, freed priv, and (if built as a
module and unloaded) unmapped sky1_audss_irq_chip memory.

> +
> +static int sky1_audss_irq_init(struct platform_device *pdev,
> +			       struct sky1_audss_clks_priv *priv)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	int ret;
> +	int irq;
> +
> +	if (!of_property_read_bool(dev->of_node, "interrupt-controller"))
> +		return 0;
> +
> +	irq =3D platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return irq;
> +
> +	priv->irq_domain =3D irq_domain_add_linear(dev->of_node,
> +						 SKY1_AUDSS_DMAC_IRQS,
> +						 &sky1_audss_irq_ops, priv);

[Severity: Low]
Can this fail to build under CONFIG_COMPILE_TEST=3Dy when CONFIG_IRQ_DOMAIN=
 is
not enabled?

In drivers/clk/cix/Kconfig, CLK_SKY1_AUDSS depends on ARCH_CIX || COMPILE_T=
EST
and selects AUXILIARY_BUS, REGMAP_MMIO, and RESET_CONTROLLER, but does not
select IRQ_DOMAIN. Because irq_domain_add_linear(), irq_domain_remove(),
irq_domain_xlate_onecell, and generic_handle_domain_irq() are only declared
when CONFIG_IRQ_DOMAIN is enabled, should CLK_SKY1_AUDSS select IRQ_DOMAIN =
as
well?

[ ... ]

> @@ -1110,6 +1225,13 @@ static int sky1_audss_clk_probe(struct platform_de=
vice *pdev)
>  		goto fail_pm;
>  	}
> =20
> +	/* Tear the irqchip down before the runtime-PM cleanup disables clocks.=
 */
> +	ret =3D sky1_audss_irq_init(pdev, priv);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "failed to set up AUDSS DMA IRQs\n");
> +		goto fail_pm;
> +	}
> +
>  	pm_runtime_put_sync(dev);
> =20
>  	return 0;

[Severity: High]
Can sky1_audss_irq_teardown(), sky1_audss_irq_mask(), sky1_audss_irq_unmask=
(),
and sky1_audss_irq_handler() access INFO_AP_IRQC while the AUDSS CRU is
runtime-suspended with its NoC reset asserted and parent clocks disabled?

In sky1_audss_clk_runtime_suspend(), suspending the device asserts
priv->rst_noc and disables all four parent clocks:

    reset_control_assert(priv->rst_noc);

    sky1_audss_clks_disable(priv);

There appear to be three paths where INFO_AP_IRQC is accessed while the CRU=
 is
in this unclocked/reset state:

1. At the end of sky1_audss_clk_probe() (and at fail_pm), pm_runtime_put_sy=
nc()
suspends the device immediately if no consumer clock is prepared. Likewise,
during driver unbind, __device_release_driver() runs pm_runtime_put_sync()
before devres_release_all(). Because the device is already runtime-suspended
before devres teardown starts, registering sky1_audss_irq_teardown() after
sky1_audss_clk_rpm_cleanup() does not keep the CRU clocked when
sky1_audss_irq_teardown() calls regmap_update_bits() on INFO_AP_IRQC.

2. In sky1_audss_irq_init(), priv->irq_domain is created without calling
irq_domain_set_pm_device(priv->irq_domain, dev). As a result, requesting or
freeing a child DMA IRQ does not runtime-resume dev before
sky1_audss_irq_unmask() or sky1_audss_irq_mask() accesses INFO_AP_IRQC (and
any gate bit written while suspended would be overwritten by sky1_reg_save
on the next runtime resume).

3. In sky1_audss_clk_pm_ops, pm_runtime_force_suspend() and
pm_runtime_force_resume() are wired to normal system sleep callbacks via
SET_SYSTEM_SLEEP_PM_OPS() rather than noirq callbacks, so the CRU is placed
in reset and unclocked during dpm_suspend() while the chained handler
sky1_audss_irq_handler() and child IRQs are still active.

Should the driver set irq_domain_set_pm_device(), ensure runtime PM is acti=
ve
around the register write in sky1_audss_irq_teardown(), and move the system
sleep callbacks to noirq?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023093045.3248=
630-1-Jelly.Jia@cixtech.com?part=3D2
