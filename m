Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEAF03C1D57;
	Wed, 14 Oct 2026 12:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791981619; cv=none; b=W0Tez1TLlffK5rcMDdYnTRVc+D0g7pwaYrDfwKmMfp97/GQSDWTMNJ7xdXEu4xOerW1Jp66aBFThCZdrNNjnefEn3DvpdTfbOuvKTrOIzeEyFvQMcKbifTgIlu08+4jriYOY8K7pw8D14bl44/73wC3TPgGFS+8c1t/S/XQ3BLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791981619; c=relaxed/simple;
	bh=JOmuHcUZF/AE8lRcgzIFqV7vuV11eO73EVg/W0z0PxE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=uDoMOMvjgqP4+dxd7sCZX/64Dz5IWZ+/6efHutcXDl25WDcEP6RvIscRoG9DjacEpDQsU42dcoCcZ7m4i0JkGT9xVS6T1SM7tmSuZ9LkjuiP5mnBt0WSmu5009IjUPI/+iTZqp0WpGAn3YKViZQT4dCn/7UAV4om7MHHTB2pPHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HEe3D/9L; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HEe3D/9L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 039C51F000FF;
	Wed, 14 Oct 2026 12:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791981614;
	bh=Qeu4bPzJhnCqIOL1w0obhAIBznTfsH/IVPwIl6hQ4vI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HEe3D/9LPFV46nXHkbgE5wuNUYZPp1UTt4JqtQEIqhLnDjOXxG+xsnIlZ7vzFxNWV
	 ADFydsTanqqFPPwl9jo7Yfm3i1zSouBlqJyDTS6L/yHnV/4akm4leo3mkhB3n/RqOj
	 oWw0IBamtvNBWBObjC18g4q3a5De/oTkHMkrz1cFsaxZva2co1hZu5OH2S7EOMN4A1
	 aJQkW3P9dkAEcdeX6g05pRqrGEfZ5a2/IZyjcbTUBRDP+ZsUd8Ieehcuy6LuCLFCOm
	 PD+Xl5bnodX7b84ppZyAvx5saCSwfzieDSgQj6kTDoYl5gkruyO6xnAYI2NoFd/GhR
	 RD1ebQbDW/few==
Message-ID: <sashiko-outbox-171294@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 02/16] clk: Acquire resources for clock transitions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Konrad Dybcio" <konradybcio@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261014-topic-qc_clk_dvfs-v1-2-3041b788e9f7@oss.qualcomm.com>
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-2-3041b788e9f7@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 12:40:13 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Critical] clk: ABORT_RATE_CHANGE sent after successful hardware rate tra=
nsition
- [High] clk: WARN_ON_ONCE(1) in clk_nodrv_ops during clk_unregister
- [High] clk: Missing PM runtime management in resource acquire/release cal=
lbacks
- [Medium] clk: permanent resource_fault on clocks lacking acquire ops
--

commit dab9de10ac4ce05ffd78cfafa44b173a82f23842
Author: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

clk: Acquire resources for clock transitions

This commit updates the Common Clock Framework to acquire resources for the
affected tree and parent paths before executing clock transitions. It defers
reconciliation until the tree walk completes to ensure safe fault recovery.
It also modifies parent-change failure paths to retain references explicitl=
y.

> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 95669775f8cd1..46e01d8254e5b 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
[ ... ]
> @@ -2444,52 +2517,270 @@ static struct clk_core *clk_calc_new_rates(struc=
t clk_core *core,
[ ... ]
> +static int
> +clk_resource_release(struct clk_resource_transaction *tx,
> +		     enum clk_resource_change_result result)
> +{
> +	struct clk_resource_acquisition *acquisition, *tmp;
> +	int first_error =3D 0;
> +	int ret;
> +
> +	list_for_each_entry_reverse(acquisition, &tx->acquisitions, node) {
> +		struct clk_core *core =3D acquisition->core;
> +
> +		if (result =3D=3D CLK_RESOURCE_HW_CHANGED)
> +			core->resource_fault =3D true;
> +
> +		acquisition->transition.actual_rate =3D core->rate;
> +		acquisition->transition.actual_parent =3D core->parent ?
> +			core->parent->hw : NULL;
> +
> +		ret =3D core->ops->resource_release(core->hw,
> +						  &acquisition->transition,
> +						  acquisition->cookie,
> +						  result);

[Severity: High]
Does this code call resource_release() without PM runtime management?

clk_resource_acquire_tree() and clk_resource_release() invoke hardware ops =
on
descendant and ancestor clocks without invoking clk_pm_runtime_get() on them
first.

For descendants, clk_pm_runtime_get(child) is only called later inside
clk_change_rate(), and it is dropped as soon as clk_change_rate() unwinds.
Therefore, resource_release() will execute on children that no longer hold
an active PM runtime reference, potentially leading to unclocked/unpowered
register accesses and system faults.

> +		if (ret) {
> +			core->resource_fault =3D true;
> +			if (!first_error)
> +				first_error =3D ret;
> +		} else if (result =3D=3D CLK_RESOURCE_COMPLETE) {
> +			core->resource_fault =3D false;
> +		}
> +	}

[Severity: Medium]
Will clocks lacking resource_acquire() ops get permanently tainted with
resource_fault =3D true?

When a clock transition fails resource acquisition in a parent path, the
explicitly targeted clock is unconditionally marked with
core->resource_fault =3D true in clk_core_set_rate_nolock() (e.g. at the
acquire_failed label).

If that target clock doesn't implement ops->resource_acquire(), it isn't
added to the transaction's tx.acquisitions list. Later, if a transition on a
different node succeeds, it iterates over tx.acquisitions to clear the fault
flag. Since the initially failed clock isn't in that list and isn't the new
target, its resource_fault flag stays true permanently, which bypasses
short-circuiting optimizations for it and all its ancestors.

> +
> +	list_for_each_entry_safe(acquisition, tmp, &tx->acquisitions, node) {
> +		list_del(&acquisition->node);
> +		kfree(acquisition);
> +	}
> +
> +	return first_error;
> +}
[ ... ]
> @@ -2649,8 +2951,14 @@ static unsigned long clk_core_req_round_rate_noloc=
k(struct clk_core *core,
>  static int clk_core_set_rate_nolock(struct clk_core *core,
>  				    unsigned long req_rate)
>  {
[ ... ]
>  	/* change the rates */
> -	ret =3D clk_change_rate(top);
> +	ret =3D clk_change_rate(top, resource_managed);
>  	if (ret) {
>  		__clk_recalc_rates(top, true, 0);
> -		clk_propagate_rate_change(top, ABORT_RATE_CHANGE);
> +		clk_finish_rate_notifications(&tx, ABORT_RATE_CHANGE);
> +		release_ret =3D clk_resource_release(&tx,
> +						    CLK_RESOURCE_HW_CHANGED);
> +		if (release_ret)
> +			ret =3D release_ret;
>  		goto err;
>  	}
> =20
> -	clk_propagate_rate_change(top, POST_RATE_CHANGE);
> +	ret =3D clk_resource_release(&tx, CLK_RESOURCE_COMPLETE);
> +	if (ret) {
> +		core->resource_fault =3D true;
> +		clk_finish_rate_notifications(&tx, ABORT_RATE_CHANGE);
> +		goto err;
> +	}

[Severity: Critical]
Is it intentional to send ABORT_RATE_CHANGE after the hardware rate has alr=
eady
been successfully changed?

If clk_change_rate() succeeds, the clock is running at the new rate. If
clk_resource_release() subsequently fails, the code branches to send
ABORT_RATE_CHANGE.

Consumers (like voltage regulators or displays) receive this abort notifica=
tion
and revert their hardware state to match the old clock rate (e.g., dropping
operating voltage). Because the clock hardware actually remains running at =
the
new, potentially higher rate, this creates a severe inconsistency where a
component operates at a high frequency with an inadequate voltage.

This identical pattern also appears in clk_core_set_parent_nolock().

> +	core->resource_fault =3D false;
> +
> +	clk_finish_rate_notifications(&tx, POST_RATE_CHANGE);
> =20
>  	core->req_rate =3D req_rate;
>  err:
> +	clk_clear_new_child(top);
>  	clk_pm_runtime_put(core);
> =20
>  	return ret;
> +
> +acquire_failed:
> +	core->resource_fault =3D true;
> +	release_ret =3D clk_resource_release(&tx,
> +					    CLK_RESOURCE_NO_HW_CHANGE);
> +	if (release_ret)
> +		ret =3D release_ret;
> +	goto err;

[ ... ]
> @@ -4776,14 +5221,25 @@ void clk_unregister(struct clk *clk)
> =20
>  		/* Reparent all children to the orphan list. */
>  		hlist_for_each_entry_safe(child, t, &clk->core->children,
> -					  child_node)
> +					  child_node) {
> +			if (child->parent_fault) {
> +				pr_warn("%s: releasing unresolved parent fault for %s\n",
> +					__func__, child->name);
> +				clk_release_parent_fault(child);
> +			}
>  			clk_core_set_parent_nolock(child, NULL);
> +		}
>  	}
> =20
>  	clk_core_evict_parent_cache(clk->core);
> =20
>  	hash_del(&clk->core->hashtable_node);
>  	hlist_del_init(&clk->core->child_node);
> +	if (clk->core->parent_fault) {
> +		pr_warn("%s: releasing unresolved parent fault for %s\n",
> +			__func__, clk->core->name);
> +		clk_release_parent_fault(clk->core);
> +	}

[Severity: High]
Does this code trigger a WARN_ON_ONCE(1) due to invoking
clk_release_parent_fault() after operations have been neutralized?

Earlier in clk_unregister(), clk->core->ops is replaced with &clk_nodrv_ops=
 to
neutralize hardware accesses.

When clk_release_parent_fault() is subsequently called here (or in the
child reparenting loop above), it cleans up retained migration references by
calling clk_core_disable_unprepare() on the faulted old or new parent, which
is the clock currently being unregistered.

Because the operations pointer has already been replaced, this call routes =
to
clk_nodrv_disable_unprepare(), which triggers an unconditional WARN_ON_ONCE=
(1).
It looks like the fault cleanup needs to occur before the ops pointer is
substituted.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014-topic-qc_c=
lk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com?part=3D2
