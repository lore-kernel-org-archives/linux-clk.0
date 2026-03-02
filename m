Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94AC41C0DA
	for <linux-clk@vger.kernel.org>; Mon,  2 Mar 2026 16:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772469023; cv=none; b=P3NjuDEgjhkcK5IZor6feJuhb3cprQEYT8bbXexkjCSAtz8fe3c31LSA38+vW0l+xNNpWIm/SogHil5bgSG86GLRywpw+4gQ3U+fAoqW7JcO2P+jSW8UUto60owOLOwB9bwhhX0dn/kmv8rzQMUUtGuIUAuitvAoR8/xUvRnFf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772469023; c=relaxed/simple;
	bh=InL1BUMOfeVyZo7m+EoNrF/nfvrIDyNxtRvoB+UGFdM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uYxeTvdowQIFuE/ZyBKR/aprxCWA8w/DCubD/st7QAcTPKKyGfdgT8TMdF3ViHw6WZoN3m6sO8Mj7h/EDi85eMHKiAFvAUUt4dutJnfq/D4ugMjHW2QhW8Y53s/w+LynrrfeuLylAvUCocoJZIgDqptZVSqCpwrisfJrASjbB9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=QlUk4FxE; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="QlUk4FxE"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-480706554beso53807905e9.1
        for <linux-clk@vger.kernel.org>; Mon, 02 Mar 2026 08:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1772469019; x=1773073819; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0s39U97W2f9SABdbDeZAgoXF6pj1iuSWIw1QAIsWOcs=;
        b=QlUk4FxEII/LBOD7wpXXkIAPaat4PBoKmOny+rQpuminNVjhe27X9b4XZl6Ef75S/a
         kaAcecLQH1LnMXRZ3NNbBABu+EZlScBQQV1NYoAFh3XvR3i1vXUy9/TP6N4yX5twprfq
         B5jf9uvjvgtIXYxJgThoZHSkfTnVRO9Ml2gNv00r3cqwkCqjGKlQFAxuXge6//B1Jmun
         SzWiCwNbX7SvpIWP+FiLTh4bdo7mKzlyr1707oESQ71px9sS2QPKD6fw7f5zXGrl6qrv
         ZRUCOG3825DN5QPF+TBtkivgcGzncpA6aKxDHCXGOBOcpl72W4wfIEzBd0d6V3RbVNf5
         oeSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772469019; x=1773073819;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0s39U97W2f9SABdbDeZAgoXF6pj1iuSWIw1QAIsWOcs=;
        b=KR054uQDFzbAy3007VO4ZHLKm3qbYcGUB2mCSQSf7ERZrSPl1GYPDIYeYgg9mLY+MM
         9xjE+KUJDAeHHKRQK4EiNIscip4fP9zQNPyVV1br58AxlSlKzjTaGyDRAb8TLp//pW5o
         c+RA20JkcRDr5I8VSoAMKDzeMcqxvw+kfx6kjcEqdgtO+sbwbHCmRHThsELyQ7GkpvbM
         t8IpXO5D2pe0uiPFa+SFdHzxNKJ/T9QB1FF+nEU1qfB0mMt5PkWcunMphEqE9aJTbJ9B
         i5b3YLzJ6U4p5M7sGsvOHzh5dF3CS3e5LG4/ZKqwQ7Rep/+3U6O8DHAyGNHlDk3U0SfY
         3NdA==
X-Forwarded-Encrypted: i=1; AJvYcCXA06QVZbxVShtRbwAnsROKubrXJR9Y5Cnxc5WvRYqxSVPhsl8LVm+SSXDcVMKeI8WIie3V2bcHdLg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxC41tWFVM21CEKhrvNixrYeSw8Za2ZwM+4OO77ykPBxiDOPXfS
	JVx9LbcLLaqUsp8c1qqyV2ZXeO5IBGbUClpxuz1ybw0KU7L51AWYeLTEPW958d0+TN8=
