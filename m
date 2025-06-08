Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC38BDDD2
	for <linux-clk@vger.kernel.org>; Sun,  8 Jun 2025 02:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749350769; cv=none; b=NVWs2s3eMsgC2Q+XEm+drEQgAh255+LFpszJ5710INvzQexAy+pwWbZ72R0w/kRz56cPr5eS2IGsrhPNt7I1iSvfQCqJA67kP8YQV1YsX7+6E6kKoRcwDmm2fMReyu/MHTStUAG0cI9Ko8JDHHPyKeXdolP8w+wasohx7SzcYdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749350769; c=relaxed/simple;
	bh=sbrcsHTmbxDWv2xzR3QkrCKS13gtbihALR0xuZrktpI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NMKnZZ2blmY4EE6Nbve/7/1PMaYP31Rf1oQ3DuFCKbdpvpFh4B4v4awsbWZZ06UI99RY9HUI3tOElWD64HWtYqLjalcPiHgiB9ItMTqWRLiyr+1DrIZH9jwzF4CSryqZz9cMUTPt+lLlCItdxPajuVUhWR9ft4A1atJ2choxoe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=SRrZzLhw; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="SRrZzLhw"
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3da73df6b6bso11057665ab.3
        for <linux-clk@vger.kernel.org>; Sat, 07 Jun 2025 19:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749350766; x=1749955566; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T6iIhbceoQuwTeHmSeghxdQElE23Mh4WO7mr5HdlCAY=;
        b=SRrZzLhwUMGfUBV35EWS2QgOLkq5IMKYc0uhwRweD3lzR0rr27Uva46gyESNM/qdMk
         eBPfBru0jpNpoJvK+tsAGS6aU0xiBC63BJ3W6eBhlUl9W0YYxAMRKr0WRPjdqDPdKfa7
         MjLZRrLCM47u/OuC9ZYYpf1EKnxOFUWlZz4hYuFjXZsRa2qhLcQuLOZSol3hAfhQ0xdh
         3OV4XQwZ5ua7jiwbcnvUh5jL7xP4eD1dhTh2qAmT2wmA0Q5uGjZACbaBmldy7nc5HZXM
         s120Devqho/bmsRu5+lEKKW7sIkhnRrzVbuEQmA9u/LJJvOp7PwrDz9D0cUgLixop5Vj
         p5dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749350766; x=1749955566;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T6iIhbceoQuwTeHmSeghxdQElE23Mh4WO7mr5HdlCAY=;
        b=v9S0JGnggXqYq20YAC2O1wd4ybxs56D+y1w9qJUuoY6rKQkEYGLFgYtshegAlb0VMV
         JSAbqvq0rYogQcM+/jq/ypzwFrnGgoQ44tofaL4gD1QGLplJpENJJVdPDlH2n3tkBIPb
         7a1PbipFOgEmklnAsTgqFgVPIUc0nXvm3yTSXp9+yjTc4Wf79pMxz7fN8tcSPQcMPpw7
         Xsh+O4TeZ9kCMTJA8BKw6yHujkDJLa9bYAoENSibCDJNMPEO6T7gSaUb9qpUhq5t11IE
         lHzZj5B7OvXeqk5H1Z9cYxUG39004ufa52lLde6GWekgdwym1PJnFZafEgkgJv2plH9H
         2Q9w==
X-Forwarded-Encrypted: i=1; AJvYcCVY/24EmZmDXmzpi2krK+ZBQELF8TwysEUXBmnssL4uYptoDVXNkTwXNY2s+x2rcdy6h8lOd136a9o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxbPBGaTKiBcQSiOwAfj7lTIGtU39ejr6/FdcX2x+a2Sn1yjjv
	013zHAT1zQFxruuLna+xF84YwjzzhFh7n4pCULeEDpjm/Cv//2k5RzfQ8r2jlD28akM=
X-Gm-Gg: ASbGncullOlOoDwTMZ84WUnb/wpp98nnzhTQ1c8DZn2vg+A51i/wi6UCm8yFO3IMAsT
	hDrMA18h7cXbw+ED1/9dadX8KLNHbgkJSW0OqJsFZpxnPP3QyiGP5xVTzoaLPQTL1BlrWOmsAZn
	8kkTCrQGot5/urHFx2crzOYo2x+SeiLAsZb/39ZOftzTMKEmM2xSRfytHxJC1mKi7Ok4hniMxLN
	edszkmoouxEZVPptxlGost+TXN2Ozn/1FIcmnIDipBudNt78u1GscdL9Jt84GvNQcjt3KVrQkUZ
	76karF68sDGaNG/uY6/36nfRuQaD4jgckaFW5n7jomZgqskVyAeIsukrW0hDvaEA2Xzi2eEmMZY
	czX9iHfc7QEeFSN1EFXTICWWIFi/I1A==
