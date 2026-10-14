Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513373CB2FA;
	Wed, 14 Oct 2026 12:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791981715; cv=none; b=UQaKQTQxuFE5aMSm6RiTkOT5T7pkC6cYbJOqMO83kSFP41EOOpV7OEXsVOXtFVdbJgxDnTc6aUrWSD3cH9G0LGlcqWBO9dT2xjK4yCwdQcjQElnIeOopPLD0sSB0fwXRNts0PEw6R1DzXBvQgRZJVBq+KsunggDIymcOat+Gors=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791981715; c=relaxed/simple;
	bh=BdJBMnX1PS7oV1xgLQohru600hlIzqVVaF16P2/ABF0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=TULvRkQslQ8NFAyQ2S2zsZyRpBlODGfklL73xfHR+QwBnX3zt5WO6h/TOJK+UrXNRy8VWggJjhKYIOoyMdPuWpVTf+myag17I5jyNl6PeyrkbuwmYfFdXAoRMKccWLi9aZ1gIH2mI9UNb26ogP32EdgbJSuunt2tN4iVh1of4ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DiD+eOvn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DiD+eOvn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8F5E1F000FF;
	Wed, 14 Oct 2026 12:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791981714;
	bh=G1KfmBE3j3a55DXn2hJt2WPX3UgnFnveVoNZmr91efo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DiD+eOvnJN47KRUexQdGXyBXPoig0Do5vXKKCsJNw2J+g3f5ymSAop9kjMpPTcPyO
	 SM/vnhWJf77tfZyt6Q76ntw72ZHHofJknkdDPsWAXKworCHvNiKh67Y4D/peotrpEh
	 rpInYvQ6exPTCygDUPVvFuXMguIXXwSuyd6VsLDixs8W/8MsRYpO6g8c9Ci6VApzUP
	 VdI6QtEvT+AHZt1A7AWig1Q2ojhVlwqQgUx+Adoup4hVL7a+JVv5Hs+4VXSBfh+TmM
	 4MWSKQUnmLesOKB7vKOh6H2NXdUtvD/mz1RbHA8GRKcYSUeIxsCYno+J4v77YUyBnc
	 zr5qnAD3fdgJQ==
Message-ID: <sashiko-outbox-171296@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 05/16] pmdomain: core: Support subdomains without
 pstate propagation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Konrad Dybcio" <konradybcio@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261014-topic-qc_clk_dvfs-v1-5-3041b788e9f7@oss.qualcomm.com>
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-5-3041b788e9f7@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 12:41:53 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] pmdomain: missing initial pstate propagation in genpd_add_subdomai=
n()
--

commit 19c8f09b635c74bbdaf740eac823398c603b6fb4
Author: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

    pmdomain: core: Support subdomains without pstate propagation
   =20
    A subdomain may need its parent to be powered on without requiring its
    performance state to follow the child's. GenPD currently couples these
    requirements, so increasing the child's performance state can also
    raise the parent even when it only needs to remain on.

> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index 76ff0d9a229c3..80ea70930cc63 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c

[ ... ]

> @@ -2298,6 +2307,7 @@ static int genpd_add_subdomain(struct generic_pm_do=
main *genpd,
>  	}
> =20
>  	link->parent =3D genpd;
> +	link->flags =3D flags;
>  	list_add_tail(&link->parent_node, &genpd->parent_links);
>  	link->child =3D subdomain;
>  	list_add_tail(&link->child_node, &subdomain->child_links);
>  	if (genpd_status_on_unlocked(subdomain))
>  		genpd_sd_counter_inc(genpd);

[Severity: High]
When the child domain is linked to the parent in genpd_add_subdomain(), its
power state is synced via genpd_sd_counter_inc(). However, if a consumer
device has already probed and set a performance state on the child domain
before it is linked (meaning it already has an active performance_state > 0=
),
does this code miss evaluating and propagating that initial performance sta=
te
to the parent?

If this initial propagation is omitted, the parent might operate at a lower
performance state than required by its subdomains. Could this lead to hardw=
are
malfunctions or system crashes due to under-voltage or under-clocking?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014-topic-qc_c=
lk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com?part=3D5
