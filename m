Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793084230;
	b=zskAng6daAIDrTwylkx2liGPPwO0WQjiPkPmVs6ByMihTTxXzzKEltLOfTpU5rxGk0U9
	 Rg22QqYCXQ7ZGmotmpgizdG3UgK1dPf52D2y1dqUgqHJX5oMhGg7+ASn/ZpjBOAcx5V+Y
	 2A3e/UYcWY6HsznfPvWUIEQPZAmSef4YMDsjSa/GBdssH2PjT0TAJPiyMFwyPB0JXuuLE
	 rLK2iGA+yLXeGKnQe/fmXe3R+WjqJ5JfMwA6DgwesZKZr6zLUWAxS6LnUynGd2pPniZKX
	 q7LH+EaSjkAbHudfWo/jYlpyhoQq2A1+8OfxpDwmTANWk5Mn31Sat2+B1pEt/SK3uvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793084230;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ovAq067dY7LLmpmjEWvt1XMlmDANlSaC85Wg4RXeSuI=;
	b=F3sIqVt9VsrtAOl/I/VI2+4rKJC0hszmi3JvYrgjjtnKGyw0VVO/SRdlzvb5vwfHYiEV
	 PitMr7fNMLQdVTiz1B0cJXcZy9UiDPTfimUm1aKYlgApfQBMENIrvSO3gfG3j1+UJkCMG
	 noQBn5iU7JKxxLyKSzCVgPdDXQj+G1wKo2T4pjYjmLYwnZkOOFLsdyv1sqNHldT9m9KO8
	 qQZDKP1xIgInpYN0HvS5w6+C4vmukg+ZG64W3vPFEDWoCZcSFC569ceS1vIueuXiGGsCC
	 oXCMgow8092ojx1z9fT52RDMK4N0709N1031OqvqpjvZ8XxRBa59Mf6bB065AhFkgag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=agzyeTnr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00AA3606A31A;
	Tue, 27 Oct 2026 06:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=agzyeTnr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CD551F031E0;
	Tue, 27 Oct 2026 06:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793084229;
	bh=ovAq067dY7LLmpmjEWvt1XMlmDANlSaC85Wg4RXeSuI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=agzyeTnrMRsIVkolvI24piingYTQw40hDLmg0LCC+P1WX/97aBekDNbhxMNZnMf+d
	 4Bkf9XPocHtW6wD0fy9P+Yy1nfjVwk168UwlORguBXObdaKcePv/BGY8hhTbVoK97S
	 0CnM/AVEyxnpsCe7stLGK2gpNFMkoGQ/IQAJ8dLTQzH6+UFvhujpBMB4h8KOSh6HRp
	 DKoHmHUG6A737Qy/04XL5qRFHLFESu7tM0W5p7yDZQnIhSYToLHoywXK94gbfhvoU9
	 7+eQ0ozjtXm9nE4Dc4lTMnp4T7QlMjlEpGEgnlmd85yDRQm5hwo6mTU0Sbjnv4iq30
	 /HCxptIHiQX8g==
Message-ID: <sashiko-outbox-186174@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] clk: rockchip: Add internal support for 24-bit
 fractional dividers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cunhao Lu" <1579567540@qq.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261026-add-board-ok3572-c-clk-v3-2-dbabfa39d692@qq.com>
References: <20261026-add-board-ok3572-c-clk-v3-0-dbabfa39d692@qq.com>
 <20261026-add-board-ok3572-c-clk-v3-2-dbabfa39d692@qq.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 06:57:08 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] clk: rockchip: wrong mask in clk_fd_v2_set_rate() and shift in r=
ecalc_rate()
- [Medium] clk: rockchip: broken zero-based compensation in clk_fd_v2_get_d=
ivider()
--

commit d65663131f525c31a7aee9ed1c977edb08e8fda0
Author: Elaine Zhang <zhangqing@rock-chips.com>

clk: rockchip: Add internal support for 24-bit fractional dividers

This commit adds an internal fractional-divider helper and clock branch type
for Rockchip 24-bit fractional dividers that split the numerator and
denominator across a low register and a high register.

> diff --git a/drivers/clk/rockchip/clk-fractional-divider-v2.c b/drivers/c=
lk/rockchip/clk-fractional-divider-v2.c
> new file mode 100644
> index 0000000000000..102e03f9d6e60
> --- /dev/null
> +++ b/drivers/clk/rockchip/clk-fractional-divider-v2.c
> @@ -0,0 +1,354 @@

