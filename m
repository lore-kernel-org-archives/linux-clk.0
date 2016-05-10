Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from szxga02-in.huawei.com ([119.145.14.65]:14324 "EHLO
	szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751417AbcEJLqe (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Tue, 10 May 2016 07:46:34 -0400
Subject: Re: [PATCH 5/5] clk: hisilicon: hi3519: add driver remove path and
 fix some issues
To: Philipp Zabel <p.zabel@pengutronix.de>
References: <1462871953-26606-1-git-send-email-xuejiancheng@hisilicon.com>
 <1462871953-26606-6-git-send-email-xuejiancheng@hisilicon.com>
 <1462878595.3050.6.camel@pengutronix.de>
CC: <mturquette@baylibre.com>, <sboyd@codeaurora.org>,
	<linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<yanhaifeng@hisilicon.com>, <haojian.zhuang@linaro.org>,
	<zhangfei.gao@linaro.org>, <xuwei5@hisilicon.com>,
	<yanghongwei@hisilicon.com>
From: Jiancheng Xue <xuejiancheng@hisilicon.com>
Message-ID: <5731C9FD.1010502@hisilicon.com>
Date: Tue, 10 May 2016 19:46:05 +0800
MIME-Version: 1.0
In-Reply-To: <1462878595.3050.6.camel@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Philipp,

On 2016/5/10 19:09, Philipp Zabel wrote:
> Am Dienstag, den 10.05.2016, 17:19 +0800 schrieb Jiancheng Xue:
>> 1. Add driver remove path.
>> 2. Fix some issues.
>>    -Fix the ordering issue about clock provider being published.
>>    -Add error checking upon registering clocks.
>>
>> Signed-off-by: Jiancheng Xue <xuejiancheng@hisilicon.com>
>> ---
>>  drivers/clk/hisilicon/clk-hi3519.c | 116 ++++++++++++++++++++++++++++++++-----
>>  1 file changed, 100 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/clk/hisilicon/clk-hi3519.c b/drivers/clk/hisilicon/clk-hi3519.c
>> index 715c730..51b173e 100644
>> --- a/drivers/clk/hisilicon/clk-hi3519.c
>> +++ b/drivers/clk/hisilicon/clk-hi3519.c
> [...]
>> -	rstc = hisi_reset_init(np);
>> -	if (!rstc)
> [...]
>> +	crg->rstc = hisi_reset_init(pdev);
>> +	if (!crg->rstc)
> [...]
> 
> The hisi_reset_init(np) -> hisi_reset_init(pdev) change should be part
> of patch 1.
> 
OK. I'll redivide this patch set and resend it. Thank you!

Regards,
Jiancheng


