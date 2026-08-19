Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED923B71AA;
	Wed, 19 Aug 2026 22:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787178470; cv=none; b=nTpevXYUkbBxrNOnrJ4k0HRvfSLJdoAy2Xqprjukud7VrJyK+Wt3TLyhCDpwaz4iir9qVhn6lR5/LT77YCXQsfm9WOoaehdp2yD2yzkIvs5o8QWNpnzRZCiz1/+zjBqQSDZO2muD3LhpK4vQgmNMdmFdRZmk233+LeasaQ3GIbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787178470; c=relaxed/simple;
	bh=FvBO9YGm7n1SWV3FWjHYkp1SoS4imE+JtSbi4ZMf104=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HyGwfIQK2kS2a0Dymi6dGyza66ZAWz+TdKM3RRDmn+lDIKrZ1RfYOfj2tMiEN2SvtetrgV5PpgX8GqUcSMkRRnKpKI/w1aTI1iWJIpOo4DpHNKgGaY6+IgjG6DG3vKcKpVQ+rA4UJnR4MqSHIGZoR3lMvDTPcYiSa1pmKtcU9oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b7samrrv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b7samrrv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F01B01F000E9;
	Wed, 19 Aug 2026 22:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787178469;
	bh=9OdACcfgPTkZd7YK7FU/k5S72nnJGJncEXdexZoRws0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b7samrrvRgjSnJO/4KdiIIeHFz0ec6vYHHl5aP9eTCiIalUbfBa2K4RgV1GnIXn+I
	 ZXgPUJMz8i8Afa/eY9hoA9kTZT5KBMzvOc95XR05jX+h5etNUBRa+QTLdkY1oLgn5B
	 Cn3r0wsCIMBb9bvDZiMCmozrIy+aFSwAnb8kAjKaoe/sWED64mZoJBT0cjCJYAjaxO
	 tOQ+txNItelMCyOOWPkKxLD+Iowtex3OQoCyCNftNV4tBuMJib5ctyXszEiawlx422
	 6gP5qRdhc52oWg/JpNtleWJxSetXFPRAwldJRbo7CN8CJdT0nEhqA3uGfRMCsiKvC4
	 WSMSOLZsigjRw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/3] clk: en7523: generalize register clocks function
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260819221458.30040-3-ansuelsmth@gmail.com>
References: <20260819221458.30040-1-ansuelsmth@gmail.com>
 <20260819221458.30040-3-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 22:27:48 +0000
Message-Id: <20260819222748.F01B01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Medium] Fragile loop boundary logic using `num_clocks - 1` risks out-of-=
bounds array access.

Pre-existing issues:
- [High] The PCIe clock gate is registered with an unmanaged API, leading t=
o a Use-After-Free if probe fails.
- [High] Missing spinlock in reset controller update leads to data races an=
d lost writes.
--

--- Patch [2]: [PATCH v6 2/3] clk: en7523: generalize register clocks funct=
ion ---
commit c89fd9565e1664803408c338e740e001e5bb4ff0
Author: Christian Marangi <ansuelsmth@gmail.com>

clk: en7523: generalize register clocks function

This commit generalizes the clock registration logic for the EN7581 SoC
so it can be reused by the upcoming AN7583 SoC. It achieves this by
moving the base clocks array definition into the soc_data structure.

> diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
> index 1ab0e2eca5d32..087ff4568124f 100644
> --- a/drivers/clk/clk-en7523.c
> +++ b/drivers/clk/clk-en7523.c

[ ... ]

> @@ -711,12 +712,15 @@ static int en7523_clk_hw_init(struct platform_devic=
e *pdev,
>  static void en7581_register_clocks(struct device *dev, struct clk_hw_one=
cell_data *clk_data,
>  				   struct regmap *map, void __iomem *base)
>  {
> +	const struct en_clk_soc_data *soc_data;
>  	struct clk_hw *hw;
>  	u32 rate;
>  	int i;
> =20
> -	for (i =3D 0; i < ARRAY_SIZE(en7581_base_clks); i++) {
> -		const struct en_clk_desc *desc =3D &en7581_base_clks[i];
> +	soc_data =3D device_get_match_data(dev);
> +
> +	for (i =3D 0; i < soc_data->num_clocks - 1; i++) {
> +		const struct en_clk_desc *desc =3D &soc_data->base_clks[i];

[Severity: Medium]
If a future SoC defines a clock provider count (num_clocks) that doesn't
exactly equal the number of elements in base_clks plus one, could this
loop iterate past the end of the base_clks array?

It seems this loop derives the base_clks array length from
soc_data->num_clocks - 1, mathematically conflating the total clock count
with the base clock array size.

While reviewing this, I noticed a couple of pre-existing issues in the same
file:

drivers/clk/clk-en7523.c:en7523_register_pcie_clk() {
    ...
	cg =3D devm_kzalloc(dev, sizeof(*cg), GFP_KERNEL);
	if (!cg)
		return NULL;
    ...
	if (clk_hw_register(dev, &cg->hw))
		return NULL;
    ...
}

[Severity: High]
This is a pre-existing issue, but since the clock gate structure is allocat=
ed
using devres, won't it be automatically freed if probe fails?

Because the clock is registered with the non-managed clk_hw_register() API,
if a downstream operation during probe fails, the driver's probe will return
an error and trigger devres cleanup. Could this leave a dangling pointer
inside the Common Clock Framework and lead to a Use-After-Free?


drivers/clk/clk-en7523.c:en7523_reset_update() {
    ...
	val =3D readl(addr);
	if (assert)
		val |=3D BIT(id % RST_NR_PER_BANK);
	else
		val &=3D ~BIT(id % RST_NR_PER_BANK);
	writel(val, addr);
    ...
}

[Severity: High]
This isn't a bug introduced by this patch, but is it safe to perform this
read-modify-write operation on a shared register without a spinlock?

The reset core does not serialize .assert and .deassert operations, so if
multiple consumer drivers concurrently assert or deassert resets within the
same 32-bit register bank, it seems this unprotected read-modify-write
could lead to data races and lost writes.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260819221458.3004=
0-1-ansuelsmth@gmail.com?part=3D2
