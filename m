Return-Path: <SRS0=khTx=SO=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 632A6C10F0E
	for <linux-clk@archiver.kernel.org>; Fri, 12 Apr 2019 09:36:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 372B5205F4
	for <linux-clk@archiver.kernel.org>; Fri, 12 Apr 2019 09:36:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726753AbfDLJgx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 12 Apr 2019 05:36:53 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:39897 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726709AbfDLJgx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 12 Apr 2019 05:36:53 -0400
Received: from litschi.hi.pengutronix.de ([2001:67c:670:100:feaa:14ff:fe6a:8db5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <m.tretter@pengutronix.de>)
        id 1hEsc6-0004Pw-CV; Fri, 12 Apr 2019 11:36:50 +0200
Date:   Fri, 12 Apr 2019 11:36:46 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        kernel@pengutronix.de, Michael Turquette <mturquette@baylibre.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Jolly Shah <jolly.shah@xilinx.com>
Subject: Re: [PATCH v2 0/4] clk: zynqmp: fix CLK_FRAC and various cleanups
Message-ID: <20190412113646.56187dc8@litschi.hi.pengutronix.de>
In-Reply-To: <155500805844.20095.8423821269571777766@swboyd.mtv.corp.google.com>
References: <20190319100147.4178-1-m.tretter@pengutronix.de>
        <20190404101621.7b88337c@litschi.hi.pengutronix.de>
        <155500805844.20095.8423821269571777766@swboyd.mtv.corp.google.com>
Organization: Pengutronix
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:feaa:14ff:fe6a:8db5
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 11 Apr 2019 11:40:58 -0700, Stephen Boyd wrote:
> Quoting Michael Tretter (2019-04-04 01:16:21)
> > On Tue, 19 Mar 2019 11:01:43 +0100, Michael Tretter wrote:  
> > > This is v2 of the patchset to cleanup the ZynqMP clock driver.  
> > 
> > Gentle ping.
> >   
> 
> I could apply the first three, but the last one didn't work because
> Jolly Shah sent some changes that wrecked it. Can you resend the last
> patch reworked on top of it? You can use clk-zynq in clk.git if you need
> something to base it upon.

Thanks. The changes in clk-zynq look really fragile to me, because the
fields from the firmware response are reused to build the clock id. I
will send a v3 of the patch anyway to properly get the fields of the
firmware responses.

Michael

> 
>  https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-zynq
> 
