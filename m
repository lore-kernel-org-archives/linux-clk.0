Return-Path: <SRS0=L6e3=X4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBFBDC32792
	for <linux-clk@archiver.kernel.org>; Thu,  3 Oct 2019 17:13:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CC36020673
	for <linux-clk@archiver.kernel.org>; Thu,  3 Oct 2019 17:13:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389804AbfJCRNZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 3 Oct 2019 13:13:25 -0400
Received: from avon.wwwdotorg.org ([104.237.132.123]:47840 "EHLO
        avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390424AbfJCQ2v (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 3 Oct 2019 12:28:51 -0400
Received: from [10.20.204.51] (unknown [216.228.112.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by avon.wwwdotorg.org (Postfix) with ESMTPSA id 2E1E51C0162;
        Thu,  3 Oct 2019 10:28:50 -0600 (MDT)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.100.3 at avon.wwwdotorg.org
Subject: Re: [PATCH 1/4] clk: tegra: Enable fuse clock on Tegra124
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, linux-tegra@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20191001211346.104400-1-swarren@wwwdotorg.org>
 <7f8934d9-8192-f88e-a329-630209d42a85@gmail.com>
From:   Stephen Warren <swarren@wwwdotorg.org>
Message-ID: <9e192a8a-8129-0fd7-9041-047b436ef848@wwwdotorg.org>
Date:   Thu, 3 Oct 2019 10:28:49 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <7f8934d9-8192-f88e-a329-630209d42a85@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 10/3/19 5:23 AM, Dmitry Osipenko wrote:
> 02.10.2019 00:13, Stephen Warren пишет:
>> From: Stephen Warren <swarren@nvidia.com>
>>
>> For a little over a year, U-Boot has configured the flow controller to
>> perform automatic RAM re-repair on off->on power transitions of the CPU
>> rail1]. This is mandatory for correct operation of Tegra124. However, RAM
>> re-repair relies on certain clocks, which the kernel must enable and
>> leave running. The fuse clock is one of those clocks. Enable this clock
>> so that LP1 power mode (system suspend) operates correctly.
>>
>> [1] 3cc7942a4ae5 ARM: tegra: implement RAM repair
>>
>> Reported-by: Jonathan Hunter <jonathanh@nvidia.com>
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Stephen Warren <swarren@nvidia.com>
>> ---
>>   drivers/clk/tegra/clk-tegra124.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/clk/tegra/clk-tegra124.c b/drivers/clk/tegra/clk-tegra124.c
>> index 0224fdc4766f..f53f6315c646 100644
>> --- a/drivers/clk/tegra/clk-tegra124.c
>> +++ b/drivers/clk/tegra/clk-tegra124.c
>> @@ -1291,6 +1291,7 @@ static struct tegra_clk_init_table common_init_table[] __initdata = {
>>   };
>>   
>>   static struct tegra_clk_init_table tegra124_init_table[] __initdata = {
>> +	{ TEGRA124_CLK_FUSE, -1, 0, 1 },
>>   	{ TEGRA124_CLK_SOC_THERM, TEGRA124_CLK_PLL_P, 51000000, 0 },
>>   	{ TEGRA124_CLK_CCLK_G, TEGRA124_CLK_CLK_MAX, 0, 1 },
>>   	{ TEGRA124_CLK_HDA, TEGRA124_CLK_PLL_P, 102000000, 0 },
>>
> 
> Hello Stephen,
> 
> Does this mean that devices which are using older U-Boot version were always in a trouble?

Yes. RAM re-repair wouldn't have been enabled, so in theory any device 
could fail after an LP1 resume, or indeed anything that caused the CPU 
complex rail to be gated.

> It sounds to me that the RAM re-repair should be also enabled by the kernel's flow
> controller driver in a case if bootloader did not enable it.

Yes, that might be a good idea too.

> If enabling RAM re-repair is a change that won't be easily backportable to stable kernels,
> then may be it's worth to simply force-disable LP1 on T124 for the older kernels.

The first two patches in this series are all that's strictly required, 
and the change are pretty small and isolated, so it should be easy to 
back-port.
