Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F3122A80D;
	Mon, 14 Sep 2026 16:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789403022; cv=none; b=NbBAnEraYpJRwRDdhXuOH/9RfROL7Ifir8nIEDRJthwlJTv3BrWICRDFaN1rhGJw9G0HSkIg/l/GVQNUvOH+OlDEZvK3nPu+wv5dT14kMQno1i+q0+eg4AnD//8O4W/IuO+K3JESYzmZ6bACZzKRMsCuL7C14gEKyylHORAj/pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789403022; c=relaxed/simple;
	bh=J2JyQKnYe5qgHZZpyhEUkr6dK5vHHN+cH1DTPaj08UQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hBBhlP1Y42+6Z2jJF1przukMe5j3xo9TzwcKRcGd0tu08IVnN9UR9upa16Fy59b19Gr/lBGBVPKjWZamAJ982aFEd22RKeutbu6ExmyHLZdQZ+f8UBudx1XI9im+0mUvPFDxUcfxdtVm6iRt/VuPcInUgq5UJ9Tq/C8T2S0T/vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YkkntFW3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YkkntFW3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 125741F000FF;
	Mon, 14 Sep 2026 16:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789403021;
	bh=trruPWH3Hh3l8Y6X4u6t5BhgC8vR4yGzS3KuZTCm6po=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YkkntFW3xOUpnfXaQzw0E9SdtO+Id/B/qgbey0VmFKUL2Yh88BZJTMcNT4Ovn3tCS
	 HwN1hxC2BA7jJTcqsQxxyGkIww5Bo1oEmD3pcVkESt9HmeVdjDTpl680vxtRqy5o+S
	 lgnduTVeY1HBwiUhIj5Skxg7LP5657/N/SaD9r3+O1dmv9I04WYYKJiiPn/sRyR5+N
	 FpUni49XRP7WYWx9YknKF4O2wOetw4PpANHomSjjs9DHadln+Obc6iBha/CFjMah4J
	 DhfyP/0MduOiG5hUc5yawoSXH5Eq/7wiUHC9PRgHkN99yN7Lh50Kh5xIbEBkONRSzN
	 Lc78N5K55QP3Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 30/52] clk: qcom: gcc-sm8250: Tie the CX power domain
 to controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org
In-Reply-To: <20260914-qcom-tie-cx-to-gcc-v4-30-9d5a606ada33@oss.qualcomm.com>
References: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
 <20260914-qcom-tie-cx-to-gcc-v4-30-9d5a606ada33@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 16:23:40 +0000
Message-Id: <20260914162341.125741F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `CLK_IS_CRITICAL` flag on `gcc_cpuss_ahb_clk` prevents the G=
CC controller from ever entering runtime suspend, defeating the patch's pur=
pose.
--

commit a3b0a9db0b4d5cbe7a388343e5a482b40819de45
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>

clk: qcom: gcc-sm8250: Tie the CX power domain to controller

This commit enables runtime PM for the controller, allowing CX to be
powered down once all GCC consumers have released their clocks and GDSCs.

> diff --git a/drivers/clk/qcom/gcc-sm8250.c b/drivers/clk/qcom/gcc-sm8250.c
> index 1c59d70e0f96c..44f6e197433eb 100644
> --- a/drivers/clk/qcom/gcc-sm8250.c
> +++ b/drivers/clk/qcom/gcc-sm8250.c

[ ... ]

> @@ -3619,6 +3619,7 @@ static const struct qcom_cc_desc gcc_sm8250_desc =
=3D {
>  	.num_resets =3D ARRAY_SIZE(gcc_sm8250_resets),
>  	.gdscs =3D gcc_sm8250_gdscs,
>  	.num_gdscs =3D ARRAY_SIZE(gcc_sm8250_gdscs),
> +	.use_rpm =3D true,

[Severity: Medium]
Will this controller ever actually enter runtime suspend to achieve the
intended power savings?

Because gcc_cpuss_ahb_clk is defined in this file with the CLK_IS_CRITICAL
flag, the clock framework automatically prepares it at registration and nev=
er
unprepares it. During clk_core_prepare(), the framework calls
pm_runtime_resume_and_get() on the provider device (the GCC controller)
because it is now runtime PM enabled.

Since this critical clock is never disabled, won't the runtime PM usage
counter for the GCC controller permanently remain above zero? This would
prevent the controller from entering runtime suspend, meaning the CX domain
will never dynamically power down during runtime as intended.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914-qcom-tie-c=
x-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com?part=3D30
