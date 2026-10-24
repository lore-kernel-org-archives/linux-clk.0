Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792838106;
	b=xmgOA6ta7cywqKFK7xWBbTiYWmM0Shln1pF3XFyGAvbXzinI7cj/wPe5iGW9qH6HSzzH
	 GMZVlBgqO9EYiv7+PSBomJTRgrO9LjsrDwSDg5sr2o4m8fLnT4sg2I/GkGvTyGYQjFlK7
	 fCo8nKzx8UPLFy5XUOIgAdvqCOerzZd9x08oGSbWPZUoVHUfDjY7WUOxBoYTTi0AQ0stq
	 4IABesNiTkGQ+vqtpZC7DQ778X/qTNkvybtoDYx5XKLnTsU2qu70I3pQVYfNy7oHvckfo
	 je+2c1Keoba8htv4b8OSQ8c04Q4lsJTwHfw+xFeOLHjm0vbI0nIgOMd2z4gy4bdE7Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792838106;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=JGZAyCfHQCpkCJjI7NsK9bMmB4Fj+DMuMDpfTh+tpcc=;
	b=kuyI9WpkhhJSHhjhctZ6Y50WnBzkCmZ4bCt1t/1QE+IBCeqmt35GbZrQMue40WL1+TaQ
	 PjU6b0XlIYFCjA9BVQqllQc3lowBHI38b01SdcPaOFoYtpcnsJagSPlM73dRqPZraOaw4
	 +Oddla+aeVsbTMwWLoG8R9N7mdlWmPMFdi8p5RoFizXnFKNXbGkpMhHwU+bw+2o/sRTLA
	 lCjfB2uRO+iCT82uKJYJeRJWUkr0ykO5qWmLFXO0z6nBz7+ZB6A8+VCrVCnxkD/I1LEDE
	 kXtbXxTVGiV7+/BsMeLzHcyNNxHHm+nfx6egHBIn7hpyXj7CQCN1jUZZnKw8nrTZjDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KgJizdDE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A41606A31D;
	Sat, 24 Oct 2026 10:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KgJizdDE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 813C91F01828;
	Sat, 24 Oct 2026 10:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792838105;
	bh=JGZAyCfHQCpkCJjI7NsK9bMmB4Fj+DMuMDpfTh+tpcc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KgJizdDEayJMV09X3w8klI0/QMqm0nD1j5CuT3P+S8ssRmZYoMRPYBRa3QralHF4e
	 V7S7G7LJV2qF+BAtNApGQ6nnqqifOODa8oi8s5lbjJUGEfkIjWI4tcxVfQrapcy9NI
	 psDfog0ddk/cC+GsJ8mOmQMZIHCRjVInYbYCnbRr8vNlEFbY+H0Fx1uou3rTeQGwVM
	 JSUmQCfzrpNGn4O7k7lBQstE/LngvusKSxVbHDuDTEle+uMuIWppepMlGWjbXeDvwV
	 muNEe8Vku2rUlvSvwz5YbFGw/nvKUcCxEgI8VyzphO3i6c7n+8CUTgm1ACY7n2/XDw
	 fPislacpkKqag==
Message-ID: <sashiko-outbox-183649@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] clk: rockchip: Add internal support for 24-bit
 fractional dividers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cunhao Lu" <1579567540@qq.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261023-add-board-ok3572-c-clk-v2-2-90b98836be6e@qq.com>
References: <20261023-add-board-ok3572-c-clk-v2-0-90b98836be6e@qq.com>
 <20261023-add-board-ok3572-c-clk-v2-2-90b98836be6e@qq.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 24 Oct 2026 10:35:05 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] clk: rockchip: double-counted high_nwidth in clk_fd_v2_set_rate() =
mask
--

commit ff752d6d0f06073d53779cab9bd1294682b4f0b0
Author: Elaine Zhang <zhangqing@rock-chips.com>

clk: rockchip: Add internal support for 24-bit fractional dividers

