Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793182434;
	b=gSzn1KEItLacjuhj6M2ixmUEEeQmBY71pvRonbMv2HjZYx3WJvzbInrIEGzEDXiVPoe4
	 kql5/IYF/whx0CXeWsw2jRZN84WABwsmb5HD+0nbGmGsF/kvceJfVFed/Gu7/MyQojOPH
	 yZHXNzcUZMpnQj129gst2yZETWN95RBURl+9YgYX3Jp5c9R/1Krm6xMtldYet/Z9XcUXV
	 MljJmy+r31+Z2z/+SLFZjMJXUfSoj4VYsp0QJbQTlMer6jsbm5n8CpQT8RYgZahEEz0Kv
	 bUhb3XWzy5AbI9FY/61MwO0gx1Pk8l0j9qmOgrjZLmFFnyNfIrelj0CMVcKpQ5CTk8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793182434;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=LVuykuiWIA6J2eBKnto+ivcOpxe5lv2bGEqxzguhQRM=;
	b=YMN60NP3kO5JIYkYf2+qgwu6lzgpsrDpeoc7U65urFRpXcS1ZT0pSVNgO8Ps1bVOeBUk
	 x2b3Jl2OSAF3zxK4HdL7ZvfqvGgLVhO/j880sOroXvQ46Pu/hNHhTyD78k7+wUKlpE5sv
	 X7C7IBeQspy35qsh/2mYcamZsnn6lv9u2Wo0bSBy9dSc/B4ATTrZdC3VMxOIDkbcZzby9
	 W78bpxHCWYUO6RzbLYLVJUbpKrM4CA+/vDKOV6l1S5DiUbAoK1sn8Duqp2E1XKAs/+reH
	 Kas1od4ylTvSUCUmje/4MyrvOyJ8FzlikXY9aLzF/4HJ9UQZ5Wsb35uO7GaWeKWQhHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m6GhsKqh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05CC6606A31A
	for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 10:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m6GhsKqh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83C071F01825;
	Wed, 28 Oct 2026 10:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793182433;
	bh=LVuykuiWIA6J2eBKnto+ivcOpxe5lv2bGEqxzguhQRM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=m6GhsKqhiGYEbA55GhnDdcFdg1apmARgrev78XhBWHZvVqRPNqcit+zgWe/zV5sZD
	 4I14Vv61TGsYxI+MCTIikWVG64h3iKp9p0nnYw0qfiPeOm44mkbFM4ev/stk/B9GKQ
	 XVhxFRE3bfV7kcv2PZfsNYCcwhTBe+yqwq3pVoIreLDgvCvotBWEEV8+fuekIlkB9N
	 T6MIjaMGTUd/ynTEzTXVBtTnxtSCJWMf/qzwzUx1KXg2orQfEgZwn6vdMeUPwg/lsP
	 sRpqMWzUgiew/raQj4+QTGLyZsW0q1uQlftf+LNvqYyuFnNkimgAP1pdhG8R3HJFEE
	 pbw6Y3rWr4RKQ==
Message-ID: <sashiko-outbox-187735@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 1/3] clk: Add a way to restore the clocks of a
 provider after a power cycle
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org
In-Reply-To: <20261028-b4-clk-restore-after-hibernation-v1-1-86cf62747a7f@oss.qualcomm.com>
References: <20261028-b4-clk-restore-after-hibernation-v1-0-86cf62747a7f@oss.qualcomm.com>
 <20261028-b4-clk-restore-after-hibernation-v1-1-86cf62747a7f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Oct 2026 10:13:53 +0000
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
- [High] clk: clk_core_restore_state() ignores set_rate_and_parent callback
- [High] clk: clk_core_restore_state() ignores CLK_OPS_PARENT_ENABLE and UN=
GATE flags
- [High] clk: clk_core_restore_state() calls set_parent/set_rate before ena=
ble
- [High] clk: clk_core_restore_state() passes unvalidated boot rate to set_=
rate()
- [Medium] clk: clk_core_restore_state() checks enable_count outside clk_en=
able_lock()
--

commit 78198c18d1a2d0f099c9c205f894c06eba8b44ff
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>

clk: Add a way to restore the clocks of a provider after a power cycle

This commit adds clk_restore_context_dev() to reprogram the cached parent,
rate, and prepare/enable state into hardware for all clocks registered by a
given provider device after a power cycle such as hibernation restore.

> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 4d2cc86bfbeb6..316c3c85f247d 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -1449,6 +1449,74 @@ void clk_restore_context(void)
>  }
>  EXPORT_SYMBOL_GPL(clk_restore_context);
> =20
> +static int clk_fetch_parent_index(struct clk_core *core,
> +				  struct clk_core *parent);
> +
> +/* Program the cached parent, rate and prepare/enable state into the har=
dware */
> +static void clk_core_restore_state(struct clk_core *core)
> +{
> +	struct clk_core *parent =3D core->parent;
> +	unsigned long flags;
> +	int index;
> +
> +	lockdep_assert_held(&prepare_lock);
> +
> +	if (parent && core->num_parents > 1 && core->ops->set_parent) {
> +		index =3D clk_fetch_parent_index(core, parent);
> +		if (index >=3D 0)
> +			core->ops->set_parent(core->hw, index);
> +	}

[Severity: High]
What happens here when a clock implements core->ops->set_rate_and_parent
and cannot tolerate separate .set_parent() and .set_rate() calls?

In drivers/clk/clk.c, clk_change_rate() prefers .set_rate_and_parent() when
both parent and rate are updated:

	if (core->ops->set_rate_and_parent) {
		skip_set_rate =3D true;
		core->ops->set_rate_and_parent(core->hw, core->new_rate,
				best_parent_rate,
				core->new_parent_index);
	} else if (core->ops->set_parent) {
		core->ops->set_parent(core->hw, core->new_parent_index);
	}

In clk_core_restore_context_dev() -> clk_core_restore_state(), calling
core->ops->set_parent() and core->ops->set_rate() separately without
checking core->ops->set_rate_and_parent breaks clocks that rely on the
combined callback. For example, in drivers/clk/qcom/clk-rcg2.c,
clk_gfx3d_set_rate() is a no-op stub:

static int clk_gfx3d_set_rate(struct clk_hw *hw, unsigned long rate,
			      unsigned long parent_rate)
{
	/*
	 * We should never get here; clk_gfx3d_determine_rate() should always
	 * make us use a different parent than what we're currently using, so
	 * clk_gfx3d_set_rate_and_parent() should always be called.
	 */
	return 0;
}

On clk_gfx3d_ops, clk_rcg2_set_parent() only updates CFG_SRC_SEL_MASK and
only clk_gfx3d_set_rate_and_parent() programs the divider cgfx->div into
CFG_SRC_DIV_SHIFT. Similarly, c910_clk_set_rate() in
drivers/clk/thead/clk-th1520-ap.c returns -EOPNOTSUPP, and on standard
Qualcomm RCG2 and composite clocks, switching the parent mux before
reprogramming the divider can cause a transient frequency spike while the
divider still holds its boot value.

Should clk_core_restore_state() use core->ops->set_rate_and_parent() when
both parent and rate are being restored?

[Severity: High]
Also, could calling .set_parent() and .set_rate() here without honoring
CLK_OPS_PARENT_ENABLE and CLK_SET_RATE_UNGATE cause hardware update
timeouts when the parent or clock is currently disabled?

In drivers/clk/clk.c, clk_change_rate() prepares and enables the clock and
its parent around rate and parent programming when those flags are set:

	if (core->flags & CLK_SET_RATE_UNGATE) {
		clk_core_prepare(core);
		clk_core_enable_lock(core);
	}
	...
	if (core->flags & CLK_OPS_PARENT_ENABLE)
		clk_core_prepare_enable(parent);

During hibernation restore, provider restore callbacks run while many
configured clocks and their parents have prepare_count =3D=3D 0 and
enable_count =3D=3D 0. Even though clk_restore_context_dev() visits parents
before children, clk_core_restore_state() only enables the parent if
parent->enable_count is non-zero. When clk_core_restore_state() then calls
.set_parent() or .set_rate() on a child with CLK_OPS_PARENT_ENABLE (such as
Qualcomm RCG2 clocks using clk_rcg2_ops), update_config() in
drivers/clk/qcom/clk-rcg2.c cannot complete its hardware handshake while
the parent is gated:

	for (count =3D 500; count > 0; count--) {
		ret =3D regmap_read(rcg->clkr.regmap, rcg->cmd_rcgr + CMD_REG, &cmd);
		if (ret)
			return ret;
		if (!(cmd & CMD_UPDATE))
			return 0;
		udelay(1);
	}

	WARN(1, "%s: rcg didn't update its configuration.", name);
	return -EBUSY;

Should clk_core_restore_state() temporarily prepare and enable the parent
(for CLK_OPS_PARENT_ENABLE) and the clock itself (for CLK_SET_RATE_UNGATE)
around the parent and rate restore operations?

> +
> +	if (core->rate && core->ops->set_rate)
> +		core->ops->set_rate(core->hw, core->rate,
> +				    parent ? parent->rate : 0);

[Severity: High]
Is it safe to pass core->rate unconditionally to core->ops->set_rate() if
no consumer ever called clk_set_rate() on this clock?

At registration time in __clk_core_init(), core->rate is initialized from
core->ops->recalc_rate() based on the power-on reset register state (for
example, 19.2 MHz from XO on Qualcomm RCG2 clocks) rather than a rate
validated by .determine_rate().

For clocks using clk_rcg2_shared_floor_ops whose frequency table only
contains PLL frequencies above 19.2 MHz (such as
gcc_sdcc1_ice_core_clk_src in drivers/clk/qcom/gcc-eliza.c, where the table
starts at 100 MHz), passing the 19.2 MHz boot rate into
clk_rcg2_shared_floor_set_rate() -> __clk_rcg2_shared_set_rate() causes
qcom_find_freq_floor() to return NULL:

	switch (policy) {
	case FLOOR:
		f =3D qcom_find_freq_floor(rcg->freq_tbl, rate);
		break;
	case CEIL:
		f =3D qcom_find_freq(rcg->freq_tbl, rate);
		break;
	default:
		return -EINVAL;
	}

	if (!clk_hw_is_enabled(hw))
		return __clk_rcg2_configure(rcg, f, &rcg->parked_cfg);

	return clk_rcg2_shared_force_enable_clear(hw, f);

Because __clk_rcg2_shared_set_rate() does not check for a NULL f before
calling __clk_rcg2_configure(), dereferencing f->src triggers a NULL
pointer dereference. On CEIL-policy clocks (clk_rcg2_ops), passing an
unconfigured 19.2 MHz boot rate to clk_rcg2_set_rate() rounds up to the
lowest PLL entry in freq_tbl and switches the hardware mux to that PLL,
desynchronizing the hardware parent and rate from core->parent and
core->rate.

> +
> +	if (core->prepare_count && core->ops->prepare)
> +		core->ops->prepare(core->hw);
> +
> +	if (core->enable_count && core->ops->enable) {
> +		flags =3D clk_enable_lock();
> +		core->ops->enable(core->hw);
> +		clk_enable_unlock(flags);
> +	}
> +}

