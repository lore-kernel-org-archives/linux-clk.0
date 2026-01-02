Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817B827E1A1
	for <linux-clk@vger.kernel.org>; Fri,  2 Jan 2026 15:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767368557; cv=none; b=VYe19DL1nug8F9Ms85ThnNzFxXFd/erpryT8wRiSNKt7lcqwEoGtFT+UXyQe/Cis90rXUMsUFaIkNhdrgLT415WsSh/uWjALNFtVJtzDrjZqoOTS2j0Y7gPhrvjuo4w/lrRd5DOehs6Sn/qLH9pwFDBARwSHHqVTAkgPYnsRQjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767368557; c=relaxed/simple;
	bh=BmM5e78HhKYOvlDIYE4RRFqZBVOR4W9ZbNBx6py87uQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vFZ5ssGu0UA+i1GIs8Z/MaOFVDmqZKLN56G6+ytrT9BB0SeQfUd3D00qa+paBjIjKc0aX18rWCWLcg0b7zmT2cSK0K5KhjiwbueZl+sYqGhG66aYQzFozEiRd40rqt+MXHaGes/k1gV9c4+9JqDbPbY0ZB5Ocl6xC6lBjeDsViI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=DBwHoYRQ; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="DBwHoYRQ"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-88a35a00506so135098976d6.2
        for <linux-clk@vger.kernel.org>; Fri, 02 Jan 2026 07:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767368553; x=1767973353; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1kRQ6lI0yURL+aAlnleRfH8zPOO8HWmEFC9LuCb81Lw=;
        b=DBwHoYRQDzxlkM8KkPtVkBHGxfDmFeOkjO7kugWf/goGAUgmaLnYZEbFcMuQrCA2vO
         8Cz4Y9OLCNcg7TaAbYmHJIPfT3boTycwMSjS3mK57eOdM8pe/cpS4LL3VlNdzPMLE0IO
         5PruzKJe3vcHZREeGXoPg4RKo/Y1iEOxQ2IDNk/qb8cAlkfqOguEk0fBPO6+0jR4n3LH
         5grU/3n/gWH8GWe97+FvXsfp2T/J895/vdXeIKcfd04ZQiRLqqwDee0M8rWGRoW3zkvx
         cs5EVQZNqZ8XfsQnEV32uFGQroyGpG4JWYg/vfjxszgWv9egy15l6RW+vjgiSz/1Jrb6
         8UPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767368553; x=1767973353;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1kRQ6lI0yURL+aAlnleRfH8zPOO8HWmEFC9LuCb81Lw=;
        b=A5ls0fmThpYbdhO/+kbxFCWg8R6JAzekuBnkzw5++LvewXDdnCO8zEGVwqqNxlYeXJ
         +nBJUvN4HgKlEzBGkYa7+MDEIQRi7Na4ZWx2cQe7CD++U16zIyw4FbBGX5L9HkUp+JZ5
         ny5ZaVNVcosyFvvg/7LWkDaeBwEWzU050UbifvVSTBHnwjhMqF55aF8bxARIUfvBegrQ
         lw8Ns8vqShoW5Qv9i3jKdh2H1GmLXr7dOW1sUItutxCUumykXM3Nj/dUcfDFIlBqKzb9
         d2FhZTLggeUjjwJispvkQTVtyewBsqbM0uRhCmojJGjv/MoitFhXFE2hpK6PtyAIhza6
         AEuw==
X-Forwarded-Encrypted: i=1; AJvYcCV7eSb54nSuRyonJrXI5mNEYG9zt2JSGoNTS3rVZ/6qs8WCTqni86EDdHjMjaGwc2p6Hn+jvNyLMZ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOy6nn+eO/pOTUdxgZo2I/EeH48FJkBoNRamFN/8WyOaWr1eKf
	KrEgbWZAeVnsJ/9uMXU8vH0TYvudAGvqLDhJJMMn8QN+MfpMlY4rw0s5N86d+MQkhUs=
