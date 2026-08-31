Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF67D391836
	for <linux-clk@vger.kernel.org>; Mon, 31 Aug 2026 16:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788195443; cv=none; b=kHDbIEcssGzOlWXfTfF39xriA9hMDK0tRLdw0pGOf/LWPWVbz5ubhK92XQshAnSlRpcgFXcmhP+mlz8NJrhUkEPRh1E8nkwksAA4iApw/Jz/bS2XElX/vccQOCc/DO/tSBefXAaq0nWGkG2BZAzxrLzDtbKlJxjMkN7Bon2PzU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788195443; c=relaxed/simple;
	bh=Yps6jnL85K4UDHuZDkjj/GwXtHEA7ZWe5UxzvuzL9mM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Bz2Rxcr0DZilHGOkPvQDDhcP0x9VTYL02WdGicSkncaNaFF9eTkCJ1X/8iyaWJtpcdCakHToUhg4pxKnf+4138WkMLjVVYZm/iQxvD9mOaAKMSBCCvYOlr/PLpjSnAyy5RCowZ5u2qinMfK6vRXkShz2v6fJAOgZKx9eoAYxee0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FLqDkW7Q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FLqDkW7Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B1851F000E9;
	Mon, 31 Aug 2026 16:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788195442;
	bh=V5R0MlG9bk/3ekVueuWnv9Bw2qrVNc6T1Bk57oNyP64=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FLqDkW7QlG3NYsp9eR6VV3LQOW1bdKosIMMtrMuhqiJfkYK4lfZJI8SZzsJ293aMR
	 4sS8qANfG+lMBOK6SEKoBMhTqIv/CLU0+u+eAQVLTBn7fwwQPTUv09PaMIXHcrgEDC
	 +CDqOMrxfjvTGWCATE/RjWS+Otfztnt5H12XK2Bjj5oqgP43jdCE+PuwX8caZzpqH6
	 gNjyZ313eAbwM+ih3vdWypEp6V/jZGjyTdOA6x5QTVrZ4FmJgJM/6P+CEylKbjTQAA
	 QIryEISm4Q3mazKqIe/pC/3iiAtNo+Ca465/jhdO0aahumgJmCze7/FxDEqtl6PkhI
	 JG5fPTYWLulrA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH AUTOSEL 6.18] clk: samsung: exynos990: Fix PERIC0/1 USI
 clock types
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Levin" <sashal@kernel.org>
Cc: linux-clk@vger.kernel.org
In-Reply-To: <20260831133314.4125787-512-sashal@kernel.org>
References: <20260831133314.4125787-1-sashal@kernel.org>
 <20260831133314.4125787-512-sashal@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 16:57:21 +0000
Message-Id: <20260831165722.2B1851F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The patch introduces a significant mismatch between the commit m=
essage and the code by failing to add the CLK_SET_RATE_PARENT flag to the U=
ART dividers and leaf gate clocks.
--

commit 2775b50651cf5053c13e282c77800e616a6622f6
Author: Denzeel Oliva <wachiturroxd150@gmail.com>

clk: samsung: exynos990: Fix PERIC0/1 USI clock types

This commit changes USI and UART user muxes to use nMUX() to allow
reparenting between OSC and CMU IP. It also updates USI dividers to use
DIV_F() with CLK_SET_RATE_PARENT so rate requests propagate upward.

Link: https://patch.msgid.link/20260528-perics-usi-v1-1-13a6ee4d1a6f@gmail.=
com

> Use nMUX() for USI and UART user muxes to allow reparenting between
> OSC and CMU IP output when changing rates, and use DIV_F() with
> CLK_SET_RATE_PARENT on their dividers and gates so rate requests
> propagate upward.

[Severity: Medium]
The commit message states that CLK_SET_RATE_PARENT is applied to both the
dividers and the gates for USI and UART. However, the patch does not modify
any of the leaf gate clocks (such as CLK_GOUT_PERIC0_TOP0_IPCLK_5 for USI or
the UART gates) to include the CLK_SET_RATE_PARENT flag.

Without this flag on the gates, when a peripheral driver calls clk_set_rate=
()
on the leaf gate clock provided by the device tree, clk_calc_new_rates() wi=
ll
return -EINVAL because the gate lacks the flag and has no .set_rate callbac=
k.
Does this code also need to update the gate clocks to match the commit
message and ensure upward rate requests propagate correctly?

> diff --git a/drivers/clk/samsung/clk-exynos990.c b/drivers/clk/samsung/cl=
k-exynos990.c
> index 6277dd557fab6..4385c3b76dd68 100644
> --- a/drivers/clk/samsung/clk-exynos990.c
> +++ b/drivers/clk/samsung/clk-exynos990.c
> @@ -1602,42 +1592,42 @@ static const struct samsung_div_clock peric0_div_=
clks[] __initconst =3D {
>  	DIV(CLK_DOUT_PERIC0_UART_DBG, "dout_peric0_uart_dbg",
>  	    "mout_peric0_uart_dbg",
>  	    CLK_CON_DIV_DIV_CLK_PERIC0_UART_DBG,
>  	    0, 4),

[Severity: Medium]
The commit message mentions applying DIV_F() and CLK_SET_RATE_PARENT to the
UART dividers as well, but CLK_DOUT_PERIC0_UART_DBG is left as a standard
DIV() here. Does this UART divider also need to be converted to DIV_F()
with CLK_SET_RATE_PARENT so that its rate requests propagate upward?

[ ... ]

> @@ -2167,46 +2146,46 @@ static const struct samsung_div_clock peric1_div_=
clks[] __initconst =3D {
>  	DIV(CLK_DOUT_PERIC1_UART_BT, "dout_peric1_uart_bt",
>  	    "mout_peric1_uart_bt_user",
>  	    CLK_CON_DIV_DIV_CLK_PERIC1_UART_BT,
>  	    0, 4),

[Severity: Medium]
Similarly, CLK_DOUT_PERIC1_UART_BT was left unmodified. Does this divider
also need the CLK_SET_RATE_PARENT flag for rate propagation to function
correctly?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831133314.4125=
787-512-sashal@kernel.org?part=3D1
