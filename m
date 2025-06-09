Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F3B220F31
	for <linux-clk@vger.kernel.org>; Mon,  9 Jun 2025 20:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749500070; cv=none; b=oUieIrYsnJrbQfekWjl2Js7ubFJcJVIWQ5rAdcAfLvXSvYZ1Wl7i1wvW/sC1uYYXrW3m+uKMAI+SrC8n43OFax5Ed86JLf+MQvU53ZGDZ9VwoEPC6UM2GayJy+vGUBG6aFMYB7qCoTjWVbIol5vD/EwKp6LLyrOKl0Whx660HMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749500070; c=relaxed/simple;
	bh=cc13l7pbpIRdIEC25QVqWj0lamcvY3YyLME1tijvOPE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rMdMSewq9/6F55Oar7nmYR7vN0Oe6uIOhFzQry3XYgAibcSkEsWi7MtJJGvM9Ympbg5+DAGdC0i19R69URYQJEvSzZKdSDgIf9vO7xPaUqjlo+PUDYC/bMJZoI8dZf0rGHN+/KZ/r99/P15b0u4WoK5euUbB7lOxJrYEyxGLccA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=fBv/pCWD; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="fBv/pCWD"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6ecf99dd567so61618656d6.0
        for <linux-clk@vger.kernel.org>; Mon, 09 Jun 2025 13:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749500067; x=1750104867; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bFj+rnVnwrli61+RW3pW0hp2hmvQPvdmAdNSR40r1ZE=;
        b=fBv/pCWDZBsrmhi+S5m15nxdEmb6BnFtmvfNSy1cBdVTHR95TiSSrT8bjV/0jMq8bP
         yad/mpUqZw5k24orKm27KxVWETuwuHNyP+1ocWo8Khzcz5hmEf5QJ246igPfgIjGaPnc
         cYxUaoRvYWb9lkDlzYCUIxjyZijSyTVILgPDMwJn8H4luK6X/G2YMoRpwodgrJAqkRZX
         F/BAIaJey0SVFnBBun71bT5dTx9Sw7EVg9L4kyZ97xB3QtO/D4WMkdYEg4FVVEAyX1JA
         s9MRe5PAsc3YFDVi1qHTfauuAr24COOug7RINrORwnbhe8ZfdxWMWMal94RgXoTndp1m
         tbSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749500067; x=1750104867;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bFj+rnVnwrli61+RW3pW0hp2hmvQPvdmAdNSR40r1ZE=;
        b=ZYB3+PzZEWfLESC7Ib5SURYlT3GOyStKeIpeLrurDdqickwvl4BrLK3QVXTaQV8y/H
         5ao3jROsd0vD+CBO2U5SyPmuBSuQ7I/5IX6nsY7wuyzhQYW6wJ8gcj1ETXARbRU820Fe
         cByB6DHZpM8ltNt7CbDGNt2OfCeLHf5ZE2EjVkUR8DRxfZB80cGOHx1c13qShzkIcb8S
         V/p50sZ1XIEndKtnWiQ2CtI/debANLtjxJ4jSdt0S2Sfa1wIYuqngtTG3sMpiScNaHg/
         rSQnlFROi3ZBFGiP0rOccUQ7R6gjnMGmOzfLUrF21xjEQ8p1s0XSsaQPSf3B3JF7n1SB
         1vwg==
X-Forwarded-Encrypted: i=1; AJvYcCXIwlnEEzwH7FD7zNjOhY3ZxO4VbFULBO7Qp33m+Oh2U7jlYU7o2eNJNs2W8zingE123rf5zgfPg/o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrD8d/4ay5DpdI84odTJWVdtndyPjtFBLx2GS/pKer5gs4733h
	KZe3daPQsAcdmVzIfrhNL9Pt3oWDq8bMmdPOa0KsspoebVdYvCVmLVMOZGf5PHlWIv4=
X-Gm-Gg: ASbGncsKNSTVUdkjuermPaG73po+Hl0L73R9pyFOH/Hafkzso6RwIcUWYPRAOsl8tOB
	iH0affxXjp/peAejFcOWt6aMH1WRsaIvDvf48vXM6bFiJ/I70pZHA/O6gLylwYlmD1gdUMV9LKq
	LkJt7yYK+6GJWLgfWoOh5ND94lsneMhHFBQoFt3QRKLUwObtis1/I4bWICAanrpg9q5VbNsk8wy
	ZZW7l+RpA4FHxLtBl+FRM639xaTryhvK/iHpR9bcUNICFdjIIqHIdtvi3c8wrdugcDdcj+av3HD
	EA1j5cebYrHCaJd0V5MuGPtqPVWV5HcKtgN+1LsXcuI6U3mWZtskDh9gfctw/VLAgDCNEr9vk+T
	htwiJtIUrn75nR152x0oO6Z0sYR4IRU4m+OLU
X-Google-Smtp-Source: AGHT+IEoxsMyfv1zl4Eq2z6OuyNYN5zJiRV3axkBglw2RaCBqnFhaHAJb4H6tYu0A3sn+TFxdgVaMQ==
X-Received: by 2002:a05:6214:1256:b0:6fb:14:5e89 with SMTP id 6a1803df08f44-6fb08fe7f6fmr255840366d6.19.1749500067642;
        Mon, 09 Jun 2025 13:14:27 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb09ac8415sm56510096d6.27.2025.06.09.13.14.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 13:14:27 -0700 (PDT)
