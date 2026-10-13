Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF2E379EE7
	for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 07:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791875891; cv=none; b=jWq7KHA6zsLtN/3e6PYMu88aAFvKC4W9KQFScg0MpgxqGpqsYri7KfoMh3UbM70xBUiRNrSnN+OUaqAegWAMaKCIiSN7FptWuajI5bSe7ZcMB3ricq3CuvOQ4MSwMoZg8PQaYTHWXXLknskuWNVeuZ+GfaqT9WrwDjX8naSS0Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791875891; c=relaxed/simple;
	bh=tahTkgJtb1FM2rESB/xQK3k/6BYCD8y7GuxKlxj0e4w=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date; b=S800Oab/y4+3seq/qfauykSuXjBzfvDCHpdlhF6HbuHIAtZjM3kDEuZDnBUcHiJvMqE8pqM064VOGUQnt4lYAbKzdWvcmEE+MTMo8LA9aH48mVwJAHF/BQuw3MyQVN2hEDcGo0p2ijjnhB2GVLATr8twdfM65WjGgQIzqo2v9SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ETfOE39w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ETfOE39w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EDDC1F000FF;
	Tue, 13 Oct 2026 07:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791875890;
	bh=b77w+xcmdAMQZ/DOI0RtrfkfwHJ3D4Gv4ohWYbLDtZk=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=ETfOE39w/7V3DhGuI8nKLjUshBAY/hJKvLOocg7rjVjL7Q/qena5rHDnc7IcM2mcd
	 3NDGsrdD9vu/HIM339zKKInJQEgYZyMaikIJJhyYwwHA1LSW0xEqdb664DBKKVapwT
	 auMpyFJ5oohjBmNLVH3EXdXQxrKBeygfrMQIl9W8GYZegkfgEZjBgukpFw9ipyVPJw
	 fwIZSg9R0l/NXC1rLQmaeh6M6ubkr4IajBQwkcmDZSmj75/LHx6Yy2IxudA7jH8AD9
	 FETY0J7jA6qItZ0U+6NNUm6gim1p5L1Cz6RxbOzJC6Nxfekyw5TU8xCrAh6phsV5+4
	 VvOPJBrie1Nfg==
Message-ID: <sashiko-outbox-169174@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/3] clk: socfpga: agilex: register the SP timer
 clocks early
Reply-To: sashiko-reviews@lists.linux.dev
To: "Adrian Ng Ho Yin" <adrian.ho.yin.ng@altera.com>, linux-clk@vger.kernel.org
In-Reply-To: <1fc28c08edede0f96b5eca860d5c344e185f18da.1791871090.git.adrian.ho.yin.ng@altera.com>
References: <cover.1791871090.git.adrian.ho.yin.ng@altera.com>
 <1fc28c08edede0f96b5eca860d5c344e185f18da.1791871090.git.adrian.ho.yin.ng@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 07:18:09 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] clk: socfpga: lockless publication of clk_hw pointers without memo=
ry barriers
- [Medium] clk: socfpga: silent failure on clock registration OOM due to mi=
ssing NULL check
--

commit fc4b5a56305f3513e2f688af55d3564b1822bc8c
Author: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>

clk: socfpga: agilex: register the SP timer clocks early

The DW APB timers are probed from time_init() and cannot defer. This commit
registers l4_sp_clk and its parents early using CLK_OF_DECLARE_DRIVER(),
leaving the rest as -EPROBE_DEFER, which are subsequently registered when
the platform driver probes.

> diff --git a/drivers/clk/socfpga/clk-agilex.c b/drivers/clk/socfpga/clk-a=
gilex.c
> index 2bdea1997b5ef..445d814e2f3ac 100644
> --- a/drivers/clk/socfpga/clk-agilex.c
> +++ b/drivers/clk/socfpga/clk-agilex.c
[ ... ]
> @@ -454,33 +472,166 @@ static int n5x_clk_register_pll(const struct strat=
ix10_pll_clock *clks,
[ ... ]
> +static int agilex_clkmgr_add_provider(struct device_node *np)
> +{
> +	static bool added;
> +	int ret;
> +
> +	if (added)
> +		return 0;
> +
> +	ret =3D of_clk_add_hw_provider(np, of_clk_hw_onecell_get,
> +				     &agilex_clk_data->clk_data);

[Severity: High]
Does exposing the clock data array here during early boot allow
concurrent readers to see uninitialized memory?

The global array is exposed via of_clk_add_hw_provider() before all
clocks are populated. Later, during the platform driver probe in
agilex_clkmgr_init(), the remaining clocks are initialized and their
pointers are published locklessly:

drivers/clk/socfpga/clk-agilex.c:agilex_clk_register_c_perip() {
	...
	hw_clk =3D s10_register_periph(&clks[i], base);
	...
	data->clk_data.hws[clks[i].id] =3D hw_clk;
}

Since the array is mutated without memory barriers like smp_store_release()
or shared locks, could weakly ordered architectures reorder the publication
of the pointer before the initialization of the memory?

If a concurrent consumer requests a clock during this window, they might re=
ad
the new hw_clk pointer but observe uninitialized memory inside the clk_hw
structure, potentially leading to data corruption or a kernel panic.

[ ... ]
> +static int agilex_clkmgr_finish(struct platform_device *pdev,
> +				struct stratix10_clock_data *clk_data)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < AGILEX_NUM_CLKS; i++)
> +		if (clk_data->clk_data.hws[i] =3D=3D ERR_PTR(-EPROBE_DEFER))
> +			clk_data->clk_data.hws[i] =3D ERR_PTR(-ENOENT);

[Severity: High]
Is it safe to mutate the globally exposed hws array locklessly here?

This loop is running during the delayed platform probe, modifying the array
while consumers might be concurrently accessing it.

> +
> +	return agilex_clkmgr_add_provider(pdev->dev.of_node);
> +}
> +
> +static int agilex_clkmgr_init(struct platform_device *pdev)
> +{
> +	struct stratix10_clock_data *clk_data;
> +
> +	clk_data =3D agilex_clkmgr_get_clk_data(pdev, agilex_clk_register_early=
);
> +	if (IS_ERR(clk_data))
> +		return PTR_ERR(clk_data);
> +
>  	agilex_clk_register_c_perip(agilex_main_perip_c_clks,
>  				 ARRAY_SIZE(agilex_main_perip_c_clks), clk_data);

[Severity: Medium]
Does the missing NULL check in agilex_clk_register_c_perip() cause a silent
failure on memory allocation errors?

In agilex_clk_register_c_perip(), the return value of s10_register_periph()
is checked with IS_ERR():

drivers/clk/socfpga/clk-agilex.c:agilex_clk_register_c_perip() {
	...
	hw_clk =3D s10_register_periph(&clks[i], base);
	if (IS_ERR(hw_clk)) {
		pr_err("%s: failed to register clock %s\n",
		       __func__, clks[i].name);
		continue;
	}
	data->clk_data.hws[clks[i].id] =3D hw_clk;
}

However, s10_register_periph() returns NULL on memory allocation failure.
This means the IS_ERR() check evaluates to false, failing to catch the erro=
r.

Could this cause NULL to silently overwrite the original -EPROBE_DEFER in t=
he
hws array? If consumers request this clock, they would receive a NULL clock
pointer, which the common clock framework treats as a valid optional dummy
clock. This masks the initialization failure and might allow dependent hard=
ware
to proceed without being clocked.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1791871090.gi=
t.adrian.ho.yin.ng@altera.com?part=3D1
