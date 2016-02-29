Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.132]:60495 "EHLO
	lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751942AbcB2BPS (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Sun, 28 Feb 2016 20:15:18 -0500
Subject: Re: [PATCH v2] clk: check the actual phase if get_phase is provided
To: Stephen Boyd <sboyd@codeaurora.org>
References: <1455759499-9622-1-git-send-email-shawn.lin@rock-chips.com>
 <20160225231458.GH28849@codeaurora.org> <56CFA8B4.7070600@rock-chips.com>
 <20160227001042.GC28849@codeaurora.org>
Cc: shawn.lin@rock-chips.com,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
From: Shawn Lin <shawn.lin@rock-chips.com>
Message-ID: <56D39B8C.9030008@rock-chips.com>
Date: Mon, 29 Feb 2016 09:14:52 +0800
MIME-Version: 1.0
In-Reply-To: <20160227001042.GC28849@codeaurora.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 2016/2/27 8:10, Stephen Boyd wrote:
> On 02/26, Shawn Lin wrote:
>> On 2016/2/26 7:14, Stephen Boyd wrote:
>>> On 02/18, Shawn Lin wrote:
>>>> set_phase does sanity checking of degree and ask sub-driver
>>
>> [...]
>>
>>>> already there.
>>>>
>>>> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
>>>>
>>>> ---
>>>
>>> Knee jerk reaction is why does the provider code set a phase that
>>> isn't requested? Do we need some sort of clk_round_phase() API
>>> that parallels clk_round_rate() so that drivers know what phase
>>> they're going to get? Or do drivers not care what phase they get
>>> when they call clk_set_phase()?
>>
>> Hi Stephen,
>>
>> drivers should care what phase they get when calling clk_set_phase(i.e
>> the drivers setting phase to do tuning work should know what the actual
>> degrees is, which is important for them to decide the sample window
>> algorithm).
>>
>> By looking into the two drivers who use set_phase/get_phase pair
>> currently, they actually both don'e care what the actual degrees when
>> they call clk_set_phase. I think that is because the drivers are used
>> for specific platform which support 0~360 implicitly. But the situation
>> is NOT always right for cross-platform drivers. So add some sort of
>> round_phase API is probably sane ?
>>
>
> Do you have such a platform or driver though? I'd rather not do
> anything unless we actually need to.

Currently no, but we going to have one soon in this year which supports
10°, 20°, 30°,... 360°(each 10° a step, totally 36 steps). So I look
into phase stuff in advance and send a RFC patch to discuss the
practicability before I actually writing driver code.

I have no idea whether we need it. Or maybe we can just do some tricks
inside current ->set_phase/get_phase call back to meet the requirment.
Otherwise， I'd rather not add New API either.

>


-- 
Best Regards
Shawn Lin

