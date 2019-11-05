Return-Path: <SRS0=Glxp=Y5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89AD7C010A2
	for <linux-clk@archiver.kernel.org>; Tue,  5 Nov 2019 10:28:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 64EE921D6C
	for <linux-clk@archiver.kernel.org>; Tue,  5 Nov 2019 10:28:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388366AbfKEK2o (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 5 Nov 2019 05:28:44 -0500
Received: from ns.iliad.fr ([212.27.33.1]:41888 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388022AbfKEK2n (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 5 Nov 2019 05:28:43 -0500
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id 7914B20050;
        Tue,  5 Nov 2019 11:28:42 +0100 (CET)
Received: from [192.168.108.51] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id 677841FF3E;
        Tue,  5 Nov 2019 11:28:42 +0100 (CET)
Subject: Re: [PATCH] clk: imx: pll14xx: initialize flags to 0
To:     Peng Fan <peng.fan@nxp.com>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Shawn Guo <shawnguo@kernel.org>
References: <1572938372-7006-1-git-send-email-peng.fan@nxp.com>
 <5fc2dfd6-ae59-6af8-0423-ddc8e0b4f78f@free.fr>
 <AM0PR04MB4481010CA9D3672F55208092887E0@AM0PR04MB4481.eurprd04.prod.outlook.com>
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Message-ID: <b6eb44dd-253a-9c85-92dd-dcf1f545e4ec@free.fr>
Date:   Tue, 5 Nov 2019 11:28:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <AM0PR04MB4481010CA9D3672F55208092887E0@AM0PR04MB4481.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Tue Nov  5 11:28:42 2019 +0100 (CET)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 05/11/2019 11:04, Peng Fan wrote:

> The patch was initially try to address what [1] did.
> In [1], static was discarded and moved to a common place.
> So I thought flags should be initialized as 0.

A small additional (pedantic) note :-)

Actually, in your case, imx_1443x_pll has "static storage duration".

The "static" keyword ("storage-class specifier") merely limits the
symbol's visibility outside a compilation unit.

Basically, static => "static storage duration"
But the reverse is not true, see 6.2.4p3

https://port70.net/~nsz/c/c11/n1570.html#6.2.4
6.2.4 Storage durations of objects

Regards.
