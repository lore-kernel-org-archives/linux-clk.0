Received: from mail-m19731120.qiye.163.com (mail-m19731120.qiye.163.com [220.197.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739721DDA18;
	Mon,  7 Sep 2026 03:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788752182; cv=none; b=DNa4A5LVXaJdS2271Tbsjn+R3UtpYVGkg2LlVbCMvualycE5DOMBl+5tR1pwHQ0HY9IQ1ox+1LRY6KTL94408Yfw7rrwG6MSSd1AI70TDmwyF1ZbE12n+lSZD5HZhnLdY4HK1D89biBJo+uZnMq9MK93TSsjc+LNtkq9g8uVa6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788752182; c=relaxed/simple;
	bh=rNr4D9deSQmTUVh6kFxsRlk5qaYnAx7VmBsAwEZaP8U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ufvwF+ieHHNZLvBwLxIryHN+shhe7mG5kdM8oqEcsijsluIh7hytbVeDB2Ru6o6hyzaofot0ogV+q/jOnGCYbA5pRUzAn9mTDqB+9/VD1p34AtPyV1Y23Lxdnfe2DVS1gKFYUfjvUl9QRJFZfdZJ3wQlEHlbZZkwBd67ebnwmug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=J+pH9aqj; arc=none smtp.client-ip=220.197.31.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="J+pH9aqj"
Received: from [172.16.12.90] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4cbfd4e16;
	Mon, 7 Sep 2026 11:20:53 +0800 (GMT+08:00)
Message-ID: <6e96691c-5d52-4e00-a15b-2a2b21f65fe3@rock-chips.com>
Date: Mon, 7 Sep 2026 11:20:51 +0800
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 16/19] phy: rockchip: inno-hdmi: Use the common
 Innosilicon PHY helpers
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Lee Jones <lee@kernel.org>, Andy Yan <andy.yan@rock-chips.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Emil Renner Berthing <kernel@esmil.dk>, Hal Feng
 <hal.feng@starfivetech.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Dominique Belhachemi <db@domibel.de>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, mfd@lists.linux.dev,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
 Andy Yan <andyshrk@163.com>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Maud Spierings <maud_spierings@murena.io>,
 Graham Markall <hello@big-grey.co.uk>,
 Icenowy Zheng <zhengxingda@iscas.ac.cn>
References: <20260904-jh7110-clean-send-v3-0-484f9ae72715@samsung.com>
 <CGME20260904132739eucas1p223161c8aa461d6ad18786635ab3c9de4@eucas1p2.samsung.com>
 <20260904-jh7110-clean-send-v3-16-484f9ae72715@samsung.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <20260904-jh7110-clean-send-v3-16-484f9ae72715@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0aa079e20e8103a7kunmae2afc193611e7
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaTEsZVh4aS0xLGBgaGkgdTlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQkxVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=J+pH9aqjliwdMdP6kenDUDgsFo2GFjCulzu+UU8+Z1ovBsC62FGnk1cwrTWEL9+KGDNq4sdEgsK8gJdOHqlSNOH6d50lhGEQHf8B2L81S4cAX6catva+VVg4ikamy9CzRb2ncewysvwvV2ttkQX5ECW8n63q1jQhUmujT/P3DbQ=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=TOMJc+Y8LFdspZYjJ1TLplIIrOzasQxKAI43UPHgqhM=;
	h=date:mime-version:subject:message-id:from;

Hello Michal,

On 9/4/2026 9:27 PM, Michal Wilczynski wrote:
> The RK3328 pre-PLL programming, its table lookup and its recalc_rate and
> determine_rate implementations are the generic Innosilicon ones, so drop
> the local copies and use the shared helpers instead.
> 
> The RK3228 pre-PLL sits at different register addresses, so it keeps its
> own register level code and only shares the table lookup.
> 
> The now unused RK3328 pre-PLL register macros go with it, as does the
> local pre-PLL config lookup wrapper; both call sites already have the
> TMDS clock to hand and call inno_hdmi_phy_pre_pll_lookup() directly.
> 
> The RK3328 recalc_rate used to log the pre-PLL output as "vco". The
> shared helper logs it too, and reports the actual VCO frequency
> alongside the rate, which is the value with the 1.4-3.2 GHz constraint.
> 
> The register writes, their order and the values written are unchanged.
> No functional change intended.
> 
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  drivers/phy/rockchip/Kconfig                  |   1 +
>  drivers/phy/rockchip/phy-rockchip-inno-hdmi.c | 165 ++++----------------------
>  2 files changed, 26 insertions(+), 140 deletions(-)
>

[...]

>  
> @@ -915,39 +858,11 @@ unsigned long inno_hdmi_phy_rk3328_clk_recalc_rate(struct clk_hw *hw,
>  						   unsigned long parent_rate)
>  {
>  	struct inno_hdmi_phy *inno = to_inno_hdmi_phy(hw);
> -	unsigned long frac;
> -	u8 nd, no_a, no_b, no_d;
> -	u64 vco;
> -	u16 nf;
> -
> -	nd = inno_read(inno, 0xa1) & RK3328_PRE_PLL_PRE_DIV_MASK;
> -	nf = ((inno_read(inno, 0xa2) & RK3328_PRE_PLL_FB_DIV_11_8_MASK) << 8);
> -	nf |= inno_read(inno, 0xa3);
> -	vco = parent_rate * nf;
> -
> -	if (!(inno_read(inno, 0xa2) & RK3328_PRE_PLL_FRAC_DIV_DISABLE)) {
> -		frac = inno_read(inno, 0xd3) |
> -		       (inno_read(inno, 0xd2) << 8) |
> -		       (inno_read(inno, 0xd1) << 16);
> -		vco += DIV_ROUND_CLOSEST(parent_rate * frac, (1 << 24));
> -	}
> -
> -	if (inno_read(inno, 0xa0) & RK3328_PCLK_VCO_DIV_5_MASK) {
> -		do_div(vco, nd * 5);
> -	} else {
> -		no_a = inno_read(inno, 0xa5) & RK3328_PRE_PLL_PCLK_DIV_A_MASK;
> -		no_b = inno_read(inno, 0xa5) & RK3328_PRE_PLL_PCLK_DIV_B_MASK;
> -		no_b >>= RK3328_PRE_PLL_PCLK_DIV_B_SHIFT;
> -		no_b += 2;
> -		no_d = inno_read(inno, 0xa6) & RK3328_PRE_PLL_PCLK_DIV_D_MASK;
> -
> -		do_div(vco, (nd * (no_a == 1 ? no_b : no_a) * no_d * 2));
> -	}
>  
> -	inno->pixclock = DIV_ROUND_CLOSEST((unsigned long)vco, 1000) * 1000;
> +	inno->pixclock = inno_hdmi_phy_pre_pll_recalc_rate(&inno->pre_pll,
> +							   parent_rate);
>  
> -	dev_dbg(inno->dev, "%s rate %lu vco %llu\n",
> -		__func__, inno->pixclock, vco);
> +	dev_dbg(inno->dev, "%s rate %lu\n", __func__, inno->pixclock);
>

The printing here is redundant, because it has already been handled in 
inno_hdmi_phy_pre_pll_recalc_rate().

Reviewed-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>

>  	return inno->pixclock;
>  }

-- 
Best, 
Chaoyi
