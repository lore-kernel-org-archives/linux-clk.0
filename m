Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF6F84E80CC;
	Wed, 14 Oct 2026 12:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791981432; cv=none; b=lXJOyyPCA7W122VlYHcJUB698aOKXCwpzLjq0hbQQFPD8B2AandommN4KAuPr6QRjvXsPhWTuBbdeCLWgCGaUa6Yeacdn0eMnkRwCqLOa3/ZRIIrq9Ly6NOGWw7NEJMacBRDlCJK+SXmgy78zMMvwuiH3C5EbTJTS3yHQ+yJLLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791981432; c=relaxed/simple;
	bh=7uSCPyNA9hYTau3ViEp9GhTrfshCNKJ/zqI6j1VxtSY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=skE8vi5f2Zfcv+Q8IQH2o6456m32gvqDuOpx1LK8eyHEcVfk/5AeR/yAZ7aHwRBNfKSOPycjBC6hofSZX4SKWTMzMfWrp3omSLIKi1rn/IZRWb2AuvoBbO+BZ2BdIzZk0Dx1sXH6HHrPvd1CvomnRIqoijZ+169MNTJlGZkTRI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OFYlGaqg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OFYlGaqg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05B151F008A3;
	Wed, 14 Oct 2026 12:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791981431;
	bh=EyujO6LreswkVKkIMfcZj0sBOrMuUNoqqwofZg3zjIM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OFYlGaqgmApbJgl6LENgncMYh3zuMBtlIVjT9AaUjvyCUKs6MciDeopMUBK4waChc
	 PKGeYex7r1hezA16yvIv9nw67xLdOM6smIhhsbmsIjtnVS/Blb3SKmdoyxaoJ+6lsZ
	 hk6L9GvKuCNgG5aPs08hx98jSBa1NXFJPeB5E3JilWxQDTy9gD+kHRokw6V2nEJ1YB
	 zvqUoPHLfQvFlZbMSb+8ueK7OmxSrdAiKmziGAGz58Z9c3+t77M3KjAqOYBtfLtG6i
	 0fDq6HRQsjqL5E9mx7oZLdlMO+WecQdPpXTSir2YEO9ndTJ6M+PbCqc0c3bBZsNIjv
	 Px0vH5Jmafznw==
Message-ID: <sashiko-outbox-171290@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH DNM RFC 16/16] pmdomain: qcom: rpmhpd: Stop forwarding
 MMCX pstate to CX
Reply-To: sashiko-reviews@lists.linux.dev
To: "Konrad Dybcio" <konradybcio@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261014-topic-qc_clk_dvfs-v1-16-3041b788e9f7@oss.qualcomm.com>
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-16-3041b788e9f7@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 12:37:10 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] pmdomain: qcom: missing error cleanup in rpmhpd_probe() corrupts g=
pd_list
- [High] pmdomain: qcom: missing clk-dvfs data causes system hangs
--

commit e0f5d54b21f4fa98424f55031a683613420b6a75
Author: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

pmdomain: qcom: rpmhpd: Stop forwarding MMCX pstate to CX

This commit modifies the MMCX and MMCX_AO power domains to suppress
performance-state propagation to their CX and CX_AO parent domains. The
parent relationship is kept solely for power ordering.

> diff --git a/drivers/pmdomain/qcom/rpmhpd.c b/drivers/pmdomain/qcom/rpmhp=
d.c
> index fa8fed5bd3e58..4d9463b4d5df0 100644
> --- a/drivers/pmdomain/qcom/rpmhpd.c
> +++ b/drivers/pmdomain/qcom/rpmhpd.c
> @@ -154,6 +156,7 @@ static struct rpmhpd mmcx_w_cx_parent =3D {
>  	.pd =3D { .name =3D "mmcx", },
>  	.peer =3D &mmcx_ao_w_cx_parent,
>  	.parent =3D &cx.pd,
> +	.parent_flags =3D GENPD_SUBDOMAIN_NO_PERF_STATE_PROPAGATION,

[Severity: High]
The commit message explicitly warns that this patch must not be merged with=
out
filling out clock DVFS data for all platforms first. It appears platforms
such as SM8550, SM8450, and SM8250 do not yet receive the necessary DVFS da=
ta
updates.

Will this cause the CX power domain to lack required performance state vote=
s,
leading to system hangs and hardware lockups when multimedia blocks operate=
 on
these older platforms?

[ ... ]

> @@ -1223,9 +1227,13 @@ static int rpmhpd_probe(struct platform_device *pd=
ev)
>  	for (i =3D 0; i < num_pds; i++) {
>  		if (!rpmhpds[i])
>  			continue;
> -		if (rpmhpds[i]->parent)
> -			pm_genpd_add_subdomain(rpmhpds[i]->parent,
> -					       &rpmhpds[i]->pd);
> +		if (rpmhpds[i]->parent) {
> +			ret =3D pm_genpd_add_subdomain_with_flags(rpmhpds[i]->parent,
> +							        &rpmhpds[i]->pd,
> +							        rpmhpds[i]->parent_flags);
> +			if (ret)
> +				return ret;

[Severity: High]
Does returning directly here leave statically allocated PM domains globally
registered in the genpd core?

By the time this loop executes, all PM domains have already been initialized
and added to the global gpd_list by pm_genpd_init() in the preceding loop.
Because the PM domain structures are statically allocated file globals,
returning an error without cleanup leaves their gpd_list_node members in the
global gpd_list.

If probe is later retried, for example via deferred probe, pm_genpd_init()
will be invoked again on these same static structures, potentially leading =
to
list corruption.

Would an error path that calls pm_genpd_remove() for initialized domains and
pm_genpd_remove_subdomain() for previously added subdomains be needed here?

> +		}
>  	}
> =20
>  	return of_genpd_add_provider_onecell(pdev->dev.of_node, data);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014-topic-qc_c=
lk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com?part=3D16
