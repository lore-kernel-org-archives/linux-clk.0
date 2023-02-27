Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0647C64ED6
	for <linux-clk@archiver.kernel.org>; Mon, 27 Feb 2023 19:07:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229693AbjB0THm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 27 Feb 2023 14:07:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229572AbjB0THl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Feb 2023 14:07:41 -0500
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47CA91EBE9;
        Mon, 27 Feb 2023 11:07:40 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 1E5AF8523A;
        Mon, 27 Feb 2023 20:07:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1677524858;
        bh=dFI/7CCpAWueCC4kuEJtvFEp73Lo2xdOMG6CMLK9GJA=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=hUcwQC9nG2f58SNXn8EC8tdv/rRWwWdDjgw4ZNjfZ8TL2df1ew4uIetxogVB2KHvu
         +s1iVVk7DTBmSOrU8FO+EruUmj8EWCXrkHTZUN4CeDkTzEPiGtYS/xJ9mZWopOG9YK
         Gr14/xkDvA0TSXYQpK2Lq5LENK3gfQAbIRYoN/EYQV52YUSPtjRc0GojjuJROLHybU
         m47Rnuo1aVd/JkviR7rvi91kFJ6gmX7+7wNPKxG0m5/JFrOFS5REiRC9JC+Q+1m8K2
         NqKFK1hb3TMi3pGXY5xIqyfsz8pkGuANRXqBzZad6OVmxzu7qXWbZOCtDtTxPz1B/T
         xohjxoxf56nSw==
Message-ID: <a519eb0b-dc40-deec-03d3-676648a52f15@denx.de>
Date:   Mon, 27 Feb 2023 20:07:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] arm64: dts: imx8mn: specify #sound-dai-cells for SAI
 nodes
Content-Language: en-US
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     linux-arm-kernel@lists.infradead.org,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Fabio Estevam <festevam@gmail.com>,
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
        linux-clk@vger.kernel.org
References: <20230227174535.87657-1-marex@denx.de>
 <20230227190123.znifdqympsantpt6@pengutronix.de>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <20230227190123.znifdqympsantpt6@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 2/27/23 20:01, Marco Felsch wrote:
> Hi Marek,
> 
> On 23-02-27, Marek Vasut wrote:
>> Add #sound-dai-cells properties to SAI nodes.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> ---
>> Cc: Abel Vesa <abelvesa@kernel.org>
>> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
>> Cc: Fabio Estevam <festevam@gmail.com>
>> Cc: Jacky Bai <ping.bai@nxp.com>
>> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
>> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
>> Cc: Lucas Stach <l.stach@pengutronix.de>
>> Cc: Marco Felsch <m.felsch@pengutronix.de>
>> Cc: Michael Turquette <mturquette@baylibre.com>
>> Cc: NXP Linux Team <linux-imx@nxp.com>
>> Cc: Peng Fan <peng.fan@nxp.com>
>> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
>> Cc: Richard Cochran <richardcochran@gmail.com>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Cc: Sascha Hauer <s.hauer@pengutronix.de>
>> Cc: Shawn Guo <shawnguo@kernel.org>
>> Cc: Stephen Boyd <sboyd@kernel.org>
>> Cc: devicetree@vger.kernel.org
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-clk@vger.kernel.org
>> ---
>>   arch/arm64/boot/dts/freescale/imx8mn.dtsi | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/freescale/imx8mn.dtsi b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
>> index ed9ac6c5047c0..bbec860ef8548 100644
>> --- a/arch/arm64/boot/dts/freescale/imx8mn.dtsi
>> +++ b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
>> @@ -294,6 +294,7 @@ spba2: spba-bus@30000000 {
>>   				ranges;
>>   
>>   				sai2: sai@30020000 {
>> +					#sound-dai-cells = <0>;
> 
> Please don't add it in front of the compatible and the reg property.

The #address-cells and #size-cells are also always on top, why should 
the #sound-dai-cells be any different ? Where should they be ?
