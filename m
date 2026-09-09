Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE40568528
	for <linux-clk@vger.kernel.org>; Wed,  9 Sep 2026 13:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788960660; cv=none; b=pxG0f2WYla6XA8NTbRwqT3o3pegNAnnRZ+/Z896/TSiowl80CljrhaP55BZzyR7rTP8e0gwOZEPE6HxK2S6mkdN7RNC8tOkwyyoi1a/vBxPSNiNGuthQxVIRBNGRwp4YJod5dbyegLduCTYGZv0J2sBUvhRllNMXJa9wRdHha5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788960660; c=relaxed/simple;
	bh=tlCe4WjdkO4qFLxgeVU0jAIMugK3txyQr6JCuOS6X6o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZERpTTS/UerwrP1WSBdszovxwCKoGLb+Z1YapniCXgbNg/rBW5a57Z5b/y5kFPe32n1zoBtNx8xC0VIJEBCPbOgODL8jeHKqCAZLd3XBRoLO/ZKLicIBIUrGPAQQ7Rn3GAo1QsLtjrjcXfD0iJWwtAUuxWctLzaQtp8Sf3VnoLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=esSYGs9/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="esSYGs9/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68F7F1F00A3D;
	Wed,  9 Sep 2026 13:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788960658;
	bh=wdAHAe6Deiwo4ROSs0ZIL6DyeJBFNNhvenbb55muDIc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=esSYGs9/QUHrfoIhgb3YCgeuCgAS09+lnwPTkDFT5XBdgqXlDxKcagLhCw8lIHJWM
	 2qxO/pMlMjer0bh5a4Yq6x/YMH+2c+IgH3IW1cqSJx/YQUFMkF+zm9kXdwXc9ha7p/
	 mKOU8gjKKN1w0ZoR3Dxyx58v2WOnsCHcvaaZ9NaXCXE3HILROgl2wodldNvQpYHl3r
	 VLiilpbATzF6GzmiqI6gwC6qlNAe6CFYzug7HGmppFucVuBbXU8PsIDMO8yy/mCeug
	 HUrGCK0pxuSW0BKoD9Tg7QOTAtqnc5W0HRdE2FUVlvAxkPAcl4a2KVZjMPKfj52qNu
	 Y9cYDXVcN8xgQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] clk: clocking-wizard: Fix overflow in clockout0 divisor
 calculation
Reply-To: sashiko-reviews@lists.linux.dev
To: shaopeijie@gmail.com
Cc: linux-clk@vger.kernel.org
In-Reply-To: <20260909131412.3051635-1-shaopeijie@gmail.com>
References: <20260909131412.3051635-1-shaopeijie@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 13:30:57 +0000
Message-Id: <20260909133058.68F7F1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The return value of `min_t()` is ignored, failing to cap `value` t=
o the maximum limit.
- [High] Uncasted 32-bit integer overflows in multiple clock calculation fu=
nctions.
- [High] Lack of rate validation causes divide-by-zero kernel panics.
--

commit 4504b18bf7e5e8a384d6dae3f8540a24668aa024
Author: Peijie Shao <shaopeijie@gmail.com>

clk: clocking-wizard: Fix overflow in clockout0 divisor calculation

This patch fixes a 32-bit overflow issue when calculating the divisor by
casting parent_rate to u64 and using the ULL version of DIV_ROUND macros.

> diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c b/drivers/clk/xil=
inx/clk-xlnx-clock-wizard.c
> index edf8c0eaca27c..5abbc6b83b728 100644
> --- a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
> +++ b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
> @@ -881,10 +881,10 @@ static int clk_wzrd_dynamic_reconfig_f(struct clk_h=
w *hw, unsigned long rate,
>  	struct clk_wzrd_divider *divider =3D to_clk_wzrd_divider(hw);
>  	void __iomem *div_addr =3D divider->base + divider->offset;
> =20
> -	rate_div =3D DIV_ROUND_DOWN_ULL(parent_rate * 1000, rate);
> +	rate_div =3D DIV_ROUND_DOWN_ULL((u64)parent_rate * 1000, rate);

[Severity: High]
This isn't a bug introduced by this patch, but if rate is 0,
DIV_ROUND_DOWN_ULL will trigger a divide-by-zero kernel panic.=20

In clk_wzrd_determine_rate_f(), the rate request is just an empty stub that
returns 0 without validating req->rate:

drivers/clk/xilinx/clk-xlnx-clock-wizard.c:clk_wzrd_determine_rate_f() {
    ...
    static int clk_wzrd_determine_rate_f(struct clk_hw *hw,
                                         struct clk_rate_request *req)
    {
        return 0;
    }
    ...
}

Can this allow a rate of 0 to reach clk_wzrd_dynamic_reconfig_f() and panic
the kernel?

A similar lack of rate validation exists in clk_wzrd_determine_rate():

drivers/clk/xilinx/clk-xlnx-clock-wizard.c:clk_wzrd_determine_rate() {
    ...
    div =3D DIV_ROUND_CLOSEST(req->best_parent_rate, req->rate);

    req->rate =3D req->best_parent_rate / div;
    ...
}

[Severity: High]
This is a pre-existing issue, but if req->rate is 0, DIV_ROUND_CLOSEST
divides by zero. Additionally, if an out-of-bounds large rate evaluates div
to 0, does the subsequent line trigger another divide-by-zero?

>  	clockout0_div =3D rate_div / 1000;
> =20
> -	pre =3D DIV_ROUND_CLOSEST((parent_rate * 1000), rate);
> +	pre =3D DIV_ROUND_CLOSEST_ULL((u64)parent_rate * 1000, rate);
>  	f =3D (u32)(pre - (clockout0_div * 1000));
>  	f =3D f & WZRD_CLKOUT_FRAC_MASK;
>  	f =3D f << WZRD_CLKOUT_DIVIDE_WIDTH;


While reviewing this file, I noticed another pre-existing issue in
clk_wzrd_dynamic_reconfig():

drivers/clk/xilinx/clk-xlnx-clock-wizard.c:clk_wzrd_dynamic_reconfig() {
    ...
    /* Cap the value to max */
    min_t(u32, value, WZRD_DR_MAX_INT_DIV_VALUE);

    /* Set divisor and clear phase offset */
    writel(value, div_addr);
    ...
}

[Severity: High]
This is a pre-existing issue, but the return value of min_t() is silently
discarded here. Does this mean the hardware register receives an uncapped
value that could exceed WZRD_DR_MAX_INT_DIV_VALUE?


Since this patch fixes a 32-bit arithmetic overflow, I noticed similar
overflows in other clock calculation functions. In
clk_wzrd_get_divisors_ver():

drivers/clk/xilinx/clk-xlnx-clock-wizard.c:clk_wzrd_get_divisors_ver() {
    ...
    for (m =3D mmin; m <=3D mmax; m++) {
        for (d =3D dmin; d <=3D dmax; d++) {
            vco_freq =3D DIV_ROUND_CLOSEST((parent_rate * m), d);
    ...
}

[Severity: High]
This is a pre-existing issue, but does parent_rate * m suffer from the exact
same 32-bit overflow on 32-bit platforms before it gets divided?

There are also similar uncasted multiplications in
clk_wzrd_recalc_rate_all_ver():

drivers/clk/xilinx/clk-xlnx-clock-wizard.c:clk_wzrd_recalc_rate_all_ver() {
    ...
        parent_rate =3D DIV_ROUND_CLOSEST((parent_rate * mult), WZRD_FRAC_G=
RADIENT);
    } else {
        parent_rate =3D parent_rate * mult;
    }
    ...
}

And in clk_wzrd_determine_rate_all():

drivers/clk/xilinx/clk-xlnx-clock-wizard.c:clk_wzrd_determine_rate_all() {
    ...
    req->rate =3D mult_frac(req->best_parent_rate, m * 1000 + divider->m_fr=
ac,
                          d * (o * 1000 + divider->o_frac));
    ...
}

And in clk_wzrd_ver_determine_rate_all():

drivers/clk/xilinx/clk-xlnx-clock-wizard.c:clk_wzrd_ver_determine_rate_all(=
) {
    ...
    int_freq =3D  divider_recalc_rate(hw, req->best_parent_rate * m, div,
                                    divider->table,
                                    divider->flags, divider->width);

    if (req->rate > int_freq) {
        f =3D DIV_ROUND_CLOSEST_ULL(req->rate * WZRD_FRAC_POINTS,
                                  int_freq);
        req->rate =3D DIV_ROUND_CLOSEST(int_freq * f, WZRD_FRAC_POINTS);
    }
    ...
}

[Severity: High]
These are also pre-existing issues, but should they be cast to u64 as well
to prevent silent wraparounds during clock calculations?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909131412.3051=
635-1-shaopeijie@gmail.com?part=3D1
