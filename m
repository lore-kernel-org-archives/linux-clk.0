Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1D66C19F2A
	for <linux-clk@archiver.kernel.org>; Thu, 11 Aug 2022 14:30:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234332AbiHKOa0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Aug 2022 10:30:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234295AbiHKOaZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 11 Aug 2022 10:30:25 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF9BE31939
        for <linux-clk@vger.kernel.org>; Thu, 11 Aug 2022 07:30:23 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id AAA3F84945;
        Thu, 11 Aug 2022 16:30:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1660228221;
        bh=5ps7IFj1ihzM6IEzhf6ReQ3e0+cjP0GQzBsxCs62cE0=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=SV+iD8aFQwwl7PgHXxTxjHqQ35eY8laLB1SVyriV0QavnoM4t8hTaioBg1QNiWO6C
         Nk+X9KRPSUmu8DUingZIjw31NRGK1zpiVLyUOd3UzVn0Il1O3xgqZtctLmySO88G8X
         PqKUeQjs/VzVG423+gInqsRVvtuRQZnWSk8BK6M6thHco4H5vZnMnPhfrgtf2TdfP5
         DcJmrvEM8C/HCgVlg1ACIZKfGfvUAgc/FaObdB9YyNfVT00NVeENYO/AmNXd1Q2QEz
         ZL8nw95f5stuR7m0wZ4bv5o6jtFKepCr2D7mzPoDX0yK3zv28eSW6oxb5kcMIXPheH
         cLQLsZKTbpUEA==
Message-ID: <0255ea59-fb70-4dc6-6477-5531981366e1@denx.de>
Date:   Thu, 11 Aug 2022 16:30:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3 3/6] clk: imx: imx8mp: Add audiomix block control
Content-Language: en-US
To:     Abel Vesa <abel.vesa@linaro.org>
Cc:     Peng Fan <peng.fan@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Abel Vesa <abel.vesa@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Jacky Bai <ping.bai@nxp.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        dl-linux-imx <linux-imx@nxp.com>
References: <20220625013235.710346-1-marex@denx.de>
 <20220625013235.710346-3-marex@denx.de> <YrnOTaLS2r7QBMNx@linaro.org>
 <66f689d9-a691-8bf6-62a2-48fac6eb3938@denx.de> <YrqxZFvKen7QybA9@linaro.org>
 <8d3fcbd9-2fd0-bf90-afa0-a21a79c81dbb@denx.de>
 <DU0PR04MB9417D9CE71ED2A72C5515D91889F9@DU0PR04MB9417.eurprd04.prod.outlook.com>
 <e54590c4-7e94-0b97-9415-c970a170c6e1@denx.de> <YvUQMpfxjH+szgpx@linaro.org>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <YvUQMpfxjH+szgpx@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 8/11/22 16:20, Abel Vesa wrote:
> On 22-08-04 11:31:33, Marek Vasut wrote:
>> On 8/4/22 11:13, Peng Fan wrote:
>>>> Subject: Re: [PATCH v3 3/6] clk: imx: imx8mp: Add audiomix block control
>>>>
>>>> On 6/28/22 09:44, Abel Vesa wrote:
>>>>> On 22-06-27 18:23:33, Marek Vasut wrote:
>>>>>> On 6/27/22 17:35, Abel Vesa wrote:
>>>>>>> On 22-06-25 03:32:32, Marek Vasut wrote:
>>>>>>>> Unlike the other block control IPs in i.MX8M, the audiomix is
>>>>>>>> mostly a series of clock gates and muxes. Model it as a large
>>>>>>>> static table of gates and muxes with one exception, which is the
>>>>>>>> PLL14xx . The PLL14xx SAI PLL has to be registered separately.
>>>>>>>>
>>>>>>>
>>>>>>> Again, there is a chance that the blk-ctrl driver might disable the
>>>>>>> PD from under this.
>>>>>>
>>>>>> Can you elaborate a bit more on this ? How/why do you think so ?
>>>>>
>>>>> At some point, the PDs from the Audiomix IP block will be added to the
>>>>> drivers/soc/imx/imx8mp-blk-ctrl.c. Then, you'll have 2 drivers with
>>>>> the same address range and the imx8mp-blk-ctrl also has runtime PM
>>>> enabled.
>>>>
>>>> Why would the PDs be added into the block control driver?
>>>>
>>>> The audiomix is purely a clock mux driver, not really a block control driver
>>>> providing PDs of its own.
>>>
>>> I recalled that with with blk-ctrl working as clock provider, there is dead lock
>>> issue, if the blk-ctrl node has a power-domain entry. Not very sure.
>>
>> How can I verify that ? Lockdep ?
>>
>> I run this series for months and haven't seen a lock up or splat.
> 
> Audiomix (and every mix actually) has a PD. Once you add the PD, you'll
> end up with an ABBA deadlock between genpd lock and clock prepare lock.

Unlike the other mix drivers, this is a pure clock driver, not a power 
domain driver. The PD is already available to this clock driver, see:
[PATCH v3 5/6] arm64: dts: imx8mp: Add SAI, SDMA, AudioMIX

Can you please elaborate on the deadlock problem ?
Because really, I just don't see it.

Were you able to reproduce the deadlock with this driver ?

> Have a read here:
> 
> https://lore.kernel.org/lkml/160453833813.3965362.13967343909525787375@swboyd.mtv.corp.google.com/T/#m0160265b0604ac8a524fedae7845e9f60bae67ef

Which part of the lengthy thread do you refer to ? I suspect the 
'permalink' might help pointing to specific email in the thread.

Note that the aforementioned thread discusses the other mix drivers 
which are PDs, this driver is not, there is a difference.
