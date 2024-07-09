Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2F71B86C0
	for <linux-clk@vger.kernel.org>; Tue,  9 Jul 2024 18:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720550827; cv=none; b=ejLU75LsfT8u2zFgw851X90iWWzA0rRTgexJLdUzEN0a9mj9vhDSdmb190PfsyJueXpOGmnUSoGGXRTLjZhdVDXEvOD+fq/4mFGXS9c6F7u/XAXFOzIV1lykdKYy7rax7Im+97MH9rc8XvdGK15HsUp6yzbGfpAbF5BcZR/0NMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720550827; c=relaxed/simple;
	bh=h1yvodbBDXCITehfhEnqnsplePUfvHI0yDSAI0PpqeI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YsmpzFvLKy0khnDxZV2/7g80VxO5BbdeGP3+OOJI0ujgpWByQtycpDcJx0rFcd+5zb9hi5IJ3/lGiPMgKakAGn236p/C4vrx9PrH0zzB9rTtTZKqybqhOjwaDbG3IWbvzUtf3vrE/7uwhnVa08nurAaZtwqn2M5KwmNjvtWKfoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from i5e860d18.versanet.de ([94.134.13.24] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1sRFrS-0003Ie-CH; Tue, 09 Jul 2024 20:46:46 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-arm-kernel@lists.infradead.org,
 Alexander Shiyan <eagle.alexander923@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 Alexander Shiyan <eagle.alexander923@gmail.com>
Subject:
 Re: [PATCH] clk: rockchip: clk-rk3588: Fix 32k clock name for
 pmu_24m_32k_100m_src_p
Date: Tue, 09 Jul 2024 20:46:45 +0200
Message-ID: <6645351.tM3a2QDmDi@diego>
In-Reply-To: <20240709175715.1317538-1-eagle.alexander923@gmail.com>
References: <20240709175715.1317538-1-eagle.alexander923@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi,

Am Dienstag, 9. Juli 2024, 19:57:15 CEST schrieb Alexander Shiyan:

It is customary and expected that you provide a commit description.
While it is somewhat obvious here that the expected name does not match
the expectations, this should still be noted here.


Heiko

> Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
> ---
>  drivers/clk/rockchip/clk-rk3588.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/rockchip/clk-rk3588.c b/drivers/clk/rockchip/clk-rk3588.c
> index b30279a96dc8..3027379f2fdd 100644
> --- a/drivers/clk/rockchip/clk-rk3588.c
> +++ b/drivers/clk/rockchip/clk-rk3588.c
> @@ -526,7 +526,7 @@ PNAME(pmu_200m_100m_p)			= { "clk_pmu1_200m_src", "clk_pmu1_100m_src" };
>  PNAME(pmu_300m_24m_p)			= { "clk_300m_src", "xin24m" };
>  PNAME(pmu_400m_24m_p)			= { "clk_400m_src", "xin24m" };
>  PNAME(pmu_100m_50m_24m_src_p)		= { "clk_pmu1_100m_src", "clk_pmu1_50m_src", "xin24m" };
> -PNAME(pmu_24m_32k_100m_src_p)		= { "xin24m", "32k", "clk_pmu1_100m_src" };
> +PNAME(pmu_24m_32k_100m_src_p)		= { "xin24m", "xin32k", "clk_pmu1_100m_src" };
>  PNAME(hclk_pmu1_root_p)			= { "clk_pmu1_200m_src", "clk_pmu1_100m_src", "clk_pmu1_50m_src", "xin24m" };
>  PNAME(hclk_pmu_cm0_root_p)		= { "clk_pmu1_400m_src", "clk_pmu1_200m_src", "clk_pmu1_100m_src", "xin24m" };
>  PNAME(mclk_pdm0_p)			= { "clk_pmu1_300m_src", "clk_pmu1_200m_src" };
> 




