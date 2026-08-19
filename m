Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A7831E833;
	Wed, 19 Aug 2026 13:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787145127; cv=none; b=SmFfCjsbDpZr5pRc+uSE3OFD6U2ctIaNwoszpoSwhav/RoTkhLG5mDwfbiT/b8lYUmO0l8uZV0bwO8AfgSAD3DjWA3z6jihbSWTaEq/UE2YahwdWNchv/029hxjZobx5kJ5cHQgi3ko0JFdQfXOG1jPF+gyY3viWYUeu9TE5cqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787145127; c=relaxed/simple;
	bh=ua5JO1C6gYq1oucyJAgE3OV3CpA/yemIGIquHOd+FRI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Sv/lk4kEHUqSEVvAqO5WEHxEMeGQgkoREMEF63cfwHH8BcjUQ6AGNOUaY5lGBr1hULCwwIu0ivZpYbYGlJP26dagoo9iHn7rdUsGsKmFMm0Hhwj5Tf+dEjwl4JADfMM0YN43FElIvmPDfs8XY2HpLMLCEXdfN1gp87lBUQPDB2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CjkIr2ZU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CjkIr2ZU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCE521F00A3D;
	Wed, 19 Aug 2026 13:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787145126;
	bh=J0oQUSPZx6LGG6fWFG23s0TEJJSWQvZhAl1exFDEXyc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CjkIr2ZUGrCW0fwHO4PhRvI3TRME0DsPysUcBzEbHofD2V86fcgaSzrWtj4yyDkF7
	 HtRxZ13gNEr3u3+2PhNKlyVGSkfRDqCNxE0kI/8u+cYbxmqKRW3c9j3biWXABxr02a
	 GOwJfVqAkvbw2qXWMmkSrypPbsTNq+boxDBlrSTZYcEiz4EsWu0crzG+nxbv7yrjls
	 gewIliru1A25eO9efIx+F21lJTSkbQ8GXZjIGEeUuL6BWrDUWeQ6ShLYc7pCExSXo6
	 b3LJl/2eAar18kwKzKTsimVMqGuqm2j/I0+DUIu+9ipaeZdn3iAldiUe+WK8ONwbsf
	 VX1MoZ4pDr9Og==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 02/16] clk: qcom: gcc-sm8350: Tie the CX power domain to
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260819-qcom-tie-cx-to-gcc-v1-2-840034124e73@oss.qualcomm.com>
References: <20260819-qcom-tie-cx-to-gcc-v1-0-840034124e73@oss.qualcomm.com>
 <20260819-qcom-tie-cx-to-gcc-v1-2-840034124e73@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 13:12:05 +0000
Message-Id: <20260819131205.BCE521F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Resource leak and Use-After-Free (UAF) in generic power domain reg=
istration error paths.
--

--- Patch [2]: [PATCH 02/16] clk: qcom: gcc-sm8350: Tie the CX power domain=
 to controller ---
commit 2f90d172dae6e2aec9b20b94ed643f0031c58164
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>

clk: qcom: gcc-sm8350: Tie the CX power domain to controller

Enable runtime PM for the controller so the common GCC probe path resumes
the attached domain while registering clocks, resets and GDSCs.

> diff --git a/drivers/clk/qcom/gcc-sm8350.c b/drivers/clk/qcom/gcc-sm8350.c
> index 2d94f3046b711..996ee8592fabe 100644
> --- a/drivers/clk/qcom/gcc-sm8350.c
> +++ b/drivers/clk/qcom/gcc-sm8350.c
> @@ -3786,6 +3786,7 @@ static const struct qcom_cc_desc gcc_sm8350_desc =
=3D {
>  	.resets =3D gcc_sm8350_resets,
>  	.num_resets =3D ARRAY_SIZE(gcc_sm8350_resets),
>  	.gdscs =3D gcc_sm8350_gdscs,
> +	.use_rpm =3D true,

[Severity: High]
This is a pre-existing issue, but since this patch relies on the GDSC
infrastructure, is there a risk of a use-after-free during error handling
in the core GDSC registration?

Looking at gdsc_register() in drivers/clk/qcom/gdsc.c, if a failure occurs
during gdsc_init(), the function returns directly:

drivers/clk/qcom/gdsc.c:gdsc_register() {
    ...
        ret =3D gdsc_init(scs[i]);
        if (ret)
            return ret;
    ...
}

Similarly, if of_genpd_add_provider_onecell() fails, it returns without
unregistering the initialized domains:

drivers/clk/qcom/gdsc.c:gdsc_register() {
    ...
    return of_genpd_add_provider_onecell(dev->of_node, data);

err_pm_subdomain_remove:
    gdsc_pm_subdomain_remove(desc, i);

    return ret;
}

Because pm_genpd_remove() is not called on these error paths, the domains
remain linked in the global gpd_list.

When the probe fails, devres will clean up managed resources like regmap.
Later, when the genpd framework invokes pd->power_off() (such as via
genpd_power_off_unused() at late_initcall), it calls gdsc_disable() which
could dereference these freed devres-managed pointers.

Should gdsc_register() be updated to unregister the power domains on these
error paths to prevent dangling pointers?

>  	.num_gdscs =3D ARRAY_SIZE(gcc_sm8350_gdscs),
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260819-qcom-tie-c=
x-to-gcc-v1-0-840034124e73@oss.qualcomm.com?part=3D2
