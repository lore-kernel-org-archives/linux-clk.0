Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 055A0C433E9
	for <linux-clk@archiver.kernel.org>; Wed, 27 Jan 2021 16:11:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C3D6C2078E
	for <linux-clk@archiver.kernel.org>; Wed, 27 Jan 2021 16:11:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343919AbhA0QKd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 27 Jan 2021 11:10:33 -0500
Received: from mail-out.m-online.net ([212.18.0.9]:34943 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235088AbhA0O5e (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 27 Jan 2021 09:57:34 -0500
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4DQmrl6vygz1qsbf;
        Wed, 27 Jan 2021 15:56:23 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 4DQmrl5Tkdz1qqkK;
        Wed, 27 Jan 2021 15:56:23 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id GoUxi4AzCMDu; Wed, 27 Jan 2021 15:56:21 +0100 (CET)
X-Auth-Info: x9PNEPCTGIzNcsmqtNZVhDqFufrziTk4JEJvMbFzXYs=
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Wed, 27 Jan 2021 15:56:21 +0100 (CET)
Subject: Re: [RFC 3/3] clk: imx: Add blk-ctl driver for i.MX8MN
To:     Adam Ford <aford173@gmail.com>, linux-clk@vger.kernel.org
Cc:     abel.vesa@nxp.com, Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org
References: <20201024162016.1003041-1-aford173@gmail.com>
 <20201024162016.1003041-4-aford173@gmail.com>
From:   Marek Vasut <marex@denx.de>
Message-ID: <ee6c49a9-4758-597a-487c-132cc047f038@denx.de>
Date:   Wed, 27 Jan 2021 15:56:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20201024162016.1003041-4-aford173@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 10/24/20 6:20 PM, Adam Ford wrote:
> This driver is intended to work with the multimedia block which
> contains display and camera subsystems:
>    LCDIF
>    ISI
>    MIPI CSI
>    MIPI DSI
> 
> Signed-off-by: Adam Ford <aford173@gmail.com>
> ---
>   drivers/clk/imx/clk-blk-ctl-imx8mn.c | 80 ++++++++++++++++++++++++++++

You seem to be missing the Makefile entries.
