Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B72CC433E6
	for <linux-clk@archiver.kernel.org>; Thu, 21 Jan 2021 14:41:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1E50B239D4
	for <linux-clk@archiver.kernel.org>; Thu, 21 Jan 2021 14:41:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731831AbhAUOlV convert rfc822-to-8bit (ORCPT
        <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 21 Jan 2021 09:41:21 -0500
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:53485 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730017AbhAUOkm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 21 Jan 2021 09:40:42 -0500
X-Originating-IP: 86.201.233.230
Received: from xps13 (lfbn-tou-1-151-230.w86-201.abo.wanadoo.fr [86.201.233.230])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id CDBBA1BF20A;
        Thu, 21 Jan 2021 14:39:48 +0000 (UTC)
Date:   Thu, 21 Jan 2021 15:39:47 +0100
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Cc:     <linux-clk@vger.kernel.org>, devel@driverdev.osuosl.org,
        devicetree@vger.kernel.org, sboyd@kernel.org,
        gregkh@linuxfoundation.org, mturquette@baylibre.com, git@xilinx.com
Subject: Re: [PATCH v7 0/7] clk: clk-wizard: clock-wizard: Driver updates
Message-ID: <20210121153947.04da6fc1@xps13>
In-Reply-To: <1604502407-14352-1-git-send-email-shubhrajyoti.datta@xilinx.com>
References: <1604502407-14352-1-git-send-email-shubhrajyoti.datta@xilinx.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Shubhrajyoti,

Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com> wrote on Wed, 4 Nov
2020 20:36:40 +0530:

> In the thread [1] Greg suggested that we move the driver
> to the clk from the staging.
> Add patches to address the concerns regarding the fractional and
> set rate support in the TODO.
> 
> The patch set does the following
> - Trivial fixes for kernel doc.
> - Move the driver to the clk folder
> - Add capability to set rate.
> - Add fractional support.
> - Add support for configurable outputs.
> - Make the output names unique so that multiple instances
> do not crib.

Can someone tell me the status of this series? I think it would
benefit everyone to have this driver "officially" supported in the
main tree, unless there are crucial issues; in this case it might be
good to know which ones?

Thanks,
Miquèl
