Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DDC4457A6;
	Mon,  7 Sep 2026 08:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788771317; cv=none; b=EecvYTGQWWmqr6CFSFWGYL4CWFoRh6u34o2BAf5WSzRdKforXKImaj/oSdxIpVbBfzn16b/JFuSGYkjsvSiiuHLu/YQLDwfSFQXHoVk5n9Yh4jlVI6KVQO7Uhyw0g+/fvNkkOCNtoJdGFpOEBn60l1epT7KFA1reNpx6UdAGc6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788771317; c=relaxed/simple;
	bh=eiGMjcZOlAyp41DSqqfFnp7ZC3WMC8whtvMKWZxe4yo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uyLU73I3EtbGOnRzLBw0muq59VyBnn6P8bA+jEQ10uzEGpKSB7DCGLShv8OhAPFpyh/8Y32J9Qs8YrdTwutG/mXtHAFpa1ErtypmyHEgLxq5wmEP2DvPUR7OtSDZcmDeqK+P3jnEhNL1L1RNreAa3R/S6szpHAjkZSERpTbI644=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AV51JbOF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AV51JbOF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C1281F00A3A;
	Mon,  7 Sep 2026 08:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788771316;
	bh=zfw1rO4zgSu2EK6ukXUFO8r3gRLmj4NYDL7wk+A/pkI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AV51JbOF2zVg6+AG/8Dc2a0YAhyygvSKSCJ6sgdVUeJB9oaMJnPYYnnOD6Scm3Dv6
	 rFbRS796UFqDiQBlJSX5tJ/HuDujF2dkF9QIafzLdaUCtYDg6Th4DNq5/frPhHU3KR
	 XskeBGxba3iabFjKbihIHDP5zjv5DXCFKrbDs82H0XKTI91XHuc8HuNpQvCxHEfVQi
	 ftGQms/GomPQTEWUk55vVSMFmq6Yk3LnDqxp5y90bRbYLWgi5jgz7e3U71n0okuTNx
	 eBNJGzOfr0oHx/jCQcSjntRwj5UvHFALG8aQ6+OUKphar6wQNYzHj8ordjvqBXPA4s
	 pHBirGNclhsug==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] clk: qcom: dprxcc: Add Nord DPRX clock controller
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Taniya Das" <taniya.das@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260907-nords_dprx-v1-3-d472af3f01b1@oss.qualcomm.com>
References: <20260907-nords_dprx-v1-0-d472af3f01b1@oss.qualcomm.com>
 <20260907-nords_dprx-v1-3-d472af3f01b1@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 08:55:15 +0000
Message-Id: <20260907085516.0C1281F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing `.use_rpm =3D true` causes register accesses while the pow=
er domain is disabled.
--

commit f58a0767efa8984edb8bffb65390c86a685205cd
Author: Taniya Das <taniya.das@oss.qualcomm.com>

    clk: qcom: dprxcc: Add Nord DPRX clock controller support
   =20
    Add support for the DisplayPort Receiver (DPRX) clock controllers on
    Nord devices. There are two identical DPRX clock controller
    instances (DPRX0 and DPRX1), each providing clocks for the DPRX core,
    audio, AHB and video memory paths, along with core PLLs.

> diff --git a/drivers/clk/qcom/dprxcc0-nord.c b/drivers/clk/qcom/dprxcc0-n=
ord.c
> new file mode 100644
> index 0000000000000..85cfa8f3be26b
> --- /dev/null
> +++ b/drivers/clk/qcom/dprxcc0-nord.c

[ ... ]

> +static const struct qcom_cc_desc dprx_cc_0_nord_desc =3D {
> +	.config =3D &dprx_cc_0_nord_regmap_config,
> +	.clks =3D dprx_cc_0_nord_clocks,
> +	.num_clks =3D ARRAY_SIZE(dprx_cc_0_nord_clocks),
> +	.resets =3D dprx_cc_0_nord_resets,
> +	.num_resets =3D ARRAY_SIZE(dprx_cc_0_nord_resets),
> +	.driver_data =3D &dprx_cc_0_nord_driver_data,
> +};

[Severity: High]
Should .use_rpm =3D true be set in dprx_cc_0_nord_desc?

During device probe, qcom_cc_really_probe() directly calls
dprx_cc_0_nord_regs_configure(), which executes regmap_write() to hardware
registers. Without setting .use_rpm to true, the driver core does not call
pm_runtime_resume_and_get() to enable the device power domain prior to
these writes. Can this lead to a system crash (external abort) when
accessing unclocked hardware registers?

> diff --git a/drivers/clk/qcom/dprxcc1-nord.c b/drivers/clk/qcom/dprxcc1-n=
ord.c
> new file mode 100644
> index 0000000000000..573d66bb97c90
> --- /dev/null
> +++ b/drivers/clk/qcom/dprxcc1-nord.c

[ ... ]

> +static const struct qcom_cc_desc dprx_cc_1_nord_desc =3D {
> +	.config =3D &dprx_cc_1_nord_regmap_config,
> +	.clks =3D dprx_cc_1_nord_clocks,
> +	.num_clks =3D ARRAY_SIZE(dprx_cc_1_nord_clocks),
> +	.resets =3D dprx_cc_1_nord_resets,
> +	.num_resets =3D ARRAY_SIZE(dprx_cc_1_nord_resets),
> +	.driver_data =3D &dprx_cc_1_nord_driver_data,
> +};

[Severity: High]
Does dprx_cc_1_nord_desc also need .use_rpm =3D true?

Similar to dprx_cc_0_nord_desc above, without enabling the power
domain, calling dprx_cc_1_nord_regs_configure() during probe could cause a
crash when writing to unclocked hardware registers.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907-nords_dprx=
-v1-0-d472af3f01b1@oss.qualcomm.com?part=3D3
