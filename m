Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FCDE312834;
	Thu, 20 Aug 2026 10:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787221663; cv=none; b=DVJfbbKC9kmk5lzkV2fI4bWbOASMCl36MkW0M8/H8IVuhUrEg4ydgDYuzgSYCc3Z1pfr09ogCyPMxGb0gfh5479thkRiZqZA7On48R3GO+WTP0fJPBBSP/1ybhRIdH4VOV8w6TstaDX+BNoMcH1mGHeMB9GDausdXWwjw/tc6mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787221663; c=relaxed/simple;
	bh=K0Hl9afEkpLhuSLnGiyLlrfPuR5WMNu9Pwnq6HDdOm0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=q1CAUIYaCs/srrnfUrq2F5x/85c1zvtc9sLjxv+K/FUi7yMW6dRz3TPRYWQGz7pvJt6SiDqOV3R5CdKUKnbx84y+Zl/IYSBlmOtfTHb7+tz0V00kmEt51tZRfdQvcYMlsPdvKdIYqzB7m8eKqWoMKY7whVnRoQleVJi80w3fVIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XHYuSLiH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XHYuSLiH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B5C11F000E9;
	Thu, 20 Aug 2026 10:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787221654;
	bh=bitKk17cTEJp3+QgAGJIQTUQcQDo3RNsKomdTU/Q03Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XHYuSLiHEqAyedl9K0cVKQGYVIS0xyIX1lvGR8mzRTUlkq+QC/OI5mWmVQTK5f9ba
	 EHNuceAfB34SCKNkv8hyrwO9OKMvCnU9NVUJUA84F62N2SLyuYVI0GjixbGi8ZbMwI
	 9pC/Y7kB952oA16HRzoE+2CWVAgelaZv5CmUXReqYem0kOkxByYT2P64QRJ8AT2zlF
	 jrvtcs8qLXuFkozVH9RIT0uAR/SfOSCR/dwlrFTGqFPl8qhBwpFC6QYiKOalTRMiyO
	 fMlA7P9QwOkLF3CXCGd+ZLE0KAzIqzv/XGhE4yqnmcqYicehIq7okGFs3qIMboacAb
	 xa0OQ+ynXtoDg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 08/16] clk: qcom: gcc-qcs615: Tie the CX power domain
 to controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260820-qcom-tie-cx-to-gcc-v2-8-e67ea30d8b7b@oss.qualcomm.com>
References: <20260820-qcom-tie-cx-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com>
 <20260820-qcom-tie-cx-to-gcc-v2-8-e67ea30d8b7b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 10:27:34 +0000
Message-Id: <20260820102734.8B5C11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Unclocked register access during reset assertion because qcom_rese=
t_ops do not wake the device from RPM suspend.
--

--- Patch [8]: [PATCH v2 08/16] clk: qcom: gcc-qcs615: Tie the CX power dom=
ain to controller ---
commit c06f319be5cd4791e28ad1c311d665bbd4af3230
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>

clk: qcom: gcc-qcs615: Tie the CX power domain to controller
   =20
Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

> diff --git a/drivers/clk/qcom/gcc-qcs615.c b/drivers/clk/qcom/gcc-qcs615.c
> index 57f8c80c6f324..601c81c844505 100644
> --- a/drivers/clk/qcom/gcc-qcs615.c
> +++ b/drivers/clk/qcom/gcc-qcs615.c
> @@ -2967,6 +2967,7 @@ static const struct qcom_cc_desc gcc_qcs615_desc =
=3D {
>  	.resets =3D gcc_qcs615_resets,
>  	.num_resets =3D ARRAY_SIZE(gcc_qcs615_resets),
>  	.gdscs =3D gcc_qcs615_gdscs,
> +	.use_rpm =3D true,

[Severity: High]
Will enabling runtime PM here cause unclocked register accesses during rese=
t=20
assertions?

When use_rpm is set to true, the GCC controller can be runtime suspended. I=
f a=20
consumer device driver calls reset_control_assert() before enabling its clo=
cks,=20
the underlying reset callback executes a register write without first wakin=
g up=20
the GCC device.

Looking at the qcom reset operations:

drivers/clk/qcom/reset.c:qcom_reset_set_assert() {
    ...
    regmap_update_bits(rst->regmap, map->reg, mask, assert ? mask : 0);

    /* Read back the register to ensure write completion, ignore the value =
*/
    regmap_read(rst->regmap, map->reg, &mask);
    ...
}

Since there is no pm_runtime_resume_and_get() or similar mechanism to wake =
the=20
controller before the regmap_update_bits() call, will this write to a power=
ed-off=20
MMIO space and trigger a synchronous external abort?

>  	.num_gdscs =3D ARRAY_SIZE(gcc_qcs615_gdscs),
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820-qcom-tie-c=
x-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com?part=3D8
