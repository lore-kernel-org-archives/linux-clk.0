Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301331F8723;
	Thu, 20 Aug 2026 10:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787221560; cv=none; b=UU5g/gB8orCMYEKzWwtdeqXz4eIsudCDE/NBc04iifVQpWrZxUDDUKgiGo4SSCcZd5+8PdWvfEyfZNTJ4IN3ECjZaq8PN6jGUs1VJN0U37A7Poxlxsd2YqO70vqs+R9G4OcNnRIZ9UWpxsHqBFIKrMOKloSFw7GwRwrMpsbyFK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787221560; c=relaxed/simple;
	bh=cpY40COOTtaWN/49W9YLKByVzlvmFwPCfONUQYhiZ68=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=p300/4nhhktow4qHlPFMnAUBkmF6+N9Sjb+JeSORw8C8XqSiFuMiZaF1hsMmYs4u23Xvk0tHmiAKKN5tS2Lp1jyTsfwOvQnCDaypq6erC8c4qoan7YgDZ+64hJycLa0/Aymz8GawQWU1Zx72zDS4RMETfp9/9ZlFdRYj64wQNPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gotbLe2R; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gotbLe2R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9A2C1F000E9;
	Thu, 20 Aug 2026 10:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787221559;
	bh=U//g5VTFq0swPIKXFzH7MRLBsduCHLqNTl+mM0AJbqs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gotbLe2RceD0XgjKlPM4zyK6pmXCMxsDXie4eKTTjVOGd9Ij4Sf7Vn2M6ahb81bw6
	 +mtljtxSdqOCCcMwUw8PcPuxznImkYAK6nDlz+DFDre2ea8oCK0eSzJT0r4fP6Lgd3
	 1PPpPNl0hM4ODV9D6ax8Ze7wyF0CKxbLPaRwMVamArpxeypC3/q5N0nRV44LPgImgR
	 mL/bLudDgn0WevHZGMOMLf9rVSrGF7zDh+BzH9sIeiCDRcZwyu8AsOL4y/0G4jRjEU
	 JCeyfFcerGoc1cCO9+xcZgjCa4TED4jV3pDajmW+hQryOoIUQwD3+0lS3wGf/nPMRF
	 LYeBNZadcxDvQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 01/16] clk: qcom: gcc-sm8250: Tie the CX power domain
 to controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org
In-Reply-To: <20260820-qcom-tie-cx-to-gcc-v2-1-e67ea30d8b7b@oss.qualcomm.com>
References: <20260820-qcom-tie-cx-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com>
 <20260820-qcom-tie-cx-to-gcc-v2-1-e67ea30d8b7b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 10:25:58 +0000
Message-Id: <20260820102558.A9A2C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The patch's intended power savings are defeated because `gcc_cpu=
ss_ahb_clk` is flagged `CLK_IS_CRITICAL`, permanently holding a runtime PM =
reference and preventing the CX domain from powering down.
--

--- Patch [1]: [PATCH v2 01/16] clk: qcom: gcc-sm8250: Tie the CX power dom=
ain to controller ---
commit e29c0e17d3927082fc53c778fba9e97b8d02b015
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>

clk: qcom: gcc-sm8250: Tie the CX power domain to controller

This commit enables runtime PM for the GCC controller. The intention is to
allow the CX power domain to be powered down once all GCC consumers release
their clocks and GDSCs.

> diff --git a/drivers/clk/qcom/gcc-sm8250.c b/drivers/clk/qcom/gcc-sm8250.c
> --- a/drivers/clk/qcom/gcc-sm8250.c
> +++ b/drivers/clk/qcom/gcc-sm8250.c
> @@ -3618,6 +3618,7 @@ static const struct qcom_cc_desc gcc_sm8250_desc =
=3D {
>  	.resets =3D gcc_sm8250_resets,
>  	.num_resets =3D ARRAY_SIZE(gcc_sm8250_resets),
>  	.gdscs =3D gcc_sm8250_gdscs,
> +	.use_rpm =3D true,

[Severity: Medium]
Does this actually allow the controller to power down in practice?

Looking at gcc_cpuss_ahb_clk in this driver, it is registered with the
CLK_IS_CRITICAL flag:

static struct clk_branch gcc_cpuss_ahb_clk =3D {
        ...
        .clkr =3D {
                .hw.init =3D &(struct clk_init_data){
                        .name =3D "gcc_cpuss_ahb_clk",
                        .flags =3D CLK_IS_CRITICAL | CLK_SET_RATE_PARENT,
                        ...
                },
        },
};

When the clock core prepares a critical clock during registration, it calls
clk_pm_runtime_get(), which permanently increments the runtime PM usage
counter for the GCC controller device. Because a critical clock is never
unprepared, this runtime PM reference is held forever.

Will the device's PM usage counter ever be able to reach 0 to allow the
CX domain to power down, or does the critical clock structurally block the
intended power savings?

>  	.num_gdscs =3D ARRAY_SIZE(gcc_sm8250_gdscs),
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820-qcom-tie-c=
x-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com?part=3D1
