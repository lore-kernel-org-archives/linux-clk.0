Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD30B4825DF;
	Mon, 14 Sep 2026 15:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789399290; cv=none; b=Va6PhhZlPmWYVF/ZehGaREj9D76B+YAadQIoGNlnbWIXDN7efHEqR1BqzYJRi3Q24ymIj5j9RckHYUV49dDeuGubV0G1JR2RvvlRJ73y9gMTsz1KxHdDHdCgy3NoGaWsOWiZUaSaNhBrT3kEBff5wpMCPjmcIb8UkFG+2xV4rW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789399290; c=relaxed/simple;
	bh=QTVlbO8xC/5XXzdYFnurmGk6BJ7JlGnjLtJLm+fmYeA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DaPvV6xR+CBVRZMQaToW0dnkC+stpAfC7yh16+9Yd/U8plZF2lHvh6yUiUuYGsg1kXKiW2lj8hqytuVQMJ3BZtnhqAQg4M9DEoMEaRhsVwHlPgzKuDFxopP0tCuRugBFGtJ92bN7++s1ZOr5dLYAKuDGgTGbZQTsVK+KdyHA2Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=koNgqTjr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="koNgqTjr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40DCE1F000FF;
	Mon, 14 Sep 2026 15:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789399288;
	bh=DkCePxhWT0BmzEKrtwYF3qGBCaWH9glMG4IoVvEiwv8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=koNgqTjrYPRfG+nvJXHJ7vtIsQIslgyCQEMK4VP5EsCqzLqC3ns08edCtWMyJD9EJ
	 Kx8TTLNYQOsXLyZCrwRx4hcbHbF7zr+NdwZzgBXPolWogreb3oxyIVQmbWyavI6eqU
	 k1TUZSeFCwCLJ/vL4MXBTB/hZ/JWFRcg6ac8pIsTZbTQnZkogUSTrKwOEfRo0K0Ly9
	 toMqomFxvMyrmmK1o6V5vRs12ux9B+RFFObanT/CqNdhHv4dGAWE0DTfq6KxXkKmfl
	 XfozCa95up60u/FVKFGJwHZGx97w3qa2OhM90n9+5LTOL6JP60RdJwncZDeBLV6lVW
	 JNQA/BJZAglcA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 23/52] clk: qcom: gcc-sc7280: Tie the CX power domain
 to controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260914-qcom-tie-cx-to-gcc-v4-23-9d5a606ada33@oss.qualcomm.com>
References: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
 <20260914-qcom-tie-cx-to-gcc-v4-23-9d5a606ada33@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 15:21:27 +0000
Message-Id: <20260914152128.40DCE1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Unclocked reset register access due to missing pm_runtime_get in q=
com_reset_set_assert when use_rpm is enabled.
--

commit 8a72c09fdcc91da6e4bac8d90cd2e02793ef02c2
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>

clk: qcom: gcc-sc7280: Tie the CX power domain to controller

This commit enables runtime PM for the GCC controller, allowing the CX power
domain to be powered down once all consumers have released their clocks and
GDSCs.

> diff --git a/drivers/clk/qcom/gcc-sc7280.c b/drivers/clk/qcom/gcc-sc7280.c
> index 4502926a2691a..bb8f6efb88b1c 100644
> --- a/drivers/clk/qcom/gcc-sc7280.c
> +++ b/drivers/clk/qcom/gcc-sc7280.c
> @@ -3446,6 +3446,7 @@ static const struct qcom_cc_desc gcc_sc7280_desc =
=3D {
>  	.num_resets =3D ARRAY_SIZE(gcc_sc7280_resets),
>  	.gdscs =3D gcc_sc7280_gdscs,
>  	.num_gdscs =3D ARRAY_SIZE(gcc_sc7280_gdscs),
> +	.use_rpm =3D true,

[Severity: High]
Does enabling runtime PM here cause unclocked register accesses during reset
operations?

When use_rpm is true, the GCC controller can be runtime suspended. However,
the reset operations do not appear to resume the device before accessing
hardware registers:

drivers/clk/qcom/reset.c:qcom_reset_set_assert() {
    ...
    regmap_update_bits(rst->regmap, map->reg, mask, assert ? mask : 0);
    ...
}

If a consumer driver calls reset_control_assert() while the GCC is suspended
(for example, during a resume path before clocks are enabled, or during
probe if fw_devlink is disabled), could this unpowered register access
trigger a synchronous external abort and crash the system?

Should qcom_reset_set_assert() and similar reset callbacks call
pm_runtime_resume_and_get() before touching the hardware to ensure the
CX domain is actively powered on?

>  };
> =20
>  static const struct of_device_id gcc_sc7280_match_table[] =3D {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914-qcom-tie-c=
x-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com?part=3D23