This commit adds internal support and a clock branch type for Rockchip
24-bit fractional dividers whose numerator and denominator are split across
a 16-bit low register and an 8-bit high register.

> diff --git a/drivers/clk/rockchip/clk-fractional-divider-v2.c b/drivers/c=
lk/rockchip/clk-fractional-divider-v2.c
> new file mode 100644
> index 0000000000000..5ab2c43180661
> --- /dev/null
> +++ b/drivers/clk/rockchip/clk-fractional-divider-v2.c

[ ... ]

> +static int clk_fd_v2_set_rate(struct clk_hw *hw, unsigned long rate,
> +			      unsigned long parent_rate)
> +{
> +	struct clk_fractional_divider_v2 *fd =3D to_clk_fd_v2(hw);
> +	unsigned long flags =3D 0;
> +	unsigned long m, n, m_low, n_low, m_high, n_high;
> +	u32 val, val_high;
> +
> +	rational_best_approximation(rate, parent_rate,
> +				    GENMASK(fd->mwidth - 1, 0),
> +				    GENMASK(fd->nwidth - 1, 0),
> +				    &m, &n);
> +
> +	if (fd->flags & CLK_FRAC_DIVIDER_ZERO_BASED) {
> +		m--;
> +		n--;
> +	}
> +	/*
> +	 * When compensation the fractional divider,
> +	 * the [1:0] bits of the numerator register are omitted,
> +	 * which will lead to a large deviation in the result.
> +	 * Therefore, it is required that the numerator must
> +	 * be greater than 4.
> +	 *
> +	 * Note that there are some exceptions here:
> +	 * If there is an even frac div, we need to keep the original
> +	 * numerator(<4) and denominator. Otherwise, it may cause the
> +	 * issue that the duty ratio is not 50%.
> +	 */
> +	if (m < 4 && m !=3D 0) {
> +		if (n % 2 =3D=3D 0)
> +			val =3D 1;
> +		else
> +			val =3D DIV_ROUND_UP(4, m);
> +
> +		n *=3D val;
> +		m *=3D val;
> +		if (n > GENMASK(fd->nwidth + fd->high_nwidth - 1, 0)) {
> +			pr_debug("%s n(%ld) is overflow, use mask value\n",
> +				 __func__, n);
> +			n =3D GENMASK(fd->nwidth + fd->high_nwidth - 1, 0);
> +		}
> +	}

[Severity: High]
Does this overflow check in clk_fd_v2_set_rate() double-count
fd->high_nwidth and allow n to overflow the 24-bit denominator register?

In clk_hw_register_fractional_divider_v2(), fd->nwidth is already
initialized to the combined width of the low and high registers:

	fd->nwidth =3D nwidth + high_nwidth;
	...
	fd->high_nwidth =3D high_nwidth;

For a 24-bit divider (16-bit low + 8-bit high), fd->nwidth is 24 and
fd->high_nwidth is 8, so GENMASK(fd->nwidth + fd->high_nwidth - 1, 0)
evaluates to 32 bits (0xffffffff) instead of 24 bits (0xffffff).

When rational_best_approximation() returns m in {1, 2, 3} and an odd n
such that n * val exceeds 0xffffff (for example, m =3D 1 and n =3D 0x400001,
giving m =3D 4 and n =3D 0x1000004), the overflow check does not trigger.
Subsequent register extraction in clk_fd_v2_set_rate():

	n_low =3D n & fd->nmask;
	...
	n_high =3D (n & GENMASK(fd->nwidth - 1, (fd->nwidth - fd->high_nwidth))) >>
		 (fd->nwidth - fd->high_nwidth);

only extracts bits [23:0], silently truncating the upper bits of n while
keeping the scaled m.

Also, if the mask is changed to GENMASK(fd->nwidth - 1, 0), wouldn't
clamping only n to the maximum mask after multiplying both m and n by val
distort the m / n ratio instead of keeping the unscaled m and n when
n * val overflows?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023-add-board-=
ok3572-c-clk-v2-0-90b98836be6e@qq.com?part=3D2
