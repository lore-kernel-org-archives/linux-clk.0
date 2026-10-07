Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A868633FE05;
	Wed,  7 Oct 2026 07:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791356746; cv=none; b=Ak8RkDISNWJMoW945q4rJHVyVK7NktgEiBXdNJr6oR4bcgT6Zrq8fF3M3110tyS9MfAThMYo4ebLwSDt4yJkRyhSyNfRa37UVfAcyI72OM996XcWFSna9OJOhioQ+nuZa38ED1CDkYHTWKQrxdO3zuRf/0VxiUmPeIC+/i0jMac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791356746; c=relaxed/simple;
	bh=plGTE4i/JKvBSg1EJp9QjiFEUlgfjg7QxfZeB3XEPQQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=dYAzUqlJGfoBj5nopfzHE1Consw7nXRrFGGpFwHsmA5E+OftySmGkikiHFyP5e3S1VfKe0UpoGlP6kcoGlcJd2+4csuzhwYHNY8yGqf0K2A1HG05VgYO7veOfyqiEBGxa53O8J71pfKMOXmPxOUDLyEAfPJR63BazBnnYJvURtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M9WvsPS4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M9WvsPS4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E795E1F0089B;
	Wed,  7 Oct 2026 07:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791356745;
	bh=zE7x8mwroMqzVvZsd48PbPdzc5eCBks6/z+j6DuMqko=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=M9WvsPS4mDGVLgITZOHJqvxCbKW1I9Gba9v1n9kjeztRA45wfvP2gcz8M4wzx1FPM
	 nT9sbwoTxR7pBEDBW7gueuN9lA6NztjD7SIlqfW8tmtO6uyfvydkvrTjTZBZcfZp3B
	 afJ156BzKMuc9QcgkqqAqM7Yiob8DNFz76RS8WnxGtdZjr2Lb+4gsOqTQJTS6UijjI
	 +SyHzw9MeOefLOai4hPcXKuNnY+ihhVhLNWYt1FH5ksLmJtJtRIdp3T0rgBaUZVE1E
	 lvxCMqJyGD2vxoMKeyylaePDDouEMogueK/+zq+4yDHf0g7H3KyzxTfUC4TP0ehuk8
	 y8teYIJJWfoSA==
Message-ID: <sashiko-outbox-162689@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] interconnect: icc-clk: support N:1 master-to-slave
 topology
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kathiravan Thirumoorthy" <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261007-ipq9650_apss_clk-v1-1-fd4c2b3cbdea@oss.qualcomm.com>
References: <20261007-ipq9650_apss_clk-v1-0-fd4c2b3cbdea@oss.qualcomm.com>
 <20261007-ipq9650_apss_clk-v1-1-fd4c2b3cbdea@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Oct 2026 07:05:44 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] icc: list corruption and data race in icc_clk_set() during concurr=
ent unbind
- [Medium] icc: bypassed rate aggregation leaves shared clock at high rate
- [Medium] icc: missing error check for icc_link_create() in icc_clk_regist=
er()
--

commit fb3619debbc961d128e9125a7da752adeb391118
Author: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

    interconnect: icc-clk: support N:1 master-to-slave topology

    icc_clk_register() assumes each icc_clk_data entry describes a unique
    master/slave pair and creates both nodes for every entry. When several
    masters share the same slave_id, the shared slave node is created and
    added again on each later entry. icc_node_create() returns the existing
    node, so icc_node_add() hits WARN_ON(node->provider):

[ ... ]

    This topology is needed on IPQ9650, where the silver and gold CPU
    clusters both vote on the single L3 clock through a shared SLAVE_L3
    node.
   =20
    The onecell table is also filled in registration order, so xlate only
    works when the node IDs happen to match that order. Size the table by
    the highest node ID, index it by ID, and skip slave creation when the
    node is already registered.
   =20
    icc_clk_set() also passes only the requesting node's bandwidth to
    clk_set_rate(), so the last writer wins. A low vote from one master can
    then lower the clock below what another master asked for. Before setting
    the rate, take the highest peak bandwidth across all nodes that share
    the clock.

