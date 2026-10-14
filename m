Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E3449B215;
	Wed, 14 Oct 2026 12:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791981175; cv=none; b=J3AiumIPg+yHoZ/jyE5HESNHV1cY6QnPzYOZGmjGd/BSm0C+CWYiLmAJO3RYibpONtE5yFXtsyToZQIUfZYfdeUZEbi8gGedw4PQWp9Yh5eRgHnv6rwsgE8Axeseraw7oZD/hSUPguglBA99bqHT8hsekPcQSXizL7o0DPRAats=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791981175; c=relaxed/simple;
	bh=ISBNZZjiNTWr/CT9ccLOlzX81bbqY6ihRWX5qwX3qW4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=k9Zt62VIceZ9865IIrlfua/NrQaAyPCXVj3eqebZ8MVMj3I1PyClrS1pz7QuL6s0OnlFKdSX7lvIOKyfsCInlSK25IeeWz+iEKIE62ozzH4O0eyRn/TQsjcXjjqMSviOGRRISNFSHBCtj21SoFK9GNi7CO8mCFuLJj2hIco1Vrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aou5uSbF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aou5uSbF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FC261F000FF;
	Wed, 14 Oct 2026 12:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791981174;
	bh=/1ewICq/0iNkNN2SDGelYtgQLG8hstST+MXzyv2iBO4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aou5uSbFs5X67NTYTkLG2G7Hs9NP6JzbtJr35DZ13Ti9A+PplCvEtKSRrYxHm6c4r
	 7chAbRamGXNK6QMiRFqknqWaR2StZJqyVOvVuLMVG7KVLl3EUgW7h36W1no9Be+gbk
	 qFbMuxlHizQoZ92yeWOD2rFtpAES0962CPAfYVkNzyywCTaIINncKL03Jdc1jniRS1
	 xQ/A+DWb7+d9oxeKgx7pALvOb8Omi+TZDE6JX+Fl/BEEDqrmcNB1Hjrn65PnRA/gLO
	 kDM4bJzwyW8zj53VYL513rEl77Sfx/JVbTwV/zg2gdvg1vrU/wOx5EhCQ2RW03iiBq
	 MAuhiTQ25Vdwg==
Message-ID: <sashiko-outbox-171282@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 12/16] clk: qcom: gdsc: Link required power domains
Reply-To: sashiko-reviews@lists.linux.dev
To: "Konrad Dybcio" <konradybcio@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261014-topic-qc_clk_dvfs-v1-12-3041b788e9f7@oss.qualcomm.com>
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-12-3041b788e9f7@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 12:32:53 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] clk: qcom: gdsc: Unbalanced hardware state on GenPD unlink leaves =
GDSCs powered without required rails
- [Low] clk: qcom: gdsc: Redundant wait_for_off logic for non-votable domai=
ns
--

commit a3b8e242fc8ba2eae7b378662d9af778b3739733
Author: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

clk: qcom: gdsc: Link required power domains

This commit models enable-only requirements for GDSCs as GenPD subdomain
links without propagating the GDSC performance state to the rail. It allows
GDSCs to specify only the power-domain endpoints they require while powered.

> diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
> index 2d0803e1eb3b1..73054c600c29a 100644
> --- a/drivers/clk/qcom/gdsc.c
> +++ b/drivers/clk/qcom/gdsc.c
[ ... ]
> @@ -379,7 +384,10 @@ static int gdsc_disable(struct generic_pm_domain *do=
main)
>  	if (sc->pwrsts =3D=3D PWRSTS_RET_ON)
>  		return 0;
> =20
> -	ret =3D gdsc_toggle_logic(sc, GDSC_OFF, domain->synced_poweroff);
> +	if (sc->num_required_pds && !(sc->flags & VOTABLE))
> +		wait_for_off =3D true;
> +
> +	ret =3D gdsc_toggle_logic(sc, GDSC_OFF, wait_for_off);

[Severity: Low]
This isn't a bug, but is setting wait_for_off here redundant for non-votable
domains?

Looking at gdsc_toggle_logic(), the wait parameter appears to only affect
the execution path when sc->flags & VOTABLE is true:

static int gdsc_toggle_logic(...) {
    ...
    /* If disabling votable gdscs, don't poll on status */
    if ((sc->flags & VOTABLE) && status =3D=3D GDSC_OFF && !wait) {
        udelay(TIMEOUT_US);
        return 0;
    }
    ...
    ret =3D gdsc_poll_status(sc, status);
}

Since gdsc_toggle_logic() falls through to gdsc_poll_status() for all
non-votable domains regardless of the wait parameter, does overriding it
here have any effect?

[ ... ]
> @@ -669,13 +779,25 @@ int gdsc_register(struct gdsc_desc *desc,
>  			ret =3D gdsc_add_subdomain_list(desc->pd_list, &scs[i]->pd);
> =20
>  		if (ret)
> -			goto err_pm_subdomain_remove;
> +			goto err_remove_parents;
>  	}
> =20
> -	return of_genpd_add_provider_onecell(dev->of_node, data);
> +	ret =3D of_genpd_add_provider_onecell(dev->of_node, data);
> +	if (!ret)
> +		return 0;
> =20
> -err_pm_subdomain_remove:
> +err_remove_parents:
>  	gdsc_pm_subdomain_remove(desc, i);
> +err_remove_domains:
> +	while (linked--) {
> +		if (scs[linked])
> +			gdsc_remove_required_subdomains(desc, scs[linked],
> +							scs[linked]->num_required_pds);
> +	}
> +	while (initialized--) {
> +		if (scs[initialized])
> +			pm_genpd_remove(&scs[initialized]->pd);
> +	}

[Severity: High]
Does this error path leave initialized GDSCs physically powered ON while
their required supply rails are powered OFF?

During initialization, gdsc_get_rail_voters() powers ON the required rails
via pm_runtime_resume_and_get(). Then gdsc_init() turns ON the GDSC
hardware, and gdsc_add_required_subdomains() links the rails as parents,
transferring the power vote to GenPD. Finally, gdsc_put_rail_voters()
drops the explicit pm_runtime vote.

If we take this err_remove_domains path, gdsc_remove_required_subdomains()
removes the GenPD links. This drops the GenPD power vote, causing the
required rails to physically power OFF.

However, the loop then calls pm_genpd_remove() without physically powering
OFF the GDSCs. Will this violate hardware power sequencing constraints by
leaving the GDSCs powered ON without their required rails?

> =20
>  	return ret;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014-topic-qc_c=
lk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com?part=3D12
