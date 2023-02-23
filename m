Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AA44C636D6
	for <linux-clk@archiver.kernel.org>; Thu, 23 Feb 2023 16:24:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233421AbjBWQYg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 23 Feb 2023 11:24:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233240AbjBWQYg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 23 Feb 2023 11:24:36 -0500
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4774B18155
        for <linux-clk@vger.kernel.org>; Thu, 23 Feb 2023 08:24:35 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id E7D4E8573B;
        Thu, 23 Feb 2023 17:24:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1677169473;
        bh=qHoCgY1CenvXwJXW4zQHN5F30ppdmCRXgdneYtQV+Vo=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=Qjt7pScawpQg1/YjTnvUzRuoDrxAasAMC68vh1mINBNQXCnx/ZngVWc5t0X/QkjpL
         1BG0shXjPrZMJCar68xypdx8pJ+mL5+3p/Z4WXjw+iHVbVku4Hkimit344tRpsB29r
         94Lfn2jNIBUXC7/8AXSBb3lICzqzWpfCAugbyP1z5BABrpZG7Mt8rzeo4Gr+EXxb3h
         DcEP0UpaEqFMcjmUXhPFAO26YV56s4E+yNX8uyi05Gl5dfUEj/F8mMKSnhUV7RYb8c
         dvHsAOEUwC5AOWAm52of/c+I+tt1xmOQ7kOvAsoDvGzfN/0s28OCv+lqeKL77tsm8X
         0wNbc0SLchBsg==
Message-ID: <9aa7d898-d3ba-2018-7f88-d8978e0e52a1@denx.de>
Date:   Thu, 23 Feb 2023 17:24:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 6/6] arm64: dts: imx8mp: Add analog audio output on
 i.MX8MP EVK
Content-Language: en-US
To:     Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc:     linux-clk@vger.kernel.org, Abel Vesa <abel.vesa@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Jacky Bai <ping.bai@nxp.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
References: <20220625013235.710346-1-marex@denx.de>
 <20220625013235.710346-6-marex@denx.de> <20230222182252.2ad6d82b@booty>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <20230222182252.2ad6d82b@booty>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 2/22/23 18:22, Luca Ceresoli wrote:
> Hello Marek,

Hi,

> On Sat, 25 Jun 2022 03:32:35 +0200
> Marek Vasut <marex@denx.de> wrote:
> 
>> Enable SAI3 on i.MX8MP EVK, add WM8960 codec binding and regulator.
>> This is all that is needed to get analog audio output operational
>> on i.MX8MP EVK.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> Cc: Abel Vesa <abel.vesa@nxp.com>
>> Cc: Fabio Estevam <festevam@gmail.com>
>> Cc: Jacky Bai <ping.bai@nxp.com>
>> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Cc: Lucas Stach <l.stach@pengutronix.de>
>> Cc: Michael Turquette <mturquette@baylibre.com>
>> Cc: Shawn Guo <shawnguo@kernel.org>
>> Cc: Stephen Boyd <sboyd@kernel.org>
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-clk@vger.kernel.org
>> Cc: linux-imx@nxp.com
> 
> I'm sending in reply to this e-mail the device tree patch I have used
> for my audio testing on the MSC SM2-MB-EP1 board. Feel free to add it to
> your series if you want, it obviously depends on it.

Lemme just mark this email locally and start with the MX8MP EVK . If the 
audio patches ever get upstream, then this one can be easily 
resubmitted. Does that work ?
