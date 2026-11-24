Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795493887;
	b=GkcgfndMHTpUP3RMpOPYKkuicDEDmnqSBeTzJpW21xuyyf8UzjscJWTR6/faAFRrfMdl
	 v3S3tgdIECdi/42Y1QzU+nFJXdateZXkelswOedFdL1eCDdAbKgex7h8OVGUHjoJIblCe
	 Fk4ZQWm0hwMiZg4Rtvnc2iGkywa15cSdmx4+C40M3HlF0v7SCPpcWB89D6lnk93G2unRL
	 sactcZzgvAFBXDAYXAdS3xLas7+X9TkFopj1Ejhm2qi+cnDaxD4sYmf9T4eAkpzgVL/ay
	 XUOwMD4mLdU40jYJqAGkb+OSrOab4xPO3tiRrUPmGPiAZh+DxYKa/veHwe8yvJv4GeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795493887;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=JHHc7ykJ5Gwbre6os/vaASFU6vE6CK+VU8ZUZ08YX5g=;
	b=wS74pknYk2upqZIivM8fFw+MFVZ/YZV5VUo3Aa0pNltK/BGtllqeb5nKIw3/HsjCAUex
	 tyvkooyBDofBGAIrEG0Wrh3oKLCVmSIEzMJ5vEQmxQyJ2OTgcmPT1OfaHlDyqM4TG1pKK
	 CbWI6wSTP+/jxaAkPY1lq59VNdYVewDxh5UwPnpLlRqwn4kt//uf1DoFJoQnEet8p9Soo
	 IvUwLdZWnZtKEWw0VnGK8oH/A16nMAGKqXNRsVdjhrTel5HHHbIb6rrXr/ZRZSB6hoEbJ
	 sgqe+pEYS0F0324PKm8kxBTfGtH2W07RWs681z4+c1aVtdAGKW1t+wbIPdp6+dx6hjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eesOFzCj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4965606A31E;
	Tue, 24 Nov 2026 04:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eesOFzCj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 411801F000C0;
	Tue, 24 Nov 2026 04:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795493886;
	bh=JHHc7ykJ5Gwbre6os/vaASFU6vE6CK+VU8ZUZ08YX5g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eesOFzCj39Qc63cmaWrC2EcsQ3Iaaxntw0pfFL8M5OhOooRhfXf4gMCPl0wbw06YP
	 AghODOYDRU4hNC0CpQNCbTfrFuy2BMlAOj1geJ2b5Bf+R7RhkaXXxFQVxfM+ES7lmX
	 Gupozh43gLa3gjxEQ/pxWaBg1ds2sZ1yWpHfBrgHgRpqbWJjgxEq4gw6Xy5DOGKK/s
	 yJdSlGxPNGE2mRYCy6WcYlIvh2Ww1ewGrSat7/dIubi/sPS60WEOmOE/kKMJAOTSlD
	 Hgc6oXBUpud65ZTgFtAI6U2fy+RMTm1GRbp86/OL+z6DrEZ2LGUalAwp7im/7DEF5L
	 wqG4zzc8po2Og==
Message-ID: <sashiko-outbox-230500@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 7/8] clk: clocking-wizard: Fix division by zero and
 unbounded register write
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shubhrajyoti Datta" <shubhrajyoti.datta@amd.com>, linux-clk@vger.kernel.org
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261124035613.1968260-8-shubhrajyoti.datta@amd.com>
References: <20261124035613.1968260-1-shubhrajyoti.datta@amd.com>
 <20261124035613.1968260-8-shubhrajyoti.datta@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 04:18:05 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [Medium] clk: clocking-wizard: u8 truncation of div in
  clk_wzrd_determine_rate()
- [Medium] clk: clocking-wizard: missing zero rate checks in
  multi-output rate callbacks
- [Low] clk: clocking-wizard: missing Fixes trailers for bug fixes
--

commit 7829b1929b443e35dccbe8d3e7ecd82961ac4d4c
Author: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>

> clk: clocking-wizard: Fix division by zero and unbounded register write
>
> 1. clk_wzrd_determine_rate(): DIV_ROUND_CLOSEST() can return 0 when
>    the requested rate greatly exceeds the parent rate, causing a
>    division by zero on the subsequent parent_rate / div. Clamp div
>    to a minimum of 1.
>
> 2. clk_wzrd_dynamic_reconfig(): min_t() result was not assigned back
>    to value, so the cap to WZRD_DR_MAX_INT_DIV_VALUE was never applied
>    before the register write.
>
> 3. clk_wzrd_get_divisors() and clk_wzrd_get_divisors_ver(): If rate is
>    0, DIV_ROUND_CLOSEST_ULL divides by zero. Return -EINVAL early.
>
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>

