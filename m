Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from regular1.263xmail.com ([211.150.99.131]:49037 "EHLO
	regular1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753783AbbJAIql convert rfc822-to-8bit (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Thu, 1 Oct 2015 04:46:41 -0400
Content-Type: text/plain;
	charset=gb2312
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v3 5/8] clk: rockchip: add new clock type and controller for rk3036
From: zhengxing <zhengxing@rock-chips.com>
In-Reply-To: <17410513.afcQr96dHz@diego>
Date: Thu, 1 Oct 2015 16:46:21 +0800
Cc: linux-rockchip@lists.infradead.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Message-Id: <39D164F7-3461-42FE-8D5D-B30756C86DD8@rock-chips.com>
References: <1443492833-15630-1-git-send-email-zhengxing@rock-chips.com> <1443492833-15630-6-git-send-email-zhengxing@rock-chips.com> <17410513.afcQr96dHz@diego>
To: =?GB2312?Q?Heiko_St=A8=B9bner?= <heiko@sntech.de>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


Hi Heiko,

发自我的 iPad
> 在 2015年10月1日，16:12，Heiko Stübner <heiko@sntech.de> 写道：
> 
> Am Dienstag, 29. September 2015, 10:13:50 schrieb Xing Zheng:
>> The rk3036's pll and clock are different with base on the rk3066(rk3188,
>> rk3288, rk3368 use it), there are different adjust foctors and control
>> registers, so these should be independent and separate from the series
>> of rk3066s.
> 
> subject should probably be like
> clk: rockchip: add new pll-type for rk3036 and similar socs
OK.
> 
> And the general handling should probably be implemented similar to the example 
> I posted in the v2 thread yesterday. [of course folded in and not as a 
> separate patch ;-) ]
> 
> Heiko
> 
OK, because I just received and saw this patch, and I will test and update it into next version patchset.


Thank you. :)
