Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793181886;
	b=g2jm5PaBnPDMlidNkMfziuGpGcEkEaeLXp8Ju+/T1s+kZ2OZ3RA9GgFxbnitxDaE/Qwi
	 yVBLERtch8cc2bwnmOCPfWoVPL4wYazJyLo/4BB96nIJC/J2+KTKlGP+7o9oshN7VEsLB
	 JKNMMVCKBQTCjnofpvMCuFJAN5flBJ7lFKrY/9IYMH1duKMmar/EFzhL1f/zey9I9Kvqg
	 NynF7LFH7DPjWjDDP9K2i7PnvXj6+UwOgtPJ9E16LtSX/Nfa/ZEYExAynrUkxmnLncZN5
	 t8uvS/j4MsSGJ9U7VJ1ubVhAdl37R3xDEWwo/HHPK4lz2zUUPZc4k1QtNGF99lVEK6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793181886;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=CQ/2xVuqtCjtfgH6RXT+iueKwGZL/cGeRhXhl2s4LSs=;
	b=wXcXNbXJa0C6nheuo1DXm1I9WBOlp/MpIGB+vACVF7rrQyRHeSxA978Fl38Vm2NxJFb6
	 ReELB0nMv1lxjsSD9N2nfKgPZrMcFX6qNAYvyriyAJ0U+s/PsMjpMOvm+hDvV2Qvr/ucg
	 V6O07251xB4S2cZwfSBNov6RKL6IIdbyh1MOUDz6XkxqZCQPe1hMxGfgraKpUfmJjyIbN
	 G5WZd8jVO1pGVGrvEfZY8wzGim5u5X2E5S5lHtClcSNfxyZL/ae8f6gV5HeWIbvxkRSJk
	 6rBRO/GevzGlUT/+qM37C+kG0AtOnd19W1sZRongmFP0ADb6u1JYhAQw38Dov/RvxNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mGYRvy5E;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB82C606A323;
	Wed, 28 Oct 2026 10:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mGYRvy5E
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A9701F01828;
	Wed, 28 Oct 2026 10:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793181885;
	bh=CQ/2xVuqtCjtfgH6RXT+iueKwGZL/cGeRhXhl2s4LSs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mGYRvy5E+m4Z9GV/OY5pscWJTB6nTH4YXR2PRm27khypOY5Us1Fgu7ZYogRombTcG
	 QXo+rnSCuO+H8+LbzR4117P9f/8SJLOZizbRs954UBwKvityXSMxZghHMnYpOuQymm
	 HjdpiuIY0oBQj9QS8Vk7LTrnpD82U7nC8O/VO1PENIlJRy793oMiR7bfNDbEJjmW2q
	 Gs6MtgOSvVd/okFLaXJW21QgeAbJPR7bJOx44h9o33+IxmrSXMJAK9kvVSYa+SQMD6
	 QXEuduw0/2kSE0pTDqfI6wVGs55KVU3Qe9Bpe5+q8Iykd4nu0AoWdfETSFNvR3dP1P
	 FEA8W3J7j/QXg==
Message-ID: <sashiko-outbox-187717@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/4] clk: rockchip: Add internal support for 24-bit
 fractional dividers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cunhao Lu" <1579567540@qq.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261027-add-board-ok3572-c-clk-v4-2-d4152b4fedaa@qq.com>
References: <20261027-add-board-ok3572-c-clk-v4-0-d4152b4fedaa@qq.com>
 <20261027-add-board-ok3572-c-clk-v4-2-d4152b4fedaa@qq.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Oct 2026 10:04:45 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] clk: rockchip: broken rate calculation in clk_fd_v2_determine_rate=
()
- [Medium] clk: rockchip: broken zero-based divider math in clk_fd_v2_get_d=
ivider()
- [Medium] clk: rockchip: wrong low-bit mask and shift in clk_fd_v2_set_rat=
e()
--

commit dfce7c81ca5864499aad504a0c7023a553587e91
Author: Elaine Zhang <zhangqing@rock-chips.com>

clk: rockchip: Add internal support for 24-bit fractional dividers

This commit adds an internal Rockchip fractional-divider helper and
branch_fraction_divider_v2 clock type for 24-bit fractional dividers that
split numerator and denominator across low (16-bit) and high (8-bit)
registers.