X-Gm-Gg: ATEYQzx11sD5rSTYCFGeOG8g5m5KLp13W897S0ah0LicApQIWDjyKz+rzEiSPo7DF2k
	BWWAaEMnbusm2RFAVYFhasFDvGjCaACQ/zHohJs9sbYUvxNAVHhHwZ+LoP4EgoKL7xoTSnnKx8a
	ICNKSUYrwVEcYLx3oqJyMpIuSAobfw+J7poH4oClwCsMXv4feUzAJ+xFUZUJRlh0KfKAi5h+cjp
	TRVj+B4fl2oBBysh0Tmv6hDlUfQSZL+8TMDOTuaNs8b/Nb8c+vxJViLKg227/W1XtbFxcne3YaY
	ZjLLVY4d9DAvmhBM2nuHVo8PorbYRYCD85qi07ptg5izm2XgTmfONTvnt+VZKFztC5yrBzyTxVc
	zsojtGdyT+1B7VjN/96DKk3s4EHqw2DUAlNUA9XJ0Lc/er3o+ODFJPlowjs/f/ANrLdGuujjN6+
	5QwMlkbVbjye6CDmMMA3w0+dEatGmLGO1Xrm4H
X-Received: by 2002:a05:600c:a4b:b0:483:71f7:2797 with SMTP id 5b1f17b1804b1-483c9ba3785mr244820005e9.14.1772469019294;
        Mon, 02 Mar 2026 08:30:19 -0800 (PST)
Received: from [172.19.170.194] ([213.233.104.147])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b4d06c27sm10041568f8f.17.2026.03.02.08.30.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 08:30:18 -0800 (PST)
Message-ID: <0f19243e-60b2-42af-b059-fb19cec23826@tuxon.dev>
Date: Mon, 2 Mar 2026 18:30:16 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 03/15] PCI: renesas: rzg3s: Rework inbound window
 algorithm for multi-SoC support
To: John Madieu <john.madieu.xa@bp.renesas.com>,
 claudiu.beznea.uj@bp.renesas.com, lpieralisi@kernel.org,
 kwilczynski@kernel.org, mani@kernel.org, geert+renesas@glider.be,
 krzk+dt@kernel.org
Cc: robh@kernel.org, bhelgaas@google.com, conor+dt@kernel.org,
 magnus.damm@gmail.com, biju.das.jz@bp.renesas.com,
 linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, john.madieu@gmail.com
References: <20260227153236.55988-1-john.madieu.xa@bp.renesas.com>
 <20260227153236.55988-4-john.madieu.xa@bp.renesas.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260227153236.55988-4-john.madieu.xa@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

The patch title should be:

"PCI: rzg3s-host: Rework inbound window algorithm for multi-SoC support"

Sorry for missing it in the previous versions.

Thank you,
Claudiu

