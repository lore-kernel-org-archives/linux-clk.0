Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AFDAC4321E
	for <linux-clk@archiver.kernel.org>; Sat, 26 Nov 2022 15:23:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229496AbiKZPXg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 26 Nov 2022 10:23:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbiKZPXg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 26 Nov 2022 10:23:36 -0500
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C25C15FCD
        for <linux-clk@vger.kernel.org>; Sat, 26 Nov 2022 07:23:32 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id C19918447C;
        Sat, 26 Nov 2022 16:23:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1669476210;
        bh=ORhUdPiMSPxcTdmDB6lmYEYs/frODvFOQ5OncYhGRfE=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=OW6KM0wyj67l9zFZWZjLD6xNiI+01jjRBrUequkqLO5BADcgrIfRLYNFbVhQFaLXN
         yzibUUBHHgKb0my18MoY8rYkAeU/5Zup8u5sH0OVpsoJ1jQHVvtM6qn/TPpHoLZgAz
         lArJyRrxBmJSagFIqf43Cza32e8c9RPfBfXx3e09kD3G385K5uYkdOLQcEqgjx2vjm
         xfzoz0nok4cw1iH3Dngo8XKhSkm9mje2E4VVp+fooTMPjuCR61XwWizKg/7JqhckAG
         tFAxrD8azHAybcR3qhOXp14UzPP6QGkqrDF7MNg/f87iZ4kPJZnnaB75GnAqqI0ZkU
         INRJ2WDJZUdHQ==
Message-ID: <2cc590a3-4b03-03b8-c537-3a0d8e9840b6@denx.de>
Date:   Sat, 26 Nov 2022 16:23:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 1/6] clk: Introduce
 devm_clk_hw_register_mux_parent_data()
Content-Language: en-US
To:     Richard Leitner <richard.leitner@linux.dev>
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
 <Y3s0GzxgSG9Tu450@skidata.com>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <Y3s0GzxgSG9Tu450@skidata.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 11/21/22 09:17, Richard Leitner wrote:
> Hi,

Hi,

> On Sat, Jun 25, 2022 at 03:32:30AM +0200, Marek Vasut wrote:
>> Add an API for clock mux that uses parent_data for the parent instead of
>> a string parent_name.
> 
> Just stubled across this thread while trying to bring up audio on a
> i.MX8MP. The last reply in this series is from October and patch #1 & #6
> doesn't apply on v6.1-rc6...
> Therefore I'm curious if there is any newer version of this series I
> missed? Or is there something I can help with? Especially testing?

Currently blocked by race conditions between clock and genpd locking, 
those need to be fixed first. See discussion in:

[PATCH 1/3] [RFC] PM: domains: Introduce .power_pre/post_on/off callbacks
