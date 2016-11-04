Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from regular1.263xmail.com ([211.150.99.137]:33605 "EHLO
        regular1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754187AbcKDAdx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 3 Nov 2016 20:33:53 -0400
Subject: Re: [PATCH] clk: rockchip: fix some clocks' name to be more standard
 style
To: =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>,
        Shawn Lin <shawn.lin@rock-chips.com>
References: <1478070296-23080-1-git-send-email-jay.xu@rock-chips.com>
 <763cad68-a068-9a4b-e26d-2c459c2d4808@rock-chips.com>
 <44798035.VNVnDcOLnj@diego>
Cc: mturquette@baylibre.com, sboyd@codeaurora.org,
        huangtao@rock-chips.com, zhangqing@rock-chips.com,
        zhengxing@rock-chips.com, linux-kernel@vger.kernel.org,
        lintao@rock-chips.com, linux-rockchip@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
From: "jay.xu" <jay.xu@rock-chips.com>
Message-ID: <33f1004e-bbc8-5074-3e67-38cd98d3915c@rock-chips.com>
Date: Fri, 4 Nov 2016 08:33:15 +0800
MIME-Version: 1.0
In-Reply-To: <44798035.VNVnDcOLnj@diego>
Content-Type: text/plain; charset=UTF-8; format=flowed
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Heiko and Shawn:

ok, I agree with you, and the root fix seems to fix it in the TRM first.
I'll feedback to TRM makers.

Thanks.

On 2016年11月03日 22:32, Heiko Stübner wrote:
> Am Donnerstag, 3. November 2016, 16:52:48 schrieb Shawn Lin:
>> On 2016/11/2 15:04, Jianqun Xu wrote:
>>> Fix aclk_emmcgrf to aclk_emmc_grf, and fix aclk_emmccore to be
>>> aclk_emmc_core.
>>
>> What is the standard style should be?
>>
>> TRM uses aclk_emmccore but not aclk_emmc_core, so should it be more
>> standrad to keep it as-is?
>
> I tend to agree with Shawn. While it looks like the missing "_" is some sort
> of mistake, we should strive to follow TRM naming, so grepping so it becomes
> easier to look for informations in these things in the TRM.
>
> Same reason for naming our regulators and pinctrl after the names used in
> device schematics, if available.
>
>
> Heiko
>
>
>

