Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792751317;
	b=34g2zlZdOiRz472fP6PQjOEqEOKLfCGUwM22ajr+3kGd+T4gJwHfw8Heorb4vxWBkHdj
	 klHiuIgnXtiQC951PDAHq1j7mDQTTfqyyt+5TnovQ0P22x1A05X0ouYCCHLZG8dKlPK4T
	 25FAscnTSQin025LRR3Z9zeGxvN3ryMlTSxS1zQsUbziHM9bhlJBJ/PT9EKlOvOLuhZmr
	 B5SzaPBYAcAKNSCcr6TrIn4YAZbH/1hj+mge7xLBBLxelv46XsMPobtYQ7fjH1X1N5fDK
	 eks4jt3LCqR7Ss33MHbos7DsK+moYr42B59d93bf9gx/tqgXONdkxZlqWovJFqwzxvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792751317;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=iy/MBb2uDkqlIN9X5m6+G2cWR8rUQhU9wm3Du2MzOec=;
	b=HABd4Rf9zb9ZurIjYo/R9Pks4FkR5bPBr8824MFYV23YHkOkoWChMGKmrk8uwPqZ4a8K
	 8BMQ7xj+ogWLN3m1Zs/a/9FT68WMbwUROLINu/mQDXsyIHqgiuvdrMSwa2JoIwDUYgt/m
	 8VM5H1N0GZP6vQJv/y9/twWxWOH6vrA8N/yGhn1O85moQLPzXhE6NFt0CjSq1Jqlz+StI
	 u3ChEZWu3ZklQ93H1llAJw5Tz7t2Oan3VH3KLRCa/kYM91njgFlfPI7vvH81r1X+gfv0o
	 MgqHlzjwyS8jk6kB78GgD0KcX4eiKz6Ob88EKZ6MU5ce/l89L82A/2vyrDaMLhlRybw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PWY4mRj2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF29606A31D;
	Fri, 23 Oct 2026 10:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PWY4mRj2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1E181F01829;
	Fri, 23 Oct 2026 10:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792751316;
	bh=iy/MBb2uDkqlIN9X5m6+G2cWR8rUQhU9wm3Du2MzOec=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PWY4mRj2QWrOm/krRy7QXJSb4x6nAuNLGqWbN/ejPry5yJ5rWMVQ1k1QnTtGVQZnX
	 xogS/4lJq8esTG8F9GIrhFDYws63fFngoX64+DPqOfKO5OGQE1DnDtopdLL2hf5JXv
	 1Hq6OF4wEMKGUNwoq4JG5BMnVbsDOaepEklK9rpTqT0R2nnWBW3dmnGSY3ctc2LLC7
	 EDHIY+HBZWC7MooZKXZwULT7uxrD8597lf7mi4HNfsn1hNyqo1N/OcZa8fFS3kDOtz
	 +WNDtWCotmKRI0CpHI4ky3FoTD83I/CvPGaz15nzzT7kHN91l3+ffGkinKSYDnt1VK
	 pcVBj1YtvEvsQ==
Message-ID: <sashiko-outbox-182685@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 5/5] arm64: dts: cix: Add the Sky1 AUDSS DMA-350
 integration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jelly Jia" <Jelly.Jia@cixtech.com>
Cc: devicetree@vger.kernel.org, dmaengine@vger.kernel.org, linux-clk@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261023093045.3248630-6-Jelly.Jia@cixtech.com>
References: <20261023093045.3248630-1-Jelly.Jia@cixtech.com>
 <20261023093045.3248630-6-Jelly.Jia@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 10:28:35 +0000
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
- [High] clk: cix: IRQ storm in sky1_audss_irq_handler() due to handle_untr=
acked_irq()
- [High] clk: cix: invalid wait context in sky1_audss_irq_handler() via non=
-raw regmap
- [High] clk: cix: missing virq disposal before irq_domain_remove() in tear=
down
- [High] arm64: dts: cix: audss_dmac reset AUDSS_SW_RST lost across AUDSS C=
RU suspend
--

commit 5fc04062b961f79314208fe23d9fe7413f932103
Author: Jelly Jia <Jelly.Jia@cixtech.com>

arm64: dts: cix: Add the Sky1 AUDSS DMA-350 integration

