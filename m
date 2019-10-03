Return-Path: <SRS0=L6e3=X4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1810CC4CED1
	for <linux-clk@archiver.kernel.org>; Thu,  3 Oct 2019 17:09:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E927020865
	for <linux-clk@archiver.kernel.org>; Thu,  3 Oct 2019 17:09:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404172AbfJCQeX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 3 Oct 2019 12:34:23 -0400
Received: from avon.wwwdotorg.org ([104.237.132.123]:48044 "EHLO
        avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392132AbfJCQeW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 3 Oct 2019 12:34:22 -0400
Received: from [10.20.204.51] (unknown [216.228.112.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by avon.wwwdotorg.org (Postfix) with ESMTPSA id B977D1C0162;
        Thu,  3 Oct 2019 10:34:20 -0600 (MDT)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.100.3 at avon.wwwdotorg.org
Subject: Re: [PATCH 2/4] ARM: tegra: Enable PLLP bypass during Tegra124 LP1
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, linux-tegra@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20191001211346.104400-1-swarren@wwwdotorg.org>
 <20191001211346.104400-2-swarren@wwwdotorg.org>
 <437f030b-9e20-43e5-42ce-f98430d2149b@gmail.com>
From:   Stephen Warren <swarren@wwwdotorg.org>
Message-ID: <485c9828-120a-8e62-bf85-c5d8407d3513@wwwdotorg.org>
Date:   Thu, 3 Oct 2019 10:34:14 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <437f030b-9e20-43e5-42ce-f98430d2149b@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 10/3/19 5:27 AM, Dmitry Osipenko wrote:
> 02.10.2019 00:13, Stephen Warren пишет:
>> From: Stephen Warren <swarren@nvidia.com>
>>
>> For a little over a year, U-Boot has configured the flow controller to
>> perform automatic RAM re-repair on off->on power transitions of the CPU
>> rail1]. This is mandatory for correct operation of Tegra124. However, RAM
>> re-repair relies on certain clocks, which the kernel must enable and
>> leave running. PLLP is one of those clocks. This clock is shut down
>> during LP1 in order to save power. Enable bypass (which I believe routes
>> osc_div_clk, essentially the crystal clock, to the PLL output) so that
>> this clock signal toggles even though the PLL is not active. This is
>> required so that LP1 power mode (system suspend) operates correctly.
>>
>> The bypass configuration must then be undone when resuming from LP1, so
>> that all peripheral clocks run at the expected rate. Without this, many
>> peripherals won't work correctly; for example, the UART baud rate would
>> be incorrect.
>>
>> NVIDIA's downstream kernel code only does this if not compiled for
>> Tegra30, so the added code is made conditional upon the chip ID. NVIDIA's
>> downstream code makes this change conditional upon the active CPU
>> cluster. The upstream kernel currently doesn't support cluster switching,
>> so this patch doesn't test the active CPU cluster ID.
>>
>> [1] 3cc7942a4ae5 ARM: tegra: implement RAM repair
>>
>> Reported-by: Jonathan Hunter <jonathanh@nvidia.com>
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Stephen Warren <swarren@nvidia.com>
>> ---
>>   arch/arm/mach-tegra/sleep-tegra30.S | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/arch/arm/mach-tegra/sleep-tegra30.S b/arch/arm/mach-tegra/sleep-tegra30.S
>> index b408fa56eb89..6922dd8d3e2d 100644
>> --- a/arch/arm/mach-tegra/sleep-tegra30.S
>> +++ b/arch/arm/mach-tegra/sleep-tegra30.S
>> @@ -370,6 +370,14 @@ _pll_m_c_x_done:
>>   	pll_locked r1, r0, CLK_RESET_PLLC_BASE
>>   	pll_locked r1, r0, CLK_RESET_PLLX_BASE
>>   
>> +	tegra_get_soc_id TEGRA_APB_MISC_BASE, r1
>> +	cmp	r1, #TEGRA30
>> +	beq	1f
> 
> What about T114, or does it need enabled PLLP as well?

I'm nowhere near as familiar with T114 as T124, so I can't be 100% sure. 
However, a very quick look at the CAR section in the T114 TRM does show 
the same gate/mux structure around a reshift and fuse clock, so I assume 
the requirement is identical there.

Also, NVIDIA's downstream kernel has a compile-time ifdef around the 
code I've added here. It's not compiled for T30 specifically, and is 
compiled for anything else, which I believe means both T114 and T124.

In patch 1 in this series, I only enabled the fuse clock for T124, since 
I don't have a T114 system to test any more. However, the revised patch 
1 that Thierry and I are discussing would enable the fuse clock on all 
SoCs, and hence make the code work identically on T114 as it does on T124.