Message-ID: <17a7ab55-aa1a-4d1d-b8f6-27bbe51fe761@riscstar.com>
Date: Mon, 9 Jun 2025 15:14:26 -0500
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: spacemit: mark K1 pll1_d8 as critical
To: mturquette@baylibre.com, sboyd@kernel.org
Cc: dlan@gentoo.org, heylenay@4d2.org, inochiama@outlook.com,
 linux-clk@vger.kernel.org, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Guodong Xu <guodong@riscstar.com>
References: <20250609200822.468482-1-elder@riscstar.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250609200822.468482-1-elder@riscstar.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/9/25 3:08 PM, Alex Elder wrote:
> The pll1_d8 clock is enabled by the boot loader, and is ultimately a
> parent for numerous clocks, including those used by APB and AXI buses.
> Guodong Xu discovered that this clock got disabled while responding to
> getting -EPROBE_DEFER when requesting a reset controller.
> 
> The needed clock (CLK_DMA, along with its parents) had already been
> enabled.  To respond to the probe deferral return, the CLK_DMA clock
> was disabled, and this led to parent clocks also reducing their enable
> count.  When the enable count for pll1_d8 was decremented it became 0,
> which caused it to be disabled.  This led to a system hang.
> 
> Marking that clock critical resolves this by preventing it from being
> disabled.
> 
> Define a new macro CCU_FACTOR_GATE_DEFINE() to allow clock flags to
> be supplied for a CCU_FACTOR_GATE clock.
> 
> Fixes: 1b72c59db0add ("clk: spacemit: Add clock support for SpacemiT K1 SoC")
> Signed-off-by: Alex Elder <elder@riscstar.com>
> Tested-by: Guodong Xu <guodong@riscstar.com>

I'm very sorry, this path is v2 and I neglected to indicate that
in the subject line.  Here is v1:
   https://lore.kernel.org/lkml/20250607202759.4180579-1-elder@riscstar.com/

					-Alex
> ---
> v2: Reworded the description to provide better detail
> 
>   drivers/clk/spacemit/ccu-k1.c  |  3 ++-
>   drivers/clk/spacemit/ccu_mix.h | 21 +++++++++++++--------
>   2 files changed, 15 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
> index cdde37a052353..df65009a07bb1 100644
> --- a/drivers/clk/spacemit/ccu-k1.c
> +++ b/drivers/clk/spacemit/ccu-k1.c
> @@ -170,7 +170,8 @@ CCU_FACTOR_GATE_DEFINE(pll1_d4, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(3), 4,
>   CCU_FACTOR_GATE_DEFINE(pll1_d5, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(4), 5, 1);
>   CCU_FACTOR_GATE_DEFINE(pll1_d6, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(5), 6, 1);
>   CCU_FACTOR_GATE_DEFINE(pll1_d7, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(6), 7, 1);
> -CCU_FACTOR_GATE_DEFINE(pll1_d8, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(7), 8, 1);
> +CCU_FACTOR_GATE_FLAGS_DEFINE(pll1_d8, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(7), 8, 1,
> +		CLK_IS_CRITICAL);
>   CCU_FACTOR_GATE_DEFINE(pll1_d11_223p4, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(15), 11, 1);
>   CCU_FACTOR_GATE_DEFINE(pll1_d13_189, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(16), 13, 1);
>   CCU_FACTOR_GATE_DEFINE(pll1_d23_106p8, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(20), 23, 1);
> diff --git a/drivers/clk/spacemit/ccu_mix.h b/drivers/clk/spacemit/ccu_mix.h
> index 51d19f5d6aacb..668c8139339e1 100644
> --- a/drivers/clk/spacemit/ccu_mix.h
> +++ b/drivers/clk/spacemit/ccu_mix.h
> @@ -101,16 +101,21 @@ static struct ccu_mix _name = {							\
>   	}									\
>   }
>   
> +#define CCU_FACTOR_GATE_FLAGS_DEFINE(_name, _parent, _reg_ctrl, _mask_gate, _div,	\
> +			       _mul, _flags)					\
> +struct ccu_mix _name = {							\
> +	.gate	= CCU_GATE_INIT(_mask_gate),					\
> +	.factor	= CCU_FACTOR_INIT(_div, _mul),					\
> +	.common = {								\
> +		.reg_ctrl	= _reg_ctrl,					\
> +		CCU_MIX_INITHW(_name, _parent, spacemit_ccu_factor_gate_ops, _flags)	\
> +	}									\
> +}
> +
>   #define CCU_FACTOR_GATE_DEFINE(_name, _parent, _reg_ctrl, _mask_gate, _div,	\
>   			       _mul)						\
> -static struct ccu_mix _name = {							\
> -	.gate	= CCU_GATE_INIT(_mask_gate),					\
> -	.factor	= CCU_FACTOR_INIT(_div, _mul),					\
> -	.common = {								\
> -		.reg_ctrl	= _reg_ctrl,					\
> -		CCU_MIX_INITHW(_name, _parent, spacemit_ccu_factor_gate_ops, 0)	\
> -	}									\
> -}
> +	CCU_FACTOR_GATE_FLAGS_DEFINE(_name, _parent, _reg_ctrl, _mask_gate, _div,	\
> +			       _mul, 0)
>   
>   #define CCU_MUX_GATE_DEFINE(_name, _parents, _reg_ctrl, _shift, _width,		\
>   			    _mask_gate, _flags)					\
> 
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494

