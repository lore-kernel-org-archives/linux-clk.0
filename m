Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98FCAC64EC4
	for <linux-clk@archiver.kernel.org>; Tue, 28 Feb 2023 21:55:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229689AbjB1Vzc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 28 Feb 2023 16:55:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229788AbjB1Vzb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 Feb 2023 16:55:31 -0500
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98C1F34334;
        Tue, 28 Feb 2023 13:55:06 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 9D12685BAE;
        Tue, 28 Feb 2023 22:55:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1677621305;
        bh=d1oYz/+/yuOiN1W44Zl2nN1w+KYAPUBLPkcufSJ9h4A=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=WJJQyWBjs+cayRH+QzgDLVVTvqaXcflBsbQ95HXrJuhX8SA4iEeZRsZ3ejfJGvlcD
         I5aU1yqontogaH85NzgPGlN+hoNKismw6SlRNKLcLa6xlvWLL6exgOw2MAEj5XlAFE
         2VuLDRs9I/Pw7P9R4Ntwh6mAVcmTWJGmrUBw+7yfJYjkMeIBWp3aFsdlo0wqTWTlXN
         Uy4GWu50104d5FCgkjPI4k53LuUFpRIDP4aW4vUbgq7UIPBMA2+UBzY3KMeUysjTGj
         gaUoiFAR4hO1CbaHrff0Xlg9inKACHTL0658hzAiDx3Jv3O5+X1OwqBV/B3T86Smws
         ASllqCXi0YX9Q==
Message-ID: <f1626e4b-0f3e-dd07-8ad5-151d03e7570d@denx.de>
Date:   Tue, 28 Feb 2023 22:55:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5 5/5] arm64: dts: imx8mp: Add analog audio output on
 i.MX8MP EVK
Content-Language: en-US
To:     Adam Ford <aford173@gmail.com>
Cc:     Marco Felsch <m.felsch@pengutronix.de>, linux-clk@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Jacky Bai <ping.bai@nxp.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20230227174308.87286-1-marex@denx.de>
 <20230227174308.87286-5-marex@denx.de>
 <20230227185949.xaxltai4ksgrczmc@pengutronix.de>
 <c3b3c08c-989b-3868-c74f-426b8f1733a5@denx.de>
 <CAHCN7x+Jd+C2B+-igv=Pk0Ab4Tj7ecxRrdV85u5CSZ5DjFs5kA@mail.gmail.com>
 <3378fb83-d88d-4854-c096-b459672eef08@denx.de>
 <01f83ee3-51e0-4c7b-8abd-1a8e40abcdf2@denx.de>
 <CAHCN7xJC23KB+9XBRK8F8catugayjzFRS0DEdgvAG+GMsmhb9g@mail.gmail.com>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <CAHCN7xJC23KB+9XBRK8F8catugayjzFRS0DEdgvAG+GMsmhb9g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 2/28/23 12:29, Adam Ford wrote:
> On Tue, Feb 28, 2023 at 12:48 AM Marek Vasut <marex@denx.de> wrote:
>>
>> On 2/28/23 07:43, Marek Vasut wrote:
>>> On 2/28/23 03:44, Adam Ford wrote:
>>>> On Mon, Feb 27, 2023 at 1:37 PM Marek Vasut <marex@denx.de> wrote:
>>>>>
>>>>> On 2/27/23 19:59, Marco Felsch wrote:
>>>>> [...]
>>>>>
>>>>>>> @@ -344,6 +384,18 @@ &i2c3 {
>>>>>>>        pinctrl-0 = <&pinctrl_i2c3>;
>>>>>>>        status = "okay";
>>>>>>>
>>>>>>> +    wm8960: codec@1a {
>>>>>>> +            #sound-dai-cells = <0>;
>>>>>>> +            compatible = "wlf,wm8960";
>>>>>>> +            reg = <0x1a>;
>>>>>>
>>>>>> The compatible should be the first property followed by the reg
>>>>>> property.
>>>>>
>>>>> See my reply to the mx8mn sound-sai-cells patch , I am not sure here.
>>>>> The rest is fixed in V6.
>>>>>
>>>>>>> +            clocks = <&audio_blk_ctrl
>>>>>>> IMX8MP_CLK_AUDIOMIX_SAI3_MCLK1>;
>>>>>>> +            clock-names = "mclk";
>>>>>>> +            wlf,shared-lrclk;
>>>>>>> +            wlf,hp-cfg = <3 2 3>;
>>>>>>> +            wlf,gpio-cfg = <1 3>;
>>>>>>> +            SPKVDD1-supply = <&reg_audio_pwr>;
>>>>>>> +    };
>>>>>>> +
>>>>>>>        pca6416: gpio@20 {
>>>>>>>                compatible = "ti,tca6416";
>>>>>>>                reg = <0x20>;
>>>>>
>>>>> [...]
>>>>>
>>>>>>> @@ -668,6 +730,18 @@ MX8MP_IOMUXC_UART3_TXD__UART1_DCE_RTS   0x140
>>>>>>>                >;
>>>>>>>        };
>>>>>>>
>>>>>>> +    pinctrl_sai3: sai3grp {
>>>>>>> +            fsl,pins = <
>>>>>>> +
>>>>>>> MX8MP_IOMUXC_SAI3_TXFS__AUDIOMIX_SAI3_TX_SYNC   0xd6
>>>>>>> +
>>>>>>> MX8MP_IOMUXC_SAI3_TXC__AUDIOMIX_SAI3_TX_BCLK    0xd6
>>>>>>> +
>>>>>>> MX8MP_IOMUXC_SAI3_RXD__AUDIOMIX_SAI3_RX_DATA00  0xd6
>>>>>>> +
>>>>>>> MX8MP_IOMUXC_SAI3_TXD__AUDIOMIX_SAI3_TX_DATA00  0xd6
>>>>>>> +
>>>>>>> MX8MP_IOMUXC_SAI3_MCLK__AUDIOMIX_SAI3_MCLK      0xd6
>>>>>>> +
>>>>>>> MX8MP_IOMUXC_SAI3_RXFS__GPIO4_IO28              0xd6
>>>>>>
>>>>>> What is gpio04-io28 used for?
>>>>>
>>>>> Apparently unused, dropped.
>>>>
>>>> Isn't that the headphone detect GPIO?
>>>>
>>>> I think simple-audio-card,hp-det-gpio can reference it.
>>>
>>> Per the schematics of the MX8MP EVK, the pin is not connected on the
>>> board-to-board connector EVK side, right ?
>>
>> Er, correction, that's AUD_NINT, which is WM8960 GPIO1 .
> 
> I only went by NXP's downstream device tree.  I didn't have the
> schematics in front of me.  Sorry for the noise.

But you and Marco were right in that I had the regulator pinmux wrong 
(fixed in V6)
