Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2283A41A547
	for <linux-clk@vger.kernel.org>; Mon, 31 Aug 2026 14:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788185744; cv=none; b=nRwdGmoyql9ZKGtIZ2xXDQqD7jAufzYExbMi7+Inf1M0VncZ3MDnoxFTpzN4AauUx3h6sP5wYbho6EiYco/x1QdGsUy+BaIldCfPJ5b36NANiHjsKH8pG9TifEz55KLf8q0YslxLRH0BRgPwFQYnTxn1nadqtiBPdpd0Cqp/tu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788185744; c=relaxed/simple;
	bh=7xKFEB5gYQ33FF9CkgFDq6khTHiBJEU2afRDzZRxFV8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CcHOE0cMA5pWPzN7MvGQGPh2XZvoIc7FnNvxFRBn9OjdLugCIdacf3ayJvPRFMPm5gVZSfln+Qw+jmk7kWrINaETD46STjsi396zzMSxK7N91iCs9ertJ7AP1ed5k8btl3VxWLFf6auaFydXdeZnKXDZorJVGi2FVBsfMaEdQNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hAOVCogM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hAOVCogM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 923BD1F000E9;
	Mon, 31 Aug 2026 14:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788185742;
	bh=sXJdN091Sm54Dyp58mkauYufJcZ3KTqR27YMaI69W8k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hAOVCogMsWeSHR+EJvpa9nXyA2sZCMwVIiAviUkKvTh2a2d8MSAcwMXCNXZ6tNLt3
	 vUuZbVwEdT36sH3XUPQ2D5N2tUKWPmylGuwjcbdZt9naL/jSJfHRBMPugm9FgN0lDU
	 AWfXq68faW3kK4lD2aHp8KCGhWbTwTiNq1H+sfPpS/bE8Mvt6rrWrZxseJ1RfMpE0b
	 lkG2r20pAetKEm2Bgf0yXnVzN0T4VJtZjdy4oIVAiAJQhey2XMqyJiru5pdFGc7/CI
	 iER/GhMisPflBMFxXWXJir0IFft7W6ZFHR5dTi5a5P42OAuGA+LBY4YN5O8rNjLbad
	 qCgFELvVaYduQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH AUTOSEL 6.18] clk: qcom: clk-rpmh: Make all VRMs
 optional
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Levin" <sashal@kernel.org>
Cc: linux-clk@vger.kernel.org
In-Reply-To: <20260831133314.4125787-81-sashal@kernel.org>
References: <20260831133314.4125787-1-sashal@kernel.org>
 <20260831133314.4125787-81-sashal@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 14:15:42 +0000
Message-Id: <20260831141542.923BD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The clk-rpmh driver permanently mutates static global clock struct=
ures during probe, leading to severe resource address corruption on probe d=
eferral or unbind/rebind.
--

commit db440aeaf96923e7980cc52bc879e1c6dfac5bf7
Author: Alexander Koskovich <akoskovich@pm.me>

clk: qcom: clk-rpmh: Make all VRMs optional

This commit marks all VRM clocks as optional to prevent probe failures on
boards where not all VRMs are present. It resolves issues on devices with
different PMIC configurations by checking the VRM offset directly.

Link: https://lore.kernel.org/r/20260414-clk-rpmh-vrm-opt-v3-1-8ca21469ffbc=
@pm.me

> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> index 63c38cb47bc45..82f18e15cd77b 100644
> --- a/drivers/clk/qcom/clk-rpmh.c
> +++ b/drivers/clk/qcom/clk-rpmh.c

[ ... ]

> @@ -943,8 +938,7 @@ static int clk_rpmh_probe(struct platform_device *pde=
v)
>  		if (!res_addr) {
>  			hw_clks[i] =3D NULL;
> =20
[Severity: High]
This is a pre-existing issue, but does this code permanently mutate static
global structures during probe?

Looking at clk_rpmh_probe(), it uses statically allocated arrays like
sm8550_rpmh_clocks and static structures. When the assignment above is
executed, it permanently clears missing clocks from the shared array.

Additionally, further down in this same function, the dynamic cmd-db address
is added to the static structure's initial offset:

    rpmh_clk->res_addr +=3D res_addr;

If the driver is unbound and rebound via sysfs, or if probe defers, the
structure retains these mutated states. The probe path will erroneously add
the cmd-db address a second time for existing clocks, and missing clocks
will remain permanently NULL.

Could this lead to severe resource address corruption when issuing RPMh
commands to these accumulated addresses? Could a privileged user trigger
a sysfs unbind/bind cycle to corrupt the state and break SoC clock
management?

> -			if (desc->clka_optional &&
> -			    !strncmp(rpmh_clk->res_name, "clka", sizeof("clka") - 1))
> +			if (rpmh_clk->res_addr =3D=3D CLK_RPMH_VRM_EN_OFFSET)
>  				continue;
> =20
>  			dev_err(&pdev->dev, "missing RPMh resource address for %s\n",

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831133314.4125=
787-81-sashal@kernel.org?part=3D1
