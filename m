Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A292C77B7F
	for <linux-clk@archiver.kernel.org>; Mon,  8 May 2023 11:44:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236315AbjEHLoZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 8 May 2023 07:44:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236277AbjEHLoB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 8 May 2023 07:44:01 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8339410A3E;
        Mon,  8 May 2023 04:43:25 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 281EA84707;
        Mon,  8 May 2023 13:43:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1683546203;
        bh=Kp3PzHtK5KQwNx4c+LOX3TUTRXO+SccqU7BXojE4J+E=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=hA+C3RfG8vwd91za/kXH5vyDn6yl75LrTXvftpNSZG6zbnOJkbnR/TK66ykyi8UjH
         A187v3I5p3H5sj/XgtQdh2Y6wiiTxQaC6Ofmdf857oJ5GGdpdoC6wGoNEBcQ6r5sqA
         QGj3DbLBpyDz12pgtxlxkCSicpBGzvH53UWFZW36YejBegTDiKEZztPHBInQMZ0qA9
         K4+E/wlvLT0d08Hcq1qx7Gjryv9iIb/ZgD2EbicsGhXaQRcX61pHRco+Kbkeh9dOU9
         sYD94vn2H3HUII7gBdQd69sZI8fuN56nZV8BDymxTFzFxr8OAfVCFHJlz7PbKhu5vf
         29t+OfaV3MIaw==
Message-ID: <65a5e1fa-5fdb-c424-d3e5-34606dd61919@denx.de>
Date:   Mon, 8 May 2023 13:43:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v7 4/5] arm64: dts: imx8mp: Add SAI, SDMA, AudioMIX
Content-Language: en-US
To:     Marco Felsch <m.felsch@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>
Cc:     Peng Fan <peng.fan@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
        Abel Vesa <abelvesa@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Richard Cochran <richardcochran@gmail.com>,
        devicetree@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Adam Ford <aford173@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        Stephen Boyd <sboyd@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Richard Leitner <richard.leitner@linux.dev>,
        Lucas Stach <l.stach@pengutronix.de>
References: <20230301163257.49005-1-marex@denx.de>
 <20230301163257.49005-4-marex@denx.de> <ZACNuAOJd+uXBKyJ@g0hl1n.net>
 <20230421092623.jz7qxd7pkj2egzts@pengutronix.de>
 <20230508083040.rjxlxopim2xkypet@pengutronix.de>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <20230508083040.rjxlxopim2xkypet@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 5/8/23 10:30, Marco Felsch wrote:
> On 23-04-21, Marco Felsch wrote:
>> Hi Shawn,
>>
>> On 23-03-02, Richard Leitner wrote:
>>> On Wed, Mar 01, 2023 at 05:32:56PM +0100, Marek Vasut wrote:
>>>> Add all SAI nodes, SDMA2 and SDMA3 nodes, and AudioMIX node. This is
>>>> needed to get audio operational on i.MX8MP .
>>>>
>>>> Acked-by: Peng Fan <peng.fan@nxp.com>
>>>> Reviewed-by: Fabio Estevam <festevam@gmail.com>
>>>> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>>>> Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
>>>> Tested-by: Adam Ford <aford173@gmail.com> #imx8mp-beacon-kit
>>>> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
>>>> Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>>
>>> Hi Marek,
>>> I've successfully tested this patch on a custom i.MX8MP board. Therefore
>>> please feel free to add:
>>>
>>> Tested-by: Richard Leitner <richard.leitner@skidata.com>
>>
>> Can you please pick patch 4 and 5? Patch 1-3 is already picked by Abel.
> 
> Gentle ping.

I collected the TB from Richard and sent a V8 separately with just the 
outstanding DT patches .
