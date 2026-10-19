Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792422157;
	b=3O+b/uv4BVo8lyza8970xQt0K3Vgyk7SDx7T4aPCS9kZfjAB+v+MbDcTScT7q7Ai2i3N
	 1969F1KJIMinnOysNNFaImS7vlHfvKPuvOGdw2axFJHNfNkKFG3JMU7MWkNpMxEg0bfom
	 GwYIyaYM3/u4gxtVo0RSQ97f7DFn2W7dPVXfou2FH/7EhdYuH9m3SLQQyCKtVz9o7t7kr
	 /slvzBHIhf7noXvJXFHwOsDbDtaHcyQieo3IZAVise/g2YsoyrsGXpE313KSA5fdRkOR4
	 9Ix8C5s3NdQxjhFADjxlpWXJiO11dQRlQIETG1Yj5KcjenaG+NP7v4cne1wS+QqHRhg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792422157;
	h=Received:Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 Date;
	bh=o0e483cj+Ai1hA8903e3qQwlNkUDCHTKvHJfd4s0hG8=;
	b=t4phONdN6b+AHaEao2yX+tecMDFW0qux7Ao9oDgQNlH6AqZXkAhpBvT4D87j8NDiGPaG
	 G76BTic7rMjJdxB/pJ5S7AVRY+RFwmvs9uMvda1N4gR3D5neB0q6f+W3RzhBbezMOoJFe
	 5ntIH6C3jX2fOgAiR+vfUGCByvpDle0sgpFN8ws9C0rBKZqkHi24YNpvVyyqOyK+pK70q
	 4nycAJA/VPWFUGrj+khKijGGYElbTTTEURyc0HLJakGCHbU0RH13n1EsZ7vf5pidhRzz7
	 SM1e+g9BesRetLEic71gS6mZwRwqZSPMjI6+uEut51CzGz40F+6Xp8wwvEQ0U6Sunqw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NQsgK9w1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21007607BF17
	for <linux-clk.vger.kernel.org@localhost.mlmmj>; Mon, 19 Oct 2026 15:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NQsgK9w1
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3AA6513D0
	for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 15:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792422157; cv=none; b=AWmZByEQKFlr+0bEtmF0L7GEUFAtHJtrkU5TZDP+Jj3wtFcgjQGX/VWjSYPG0nNwjdCVb0aopFcQCiK7doZr+fUK3J9sTl88/7yZ+R2VIARwYJK5mxjGodP8npwBd4O8gHxRuffTYGOAOxceMVIOjMx8gH5BTVyM4QOe9yYd95E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792422157; c=relaxed/simple;
	bh=Fy7wr5/Vr5YhRVpkHSQmIHTeJiOofOLOAgdN2iuPBTw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=hZCJA+QLAYDWHuW8l1uV5HyH4/T7sR0emfTWvUVne7JpSXyQ5SNEP9QvXmegQ1sA0hVTN/pQiuSimxtJi8ejtR/+YfwVcWs9+SA6Fk1Xx3J/S6jmetKpNURNcURPFOEr1RhHW2/GgFa8bFtz0gtBfqGlsJpv3W6ij5A0oI4V4I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NQsgK9w1; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B960A1F000C4;
	Mon, 19 Oct 2026 15:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792422155;
	bh=o0e483cj+Ai1hA8903e3qQwlNkUDCHTKvHJfd4s0hG8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NQsgK9w1RuVwNqcPLoJydRBjgXkx1yYXkcmcGvc7NiPadX55jk4Ly5VWVDyHrk7BD
	 1MN0gvuOezzrhmulSInpnBg6tbrsazq7ur7xGJbOtg+0HPGt7IKm727QvqMbj0Ebmm
	 7V5FvbwNo1e2S7Ckxn7TbPHPAyegw94ucI+FGZm49P/kwvqzLAPqfIKHAulkNZ2ZJg
	 fxowiPIyLYEByaaQzH0KyQuBWkz3rHdLmISHWPVA7chnAGNKm1trD7c0zr/OySfDym
	 PcztYg3lY0xuah8KoCW4lmjXlExfTjk7EA3SpgnqYtgNUDV6s5Fq2MfXl2J9ogexhc
	 9c9wYNo9/aCsA==
