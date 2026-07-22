Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8D6A3E2AA1;
	Wed, 22 Jul 2026 09:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784712249; cv=none; b=FAkktbt4PRPymBHUITI4ha64XuwcyLzm67IJFoxFw2kG6g6XtWgabhiMsawABy7YjVUqSSsJR/s5GRk9DBzYqjN+b3fLAdG6roIFqUj/extN435U8gyKl/bqFzieXLF0JUkPTrSVzFtrF8EK47Dw+DIOToBy+045T70rwlUrS0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784712249; c=relaxed/simple;
	bh=Ir3qXtFw2yXRB1E/JKi0unWOJWNYoTP6ML4V2JIJIaA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K6fMScfdzQ7MJQ6I/XVGKMyXc4FILkiv+BB6/DRHp6Md0rNGuFBC2d9kZkQLGCQl9MVOFPQjtFsBOPbqp5rL2YdA67IoH3WwY3IlmAVDwIJlVoCISQuQLHoNxjDNgv0OAtwxynSMVdUSkZt2+pZMCcAiUMU+llKmcTdtsL7AmY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Tqvcku+r; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Tqvcku+r"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 004FB1595;
	Wed, 22 Jul 2026 02:24:03 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 10C493F86F;
	Wed, 22 Jul 2026 02:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784712247; bh=Ir3qXtFw2yXRB1E/JKi0unWOJWNYoTP6ML4V2JIJIaA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Tqvcku+rEDdH0CB4HC5xFMrjhZhNWsZxkMIjFtcx8EU22CAv7gb8mL0b/6LIrwiZN
	 ThueiryESniTGqsIn3aquM4p85nK0CTe8EnEgP8z4hufV98x2SV9IlLNLhExLOaMaq
	 Tjh2cyznk6kzNQT5H2t5kEzZshgBr7O+knB418Ps=
Message-ID: <2fa7bd81-0091-4001-856f-e21096023f0e@arm.com>
Date: Wed, 22 Jul 2026 11:24:02 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: sunxi-ng: ccu_mp: fix clocks without P dividers
To: Enzo Adriano <enzo.adriano.code@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Junhui Liu <junhui.liu@pigmoral.tech>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260722005643.1208942-1-enzo.adriano.code@gmail.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260722005643.1208942-1-enzo.adriano.code@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 7/22/26 02:56, Enzo Adriano wrote:
> Some sunxi-ng MP clocks have an M divider but no P divider. The A523
> MBUS, IOMMU and DRAM clocks use this layout and also require the update
> bit when changing their rate.
> 
> ccu_mp_set_rate() unconditionally builds and applies a mask for the P
> field. With a zero-width P field this produces an invalid GENMASK()
> range and can clear bits outside a P divider, including the clock gate.
> 
> The callback also ignores CCU_FEATURE_UPDATE_BIT, so hardware that
> requires the update bit may not latch the new divider value.
> 
> Only update the P field when it exists, and set CCU_SUNXI_UPDATE_BIT for
> MP clocks carrying the feature. This matches the existing sunxi-ng div,
> mux and gate helper behavior.
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/r/20260712081341.9D1431F00A3D@smtp.kernel.org
> Fixes: 6702d17f54a8 ("clk: sunxi-ng: a523: add video mod clocks")
> Assisted-by: Codex:gpt-5
> Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
> ---
> Based on clk-next 8cdeaa50eae8 (Linux 7.2-rc2).
> Tested with strict checkpatch and an arm64 W=1 build of ccu_mp.o.
> No hardware runtime claim is made.

Does that mean it's not tested on hardware?

> 
>   drivers/clk/sunxi-ng/ccu_mp.c | 15 ++++++++++-----
>   1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/clk/sunxi-ng/ccu_mp.c b/drivers/clk/sunxi-ng/ccu_mp.c
> index 7cdb0eedc69b..aa6cb20447f1 100644
> --- a/drivers/clk/sunxi-ng/ccu_mp.c
> +++ b/drivers/clk/sunxi-ng/ccu_mp.c
> @@ -237,12 +237,17 @@ static int ccu_mp_set_rate(struct clk_hw *hw, unsigned long rate,
>   
>   	reg = readl(cmp->common.base + cmp->common.reg);
>   	reg &= ~GENMASK(cmp->m.width + cmp->m.shift - 1, cmp->m.shift);
> -	reg &= ~GENMASK(cmp->p.width + cmp->p.shift - 1, cmp->p.shift);
> +	if (cmp->p.width)
> +		reg &= ~GENMASK(cmp->p.width + cmp->p.shift - 1, cmp->p.shift);
> +	if (cmp->common.features & CCU_FEATURE_UPDATE_BIT)
> +		reg |= CCU_SUNXI_UPDATE_BIT;
>   	reg |= (m - cmp->m.offset) << cmp->m.shift;
> -	if (shift)
> -		reg |= ilog2(p) << cmp->p.shift;
> -	else
> -		reg |= (p - cmp->p.offset) << cmp->p.shift;
> +	if (cmp->p.width) {

Can you merge that into the upper conditional branch? So that it's just 
one if statement?
And then apply the same treatment to the M divider, which is set to 0 by 
some A523 clocks (hstimer and r-timer).

Cheers,
Andre

> +		if (shift)
> +			reg |= ilog2(p) << cmp->p.shift;
> +		else
> +			reg |= (p - cmp->p.offset) << cmp->p.shift;
> +	}
>   
>   	writel(reg, cmp->common.base + cmp->common.reg);
>   