> diff --git a/drivers/clk/rockchip/clk-fractional-divider-v2.c b/drivers/c=
lk/rockchip/clk-fractional-divider-v2.c
> new file mode 100644
> index 0000000000000..102e03f9d6e60
> --- /dev/null
> +++ b/drivers/clk/rockchip/clk-fractional-divider-v2.c

[ ... ]

> +static void clk_fractional_divider_general_approximation_v2(struct clk_h=
w *hw,
> +							    unsigned long rate,
> +							    unsigned long *parent_rate,
> +							    unsigned long *m, unsigned long *n)
> +{
> +	struct clk_fractional_divider_v2 *fd =3D to_clk_fd_v2(hw);
> +	unsigned long scale;
> +
> +	/*
> +	 * Get rate closer to *parent_rate to guarantee there is no overflow
> +	 * for m and n. In the result it will be the nearest rate left shifted
> +	 * by (scale - fd->nwidth) bits.
> +	 *
> +	 * For the detailed explanation see the top comment in this file.
> +	 */
> +	scale =3D fls_long(*parent_rate / rate - 1);
> +	if (scale > fd->nwidth)
> +		rate <<=3D scale - fd->nwidth;
> +
> +	rational_best_approximation(rate, *parent_rate,
> +				    GENMASK(fd->mwidth - 1, 0),
> +				    GENMASK(fd->nwidth - 1, 0),
> +				    m, n);
> +}
> +
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

[Severity: Medium]
In clk_fd_v2_get_divider(), when CLK_FRAC_DIVIDER_ZERO_BASED is set in
fd->flags, (*m)-- and (*n)-- convert the 1-based values from
rational_best_approximation() into 0-based register values before the
*m < 4 compensation block runs.

Does this cause several regressions when CLK_FRAC_DIVIDER_ZERO_BASED is use=
d?

1. If rational_best_approximation() returns *m =3D=3D 0 for a very small ra=
te,
   (*m)-- underflows the unsigned long *m to ULONG_MAX, which bypasses the
   (*m < 4 && *m !=3D 0) check and writes all-ones to the numerator register
   fields.

2. If the 1-based numerator is *m =3D=3D 1 (for example, 1/3), (*m)-- sets
   *m =3D 0, which skips the (*m < 4 && *m !=3D 0) compensation completely.

3. Decrementing *n flips its parity before (*n % 2 =3D=3D 0) is checked, so
   factor =3D 1 is selected when the actual denominator n is odd rather than
   even.

4. Multiplying the already-decremented values by factor produces register
   values (m - 1) * factor and (n - 1) * factor. When clk_fd_v2_recalc_rate=
()
   adds 1 back:

	if (fd->flags & CLK_FRAC_DIVIDER_ZERO_BASED) {
		m++;
		n++;
	}

   the effective ratio becomes ((m - 1) * factor + 1) / ((n - 1) * factor +=
 1)
   instead of m / n (for example, m =3D 3, n =3D 4 becomes 5/7 instead of 3=
/4).

5. Neither clk_fractional_divider_general_approximation_v2() nor
   clk_fd_v2_get_divider() increases the maximum bounds passed to
   rational_best_approximation() from GENMASK(width - 1, 0) to BIT(width)
   when CLK_FRAC_DIVIDER_ZERO_BASED is set.

> +
> +	return 0;
> +}
> +
> +static int clk_fd_v2_determine_rate(struct clk_hw *hw,
> +				    struct clk_rate_request *req)
> +{
> +	struct clk_fractional_divider_v2 *fd =3D to_clk_fd_v2(hw);
> +	unsigned long m, n;
> +	u64 ret;
> +
> +	if (!req->rate || req->rate >=3D req->best_parent_rate) {
> +		req->rate =3D req->best_parent_rate;
> +		return 0;
> +	}
> +
> +	if (fd->approximation)
> +		fd->approximation(hw, req->rate, &req->best_parent_rate, &m, &n);
> +	else
> +		clk_fractional_divider_general_approximation_v2(hw, req->rate,
> +								&req->best_parent_rate,
> +								&m, &n);
> +
> +	ret =3D (u64)req->best_parent_rate * m;
> +	do_div(ret, n);
> +	req->rate =3D ret;
> +
> +	/* Validate the rounded rate that set_rate() will receive. */
> +	return clk_fd_v2_get_divider(hw, req->rate, req->best_parent_rate, &m, =
&n);
> +}

[Severity: High]
Can the interaction between clk_fractional_divider_general_approximation_v2=
(),
clk_fd_v2_determine_rate(), and clk_fd_v2_get_divider() cause valid rate
requests to fail with -EINVAL or program a different divider than expected?