> diff --git a/drivers/interconnect/icc-clk.c b/drivers/interconnect/icc-cl=
k.c
> index 93c030608d3e0..567d071fade8e 100644
> --- a/drivers/interconnect/icc-clk.c
> +++ b/drivers/interconnect/icc-clk.c
> @@ -24,7 +24,10 @@ struct icc_clk_provider {
> =20
>  static int icc_clk_set(struct icc_node *src, struct icc_node *dst)
>  {
> +	unsigned long rate =3D icc_units_to_bps(src->peak_bw);
> +	struct icc_provider *provider =3D src->provider;
>  	struct icc_clk_node *qn =3D src->data;
> +	struct icc_node *node;
>  	int ret;
> =20
>  	if (!qn || !qn->clk)
>  		return 0;
> =20
>  	if (!src->peak_bw) {
>  		if (qn->enabled)
>  			clk_disable_unprepare(qn->clk);
>  		qn->enabled =3D false;
> =20
>  		return 0;
>  	}

[Severity: Medium]
Will this early return circumvent the newly added aggregation logic when a
master sets its bandwidth to zero?

When multiple masters share the same clock in an N:1 topology, bypassing the
rate aggregation loop due to an early return causes the underlying shared
clock to remain running at the previously requested high rate instead of
stepping down to the maximum of the remaining masters' votes. The clock sta=
ys
unnecessarily high until another node updates its vote.

> =20
>  	if (!qn->enabled) {
>  		ret =3D clk_prepare_enable(qn->clk);
>  		if (ret)
>  			return ret;
>  		qn->enabled =3D true;
>  	}
> =20
> -	return clk_set_rate(qn->clk, icc_units_to_bps(src->peak_bw));
> +	/*
> +	 * Multiple master nodes can share the same underlying clock (N:1
> +	 * topology, e.g. several CPU clusters voting on one L3 clock).
> +	 * Aggregate the peak bandwidth across all of them before setting
> +	 * the rate, otherwise the last caller wins and can undervote what
> +	 * another master already asked for.
> +	 */
> +	list_for_each_entry(node, &provider->nodes, node_list) {

[Severity: High]
Does this list iteration race with concurrent unbind?

icc_clk_set() executes as the provider->set callback holding only icc_bw_lo=
ck.
Concurrently, if an interconnect provider is unbound via sysfs,
icc_node_del() removes nodes from provider->nodes using list_del() while
holding only icc_lock:

drivers/interconnect/core.c:icc_node_del() {
    mutex_lock(&icc_lock);
    list_del(&node->node_list);
    mutex_unlock(&icc_lock);
}

Because the locks are disjoint, this list traversal can race with list_del(=
),
leading to iteration over poisoned pointers.

> +		struct icc_clk_node *n =3D node->data;
> +
> +		if (n && clk_is_match(n->clk, qn->clk))
> +			rate =3D max(rate, icc_units_to_bps(node->peak_bw));
> +	}
> +
> +	return clk_set_rate(qn->clk, rate);
>  }

[ ... ]

> @@ -126,7 +148,16 @@ struct icc_provider *icc_clk_register(struct device =
*dev,
>  		icc_node_add(node, provider);
>  		/* link to the next node, slave */
>  		icc_link_create(node, first_id + data[i].slave_id);
> -		onecell->nodes[j++] =3D node;
> +		onecell->nodes[data[i].master_id] =3D node;

[Severity: Medium]
Should the return value of icc_link_create() be checked here?

If icc_link_create() fails to allocate memory for the links, it returns
-ENOMEM. Because this return value is ignored, the interconnect graph links
might silently fail to form. This can break the master-to-slave interconnect
topology, leading to ignored bandwidth requests while driver initialization
appears to succeed.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261007-ipq9650_ap=
ss_clk-v1-0-fd4c2b3cbdea@oss.qualcomm.com?part=3D1