X-Google-Smtp-Source: AGHT+IHwCjCm36e79bC5Bu1U8XdSHZuI9qJZLbLDC5YMdrmL4eFKJnEgWTECu5fJD8WyGogJaem5yg==
X-Received: by 2002:a05:6e02:1c0f:b0:3dd:a13c:b663 with SMTP id e9e14a558f8ab-3ddce495e82mr79030935ab.14.1749350765662;
        Sat, 07 Jun 2025 19:46:05 -0700 (PDT)
Received: from [10.211.55.5] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-500df420439sm1193111173.32.2025.06.07.19.46.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Jun 2025 19:46:05 -0700 (PDT)
Message-ID: <52c27139-20aa-4995-b3b5-290df13f1ec9@riscstar.com>
Date: Sat, 7 Jun 2025 21:46:03 -0500
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: spacemit: mark K1 pll1_d8 as critical
To: Yixun Lan <dlan@gentoo.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, heylenay@4d2.org,
 inochiama@outlook.com, linux-clk@vger.kernel.org, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Guodong Xu <guodong@riscstar.com>
References: <20250607202759.4180579-1-elder@riscstar.com>
 <20250608002453-GYA108101@gentoo>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250608002453-GYA108101@gentoo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/7/25 7:24 PM, Yixun Lan wrote:
> Hi Alex,
> 
> On 15:27 Sat 07 Jun     , Alex Elder wrote:
>> The pll1_d8 clock is enabled by the boot loader, and is ultimately a
>> parent for numerous clocks.  Guodong Xu was recently testing DMA,
>              ~~~~~~~~~this is still vague, numerous isn't equal to critical

I will give you a full explanation of what I observed, below.

>> adding a reset property, and discovered that the needed reset was
>> not yet ready during initial probe.  It dropped its clock reference,
>> which dropped parent references, and along the way it dropped the sole
>> reference to pll1_d8 (from its prior clk_get()).  Clock pll1_d8 got
>> disabled, which resulted in a non-functioning system.
>>
> So, I'm trying to understand the problem, and would like to evaluate if
> the "critical" flag is necessary..
> 
> It occurs to me, the DMA driver should request and enable clock first,
> then request and issue a reset, it probably could be solved by proper

No, that is not the issue.  The reset is never deasserted.

> order? so what's the real problem here? is DMA or reset? dropped the
> clock? or does driver fail to request a reset before clock is ready?

The problem is with the pll1_d8 clock.  That clock is enabled
successfully.  However the reset isn't ready, so the clock
gets disabled, and its parent (and other ancestors) also get
disabled while recovering from that.

I'll give you a high-level summary, then will lay out a ton of
detail.

In the DMA driver probe function, several initial things happen
and then, a clock is requested (enabled):
   <&syscon_apmu CLK_DMA>
That succeeds.

Next, a reset is requested:
   <&syscon_apmu RESET_DMA>
But that fails, because the reset driver probe function hasn't
been called yet.  The request gets -EPROBE_DEFER as its result,
and the DMA driver starts unwinding everything so that it can
be probed again later.  Dropping the clock reference results
in parent clocks dropping references.  And because pll1_div8
initially had a reference count of 0 (despite being on),
dropping this single reference means it gets disabled.  Then
we're stuck.


Here is how the DMA clock is supplied (at boot time):

pll1 -> pll1_d8 -> pll1_d8_307p2 -> pmua_aclk -> dma_clk

pll1 and pll1_d8 are enabled by the boot loader, but at this
time the drivers for various hardware that require them aren't
"getting" and enabling them (yet).

devm_clk_get_optional_enabled() causes clk_prepare_enable()
to be called on the target clock (pll1_d8).  That simply calls
clk_prepare() and clk_enable().  Let's focus on the latter.
     clk_enable(dma_clk)
       clk_core_enable_lock()

So now the clock enable lock is held.  The target clock's
enable_count for pll1_d8 is 0.

   clk_core_enable(dma_clk)
     clk_core_enable(parent = pmua_aclk)
     ...
     enable_count++ (on dma_clk)

The parent gets enabled (I'm fairly certain pmua_clk's
enable_count is also 0).

   clk_core_enable(pmua_aclk)
     clk_core_enable(parent = pll1_d8_307p2)
     ...
     enable_count++ (on pmua_clk)

