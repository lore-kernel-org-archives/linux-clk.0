Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A172D838E
	for <linux-clk@vger.kernel.org>; Sun, 30 Aug 2026 17:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788111405; cv=none; b=YDKtgbMP3S0ySXQ/Fa6lsu247i/7K/SkZY+KRXH77q0CnlgPhuj8iLaERpO0WORqQPPgxEKQvLog9SMS9aig1gPtXgW2opBVUZgLT7jxld2fwO3Au3BPAii258k8F30x4kwm00GEiYSOhEYZ/OnCJR8XGdOQVKsXCKXrfzPOWfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788111405; c=relaxed/simple;
	bh=25vhgxBnzMDKKvsO0TrFDFpUt4xZoFtlNplQCV0sxas=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SfbLJDA6kGQXpEXXR/BfVz5Wk44UyhC416oR2UYADB+Up31WaaAv5BQjK61Wkc+os3fUioHmI1Ir4s+yUnzpwFZMR0fByX0azj935QUHM/tVvZG24vQGHUaANeAKQVMbY7c4tzLdlpOu0jbfzxF4FhjsXOCbOp/cbwipk4Qvocw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AOoAI17R; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AOoAI17R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 193B21F000E9;
	Sun, 30 Aug 2026 17:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788111404;
	bh=994hvr0q7oeRoGstuzWZebE6c+gmh/3Os92ZVxb8YTk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AOoAI17RTsZZABXvL5y1pIL0d2xBKJydAc0VuPVE/ZZqzHX0mB2WA0gZsS66+O9jZ
	 BQrK19GRFuoQbK2XR8sI1jY5vAW8sBV3zm+rYJWEB1Vxwxp/CfQzocNCh9NrKdl/eL
	 yzFdLq0c5dHTKphXsePCGwGUgZmqXr1aGzXXzanQqPHSvlaO5ZU1D8rbOb+aBYcE2g
	 BjgxgAveC26aN1XyUxkiSEprLagJJbtp3W3YGBNk7veD+zkLyk+t9CVxV0+iefmf/f
	 r0M70l6UJSA5vUeuykmdjyJdvVOB+6R1CtNmTZCt52FGFhviISfmO3sCgaO4Ah8f4F
	 OPUg8GN9M3wOg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] clk: spacemit: k3: add 2.0 GHz PLL3 and PLL4 rates
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aurelien Jarno" <aurelien@aurel32.net>
Cc: linux-clk@vger.kernel.org
In-Reply-To: <20260830172925.3245444-1-aurelien@aurel32.net>
References: <20260830172925.3245444-1-aurelien@aurel32.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 30 Aug 2026 17:36:43 +0000
Message-Id: <20260830173644.193B21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Dangerous Clock Initialization Causing Kernel Panic on Unmatched R=
ates
--

commit 3c3a6a2413682e8647573306b4c79569d6255e7d
Author: Aurelien Jarno <aurelien@aurel32.net>

clk: spacemit: k3: add 2.0 GHz PLL3 and PLL4 rates
   =20
Starting with version k3-br-v1.0.7, the vendor U-Boot configures the C0
and C1 CPU clock domains (X100 cores) to 2.0 GHz instead of 2.2 GHz.
PLL3 feeds C0 and PLL4 feeds C1, but their rate tables currently contain
only the 2.2 GHz overclocking operating point. This causes the linux
kernel to hang at boot.

> diff --git a/drivers/clk/spacemit/ccu-k3.c b/drivers/clk/spacemit/ccu-k3.c
> index cb0c4277f72a8..e42a1404aca89 100644
> --- a/drivers/clk/spacemit/ccu-k3.c
> +++ b/drivers/clk/spacemit/ccu-k3.c
> @@ -30,10 +30,12 @@ static const struct ccu_pll_rate_tbl pll2_rate_tbl[] =
=3D {
>  };
> =20
>  static const struct ccu_pll_rate_tbl pll3_rate_tbl[] =3D {
> +	CCU_PLLA_RATE(2000000000UL, 0x0b292aaa, 0x0000ab00, 0xa0558686),

[Severity: High]
This isn't a bug introduced by this patch, but this patch only masks the
issue for U-Boot versions currently using 2.0 GHz by ensuring a match is
found. The underlying structural flaw remains: unconditionally disabling a
potentially vital clock during init just because its rate is unmatched is
dangerous.

If the bootloader configures a PLL to a frequency not explicitly defined in
the driver's static rate table, ccu_plla_lookup_matched_entry() returns a
null pointer. When this occurs, the initialization logic falls back to
unconditionally calling ccu_plla_disable() directly, bypassing
framework-level protections:

drivers/clk/spacemit/ccu_pll.c:ccu_plla_init() {
	...
	if (ccu_plla_lookup_matched_entry(pll))
		return 0;

	ccu_plla_disable(hw);
	ccu_plla_update_param(pll, &pll->config.rate_tbl[0]);
	...
}

This exhibits the same unsafe fallback logic for standard PLLs in
ccu_pll_init(), blindly shutting off the clock if it doesn't recognize the
hardware's configuration:

drivers/clk/spacemit/ccu_pll.c:ccu_pll_init() {
	...
	if (ccu_pll_lookup_matched_entry(pll))
		return 0;

	ccu_pll_disable(hw);
	ccu_pll_update_param(pll, &pll->config.rate_tbl[0]);
	...
}

Should the initialization logic be updated to handle unknown rates without
abruptly disabling vital clocks like the CPU clock?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260830172925.3245=
444-1-aurelien@aurel32.net?part=3D1
