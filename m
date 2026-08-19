Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ADDE3403E0;
	Wed, 19 Aug 2026 13:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787145356; cv=none; b=rmevdMwgqYTkweyiZXasP9tm42c1a8UyhUMKI7wI7WvkEltHCmZ5lS+UwEIcRcPzBDq59FyfylI/kLJnUbwmMDhYjJfWAHzJdrqaozQ7kr4OYumeQyRLh8uNdWJqFy40mb0IPFaSMpbmfo7g+sfCNL9yaZ7KrXtAmzTg+NLTG/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787145356; c=relaxed/simple;
	bh=aZxFZqPMHCG7G8Bfv3qTYXK4+Yx+iIZdmOswCDS9sAQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FXmizUwrI/p4mHoLBGdRN2UsMuShO3XntsAinrCDuvOH+SgGBqth97SVFvcuZeQXspOm/qbynLJ7kBEs4ubXYFRw7EBuFGFr5ZdT4m7jTC9Oce5WAT46tqcGjkDX/4ifuwdKVhR74d0yB92Ozc4txcL83i7yZVcK863OvHZhstE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ODMAik+4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ODMAik+4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 346841F00A3A;
	Wed, 19 Aug 2026 13:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787145352;
	bh=UBrFJNXNXEZ1rnpl+RINyxZBnJHvzYoAUJRTIWhXE2Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ODMAik+41PvilmIpNOsCFCg4D8DY+0OL+5NE+64uwpMtYYQWmjJtxG4X8e046dWKl
	 b5RPHZEBC6OYGyo6IoSrRak/eIXt/GoTVZIKIhb8exa1Aed22q0PKYdAAZmxRjp4wC
	 1meB87CtnJxRmwqJYO6kL/bnOQU/WLrD+IPsz+yTz7NffSuPCBvL5jcPcSy+rgo91l
	 MTM6zK3rheJmTHYohhN6ZDIEldHMeM1/5uOr2y5h6jqQz23EHZj9CPYuHxBBz2viM4
	 q0MugmZCZgPqRIQmzGNS8jt+SCR/7wiz4cJ5eptJK8jDNu1O0af+417/a1px82b+FT
	 +as9RneUZc/XQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 03/16] clk: qcom: gcc-sm8450: Tie the CX power domain to
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org
In-Reply-To: <20260819-qcom-tie-cx-to-gcc-v1-3-840034124e73@oss.qualcomm.com>
References: <20260819-qcom-tie-cx-to-gcc-v1-0-840034124e73@oss.qualcomm.com>
 <20260819-qcom-tie-cx-to-gcc-v1-3-840034124e73@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 13:15:51 +0000
Message-Id: <20260819131552.346841F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unbinding the driver causes a devres ordering issue that leads to =
a lockless linked list Use-After-Free and permanent power leak.
--

--- Patch [3]: [PATCH 03/16] clk: qcom: gcc-sm8450: Tie the CX power domain=
 to controller ---
commit fce258c6d28a3b8028f9c7e9bc3065854572f262
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>

clk: qcom: gcc-sm8450: Tie the CX power domain to controller

Enable runtime PM for the controller so the common GCC probe path resumes
the attached domain while registering clocks, resets and GDSCs. This lets
GDSC consumers propagate their votes through the GCC provider to the CX
parent domain.

> diff --git a/drivers/clk/qcom/gcc-sm8450.c b/drivers/clk/qcom/gcc-sm8450.c
> index b18bb34889ab2..b3ab458048dc8 100644
> --- a/drivers/clk/qcom/gcc-sm8450.c
> +++ b/drivers/clk/qcom/gcc-sm8450.c
> @@ -3399,6 +3399,7 @@ static const struct qcom_cc_desc gcc_sm8450_desc =
=3D {
>  	.resets =3D gcc_sm8450_resets,
>  	.num_resets =3D ARRAY_SIZE(gcc_sm8450_resets),
>  	.gdscs =3D gcc_sm8450_gdscs,
> +	.use_rpm =3D true,

[Severity: High]
This is a pre-existing issue, but will setting use_rpm expose a Use-After-F=
ree
and power leak during driver unbind?

When the driver unbinds, devres cleanup runs qcom_cc_gdsc_unregister(), whi=
ch
calls gdsc_pm_subdomain_remove(). However, at this point platform_remove() =
has
already detached the PM domain, making dev->pm_domain NULL.

This causes gdsc_pm_subdomain_remove() in drivers/clk/qcom/gdsc.c to skip t=
he
safe detachment:

	else if (!IS_ERR_OR_NULL(dev->pm_domain))
		pm_genpd_remove_subdomain(pd_to_genpd(dev->pm_domain), &scs[i]->pd);

As a result, an unsafe fallback execution path is taken in
drivers/pmdomain/core.c:genpd_remove():

	list_for_each_entry_safe(link, l, &genpd->child_links, child_node) {
		list_del(&link->parent_node);
		list_del(&link->child_node);
		kfree(link);
	}

This modifies the parent's parent_links list without acquiring the parent's
lock, which could lead to a lockless linked list Use-After-Free. It also
fails to decrement sd_count, which keeps the CX domain powered on forever.

Since devm_add_action_or_reset() in
drivers/clk/qcom/common.c:qcom_cc_really_probe() schedules this cleanup to
happen after dev->pm_domain is cleared, is there a way to address this devr=
es
ordering issue before enabling use_rpm?

>  	.num_gdscs =3D ARRAY_SIZE(gcc_sm8450_gdscs),
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260819-qcom-tie-c=
x-to-gcc-v1-0-840034124e73@oss.qualcomm.com?part=3D3
