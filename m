Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6DA1C6FA8F
	for <linux-clk@archiver.kernel.org>; Wed, 30 Aug 2023 21:30:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239596AbjH3Vaq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 30 Aug 2023 17:30:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230286AbjH3Vap (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 30 Aug 2023 17:30:45 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E155CC;
        Wed, 30 Aug 2023 14:30:15 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id A00CC86529;
        Wed, 30 Aug 2023 21:10:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1693422618;
        bh=kwozhpbyt9j7/u9kKaoszAizSgLmV78Xsxd3v36CqvU=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=kHyJPc8WHZlvDAmlFFW1oKG/JNi4AQMyNTJO/uS3anIXcCAA0QMppFBJOQxs+m/Jk
         utRKASNFBqXFvJuwmJS7JI5RNqi9PrOvOfcWhbaSzd3vYoPA7AS1+tcKoanFRen8W2
         1pUbn09qSjzf9OHs9vBM8mhp+k1oeH23VsEetfh95odpabDUe4Lu9VVtHky9zldELw
         RC8MOeztZuAB3QNGy6Kw1UhGyVP7YvbVq2p8YfTXSs/5KE8qcSk0q0u8AC4ErG6Qqe
         N+JFtQVm/niwRqWzOzMikSUI2ARpBJPDhiVAbMpOOJJnpSGgWpJcn/l8Gg3eYfvgi2
         w1zdbNlCCFhMQ==
Message-ID: <d99a1da1-1486-a4e6-c377-87effd3fd1bc@denx.de>
Date:   Wed, 30 Aug 2023 21:10:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v8 1/2] arm64: dts: imx8mp: Add SAI, SDMA, AudioMIX
Content-Language: en-US
To:     Adam Ford <aford173@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Richard Leitner <richard.leitner@skidata.com>,
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
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <CAHCN7xJGMkf3MZWK5NqtUxnSTRaZdL-8f3ngUsOUKEdOmdUvXw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 8/30/23 04:44, Adam Ford wrote:

Hi,

> I have a question about the clocking for eASRC and PDM.
> 
>> +
>> +                       audio_blk_ctrl: clock-controller@30e20000 {
>> +                               compatible = "fsl,imx8mp-audio-blk-ctrl";
>> +                               reg = <0x30e20000 0x10000>;
>> +                               #clock-cells = <1>;
>> +                               clocks = <&clk IMX8MP_CLK_AUDIO_ROOT>,
>> +                                        <&clk IMX8MP_CLK_SAI1>,
>> +                                        <&clk IMX8MP_CLK_SAI2>,
>> +                                        <&clk IMX8MP_CLK_SAI3>,
>> +                                        <&clk IMX8MP_CLK_SAI5>,
>> +                                        <&clk IMX8MP_CLK_SAI6>,
>> +                                        <&clk IMX8MP_CLK_SAI7>;
>> +                               clock-names = "ahb",
>> +                                             "sai1", "sai2", "sai3",
>> +                                             "sai5", "sai6", "sai7";
>> +                               power-domains = <&pgc_audio>;
>> +                       };
>> +               };
>> +
> 
> I am trying to plumb in the micfil driver with a PDM microphone on a
> Plus.  I have SAI3 and SAI5 audio working, but if I try to use the
> micfil, the PDM clock doesn't get turned on, and the micfil doesn't
> appear to see anything coming in.  I was curious why the
> audio_blk_ctrl has clock entries for IMX8MP_CLK_SAIx, but there isn't
> one for the PDM nor the ASRC clocks.

I only ever needed SAI, so that was what was tested on the EVK .

> I added the MICFIL noted to the
> 8mp in a previous patch [1], and I am trying to customize the MICFIL
> node as follows:
> 
> &micfil {
> #sound-dai-cells = <0>;
> pinctrl-names = "default";
> pinctrl-0 = <&pinctrl_pdm>;
> assigned-clocks = <&clk IMX8MP_CLK_PDM>;
> assigned-clock-parents = <&clk IMX8MP_AUDIO_PLL1_OUT>;
> assigned-clock-rates = <196608000>;
> status = "okay";
> };
> 
> I also noticed in the down-stream kernel, the pdm_ipg_clk and
> pdm_root_clk are shared gates with separate parents.
> 
> The PDM tree of the down-stream kernel looks like this:
>   audio_pll1_ref_sel                0        0        0    24000000
>       0     0  50000         Y
>         audio_pll1                     0        0        0   393216000
>          0     0  50000         Y
>            audio_pll1_bypass           0        0        0   393216000
>          0     0  50000         Y
>               audio_pll1_out           0        0        0   393216000
>          0     0  50000         N
>                  pdm                   0        0        0   196608000
>          0     0  50000         N
>                     pdm_root           0        0        0   196608000
>          0     0  50000         N
>                        pdm_sel         0        0        0   196608000
>          0     0  50000         Y
>                           pdm_root_clk       0        0        0
> 196608000          0     0  50000         N
> 
> The PDM tree of the mainline looks like this:
> 
>     audio_pll1_ref_sel                0        0        0    24000000
>         0     0  50000         Y
>         audio_pll1                     0        0        0   393216000
>          0     0  50000         Y
>            audio_pll1_bypass           0        0        0   393216000
>          0     0  50000         Y
>               audio_pll1_out           0        0        0   393216000
>          0     0  50000         N
>                  pdm                   0        0        0   196608000
>          0     0  50000         N
>                     pdm_root           0        0        0   196608000
>          0     0  50000         N
>                        pdm_sel         0        0        0   196608000
>          0     0  50000         Y
> 
> It seems like the "pdm_root_clk" generated by the shared audo-blk
> down-sream driver is missing from the mainline.  I looked up the clock
> I referenced when I attempted to enable the miffil, but
> 'IMX8MP_CLK_AUDIOMIX_PDM_ROOT doesn't appear to be configured in
> either clk-imx8mp.c or clk-imx8mp-audiomix.c.  Maybe it's obscured by
> the macros, but it seems like the pdm_sel should somehow have an
> additional variable for the shared clock and an additional clock like
> pdm_root_clk assigned with it.
> 
> I have similar configurations for Mini and Nano, and both of them are
> able to record audio, so I think there might be a clock issue
> somewhere related to the audiomix driver, and not a misconfiguration
> of the sound-card or the micfil itself.

Shouldn't the micfil be somehow a consumer of the pdm_sel clock , and 
enable those clock in the driver ?
