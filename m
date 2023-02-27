Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92A91C64ED6
	for <linux-clk@archiver.kernel.org>; Mon, 27 Feb 2023 14:58:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229968AbjB0O6j (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 27 Feb 2023 09:58:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229962AbjB0O6h (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Feb 2023 09:58:37 -0500
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6958C5262;
        Mon, 27 Feb 2023 06:58:36 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id B2CBF8339E;
        Mon, 27 Feb 2023 15:58:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1677509914;
        bh=r/XTzrYSTfxQc9R6KeDw695Bi854lHCpElV1s8nh8zI=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=B61E42Rlo4Qbn6uODr49/NrHqZtDV6G2b4N5nZEpnn2AW4+IbG8wgrr/hxciTsicb
         NlAQ9q5LW+JKbq1Q+qLwAmFrX894HlPPcbUri5KCfBhcf0GT5KYh1dRxjaXGKo9RMi
         R8p2MoyhFHPHU1hwYnB4xK+aZy1D78LtNPFw3fdsid+MLAhXpiWOLqXWKht8n4lE6K
         VndDJMufqNL8k5pXKMHEfM3ah2gL3tSoPg78bsubhW1k+8SCZKOvdQHCBAh0RbieuN
         cyvq3JqauOs6gZSnqiIoqy6vCp/bi2IzDHb0gsqScKVGD5Z07g/SOxjZd7kAsbconp
         h86Hx7j3fmLcA==
Message-ID: <f4fd60db-9924-cb2c-71bb-1ac3b53305e8@denx.de>
Date:   Mon, 27 Feb 2023 14:53:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 4/5] arm64: dts: imx8mp: Add SAI, SDMA, AudioMIX
Content-Language: en-US
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-clk@vger.kernel.org
Cc:     Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Jacky Bai <ping.bai@nxp.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Marco Felsch <m.felsch@pengutronix.de>,
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
References: <20230223171114.59164-1-marex@denx.de>
 <20230223171114.59164-4-marex@denx.de> <3160821.5fSG56mABF@steina-w>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <3160821.5fSG56mABF@steina-w>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 2/27/23 10:08, Alexander Stein wrote:

[...]

>> +			sdma2: dma-controller@30e10000 {
>> +				compatible = "fsl,imx8mp-sdma",
> "fsl,imx8mq-sdma";
>> +				reg = <0x30e10000 0x10000>;
>> +				interrupts = <GIC_SPI 103
> IRQ_TYPE_LEVEL_HIGH>;
>> +				clocks = <&audio_blk_ctrl
> IMX8MP_CLK_AUDIOMIX_SDMA2_ROOT>,
>> +					 <&clk
> IMX8MP_CLK_AUDIO_ROOT>;
>> +				clock-names = "ipg", "ahb";
>> +				#dma-cells = <3>;
>> +				fsl,sdma-ram-script-name = "imx/sdma/
> sdma-imx7d.bin";
>> +			};
>> +
>> +			audio_blk_ctrl: blk-ctrl@30e20000 {
> 
> Shouldn't the node name be 'clock-controller@30e20000' as mentioned in the
> bindings?
> But for the whole series:
> Testes-by: Alexander Stein <alexander.stein@ew.tq-group.com>

It should be clock-controller indeed, fixed in V5, thanks.
