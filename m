Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A302E62B5
	for <linux-clk@vger.kernel.org>; Tue,  6 Jan 2026 23:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767742955; cv=none; b=ICB1D4v/v81y4S+L7QDldk8z91rGQodPAsAwrGU4qrU9tfsYIaQpFVVZ5QY1lfOz6OT8U71cz42PjmjAiLEP2UGQUq3tIaUtBqk8TB1cWj/r2roliaTzxqsSNjtxMUH6WgzBYE0wFRNuZz1d7rhFHky1VeQCTDptNMeGTBZgifg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767742955; c=relaxed/simple;
	bh=R6rj8LEgrtzYQ38K9/1rCGRowH0wALW9nTTNR9nIww8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OoHvfRvckEhynvG2MQpsgeCBOwwajVB0Pq7aKzVljzyWBdRthFVpagFQ/WSUT8XX8+sgCRahrWahsuw1hBjxrJmyLj7dV1kKke/98zxkOcXk831ABnlXzJhlOLY4fQQH279pxsbNiIvXKgVSGsgbRoZ9LZAVOJMMcbLe4G2sepI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=R9e3R3aI; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="R9e3R3aI"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-88ffcb14e11so16456836d6.0
        for <linux-clk@vger.kernel.org>; Tue, 06 Jan 2026 15:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767742951; x=1768347751; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OfChIqKNcwmrZLIiAT7R5xSM6Gp2o3yGw0q++DE8G1k=;
        b=R9e3R3aIJfsKlMb4q3TokQOSdTdzioFlNNiK6CIhmwSfWMRCrLzXZR5/GHdednIfWV
         Wx+/Eqyg2TbTzioWX6peUUOEGMBEjurB6hcuVYxqrYA8P3fXgr77NKssgkJZDqM2Qukc
         1zznnDBvBE/AisAdT8mDzC11fQOdVews37ZBisEcBy7JNLN+9CGTverMliM8wzC4V5HS
         tNEjYVBzBKdaN6Q/zKyiF7bg39HWfmyCdmRNfa5i4B2bYO22icLUJbwUVaeFvv+lAxtt
         pr2omE9Nkg1/Y/AWRIPFc5njF/MuQtfp6uIzIFbDlFu7z34xdJL3J8T9SHwHHV5aoc/Y
         CoiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767742951; x=1768347751;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OfChIqKNcwmrZLIiAT7R5xSM6Gp2o3yGw0q++DE8G1k=;
        b=DL48W0DqpHpBb9WhMjjqFd2Pfrq1XlWV2hBUoRF7sdCnYOG+x8cxXw81aofD643A+6
         GzEKgG/NUK2PsB2XdWXSCJpyUQA4BRCGw9S7iAiSauXNcre9XU/V/cn+qsVzvZzLAHH1
         r8AZhBKM92YAM53tHTsXGG9EaazJTAOCNzNQbvmwmofK3oh6CGdI6ZVYv8fkIJ9lPyfr
         F5MzoXkRmKS8z8l96vEdGBuvDDS/UVsXA2wRctIallVgqmxmnCSZOQpOANZRSvaMU34p
         s/XHgJ5m23RVjba/i00Y89pMgrLHVClMbCOEEq2UECNpkJXW+VV+mLZdFlNUGqP07Vko
         0V/g==
X-Forwarded-Encrypted: i=1; AJvYcCW21uEwpkqAEr0cRaC0gN0iunnodg/jyq0lDw3C3j5Seb7E7vnBGbDLS9Q1vWnfuGtf6Clzuoq7T70=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQgUbUtqdZVWkekgM6cuT51lgHl30rr5nkoFn/gnl6s8QpJ23C
	86Z2wzuKvi4KNO25t3EPwclek6RxjPi+tKLdWUC17zX+xUJO8LsJYTOzjAiQFhI0PHM=
X-Gm-Gg: AY/fxX6+D/0flSbJbxbOLEHcVptUq1eSJV0/FR2+sKkO2zlZEq4hVBDcchVMH3DT2d3
	ktSmDuJs0CrZv6dZqoyR8KN+nzofRMAXUfpABRkv2H0jD8BhuHioxg/EDLvALQ/D4eo+2ZLIULv
	mRI2bNTU1v6cRL17Z3wANHA35VPMbsEH97YYYKnE9wjeNq2yYdfZa5/sPCdTTPn+bE8A1S+Ivof
	yfN9YOr79JiCYPJg9HCcxDgFYOq3gZagxdk+m0rhQPWj+LBccu0f1lBrORySSACYat50phQlaJ6
	hbdEvjkQNWISNcfAcNwm3bX5wxgQTAowEB/nLJok0rUXLFJt2uU8AwAed1BpA1fUv81eqjadCp9
	c2hjokT5hgj0m9aKRGl3w+cS+7LpPKz7kwwJYCsC7FCrffY0s+uoEFQfZyOV7DLixVkbIb/PeuT
	et9dFlZhVe4HFLm4A+i4Pbq3DdtQ0wERAyccc6YYf8PG03VXWPSNc=
