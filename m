Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795000532;
	b=aRScIgH/DAR4KPlao8TCY25sj/VRZTVftpvIj/6V+D9WYTNKaJ1cbpIh/quzeE8P8P2i
	 U6qgUxmP/HCzK8pfI0VPnDCc/qp48Vugc/WuX6SPcXfNallYl5GY/O20UUU96G267jVna
	 YhRm5+MinHJLH4v7DY4CpBdCq6ce5ZrxNW2kLjyM9OCyl0coFJstejgA7mvdlYC+jOKfL
	 StvSiIu3ApeAqmPggY5HSEtf+S9AhNi0o6gXV+i0BDxOvt+Uc7mQphduWoWaTUbpCDB+1
	 efk9QZq+rXMISdpE/obeueQ1UetODEkE5D6PTMr2XKfLu8QNLW0B4K8yGoq5+7RjMJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795000532;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=mngIjZvCePCgtonRcZIH7Xi6DzPuq+feV13etfIWIOw=;
	b=QhK3YlQSfUdT4rbvSeuITi48FzLnSFI9D1fgn5U0bjnVdfWXwVKlk4UU1c4I5ReoATer
	 p0fX9B+hEdLv+OiJZcYQx3QX/TOfevYSazJhONM8EYG0vqlpnruI8kDnxjXC1ReOwITdH
	 ZdpfAwAVp3IM36fF0CcCgydk1FWo2AwXPEAPa9kWTJ08z1CRltEQLwXsZH/satxEiTB9T
	 YuShnfn3OELH8tTkAQ9yCOq0023stFMX4zDbjbMGT3oqlpt4Lq1KUAUkJddevt3wRTbsX
	 QctfTwycboEubmzaH7tGOUfwpcsoF9jwY9Wyg7IQ5Td9CGCIGcNxioFRSa92eIcRLFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jbob620V;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0C0606A320;
	Wed, 18 Nov 2026 11:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jbob620V
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46CBC1F000C4;
	Wed, 18 Nov 2026 11:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795000532;
	bh=mngIjZvCePCgtonRcZIH7Xi6DzPuq+feV13etfIWIOw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Jbob620VKGRo6cBpg0LtKAoarODTFedMQDRm3UzTcQ4MA6e26aJoO+2OZXrjhnIRq
	 cVvAsGBH8TXHGO8TQaZ+KF6EpjfdUhAFULfwG0VpTBXBpmMd3Yabk5msMhIhmFRuNU
	 iINEo0jSw0/zjW8zSv6Q9ycNgRlD+HWLHwD/6qsCcv5NjAOfeR/rlBtNY5+2TiJX7d
	 0kDOeYJJhxzlKAoyNX5rLLgcKFF4LyuJDbc+dZjL+dRz2YOPGAap/f0hImIzbj2qGm
	 KBSIQ1xmCVk8msc8in+jAmC0SUMfXe4tbcqbx0T/D9VZTkaE2eFvWieriG2w11H0+0
	 b0jiBvcVHQ7YQ==
Date: Wed, 18 Nov 2026 11:15:28 +0000
From: Yixun Lan <dlan@kernel.org>
To: =?utf-8?B?RnLDqWTDqXJpYyBNYWjDqQ==?= <frederic.mahe@cirad.fr>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.co>,
	Haylen Chu <heylenay@4d2.org>,
	Hung-Chun Tseng <alan.tseng.cs@gmail.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] clk: spacemit: k1: Keep pll1_aud_245p7 enabled
Message-ID: <20261118111528-GKD156369@kernel.org>
References: <20261117205951.140146-1-frederic.mahe@cirad.fr>
 <20261117205951.140146-3-frederic.mahe@cirad.fr>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261117205951.140146-3-frederic.mahe@cirad.fr>

Hi Frédéric,

I will forward to SpacemiT people, and ask them to clarify..

On 21:59 Tue 17 Nov     , Frédéric Mahé wrote:
> Accesses to the RCPU2 block (0xc0888000) hang once pll1_aud_245p7 is
Access which register? is the PWM register in RCPU2?

> gated: the CPU stops responding, even to NMIs. Nothing claims this
> clock in mainline, so clk_disable_unused() turns it off at boot, and
> probing an RCPU2 PWM afterwards hangs the board. The RCPU2 clock and
> reset registers live in the same block.
> 
Usually access IP block with clock gated off will cause system bus hang,
exactly the same scenario as you see here..

> Mark it critical, as was done for the K3 RCPU clock.
> 
It just happen to fix the issue, but doesn't sound like a correct fix,
usually, it can be fixed with correct clock topology 

> Tested on a BPI-F3: without this, probing an RCPU2 PWM hangs the
> board; with it, no hang, also with no PWM in use.
> 
..
> Written with help from Claude (Anthropic); reviewed and tested on hardware.
> 
maybe just "Assisted-by: LLM"

> Signed-off-by: Frédéric Mahé <frederic.mahe@cirad.fr>
> ---
>  drivers/clk/spacemit/ccu-k1.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
> index dee14d25f..364388ff8 100644
> --- a/drivers/clk/spacemit/ccu-k1.c
> +++ b/drivers/clk/spacemit/ccu-k1.c
> @@ -60,7 +60,8 @@ CCU_FACTOR_GATE_DEFINE(pll1_d11_223p4, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT
>  CCU_FACTOR_GATE_DEFINE(pll1_d13_189, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(16), 13, 1);
>  CCU_FACTOR_GATE_DEFINE(pll1_d23_106p8, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(20), 23, 1);
>  CCU_FACTOR_GATE_DEFINE(pll1_d64_38p4, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(0), 64, 1);
> -CCU_FACTOR_GATE_DEFINE(pll1_aud_245p7, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(10), 10, 1);
> +CCU_FACTOR_GATE_FLAGS_DEFINE(pll1_aud_245p7, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(10), 10, 1,
> +			     CLK_IS_CRITICAL);
>  CCU_FACTOR_GATE_DEFINE(pll1_aud_24p5, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(11), 100, 1);
>  
>  CCU_FACTOR_GATE_DEFINE(pll2_d1, CCU_PARENT_HW(pll2), APBS_PLL2_SWCR2, BIT(0), 1, 1);
> -- 
> 2.47.3
> 

-- 
Yixun Lan (dlan)