X-Gm-Gg: AY/fxX5oJ0CHqGvvR2PU5Fpohp4YMfLywO5LbNRWwJIlnkrsNDiUNp3VJu5yThBGg4j
	STYAvLzRswSTlsLHggAKvsezk2ZlEaNEq8nvxCLNaMZNGU0Zop1+Pc0+iFxyK1mXhHC0TrSij1f
	p/O6wPDctJ6Hwi5gAeSKxwMPbWPu0GO/yIsbwez88o7Xaz+UKqUNz2xysBD04XNll8c/PwKB0ZP
	LHSAB3RIS1L6Wr81Z7oujuSsempnGuf2cM+y2wyFWhDh/XCSgg/osXjqqKiwFiz3JetCGLpwRn1
	5Di7IhV64PlXLlnwUCHIYt8shejQTAdVM1D8xCP5uH3Nm1gvFwI3inD2lqfdcMCjVGDxqJ1Vq0g
	WjqD9YOAnX+iWSs1b5o6gJPdzcQT9xIyZYkQ5ba+mVMKxMEcU3E7Nms+LedYNoakpZ9EGto7RID
	CH0weO+P3GM9ue0ond1wSHZScLOjs23m+N/raOEEVP96HAoYFShSw=
X-Google-Smtp-Source: AGHT+IHarPGP+a/gi2jHTk/zZ1FUDX+GiXA1A9njg4s5U5Nap7W/VCsy/W+a7XWuBcfyTfBnYizIrQ==
X-Received: by 2002:a05:6214:246f:b0:88f:e332:c009 with SMTP id 6a1803df08f44-88fe332c1f5mr429892206d6.12.1767368553381;
        Fri, 02 Jan 2026 07:42:33 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d997aeff4sm326161116d6.29.2026.01.02.07.42.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jan 2026 07:42:33 -0800 (PST)
Message-ID: <cc1cb833-2c4a-4e20-a50d-109a4919e274@riscstar.com>
Date: Fri, 2 Jan 2026 09:42:32 -0600
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] clk: spacemit: prepare common ccu header
To: Yixun Lan <dlan@gentoo.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Guodong Xu <guodong@riscstar.com>,
 Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev
References: <20251226-06-k1-clk-common-v2-0-28b59418b4df@gentoo.org>
 <20251226-06-k1-clk-common-v2-1-28b59418b4df@gentoo.org>
 <17c27455-897d-4249-8206-88364230af7d@riscstar.com>
 <20260101143810-GYC2019108@gentoo.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260101143810-GYC2019108@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/1/26 8:38 AM, Yixun Lan wrote:
> Hi Alex,
> 
> On 18:50 Mon 29 Dec     , Alex Elder wrote:
>> On 12/26/25 12:55 AM, Yixun Lan wrote:
>>> In order to prepare adding clock driver for new SoC, extract common
>>> ccu header file, so it can be shared by all drivers.
>>
>> You are moving the definition of the SpacemiT CCU auxiliary
>> device structure, plus the to_spacemit_ccu_adev() function,
>> into a new header file.
> yes, and this is explaining the code which I consider not necessary,
> it's more obvious to read the code..
> 
>> The reason you're doing this is
>> because these two things are generic, but they're defined
>> in the K1 SoC-specific header file "k1-syscon.h".  So you
>> are creating a new header file for this purpose.
>>
> right
>> These are things you should explain here, to help orient
>> reviewers and will inform anyone in the future looking at
>> commit history.
> I thought I've explained the goal/motivation already with above
> commit message, maybe I can improve it, so how about:
> 
> In order to prepare adding clock driver for new K3 SoC, extract generic
> code to a separate common ccu header file, so they are not defined
> in K1 SoC-specific file, and then can be shared by all drivers.

This would be much better.  You don't need to explain every detail
of the code, but providing the motivation this way and explaining
it at a high level helps the reader a lot.

>>> Also introduce a reset name macro, so it can be both used in clock
>>> and reset subsystem, explicitly to make them match each other.
>>
>> This should go in a separate patch, and should change the
>> code to use the macro so it builds and continues to function
>> with the new change place.
>>
> yes, I could do this in a separate patch
> 
>> However I don't understand why you think it's necessary to
>> introduce the reset name macro.  Is it because you want to
>> incorporate an SoC identifier in the name?
>>
> I've explained here:
> https://lore.kernel.org/r/20251231020951-GYA2019108@gentoo.org
> 
> It's necessary to incorporate the SoC identifier which will help
> to differentiate K1 and K3 reset driver, otherwise there will be
> driver name collision, lead to reset driver probe failure while
> adding K3 SoC ..

I just had a talk with Guodong and he helped clear up a
misunderstanding I had about this.  I was thinking about
what happens at probe time, and that only the K1 or the
K3 CCU will get registered.

But he explained that the issue is that two *drivers* claim
to support the same "compatible" auxiliary device name, and
even if only the K1 CCU got registered, both reset drivers
are available in the kernel and you still need to specify
which reset driver you want use.

You are implementing both the K1 and K3 reset code in the
same module, which I think is why this is necessary.