[ ... ]

> +static unsigned long clk_fd_v2_recalc_rate(struct clk_hw *hw,
> +					   unsigned long parent_rate)
> +{
> +	struct clk_fractional_divider_v2 *fd =3D to_clk_fd_v2(hw);
> +	unsigned long flags =3D 0;
> +	unsigned long m_low, n_low, m_high, n_high, m, n;
> +	u32 val_low, val_high;
> +	u64 ret;
> +
> +	if (fd->lock)
> +		spin_lock_irqsave(fd->lock, flags);
> +	else
> +		__acquire(fd->lock);
> +
> +	val_low =3D clk_fd_v2_readl(fd, fd->reg);
> +	val_high =3D clk_fd_v2_readl(fd, fd->high_reg);
> +
> +	if (fd->lock)
> +		spin_unlock_irqrestore(fd->lock, flags);
> +	else
> +		__release(fd->lock);
> +
> +	m_low =3D (val_low & fd->mmask) >> fd->mshift;
> +	n_low =3D (val_low & fd->nmask) >> fd->nshift;
> +	m_high =3D (val_high & fd->high_mmask) >> fd->high_mshift;
> +	n_high =3D (val_high & fd->high_nmask) >> fd->high_nshift;
> +	m =3D (m_high << 16) | m_low;
> +	n =3D (n_high << 16) | n_low;
> +
> +	if (fd->flags & CLK_FRAC_DIVIDER_ZERO_BASED) {
> +		m++;
> +		n++;
> +	}

[ ... ]

> +static int clk_fd_v2_get_divider(struct clk_hw *hw, unsigned long rate,
> +				 unsigned long parent_rate,
> +				 unsigned long *m, unsigned long *n)
> +{
> +	struct clk_fractional_divider_v2 *fd =3D to_clk_fd_v2(hw);
> +	u32 factor;
> +
> +	rational_best_approximation(rate, parent_rate,
> +				    GENMASK(fd->mwidth - 1, 0),
> +				    GENMASK(fd->nwidth - 1, 0),
> +				    m, n);
> +
> +	if (fd->flags & CLK_FRAC_DIVIDER_ZERO_BASED) {
> +		(*m)--;
> +		(*n)--;
> +	}
> +	/*
> +	 * When compensation the fractional divider,
> +	 * the [1:0] bits of the numerator register are omitted,
> +	 * which will lead to a large deviation in the result.
> +	 * Therefore, it is required that the numerator must
> +	 * be at least 4.
> +	 *
> +	 * Note that there are some exceptions here:
> +	 * If there is an even frac div, we need to keep the original
> +	 * numerator(<4) and denominator. Otherwise, it may cause the
> +	 * issue that the duty ratio is not 50%.
> +	 */
> +	if (*m < 4 && *m !=3D 0) {
> +		if (*n % 2 =3D=3D 0)
> +			factor =3D 1;
> +		else
> +			factor =3D DIV_ROUND_UP(4, *m);
> +
> +		if (*m > GENMASK(fd->mwidth - 1, 0) / factor ||
> +		    *n > GENMASK(fd->nwidth - 1, 0) / factor)
> +			return -EINVAL;
> +
> +		*n *=3D factor;
> +		*m *=3D factor;
> +	}
> +
> +	return 0;
> +}

[Severity: Medium]
When CLK_FRAC_DIVIDER_ZERO_BASED is set in fd->flags, does decrementing *m
and *n before the low-numerator compensation block in clk_fd_v2_get_divider=
()
corrupt the divider ratio?

In clk_fd_v2_recalc_rate(), the register values are incremented by 1 before
calculating the rate:

	if (fd->flags & CLK_FRAC_DIVIDER_ZERO_BASED) {
		m++;
		n++;
	}

However, clk_fd_v2_get_divider() decrements *m and *n right after
rational_best_approximation(), and then runs the compensation logic on the
decremented values:

1. The parity check (*n % 2 =3D=3D 0) tests the decremented register value =
(n - 1)
   rather than the actual denominator n.
2. When the approximated numerator m is 1, (*m)-- sets *m to 0, which skips
   the (*m < 4 && *m !=3D 0) compensation entirely.
3. For 1 < m <=3D 4, multiplying the already-decremented (m - 1) and (n - 1=
) by
   factor produces register values that hardware and clk_fd_v2_recalc_rate()
   evaluate as ((m - 1) * factor + 1) / ((n - 1) * factor + 1) instead of
   m / n.
4. If rational_best_approximation() returns *m =3D=3D 0, (*m)-- underflows
   unsigned long to ULONG_MAX, bypassing the *m < 4 check and writing all-o=
nes
   into the numerator register fields.

Should the CLK_FRAC_DIVIDER_ZERO_BASED adjustment happen after the
compensation multiplication (or should rational_best_approximation() bound
the maximum numerator and denominator to 1 << width before decrementing)?

[ ... ]

> +static int clk_fd_v2_set_rate(struct clk_hw *hw, unsigned long rate,
> +			      unsigned long parent_rate)
> +{
> +	struct clk_fractional_divider_v2 *fd =3D to_clk_fd_v2(hw);
> +	unsigned long flags =3D 0;
> +	unsigned long m, n, m_low, n_low, m_high, n_high;
> +	u32 val, val_high;
> +	int ret;
> +
> +	ret =3D clk_fd_v2_get_divider(hw, rate, parent_rate, &m, &n);
> +	if (ret)
> +		return ret;
> +
> +	if (fd->lock)
> +		spin_lock_irqsave(fd->lock, flags);
> +	else
> +		__acquire(fd->lock);
> +
> +	m_low =3D m & fd->nmask;
> +	n_low =3D n & fd->nmask;
> +	m_high =3D (m & GENMASK(fd->mwidth - 1, (fd->mwidth - fd->high_mwidth))=
) >>
> +		 (fd->mwidth - fd->high_mwidth);
> +	n_high =3D (n & GENMASK(fd->nwidth - 1, (fd->nwidth - fd->high_nwidth))=
) >>
> +		 (fd->nwidth - fd->high_nwidth);
> +
> +	val_high =3D clk_fd_v2_readl(fd, fd->high_reg);
> +	val_high &=3D ~(fd->high_mmask | fd->high_nmask);
> +	val_high |=3D (m_high << fd->high_mshift) | (n_high << fd->high_nshift);
> +
> +	clk_fd_v2_writel(fd, fd->high_reg, val_high);
> +
> +	val =3D clk_fd_v2_readl(fd, fd->reg);
> +	val &=3D ~(fd->mmask | fd->nmask);
> +	val |=3D (m_low << fd->mshift) | (n_low << fd->nshift);
> +	clk_fd_v2_writel(fd, fd->reg, val);

[Severity: Medium]
In clk_fd_v2_set_rate(), m_low and n_low are both masked with fd->nmask
before being shifted by fd->mshift and fd->nshift:

	m_low =3D m & fd->nmask;
	n_low =3D n & fd->nmask;
	...
	val |=3D (m_low << fd->mshift) | (n_low << fd->nshift);

Looking at clk_hw_register_fractional_divider_v2(), fd->mmask and fd->nmask
are initialized as pre-shifted register masks:

	fd->mshift =3D mshift;
	fd->mwidth =3D mwidth + high_mwidth;
	fd->mmask =3D GENMASK(mwidth - 1, 0) << mshift;
	fd->nshift =3D nshift;
	fd->nwidth =3D nwidth + high_nwidth;
	fd->nmask =3D GENMASK(nwidth - 1, 0) << nshift;

Doesn't masking m with fd->nmask apply the denominator mask instead of the
unshifted low-numerator mask (fd->mmask >> fd->mshift), and wouldn't any
non-zero fd->nshift cause n_low to be masked with already-shifted bits and
then shifted by fd->nshift a second time?

Also, while clk_fd_v2_set_rate() splits the high bits at
(fd->mwidth - fd->high_mwidth) and (fd->nwidth - fd->high_nwidth),
clk_fd_v2_recalc_rate() hardcodes a shift of 16:

	m =3D (m_high << 16) | m_low;
	n =3D (n_high << 16) | n_low;

Should clk_fd_v2_recalc_rate() shift m_high and n_high by
(fd->mwidth - fd->high_mwidth) and (fd->nwidth - fd->high_nwidth) as well so
both functions agree when the low field width is not 16?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026-add-board-=
ok3572-c-clk-v3-0-dbabfa39d692@qq.com?part=3D2
