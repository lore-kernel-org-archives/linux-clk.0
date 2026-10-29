Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793267276;
	b=wkn0Gzq7heUfaxn7HBHZ6ck/toqROMvOTedV0vb1Z5HLLRNKZHJHFAv2YvFHQbQ42hCK
	 y0gOVzaF6Ic6UUrC25oSPu8J3K0z8cARJAAwRj5CZjY7ElXBgAzhRYXULCfG2hWTOtpiG
	 KLSG/XeKaMrIRm5AjtrkHwUKogrRk2bodWF/NUaEWlfdDFJtu1UVQQFhuLTfbs0hCQjqs
	 J9tIut1FmDLCSDvsypZVR4nd7VwIUlGO1uaii7uJ7pnzbxblZcpczVHMVlj4vNjuuLIay
	 5n8TrkKGM+Z+Nc1dlnoeCSwYg99smy0crloSltHVXrq1KXbW8bvEFxiBnZHklqXmuIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793267276;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=/mskCAFxLZ+COhVPqAHcLrZn7vGJxbkrJ1/AStDRBmw=;
	b=E7arY4q8c3wcUCXtL3eQyu0wpft4CF48scNb0imFBwt4JQWngZDpjByVEejlhdkfSd4r
	 dNXPZG7x3+seKg9AcW8AAr14T1PTtQtpjU/uXstlwAzFwSdmCDg7J3ZT4sOAHv6YUgkmB
	 Qh8nzXTTsPcf6n8cnphvXmWOdmtnAic7oQxXe5Ad8wYDWWiPHjLvaM7hyaZRDtAbyGK0t
	 gbdzOzxQ0kfwM4jucuRWQMS4cIk57PTrt0MyQijNxvrn6VHJTMiRNTu1F+Pf3RLmZvurY
	 mfpPU6pNGtoCHlIv4FZLd4eZIkVPMxsTquxn1JwHNFve0H+KSmCBJjcBkJCtUIKKKyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QVJLq56d;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBF5606A31E;
	Thu, 29 Oct 2026 09:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QVJLq56d
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 422AC1F01825;
	Thu, 29 Oct 2026 09:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793267275;
	bh=/mskCAFxLZ+COhVPqAHcLrZn7vGJxbkrJ1/AStDRBmw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QVJLq56d9MLEwEOOO8aOB2B3vUo+cAT20hqEu4xUTfdLWYcWAWL8xxDlMKuLbqQIX
	 D+Fqpg3ldBdejPJJm0OE5uLglHjha+aYpC8EvscVLebx9hp5zhG/ib12dQJH6sDCP3
	 Uh5oE1MWxsEhuAhfuHvJTxXLG3OBnKc+f7o0tEPd8r3B8YPLstPPSdeVFW24qsYfSL
	 J9P8L6dxccbLCPKWwpx+f9/k3ViEwtVfC/BzVENXsCBYPUdMtHRiuBc5JzxqixJMKq
	 BCIiClSP8NSKDxqzxxme8GEE/q2nVTgiSUSJBhd0xX1Twd7zOtXsLkw1mZqAMJrOIz
	 goWlzVij2nRfQ==
Message-ID: <sashiko-outbox-189068@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC RFT v2 2/3] clk: divider: add
 CLK_DIVIDER_INVALID_ZERO flag
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jian Hu" <jian.hu@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20261029-meson_refactor_n-v2-2-ff4ac74e527b@amlogic.com>
References: <20261029-meson_refactor_n-v2-0-ff4ac74e527b@amlogic.com>
 <20261029-meson_refactor_n-v2-2-ff4ac74e527b@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Oct 2026 09:47:54 +0000
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
- [High] clk: divider: unhandled zero divisor in divider_ro_determine_rate()
--

commit 5ec3118aee2f03855552c58a4a8533e035b565bc
Author: Jian Hu <jian.hu@amlogic.com>

clk: divider: add CLK_DIVIDER_INVALID_ZERO flag

This commit introduces the CLK_DIVIDER_INVALID_ZERO flag for dividers where
a zero divisor value represents an invalid hardware state rather than a
pass-through. When this flag is set and the divisor evaluates to zero,
divider_recalc_rate() returns 0 without emitting a warning.

> diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
> index f68216c65d3df..6c1523d22477c 100644
> --- a/drivers/clk/clk-divider.c
> +++ b/drivers/clk/clk-divider.c
> @@ -143,6 +143,9 @@ unsigned long divider_recalc_rate(struct clk_hw *hw, =
unsigned long parent_rate,
> =20
>  	div =3D _get_div(table, val, flags, width);
>  	if (!div) {
> +		if (flags & CLK_DIVIDER_INVALID_ZERO)
> +			return 0;

[Severity: High]
Should divider_ro_determine_rate() in drivers/clk/clk-divider.c also handle
a zero divisor when CLK_DIVIDER_INVALID_ZERO or CLK_DIVIDER_ALLOW_ZERO is
set?

When a read-only divider has a register value val that maps to div =3D=3D 0=
 via
_get_div() (for example, when CLK_DIVIDER_INVALID_ZERO is combined with
CLK_DIVIDER_ONE_BASED or an unmapped table entry alongside
CLK_DIVIDER_READ_ONLY), calling clk_round_rate() or clk_set_rate() invokes
clk_divider_determine_rate()->divider_ro_determine_rate():

drivers/clk/clk-divider.c:divider_ro_determine_rate() {
	int div;

	div =3D _get_div(table, val, flags, width);

	/* Even a read-only clock can propagate a rate change */
	if (clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) {
		if (!req->best_parent_hw)
			return -EINVAL;

		req->best_parent_rate =3D clk_hw_round_rate(req->best_parent_hw,
							  req->rate * div);
	}

	req->rate =3D DIV_ROUND_UP_ULL((u64)req->best_parent_rate, div);

	return 0;
}

Unlike divider_recalc_rate(), divider_ro_determine_rate() does not check for
!div before calling DIV_ROUND_UP_ULL(), which will trigger a division by ze=
ro
in the kernel when div is 0.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261029-meson_refa=
ctor_n-v2-0-ff4ac74e527b@amlogic.com?part=3D2
