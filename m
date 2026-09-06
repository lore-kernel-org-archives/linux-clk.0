Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8DDA3D9DAA;
	Sun,  6 Sep 2026 14:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788704761; cv=none; b=GapM3ho0sZvNUz0qH0tFadxc0BHNzfWQ/TfUKUTsNyuL+kk5BMbGhCa8cUXMoB6VCqlcK/+BlJvorE+hZX9T/5kBTOjT9HuIsVwR490V8tBvWdLz/4MhEkbj8CqJgKn0lJrfDUziHWCfI3JR9J8R9BZ10nqq4fl8b4fAzEsLr4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788704761; c=relaxed/simple;
	bh=0uPK6/BFF4bKiK6/K5F7pFhCOYPBTy9nMRgZhdUZ7Tc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=P+glN3lxeQSmukfCCo0a/7LwtUHFyYwtTXmdin9ojy7sGd6mcGhyKrAMqueCu0kRKbPntsWS4AObm0YTAEgAnxpjHPZ5R8eucV9K3wcwnQgCIjr8LTV1HzUcbyE+IQo4n43cYuTz9TKcK218k5NTejq7IGxt3/Qx4W6NE2+fph4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jrIPMy3d; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jrIPMy3d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17FE91F00A3A;
	Sun,  6 Sep 2026 14:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788704759;
	bh=ZJf1w9hS+JGOqo/ivf3DO2N65XFyKyhAFxk9jDhW5sU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jrIPMy3d+3oyJ+pj+MGEBPlyRYGD/FdqfJStqguiW9Fa5TwzDi8MQstCANxDBCgoa
	 LY6HNxI/6TzKkmKVsb8d1wPTXsgOySXbox0Sj6FELJVEkF/YuSQ+l5Cb7cQopaUofT
	 af0BzHGLR4lsmmWs8NBUExuQ7wElroMSWDnmcaejSQXWi0Ag2i+PTgzgCR4GncAD+U
	 kXfRioGZ6OKgNP/gM9ZGjGwxk/IOX6ttoAOUyWcz0vJ27kc00AA4RS/CyiCagONQfW
	 cO8IdZcUlFsvNnVqFdVTwCVE72jGuhh42QmPGCYI5z6X7pmqub8XSm9/NtmwjbvEy0
	 ZB3wefucuZ84Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 07/12] clk: qcom: ipq-cmn-pll: Add PON reference
 clock support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luo Jie" <jie.luo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260906-qcom_ipq5210_cmnpll-v4-7-aec5ed642f4f@oss.qualcomm.com>
References: <20260906-qcom_ipq5210_cmnpll-v4-0-aec5ed642f4f@oss.qualcomm.com>
 <20260906-qcom_ipq5210_cmnpll-v4-7-aec5ed642f4f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 06 Sep 2026 14:25:58 +0000
Message-Id: <20260906142559.17FE91F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] clk_pon_clk_determine_rate() incorrectly fails valid rate requests=
 due to rounding at bound edges.
--

commit 9a9a4823a8ebca7e3c30590799eb2ac41ada876e
Author: Luo Jie <jie.luo@oss.qualcomm.com>

clk: qcom: ipq-cmn-pll: Add PON reference clock support

This commit adds support for the PON reference clock to the IPQ CMN PLL dri=
ver.
It configures the clock to operate in either UNIPHY mode with a fixed 31.25=
 MHz
rate, or PON mode using an 8-bit divider derived from the parent rate.

> diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pl=
l.c
> index 44d035870a89b..f12352a707f7a 100644
> --- a/drivers/clk/qcom/ipq-cmn-pll.c
> +++ b/drivers/clk/qcom/ipq-cmn-pll.c
[ ... ]
> +static int clk_pon_clk_determine_rate(struct clk_hw *hw,
> +				      struct clk_rate_request *req)
> +{
> +	unsigned long div, pon_rate, uniphy_rate =3D 31250000UL;
> +	bool uniphy_rate_valid, pon_rate_valid;
> +
> +	if (!req->rate || !req->best_parent_rate)
> +		return -EINVAL;
> +
> +	div =3D DIV64_U64_ROUND_CLOSEST((u64)req->best_parent_rate, req->rate);
> +
> +	/* Clamp to valid range (1-255) */
> +	div =3D clamp_t(unsigned long, div, 1, 255);
> +
> +	pon_rate =3D DIV_ROUND_CLOSEST_ULL((u64)req->best_parent_rate, div);
> +
> +	uniphy_rate_valid =3D uniphy_rate >=3D req->min_rate &&
> +			    uniphy_rate <=3D req->max_rate;
> +	pon_rate_valid =3D pon_rate >=3D req->min_rate &&
> +			 pon_rate <=3D req->max_rate;
> +
> +	if (!uniphy_rate_valid && !pon_rate_valid)
> +		return -EINVAL;

[Severity: High]
Will this logic incorrectly reject valid rate requests when the closest
divider falls slightly outside the boundaries due to rounding?

If a client restricts the bounds (e.g., via clk_set_min_rate), the requested
rate is clamped to the bounds. If calculating the closest divider for that
rate yields a frequency that barely misses the min_rate or max_rate bound,=
=20
pon_rate_valid becomes false and this returns -EINVAL.

Should this code check adjacent dividers (such as div - 1 or div + 1) to see
if they yield a rate strictly within the requested bounds before giving up?

> +
> +	/* Pick whichever mode gets closer to the requested rate */
> +	if (uniphy_rate_valid && pon_rate_valid) {
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260906-qcom_ipq52=
10_cmnpll-v4-0-aec5ed642f4f@oss.qualcomm.com?part=3D7