And so on.  When the clk_enable(dma_clk) completes, we have
these enable counts:
   dma_clk:		1
   pmua_clk:		1
   pll1_d8_307p2:	1
   pll1_d8:		1
   pll1:			1? (I don't recall)

The -EPROBE_DEFER causes the  devm_clk_get_optional_enabled()
for dma_clk to get undone.  That means clk_disable_unprepare()
gets called on dma_clk.  Let's just focus on clk_disable().

   clk_disable(dma_clk)
     clk_core_disable_lock(dma_clk)
       (takes clk_enable lock)
       clk_core_disable()
         --enable_count becomes 0 (on dma_clk)
         (disables dma_clk)
         clk_core_disable(core->parent = pmua_aclk)

   clk_core_disable(pmua_aclk)
     --enable_count becomes 0 (on pmua_clk)
     (disables pmua_clk)
     clk_core_dissable(core->parent = pll1_d8_307p2)

   clk_core_disable(pll1_d8_307p2)
     --enable_count becomes 0 (on pll1_d8_307p2)
     (disables pll1_d8_307p2)
     clk_core_dissable(core->parent = pll1_d8)

   clk_core_disable(pll1_d8\)
     --enable_count becomes 0 (on pll1)
     (disables pll1_d8)
     BOOM

I hope this is clear.

					-Alex


>> Mark that clock critical so it doesn't get turned off in this case.
>> We might be able to turn this flag off someday, but for now it
>> resolves the problem Guodong encountered.
>>
>> Define a new macro CCU_FACTOR_GATE_DEFINE() to allow clock flags to
>> be supplied for a CCU_FACTOR_GATE clock.
>>
>> Fixes: 1b72c59db0add ("clk: spacemit: Add clock support for SpacemiT K1 SoC")
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> Tested-by: Guodong Xu <guodong@riscstar.com>
>> ---
>>   drivers/clk/spacemit/ccu-k1.c  |  3 ++-
>>   drivers/clk/spacemit/ccu_mix.h | 21 +++++++++++++--------
>>   2 files changed, 15 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
>> index cdde37a052353..df65009a07bb1 100644
>> --- a/drivers/clk/spacemit/ccu-k1.c
>> +++ b/drivers/clk/spacemit/ccu-k1.c
>> @@ -170,7 +170,8 @@ CCU_FACTOR_GATE_DEFINE(pll1_d4, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(3), 4,
>>   CCU_FACTOR_GATE_DEFINE(pll1_d5, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(4), 5, 1);
>>   CCU_FACTOR_GATE_DEFINE(pll1_d6, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(5), 6, 1);
>>   CCU_FACTOR_GATE_DEFINE(pll1_d7, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(6), 7, 1);
>> -CCU_FACTOR_GATE_DEFINE(pll1_d8, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(7), 8, 1);
>> +CCU_FACTOR_GATE_FLAGS_DEFINE(pll1_d8, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(7), 8, 1,
>> +		CLK_IS_CRITICAL);
>>   CCU_FACTOR_GATE_DEFINE(pll1_d11_223p4, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(15), 11, 1);
>>   CCU_FACTOR_GATE_DEFINE(pll1_d13_189, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(16), 13, 1);
>>   CCU_FACTOR_GATE_DEFINE(pll1_d23_106p8, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(20), 23, 1);
>> diff --git a/drivers/clk/spacemit/ccu_mix.h b/drivers/clk/spacemit/ccu_mix.h
>> index 51d19f5d6aacb..668c8139339e1 100644
>> --- a/drivers/clk/spacemit/ccu_mix.h
>> +++ b/drivers/clk/spacemit/ccu_mix.h
>> @@ -101,16 +101,21 @@ static struct ccu_mix _name = {							\
>>   	}									\
>>   }
>>   
>> +#define CCU_FACTOR_GATE_FLAGS_DEFINE(_name, _parent, _reg_ctrl, _mask_gate, _div,	\
>> +			       _mul, _flags)					\
>> +struct ccu_mix _name = {							\
>> +	.gate	= CCU_GATE_INIT(_mask_gate),					\
>> +	.factor	= CCU_FACTOR_INIT(_div, _mul),					\
>> +	.common = {								\
>> +		.reg_ctrl	= _reg_ctrl,					\
>> +		CCU_MIX_INITHW(_name, _parent, spacemit_ccu_factor_gate_ops, _flags)	\
>> +	}									\
>> +}
>> +
>>   #define CCU_FACTOR_GATE_DEFINE(_name, _parent, _reg_ctrl, _mask_gate, _div,	\
>>   			       _mul)						\
>> -static struct ccu_mix _name = {							\
>> -	.gate	= CCU_GATE_INIT(_mask_gate),					\
>> -	.factor	= CCU_FACTOR_INIT(_div, _mul),					\
>> -	.common = {								\
>> -		.reg_ctrl	= _reg_ctrl,					\
>> -		CCU_MIX_INITHW(_name, _parent, spacemit_ccu_factor_gate_ops, 0)	\
>> -	}									\
>> -}
>> +	CCU_FACTOR_GATE_FLAGS_DEFINE(_name, _parent, _reg_ctrl, _mask_gate, _div,	\
>> +			       _mul, 0)
>>   
>>   #define CCU_MUX_GATE_DEFINE(_name, _parents, _reg_ctrl, _shift, _width,		\
>>   			    _mask_gate, _flags)					\
>> -- 
>> 2.45.2
>>
> 

