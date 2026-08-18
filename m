Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C8B2E888A;
	Tue, 18 Aug 2026 22:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787090942; cv=none; b=lliVISMHtUkfFa6H+xwZgvKpEKO5GabOmn2e3c9BdD8YggFRO3U4tVPmm+onhSFRNLZPfXaC5UD5PfSS+JsPRSQrheaNSlNiA1Nw2bm/Ysjt+i/S8WabKGpZglLtOQkQuKNKGd67cfNnM5OETf/iGE8OQURg7NjWK+PCnoT54cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787090942; c=relaxed/simple;
	bh=WjdGOy84+oRl49izj4SgEOa1TfaynJm3TYwXcYTBwWs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uJQC1xlgmJ9cOud+LEvY+4CE+mV0WaygKXgKS9spXovN6g6qy744WOCB9xdmQwhtwDc68TeVwUUMqDf9GjWHaCG0SSxBkBGd1JU/Ur7l7YhdZZ+UM1DhrT5ZXCeNqGCqdlUZKITfRH2eg/2Hji3VzrS8eqqjq1/2oam6sbS0EMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kLn6Iuru; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kLn6Iuru"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BCC91F000E9;
	Tue, 18 Aug 2026 22:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787090941;
	bh=hAUrS9PArYUfBHMtrctl5K7X25X7TAk9zJkOlCc7az4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kLn6Iuru5ihpTZz7p04xqLGEOQfdrB6jHH5Rgnqc9M5aCHOL97FmI6WixsCA9c2XL
	 S6C/qM/8T3JCQikT9rSAHrmOFnIfkq7ziSPw1M8/JdXMhmnZ1TR26Ls8sJeq9/A2FI
	 +vnUsCj931G8tdONYIZqMm/zM9zGsHSFUjhS94wP7SgGz/yLxe4Mtg9elgL5iJfvr3
	 hSkAdiuxbNpp+ASFYZAMSdHRT0c30TwYql9vORc95N3tfz6vDnU9N80DTDBeQuuAma
	 oxumiDYvH0dGnZND3lkFOaCRwiBAvI9HAOdDTLO72RoGl9nfileZ9q4z6Hu0Fnpduy
	 bs+TkFItugzQA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] clk: samsung: Introduce Exynos5515 clock driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aiden Isik" <aidenisik@member.fsf.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, linux-clk@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260818-for-next-lucky7-clock-v2-3-cda0cc80f158@member.fsf.org>
References: <20260818-for-next-lucky7-clock-v2-0-cda0cc80f158@member.fsf.org>
 <20260818-for-next-lucky7-clock-v2-3-cda0cc80f158@member.fsf.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 22:09:00 +0000
Message-Id: <20260818220901.4BCC91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] PERI CMU muxes incorrectly use TOP CMU mux outputs instead of divi=
der outputs, bypassing clock gating and division.
- [Medium] EXYNOS5515_MEMCLK_OFFSET is uninitialized and excluded from the =
suspend/resume sysreg array.
--

--- Patch [3]: [PATCH v2 3/3] clk: samsung: Introduce Exynos5515 clock driv=
er ---
commit ec18c4d69f3cc6d71671cf32be2a8263d5584524
Author: Aiden Isik <aidenisik@member.fsf.org>
Subject: clk: samsung: Introduce Exynos5515 clock driver

This commit adds Common Clock Framework support for the Exynos5515 SoC. It =
introduces the CMU_TOP, CMU_PERI, and CMU_FSYS clock management units.

> diff --git a/drivers/clk/samsung/clk-exynos5515.c b/drivers/clk/samsung/c=
lk-exynos5515.c
> new file mode 100644
> index 0000000000000..aeaa51c1c7354
> --- /dev/null
> +++ b/drivers/clk/samsung/clk-exynos5515.c
> @@ -0,0 +1,1485 @@
> +// SPDX-License-Identifier: GPL-2.0-only
[ ... ]
> +#define EXYNOS5515_GATE_DBG_OFFSET	0x4000
> +#define EXYNOS5515_DRCG_EN_OFFSET	0x0104
> +#define EXYNOS5515_MEMCLK_OFFSET	0x0108

[Severity: Medium]
EXYNOS5515_MEMCLK_OFFSET is defined here, but it appears to be missing from
the drcg_sysreg array below and is not assigned to the memclk_offset field
in any samsung_cmu_info structs (like top_cmu_info). Will this cause the ME=
MCLK
register state to be lost during system suspend and resume cycles, and skip
its initialization during boot?

[ ... ]
> +static const unsigned long drcg_sysreg[] __initconst =3D {
> +	EXYNOS5515_DRCG_EN_OFFSET,
> +};
> +
> +static const struct samsung_cmu_info top_cmu_info __initconst =3D {
[ ... ]
> +	.gate_dbg_offset	=3D EXYNOS5515_GATE_DBG_OFFSET,
> +	.option_offset		=3D CMU_CMU_TOP_CONTROLLER_OPTION,
> +	.drcg_offset		=3D EXYNOS5515_DRCG_EN_OFFSET,
> +};
[ ... ]
> +/* Parent clock list for CMU_PERI muxes */
> +PNAME(mout_pll_peri_bus_user_p)		=3D { "oscclk",
> +					    "mout_cmu_peri_bus" };
> +
> +PNAME(mout_pll_peri_ip_user_p)		=3D { "oscclk",
> +					    "mout_cmu_peri_ip" };
> +
> +/* Parent clock list for CMU_PERI muxes: for SPI */
> +PNAME(mout_peri_spi_p)			=3D { "oscclk",
> +					    "mout_pll_peri_ip_user" };
> +
> +/* Parent clock list for CMU_PERI muxes: for UART */
> +PNAME(mout_pll_peri_uart_user_p)	=3D { "oscclk",
> +					    "mout_cmu_peri_uart" };

[Severity: High]
Should these parent lists use the divided outputs from TOP CMU
(like dout_cmu_peri_bus, dout_cmu_peri_ip, and dout_cmu_peri_uart)
instead of the direct mux outputs (mout_cmu_peri_*)?

Using the direct mout_* clocks here bypasses the intended clock division
and gating, which might lead to incorrect peripheral clock frequencies and
break power management for these blocks.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818-for-next-l=
ucky7-clock-v2-0-cda0cc80f158@member.fsf.org?part=3D3
