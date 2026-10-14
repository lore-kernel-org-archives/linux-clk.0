Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2A6412BF1;
	Wed, 14 Oct 2026 12:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791981406; cv=none; b=nKaGJNquDwgPZeU0wqXhHBWFvGLz+S3pTbxSTR2XwkcwBROeQk4YjFAZ8lygMv6vDU9g3N8Y1IKdDkXXEo7hXTzE8OLT1qwjoO9i02ektbsxUvUxOk5lbIv6kLtQovFqqP2txR0DuH1Z/U/ZN2zEEfIC/lxy4GgQskAEr81Vglo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791981406; c=relaxed/simple;
	bh=J4XFd0sBAw86W0/hl4IWAZGjbN+RKcR0IgKehFmLsGE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=d5qKzCRGtDU1qN+aB1Juf9opiNJ0AQ/jzpVHIfJXR7aVJhmdJK4AftDVgTHt5dLm78ugE6a0Fnn/Im3aZWecMq+UaGI7FEGJnyLGuRZfIy3V7ml3IPoRa9Pzgr8UxTiWglIJImtHWIAzhz0vkDdeOLEIDYIoJ/5juoNlU5pPL2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TQaigwAO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TQaigwAO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DECE1F000FF;
	Wed, 14 Oct 2026 12:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791981405;
	bh=9fyW98fb4tDND3qTFXHLus1JF0l7QzhieWqenZvmURA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TQaigwAOsUBW7cD2sUAtz/er0B7XiCvJ2TndO1doY1UT/Nc9yosRJa4Hu2rVas+h7
	 U1VjjzJ6hkcshvRfIQ2BPnozpjbSu9PQw/cwfUehmHiAe7z/nlrPZJGQxnN637Lsr1
	 kbHBRagUGJlWcUu/hsXeiXeoa5Xt+P3KPfHgXHJImCHrn40sbRXggry+nO4XQwhKT8
	 4wadtPSrNbYh3reBEEt+9vtoGHMl+v/D99LQZvDRRKW/2zTkmaoxRxtIcKrwC17faz
	 uZiBZSb8kcqVgNrNtMW3YN7zbnbMFziIoz8nnSLSZm13Fc1M4O9rq6R3dli3EGC6pE
	 i6TVz4pd/eARQ==
Message-ID: <sashiko-outbox-171289@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH DNM RFC 14/16] clk: qcom: Enable clk-dvfs on SM8650
Reply-To: sashiko-reviews@lists.linux.dev
To: "Konrad Dybcio" <konradybcio@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261014-topic-qc_clk_dvfs-v1-14-3041b788e9f7@oss.qualcomm.com>
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-14-3041b788e9f7@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 12:36:44 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] clk: qcom: Unconditional GDSC required_pds breaks probe on older p=
latforms
--

commit 5e8694e8d0d0380215d061d6b9b0bbabdb94e291
Author: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
One line subject: clk: qcom: Enable clk-dvfs on SM8650

This commit enables clock-dvfs infrastructure for SM8650 by filling in the
power requirements for SM8650 clocks. It also adds SM8650 support to the
shared dispcc, videocc, and camcc drivers.

> diff --git a/drivers/clk/qcom/dispcc-sm8550.c b/drivers/clk/qcom/dispcc-s=
m8550.c
> --- a/drivers/clk/qcom/dispcc-sm8550.c
> +++ b/drivers/clk/qcom/dispcc-sm8550.c
[ ... ]
> @@ -1629,6 +1778,8 @@ static struct gdsc mdss_gdsc =3D {
>  	},
>  	.pwrsts =3D PWRSTS_OFF_ON,
>  	.flags =3D POLL_CFG_GDSCR | HW_CTRL | RETAIN_FF_ENABLE,
> +	.required_pds =3D disp_cc_sm8650_block_pd_indices,
> +	.num_required_pds =3D ARRAY_SIZE(disp_cc_sm8650_block_pd_indices),
>  };

[Severity: High]
Does this unconditional assignment of SM8650-specific power domains to the
mdss_gdsc structure break the probe on older platforms like SM8550, SAR2130=
P,
and X1E80100?

Since the dispcc-sm8550.c driver is shared between these platforms, the old=
er
platform descriptors (like disp_cc_sm8550_desc) do not set
num_dvfs_rail_voters. As a result, qcom_clk_dvfs_register() won't be called
during qcom_cc_really_probe().

When gdsc_register() attempts to register these shared GDSCs on the older
platforms, it evaluates num_required_pds > 0 and calls
gdsc_get_rail_voters(). This will then unconditionally delegate to
qcom_clk_dvfs_get_rail_voter(), which returns -EINVAL because the DVFS
subsystem was never initialized for them.

Could this cause the entire clock controller probe to fail on those older
platforms?

> diff --git a/drivers/clk/qcom/videocc-sm8550.c b/drivers/clk/qcom/videocc=
-sm8550.c
> --- a/drivers/clk/qcom/videocc-sm8550.c
> +++ b/drivers/clk/qcom/videocc-sm8550.c
[ ... ]
> @@ -456,6 +514,8 @@ static struct gdsc video_cc_mvs0c_gdsc =3D {
>  	},
>  	.pwrsts =3D PWRSTS_OFF_ON,
>  	.flags =3D POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
> +	.required_pds =3D video_cc_sm8650_block_pd_indices,
> +	.num_required_pds =3D ARRAY_SIZE(video_cc_sm8650_block_pd_indices),
>  };

[Severity: High]
Could the same probe breakage occur here for the video_cc_mvs0c_gdsc
structure in the shared videocc-sm8550.c driver?

The SM8650-specific requirements are added unconditionally to
video_cc_mvs0c_gdsc, which is used by SM8550 and X1E80100 as well. This
appears to introduce the same risk of failing the clock controller probe on
those platforms.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014-topic-qc_c=
lk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com?part=3D14
