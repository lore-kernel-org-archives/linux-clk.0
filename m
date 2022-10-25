Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 311DCFA373E
	for <linux-clk@archiver.kernel.org>; Tue, 25 Oct 2022 21:11:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230157AbiJYVLB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 25 Oct 2022 17:11:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230447AbiJYVK5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 25 Oct 2022 17:10:57 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44C3B4332C
        for <linux-clk@vger.kernel.org>; Tue, 25 Oct 2022 14:10:53 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 8E0CA84E00;
        Tue, 25 Oct 2022 23:10:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1666732250;
        bh=VufwXIL1z1GD5jojw1yd+XinvVEZCwOoHqTuaWEVBlg=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=RETpExIW/ldOe88gmRhTOWFpmkMxFmy+vG488b84eQnD/lNJCsQpK8GDJH6L4z5T9
         PWZj1uBklFKJjASMcQUuWVpvsX3TEO8rZN0DgSarBdwoElcKWp0koqg0A6qHMjQc+1
         wVhN6CWGDAgLBW4taVRhfkaUjcq0YAkG1egIG8Z1KxNmP4w6CB+5gwa9OQo+2Lrk6w
         acWA7wzc3sKPXu7nl7vwnkLuDrEe3lMo9KGFAjlsoyNzuuljfq02qjeH2XIRSbAby2
         9lndrhXWKGko98HtxgdgaQ1HDaF57h+kHCSp12yaoAo4o2JGLQUckVU4PJ1pStvgl/
         7UDJOGndDNqAw==
Message-ID: <9bd487ef-e64b-8cff-2340-adaaedacf78a@denx.de>
Date:   Tue, 25 Oct 2022 23:10:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v3 3/6] clk: imx: imx8mp: Add audiomix block control
Content-Language: en-US
To:     Shengjiu Wang <shengjiu.wang@gmail.com>
Cc:     Shengjiu Wang <shengjiu.wang@nxp.com>, linux-clk@vger.kernel.org,
        abel.vesa@nxp.com, festevam@gmail.com, l.stach@pengutronix.de,
        laurent.pinchart@ideasonboard.com,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
        mturquette@baylibre.com, ping.bai@nxp.com, sboyd@kernel.org,
        shawnguo@kernel.org
References: <20220625013235.710346-1-marex@denx.de>
 <20220625013235.710346-3-marex@denx.de>
 <CAA+D8ANLrPML3Hp3fYyfiSSUs9V6xAu55d4Y2-8cVVAuTNwaMw@mail.gmail.com>
 <bf2af142-102b-24e0-a9d5-01ad520f7aee@denx.de>
 <CAA+D8ANdOQaz05_SCmTgEW_bCS4ABBLgMzXese_3WWiF8WxzqA@mail.gmail.com>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <CAA+D8ANdOQaz05_SCmTgEW_bCS4ABBLgMzXese_3WWiF8WxzqA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 10/20/22 05:06, Shengjiu Wang wrote:
> On Wed, Oct 19, 2022 at 10:33 PM Marek Vasut <marex@denx.de> wrote:
> 
>> On 10/14/22 03:53, Shengjiu Wang wrote:
>>> Hi Marek
>>
>> Hi,
>>
>> [...]
>>
>>>> +static const struct clk_parent_data clk_imx8mp_audiomix_pll_parents[]
>> = {
>>>> +       { .fw_name = "osc_24m", .name = "osc_24m" },
>>>> +       { .name = "dummy" },
>>>> +       { .name = "dummy" },
>>>> +       { .name = "dummy" },
>>>> +};
>>>> +
>>>> +static const struct clk_parent_data
>> clk_imx8mp_audiomix_pll_bypass_sels[]
>>>> = {
>>>> +       { .fw_name = "sai_pll", .name = "sai_pll" },
>>>> +       { .fw_name = "sai_pll_ref_sel", .name = "sai_pll_ref_sel" },
>>>> +};
>>>> +
>>>> +#define CLK_GATE(gname, cname)
>>   \
>>>> +       {
>>   \
>>>> +               gname"_cg",
>>   \
>>>> +               IMX8MP_CLK_AUDIOMIX_##cname,
>> \
>>>> +               { .fw_name = "ahb", .name = "ahb" }, NULL, 1,
>>   \
>>>>
>>>> { .fw_name = "audio_root_clk", .name = "audio_root_clk" }, NULL, 1,
>>>>        \
>>>>
>>>> Should be the 'audio_root_clk' better?
>>>>
>>>> Then the 'clocks' and 'clock-names' can be removed in dts node?
>>>>
>>>> Will you continue to follow up this patch series?
>>
>> Sure. Did anyone from NXP finally test this patch series, and can
>> provide useful review ?
>>
> 
> I have tested it, and I think "ahb" should be "audio_root_clk". others LGTM.

It seems those clock are actually called IMX8MP_CLK_AUDIO_AHB_ROOT in 
the NXP downstream BSP, so those clock do drive AHB, correct ? If so, we 
should keep the "ahb" name here, to differentiate them from already 
existing IMX8MP_CLK_AUDIO_AXI , which seem to drive the AXI part.
