Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 590BCC64EC4
	for <linux-clk@archiver.kernel.org>; Tue, 28 Feb 2023 20:13:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229610AbjB1UNg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 28 Feb 2023 15:13:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229544AbjB1UNf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 Feb 2023 15:13:35 -0500
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 277F015881;
        Tue, 28 Feb 2023 12:13:33 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id ABCF985BB7;
        Tue, 28 Feb 2023 21:13:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1677615210;
        bh=ptYR2MjL1HwjwaBhA1+eQmVpWLTCrAMkvLx0Qg6cnSM=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=es3WGoolE3P4jPH3+SO8d66+nRfcLsPQU3oVS7Sh8zYiYTWTdbGa6+Icec9fmQ1/G
         gS9nHeINtyjyeMr51+lE+XnEd+YwCPR6Xy9Oa5wFhBvRyE1BMA19wqx8hnRd5EE+mb
         jTWFVN5mW74L8fnJK39R4YhgcEs+GCSul824tDZMYo17oM3pdfMoW0JsPDjajH5akI
         OXBbX1brJyle2TLoZJh9N0DWlHEWtG9cJvefjPxIZJKTUZdC7MSdYRnmmWow4PnQBy
         znX4QA2Ehp7AkcGj/+HzKFDCD5jUUokLz05J55R9VAFvdQ6QfONwiLqQeR7xdDngIb
         AByiR7q2x4JIg==
Message-ID: <5aa6d956-f00b-faa2-e189-12cf1274962b@denx.de>
Date:   Tue, 28 Feb 2023 21:13:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] arm64: dts: imx8mn: specify #sound-dai-cells for SAI
 nodes
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Marco Felsch <m.felsch@pengutronix.de>
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
 <a519eb0b-dc40-deec-03d3-676648a52f15@denx.de>
 <20230227200039.ugmtvpli6gvux3fi@pengutronix.de>
 <947af937-3178-48ad-998f-b048245f3ffe@linaro.org>
Content-Language: en-US
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <947af937-3178-48ad-998f-b048245f3ffe@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 2/28/23 09:10, Krzysztof Kozlowski wrote:
> On 27/02/2023 21:00, Marco Felsch wrote:
>>>>> +					#sound-dai-cells = <0>;
>>>>
>>>> Please don't add it in front of the compatible and the reg property.
>>>
>>> The #address-cells and #size-cells are also always on top, why should the
>>> #sound-dai-cells be any different ? Where should they be ?
>>
>> As of now my understanding of specifying a devicetree node was:
>>
>> node-name@reg-nr {
>> 	compatible = "";
>> 	reg = <>;
>> 	// all pending properties below
>> 	...
>> };
>>
>> @Rob, @Krzysztof:
>> Is this a (unwritten) rule/policy?
>>
> 
> Each platform has its own coding style around this but I am not aware of
> a coding style which puts address and size cells at the top.

DTspec 0.3 and 0.4-rc agrees with the below.

Linux seems to be full of counter-examples though:
$ git grep -A 1 ' {$' arch/*/boot/dts/ | grep -B 1 cells

> To me it is
> really odd placement. First property is always "compatible", as the most
> important. Then for most platforms second is "reg", as the one easiest
> to compare with unit address. Some platforms put status as last property.

All right, so:

- compatible
- reg
- #whatever-cells
- properties
- status

Does that order look right ?

[...]
