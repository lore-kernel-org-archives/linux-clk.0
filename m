Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD264749E9;
	Mon, 14 Sep 2026 14:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789397575; cv=none; b=agFE4i+vBP/+gnPlUXlNKR/8r+b0HTMZ5uiK4klP94CJgikczerJjvtwEM+Ah2dWp57FSS3olstKoPyQjy5yDLPep8a7Tzufryhms8M8tyKBiD+qmQi0OpRTdJxz/Ca0WNiMmALh1A7n2LZEYu+niavvA3lx40DnvtbECVwFHPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789397575; c=relaxed/simple;
	bh=deQmg9XenLLhTtAaB+hecRvR9zTaMKOMhTHMSlyR++0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=U6vMcqiK4a2jtz7FXxoFiTKbrszyHKjr/XOOi+dg5urd8VVbrg5DF+tIUvAEUjJtM8iIGvrrhqjPYfUgwRfnOniuKi+oA1oS2MjUWy8JnCDLf16See1ayBf6wQwUIFZ06zIchjZDeJ+IIGSLPfwpULyczqheuvmYRjCUIP36MBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Port1vVQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Port1vVQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33C911F000FF;
	Mon, 14 Sep 2026 14:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789397573;
	bh=Oh56cUpxvN1lQl3zgEMh/pWgn7qzpdjQZLCaX25gIq0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Port1vVQ/uRQm49VMjQFnV1WFqIdtxF3C06xjvbW9sZpF4veoCV/xr9ZubDHj6lw3
	 wke/Tl+ypleOnTeJpSCQrgDgC0OPIJUzrF09HwpXOOqkdEEdos0EEN7fAEZ0IxoG6b
	 AoJsH59W9uHuYqa7EH5++/D8wFaM2MOHuXx4qdnxXwcp+JHDWAEGnpxLkH88iHBfM9
	 kDq0Yi+s6wF8KXXmPA+zTbLrqnbhr5f8RlC2cvR51NxXqdfr8vSfOtjPiHNaNMuOqH
	 GvWabq/e6xjGqHtanX0+mXMAGAFZe0burRGzMS7khcLigiF0abD4TiW04iniGBKAhj
	 g2to0+f3qVS9g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 22/52] clk: qcom: gcc-sc7180: Tie the CX power domain
 to controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260914-qcom-tie-cx-to-gcc-v4-22-9d5a606ada33@oss.qualcomm.com>
References: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
 <20260914-qcom-tie-cx-to-gcc-v4-22-9d5a606ada33@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 14:52:52 +0000
Message-Id: <20260914145253.33C911F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Critical clocks permanently hold a runtime PM reference on the con=
troller, preventing it from suspending and defeating the patch's purpose to=
 power down the CX domain.
- [High] Enabling runtime PM breaks the manual boot handoff of the GPU GDSC=
 if the controller actually suspends.
--

commit 0aa0dbfeaa58a3fdbcbae9974a5bd2ab77272a27
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>

clk: qcom: gcc-sc7180: Tie the CX power domain to controller

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

> diff --git a/drivers/clk/qcom/gcc-sc7180.c b/drivers/clk/qcom/gcc-sc7180.c
> index 4a49ad7a9e5be..f3a245470a4de 100644
> --- a/drivers/clk/qcom/gcc-sc7180.c
> +++ b/drivers/clk/qcom/gcc-sc7180.c
> @@ -2418,6 +2418,7 @@ static const struct qcom_cc_desc gcc_sc7180_desc =
=3D {
>  	.num_resets =3D ARRAY_SIZE(gcc_sc7180_resets),
>  	.gdscs =3D gcc_sc7180_gdscs,
>  	.num_gdscs =3D ARRAY_SIZE(gcc_sc7180_gdscs),
> +	.use_rpm =3D true,

[Severity: High]
Since this controller uses critical clocks like gcc_cpuss_ahb_clk and
gcc_sys_noc_cpuss_ahb_clk (registered with CLK_IS_CRITICAL), will the
Common Clock Framework indefinitely hold a runtime PM reference on the
controller?

During clock registration, the CCF calls clk_core_prepare_enable() for
critical clocks, which increments the provider device's PM runtime usage
counter via clk_pm_runtime_get().

Because critical clocks are never unprepared, the PM usage counter will nev=
er
drop to zero. Will this prevent the GCC controller from runtime suspending,
thereby permanently keeping the CX power domain on and defeating the purpose
of this patch?

[Severity: High]
If the controller does manage to runtime suspend, does this break the
manual boot handoff of the GPU GDSC?

In gcc_sc7180_probe(), raw register writes are used to enable certain clock=
s:

    qcom_branch_set_clk_en(regmap, 0x71004); /* GCC_GPU_CFG_AHB_CLK */

Because this bypasses the Common Clock Framework, no PM runtime reference is
taken to keep the controller active for these blocks.

If pm_runtime_put_sync() at the end of probe actually suspends the device,
cutting power to the CX domain, will these manual writes be rendered
ineffective and cause a crash when downstream drivers probe?

>  };
> =20
>  static const struct of_device_id gcc_sc7180_match_table[] =3D {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914-qcom-tie-c=
x-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com?part=3D22
