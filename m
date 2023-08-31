Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DA19C83F12
	for <linux-clk@archiver.kernel.org>; Thu, 31 Aug 2023 13:41:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344668AbjHaNlm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 31 Aug 2023 09:41:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346150AbjHaNl0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 31 Aug 2023 09:41:26 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6B8DCFC;
        Thu, 31 Aug 2023 06:41:22 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 4ED1186556;
        Thu, 31 Aug 2023 15:41:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1693489281;
        bh=XiBXQnOQDN9+P/AMw3ElEhFCL7SkvRi0zKcq3r6AlyA=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=DWTwm1kJ6Ye/x+LmDFfm5TUN9ZV8S+o3nK+T05YhqnCYkak3MPK90oWmARLHA1R2w
         ar6saA2pdtQ/DN68i4G51bqsM78otuABJ9nrf5wBwOZFmfISJhVW9eBTwW01Nv3m1I
         HjTF9M1eIXc9SCO8f4vSWcZ+Qka4cxXSnD4Pyxfz+EV9zTvj0ACNFmu0gUt5vQFF9p
         TwsTihaP/0s3NIEAHZQFRXLknDM2GSyHY/pjfvx6VIQDz0MOvrM073w1j4J01j//LP
         +/JsEURBnCKv7BHhelgrT0IyX6rP7AO+zupWvMs3XmWZhY2qf2ylTPztfCBN+chscn
         Tv9XomKb6zGZg==
Message-ID: <2cb68e41-0db5-c95b-6b32-b3ca9e90a8c7@denx.de>
Date:   Thu, 31 Aug 2023 15:36:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v8 1/2] arm64: dts: imx8mp: Add SAI, SDMA, AudioMIX
To:     Adam Ford <aford173@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Abel Vesa <abelvesa@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20230508114236.8444-1-marex@denx.de>
 <CAHCN7xJGMkf3MZWK5NqtUxnSTRaZdL-8f3ngUsOUKEdOmdUvXw@mail.gmail.com>
 <d99a1da1-1486-a4e6-c377-87effd3fd1bc@denx.de>
 <CAHCN7xKGowhQbBDdnOKgcBptsM1VzD7YJB=ZAbL1Oge4rgnLUg@mail.gmail.com>
 <c8ab4eaa-20de-a586-0074-64cfe588a746@denx.de>
 <CAHCN7xJ2Pxz4jB1EQbhA-tOMFheVWcWyXB53dW7sRvj0D2xi=Q@mail.gmail.com>
