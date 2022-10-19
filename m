Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA5BBC433FE
	for <linux-clk@archiver.kernel.org>; Wed, 19 Oct 2022 14:47:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230245AbiJSOrW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 19 Oct 2022 10:47:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230319AbiJSOrE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 19 Oct 2022 10:47:04 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6005D17A951
        for <linux-clk@vger.kernel.org>; Wed, 19 Oct 2022 07:33:57 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 3F6718491C;
        Wed, 19 Oct 2022 16:33:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1666190035;
        bh=awwLFru55bPIwMLuVbQ5DyvBiqhLo35UcNGcYqGcjbc=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=Acr397ZbjAblbt8COdPevCB/mgp7sQ+M2yTR0XnG10bZ6DWROCCSorVyP5qQpYTLh
         u5FzYdTppotpcMjWLGMbT+KYfCFpWFDUY/brIY5o4mrTPNXi7M5TeN1nx/X5B3Q/TJ
         aq7ELpCWoI2Ha0t06nTjVr8npZe/j92PJuHyy/KvQI6X3RSufL+TkeZo6Tyu0y1qqF
         ClWpacD7kwyYj8cud4+hFF123MkZmTIX7TLBY1pb2tu8iO0lhI6j+fLUfIr6pV3W+W
         JiD8BvjPAMzx15dlCknSdpDZruFQFqq7U2ELslUWeTOXbnLmxJJCtFyGtRa9g+Psc5
         o67gYCWMPtdng==
Message-ID: <bf2af142-102b-24e0-a9d5-01ad520f7aee@denx.de>
Date:   Wed, 19 Oct 2022 16:33:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v3 3/6] clk: imx: imx8mp: Add audiomix block control
Content-Language: en-US
To:     Shengjiu Wang <shengjiu.wang@gmail.com>,
        Shengjiu Wang <shengjiu.wang@nxp.com>
Cc:     linux-clk@vger.kernel.org, abel.vesa@nxp.com, festevam@gmail.com,
        l.stach@pengutronix.de, laurent.pinchart@ideasonboard.com,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
        mturquette@baylibre.com, ping.bai@nxp.com, sboyd@kernel.org,
        shawnguo@kernel.org
References: <20220625013235.710346-1-marex@denx.de>
 <20220625013235.710346-3-marex@denx.de>
 <20220625013235.710346-3-marex@denx.de>
 <CAA+D8ANLrPML3Hp3fYyfiSSUs9V6xAu55d4Y2-8cVVAuTNwaMw@mail.gmail.com>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <CAA+D8ANLrPML3Hp3fYyfiSSUs9V6xAu55d4Y2-8cVVAuTNwaMw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 10/14/22 03:53, Shengjiu Wang wrote:
> Hi Marek

Hi,

[...]

>> +static const struct clk_parent_data clk_imx8mp_audiomix_pll_parents[] = {
>> +       { .fw_name = "osc_24m", .name = "osc_24m" },
>> +       { .name = "dummy" },
>> +       { .name = "dummy" },
>> +       { .name = "dummy" },
>> +};
>> +
>> +static const struct clk_parent_data clk_imx8mp_audiomix_pll_bypass_sels[]
>> = {
>> +       { .fw_name = "sai_pll", .name = "sai_pll" },
>> +       { .fw_name = "sai_pll_ref_sel", .name = "sai_pll_ref_sel" },
>> +};
>> +
>> +#define CLK_GATE(gname, cname)                                         \
>> +       {                                                               \
>> +               gname"_cg",                                             \
>> +               IMX8MP_CLK_AUDIOMIX_##cname,                            \
>> +               { .fw_name = "ahb", .name = "ahb" }, NULL, 1,           \
>>
>> { .fw_name = "audio_root_clk", .name = "audio_root_clk" }, NULL, 1,
>>       \
>>
>> Should be the 'audio_root_clk' better?
>>
>> Then the 'clocks' and 'clock-names' can be removed in dts node?
>>
>> Will you continue to follow up this patch series?

Sure. Did anyone from NXP finally test this patch series, and can 
provide useful review ?

I am somewhat unhappy with the feedback I got thus far, which is based 
on downstream kernel fork, different power domain driver and different 
audiomix driver. I would really appreciate feedback for THIS driver instead.
