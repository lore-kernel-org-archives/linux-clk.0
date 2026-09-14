Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011E33D6CD4;
	Mon, 14 Sep 2026 16:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789402642; cv=none; b=NA4zN7OBw+XYaEanEVn/zuVoRBd+0rEQGtlVt9Drsh7Fe0fALQ5JG+CofvHclBJGIVQHJ/msvpe4dmuw2DwbNXsDek4dqxkVLtvbwL+WkcgghYxowe3Z7c5e9+c3A+2/k7VCB6bOvlRtemHUTA+p8DPtWEJy5Tpi1P2syDHZePk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789402642; c=relaxed/simple;
	bh=mXQ3McIyHv0mtE01ivMeHe51ct3ZG36x+/GqwJYrzJE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ATmrfuPX3UCqEIMWXmBgwPafQJP+zPn5tGdOTiBpi28wU3MU6DCV28WWjZsZ4aXUrHTci2kEBb7vff3sGpIdp1x/DWddjJcmisKCEPzrD4NB22symT2m730gLSY6gvMeCx+YtCaS0xi+eQDnlcA7x2fLRdf2ne7pBUqja9ltO7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lnElDRc0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lnElDRc0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56BB71F000FF;
	Mon, 14 Sep 2026 16:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789402640;
	bh=XVjPVHylFYWSOb3zwbJpY3i1kC2hMCVg5KGWIjUUn6w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lnElDRc0Ghc1/45CmHVoaEUtVbEgNZXLSsV7KGLp5MnofjFSsz7BlGxrOFZFXwOWk
	 biTXDXojeeB7YYKakhtozizGjsQ7EUFvWc3zB9VTWlgV2+sBuRb8Ps0TDlDWd6bXJM
	 gCktNmjV/XqjCkYhgbSiKcG4hdLl75Jxiix6TrebeD8ammhobRpkZe/afciLzUke+Z
	 XIPrGQ589/5cJSXhfL4QUOtDg5ij97xuCbU3Au0yv+9MbipDBXyVGLXg358ocDV32+
	 gX8GX7BUbxPH5EW3uV+lLMFavJZ4FtvYZmDJXVQY18UqtqTq9JT3FpP5rE2sYObHgy
	 ppa53kN44vRXA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 29/52] clk: qcom: gcc-sm8150: Tie the CX power domain
 to controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, linux-clk@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260914-qcom-tie-cx-to-gcc-v4-29-9d5a606ada33@oss.qualcomm.com>
References: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
 <20260914-qcom-tie-cx-to-gcc-v4-29-9d5a606ada33@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 16:17:19 +0000
Message-Id: <20260914161720.56BB71F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The CX power domain will never be powered down because the GCC dri=
ver contains CLK_IS_CRITICAL clocks that permanently elevate the device's r=
untime PM usage counter.
--

commit 84c2b8b616c78bfbc16b54eaa58e8941187ebe56
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>

clk: qcom: gcc-sm8150: Tie the CX power domain to controller

This commit enables runtime PM for the GCC controller. The stated intent is
to allow the CX power domain to be powered down once all GCC consumers have
released their clocks and GDSCs.

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

[Severity: High]
Will this configuration prevent the GCC controller from ever suspending?

Setting use_rpm =3D true links the GCC controller to runtime PM. However,=20
the gcc_sm8150 driver defines multiple clocks with the CLK_IS_CRITICAL=20
flag in the gcc_sm8150_clocks array.

During clock registration, the Common Clock Framework automatically prepares
any clocks marked as critical:

clk_register()
  clk_core_prepare()
    clk_pm_runtime_get()

This call chain increments the GCC device's runtime PM usage counter. Becau=
se=20
critical clocks are intentionally never unprepared, the usage counter will=
=20
never drop to zero.=20

As a result, the controller will not be able to suspend and the CX power
domain will remain permanently powered on, which seems to prevent the inten=
ded
power savings of this patch.

>  };
> =20
>  static const struct of_device_id gcc_sm8150_match_table[] =3D {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914-qcom-tie-c=
x-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com?part=3D29
