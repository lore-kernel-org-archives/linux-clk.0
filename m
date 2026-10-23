Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792763518;
	b=l01jowesbJHGpInc5G1bAuM8MWyBPOClINQnqty18q7soAlshC+XWzZWbUj8JkrtmUkc
	 /SYyfkYPer6NZojXUfu4JwmlHJ7ZAUClybOmCCZegIWtxOZLi2MxzcRSGDIqeDqOUhx7F
	 TU+C0VzaR3Mdtp0zLCqB3kpxx4W0/A1c87G9lKxTqE+HUDf5/WsFPAnTK4GVObv2j87nI
	 GeCQdVQZ1HmWgmPGG6ulhoWJQWCG53vb7zCoUWRMOfF2+pqfFSz5M10e2gycGVklz53LF
	 196E6PH9aLxhkPa50RrJFMCtmscPqNVgcSvj/l8SJ7kMpCbP0n1THV6dNv4TMbjwLmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792763518;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=TAKxCU2g7ZssS6jzY0tFjm5wWJyDG3OVliCdtbb9FSQ=;
	b=U3SvI4RZ9vMFA5hKryX7aUJdkK6GILkVa0SwVTkNc8SNrsy3RzcGyg6EbuZN5J2Nkicc
	 T4KF9BszK88HH9ouJyvyLK3b9YiEpjEY1RI26izT5rdtVzVRzu2DZ+O7wDshnqaqw7vuz
	 U2c7YmFSvOgbN2Y7or8tOXJrlaRgIFRQG2QYPEdeV/3X/8jnGMPQTxUt0MZ3OVj1OZt+t
	 6sZ3G1a27lUmYM2+LWap/uLcEJbRoGZF0XAcgM6rFy1aiUBvHaZ8XODbbmuLGKqyFwzfm
	 q7rAYI06FQROtpqakzio6JcMJhVASXCK4dc/vr8l0y52++Dgsas1J6rEIDdadSvXCNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bVt30scg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1C2606A31E;
	Fri, 23 Oct 2026 13:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bVt30scg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B2EA1F01825;
	Fri, 23 Oct 2026 13:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792763518;
	bh=TAKxCU2g7ZssS6jzY0tFjm5wWJyDG3OVliCdtbb9FSQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bVt30scgC5QSH0ML6PgAy59diaTtxLO05ipan8X6SxJ4nB6xCh5+aU3YoiD+sneyZ
	 RvZLeAux/1uLv8oaoia0HiBmfm4e+Jc5C5DDmm5Mo25YcmbdFS3013YOKtbygA7SzW
	 lcu1AcLCX99oUcRCq4/9WG/QhqXaiYXle4f/cm6I4Om4v1qcNHZGqd5tzNUAXSp/UB
	 xmZCre61Ora9LfF0uVxOpj7Myi0C5nraM+K7CGNQWxtLnu7THiasvMmgVz498qeg8u
	 r121K2B/NwosGtSL5ai7lJ8a6yatJnVRkJyCu4QMLmM4Dta68p3NpXiQOnsPaLxpW9
	 tw8ytqDuRSuMg==
Message-ID: <sashiko-outbox-182855@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 7/7] clk: stm32mp25: add ck_ker_usb2phy1_stp clock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gabriel Fernandez" <gabriel.fernandez@foss.st.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261023-ups_mp25_clk_update-v1-7-e906e7a38cb3@foss.st.com>
References: <20261023-ups_mp25_clk_update-v1-0-e906e7a38cb3@foss.st.com>
 <20261023-ups_mp25_clk_update-v1-7-e906e7a38cb3@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 13:51:57 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] clk: stm32mp25: missing .disable_unused in clk_stm32_usb2phy1_st=
p_ops
- [Medium] clk: stm32mp25: stale or zero cached rate for ck_ker_usb2phy1_stp
--

commit 34669aa594d0d50f9cff33a984e8708660cbe4e8
Author: Gabriel Fernandez <gabriel.fernandez@foss.st.com>

clk: stm32mp25: add ck_ker_usb2phy1_stp clock

This commit adds the ck_ker_usb2phy1_stp gate clock for USB Host low power
support on STM32MP25, parenting it to HSE_KER_ON and deriving its rate from
ck_ker_usb2phy1.

> diff --git a/drivers/clk/stm32/clk-stm32mp25.c b/drivers/clk/stm32/clk-st=
m32mp25.c
> index a6a1293370eb5..649af99680f46 100644
> --- a/drivers/clk/stm32/clk-stm32mp25.c
> +++ b/drivers/clk/stm32/clk-stm32mp25.c

[ ... ]

> @@ -1635,6 +1637,42 @@ static struct clk_stm32_composite ck_ker_usb2phy1 =
=3D {
>  					    &clk_stm32_composite_ops, 0),
>  };
> =20
> +static int clk_stm32_usb2phy1_stp_enable(struct clk_hw *hw)
> +{
> +	return clk_stm32_gate_ops.enable(hw);
> +}
> +
> +static void clk_stm32_usb2phy1_stp_disable(struct clk_hw *hw)
> +{
> +	clk_stm32_gate_ops.disable(hw);
> +}
> +
> +static int clk_stm32_usb2phy1_stp_is_enabled(struct clk_hw *hw)
> +{
> +	return clk_stm32_gate_ops.is_enabled(hw);
> +}
> +
> +static unsigned long clk_stm32_usb2phy1_stp_recalc_rate(struct clk_hw *h=
w,
> +							unsigned long parent_rate)
> +{
> +	/* The rate of ck_ker_usb2phy1_stp is the same as ck_ker_usb2phy1 */
> +	return clk_hw_get_rate(&ck_ker_usb2phy1.hw);
> +}
> +
> +static const struct clk_ops clk_stm32_usb2phy1_stp_ops =3D {
> +	.enable		=3D clk_stm32_usb2phy1_stp_enable,
> +	.disable	=3D clk_stm32_usb2phy1_stp_disable,
> +	.is_enabled	=3D clk_stm32_usb2phy1_stp_is_enabled,
> +	.recalc_rate	=3D clk_stm32_usb2phy1_stp_recalc_rate,
> +};

