Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30210C433FE
	for <linux-clk@archiver.kernel.org>; Mon, 24 Oct 2022 02:45:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229536AbiJXCph (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 23 Oct 2022 22:45:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229631AbiJXCpg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 23 Oct 2022 22:45:36 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 425CD5AA22
        for <linux-clk@vger.kernel.org>; Sun, 23 Oct 2022 19:45:30 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id C4E8F83B23;
        Mon, 24 Oct 2022 04:45:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1666579528;
        bh=2/alnoxi5hRLlbvHg89cRZiYdGvqH+siEonDfiaT6KM=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=Q1efFUD9h75zwC0L4Vex4ZmMbmBLhXBuIJ1tdUkjTlHJfBBZ0m5oX8GhnUsFbLenV
         26fjFztWfSNb/ozTpiMoJPkaUL2L37eQ34uqluxJ6F2Ke4RTLI9wgXPJI13HxOIMV9
         IwsSdWnd0WKktidPyaAWqYoVUFcw4KFAygJWLVGd/K/u7hv2hqaM0vOicLkm2KqIoT
         u8GsY2vKMEnIe3jR2TdP4EVYtbURO4sabo1ZiuzOQ5r7WnqYpN82fFMwxKE66jPThF
         7MEfPKlXEcO3LB6SF4OBQsIGCneYmJxprugfmtd7hz/Ha9c0DPxW+TsRRlagStVQ7a
         sIemwj+b73b9A==
Message-ID: <6b0b08ca-767d-64ec-f3c2-4062a5dbf9db@denx.de>
Date:   Mon, 24 Oct 2022 04:45:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH] [RFC] soc: imx: gpcv2: Split clock prepare from clock
 enable in the domain
To:     Peng Fan <peng.fan@nxp.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Cc:     Fabio Estevam <festevam@denx.de>, Jacky Bai <ping.bai@nxp.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        "S.J. Wang" <shengjiu.wang@nxp.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
References: <20221023164000.555654-1-marex@denx.de>
 <DU0PR04MB9417315263B3A912BC37AECF882E9@DU0PR04MB9417.eurprd04.prod.outlook.com>
Content-Language: en-US
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <DU0PR04MB9417315263B3A912BC37AECF882E9@DU0PR04MB9417.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 10/24/22 02:39, Peng Fan wrote:
> Hi Marek,

Hi,

>> Subject: [PATCH] [RFC] soc: imx: gpcv2: Split clock prepare from clock enable
>> in the domain
>>
>> It is possible for clk_disable_unused() to trigger lockdep warning regarding
>> lock ordering in this driver. This happens in case of the following conditions:
>>
>> A) clock core clk_disable_unused() triggers the following sequence in a
>>     driver which also uses GPCv2 domain:
>>     - clk_prepare_lock() -> obtains clock core prepare_lock
>>     - pm_runtime_get*() -> obtains &blk_ctrl_genpd_lock_class
>>
>> B) driver powers up a power domain and triggers the following sequence
>>     in GPCv2:
>>     - pm_runtime_get_sync() -> obtains &blk_ctrl_genpd_lock_class
>>     - clk_bulk_prepare_enable() -> obtains clock core prepare_lock
>>
>> This can lead to a deadlock in case A and B runs on separate CPUs.
>>
>> To avoid the deadlock, split clk_*prepare() from clk_*enable() and call the
>> former before pm_runtime_get_sync(). This way, the GPCv2 driver always
>> claims the prepare_lock before blk_ctrl_genpd_lock_class and the deadlock
>> is avoided.
> 
> Is this trying to address the i.MX8MP audiomix blk ctrl deadlock issue?

See the email from Laurent from 1 hour earlier, there the splat happens 
with DRM subsystem (the whole split is included). Audiomix would likely 
trigger it too.
