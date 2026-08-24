Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB91331203;
	Mon, 24 Aug 2026 12:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787574509; cv=none; b=Nk0iy6Y1HJl4DwfQ8NuO3w/77V3DlsBydOnFyXS/6OQ2v75II7AuIn97bvlrRetQIzW2ZxMWUds18Hci5+vFqjVOeEKs3x0Y5uL+TfneDZBvTMbEd4GaIwLoLWNtqF3WUnjuX1RZ8xTtDPWoQfmHQo2Gxm99EWLlnZwnznZQWb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787574509; c=relaxed/simple;
	bh=90H40shihnZ6mNt3V5xKjawRv0GqhC8ZtS3kwN5IDoc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=D19NWSVd3EadQ7vBIJ19tt7hSwWTZfrAnf5EC3ZwGvahIl1ciUj1jt4usXE7ByMZALfWN161/8xm5YxFdEBKNtVl7K7DCEr6v23id3JVna3pLubAWZybQb6V29zhS6foWnFdaiy3SoZKqUqEERljcMqzB2CIfMujEKsNMRuXWYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IadHtfuh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IadHtfuh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06D6E1F000E9;
	Mon, 24 Aug 2026 12:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787574505;
	bh=H4P5gXlVT0thP8Sp6clkTwjFhtVz9YZDLtR+Gf4SEvU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IadHtfuh8EhOotCPP4446/rx9/nNAoLZynlA5FCAX+nRhG6Cb/w9GeqJpPntDpVtU
	 88DmRWavIQtpZuoHtIV/XisWuoO8BdA6iY7meaunnkvspZ93v3Aex8XIWt9SsAvJUy
	 WANa5rXCA2kjTf1IO6IXID1YWpwKpS7Eu/ilXxJMMXaabnGiuhW5mTcE783RrLmeGE
	 rlBVtorEEEP7rzFxfvfQy4pOQxVl+Dr8D4vrkCSDAphLKyPcdyTa3mjCzYaPOUMHF5
	 hyj8hPQd4rnHT9F1OzvF5VLeHPC1pDMG58oXQnJY8UOseanKl47lx9HeK9YrZEnUyt
	 Ur5XkDDodM+og==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 14/47] clk: qcom: gcc-qdu1000: Tie the CX power
 domain to controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org
In-Reply-To: <20260824-qcom-tie-cx-to-gcc-v3-14-f1205a92682b@oss.qualcomm.com>
References: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
 <20260824-qcom-tie-cx-to-gcc-v3-14-f1205a92682b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 12:28:24 +0000
Message-Id: <20260824122825.06D6E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Low] Missing DT Binding Update for `power-domains` property.

Pre-existing issues:
- [High] System crash (synchronous external abort) due to unclocked registe=
r access during `clk_round_rate()` on DFS clocks.
- [High] System crash due to missing PM Runtime protection in reset operati=
ons.
--

--- Patch [14]: [PATCH v3 14/47] clk: qcom: gcc-qdu1000: Tie the CX power d=
omain to controller ---
commit 51623b28802cf5aef15aece18cd9939c8e2691bb
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>

clk: qcom: gcc-qdu1000: Tie the CX power domain to controller
   =20
Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

> diff --git a/drivers/clk/qcom/gcc-qdu1000.c b/drivers/clk/qcom/gcc-qdu100=
0.c
> index 915bb9b4ff813..172303ac4c9bb 100644
> --- a/drivers/clk/qcom/gcc-qdu1000.c
> +++ b/drivers/clk/qcom/gcc-qdu1000.c
> @@ -2649,6 +2649,7 @@ static const struct qcom_cc_desc gcc_qdu1000_desc =
=3D {
>  	.num_resets =3D ARRAY_SIZE(gcc_qdu1000_resets),
>  	.gdscs =3D gcc_qdu1000_gdscs,
>  	.num_gdscs =3D ARRAY_SIZE(gcc_qdu1000_gdscs),
> +	.use_rpm =3D true,

[Severity: Low]
Does enabling runtime PM here introduce a dependency on a power-domains
property that needs to be documented in the controller's specific binding?
Without updating qcom,qdu1000-gcc.yaml, might this lead to missing DT
constraints or dtbs_check warnings?

[Severity: High]
This isn't a bug introduced by this patch, but enabling runtime PM for this
controller exposes a pre-existing issue in the DFS clocks implementation.

When a consumer driver calls clk_round_rate() on an unprepared DFS clock,
the CCF clk_round_rate() API calls determine_rate() without holding a PM
runtime reference.

If the GCC device is suspended (CX domain off), can this sequence cause a
synchronous external abort due to unclocked register access?

drivers/clk/qcom/clk-rcg2.c:clk_rcg2_dfs_determine_rate() {
    ...
    ret =3D clk_rcg2_dfs_populate_freq_table(rcg);
    ...
}

drivers/clk/qcom/clk-rcg2.c:clk_rcg2_dfs_populate_freq_table() {
    ...
    regmap_read(rcg->clkr.regmap, rcg->cmd_rcgr + SE_PERF_DFSR(l), &cfg);
    ...
}

[Severity: High]
This is a pre-existing issue, but enabling runtime PM on the QDU1000
controller also exposes a vulnerability in the reset operations.

The reset functions appear to access hardware registers directly without
using pm_runtime_resume_and_get() on the GCC device.

If a consumer asserts or deasserts a reset while the GCC provider is
runtime suspended, will this unclocked register access crash the system?

drivers/clk/qcom/reset.c:qcom_reset_set_assert() {
    ...
    regmap_update_bits(rst->regmap, map->reg, mask, assert ? mask : 0);
    ...
}

>  };
> =20
>  static const struct of_device_id gcc_qdu1000_match_table[] =3D {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824-qcom-tie-c=
x-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com?part=3D14
