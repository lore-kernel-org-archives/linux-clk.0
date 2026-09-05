Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD003793C3;
	Sat,  5 Sep 2026 16:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788626937; cv=none; b=KbWKstx39AuthCYidwnvohv4rJbEV+KusChfpdVFCKyMA4p5G96vCHsDdABXLP34yh0iBKXJTSQwwMgkKDV3h3jlJAknJM2Vgef2OoMpGFBn9eD3JFrFBtz5kTFSp2xG1ERb3xxGrB4NnraHiEF6qoIhahI2/LEMKcRw7YYjAvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788626937; c=relaxed/simple;
	bh=97D3XOLcjBhGCoHE+R8xYxvNGCyOnXs2/p0Y/OtMVW8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BWxLtq2lsK2JgAxnfG+w3mOfOJF+Xv1phgA3xKnJTnesfRM0wZ0F3xfsV+8fonImS/1HramyAO8jxQhqO3jexrcbIuT4ASHA+bcIDOVUc/yOV6kMDWlRKBWyhTQHjC7qSwYibgZfHoR2MyNFytDMcnu9RzV2QdIiMqLgwBm4x+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aEh77jSN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aEh77jSN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57E751F00A3D;
	Sat,  5 Sep 2026 16:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788626935;
	bh=O4u/v0o9ZSrsrwglEuKnm6Bo9pQt845xUSX3klMNyRw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aEh77jSNn64YW353BrdhygAgLtzHNKaXoUy1tUD81p7f443Uc51cYLkLZjpe3m0/3
	 169XGvBZoK49X6kN6B6FcpGead27aFcEpYBjDDGekylEYl5QTMJB2wEPH9SzHT6AAW
	 0eml/x78i4CyfYSH83EQAViqILWOgsUPSOs/tulWiDdZQpmhi01blIHLN/gyctKU2k
	 MWHCqnfBIP/ZRPfNdIEzdgTThEZ3xL1pnz2Nj9oWBDOIKHLJuI43k2JWSYuBbAOgDx
	 Zf3MX62ngSPXG1bJgLPjtf+lVg2Mek1aC9Ydp/LsvE8Y3csytq/Yal8yIRqClUf1rv
	 v0kvtUGVMXRPg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 6/8] clk: sunxi-ng: a733: Add mod clocks support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Junhui Liu" <junhui.liu@pigmoral.tech>
Cc: linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260905-a733-clk-v3-6-50f238f39c78@pigmoral.tech>
References: <20260905-a733-clk-v3-0-50f238f39c78@pigmoral.tech>
 <20260905-a733-clk-v3-6-50f238f39c78@pigmoral.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 05 Sep 2026 16:48:54 +0000
Message-Id: <20260905164855.57E751F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Incorrect configuration of `dram0_clk` and `mbus_clk` using `ccu_m=
p` results in undefined behavior (register wiping) and silent failure to la=
tch hardware rate changes.
--

commit a122063531b2fdc98cf1753dabf17b8cdf9be8ae
Author: Junhui Liu <junhui.liu@pigmoral.tech>

clk: sunxi-ng: a733: Add mod clocks support

This patch adds module clocks found in the Allwinner A733 SoC, including
video, storage, interfaces, and others. The implementation accounts for
register offset changes compared to the A523 SoC and introduces new modules.

> diff --git a/drivers/clk/sunxi-ng/ccu-sun60i-a733.c b/drivers/clk/sunxi-n=
g/ccu-sun60i-a733.c
> index 3a25c349f11ba..e590b211be853 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun60i-a733.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun60i-a733.c

[ ... ]

> @@ -492,6 +499,913 @@ static SUNXI_CCU_MP_DATA_WITH_MUX_GATE_FEAT(mbus_cl=
k, "mbus", mbus_parents, 0x58
>  					    CLK_IS_CRITICAL,
>  					    CCU_FEATURE_UPDATE_BIT);
> =20
> +/***********************************************************************=
***
> + *                          mod clocks                                  =
  *
> + ***********************************************************************=
***/

[ ... ]

> +static SUNXI_CCU_MP_DATA_WITH_MUX_GATE_FEAT(dram0_clk, "dram0", dram_par=
ents, 0xc00,
> +					    0, 4,	/* M */
> +					    0, 0,	/* no P */
> +					    24, 3,	/* mux */
> +					    BIT(31),	/* gate */
> +					    CLK_IS_CRITICAL,
> +					    CCU_FEATURE_UPDATE_BIT);

[Severity: High]
Does configuring dram0_clk (and similarly mbus_clk, visible in the context
above) using SUNXI_CCU_MP_DATA_WITH_MUX_GATE_FEAT with a 0-width P divider
result in undefined behavior?

When a frequency change is requested for clocks mapped to ccu_mp,
ccu_mp_set_rate() evaluates:
GENMASK(cmp->p.width + cmp->p.shift - 1, cmp->p.shift)

With a 0-width P divider, this becomes GENMASK(-1, 0), which expands to
a shift by BITS_PER_LONG. On ARM64 systems, this undefined behavior typical=
ly
clears the entire clock register (erasing the critical gate and mux), which
can immediately crash the system.

Additionally, the macro passes the CCU_FEATURE_UPDATE_BIT flag. However,
ccu_mp_set_rate() does not implement this feature flag (unlike ccu_div.c).
Will this cause rate changes to silently fail to latch in the hardware?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260905-a733-clk-v=
3-0-50f238f39c78@pigmoral.tech?part=3D6