>> Even if this is your reason, I still don't think you need
>> the macro.  I'll try to explain what I mean in the
>> next patch.
>>
> If you still have concerns, and we can't reach certain agreement,
> then I could drop this macro in next version, leave this optimization
> to future patches, I don't want main clock driver delayed by it.

No I no longer have concerns and I accept that you need to
encode the platform/SoC in the reset auxiliary device name.

> I personally tend to keep the macro, but probably the naming need some
> improvement..

What I'd prefer is to just name the resets directly, to encode the
platform ("k1" or "k3") where defined.  I.e.,

  static const struct spacemit_ccu_data k1_ccu_mpmu_data = {
-	.reset_name	= "mpmu-reset",
+	.reset_name	= "k1-mpmu-reset",
  	.hws		= k1_ccu_mpmu_hws,
  	.num		= ARRAY_SIZE(k1_ccu_mpmu_hws),
  };

Does this lead to a problem somewhere else?  What does hiding
this convention behind the _K_RST() macro do that's better
than this?  Is it because you want the separate clock and
reset drivers to use the same convention?

I think it's a little more difficult to talk about this because
we're talking about changes that are implemented by two separate
patch series.

>> One more comment, below.
>>
>>> Signed-off-by: Yixun Lan <dlan@gentoo.org>
>>> ---
>>>    include/soc/spacemit/ccu.h       | 21 +++++++++++++++++++++
>>>    include/soc/spacemit/k1-syscon.h | 13 +++----------
>>>    2 files changed, 24 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/include/soc/spacemit/ccu.h b/include/soc/spacemit/ccu.h
>>> new file mode 100644
>>> index 000000000000..84dcdecccc05
>>> --- /dev/null
>>> +++ b/include/soc/spacemit/ccu.h
>>> @@ -0,0 +1,21 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +
>>> +#ifndef __SOC_SPACEMIT_CCU_H__
>>> +#define __SOC_SPACEMIT_CCU_H__
>>> +
>>> +#include <linux/auxiliary_bus.h>
>>> +#include <linux/regmap.h>
>>> +
>>> +/* Auxiliary device used to represent a CCU reset controller */
>>> +struct spacemit_ccu_adev {
>>> +	struct auxiliary_device adev;
>>> +	struct regmap *regmap;
>>> +};
>>> +
>>> +static inline struct spacemit_ccu_adev *
>>> +to_spacemit_ccu_adev(struct auxiliary_device *adev)
>>> +{
>>> +	return container_of(adev, struct spacemit_ccu_adev, adev);
>>> +}
>>> +
>>> +#endif /* __SOC_SPACEMIT_CCU_H__ */
>>> diff --git a/include/soc/spacemit/k1-syscon.h b/include/soc/spacemit/k1-syscon.h
>>> index 354751562c55..13efa7a30853 100644
>>> --- a/include/soc/spacemit/k1-syscon.h
>>> +++ b/include/soc/spacemit/k1-syscon.h
>>> @@ -5,17 +5,10 @@
>>>    #ifndef __SOC_K1_SYSCON_H__
>>>    #define __SOC_K1_SYSCON_H__
>>>    
>>> -/* Auxiliary device used to represent a CCU reset controller */
>>> -struct spacemit_ccu_adev {
>>> -	struct auxiliary_device adev;
>>> -	struct regmap *regmap;
>>> -};
>>> +#include "ccu.h"
>>>    
>>> -static inline struct spacemit_ccu_adev *
>>> -to_spacemit_ccu_adev(struct auxiliary_device *adev)
>>> -{
>>> -	return container_of(adev, struct spacemit_ccu_adev, adev);
>>> -}
>>> +/* Reset name macro, should match in clock and reset */
>>> +#define _K_RST(_unit)			"k1-" #_unit "-reset"
>>
>> The generic-sounding _K_RST() encodes "k1" in the name,
>> and it shouldn't.  Also, why do you use the underscore
>> prefix?
>>
> want to make it slightly generic/short but still keep it local for K1 driver,
> and also avoid potential collision with other drivers in kernel code..
> 
> or do you have any sugestion for better naming?

First, I suggest you avoid even using such a macro.  But I
could be wrong about that too...

I would name it RESET_NAME(_unit) or something similar.  It's
only used by code and DTS files that are related to SpacemiT
platforms.

					-Alex

>> Anyway, I'll keep reading.
>>
>> 					-Alex
>>
>>>    
>>>    /* APBS register offset */
>>>    #define APBS_PLL1_SWCR1			0x100
>>>
>>
>>
> 

