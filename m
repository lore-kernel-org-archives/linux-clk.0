Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.134]:47461 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752234AbdHULP1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Aug 2017 07:15:27 -0400
Subject: Re: [PATCH v2 1/4] clk: rockchip: add rv1108 ACLK_GAMC and PCLK_GMAC
 ID
To: Heiko Stuebner <heiko@sntech.de>
Cc: Elaine Zhang <zhangqing@rock-chips.com>, mturquette@baylibre.com,
        sboyd@codeaurora.org, robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, xxx@rock-chips.com,
        xf@rock-chips.com, huangtao@rock-chips.com, cl@rock-chips.com,
        andy.yan@rock-chips.com, wdc@rock-chips.com
References: <1503303367-17915-1-git-send-email-zhangqing@rock-chips.com>
 <1503303367-17915-2-git-send-email-zhangqing@rock-chips.com>
 <f51160d5-32cc-a63c-3877-76ea91fb6e8b@rock-chips.com>
 <19279521.prAVXYBsZ9@phil>
From: "David.Wu" <david.wu@rock-chips.com>
Message-ID: <4765221b-e122-b67d-cec2-dffbeeadc379@rock-chips.com>
Date: Mon, 21 Aug 2017 19:15:18 +0800
MIME-Version: 1.0
In-Reply-To: <19279521.prAVXYBsZ9@phil>
Content-Type: text/plain; charset=utf-8; format=flowed
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Heiko,

在 2017/8/21 18:32, Heiko Stuebner 写道:
> Hi David,
> 
> Am Montag, 21. August 2017, 18:22:31 CEST schrieb David.Wu:
>> Hi Elaine,
>>
>> 在 2017/8/21 16:16, Elaine Zhang 写道:
>>> This patch exports gmac aclk and pclk for dts reference.
>>>
>>> Signed-off-by: Elaine Zhang<zhangqing@rock-chips.com>
>>> ---
>>>    include/dt-bindings/clock/rv1108-cru.h | 2 ++
>>>    1 file changed, 2 insertions(+)
>>
>> Acked-by: David Wu <david.wu@rock-chips.com>
> 
> Acked-by is mainly meant for cross-maintainer stuff (changes
> for one subsystem going through a different tree etc).
> 
> If you want to show that the change is correct and you have reviewed
> the patch, please use "Reviewed-by".
> 

Yeap, my intent is that the patches are correct. And change the tag here.🙂
So for the series:

Reviewed-by: David Wu <david.wu@rock-chips.com>

> 
> Heiko
> 
> 
> 

