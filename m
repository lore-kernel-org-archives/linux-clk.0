Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ACFA44C64C;
	Fri,  9 Oct 2026 12:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791548616; cv=none; b=OrWdaQ+tYb9Ui8iTHv3s6AGKdHqWeLy/PkEUjkHf580LemHif3hMkuuHo/djURFD1Km0vHeF8daQSK92DiPPsva29j4HQWtmBP52GtP+ExJnBl1J6nfCoJVULElQm6fHAgFx2aCh6YzsBiuJiGWpSEFTs/noghzd20b+V4xfoec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791548616; c=relaxed/simple;
	bh=9E6xDv8B73d6yOC6DdN0OYa0oarvT5tkN+QM97fzrI8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=QlKjbk9jWciJnbnmv47b9JgDugZPU/QzoZL6qUCRncYHM41b4M3WWKqCJXZGyEIcN+cmqzWDmE5+RJLkhe/kAwbkOFw4OX2K8l5VuqnM/Iz+4+lE0KAkJGSZ5aFA3BHdHusTvRR1bHdWqPBvecPIGyNHXGaiuIdz2LVWjL4hvfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fF+plmVG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fF+plmVG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD5511F000FF;
	Fri,  9 Oct 2026 12:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791548612;
	bh=90IM5mFfCV2icDQTI8DaZNbppeicpnEz6Uh34ZazFDE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fF+plmVGBiA2mR9DmRo5ti13+72xImTa3gesGFgfioNhE2FFuOAbm8brCmR4EBjco
	 VE3DD6mvh4egQbWUrnnYqBgQ4fUu6MouS6k2B6tlXnMlJ3Hpy4ut0U+VxukSpz4sWF
	 QB5tvlvmMqUUf9jCpNkRnE8oLjvQthR4lj42HwQQU59ZLWxi4dF9tt6B39Z5rXMjuM
	 GwzkGg0T6Ul0XtN4CTwJ2yZK781WkDGPCYz9JQNLc6f/kz1B2SJGqdntCbg16gmDKD
	 cLzM+/e+JwSfY0naOJR0MPz/VFt7uovUIdgKMUnPYSfmOuRYzyuYhHCWs9Dd5/Sq+P
	 uiJ9Le8l+W4Rg==
Message-ID: <sashiko-outbox-165530@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 08/14] clk: samsung: exynos8855: add block peris
 clock support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Raghav Sharma" <raghav.s@samsung.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org
In-Reply-To: <20261009120137.2801911-9-raghav.s@samsung.com>
References: <20261009120137.2801911-1-raghav.s@samsung.com>
 <CGME20261009114353epcas5p2ab971c641319dc38209c55619e8c8ed9@epcas5p2.samsung.com>
 <20261009120137.2801911-9-raghav.s@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 12:23:31 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] clk: missing CLK_IS_CRITICAL on system-critical gate clocks
--

commit 717955d4667d1084ee3be06cb476ef2408019f3e
Author: Raghav Sharma <raghav.s@samsung.com>

clk: samsung: exynos8855: add block peris clock support

Register compatible and cmu_info data to support clocks.
CMU_PERIS, this provides clocks for PERIS.

> diff --git a/drivers/clk/samsung/clk-exynos8855.c b/drivers/clk/samsung/c=
lk-exynos8855.c
> index 5394706d214c9..2bf889a478bc9 100644
> --- a/drivers/clk/samsung/clk-exynos8855.c
> +++ b/drivers/clk/samsung/clk-exynos8855.c
[ ... ]
> @@ -1094,6 +1096,99 @@ static const struct samsung_cmu_info peric_cmu_inf=
o __initconst =3D {
[ ... ]
> +static const struct samsung_gate_clock peris_gate_clks[] __initconst =3D=
 {
> +	/* System will hang if this critical clock is gated */
> +	GATE(CLK_GOUT_CMU_PERIS, "gout_cmu_peris",
> +	     "dout_clkcmu_peris_nocp",
> +	     CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_CMU_PERIS_IPCLKPORT_PCLK,
> +	     21, 0, 0),

[Severity: High]
Does this code expose the clock tree to fatal disablement by
clk_disable_unused()?

Even though .auto_clock_gate =3D true provides a no-op .disable callback fo=
r leaf
clocks, the Linux clock framework will still transition its software state =
to
DISABLED and decrement the reference counts of the entire parent chain (e.g=
.,
dout_clkcmu_peris_nocp -> mout_clkcmu_peris_noc_user -> ... ->
fout_shared0_pll).

Because root parents like PLLs use real hardware .disable operations, they =
will
be physically powered off when their reference count hits zero.

Should the CLK_IS_CRITICAL flag be explicitly passed in the flags parameter
here to artificially bump the reference count and keep the entire parent tr=
ee
active forever?

A parallel block introduced earlier in this patch series has the same issue:

drivers/clk/samsung/clk-exynos8855.c:
static const struct samsung_gate_clock peric_gate_clks[] __initconst =3D {
	/* System will hang if this critical clock is gated */
	GATE(CLK_GOUT_CMU_PERIC, "gout_cmu_peric",
	     "dout_clkcmu_peric_nocp",
	     CMU_PERIC_CLK_CON_GAT_BLK_PERIC_UID_CMU_PERIC_IPCLKPORT_PCLK,
	     21, 0, 0),
        ...
};

Should it also be updated with the CLK_IS_CRITICAL flag to prevent system
hangs?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009120137.2801=
911-1-raghav.s@samsung.com?part=3D8