1. In clk_fd_v2_get_divider(), rational_best_approximation() is given the f=
ull
   24-bit range GENMASK(fd->mwidth - 1, 0) and GENMASK(fd->nwidth - 1, 0)
   (16,777,215). If the closest uncompensated ratio has *m < 4 and an odd
   denominator *n > GENMASK(fd->nwidth - 1, 0) / factor (any odd n in
   [4194304, 16777215] for m =3D 1, or [8388608, 16777215] for m =3D 2 or 3=
),
   clk_fd_v2_get_divider() returns -EINVAL instead of choosing a valid 24-b=
it
   approximation (such as an adjacent even denominator where factor =3D 1, =
or an
   approximation constrained so the compensated values fit).

2. clk_fd_v2_determine_rate() computes (m, n) once, floor-truncates req->ra=
te
   to an integer via do_div(ret, n), and then calls clk_fd_v2_get_divider()
   (and later clk_fd_v2_set_rate()), which runs rational_best_approximation=
()
   a second time on the truncated req->rate without updating req->rate.

   Because a 24-bit divider has sub-Hz resolution at typical PLL rates,
   re-approximating the truncated integer rate can pick a different (m, n)
   pair than the first pass. For example:

   - With best_parent_rate =3D 100000000 and req->rate =3D 19, the first pa=
ss
     picks m =3D 1, n =3D 5263158 (even) and truncates req->rate to 18. The
     second pass in clk_fd_v2_get_divider() approximates 18 / 100000000 as
     m =3D 2, n =3D 11111111 (odd), which exceeds 16777215 / 2 and fails wi=
th
     -EINVAL.

   - With a fractional PLL parent such asbest_parent_rate =3D 786431991 and
     req->rate =3D 6144000, the first pass finds the intended divider m =3D=
 1,
     n =3D 128 and truncates req->rate to 6143999. The second pass in
     clk_fd_v2_get_divider() and clk_fd_v2_set_rate() re-approximates
     6143999 / 786431991 as m =3D 51630, n =3D 6608641 instead of 1 / 128.

3. In clk_fractional_divider_general_approximation_v2(), when
   scale =3D fls_long(*parent_rate / rate - 1) exceeds fd->nwidth, rate is
   shifted left by (scale - fd->nwidth) unconditionally without checking
   CLK_FRAC_DIVIDER_POWER_OF_TWO_PS in fd->flags. That causes
   clk_fd_v2_determine_rate() to return a power-of-two multiple of the
   requested rate, whereas clk_fd_v2_get_divider() does not perform that sh=
ift
   (and if rational_best_approximation() saturates to *m =3D 0, *n =3D 1 fo=
r a
   very small rate, clk_fd_v2_get_divider() leaves *m =3D 0 uncompensated,
   causing clk_fd_v2_recalc_rate() to return parent_rate).

> +
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
In clk_hw_register_fractional_divider_v2(), fd->mmask and fd->nmask are
initialized as shifted register masks:

	fd->mshift =3D mshift;
	fd->mwidth =3D mwidth + high_mwidth;
	fd->mmask =3D GENMASK(mwidth - 1, 0) << mshift;
	fd->nshift =3D nshift;
	fd->nwidth =3D nwidth + high_nwidth;
	fd->nmask =3D GENMASK(nwidth - 1, 0) << nshift;

In clk_fd_v2_set_rate(), both m_low and n_low are masked with fd->nmask and
then shifted by fd->mshift and fd->nshift when writing fd->reg. Shouldn't
m_low and n_low be masked with unshifted masks for their respective low
widths (or shifted first and then masked with fd->mmask and fd->nmask)?

Also, clk_fd_v2_set_rate() extracts m_high and n_high using the configured
low widths (fd->mwidth - fd->high_mwidth) and (fd->nwidth - fd->high_nwidth=
),
whereas clk_fd_v2_recalc_rate() hardcodes a 16-bit shift:

	m =3D (m_high << 16) | m_low;
	n =3D (n_high << 16) | n_low;

Should clk_fd_v2_recalc_rate() shift m_high and n_high by the configured low
widths as well so both functions stay consistent if a width other than 16 is
passed to COMPOSITE_FRAC_V2() or rockchip_clk_register_frac_v2()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027-add-board-=
ok3572-c-clk-v4-0-d4152b4fedaa@qq.com?part=3D2