Content-Language: en-US
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <CAHCN7xJ2Pxz4jB1EQbhA-tOMFheVWcWyXB53dW7sRvj0D2xi=Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 8/31/23 06:32, Adam Ford wrote:
> On Wed, Aug 30, 2023 at 3:50 PM Marek Vasut <marex@denx.de> wrote:
>>
>> On 8/30/23 21:59, Adam Ford wrote:
>>> On Wed, Aug 30, 2023 at 2:10 PM Marek Vasut <marex@denx.de> wrote:
>>>>
>>>> On 8/30/23 04:44, Adam Ford wrote:
>>>>
>>>> Hi,
>>>>
>>>>> I have a question about the clocking for eASRC and PDM.
>>>>>
>>>>>> +
>>>>>> +                       audio_blk_ctrl: clock-controller@30e20000 {
>>>>>> +                               compatible = "fsl,imx8mp-audio-blk-ctrl";
>>>>>> +                               reg = <0x30e20000 0x10000>;
>>>>>> +                               #clock-cells = <1>;
>>>>>> +                               clocks = <&clk IMX8MP_CLK_AUDIO_ROOT>,
>>>>>> +                                        <&clk IMX8MP_CLK_SAI1>,
>>>>>> +                                        <&clk IMX8MP_CLK_SAI2>,
>>>>>> +                                        <&clk IMX8MP_CLK_SAI3>,
>>>>>> +                                        <&clk IMX8MP_CLK_SAI5>,
>>>>>> +                                        <&clk IMX8MP_CLK_SAI6>,
>>>>>> +                                        <&clk IMX8MP_CLK_SAI7>;
>>>>>> +                               clock-names = "ahb",
>>>>>> +                                             "sai1", "sai2", "sai3",
>>>>>> +                                             "sai5", "sai6", "sai7";
>>>>>> +                               power-domains = <&pgc_audio>;
>>>>>> +                       };
>>>>>> +               };
>>>>>> +
>>>>>
>>>>> I am trying to plumb in the micfil driver with a PDM microphone on a
>>>>> Plus.  I have SAI3 and SAI5 audio working, but if I try to use the
>>>>> micfil, the PDM clock doesn't get turned on, and the micfil doesn't
>>>>> appear to see anything coming in.  I was curious why the
>>>>> audio_blk_ctrl has clock entries for IMX8MP_CLK_SAIx, but there isn't
>>>>> one for the PDM nor the ASRC clocks.
>>>>
>>>> I only ever needed SAI, so that was what was tested on the EVK .
>>>
>>> That makes sense.
>>>
>>>>
>>>>> I added the MICFIL noted to the
>>>>> 8mp in a previous patch [1], and I am trying to customize the MICFIL
>>>>> node as follows:
>>>>>
>>>>> &micfil {
>>>>> #sound-dai-cells = <0>;
>>>>> pinctrl-names = "default";
>>>>> pinctrl-0 = <&pinctrl_pdm>;
>>>>> assigned-clocks = <&clk IMX8MP_CLK_PDM>;
>>>>> assigned-clock-parents = <&clk IMX8MP_AUDIO_PLL1_OUT>;
>>>>> assigned-clock-rates = <196608000>;
>>>>> status = "okay";
>>>>> };
>>>>>
>>>>> I also noticed in the down-stream kernel, the pdm_ipg_clk and
>>>>> pdm_root_clk are shared gates with separate parents.
>>>>>
>>>>> The PDM tree of the down-stream kernel looks like this:
>>>>>     audio_pll1_ref_sel                0        0        0    24000000
>>>>>         0     0  50000         Y
>>>>>           audio_pll1                     0        0        0   393216000
>>>>>            0     0  50000         Y
>>>>>              audio_pll1_bypass           0        0        0   393216000
>>>>>            0     0  50000         Y
>>>>>                 audio_pll1_out           0        0        0   393216000
>>>>>            0     0  50000         N
>>>>>                    pdm                   0        0        0   196608000
>>>>>            0     0  50000         N
>>>>>                       pdm_root           0        0        0   196608000
>>>>>            0     0  50000         N
>>>>>                          pdm_sel         0        0        0   196608000
>>>>>            0     0  50000         Y
>>>>>                             pdm_root_clk       0        0        0
>>>>> 196608000          0     0  50000         N
>>>>>
>>>>> The PDM tree of the mainline looks like this:
>>>>>
>>>>>       audio_pll1_ref_sel                0        0        0    24000000
>>>>>           0     0  50000         Y
>>>>>           audio_pll1                     0        0        0   393216000
>>>>>            0     0  50000         Y
>>>>>              audio_pll1_bypass           0        0        0   393216000
>>>>>            0     0  50000         Y
>>>>>                 audio_pll1_out           0        0        0   393216000
>>>>>            0     0  50000         N
>>>>>                    pdm                   0        0        0   196608000
>>>>>            0     0  50000         N
>>>>>                       pdm_root           0        0        0   196608000
>>>>>            0     0  50000         N
>>>>>                          pdm_sel         0        0        0   196608000
>>>>>            0     0  50000         Y
>>>>>
>>>>> It seems like the "pdm_root_clk" generated by the shared audo-blk
>>>>> down-sream driver is missing from the mainline.  I looked up the clock
>>>>> I referenced when I attempted to enable the miffil, but
>>>>> 'IMX8MP_CLK_AUDIOMIX_PDM_ROOT doesn't appear to be configured in
>>>>> either clk-imx8mp.c or clk-imx8mp-audiomix.c.  Maybe it's obscured by
>>>>> the macros, but it seems like the pdm_sel should somehow have an
>>>>> additional variable for the shared clock and an additional clock like
>>>>> pdm_root_clk assigned with it.
>>>>>
>>>>> I have similar configurations for Mini and Nano, and both of them are
>>>>> able to record audio, so I think there might be a clock issue
>>>>> somewhere related to the audiomix driver, and not a misconfiguration
>>>>> of the sound-card or the micfil itself.
>>>>
>>>> Shouldn't the micfil be somehow a consumer of the pdm_sel clock , and
>>>> enable those clock in the driver ?
>>>
>>> Micfil references IMX8MP_CLK_AUDIOMIX_PDM_IPG, and
>>> IMX8MP_CLK_AUDIOMIX_PDM_ROOT.  I am not convinced the
>>> IMX8MP_CLK_AUDIOMIX_PDM_ROOT exists beyond a #define in an include
>>> directory.  I tried making it use pdm_sel, but it threw an error.  I
>>> am not near my system, so I'm sorry I don't have more details.
>>>
>>> In the downstream kernel IMX8MP_CLK_AUDIOMIX_PDM_ROOT was a child of
>>> pdm_sel, but I am not certain as to what the difference between them
>>> was since they appeared to be shared.
>>
>> The pdm_sel is definitely a mux . Is there a follow-up gate after the mux ?
> 
> Not that I could see.  I think I was just overthinking it.  I saw the
> IMX8MP_CLK_AUDIOMIX_PDM_ROOT in mx8mp-clock.h which matched the
> reference in the downstream kernel, so I was expecting that to be the
> same clock name.  When it didn't work, I thought I was missing
> something because I only saw the pdm_sel mux and no direct reason or
> reference to IMX8MP_CLK_AUDIOMIX_PDM_ROOT.  I have it working now.
> Sorry for the noise.  I'll get my series cleaned up and push another
> revision to add micfil node to the 8mp, and I'll probably remove the
> IMX8MP_CLK_AUDIOMIX_PDM_ROOT imx8mp-clock.h so it doesn't throw
> someone else off.

No worries, good thing you found it. Thanks for investigating it.
