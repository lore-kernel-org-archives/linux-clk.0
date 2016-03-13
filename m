Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from m199-177.yeah.net ([123.58.177.199]:44770 "EHLO
	m199-177.yeah.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753663AbcCMBts (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Sat, 12 Mar 2016 20:49:48 -0500
Subject: Re: [PATCH 3/7] clk: rockchip: release io resource when
 rk3036_clk_init failed
To: =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>,
	Shawn Lin <shawn.lin@rock-chips.com>
References: <1457799871-3015-1-git-send-email-shawn.lin@rock-chips.com>
 <1457799925-3142-1-git-send-email-shawn.lin@rock-chips.com>
 <8447746.miDbEHA5rR@diego>
Cc: Xing Zheng <zhengxing@rock-chips.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-clk@vger.kernel.org
From: Shawn Lin <shawn.lin@kernel-upstream.org>
Message-ID: <56E4C734.6010702@kernel-upstream.org>
Date: Sun, 13 Mar 2016 09:49:40 +0800
MIME-Version: 1.0
In-Reply-To: <8447746.miDbEHA5rR@diego>
Content-Type: text/plain; charset=UTF-8; format=flowed
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

在 2016/3/13 0:48, Heiko Stübner 写道:
> Hi Shawn,
>
> Am Sonntag, 13. März 2016, 00:25:25 schrieb Shawn Lin:
>> We should call iounmap to relase reg_base since it's not going
>> to be used any more.
>>
>> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
>
> I see that change for rk3036, rk3188(+rk3066) and rk3368.
> But it looks like rk3228 and rk3288 should also get that, or am I just
> overlooking something?

My fault, we need to do that for 3228/3288 as well.
Sorry for my slippy finger. I assign wrong patch-numbers to my
script.

I will squash up patch[3/7],[4/7],[5/7] as well as for 3228/3288, and
resend a separate patch for it.

>
> Also, I think we can fold these changes into one patch, as it's the completely
> same addition for all clock-drivers.
>
>
> Heiko
>
>> ---
>>
>>   drivers/clk/rockchip/clk-rk3036.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/clk/rockchip/clk-rk3036.c
>> b/drivers/clk/rockchip/clk-rk3036.c index 8c683cc..284c36f 100644
>> --- a/drivers/clk/rockchip/clk-rk3036.c
>> +++ b/drivers/clk/rockchip/clk-rk3036.c
>> @@ -453,6 +453,7 @@ static void __init rk3036_clk_init(struct device_node
>> *np) ctx = rockchip_clk_init(np, reg_base, CLK_NR_CLKS);
>>   	if (IS_ERR(ctx)) {
>>   		pr_err("%s: rockchip clk init failed\n", __func__);
>> +		iounmap(reg_base);
>>   		return;
>>   	}
>
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
>

