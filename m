Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43796C43334
	for <linux-clk@archiver.kernel.org>; Tue, 28 Jun 2022 17:06:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229896AbiF1RGt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 28 Jun 2022 13:06:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232502AbiF1RGo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 Jun 2022 13:06:44 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CF622B25D
        for <linux-clk@vger.kernel.org>; Tue, 28 Jun 2022 10:06:43 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id BE72A80085;
        Tue, 28 Jun 2022 19:06:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1656436001;
        bh=36tNy+Th6OmBQgRNpt1PbziVfnuVV/VA8UuKLoSj1MI=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=jNG0Ms6hD0h3VHTqxmBKDZQL6BgK072LOCN62ZbUxyMKARGu4d/Su4f9n28GO4/rR
         hHDEIZ8kMh1kUgv/eNJnbvaiJSbJXeZoDb33J70YHBLDxEhnx+9INaDEStpHCu4W3V
         JdD5iF6lHnvch8bevfM5etztO0lc6T0Ez4F5hkaWdWlIp8j1IGeSdEUReH+GGfQLPl
         ZneKQ3rRUAUH4CBU5OIZTaQWizH2OH9SQ2G6O2Q2yvFzZKHZNC/kftDhq3UdCw8QKf
         HVzWqfpxSRHYTlLVxRQwcU9/P63OHw95G/bFcwMGY77/bvFU8Tgzwmz7dCFlLiZQQ8
         IxiGfoRhJCSoA==
Message-ID: <8d3fcbd9-2fd0-bf90-afa0-a21a79c81dbb@denx.de>
Date:   Tue, 28 Jun 2022 19:06:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 3/6] clk: imx: imx8mp: Add audiomix block control
Content-Language: en-US
To:     Abel Vesa <abel.vesa@linaro.org>
Cc:     Lucas Stach <l.stach@pengutronix.de>, linux-clk@vger.kernel.org,
        Abel Vesa <abel.vesa@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Jacky Bai <ping.bai@nxp.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
References: <20220625013235.710346-1-marex@denx.de>
 <20220625013235.710346-3-marex@denx.de> <YrnOTaLS2r7QBMNx@linaro.org>
 <66f689d9-a691-8bf6-62a2-48fac6eb3938@denx.de> <YrqxZFvKen7QybA9@linaro.org>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <YrqxZFvKen7QybA9@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 6/28/22 09:44, Abel Vesa wrote:
> On 22-06-27 18:23:33, Marek Vasut wrote:
>> On 6/27/22 17:35, Abel Vesa wrote:
>>> On 22-06-25 03:32:32, Marek Vasut wrote:
>>>> Unlike the other block control IPs in i.MX8M, the audiomix is mostly a
>>>> series of clock gates and muxes. Model it as a large static table of
>>>> gates and muxes with one exception, which is the PLL14xx . The PLL14xx
>>>> SAI PLL has to be registered separately.
>>>>
>>>
>>> Again, there is a chance that the blk-ctrl driver might disable the PD
>>> from under this.
>>
>> Can you elaborate a bit more on this ? How/why do you think so ?
> 
> At some point, the PDs from the Audiomix IP block will be added to the
> drivers/soc/imx/imx8mp-blk-ctrl.c. Then, you'll have 2 drivers with the
> same address range and the imx8mp-blk-ctrl also has runtime PM enabled.

Why would the PDs be added into the block control driver?

The audiomix is purely a clock mux driver, not really a block control 
driver providing PDs of its own.
