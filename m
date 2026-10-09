Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3CF3DCDA4
	for <linux-clk@vger.kernel.org>; Fri,  9 Oct 2026 06:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791527626; cv=none; b=Xeu+LETwQoT7UINXb5GP0BO6SmNrUMexlVRhZ4MnNa6OcQezgq3XqWkFVybLY9/mqXzKbkeZ9eiBL/0Yvlgu7uhER5yGX+xbxHHGFJg3We3MmhpAHoFN63+ai9zMeX/Oh9NSy9YNZx3jC/wG6uLoiXtLv595xlRBY7V7ejDhYDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791527626; c=relaxed/simple;
	bh=tHXwKxqHphG+/uvPRXP0ejHdsh8mclQYm3dekJP+Das=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=cPVKR+tiLIIv7uNh040goHaIC6DRGnwhB41o3za1JkD8UJ44Jng6K/3ykoz+oR2C1rt/sfNCmNZaRm4mu44OQPxCPIHAHTsj0KW7uDgM9v3dZdAE4TQdzKS7uBrbQjnUR4cJfYT3nKiHRwK7I++Aeu9YDDrZKkdOJFmMgyiISl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EfERe5AO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EfERe5AO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B629E1F000FF;
	Fri,  9 Oct 2026 06:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791527624;
	bh=N3hGE/OlXwJ10VzPn0F2PMm1ZaQGgN8yCp8Ny6Ab2wU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EfERe5AOwHz4gb43adiD0Lj+oi3Dpf3sedrJaYlS8C3jBNsJI9ORQJb8SQFgQAeVb
	 nhCn9C2+LmLejya2u+2egeWfLj51uR8MPkJ34REWMORfPgD/owAWMyfy/4LjOTlEZD
	 5jy8lpyBtX4liPDD6bi7/RpEZAspSz12XLHWUClvR4szB/rWfe6JCjRqUVeOEc6XZn
	 5JutXRr7a+sxLjE7JRCt1iHiyZQP9WB1daSJRaJO3zItDeEZj7fpYjJsf8wj3tmz9q
	 OFiByf6772UsxuvzrTVBbB4y47mRpwLEvyG+lMbb596OwXl/EGs2HOTozjiIuRWjid
	 xWbnGaCGBuL9g==
Message-ID: <sashiko-outbox-164950@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] clk: xilinx: fix NULL pointer dereference in
 xvcu_clk_hw_unregister_leaf()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Haotian Zhang" <vulab@iscas.ac.cn>
Cc: linux-clk@vger.kernel.org
In-Reply-To: <20261009061805.3172589-1-vulab@iscas.ac.cn>
References: <20261009061805.3172589-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 06:33:44 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] clk: xilinx: Use-After-Free due to incorrect child/parent unregist=
er order
- [High] clk: xilinx: UAF race during removal due to mixed devm/manual clea=
nup
--

commit 7f74ba5d4aed358cc163ed1eb7e56a50f1f385b0
Author: Haotian Zhang <vulab@iscas.ac.cn>

clk: xilinx: fix NULL pointer dereference in xvcu_clk_hw_unregister_leaf()

This commit addresses a NULL pointer dereference when a divider has no pare=
nt
by checking that the mux is non-NULL before calling clk_hw_unregister_mux().
It also removes dead code that erroneously checked the divider instead of t=
he
mux.

> diff --git a/drivers/clk/xilinx/xlnx_vcu.c b/drivers/clk/xilinx/xlnx_vcu.c
> index ccd9d7c0b1809..58a9762ef20a9 100644
> --- a/drivers/clk/xilinx/xlnx_vcu.c
> +++ b/drivers/clk/xilinx/xlnx_vcu.c
> @@ -516,9 +516,8 @@ static void xvcu_clk_hw_unregister_leaf(struct clk_hw=
 *hw)
>  		return;
> =20
>  	mux =3D clk_hw_get_parent(divider);
> -	clk_hw_unregister_mux(mux);
> -	if (!divider)
> -		return;
> +	if (mux)
> +		clk_hw_unregister_mux(mux);
> =20
>  	clk_hw_unregister_divider(divider);

[Severity: High]
Does this unregister the parent mux before the child divider, leading to a
use-after-free?

Calling clk_hw_unregister_mux() first reparents the divider to the orphan
list, but leaves divider->core->parents[0].hw pointing to the mux struct be=
fore
the memory is freed by the mux unregistration.

If a concurrent thread registers a new clock, the clock framework invokes
clk_core_reparent_orphans_nolock() to try resolving orphans. It iterates the
orphan list, finds the divider, and calls clk_core_fill_parent_index(), whi=
ch
reads the dangling entry->hw pointer and dereferences it:

drivers/clk/clk.c:clk_core_fill_parent_index() {
    ...
	if (entry->hw) {
		parent =3D entry->hw->core;
    ...
}

Should the teardown strictly follow leaf-to-root order (gate -> divider -> =
mux)
to prevent orphaned children from dereferencing freed parent pointers during
concurrent reparenting?


[Severity: High]
Does this manual cleanup race with the devres-managed OF provider removal?

Because xvcu_register_clock_provider() registers the OF clock provider using
devm_of_clk_add_hw_provider(), the OF provider isn't removed from the global
clock provider list until the devres cleanup phase, which executes after
xvcu_remove() returns.

By manually freeing the hardware structures here during xvcu_remove(), the
active OF provider is left with dangling pointers in its internal hws array.
If a concurrent consumer invokes clk_get() during this window,
of_clk_hw_onecell_get() could yield a freed clk_hw pointer, resulting in a
use-after-free in the clock framework.

>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009061805.3172=
589-1-vulab@iscas.ac.cn?part=3D1
