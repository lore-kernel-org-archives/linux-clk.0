Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4334FC4332F
	for <linux-clk@archiver.kernel.org>; Wed, 16 Nov 2022 21:07:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229931AbiKPVHW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 16 Nov 2022 16:07:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239230AbiKPVG4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 16 Nov 2022 16:06:56 -0500
Received: from smtpcmd0642.aruba.it (smtpcmd0642.aruba.it [62.149.156.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E130143AF3
        for <linux-clk@vger.kernel.org>; Wed, 16 Nov 2022 13:05:47 -0800 (PST)
Received: from [192.168.50.220] ([146.241.88.137])
        by Aruba Outgoing Smtp  with ESMTPSA
        id vPbNov83AEclovPbNoJmEN; Wed, 16 Nov 2022 22:05:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
        t=1668632746; bh=Xvf1+wKHK4unr2y4+q6+Qg2yKoqgkrIdcIad1uJ8cJA=;
        h=Date:MIME-Version:Subject:To:From:Content-Type;
        b=DY7nmyE5l0PBK6rwt43WgQ5Bvtl9Fsvs8O5IZ5qC2Sys5+Wo0uunKfkHS276RzADS
         Xsy7yaBp+0K6JeEtcjFIUQPOiTef6oYMgKdwMeqPkGSyhSBXFsOOCfyQ4xB1qzRDKt
         f8tlkotnjQ6Au5E8hTjX1E268pbDVrpJ6R/kzvrRuvAVlSzdj8TXNSWPPYmH1WS+ME
         UVUvF+D1n3qJf+i054deAZejAZR06sFYOwVdHFYw9Gl+mheusEDC5qVzyqihRzXPUP
         yb3V75MGJ2nrm7L53hsXK8tBWyquP+8c5db8fkb121vS+tU/4uqc92D3OxPxFtD4Jb
         pUn+HU0eCQkVw==
Message-ID: <fcf9dd95-fbb6-c511-dfa7-0fed40870922@benettiengineering.com>
Date:   Wed, 16 Nov 2022 22:05:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 1/4] clk: imx: imxrt1050: fix IMXRT1050_CLK_LCDIF_APB
 offsets
Content-Language: en-US
To:     Fabio Estevam <festevam@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Bough Chen <haibo.chen@nxp.com>,
        Jesse Taube <mr.bossman075@gmail.com>
References: <20221116203520.8300-1-giulio.benetti@benettiengineering.com>
 <CAOMZO5A9dhxtv2di57tkumS5Y7uDvkKqWvt4MfB9bbdH5dTPwg@mail.gmail.com>
From:   Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <CAOMZO5A9dhxtv2di57tkumS5Y7uDvkKqWvt4MfB9bbdH5dTPwg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfKmcd3GrKqNdixhv2m/Yj9JO2sEII2WekZSUdpyEaqUmrtz+qDrPKTW36yH3dWUzpmCThjBifHXCoVRwPCne+IKcxrr3YbRV7KmNPNH1tr0Dv9fvU8W4
 Ff+txv8asRss5ptdrrRbY+R2//FTYc0bMJGh5HTWwTJxXJIAB1LdcD3UozyF05OaOE+ee4Wr9dqgW3ijkR4Bwgt/h4muAJf+/nZ41A1EBg581dOKQL9jYGN1
 FNRWSrsIuGhfcqTREM1BRU/u35TdJ5UqVJHWYuuk2YaZyRqCjwINjSPZ2RmjM/EtCeIsKoCD5EKN4dxDpPNfkcC9Qa4VoYlr6wTA0dzdQlU22hGBpJP/UVHa
 bxpnHMkY1uCOSb0ZzdCkxnyHOklwAwm3AQg10GQo2SvsKSWMwoOWlZRDUCNWxR7BrcouQiXqpwLAbG/JJ/BgB18nQYHgyQNcRL1ZN3wqxr5qqpVDEoBxcVVY
 0uHrWLnnM+Nj3oXqdcnTpmw5/F/y6dQhacUSA5bpcOQszuzv+IJ+4l3ZMKvpTV69oDz2+aRHng4aC8XfLWx3AcljGtJSa+kUBdUEUNNzM1/OCU1kfYZs/azk
 cEVyxqD3y27jKIwUzDXHh/7T9rfz5QBw3U41E7lnxRIIRwGtESPLG6Nc90Vktn2ihMEqjUik33umnberfW1PgDHe+Od4IgkDarwnIlXzhMgf/nU+CfRc6HKz
 OBjMHp98bLHGL+TZiPCcHBefhHwEybKd9BWWbrVWYOHBjGcCyYcrlQ==
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Fabio,

On 16/11/22 21:52, Fabio Estevam wrote:
> Hi Giulio,
> 
> On Wed, Nov 16, 2022 at 5:35 PM Giulio Benetti
> <giulio.benetti@benettiengineering.com> wrote:
>>
>> Fix IMXRT1050_CLK_LCDIF_APB offsets.
>>
>> Cc: Jesse Taube <mr.bossman075@gmail.com>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> 
> Since this is a fix, please add a Fixes tag.

Fixes: 7154b046d8f3 ("clk: imx: Add initial support for i.MXRT1050 clock 
driver")

Do you want me to send a V4 for these patches with the Fixes tag?

Best regards
-- 
Giulio Benetti
CEO/CTO@Benetti Engineering sas
