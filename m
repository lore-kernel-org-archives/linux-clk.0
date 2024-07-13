Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3F117BA0
	for <linux-clk@vger.kernel.org>; Sat, 13 Jul 2024 03:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.91.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720842758; cv=none; b=ReMvZR6kkJmvgkky8AsS/2wnC2sak/rRpZ0CdwBYWkXPqDYMaUou15tmYEO1rnusKLWopDr45faGXyumypZmD8yrGulvQChLVo12jHhDYlpN4Dzd59giNF4qEqieIu6F31xmgoV0zEFogfZNRksoV1mZMvUr1qZNUNzXzdIIXeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720842758; c=relaxed/simple;
	bh=DZfYI2phaDjp/5GfmURQtWYsH0TmCq64oCz0WUp06ik=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=fZS9CN46o+kfrKfJJroF94+lE0fKWEuNxLkGX2MZgAFlJdkq7FY0Mg/9phmrIzjZ7hz7LNPdGEM6Dv3jas3j3RB9+Z10MtDje1jPW0xC+718luUe2SfZKD1r1S7by3cLG+BPtqlTP4WW/8l8HgKD/gWJiNhyij4QkyNuVqIZutk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org; spf=pass smtp.mailfrom=manjaro.org; dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b=Of43tAHh; arc=none smtp.client-ip=116.203.91.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manjaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b="Of43tAHh"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1720842751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l3cOgi5Y3zeJt1VWYzdIVf8SSuAoPfH0fWAeIPZGLq4=;
	b=Of43tAHhTd2+9w4q7DXLn9iyAenDxH6Z8xtCFETibo/4cwhDyEhXc8zTIfREBIjOTLF7Sg
	+we/LH3zbjuCNGn8kPb8colY5yayiTvYspW1JH4geCw88XY7Jzxl7XpY8MQ0wchgWr6Suv
	hQkKSi9iDDV3h1wCqO2ANxjXPTtS15EOV1X2TKu/oV7lC+YOojWhINui4CWy+fRV2nByJO
	tVOb7zcxpNEgOuY3QROLSefqoAkAr/wGOTKVynJGWo/YBwqRhTZBdtFTxHrmw03rrdjml+
	uomOmFztRj8qWOTL+CFKKXrrEOYb6twUe9ieFSOx+HFq6xyPXxj8Uk/xBybEIA==
Date: Sat, 13 Jul 2024 05:51:42 +0200
From: Dragan Simic <dsimic@manjaro.org>
To: Alexander Shiyan <eagle.alexander923@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, linux-clk@vger.kernel.org,
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2] clk: rockchip: clk-rk3588: Fix 32k clock name for
 pmu_24m_32k_100m_src_p
In-Reply-To: <20240710165354.1338287-1-eagle.alexander923@gmail.com>
References: <20240710165354.1338287-1-eagle.alexander923@gmail.com>
Message-ID: <b827ebfd49aeef3aaed9d35b7cc42555@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org

Hello Alexander,

On 2024-07-10 18:53, Alexander Shiyan wrote:
> The 32kHz input clock is named "xin32k" in the driver,
> so the name "32k" appears to be a typo in this case. Lets fix this.
> 
> Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>

Makes sense to me, and it seems to be a typo inherited from the
downstream code, [1] which the base RK3588 dtsi confirms, [2] as
well as the RK3588 Hardware Design Guide, version 1.0.

Thus, please include:

Reviewed-by: Dragan Simic <dsimic@manjaro.org>

I'd also suggest that this patch receives a Fixes tag, and gets
submitted for inclusion into stable kernels.  Thus:

Fixes: f1c506d152ff ("clk: rockchip: add clock controller for the 
RK3588")
Cc: stable@vger.kernel.org

... but you should actually submit the v2 with these tags, if you
choose to agree with this suggestion.

Furthermore, it seems that the board dts for Radxa ROCK 5B needs
some related fixes, because it deviates from the RK3588 EVB design,
but I still need to dig deeper into that and actually do some
testing to confirm it.  Perhaps that will apply to other similar
RK3588-based boards as well.

[1] 
https://raw.githubusercontent.com/rockchip-linux/kernel/develop-5.10/drivers/clk/rockchip/clk-rk3588.c
[2] 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi#n423

> ---
>  drivers/clk/rockchip/clk-rk3588.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/rockchip/clk-rk3588.c
> b/drivers/clk/rockchip/clk-rk3588.c
> index b30279a96dc8..3027379f2fdd 100644
> --- a/drivers/clk/rockchip/clk-rk3588.c
> +++ b/drivers/clk/rockchip/clk-rk3588.c
> @@ -526,7 +526,7 @@ PNAME(pmu_200m_100m_p)			= { "clk_pmu1_200m_src",
> "clk_pmu1_100m_src" };
>  PNAME(pmu_300m_24m_p)			= { "clk_300m_src", "xin24m" };
>  PNAME(pmu_400m_24m_p)			= { "clk_400m_src", "xin24m" };
>  PNAME(pmu_100m_50m_24m_src_p)		= { "clk_pmu1_100m_src",
> "clk_pmu1_50m_src", "xin24m" };
> -PNAME(pmu_24m_32k_100m_src_p)		= { "xin24m", "32k", 
> "clk_pmu1_100m_src" };
> +PNAME(pmu_24m_32k_100m_src_p)		= { "xin24m", "xin32k", 
> "clk_pmu1_100m_src" };
>  PNAME(hclk_pmu1_root_p)			= { "clk_pmu1_200m_src",
> "clk_pmu1_100m_src", "clk_pmu1_50m_src", "xin24m" };
>  PNAME(hclk_pmu_cm0_root_p)		= { "clk_pmu1_400m_src",
> "clk_pmu1_200m_src", "clk_pmu1_100m_src", "xin24m" };
>  PNAME(mclk_pdm0_p)			= { "clk_pmu1_300m_src", "clk_pmu1_200m_src" };
