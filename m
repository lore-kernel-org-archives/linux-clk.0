Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D8314AD3D;
	Fri, 27 Dec 2024 08:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735288107; cv=none; b=PNhPeS/ZkkXgsANe6pqgL6PQ2EapWkAxSXrHBrXW2heYK5x4PrHJMPPWWDSHCdmdSvRWlcDfiOG6XZbhch89DTN/gsx5K00KHxFTCUuF96vq1rLiN58apXI2B+1/ZT6PE/kzXX3cUljov/nDOdvqj2nYc8X6EyeJneuSVqndyx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735288107; c=relaxed/simple;
	bh=p8zJeNpOL7BNADVFRZy7kL0pcKZuH29D+UKM40qaNt0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BhAs52aZTT1On9d9VZfsCYkKXZnLKsFczoVQHCEvjpI4Ybtw367nW/2aMCE7HvETQrPpNaXVuUpsDciiI4ZasT5tbliwZqnYHD9pRL0p3IG3Z3xgmjju7QuNqV5fePKyaVllATCTtZuAHPUBcaqB0Je1fKiPd+hf2hsbnYdkggE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IdwEqomw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IdwEqomw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6393C4CED0;
	Fri, 27 Dec 2024 08:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735288106;
	bh=p8zJeNpOL7BNADVFRZy7kL0pcKZuH29D+UKM40qaNt0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IdwEqomwr07J32xV1rjUBDpb/fkHGCsOjExRz2sOdvKz2W33GbeCkKKMZilA2gKPx
	 KtPHw1JCZMqlA6AUr3bqiJSO3x9jfF46InAhKCBH3Uqc73A7FFbTC48+QzKWyPzU/v
	 r9o6/rkGVcdvfM9B62IrZlrUAXsc5AnIqxu95uKLfRyME3QrbGG6JDCCQV1Dk7yV4a
	 90MuHXbB3F469uLcYuQLfmzQnVe6fCbAe4KomuviANMiQJF8kKWxPB1+0W4u5Oz1Ys
	 fUd6I4SzOhldP807P/yxwRB+KYevQ4zsE7T4PolWY+ig5uv7FQv7oipnMfYbRoCphd
	 rMD5ytqMPAoYw==
Date: Fri, 27 Dec 2024 09:28:23 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: heiko@sntech.de, linux-rockchip@lists.infradead.org, 
	Finley Xiao <finley.xiao@rock-chips.com>, Liang Chen <cl@rock-chips.com>, devicetree@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/3] dt-bindings: clock, reset: rockchip: Add support
 for rk3562
Message-ID: <z7jb32foci6bamqqddkkp34hazi2itp6uclarsoi5pkrgso2go@bxflagkaciq6>
References: <20241224092310.3814460-1-kever.yang@rock-chips.com>
 <20241224092310.3814460-2-kever.yang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241224092310.3814460-2-kever.yang@rock-chips.com>

On Tue, Dec 24, 2024 at 05:23:09PM +0800, Kever Yang wrote:
> From: Finley Xiao <finley.xiao@rock-chips.com>
> 
> Add the dt-bindings header for the rk3562, that gets shared between
> the clock controller and the clock references in the dts.
> Add softreset ID for rk3562.
> 
> Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
> Signed-off-by: Liang Chen <cl@rock-chips.com>
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> ---
> 
> Changes in v2:
> - rename the file to rockchip,rk3562-cru.h
> - remove CLK_NR_CLKS
> - add new file for reset ID
> - update to use dual license
> 
>  .../dt-bindings/clock/rockchip,rk3562-cru.h   | 377 ++++++++++++++++++
>  .../dt-bindings/reset/rockchip,rk3562-cru.h   | 360 +++++++++++++++++


No, that's not a separate patch. Headers *ALWAYS* go with the bindings
patch.


>  2 files changed, 737 insertions(+)
>  create mode 100644 include/dt-bindings/clock/rockchip,rk3562-cru.h
>  create mode 100644 include/dt-bindings/reset/rockchip,rk3562-cru.h
> 
> diff --git a/include/dt-bindings/clock/rockchip,rk3562-cru.h b/include/dt-bindings/clock/rockchip,rk3562-cru.h
> new file mode 100644
> index 000000000000..ad07ad3a12ad
> --- /dev/null
> +++ b/include/dt-bindings/clock/rockchip,rk3562-cru.h
> @@ -0,0 +1,377 @@
> +/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */

Why not using license requested by checkpatch?

> +/*
> + * Copyright (c) 2022-2024 Rockchip Electronics Co., Ltd.
> + * Author: Finley Xiao <finley.xiao@rock-chips.com>
> + */
> +
> +#ifndef _DT_BINDINGS_CLK_ROCKCHIP_RK3562_H
> +#define _DT_BINDINGS_CLK_ROCKCHIP_RK3562_H
> +
> +/* cru-clocks indices */
> +
> +/* cru plls */
> +#define PLL_APLL			1

Start with 0. Your other binding also starts with 0, so be consistent.

> +#define PLL_GPLL			2
> +#define PLL_VPLL			3
> +#define PLL_HPLL			4
> +#define PLL_CPLL			5
> +#define PLL_DPLL			6
> +
> +/* cru clocks */

Missing clock for 7. You are not supposed to have any holes here.




> +#define ARMCLK				8
> +#define CLK_GPU				9
> +#define ACLK_RKNN			10

Best regards,
Krzysztof