This commit adds the audss-dma-bus and audss_dmac nodes for the Sky1 AUDSS
DMA-350 controller and wires its clocks, resets, and channel interrupts
through the audss_cru controller.

> diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/=
sky1.dtsi
> index cd498ee7e9a76..6ca94f606463c 100644
> --- a/arch/arm64/boot/dts/cix/sky1.dtsi
> +++ b/arch/arm64/boot/dts/cix/sky1.dtsi
> @@ -588,17 +588,41 @@ mbox_pm2ap: mailbox@65a0080 {
>  			cix,mbox-dir =3D "rx";
>  		};
> =20
> +		audss-dma-bus {
> +			compatible =3D "simple-bus";
> +			ranges;
> +			#address-cells =3D <2>;
> +			dma-ranges =3D <0x0 0x20000000 0x0 0x07010000 0x0 0x00100000>,
> +				     <0x0 0x30000000 0x0 0xc0000000 0x0 0x20000000>;
> +			#size-cells =3D <2>;
> +
> +			audss_dmac: dma-controller@7010000 {
> +				compatible =3D "arm,dma-350";
> +				reg =3D <0x0 0x07010000 0x0 0x10000>;
> +				clocks =3D <&audss_cru CLK_DMAC_AXI>;
> +				#dma-cells =3D <1>;
> +				dma-channel-mask =3D <0xff>;
> +				interrupt-parent =3D <&audss_cru>;
> +				interrupts =3D <0>, <1>, <2>, <3>,
> +					     <4>, <5>, <6>, <7>;
> +				resets =3D <&audss_cru AUDSS_DMAC_SW_RST>;

[Severity: High]
Will the AUDSS_DMAC_SW_RST reset state for audss_dmac survive a system
suspend and resume cycle of audss_cru?

In drivers/dma/arm-dma350.c, d350_probe() deasserts the reset once at probe
time and the driver defines no power management callbacks:

drivers/dma/arm-dma350.c:d350_probe() {
	reset =3D devm_reset_control_get_optional_exclusive_deasserted(dev, NULL);
	if (IS_ERR(reset))
		return dev_err_probe(dev, PTR_ERR(reset),
				     "failed to deassert reset\n");
}

That call goes through sky1_audss_reset_deassert() -> sky1_audss_reset_set()
in drivers/reset/reset-sky1-audss.c to set BIT(15) in AUDSS_SW_RST (0x78).

However, when audss_cru suspends via sky1_audss_clk_runtime_suspend() in
drivers/clk/cix/clk-sky1-audss.c, it saves only the registers listed in
sky1_reg_save[] before asserting priv->rst_noc:

drivers/clk/cix/clk-sky1-audss.c:
static u32 sky1_reg_save[][2] =3D {
	{ INFO_HIFI0,  0 },
	{ INFO_CLK_GATE,  0 },
	{ INFO_CLK_DIV, 0 },
	{ INFO_CLK_MUX, 0 },
	{ INFO_AP_IRQC, 0 },
	{ INFO_MCLK, 0 },
};

Because AUDSS_SW_RST (0x78) is not included in sky1_reg_save[], asserting
priv->rst_noc and powering down SKY1_PD_AUDIO resets AUDSS_SW_RST, leaving
audss_dmac held in hardware reset after sky1_audss_clk_runtime_resume()
runs.

> +			};
> +		};
> +
>  		audss_cru: clock-controller@7110000 {
>  			compatible =3D "cix,sky1-audss-cru";
>  			reg =3D <0x0 0x07110000 0x0 0x10000>;
>  			#clock-cells =3D <1>;
> -			#reset-cells =3D <1>;
>  			clocks =3D <&scmi_clk CLK_TREE_AUDIO_CLK0>,
>  				 <&scmi_clk CLK_TREE_AUDIO_CLK2>,
>  				 <&scmi_clk CLK_TREE_AUDIO_CLK4>,
>  				 <&scmi_clk CLK_TREE_AUDIO_CLK5>;
>  			clock-names =3D "x8k", "x11k", "sys", "48m";
> +			#interrupt-cells =3D <1>;
> +			interrupt-controller;
> +			interrupts =3D <GIC_SPI 230 IRQ_TYPE_LEVEL_HIGH 0>;

[Severity: High]
Can wiring audss_cru as an interrupt-controller trigger unclocked register
accesses to INFO_AP_IRQC while audss_cru is runtime-suspended and held in
reset?

In drivers/clk/cix/clk-sky1-audss.c, sky1_audss_clk_probe() initializes the
irqchip and then drops the runtime PM reference:

drivers/clk/cix/clk-sky1-audss.c:sky1_audss_clk_probe() {
	/* Tear the irqchip down before the runtime-PM cleanup disables clocks. */
	ret =3D sky1_audss_irq_init(pdev, priv);
	if (ret) {
		dev_err_probe(dev, ret, "failed to set up AUDSS DMA IRQs\n");
		goto fail_pm;
	}

	pm_runtime_put_sync(dev);
}

Whenever no consumer clock is prepared, sky1_audss_clk_runtime_suspend()
asserts priv->rst_noc and disables the parent clocks via
sky1_audss_clks_disable(priv):

drivers/clk/cix/clk-sky1-audss.c:sky1_audss_clk_runtime_suspend() {
	...
	reset_control_assert(priv->rst_noc);

	sky1_audss_clks_disable(priv);
}

During driver unbind in __device_release_driver(),
device_links_unbind_consumers() unbinds audss_dmac (unpreparing
CLK_DMAC_AXI), and pm_runtime_put_sync() suspends audss_cru before
device_unbind_cleanup() -> devres_release_all() runs
sky1_audss_irq_teardown():

drivers/clk/cix/clk-sky1-audss.c:sky1_audss_irq_teardown() {
	struct sky1_audss_clks_priv *priv =3D data;

	regmap_update_bits(priv->regmap_cru, INFO_AP_IRQC,
			   INFO_AP_IRQC_DMAC_MASK, 0);
	irq_set_chained_handler_and_data(priv->parent_irq, NULL, NULL);
	irq_domain_remove(priv->irq_domain);
}

In addition, sky1_audss_irq_init() does not call irq_domain_set_pm_device()
and leaves GIC_SPI 230 active while suspended, so sky1_audss_irq_teardown(),
sky1_audss_irq_mask(), sky1_audss_irq_unmask(), or sky1_audss_irq_handler()
can access INFO_AP_IRQC while priv->rst_noc is asserted and the parent
clocks are disabled.

[Severity: High]
Could routing the level-high GIC_SPI 230 interrupt through
sky1_audss_irq_handler() and handle_untracked_irq() cause an interrupt storm
or spurious interrupt replay?

In drivers/clk/cix/clk-sky1-audss.c, sky1_audss_irq_chip provides only
.irq_mask and .irq_unmask, and sky1_audss_irq_map() sets
handle_untracked_irq without IRQ_DISABLE_UNLAZY or IRQ_NOTHREAD:

drivers/clk/cix/clk-sky1-audss.c:
static struct irq_chip sky1_audss_irq_chip =3D {
	.name		=3D "sky1-audss-dmac",
	.irq_mask	=3D sky1_audss_irq_mask,
	.irq_unmask	=3D sky1_audss_irq_unmask,
	.flags		=3D IRQCHIP_SKIP_SET_WAKE,
};

static int sky1_audss_irq_map(struct irq_domain *d, unsigned int irq,
			      irq_hw_number_t hwirq)
{
	if (hwirq >=3D SKY1_AUDSS_DMAC_IRQS)
		return -EINVAL;

	irq_set_chip_data(irq, d->host_data);
	irq_set_chip_and_handler(irq, &sky1_audss_irq_chip,
				 handle_untracked_irq);
	irq_set_noprobe(irq);

	return 0;
}

When sky1_audss_irq_handler() runs, it reads the gate mask in INFO_AP_IRQC
and dispatches every unmasked channel bit:

drivers/clk/cix/clk-sky1-audss.c:sky1_audss_irq_handler() {
	if (!regmap_read(priv->regmap_cru, INFO_AP_IRQC, &val)) {
		enabled =3D val & INFO_AP_IRQC_DMAC_MASK;
		for_each_set_bit(hwirq, &enabled, SKY1_AUDSS_DMAC_IRQS)
			generic_handle_domain_irq(priv->irq_domain, hwirq);
	}
}

Because handle_untracked_irq() in kernel/irq/chip.c returns early when
!irq_can_handle(desc) without calling mask_irq(desc), and does not mask
IRQS_ONESHOT interrupts:

1. If disable_irq() or suspend_device_irqs() lazily disables a channel, its
   bit in INFO_AP_IRQC stays set. If that channel asserts its level-high
   interrupt, handle_untracked_irq() neither masks INFO_AP_IRQC nor runs
   d350_irq() to clear CH_STATUS, leaving GIC_SPI 230 asserted in an
   infinite hard-IRQ loop.
2. Under CONFIG_PREEMPT_RT or threadirqs, request_irq() in
   d350_alloc_chan_resources() is force-threaded with IRQF_ONESHOT, and
   handle_untracked_irq() leaves the interrupt unmasked while waking the
   IRQ thread, re-triggering GIC_SPI 230 continuously.
3. When any enabled channel fires, sky1_audss_irq_handler() calls
   generic_handle_domain_irq() for every lazily-disabled sibling channel
   still enabled in INFO_AP_IRQC, which sets IRQS_PENDING on idle channels
   and causes a spurious replay on enable_irq() or resume_device_irqs().

[Severity: High]
Does accessing priv->regmap_cru from sky1_audss_irq_mask(),
sky1_audss_irq_unmask(), and sky1_audss_irq_handler() trigger an invalid
wait context warning?

In drivers/clk/cix/clk-sky1-audss.c, sky1_audss_regmap_config does not set
.use_raw_spinlock =3D true:

drivers/clk/cix/clk-sky1-audss.c:
static const struct regmap_config sky1_audss_regmap_config =3D {
	.reg_bits =3D 32,
	.val_bits =3D 32,
	.reg_stride =3D 4,
};

As a result, __regmap_init() configures priv->regmap_cru to use a non-raw
spinlock_t (which becomes a sleeping lock on CONFIG_PREEMPT_RT). When
audss_dmac requests or handles its channel interrupts:

- sky1_audss_irq_mask() and sky1_audss_irq_unmask() call
  regmap_update_bits(priv->regmap_cru, INFO_AP_IRQC, ...) while the IRQ core
  holds desc->lock (a raw_spinlock_t).
- sky1_audss_irq_handler() runs as a chained handler in hard-IRQ context and
  calls regmap_read(priv->regmap_cru, INFO_AP_IRQC, &val).

Should sky1_audss_regmap_config set .use_raw_spinlock =3D true so that
priv->regmap_cru can be safely accessed from raw_spinlock_t and hard-IRQ
contexts?

[Severity: High]
Does sky1_audss_irq_teardown() leak the mapped virq descriptors and leave
dangling pointers when audss_cru is unbound?

When d350_probe() calls platform_get_irq() for the 8 audss_dmac channels,
of_irq_get() -> irq_create_of_mapping() populates priv->irq_domain's
revmap_tree and invokes sky1_audss_irq_map(), storing pointers to priv,
priv->irq_domain, and sky1_audss_irq_chip in each irq_desc.

However, sky1_audss_irq_teardown() calls irq_domain_remove() without first
disposing the mappings via irq_dispose_mapping():

drivers/clk/cix/clk-sky1-audss.c:sky1_audss_irq_teardown() {
	struct sky1_audss_clks_priv *priv =3D data;

	regmap_update_bits(priv->regmap_cru, INFO_AP_IRQC,
			   INFO_AP_IRQC_DMAC_MASK, 0);
	irq_set_chained_handler_and_data(priv->parent_irq, NULL, NULL);
	irq_domain_remove(priv->irq_domain);
}

In kernel/irq/irqdomain.c, irq_domain_remove() triggers
WARN_ON(!radix_tree_empty(&domain->revmap_tree)) and frees priv->irq_domain,
leaving the 8 allocated irq_desc descriptors in sparse_irqs with dangling
references to the freed domain, devm-freed priv data, and module rodata if
/proc/interrupts or /sys/kernel/irq/<virq>/chip_name is subsequently read.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023093045.3248=
630-1-Jelly.Jia@cixtech.com?part=3D5
