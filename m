Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7FD412276;
	Mon, 24 Aug 2026 12:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787573957; cv=none; b=ml/dABwvbuSkJQW/NYqj1toj3rbZejerQgVx4AiPektf16MCGm4Vv9fceoFBr13RPJZwbJ8IqyaQBzbVC1iurhxAjimGDpSBM1ByTW38+S+0K0qz1kEX0eRapN6Gou23AKMv1T5c80uUMGxKAKgOVC7Cu0sOoqNlDFvbHkkC9hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787573957; c=relaxed/simple;
	bh=ZXjmB9NrVghqV8R+lcEthXlP99YjP4L1lGePbVKzf7A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GpfzZAJPBUqcqWAWVD1NQvANNzNFwA70vsDtIVSurouvkfS7KNrFiSCpcws5+bN/YavynlpZt6zysdwC8PZkOz5Zg10gbwB4S0+cl7OKraKsTxEysGcg/+7qT6Jm+NLIUZfiOS7hDGgB6HpFeC2SJymogihLJnpZH/CT5vDZ7qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O7jExXe2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O7jExXe2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 811D21F00A3A;
	Mon, 24 Aug 2026 12:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787573955;
	bh=EBoWStSzbytuTWZKFmo4k62okrk2cB3UE3wLpCN7IJs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O7jExXe2CTuuFsRc0R0ApBm0WYNprDnSAECne2HpUXamU4j/Jy7midVDb8Pxb8tCk
	 aActWLMfZvXzqIPQeT+y+IvEtcGtKS1oA5UiglwQ2+7mmgi4q6DbQ86jlC6la6lcqi
	 n2Huqrr8OHRY3Egd6n38g0ESHo2eLdbDIcuQX5mEdvs28NYywvt2Vybx6wbwN+ighB
	 GRk0QFd5gJ+Swoi1v/XVTW2CWwv+Knw/JAdIjOvphmdJhZXe3lKBMzFXlTUh8e6k6p
	 xzEJER/YPdJRca56wdaxExUbHIGrJaO070RtrcaA30ODhZpdHLpr7CgqtNFo/+bBjW
	 02R7V1SsgwmSA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 19/47] clk: qcom: gcc-sdm670: Tie the CX power domain
 to controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org
In-Reply-To: <20260824-qcom-tie-cx-to-gcc-v3-19-f1205a92682b@oss.qualcomm.com>
References: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
 <20260824-qcom-tie-cx-to-gcc-v3-19-f1205a92682b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 12:19:15 +0000
Message-Id: <20260824121915.811D21F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] The patch adds `.use_rpm =3D true` to allow the CX power domain to=
 power down when idle, but `CLK_IS_CRITICAL` clocks permanently prevent the=
 device from suspending, entirely defeating the patch's goal.
- [High] Enabling runtime PM introduces a permanent PM runtime usage count =
leak on probe deferral.

Pre-existing issues:
- [High] Missing `sync_state` callback causes GDSCs initialized as active b=
y the bootloader to stay powered on indefinitely, defeating the patch's pur=
pose of powering down CX.
- [High] If `gdsc_init()` or `pm_genpd_add_subdomain()` fails in `gdsc_regi=
ster()`, previously initialized generic PM domains are not removed, leading=
 to a Use-After-Free.
--

--- Patch [19]: [PATCH v3 19/47] clk: qcom: gcc-sdm670: Tie the CX power do=
main to controller ---
commit b55a4bcc407393a5d2f7c186b77a4841507253c0
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>

clk: qcom: gcc-sdm670: Tie the CX power domain to controller

This commit sets use_rpm to true in the gcc_sdm670_desc configuration to
enable runtime PM for the controller. The goal is to allow the CX power
domain to be powered down when all consumers have released their clocks and
GDSCs.

> diff --git a/drivers/clk/qcom/gcc-sdm845.c b/drivers/clk/qcom/gcc-sdm845.c
> index 6d0f9cede5cfe..57d54b45fa527 100644
> --- a/drivers/clk/qcom/gcc-sdm845.c
> +++ b/drivers/clk/qcom/gcc-sdm845.c
> @@ -3948,6 +3948,7 @@ static const struct qcom_cc_desc gcc_sdm670_desc =
=3D {
>  	.num_resets =3D ARRAY_SIZE(gcc_sdm845_resets),
>  	.gdscs =3D gcc_sdm670_gdscs,
>  	.num_gdscs =3D ARRAY_SIZE(gcc_sdm670_gdscs),
> +	.use_rpm =3D true,

[Severity: High]
Does setting use_rpm to true actually allow the device to suspend?

When use_rpm is true, clk_core_prepare() takes a PM runtime vote on the GCC
device. However, critical clocks are permanently prepared at registration:

drivers/clk/qcom/gcc-sdm845.c:gcc_camera_ahb_clk {
	...
	.flags =3D CLK_IS_CRITICAL,
}

Since critical clocks are never unprepared, the runtime PM vote is never
dropped, which appears to keep the CX power domain permanently active. Does
this prevent the patch from achieving its power-savings objective?


[Severity: High]
Will enabling runtime PM here introduce a usage count leak on probe deferra=
l?

Critical clocks take a PM runtime reference during registration. If probe
defers later (for example in qcom_cc_icc_register()), the clocks are
unregistered via clk_unregister().

However, clk_unregister() doesn't unprepare critical clocks or drop the PM
runtime reference:

drivers/clk/clk.c:clk_unregister() {
	if (clk->core->prepare_count)
		pr_warn("%s: unregistering prepared clock: %s\n",
				__func__, clk->core->name);
	...
}

Does this lead to permanently unbalanced usage counts every time probe defe=
rs?

>  };
> =20
>  static const struct qcom_cc_desc gcc_sdm845_desc =3D {

[Severity: High]
This isn't a bug introduced by this patch, but does the lack of a sync_state
callback in gcc_sdm845_driver prevent the CX power domain from powering dow=
n?

When GDSCs are initialized as active by the bootloader, pm_genpd_init() is
called with is_off=3Dfalse, and the genpd framework sets stay_on=3Dtrue. Th=
is
flag is only cleared when the device driver's sync_state callback fires.

Since gcc_sdm845_driver lacks a sync_state callback (like
of_genpd_sync_state), the stay_on flag is never cleared:

drivers/clk/qcom/gcc-sdm845.c:gcc_sdm845_driver {
	.probe		=3D gcc_sdm845_probe,
	.driver		=3D {
		.name	=3D "gcc-sdm845",
		.of_match_table =3D gcc_sdm845_match_table,
	},
}

Could this cause active GDSCs to stay powered on indefinitely?


[Severity: High]
This is a pre-existing issue, but can the error path in gdsc_register() lead
to a use-after-free?

If gdsc_init() or pm_genpd_add_subdomain() fails during the loop in
gdsc_register(), it exits immediately and only cleans up subdomains:

drivers/clk/qcom/gdsc.c:gdsc_register() {
	...
		ret =3D gdsc_init(scs[i]);
		if (ret)
			return ret;
	...
err_pm_subdomain_remove:
	gdsc_pm_subdomain_remove(desc, i);

	return ret;
}

The error path fails to call pm_genpd_remove() for the previously
initialized generic PM domains, leaving them in the global gpd_list. If the
module is later unloaded, the statically allocated GDSC structures are
freed, which might cause a kernel panic on the next gpd_list traversal.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824-qcom-tie-c=
x-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com?part=3D19