[Severity: Low]
Should this include Fixes: tags for the commits that introduced these bugs?

  Fixes: 5a853722eb32 ("staging: clocking-wizard: Add support for dynamic r=
econfiguration")
  Fixes: 7681f64e6404 ("clk: clocking-wizard: calculate dividers fractional=
 parts")
  Fixes: e0a94c6bb5b4 ("clk: xilinx: Optimize divisor search in clk_wzrd_ge=
t_divisors_ver()")

> diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c b/drivers/clk/xil=
inx/clk-xlnx-clock-wizard.c
> index 7fe8d0d4cfba2..046efa5c77c98 100644
> --- a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
> +++ b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
> @@ -303,7 +303,7 @@ static int clk_wzrd_dynamic_reconfig(struct clk_hw *h=
w, unsigned long rate,
>  	value =3D DIV_ROUND_CLOSEST(parent_rate, rate);
> =20
>  	/* Cap the value to max */
> -	min_t(u32, value, WZRD_DR_MAX_INT_DIV_VALUE);
> +	value =3D min_t(u32, value, WZRD_DR_MAX_INT_DIV_VALUE);
> =20
>  	/* Set divisor and clear phase offset */
>  	writel(value, div_addr);
> @@ -341,6 +341,8 @@ static int clk_wzrd_determine_rate(struct clk_hw *hw,
>  	 * achievable
>  	 */
>  	div =3D DIV_ROUND_CLOSEST(req->best_parent_rate, req->rate);
> +	if (!div)
> +		div =3D 1;
> =20
>  	req->rate =3D req->best_parent_rate / div;

[Severity: Medium]
Can storing DIV_ROUND_CLOSEST() into u8 div in clk_wzrd_determine_rate()
truncate dividers above WZRD_DR_MAX_INT_DIV_VALUE (255) instead of clamping
them?

In clk_wzrd_determine_rate(), div is declared as u8.  When a low rate is
requested such that DIV_ROUND_CLOSEST(req->best_parent_rate, req->rate) is
256 or greater, the quotient wraps modulo 256.  If the quotient is a
multiple of 256 (for example, 256 MHz parent and 1 MHz requested rate),
div wraps to 0 and the new "if (!div) div =3D 1;" check forces req->rate to
req->best_parent_rate instead of the minimum frequency.  Because
clk_set_rate() passes the rounded req->rate from clk_wzrd_determine_rate()
into clk_wzrd_dynamic_reconfig(), the recomputed value in
clk_wzrd_dynamic_reconfig() is already wrapped to 1..255, bypassing the
min_t(u32, value, WZRD_DR_MAX_INT_DIV_VALUE) cap above.  Widen div to u32
(or unsigned long) and clamp it to [1, WZRD_DR_MAX_INT_DIV_VALUE] in
clk_wzrd_determine_rate().

> @@ -355,6 +357,9 @@ static int clk_wzrd_get_divisors_ver(struct clk_hw *h=
w, unsigned long rate,
>  	u32 m, d, o;
>  	u32 mmin, mmax, dmin, dmax, omin, omax;
> =20
> +	if (!rate)
> +		return -EINVAL;
> +
>  	mmin =3D VER_WZRD_M_MIN;
>  	mmax =3D VER_WZRD_M_MAX;
>  	dmin =3D VER_WZRD_D_MIN;
> @@ -397,6 +402,9 @@ static int clk_wzrd_get_divisors(struct clk_hw *hw, u=
nsigned long rate,
>  	u64 m, d, o;
>  	u64 mmin, mmax, dmin, dmax, omin, omax, mdmin, mdmax;
> =20
> +	if (!rate)
> +		return -EINVAL;
> +
>  	mmin =3D WZRD_M_MIN << 3;
>  	mmax =3D WZRD_M_MAX << 3;
>  	dmin =3D WZRD_D_MIN;

[Severity: Medium]
Can a rate of 0 still trigger a division by zero in the multi-output rate
callbacks?

clk_wzrd_get_divisors() and clk_wzrd_get_divisors_ver() are only used when
nr_outputs =3D=3D 1.  For multi-output instances, the driver does not set a
minimum rate via clk_hw_set_rate_range(), so req->rate =3D=3D 0 can reach
clk_wzrd_determine_rate() and divide by zero in
DIV_ROUND_CLOSEST(req->best_parent_rate, req->rate) before the new !div
check.  Likewise, clk_wzrd_determine_rate_f() returns 0 without rejecting
req->rate =3D=3D 0, allowing clk_wzrd_dynamic_reconfig_f() to divide by rat=
e =3D=3D
0 in DIV_ROUND_DOWN_ULL() and DIV_ROUND_CLOSEST_ULL(), and
clk_wzrd_dynamic_reconfig() and clk_wzrd_ver_dynamic_reconfig() also divide
by rate without checking for 0.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124035613.1968=
260-1-shubhrajyoti.datta@amd.com?part=3D7
