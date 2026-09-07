Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7C71A0BF3;
	Mon,  7 Sep 2026 08:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788770291; cv=none; b=k2tIIzAf3pb3doZiHjtDbRRJEQ9HwTggKk4TG+T9A/DT8VfI9IRQB+xSwg5Ay2PXsz7bpsXOYSoocugK5lBnZOYzC+HXrwwepdbiPpab+g3BJ/QINUDCygtg0yetfiFabIg7sX3DBaRMkFANVn2lWxUmsz02Sz7RHq9V01tUyM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788770291; c=relaxed/simple;
	bh=+6Q7P0Y/6VPRMf+xlH1P3A058uEwIR5Aa+OWaBILzX0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Jg163YaUvWilZrnrkp/PDfZmY/1uTwLNG3ZDE2KurcusCY8KStFpUfM0TcR56qXRQocB4VvoNwo1WOij715BHHbPAylDxnGKh8/I3KcUbYLVtxqx4K6kojrSvOLDZJpKiwz5MUhwQKHJB8LnJGDc8aeoTMVUm86Wj3VEJpmoTag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ogJ/vDCX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ogJ/vDCX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BE931F00A3D;
	Mon,  7 Sep 2026 08:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788770289;
	bh=ZhxaM6qTAZTAXEu6QlTnKt8izppG25MKny5Y37a/p9M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ogJ/vDCXUkO8mtOQmjkAVdCm0FvH0K4hNQxArTYrqCoU+SStT5O+tCGyXtwDCk3t4
	 Gw5YXoV0basO0KQBXS/tRXPnjfReGVxZIRbz+fcbZ1f3qzKQ0qAFRUaBjCWkp6GM5q
	 y3gUul/JNl/IeGB5/0tTPAs0CsmQGoQW26kMPND0zRXMpZzhsyXcaELrXJK9Y3Jvbw
	 8oKKNc0anMG6GOwtCQOEVPn/qInV+3a5UbNe6kEAwrmNCiTLICWpmYhylx4HnHnoRq
	 3hv5ZP3PCrB55DwrRWs68y3GOiKurA9kQeWfvuc77NVq9BZ4HjyYRDmylq4RsDV29K
	 zo3gmPBIqWiLQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] clk: qcom: clk-alpha-pll: support a 28-bit
 ALPHA_VAL width
Reply-To: sashiko-reviews@lists.linux.dev
To: "Taniya Das" <taniya.das@oss.qualcomm.com>
Cc: conor+dt@kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260907-nords_dprx-v1-1-d472af3f01b1@oss.qualcomm.com>
References: <20260907-nords_dprx-v1-0-d472af3f01b1@oss.qualcomm.com>
 <20260907-nords_dprx-v1-1-d472af3f01b1@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 08:38:08 +0000
Message-Id: <20260907083809.1BE931F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The function `zonda_pll_adjust_l_val` incorrectly adds the unscale=
d target frequency `rate` instead of the divided `quotient` to the L-value =
multiplier.
--

commit 661ff85b8608f1b3893f18020783320b39a04c99
Author: Taniya Das <taniya.das@oss.qualcomm.com>

clk: qcom: clk-alpha-pll: support a 28-bit ALPHA_VAL width
   =20
This commit introduces support for an optional 28-bit ALPHA_VAL width in the
clk-alpha-pll driver by adding an alpha_width field. This allows correct
scaling and calculation for PLLs like the Zonda instances that use a wider
register for finer fractional resolution.

> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alph=
a-pll.c
> index 60173b076cc5f..981f973da02f3 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.c
> +++ b/drivers/clk/qcom/clk-alpha-pll.c

[ ... ]

> @@ -2290,7 +2291,7 @@ static int clk_zonda_pll_set_rate(struct clk_hw *hw=
, unsigned long rate,
>  	if (ret < 0)
>  		return ret;
> =20
> -	if (a & PLL_ALPHA_MSB)
> +	if (a & BIT(alpha_width - 1))
>  		zonda_pll_adjust_l_val(rate, prate, &l);

[Severity: High]
This isn't a bug introduced by this patch, but while reviewing this L-adjust
MSB check, does zonda_pll_adjust_l_val() incorrectly add the unscaled target
frequency to the L-value multiplier?

When this condition is met and zonda_pll_adjust_l_val() is invoked, it appe=
ars
to overwrite the previously calculated integer divider with the raw rate
instead of the local quotient:

drivers/clk/qcom/clk-alpha-pll.c:zonda_pll_adjust_l_val() {
	u64 remainder, quotient;

	quotient =3D rate;
	remainder =3D do_div(quotient, prate);

	*l =3D rate + (u32)(remainder * 2 >=3D prate);
}

Should this final assignment use the `quotient` variable instead of `rate`?
Writing an astronomically unscaled value (like the target rate in Hz) to the
L-value register would severely corrupt the PLL hardware configuration and
cause it to fail to lock.

> =20
>  	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL(pll), a);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907-nords_dprx=
-v1-0-d472af3f01b1@oss.qualcomm.com?part=3D1
