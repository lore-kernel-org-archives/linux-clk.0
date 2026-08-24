Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1463F40DB29;
	Mon, 24 Aug 2026 12:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787574500; cv=none; b=rFJj6u+QRB01Go84V1IZMblAfuSskrM5iLJhYF0bK0zT1QTrAPBqKczWc/owKuqilllAx1ZoF5DtaXuCzY28dczNuJ6fgaWp5U2RnMpu17udkj6e2VuKSoOApqNCO+k32l6yDphfqVCOu70N9JuhYA/4ix20LD1qhUAINfnFTEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787574500; c=relaxed/simple;
	bh=Q2i2MlTic1nK68QgV7+ogNk4cqm+ETmIfhAgmwFln4E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NltFj3s891H7Q7u9qsaakCsLiOBaxIj+AzzgVpM0VNQug916lyDnrjMITr5tNgIKqDFsWaCOu7L0XVvBL6UqtjrtYSxjIQl5UkXmDowqlOuHe4BSdlyAXTYIq6tdA8Y2tCiIna0linXbdjXZPWYAe+19CeDf2t/Ixplm9yjYvJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F7bRhBka; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F7bRhBka"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61B081F000E9;
	Mon, 24 Aug 2026 12:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787574498;
	bh=bkngqxFjM8Q64dr1N21WcT2FZR8lZ1U8veT2Vwtt/RA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F7bRhBka/IYLmoUWBXiUy8V2shPOaWZuMAG4SiEKJgvJpilMsmflSe69bv5dv8SGD
	 jzWfeMXdpJDVOAdVrxzskQ88/h75Hg6/qPTIMht4DqL53C0/eS41JYtnbgrXVFwJGM
	 VLMaQXlbVIdMuiyIyOyIWfGDfRBfsbO3nc8i/MaFoM/U5P7kHAqNn8yacnRrO3hG4a
	 qwS4ZLu2SKAzQbbevVRJrEdeWZTR6zkTaXDjgNCtDjz3fpTchbQO9UP0HP6p5k9zjh
	 rDOZVl3O3+kjVsT92qaNhs5YffGP3bExY6nT27N9QDNGoqjyximJPwIOZy3bRxirph
	 Phutgj63rt4OA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 24/47] clk: qcom: gcc-sm8150: Tie the CX power domain
 to controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260824-qcom-tie-cx-to-gcc-v3-24-f1205a92682b@oss.qualcomm.com>
References: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
 <20260824-qcom-tie-cx-to-gcc-v3-24-f1205a92682b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 12:28:17 +0000
Message-Id: <20260824122818.61B081F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] Enabling runtime PM is ineffective because existing critical clo=
cks permanently hold the runtime PM usage counter.

Pre-existing issues:
- [High] Memory leak and Use-After-Free if `gdsc_register()` fails during p=
robe.
--

--- Patch [24]: [PATCH v3 24/47] clk: qcom: gcc-sm8150: Tie the CX power do=
main to controller ---
commit ff2aa55fcb39d64d3dce326e500a4af7e5279711
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>

clk: qcom: gcc-sm8150: Tie the CX power domain to controller

This commit enables runtime PM for the controller, allowing CX to be powered
down once all GCC consumers have released their clocks and GDSCs.

> diff --git a/drivers/clk/qcom/gcc-sm8150.c b/drivers/clk/qcom/gcc-sm8150.c
> index a93d1f412a7b6..1404996d33c31 100644
> --- a/drivers/clk/qcom/gcc-sm8150.c
> +++ b/drivers/clk/qcom/gcc-sm8150.c
> @@ -3771,6 +3771,7 @@ static const struct qcom_cc_desc gcc_sm8150_desc =
=3D {
>  	.num_resets =3D ARRAY_SIZE(gcc_sm8150_resets),
>  	.gdscs =3D gcc_sm8150_gdscs,
>  	.num_gdscs =3D ARRAY_SIZE(gcc_sm8150_gdscs),
> +	.use_rpm =3D true,

[Severity: Medium]
Does this actually allow the device to suspend?

The GCC driver registers multiple clocks with the CLK_IS_CRITICAL flag,
such as gcc_disp_ahb_clk. During registration, the clock core automatically
calls clk_core_prepare() on these clocks, which in turn calls
clk_pm_runtime_get() and increments the provider device's runtime PM usage
counter.=20

Since these clocks are never unprepared, won't the usage counter never
drop to zero, preventing the device from entering RPM_SUSPENDED and keeping
the CX power domain permanently active?

[Severity: High]
This isn't a bug introduced by this patch, but is there a memory leak and
use-after-free risk if driver probe fails in gdsc_register()?

In drivers/clk/qcom/gdsc.c:gdsc_register(), gdsc_init() links the domain
into the global gpd_list via pm_genpd_init().

If a subsequent iteration fails:

drivers/clk/qcom/gdsc.c:gdsc_register() {
    ...
		ret =3D gdsc_init(scs[i]);
		if (ret)
			return ret;
    ...
}

Or if subdomain addition or provider registration fails:

drivers/clk/qcom/gdsc.c:gdsc_register() {
    ...
err_pm_subdomain_remove:
	gdsc_pm_subdomain_remove(desc, i);

	return ret;
}

The function returns without unregistering the GDSCs initialized in previous
iterations (pm_genpd_remove() is not called). Because the cleanup action is
only added on success via devm_add_action_or_reset(), do the successfully
initialized GDSCs remain in the global gpd_list?

If the module is later unloaded, could this leave dangling pointers in the
global list and cause a kernel panic upon the next traversal?

>  };
> =20
>  static const struct of_device_id gcc_sm8150_match_table[] =3D {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824-qcom-tie-c=
x-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com?part=3D24
