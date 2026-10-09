Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5083C4563
	for <linux-clk@vger.kernel.org>; Fri,  9 Oct 2026 04:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791519879; cv=none; b=HhFir06fAE1xGPk8sXF8o5v+vXhBajllXudGL7GYBr85ajTBiU5zuZvvHCjOEpYFELJnjohnihbvg4ZcmZ8Tz7BJ3Fhj0Y5RKtcjG2kXtAcXEGnvje1B3zlMmDnmGuWoJED3Ko1qD/NJUMJ7XBzlEkR4ysu6ByjmPtl0A+9zObY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791519879; c=relaxed/simple;
	bh=VruSKVVC2sP/UB8olaCIEy+VyuRgfibSDE7EOmOPhfU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=lzXHdDG2LKGpY/vy9vf+FbP5aYHI2DeuH+a29niQ57GEn4prIbECQobt0Bs+AHLy4dU+eqZ4xPdceK+HPPFoYSXL2MTlCFDrAYjs0wwZM9TWa7wJKAMUA1BzjMzTpb0YfdQ0Gcsbhv0XC44t0kjkYmEBtP9iyza6t/wO1zfHvuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=holct/yJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="holct/yJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EBC71F000FF;
	Fri,  9 Oct 2026 04:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791519870;
	bh=aRI9d7Wfsk4arCNsHgNc3sT9fh7WLnnvH0OtzVRre/g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=holct/yJij+inQnb+DjuU+bH2MWd2yyFAs92yjH641Cmi6jTrNYXmpjmxLhP6iwcD
	 Jlwne5PTgrZqLZuAf4ykkSmQutN8cLriKW4JwV/9iKH1579+Yv5d/oxVl+Uq+/anev
	 7Yruu8TknUFqiTB2HqxvQ66n3thgZfh5O1X2niCURN2jwb7hnXgjYagqoxXhmHiyHc
	 qZu3wDDRMOLA6hLXWSmalbtkdkKnzCuuKXOfgZLNh8L4wGl9X6bnoms2CSCz3/ZKg6
	 MONLij2bJNsIDbD/0x8OXKTKe2yCmSi+xt8kcYl1WZ9NU8NR7ys1U8Zb/xHKR5tl3i
	 bH5V0q+GyjLMQ==
Message-ID: <sashiko-outbox-164826@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] clk: qcom: negcc-nord: Add frequencies for
 ne_gcc_sdcc4_apps_clk_src
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jagadeesh Kona" <jagadeesh.kona@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org
In-Reply-To: <20261009-nord-sdcc-clk-v1-1-63351f25a165@oss.qualcomm.com>
References: <20261009-nord-sdcc-clk-v1-1-63351f25a165@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 04:24:30 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] clk: qcom: bitwise truncation of clock divider due to hid_width li=
mit
--

commit 2477f758daf039725b34bfc8b46b211691bae410
Author: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

clk: qcom: negcc-nord: Add frequencies for ne_gcc_sdcc4_apps_clk_src
   =20
Add the frequency table entries for ne_gcc_sdcc4_apps_clk_src to support
the additional clock rates required on the Nord platform.

> diff --git a/drivers/clk/qcom/negcc-nord.c b/drivers/clk/qcom/negcc-nord.c
> index 68ce4d6278baa..a72fce70de45c 100644
> --- a/drivers/clk/qcom/negcc-nord.c
> +++ b/drivers/clk/qcom/negcc-nord.c
> @@ -436,6 +436,11 @@ static struct clk_rcg2 ne_gcc_qupv3_wrap2_s6_clk_src=
 =3D {
>  };
> =20
>  static const struct freq_tbl ftbl_ne_gcc_sdcc4_apps_clk_src[] =3D {
> +	F(144000, P_BI_TCXO, 16, 3, 25),
> +	F(400000, P_BI_TCXO, 12, 1, 4),
> +	F(19200000, P_BI_TCXO, 1, 0, 0),
> +	F(20000000, P_NE_GCC_GPLL0_OUT_MAIN, 30, 0, 0),
> +	F(25000000, P_NE_GCC_GPLL0_OUT_MAIN, 24, 0, 0),

[Severity: High]
Does this configuration overflow the hardware divider field?

In the F() macro, the half-integer divider (h) evaluates to a hardware
pre_div value of 2 * h - 1. For the new 20 MHz and 25 MHz frequencies
in ftbl_ne_gcc_sdcc4_apps_clk_src, using h values of 30 and 24 results
in hardware pre_div values of 59 and 47.

If the ne_gcc_sdcc4_apps_clk_src clock has a 5-bit hid_width, its maximum
supported pre_div value would be 31.

When __clk_rcg2_configure() applies this configuration, would these values
exceed the clear mask (0x1f), resulting in hardware truncation and
potential corruption of adjacent register bits?

Even if adjacent bits are ignored by the hardware, a truncated pre_div
value of 27 (from 59 & 31) means the effective divider becomes 14 instead
of 30, causing the clock to run at 42.85 MHz instead of 20 MHz.

Could this violate timing limits for the SD Card/eMMC controller and
lead to bus instability?

Could the M/N dividers be used for these rates instead, since .mnd_width
is available?

>  	F(37500000, P_NE_GCC_GPLL0_OUT_MAIN, 16, 0, 0),
>  	F(50000000, P_NE_GCC_GPLL0_OUT_MAIN, 12, 0, 0),
>  	F(100000000, P_NE_GCC_GPLL0_OUT_MAIN, 6, 0, 0),

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009-nord-sdcc-=
clk-v1-1-63351f25a165@oss.qualcomm.com?part=3D1