On 2/27/26 17:32, John Madieu wrote:
> The existing inbound window configuration algorithm has two issues that
> prevent proper operation on RZ/G3E:
> 
> 1. Over-mapping: Using roundup_pow_of_two() on the remaining region size
>     can result in windows that extend beyond the intended memory region.
> 
> 2. Alignment violation: Addresses are only aligned to 4K regardless of
>     the actual window size. According to the RZ/G3S HW manual (Rev.1.10,
>     section 34.6.6.7) and RZ/G3E HW manual (Rev.1.15, section 6.6.7.6),
>     bit carry must not occur when adding AXI Window Base and AXI Window
>     Mask registers. This effectively requires the base address to be
>     aligned to the window size.
> 
> RZ/G3E strictly enforces these constraints and requires precise window
> boundaries with properly aligned addresses.
> 
> Rework the algorithm to properly handle arbitrary region sizes and
> alignment constraints by splitting non-power-of-2 regions into multiple
> windows. The new approach iteratively selects the largest power-of-2
> size that:
>   - Fits within the remaining region (__fls of remaining size)
>   - Does not exceed the natural alignment of the CPU address (__ffs)
>   - Does not exceed the natural alignment of the PCI address (__ffs)
> 
> This ensures windows never over-map beyond the intended region and
> satisfies the hardware requirement that base address + mask must not
> cause bit carry, while maintaining the 4K * 2^N byte window size
> constraint.
> 
> The reworked algorithm is required for RZ/G3E support and remains
> fully compatible with RZ/G3S.
> 
> Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
> 
> Changes:
> 
> v7: No changes
> v6: No changes
> 
> v5:
>   - Updated HW manual section specification
>   - Collected Rb tag
> 
> v4: No changes
> v3: No changes
> v2: New patch
> 
>   drivers/pci/controller/pcie-rzg3s-host.c | 53 +++++++++++++-----------
>   1 file changed, 29 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/controller/pcie-rzg3s-host.c
> index 222891324374..7f5ffc5c218a 100644
> --- a/drivers/pci/controller/pcie-rzg3s-host.c
> +++ b/drivers/pci/controller/pcie-rzg3s-host.c
> @@ -1270,50 +1270,55 @@ static int rzg3s_pcie_set_inbound_windows(struct rzg3s_pcie_host *host,
>   	u64 pci_addr = entry->res->start - entry->offset;
>   	u64 cpu_addr = entry->res->start;
>   	u64 cpu_end = entry->res->end;
> -	u64 size_id = 0;
>   	int id = *index;
>   	u64 size;
>   
> -	while (cpu_addr < cpu_end) {
> +	/*
> +	 * According to the RZ/G3S HW manual (Rev.1.10, section 34.6.6.7) and
> +	 * RZ/G3E HW manual (Rev.1.15, section 6.6.7.6):
> +	 * - Each window must be a single memory size of power of two
> +	 * - Mask registers must be set to (2^N - 1)
> +	 * - Bit carry must not occur when adding base and mask registers,
> +	 *   meaning the base address must be aligned to the window size
> +	 *
> +	 * Split non-power-of-2 regions into multiple windows to satisfy
> +	 * these constraints without over-mapping.
> +	 */
> +	while (cpu_addr <= cpu_end) {
> +		u64 remaining_size = cpu_end - cpu_addr + 1;
> +		u64 align_limit;
> +
>   		if (id >= RZG3S_MAX_WINDOWS)
>   			return dev_err_probe(host->dev, -ENOSPC,
>   					     "Failed to map inbound window for resource (%s)\n",
>   					     entry->res->name);
>   
> -		size = resource_size(entry->res) - size_id;
> +		/* Start with largest power-of-two that fits in remaining size */
> +		size = 1ULL << __fls(remaining_size);
>   
>   		/*
> -		 * According to the RZ/G3S HW manual (Rev.1.10,
> -		 * section 34.3.1.71 AXI Window Mask (Lower) Registers) the min
> -		 * size is 4K.
> +		 * The "no bit carry" rule requires base addresses to be
> +		 * aligned to the window size. Find the maximum window size
> +		 * that both addresses can support based on their natural
> +		 * alignment (lowest set bit).
>   		 */
> -		size = max(size, SZ_4K);
> +		align_limit = min(cpu_addr ? (1ULL << __ffs(cpu_addr)) : ~0ULL,
> +				  pci_addr ? (1ULL << __ffs(pci_addr)) : ~0ULL);
>   
> -		/*
> -		 * According the RZ/G3S HW manual (Rev.1.10, sections:
> -		 * - 34.3.1.69 AXI Window Base (Lower) Registers
> -		 * - 34.3.1.71 AXI Window Mask (Lower) Registers
> -		 * - 34.3.1.73 AXI Destination (Lower) Registers)
> -		 * the CPU addr, PCIe addr, size should be 4K aligned and be a
> -		 * power of 2.
> -		 */
> -		size = ALIGN(size, SZ_4K);
> -		size = roundup_pow_of_two(size);
> -
> -		cpu_addr = ALIGN(cpu_addr, SZ_4K);
> -		pci_addr = ALIGN(pci_addr, SZ_4K);
> +		size = min(size, align_limit);
>   
>   		/*
> -		 * According to the RZ/G3S HW manual (Rev.1.10, section
> -		 * 34.3.1.71 AXI Window Mask (Lower) Registers) HW expects first
> -		 * 12 LSB bits to be 0xfff. Subtract 1 from size for this.
> +		 * Minimum window size is 4KB.
> +		 * See RZ/G3S HW manual (Rev.1.10, section 34.3.1.71) and
> +		 * RZ/G3E HW manual (Rev.1.15, section 6.6.4.1.3.(74)).
>   		 */
> +		size = max(size, SZ_4K);
> +
>   		rzg3s_pcie_set_inbound_window(host, cpu_addr, pci_addr,
>   					      size - 1, id);
>   
>   		pci_addr += size;
>   		cpu_addr += size;
> -		size_id = size;
>   		id++;
>   	}
>   	*index = id;