X-Google-Smtp-Source: AGHT+IH1hw6SHnlsa+o57uQvBqGquCSnLrP81cZqJwz2JA/4lI4rccbRN4fom/VIn/Px/30MwTS1Zw==
X-Received: by 2002:a05:6214:d49:b0:888:710a:1750 with SMTP id 6a1803df08f44-890841ae7eemr10031776d6.31.1767742950921;
        Tue, 06 Jan 2026 15:42:30 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89077253305sm24209026d6.41.2026.01.06.15.42.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 15:42:30 -0800 (PST)
Message-ID: <255ff9c5-7662-47a4-b2b9-1fd740fc526d@riscstar.com>
Date: Tue, 6 Jan 2026 17:42:28 -0600
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] clk: spacemit: extract common ccu functions
To: Yixun Lan <dlan@gentoo.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Guodong Xu <guodong@riscstar.com>,
 Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, Yao Zi <me@ziyao.cc>
References: <20260103-06-k1-clk-common-v3-0-6061d9f69eef@gentoo.org>
 <20260103-06-k1-clk-common-v3-2-6061d9f69eef@gentoo.org>
 <a198d2d2-0c82-4c9d-abca-d17221ef1453@riscstar.com>
 <20260106222753-GYA2092678@gentoo.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260106222753-GYA2092678@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/6/26 4:27 PM, Yixun Lan wrote:
> Hi Alex,
> 
> On 08:43 Tue 06 Jan     , Alex Elder wrote:
>> On 1/3/26 1:26 AM, Yixun Lan wrote:
>>> Refactor the probe function of SpacemiT's clock, and extract a common ccu
>>> file, so new clock driver added in the future can share the same code,
>>> which would lower the burden of maintenance. Since this commit changes the
>>> module name where the auxiliary device registered, the auxiliary device id
>>> need to be adjusted. Idea of the patch comes from the review of K3 clock
>>> driver, please refer to this disucssion[1] for more detail.
>>
>> Are all of the hunks of moved code moved without change (I
>> think so)?  If so I think it's worth mentioning that.  If
>> not, you should explain whatever differs, and why.  (I would
> yes, no literal changes with this patch except probe() refactored,
> and the real effective change is the module name changed which
> I mentioned already

Thanks for confirming.  No need to change your description,
just consider this for future patches.

>> expect the only thing that would have to change is making
>> spacemit_ccu_probe() public.)
> to make spacemit_ccu_probe() public, we move SoC specific code
> out of this function which should have no functionality change..
> 
> (I think the above commit message is ok, and would not plan to send
> out another version if no serious comment incoming, unless you insist)
> 
>>
>> I made one minor comment below.  I didn't verify, but I
>> assume this is all just moving the code around, and based
>> on that:
>>
>> Reviewed-by: Alex Elder <elder@riscstar.com>
>>
> [snip]...
>>> diff --git a/drivers/clk/spacemit/ccu_common.c b/drivers/clk/spacemit/ccu_common.c
>>> index 4412c4104dab..5f05b17f8452 100644
>>> --- a/drivers/clk/spacemit/ccu_common.c
>>> +++ b/drivers/clk/spacemit/ccu_common.c
>>> @@ -1,6 +1,177 @@
>>>    // SPDX-License-Identifier: GPL-2.0-only
>>>    
>>> +#include <linux/clk-provider.h>
>>> +#include <linux/device/devres.h>
>>> +#include <linux/mfd/syscon.h>
>>>    #include <linux/module.h>
>>> +#include <linux/of.h>
>>> +#include <linux/slab.h>
>>> +#include <soc/spacemit/ccu.h>
>>> +
>>> +#include "ccu_common.h"
>>> +
>>> +static DEFINE_IDA(auxiliary_ids);
>>
>> I'd insert a space here to make the definition above stand out a
>> bit more.
>>
> do you mean a blank line?
> (I could do this while applying this patch since it's quite trivial..)

Yes that's what I mean, and yes, fine to add that when applying.

					-Alex
