Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D50FC38A2D
	for <linux-clk@archiver.kernel.org>; Wed, 26 Oct 2022 11:03:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233044AbiJZLDx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 26 Oct 2022 07:03:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233505AbiJZLDe (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 26 Oct 2022 07:03:34 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E30DD25A6
        for <linux-clk@vger.kernel.org>; Wed, 26 Oct 2022 04:03:15 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 0116884FA7;
        Wed, 26 Oct 2022 13:03:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1666782193;
        bh=Hobn145dGG4aNsOutAPli0NdVz1BnuL7dNDsln522No=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=EZpjyhYTGIXGRAAD1UNdNa7gr5ZQ4Kb533624Tl4RiLW3kEKp7NE62gznfjW74cuv
         7ZwUFd9278W8U5450V4yLva7PrlGKLjFL0N80Mp9ftmuF2aG/mr+ZKW+idW5KaDp+N
         eP9W+2HRCWqL/w3oSESw+N2CNrtmiF+Mt2ehU1ZbRjY0YQ01fqLFaeS5ePav81usS8
         PfHMbUOAqVSKUVOYwLbwq7MY49CR/d1R85kswWAN+OPex+u28vC3XpjkOd4CQvWLEJ
         L1FX1hEPahSq7kpE1bcJv58SqsfGIQ5qgSD+6ceVkTDjMbpfLgzsRFmh5ENvV9PZK9
         8dPkO0/Ih59gw==
Message-ID: <635f0bec-87f5-05dc-2eab-291104f0b4c9@denx.de>
Date:   Wed, 26 Oct 2022 13:03:11 +0200
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
 <9bd487ef-e64b-8cff-2340-adaaedacf78a@denx.de>
 <CAA+D8AO3KZr9uxS-T1LXK568EeE-wf8yxGCYiayBBxFKDF_HZQ@mail.gmail.com>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <CAA+D8AO3KZr9uxS-T1LXK568EeE-wf8yxGCYiayBBxFKDF_HZQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 10/26/22 12:36, Shengjiu Wang wrote:
> Hi Marek
> 
> On Wed, Oct 26, 2022 at 5:10 AM Marek Vasut <marex@denx.de> wrote:
> 
>> On 10/20/22 05:06, Shengjiu Wang wrote:
>>> On Wed, Oct 19, 2022 at 10:33 PM Marek Vasut <marex@denx.de> wrote:
>>>
>>>> On 10/14/22 03:53, Shengjiu Wang wrote:
>>>>> Hi Marek
>>>>
>>>> Hi,
>>>>
>>>> [...]
>>>>
>>>>>> +static const struct clk_parent_data clk_imx8mp_audiomix_pll_parents[]
>>>> = {
>>>>>> +       { .fw_name = "osc_24m", .name = "osc_24m" },
>>>>>> +       { .name = "dummy" },
>>>>>> +       { .name = "dummy" },
>>>>>> +       { .name = "dummy" },
>>>>>> +};
>>>>>> +
>>>>>> +static const struct clk_parent_data
>>>> clk_imx8mp_audiomix_pll_bypass_sels[]
>>>>>> = {
>>>>>> +       { .fw_name = "sai_pll", .name = "sai_pll" },
>>>>>> +       { .fw_name = "sai_pll_ref_sel", .name = "sai_pll_ref_sel" },
>>>>>> +};
>>>>>> +
>>>>>> +#define CLK_GATE(gname, cname)
>>>>    \
>>>>>> +       {
>>>>    \
>>>>>> +               gname"_cg",
>>>>    \
>>>>>> +               IMX8MP_CLK_AUDIOMIX_##cname,
>>>> \
>>>>>> +               { .fw_name = "ahb", .name = "ahb" }, NULL, 1,
>>>>    \
>>>>>>
>>>>>> { .fw_name = "audio_root_clk", .name = "audio_root_clk" }, NULL, 1,
>>>>>>         \
>>>>>>
>>>>>> Should be the 'audio_root_clk' better?
>>>>>>
>>>>>> Then the 'clocks' and 'clock-names' can be removed in dts node?
>>>>>>
>>>>>> Will you continue to follow up this patch series?
>>>>
>>>> Sure. Did anyone from NXP finally test this patch series, and can
>>>> provide useful review ?
>>>>
>>>
>>> I have tested it, and I think "ahb" should be "audio_root_clk". others
>> LGTM.
>>
>> It seems those clock are actually called IMX8MP_CLK_AUDIO_AHB_ROOT in
>> the NXP downstream BSP, so those clock do drive AHB, correct ? If so, we
>> should keep the "ahb" name here, to differentiate them from already
>> existing IMX8MP_CLK_AUDIO_AXI , which seem to drive the AXI part.
>>
> 
> Seems IMX8MP_CLK_AUDIO_ROOT needs to be changed to
> IMX8MP_CLK_AUDIO_AHB_ROOT in clk-imx8mp.c
> 
> and
> "ocrama"  parent clock is "audio_axi_root"
> "earc_phy"  parent clock is "sai_pll_out_div2"
> "dsp" parent clock is "audio_axi_root"
> "dspdbg" parent clock is "audio_axi_root"
> "audpll" parent clock is "osc_24m"
> 
> so I think it is better to include downstream change in this patch
> series:
> -       hws[IMX8MP_CLK_AUDIO_ROOT] = imx_clk_hw_gate4("audio_root_clk",
> "ipg_root", ccm_base + 0x4650, 0);
> +
> +       hws[IMX8MP_CLK_AUDIO_AHB_ROOT] =
> imx_clk_hw_gate2_shared2("audio_ahb_root", "audio_ahb", ccm_base + 0x4650,
> 0, &share_count_audio);
> +       hws[IMX8MP_CLK_AUDIO_AXI_ROOT] =
> imx_clk_hw_gate2_shared2("audio_axi_root", "audio_axi", ccm_base + 0x4650,
> 0, &share_count_audio);
> +       hws[IMX8MP_CLK_SAI1_ROOT] = imx_clk_hw_gate2_shared2("sai1_root",
> "sai1", ccm_base + 0x4650, 0, &share_count_audio);
> +       hws[IMX8MP_CLK_SAI2_ROOT] = imx_clk_hw_gate2_shared2("sai2_root",
> "sai2", ccm_base + 0x4650, 0, &share_count_audio);
> +       hws[IMX8MP_CLK_SAI3_ROOT] = imx_clk_hw_gate2_shared2("sai3_root",
> "sai3", ccm_base + 0x4650, 0, &share_count_audio);
> +       hws[IMX8MP_CLK_SAI5_ROOT] = imx_clk_hw_gate2_shared2("sai5_root",
> "sai5", ccm_base + 0x4650, 0, &share_count_audio);
> +       hws[IMX8MP_CLK_SAI6_ROOT] = imx_clk_hw_gate2_shared2("sai6_root",
> "sai6", ccm_base + 0x4650, 0, &share_count_audio);
> +       hws[IMX8MP_CLK_SAI7_ROOT] = imx_clk_hw_gate2_shared2("sai7_root",
> "sai7", ccm_base + 0x4650, 0, &share_count_audio);
> +       hws[IMX8MP_CLK_PDM_ROOT] = imx_clk_hw_gate2_shared2("pdm_root",
> "pdm", ccm_base + 0x4650, 0, &share_count_audio);
> 

Can you prepare such a clock rename patch and submit it ?