Message-ID: <sashiko-outbox-177595@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH AUTOSEL 6.18-5.10] clk: tegra: support 48MHz clock for
 pll_p_out1
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Levin" <sashal@kernel.org>
Cc: linux-clk@vger.kernel.org
In-Reply-To: <20261019135441.1420968-333-sashal@kernel.org>
References: <20261019135441.1420968-1-sashal@kernel.org>
 <20261019135441.1420968-333-sashal@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 15:02:35 +0000
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
- [Medium] clk: tegra: _calc_rate() always fails with -EINVAL for 48MHz par=
ent_rate
--

commit 5b85244997fd59cc85d760a4c82ed76c458e3f43
Author: Dmitry Osipenko <digetx@gmail.com>

clk: tegra: support 48MHz clock for pll_p_out1

This patch adds 48 MHz parent rate handling in _calc_rate() to avoid hitting
a BUG() when UEFI configures pll_p_out1 to 48 MHz on Surface 2.

> diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
> index 591b9f0c155a0..e48ca3f4b5f86 100644
> --- a/drivers/clk/tegra/clk-pll.c
> +++ b/drivers/clk/tegra/clk-pll.c
> @@ -575,6 +575,7 @@ static int _calc_rate(struct clk_hw *hw, struct tegra=
_clk_pll_freq_table *cfg,
>  		break;
>  	case 9600000:
>  	case 28800000:
> +	case 48000000:
>  		/*
>  		 * PLL_P_OUT1 rate is not listed in PLLA table
>  		 */

[Severity: Medium]
When parent_rate is 48000000, this switch arm in _calc_rate() in
drivers/clk/tegra/clk-pll.c computes:

	cfreq =3D parent_rate / (parent_rate / 1000000);

which evaluates to 1000000 (1 MHz). Later in _calc_rate(), cfg->m is
calculated and validated against divm_max(pll):

	cfg->m =3D parent_rate / cfreq;
	cfg->n =3D cfg->output_rate / cfreq;
	cfg->cpcon =3D OUT_OF_TABLE_CPCON;

	if (cfg->m =3D=3D 0 || cfg->m > divm_max(pll) ||
	    cfg->n > divn_max(pll) || (1 << p_div) > divp_max(pll) ||
	    cfg->output_rate > pll->params->vco_max) {
		return -EINVAL;
	}

For parent_rate =3D=3D 48000000 and cfreq =3D=3D 1000000, cfg->m is 48. How=
ever,
pll_a uses a 5-bit input divider across Tegra114/124 (via pllp_nmp in
drivers/clk/tegra/clk-tegra114.c) and Tegra20/30 (via default_nmp in
drivers/clk/tegra/clk-pll.c):

	static struct div_nmp pllp_nmp =3D {
		.divm_shift =3D 0,
		.divm_width =3D 5,
		...
	};

Because divm_max(pll) is 31, cfg->m > divm_max(pll) is always true when
cfg->m is 48.

When UEFI sets pll_p_out1 to 48 MHz, won't _calc_rate() unconditionally
return -EINVAL whenever clk_pll_set_rate() or clk_pll_determine_rate() is
called on pll_a, causing tegra114_clock_init() -> tegra_clk_apply_init_tabl=
e()
-> tegra_init_from_table() in drivers/clk/tegra/clk.c to fail to configure
TEGRA114_CLK_PLL_A and hit WARN_ON(1)?

		if (tbl->rate)
			if (clk_set_rate(clk, tbl->rate)) {
				pr_err("%s: Failed to set rate %lu of %s\n",
				       __func__, tbl->rate,
				       __clk_get_name(clk));
				WARN_ON(1);
			}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019135441.1420=
968-333-sashal@kernel.org?part=3D1
