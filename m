Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5243D5221;
	Mon, 14 Sep 2026 13:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789394311; cv=none; b=HiV69QuXIwYLMoSPXElbIbkW/DAVgPdPboA1aSEbCKY92hJYEh3Aupz3unyCVcNVOKopzDBfxjNt8lPJDfugj5eXXUhYAFTjVdmus2rDdSeIOAcThkQt+zFXtuwo6JJnSShY8e6QkT2K0+X7mW1uOhkMsWm25RrwmBsZKD6Yi9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789394311; c=relaxed/simple;
	bh=VCXcKiNLpibA6WqGwc/8480tGF+QoaSTAFxJEUAFF1M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cSzqP8ZfPqp9ml2nwBWIn9ZPGBEAQIAYzH8aXCinjSffe3yM9L1uHf6Fy1+xoDZr42Ygx5cQaytqZxnmjn0MiyVB45fdI9u8hhUYJLrP64+a/eagvugnzBcLfRuf06tYvt/DJfENOjCIf0XsW9ApB1fP9TFmBITl5Ru5NVWHRBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dfmphxhX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dfmphxhX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 427591F000FF;
	Mon, 14 Sep 2026 13:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789394309;
	bh=rjCQ96/XaYItCub9JS3BRpYv5EpBp1yGkgP/RHRerZs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dfmphxhXoqLB5b7plQHT84/eB3d0jkz8IVwE/7QtGHHfPaDw0AmYNM3LGzvkgNeEv
	 daRS0YW+acFNwVNGyA/qY9uJCNg55NxxAXfLX2UlK8ckjV3UU3vWSwewu0EebfVkrY
	 8Hq2S9k6It51MxLjFM9jbxssbMI3s95NbvxEJSsKTi5+6hmxcYmFYugRPyhXVmB9xT
	 rgKkWb3yyrvymzhePLlYM1bmJUHJr1UR4ohwMgdSNL0iWXbROUf+i5LVEXlaSNi6+O
	 Srepz9GZ/Tp4av0Mq5EI5OSOBm9mBtzmdlhmzod0UbU7htPsvA/vkBPy2GWo+4Jtw9
	 4cG7Rugiw2KXA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 17/52] clk: qcom: gcc-qcs615: Tie the CX power domain
 to controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, linux-clk@vger.kernel.org
In-Reply-To: <20260914-qcom-tie-cx-to-gcc-v4-17-9d5a606ada33@oss.qualcomm.com>
References: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
 <20260914-qcom-tie-cx-to-gcc-v4-17-9d5a606ada33@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 13:58:28 +0000
Message-Id: <20260914135829.427591F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Enabling runtime PM (`use_rpm =3D true`) on a clock controller wit=
h `CLK_IS_CRITICAL` clocks causes a permanent PM runtime usage count leak, =
preventing the controller (and its attached CX power domain) from ever susp=
ending.
--

commit 660d870b134f3691d16847f677af3d1122921193
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>

clk: qcom: gcc-qcs615: Tie the CX power domain to controller

This commit enables runtime PM for the QCS615 GCC controller. It aims to al=
low
the CX power domain to power down once all GCC consumers release their cloc=
ks
and GDSCs.

> diff --git a/drivers/clk/qcom/gcc-qcs615.c b/drivers/clk/qcom/gcc-qcs615.c
> index 57f8c80c6f324..914a49573811f 100644
> --- a/drivers/clk/qcom/gcc-qcs615.c
> +++ b/drivers/clk/qcom/gcc-qcs615.c
> @@ -2968,6 +2968,7 @@ static const struct qcom_cc_desc gcc_qcs615_desc =
=3D {
>  	.num_resets =3D ARRAY_SIZE(gcc_qcs615_resets),
>  	.gdscs =3D gcc_qcs615_gdscs,
>  	.num_gdscs =3D ARRAY_SIZE(gcc_qcs615_gdscs),
> +	.use_rpm =3D true,

[Severity: High]
Will this actually allow the CX domain to power down, given the presence of
critical clocks in this controller?

Enabling runtime PM here instructs the clock framework to take PM runtime
references on the GCC device. However, this controller defines several cloc=
ks
with the CLK_IS_CRITICAL flag, such as gcc_cpuss_ahb_clk and
gcc_sys_noc_cpuss_ahb_clk:

static struct clk_branch gcc_cpuss_ahb_clk =3D {
        ...
        .clkr.hw.init =3D &(const struct clk_init_data) {
                ...
                .flags =3D CLK_IS_CRITICAL | CLK_SET_RATE_PARENT,
        },
};

When qcom_cc_really_probe() registers these clocks, the clock core sees
CLK_IS_CRITICAL and automatically prepares them via clk_core_prepare(). This
internally calls clk_pm_runtime_get(), which increments the GCC device's PM
runtime usage counter via pm_runtime_resume_and_get().

Because critical clocks are never unprepared, won't this result in a perman=
ent
PM runtime usage count leak that prevents the controller and its attached CX
power domain from ever suspending?

>  };
> =20
>  static const struct of_device_id gcc_qcs615_match_table[] =3D {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914-qcom-tie-c=
x-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com?part=3D17
