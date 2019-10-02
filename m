Return-Path: <SRS0=ekiN=X3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73415C4360C
	for <linux-clk@archiver.kernel.org>; Wed,  2 Oct 2019 20:59:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4E4C42070B
	for <linux-clk@archiver.kernel.org>; Wed,  2 Oct 2019 20:59:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729027AbfJBU7G (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 2 Oct 2019 16:59:06 -0400
Received: from avon.wwwdotorg.org ([104.237.132.123]:44250 "EHLO
        avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728495AbfJBU7G (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 2 Oct 2019 16:59:06 -0400
Received: from [10.20.204.51] (unknown [216.228.112.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by avon.wwwdotorg.org (Postfix) with ESMTPSA id D9A9C1C00ED;
        Wed,  2 Oct 2019 14:59:03 -0600 (MDT)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.100.3 at avon.wwwdotorg.org
Subject: Re: [PATCH 1/4] clk: tegra: Enable fuse clock on Tegra124
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20191001211346.104400-1-swarren@wwwdotorg.org>
 <20191002110454.GJ3716706@ulmo>
From:   Stephen Warren <swarren@wwwdotorg.org>
Message-ID: <6a48d716-2312-4623-f47a-a53ac2ece83c@wwwdotorg.org>
Date:   Wed, 2 Oct 2019 14:59:03 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191002110454.GJ3716706@ulmo>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 10/2/19 5:04 AM, Thierry Reding wrote:
> On Tue, Oct 01, 2019 at 03:13:43PM -0600, Stephen Warren wrote:
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
> 
> I think the correct way to do this these days is to mark the clock as
> CRITICAL. Not sure if there's an easy way to do that given that the
> clock init table doesn't allow storing flags.
> 
> Do you have any good ideas on how to achieve this with the critical flag
> instead of forcing the refcount to 1?
> 
> Perhaps something like the below would work?
 > ...

The following works for me; does this seem like a reasonable approach? 
It does set the critical flag for all SoCs, including any that don't 
require RAM re-repair. I'm not sure which do; I know it's more than just 
Tegra124, but I'm not sure how far back/forward the requirement goes.

> diff --git a/drivers/clk/tegra/clk-tegra-periph.c b/drivers/clk/tegra/clk-tegra-periph.c
> index 1ed85f120a1b..76dd91eebd13 100644
> --- a/drivers/clk/tegra/clk-tegra-periph.c
> +++ b/drivers/clk/tegra/clk-tegra-periph.c
> @@ -785,7 +785,7 @@ static struct tegra_periph_init_data gate_clks[] = {
>         GATE("ahbdma", "hclk", 33, 0, tegra_clk_ahbdma, 0),
>         GATE("apbdma", "pclk", 34, 0, tegra_clk_apbdma, 0),
>         GATE("kbc", "clk_32k", 36, TEGRA_PERIPH_ON_APB | TEGRA_PERIPH_NO_RESET, tegra_clk_kbc, 0),
> -       GATE("fuse", "clk_m", 39, TEGRA_PERIPH_ON_APB, tegra_clk_fuse, 0),
> +       GATE("fuse", "clk_m", 39, TEGRA_PERIPH_ON_APB, tegra_clk_fuse, CLK_IS_CRITICAL),
>         GATE("fuse_burn", "clk_m", 39, TEGRA_PERIPH_ON_APB, tegra_clk_fuse_burn, 0),
>         GATE("kfuse", "clk_m", 40, TEGRA_PERIPH_ON_APB, tegra_clk_kfuse, 0),
>         GATE("apbif", "clk_m", 107, TEGRA_PERIPH_ON_APB, tegra_clk_apbif, 0),
