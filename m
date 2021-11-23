Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 530E9C433EF
	for <linux-clk@archiver.kernel.org>; Tue, 23 Nov 2021 05:51:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230036AbhKWFyl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 23 Nov 2021 00:54:41 -0500
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:50744
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229690AbhKWFyk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 23 Nov 2021 00:54:40 -0500
Received: from [172.16.163.59] (unknown [218.77.208.3])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 043F74007C;
        Tue, 23 Nov 2021 05:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1637646686;
        bh=6MYYB31byceXx84dsA1JrJtBMkbXEZrLRlTn9wcT2hY=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=r93VMj2X9K9m90W9FL+hJu0yrD4iluP7JVfwhd8IBbCFVsY8YPgIJRomtKf95PNq7
         JeLSA8nwHJXnDISN9KgzxUHHjsmbQBA1q4j6ObeioudX6Apx66bvcdtV5MY+8qvVkh
         vBt82JP5TvNjJMIuk1kSTHm/GxQdzqcuBYZdTWaEwN5S2QmiH/5P58+784DAdsJSf4
         9iowygcNIOvKxJSo4GsztFmuUzo7DaRGnB9/vx0+d9ODFIkQ48jmc9Mw4flme5ATpA
         M0puLbtpuVtcDo4XTmCAXe8SSEIl8vq4dS3MUJwbdrQqSj7LtglmGhFXZdEeio7A9Y
         ssAoNGS1/m2Jg==
Subject: Re: [PATCH 2/2] clk: imx8mp: Fix the parent clk of the audio_root_clk
To:     Abel Vesa <abel.vesa@nxp.com>
Cc:     linux-clk@vger.kernel.org, linux-imx@nxp.com, shawnguo@kernel.org,
        Anson.Huang@nxp.com, ping.bai@nxp.com
References: <20211109125657.63485-1-hui.wang@canonical.com>
 <20211109125657.63485-2-hui.wang@canonical.com> <YZuxiyj5PAtCKhnG@ryzen>
From:   Hui Wang <hui.wang@canonical.com>
Message-ID: <f7865660-3edc-3831-a907-358142087043@canonical.com>
Date:   Tue, 23 Nov 2021 13:51:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YZuxiyj5PAtCKhnG@ryzen>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On 11/22/21 11:04 PM, Abel Vesa wrote:
> On 21-11-09 20:56:57, Hui Wang wrote:
>> Recently we tried to enable the BSP on a platform based on imx8mp, we
>> backported the audiomix related drivers to mainline kernel from
>> https://source.codeaurora.org/external/imx/linux-imx, when kernel
>> boots to the audiomix powerdomain driver, the kernel will hang
>> immediately. That is because we set the audio_root_clk to
>> audiomix in the device tree, but the parent of the audio_root_clk is
>> wrong in the clk-imx8mp.c.
>>
>> And we could also refer to the section "5.1.4 System Clocks" of the
>> IMX8MPRM.pdf, the parent clk of CCGR101 (Audiomix) is the
>> AUDIO_AHB_CLK_ROOT.
>>
> Thanks for the whole explanation, but I would not mention the audiomix
> and the downstream source of it in the commit message, since it will
> most probably never be upstreamed.
>
> So lets just stick with the boot hang fixing explanation and what the RM
> mentions. I'll reword it myself, so you won't have to resend, and then
> I'll apply it to clk/imx.
OK, got it. Thanks.
>
>> Signed-off-by: Hui Wang <hui.wang@canonical.com>
> Reviewed-by: Abel Vesa <abel.vesa@nxp.com>
>
>> ---
>>   drivers/clk/imx/clk-imx8mp.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
>> index 12837304545d..c990ad37882b 100644
>> --- a/drivers/clk/imx/clk-imx8mp.c
>> +++ b/drivers/clk/imx/clk-imx8mp.c
>> @@ -700,7 +700,7 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
>>   	hws[IMX8MP_CLK_HDMI_ROOT] = imx_clk_hw_gate4("hdmi_root_clk", "hdmi_axi", ccm_base + 0x45f0, 0);
>>   	hws[IMX8MP_CLK_TSENSOR_ROOT] = imx_clk_hw_gate4("tsensor_root_clk", "ipg_root", ccm_base + 0x4620, 0);
>>   	hws[IMX8MP_CLK_VPU_ROOT] = imx_clk_hw_gate4("vpu_root_clk", "vpu_bus", ccm_base + 0x4630, 0);
>> -	hws[IMX8MP_CLK_AUDIO_ROOT] = imx_clk_hw_gate4("audio_root_clk", "ipg_root", ccm_base + 0x4650, 0);
>> +	hws[IMX8MP_CLK_AUDIO_ROOT] = imx_clk_hw_gate4("audio_root_clk", "audio_ahb", ccm_base + 0x4650, 0);
>>   
>>   	hws[IMX8MP_CLK_ARM] = imx_clk_hw_cpu("arm", "arm_a53_core",
>>   					     hws[IMX8MP_CLK_A53_CORE]->clk,
>> -- 
>> 2.25.1
>>
