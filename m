Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2702731AF2D
	for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 08:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787213138; cv=none; b=Llfv5V8J1zPzZDvjeW7gscjiQYfOFdVOMflBNDYVsfKhWepF8/Tcnvxed7eC4rDIf72XiFFouSAWOfMX5lAqZ645J4ooSsJVnKKstDfoYD1M8F94Dnxlbhu75w6RbuDxDoeY4TFzEne8QqDm2VRUzXQKGfgDqAHqzLKQa1bK4+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787213138; c=relaxed/simple;
	bh=MTNYGU9v+yEMryJhlT7fDj/IB0LKRBQeR1zOMwEt66U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=J6oIdVyXc6Z3NXjgIY9bFZgPk71yxZCpMU8XG11EAf5pisfzzkdH3cZz1wYbNXmj/9mkaS3j6+wJaFUpeilX6G87j5yf5nfYX6qv7jllvnprfoI16zvxgCrSIl7RjSjHoG/772rJoYyblZFUzA7wZAG5ZD7ACdVHf1lyaymVTlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f0ZA4yV2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f0ZA4yV2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E92911F000E9;
	Thu, 20 Aug 2026 08:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787213136;
	bh=waNBybu53A2WVBmQNxQeg1gjxY0c/1CIPMy44jf3i2A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=f0ZA4yV25NEyCrghB6HTv5t2fBdI/k3f5gvrKeYYsv1p4bIJAI9i2/i5xyfU5D4YX
	 MkS8F7HGuFnWyKktFLvG3wwOa7gLpq9fnMSg+lqiWL9t2OTjchqDM3XSWRplxAaBcn
	 yhe3nLu50Goep/QYcWkZY9rMCgWBsozjMXhOdFnH7IRQt9MuVtMV/iBJPvQtsRH88v
	 p+DlCw8RoZT9kucOdtvZbncHdt+dB+0QTV+ZATlX5Q1fF/x2RVcBeySaoxC5n51gj3
	 o8impDY2ijWsg9ZNdKujKjOCZG2L8wMAAXLQ7S43OFXE3rK3iCZL+1M8dfsHTr28TU
	 ddzZyBcM6XraQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] clk: rockchip: rk3588: let MCLK_SPDIF* rate requests
 reach the divider
Reply-To: sashiko-reviews@lists.linux.dev
To: "Karl Asseily" <karl@asseily.com>
Cc: linux-clk@vger.kernel.org
In-Reply-To: <20260820075427.67050-1-karl@asseily.com>
References: <20260820075427.67050-1-karl@asseily.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 08:05:35 +0000
Message-Id: <20260820080535.E92911F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Incomplete bug fix: The patch fixes silent rate configuration fail=
ures for S/PDIF clocks by adding CLK_SET_RATE_PARENT, but fails to apply th=
e necessary identical fix to the I2S master clocks (MCLK_I2S*).
--

--- Patch [1]: [PATCH] clk: rockchip: rk3588: let MCLK_SPDIF* rate requests=
 reach the divider ---
commit 3e2508be1e8b1ff2b82e2859ac11176c7413639e
Author: Karl Asseily <karl@asseily.com>

clk: rockchip: rk3588: let MCLK_SPDIF* rate requests reach the divider

This commit adds the CLK_SET_RATE_PARENT flag to the MCLK_SPDIF* clock gate=
s.
This ensures clk_set_rate() requests propagate up to the fractional divider,
fixing an issue where S/PDIF sample rates were silently ignored.

> diff --git a/drivers/clk/rockchip/clk-rk3588.c b/drivers/clk/rockchip/clk=
-rk3588.c
> index 2ba9976654cf1..b3d577dccfcb7 100644
> --- a/drivers/clk/rockchip/clk-rk3588.c
> +++ b/drivers/clk/rockchip/clk-rk3588.c
> @@ -960,7 +960,7 @@ static struct rockchip_clk_branch rk3588_early_clk_br=
anches[] __initdata =3D {
>  			RK3588_CLKSEL_CON(33), 0,
>  			RK3588_CLKGATE_CON(9), 0, GFLAGS,
>  			&rk3588_spdif0_fracmux),
> -	GATE(MCLK_SPDIF0, "mclk_spdif0", "clk_spdif0", 0,
> +	GATE(MCLK_SPDIF0, "mclk_spdif0", "clk_spdif0", CLK_SET_RATE_PARENT,
>  			RK3588_CLKGATE_CON(9), 1, GFLAGS),

[Severity: High]
This is a pre-existing issue, but should the same fix be applied to the I2S
master clocks?  Looking at rk3588_early_clk_branches[], the I2S gates also
lack the CLK_SET_RATE_PARENT flag:

	GATE(MCLK_I2S2_2CH, "mclk_i2s2_2ch", "clk_i2s2_2ch", 0,
			RK3588_CLKGATE_CON(8), 0, GFLAGS),

and:

	GATE(MCLK_I2S0_8CH_TX, "mclk_i2s0_8ch_tx", "clk_i2s0_8ch_tx", 0,
			RK3588_CLKGATE_CON(7), 7, GFLAGS),

If the rockchip_i2s_tdm.c driver calls clk_set_rate() on its mclk_tx or
mclk_rx clocks, will the clock core evaluate the gates as having no .set_ra=
te
capability and return 0 without propagating the request up to the fractional
dividers (e.g., clk_i2s0_8ch_tx_frac)?

Could this cause I2S audio streams with non-default sample rates to play ba=
ck
at incorrect pitches or fail to lock?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820075427.6705=
0-1-karl@asseily.com?part=3D1
