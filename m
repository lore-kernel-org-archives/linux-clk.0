Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BC23C64EC7
	for <linux-clk@archiver.kernel.org>; Tue, 28 Feb 2023 06:48:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229590AbjB1GsN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 28 Feb 2023 01:48:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbjB1GsM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 Feb 2023 01:48:12 -0500
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 246CDF971;
        Mon, 27 Feb 2023 22:48:11 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 5A9E982A55;
        Tue, 28 Feb 2023 07:48:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1677566889;
        bh=8qKnniO6pYqsPHYhKDS1xO/c4qyPwt9YlHhvaKO/Rho=;
        h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
        b=QiID8d3Vw2PMQTqZ/X1o16K28emU4MthGUsmcIciC7QO8M3eyxsilTsCwDKfYnW7f
         7FN92t8i05DI6Xfh32D+sStma9RwDxT3YZeT6jVeucCpklJ0Ril8OMDNNUpVjBPrle
         AtgJeqnGSeGNI2vMWP5xaOtF0BUjQeEzAhRZqKTffqeXS9IuYOxiWVGShP4PyRrRV0
         5V+Bt/wqimF2zn2r+sLfNh+MSEDimkFfL+FfzO2AvjK2eW+3+JkTL/ENnTV4DLWRlT
         s6sYG4qtDv6VJ2smEuhWLBP5f7C5kcloJbcb+l8R9ytIq52SLB2bWVKhQXecetcWpj
         sKtD7LF/g7otQ==
Message-ID: <01f83ee3-51e0-4c7b-8abd-1a8e40abcdf2@denx.de>
Date:   Tue, 28 Feb 2023 07:48:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5 5/5] arm64: dts: imx8mp: Add analog audio output on
 i.MX8MP EVK
Content-Language: en-US
From:   Marek Vasut <marex@denx.de>
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
In-Reply-To: <3378fb83-d88d-4854-c096-b459672eef08@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 2/28/23 07:43, Marek Vasut wrote:
> On 2/28/23 03:44, Adam Ford wrote:
>> On Mon, Feb 27, 2023 at 1:37 PM Marek Vasut <marex@denx.de> wrote:
>>>
>>> On 2/27/23 19:59, Marco Felsch wrote:
>>> [...]
>>>
>>>>> @@ -344,6 +384,18 @@ &i2c3 {
>>>>>       pinctrl-0 = <&pinctrl_i2c3>;
>>>>>       status = "okay";
>>>>>
>>>>> +    wm8960: codec@1a {
>>>>> +            #sound-dai-cells = <0>;
>>>>> +            compatible = "wlf,wm8960";
>>>>> +            reg = <0x1a>;
>>>>
>>>> The compatible should be the first property followed by the reg
>>>> property.
>>>
>>> See my reply to the mx8mn sound-sai-cells patch , I am not sure here.
>>> The rest is fixed in V6.
>>>
>>>>> +            clocks = <&audio_blk_ctrl 
>>>>> IMX8MP_CLK_AUDIOMIX_SAI3_MCLK1>;
>>>>> +            clock-names = "mclk";
>>>>> +            wlf,shared-lrclk;
>>>>> +            wlf,hp-cfg = <3 2 3>;
>>>>> +            wlf,gpio-cfg = <1 3>;
>>>>> +            SPKVDD1-supply = <&reg_audio_pwr>;
>>>>> +    };
>>>>> +
>>>>>       pca6416: gpio@20 {
>>>>>               compatible = "ti,tca6416";
>>>>>               reg = <0x20>;
>>>
>>> [...]
>>>
>>>>> @@ -668,6 +730,18 @@ MX8MP_IOMUXC_UART3_TXD__UART1_DCE_RTS   0x140
>>>>>               >;
>>>>>       };
>>>>>
>>>>> +    pinctrl_sai3: sai3grp {
>>>>> +            fsl,pins = <
>>>>> +                    
>>>>> MX8MP_IOMUXC_SAI3_TXFS__AUDIOMIX_SAI3_TX_SYNC   0xd6
>>>>> +                    
>>>>> MX8MP_IOMUXC_SAI3_TXC__AUDIOMIX_SAI3_TX_BCLK    0xd6
>>>>> +                    
>>>>> MX8MP_IOMUXC_SAI3_RXD__AUDIOMIX_SAI3_RX_DATA00  0xd6
>>>>> +                    
>>>>> MX8MP_IOMUXC_SAI3_TXD__AUDIOMIX_SAI3_TX_DATA00  0xd6
>>>>> +                    
>>>>> MX8MP_IOMUXC_SAI3_MCLK__AUDIOMIX_SAI3_MCLK      0xd6
>>>>> +                    
>>>>> MX8MP_IOMUXC_SAI3_RXFS__GPIO4_IO28              0xd6
>>>>
>>>> What is gpio04-io28 used for?
>>>
>>> Apparently unused, dropped.
>>
>> Isn't that the headphone detect GPIO?
>>
>> I think simple-audio-card,hp-det-gpio can reference it.
> 
> Per the schematics of the MX8MP EVK, the pin is not connected on the 
> board-to-board connector EVK side, right ?

Er, correction, that's AUD_NINT, which is WM8960 GPIO1 .