[Severity: Medium]
Should clk_stm32_usb2phy1_stp_ops also wire up .disable_unused to
clk_stm32_gate_ops.disable_unused?

In drivers/clk/stm32/clk-stm32-core.c, clk_stm32_gate_ops provides a dedica=
ted
.disable_unused callback:

const struct clk_ops clk_stm32_gate_ops =3D {
	.enable		=3D clk_stm32_gate_enable,
	.disable	=3D clk_stm32_gate_disable,
	.is_enabled	=3D clk_stm32_gate_is_enabled,
	.disable_unused	=3D clk_stm32_gate_disable_unused,
};

Because clk_stm32_usb2phy1_stp_ops omits .disable_unused,
clk_disable_unused_subtree() in drivers/clk/clk.c falls back to calling
core->ops->disable(core->hw) when the clock is enabled in hardware at boot
(bit 4 of RCC_USB2PHY1CFGR set) but unused by any consumer:

	if (clk_core_is_enabled(core)) {
		trace_clk_disable(core);
		if (core->ops->disable_unused)
			core->ops->disable_unused(core->hw);
		else if (core->ops->disable)
			core->ops->disable(core->hw);
		trace_clk_disable_complete(core);
	}

That calls clk_stm32_usb2phy1_stp_disable() -> clk_stm32_gate_ops.disable()=
 ->
stm32_gate_endisable() with data->gate_cpt[GATE_USB2PHY1STP] =3D=3D 0:

	} else {
		if (--data->gate_cpt[gate_id] > 0)
			return;

		if (gate->set_clr !=3D 0)
			writel(BIT(gate->bit_idx), addr + gate->set_clr);
		else
			writel(readl(addr) & ~BIT(gate->bit_idx), addr);
	}

Wouldn't this underflow the u16 reference counter
data->gate_cpt[GATE_USB2PHY1STP] from 0 to 0xffff, causing
stm32_gate_endisable() to return early without clearing bit 4 in
RCC_USB2PHY1CFGR and preventing later clk_enable() / clk_disable() cycles f=
rom
disabling the gate?

> +
> +/* Parent clock of ck_ker_usb2phy1_stp is HSE_KER_ON to ensure it remain=
s active during low power */
> +static struct clk_stm32_gate ck_ker_usb2phy1_stp =3D {
> +	.gate_id =3D GATE_USB2PHY1STP,
> +	.hw.init =3D CLK_HW_INIT_INDEX("ck_ker_usb2phy1_stp", HSE_KER_ON,
> +				     &clk_stm32_usb2phy1_stp_ops, 0),
> +};

[Severity: Medium]
Can clk_get_rate() on ck_ker_usb2phy1_stp return a stale or zero cached rate
here?

In drivers/clk/clk.c, clk_core_get_rate_recalc() only invokes .recalc_rate =
on
clk_get_rate() when CLK_GET_RATE_NOCACHE is set:

static unsigned long clk_core_get_rate_recalc(struct clk_core *core)
{
	if (core && (core->flags & CLK_GET_RATE_NOCACHE))
		__clk_recalc_rates(core, false, 0);

	return clk_core_get_rate_nolock(core);
}

Because ck_ker_usb2phy1_stp is parented to HSE_KER_ON rather than
ck_ker_usb2phy1 and its flags are 0, any rate or parent change on
ck_ker_usb2phy1 (such as via assigned-clock-parents / assigned-clock-rates =
in
of_clk_set_defaults() or runtime clk_set_rate() / clk_set_parent()) only
recalculates ck_ker_usb2phy1's subtree and leaves ck_ker_usb2phy1_stp's cac=
hed
core->rate stale.

In addition, when stm32mp25_rcc_clocks_probe() runs before the SCMI clock
provider is registered, stm32_rcc_clock_init() registers ck_ker_usb2phy1 and
then ck_ker_usb2phy1_stp as orphans via hlist_add_head(&core->child_node,
&clk_orphan_list) in __clk_core_init(). Because hlist_add_head() places
ck_ker_usb2phy1_stp ahead of ck_ker_usb2phy1 on clk_orphan_list,
clk_core_reparent_orphans_nolock() reparents and recalculates
ck_ker_usb2phy1_stp while ck_ker_usb2phy1 is still an orphan with rate 0,
caching 0 for ck_ker_usb2phy1_stp.

Finally, on device trees such as arch/arm64/boot/dts/st/stm32mp251.dtsi and
stm32mp231.dtsi where the optional CK_SCMI_HSE_KER_ON clock is not listed in
the rcc node's clocks property, ck_ker_usb2phy1_stp remains an orphan
(core->parent =3D=3D NULL), causing clk_core_get_rate_nolock() to always re=
turn 0.

Should ck_ker_usb2phy1_stp set CLK_GET_RATE_NOCACHE, and how should the case
where HSE_KER_ON is absent from the device tree be handled?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023-ups_mp25_c=
lk_update-v1-0-e906e7a38cb3@foss.st.com?part=3D7