[Severity: High]
Won't calling .set_parent() and .set_rate() before .enable() corrupt the
restored configuration on clocks using clk_rcg2_shared_ops when
core->enable_count > 0?

In drivers/clk/clk.c, clk_core_is_enabled() falls back to
core->enable_count when core->ops->is_enabled is not implemented:

	if (!core->ops->is_enabled)
		return core->enable_count;

Because clk_rcg2_shared_ops in drivers/clk/qcom/clk-rcg2.c does not
implement .is_enabled, clk_hw_is_enabled(hw) returns true during
clk_core_restore_state() whenever core->enable_count > 0:

1. clk_rcg2_shared_set_parent() sees clk_hw_is_enabled(hw) =3D=3D true, so =
it
   skips updating rcg->parked_cfg and calls clk_rcg2_set_parent() ->
   update_config() without force-enabling the RCG, which times out because
   child branches are not yet restored.

2. clk_rcg2_shared_set_rate() -> __clk_rcg2_shared_set_rate() also sees
   clk_hw_is_enabled(hw) =3D=3D true, so it writes the rate directly to
   hardware via clk_rcg2_shared_force_enable_clear() without updating
   rcg->parked_cfg:

	if (!clk_hw_is_enabled(hw))
		return __clk_rcg2_configure(rcg, f, &rcg->parked_cfg);

	return clk_rcg2_shared_force_enable_clear(hw, f);

3. Immediately afterwards, clk_core_restore_state() calls
   core->ops->enable(), which invokes clk_rcg2_shared_enable():

	/* Write back the stored configuration corresponding to current rate */
	ret =3D regmap_write(rcg->clkr.regmap, rcg->cmd_rcgr + CFG_REG, rcg->parke=
d_cfg);
	if (ret)
		return ret;

	ret =3D update_config(rcg);

This overwrites CFG_REG with the stale rcg->parked_cfg value, clobbering
the rate and parent that .set_parent() and .set_rate() just programmed.

[Severity: Medium]
In addition, can checking core->enable_count before acquiring
clk_enable_lock() race with a concurrent clk_disable()?

In drivers/clk/clk.c, clk_core_disable() decrements core->enable_count and
calls core->ops->disable() under enable_lock without holding prepare_lock:

	if (--core->enable_count > 0)
		return;

	trace_clk_disable(core);

	if (core->ops->disable)
		core->ops->disable(core->hw);

If core->enable_count is 1 when clk_core_restore_state() checks it outside
clk_enable_lock(), and a concurrent clk_disable() runs before
clk_enable_lock() is acquired, core->enable_count drops to 0 and the clock
is disabled, after which clk_core_restore_state() acquires
clk_enable_lock() and unconditionally calls core->ops->enable(core->hw).
Should core->enable_count be checked after acquiring clk_enable_lock(),
similar to clk_disable_unused_subtree()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261028-b4-clk-res=
tore-after-hibernation-v1-0-86cf62747a7f@oss.qualcomm.com?part=3D1
