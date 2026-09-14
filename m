Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460F9470E96;
	Mon, 14 Sep 2026 13:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789393487; cv=none; b=Zd+yJK4Epa6ea0FmU9TpPp49TJkRwa8GOFrIC9MVI62EdFgWdl6EM6z0QcPYLAVE8FikmMBjH/Vgv327sBwfkbpIu3wm7U9CpXRgY3FdG3OrwOK7OBmQUfrhg7bXItOsZdNQOpY6lMNXbRO4GFb3eYgyhNH5ZSOxhatmTMH9IMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789393487; c=relaxed/simple;
	bh=Lf6klfPWESMBTYvqh2XmPcJGAvSNanb9ZMP3hcMgFHA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=l2AivkByuEdTZqmu1RVWOC4qiyuJAhh3i77kOwRjFbwQuL+HOW2egaout2zfndJgjiirdYZzzHj0mHb0aybVRp2l8UE5Ruku7Pn7UiEst52tlb2yxLOwYjaLQsXWOH2tPZCJUdnkHPuSLe+ebzGZhGIT5jIqJZ7I8R+A/d4Gjzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KD9fyNFQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KD9fyNFQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D6941F000FF;
	Mon, 14 Sep 2026 13:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789393485;
	bh=AMtkPrCXiTupiXtBkOMFdMt0qwyqjclH3epc2TLJInE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KD9fyNFQq9PktlXiEq/+VM46SQzTOpL2nxcyMfc51Lbx/5Vdhepf0im8ESzHTv9NC
	 cBZA9BetEA3HUAPzVCih3Y9SHam1CQPv6gneTFHE/F+V4l2yvHPkpwt7v4If+WRvKt
	 gIdgSZyEjL9C8/e2h5UaWaOEL9I38e37jnvFp3x3A/4Wi3SSZcKriiHoQIwj7meku5
	 bJMGOovWYnsb8HgBi0KYeVN2UmZqPyPeaw6YV4NNUY63Fay3HkGaqj13MBkNIZvfO1
	 TgcXqF5JU4q9RxpJABYdRH1+ltmpOz56aQWOZRDbAr4SsNrsKbKPKVaEXKjfZkFnGk
	 2FErlD3vuXO2g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 15/52] clk: qcom: gcc-eliza: Tie the CX power domain
 to controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org
In-Reply-To: <20260914-qcom-tie-cx-to-gcc-v4-15-9d5a606ada33@oss.qualcomm.com>
References: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
 <20260914-qcom-tie-cx-to-gcc-v4-15-9d5a606ada33@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 13:44:45 +0000
Message-Id: <20260914134445.7D6941F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Reset controller operations do not request runtime PM before acces=
sing hardware registers, risking a bus error when the controller is suspend=
ed.
--

commit 6eedff091b5ff334cffe34d7a6a6b3454bdf390d
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>

clk: qcom: gcc-eliza: Tie the CX power domain to controller

This commit enables runtime PM for the GCC Eliza clock controller. By setti=
ng=20
use_rpm to true, it allows the CX power domain to power down when all GCC=20
consumers have released their clocks and GDSCs.

> diff --git a/drivers/clk/qcom/gcc-eliza.c b/drivers/clk/qcom/gcc-eliza.c
> index fe18942a59ac4..e26e6e6e52f10 100644
> --- a/drivers/clk/qcom/gcc-eliza.c
> +++ b/drivers/clk/qcom/gcc-eliza.c
> @@ -3068,6 +3068,7 @@ static const struct qcom_cc_desc gcc_eliza_desc =3D=
 {
>  	.num_resets =3D ARRAY_SIZE(gcc_eliza_resets),
>  	.gdscs =3D gcc_eliza_gdscs,
>  	.num_gdscs =3D ARRAY_SIZE(gcc_eliza_gdscs),
> +	.use_rpm =3D true,

[Severity: High]
This is a pre-existing issue, but by setting use_rpm to true here, this
patch exposes it to the Eliza platform.

Reset controller operations in the Qualcomm clock subsystem do not appear to
request runtime PM before accessing hardware registers. If a consumer driver
asserts or deasserts a reset while its clocks are disabled, does
qcom_reset_set_assert() directly access the reset register while the GCC
device is powered off?

drivers/clk/qcom/reset.c:qcom_reset_set_assert() {
        ...
        regmap_update_bits(rst->regmap, map->reg, mask, assert ? mask : 0);
}

Since this patch allows the GCC clock controller and its CX power domain to
suspend, could this reset register access trigger a synchronous external
abort and lead to a kernel panic?

>  	.driver_data =3D &gcc_eliza_driver_data,
>  };
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914-qcom-tie-c=
x-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com?part=3D15
