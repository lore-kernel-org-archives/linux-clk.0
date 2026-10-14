Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362224E5320;
	Wed, 14 Oct 2026 12:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791981008; cv=none; b=E0hgVoPQdiFgA1lSUQFu5dUjYhCoTna4XtlWODEMSe3+va+NKtbpKZ36ZHZKj63KdaP+XP6POwSLDWWFFML1f+8nzuUoECsCM8VJhvgRXBQnaDs/GFQieBjnkh5a+YhaOH2z+oh3zXPcx7M+K0wr7X10xdf+xJek7wCNxVJD69M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791981008; c=relaxed/simple;
	bh=f41B/NemOKsKlJi6nDs/7es6CTSVqJZg31S4raNzdCg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=ONyaTgg68i4Mmfhl44wY4eYgLa1TYFg6roKYU0BlxO8fTB4ZvQcMTdRmrQ82Y0tDxqHvOtfTdyXSLxUtDU5hsxJRw0ZkIwcmyzxYt8G3Kv7uG3I6uYRloSLxkfdreShOekTXAsWXBVr53p5NjqLHAuyxJ0jboy/gZJXzW8MI9+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RgAG6W7e; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RgAG6W7e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 837411F00893;
	Wed, 14 Oct 2026 12:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791981006;
	bh=YZlNgnn84+43sl3uzY65FE3EifNNT1UW+CnMPNbFRk4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RgAG6W7e1ZIvvk5DHiF1Y+t9KiUOMx7LKCKMeUiuz9P3UdiaC4M/8I3zwtH3wNp8v
	 Z/3Dvu936BEdwe53D1lpOxYPgzzIJdagy34S4MPFMPzYnstxB7Z6V44jdV39mCHzXw
	 KnxCSaQ1VXwmxSqq7Sp6LUFsXDgKc6t5hc7ij64QSr7jLYHqXEqT8ykQwGTYYLZVCF
	 n5jEzZ7BWSS+wotMp/5Wu3qqyHw4VR8EQuegcV3zWelmDSzEiocIkz3liEk1PncfY4
	 D0IwIQdXoMjpWOBXlmBLQd535RHsdbmBpd+kW8uui1fKZyuW6XZsAp6XPuZblX2j9w
	 L+u47OSrGhBkQ==
Message-ID: <sashiko-outbox-171278@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 11/16] clk: qcom: gdsc: Make GDSC parenting optional
Reply-To: sashiko-reviews@lists.linux.dev
To: "Konrad Dybcio" <konradybcio@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261014-topic-qc_clk_dvfs-v1-11-3041b788e9f7@oss.qualcomm.com>
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-11-3041b788e9f7@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 12:30:06 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] clk: qcom: missing PM domain cleanup on gdsc_register() error path=
s leads to UAF
--

commit c8bac551fa3005340251f161ce7de48e8d323366
Author: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

clk: qcom: gdsc: Make GDSC parenting optional

Allows callers of gdsc_register() to suppress parents inferred from the
controller device and its attached domain list.

> diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
> index b99d70149af34..2d0803e1eb3b1 100644
> --- a/drivers/clk/qcom/gdsc.c
> +++ b/drivers/clk/qcom/gdsc.c
[ ... ]
> @@ -654,13 +655,17 @@ int gdsc_register(struct gdsc_desc *desc,
> =20
>  	/* Add subdomains */
>  	for (i =3D 0; i < num; i++) {
> +		ret =3D 0;
> +
>  		if (!scs[i])
>  			continue;
> +
>  		if (scs[i]->parent)
>  			ret =3D pm_genpd_add_subdomain(scs[i]->parent, &scs[i]->pd);
> -		else if (!IS_ERR_OR_NULL(dev->pm_domain))
> +		else if (!desc->no_external_parent &&
> +			 !IS_ERR_OR_NULL(dev->pm_domain))
>  			ret =3D pm_genpd_add_subdomain(pd_to_genpd(dev->pm_domain), &scs[i]->=
pd);
> -		else if (desc->pd_list)
> +		else if (!desc->no_external_parent && desc->pd_list)
>  			ret =3D gdsc_add_subdomain_list(desc->pd_list, &scs[i]->pd);
> =20
>  		if (ret)

[Severity: High]
Does this error path correctly clean up all initialized PM domains?

If pm_genpd_add_subdomain() fails, the code jumps to err_pm_subdomain_remov=
e:

	if (ret)
		goto err_pm_subdomain_remove;
...
err_pm_subdomain_remove:
	gdsc_pm_subdomain_remove(desc, i);

	return ret;

This correctly rolls back the subdomains, but doesn't seem to call
pm_genpd_remove() for the generic PM domains that were successfully
initialized earlier via gdsc_init() -> pm_genpd_init().

Similarly, earlier in gdsc_register(), if gdsc_init() fails, the function
returns immediately:

	for (i =3D 0; i < num; i++) {
		if (!scs[i])
			continue;
		...
		ret =3D gdsc_init(scs[i]);
		if (ret)
			return ret;
	}

And later, if of_genpd_add_provider_onecell() fails:

	return of_genpd_add_provider_onecell(dev->of_node, data);

Both of these return paths exit without cleaning up previously initialized
domains.

Since these domains are statically added to the global gpd_list but tied
to devm-allocated structures, could failing the probe (e.g., via
EPROBE_DEFER) leave dangling pointers in the core PM domain list and cause
a use-after-free when traversing gpd_list later?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014-topic-qc_c=
lk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com?part=3D11
