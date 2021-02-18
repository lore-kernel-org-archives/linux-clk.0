Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB52DC433DB
	for <linux-clk@archiver.kernel.org>; Thu, 18 Feb 2021 08:28:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 63E5D64E6F
	for <linux-clk@archiver.kernel.org>; Thu, 18 Feb 2021 08:28:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230223AbhBRI2H convert rfc822-to-8bit (ORCPT
        <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 18 Feb 2021 03:28:07 -0500
Received: from relay10.mail.gandi.net ([217.70.178.230]:46515 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230468AbhBRIZh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 18 Feb 2021 03:25:37 -0500
Received: from xps13 (lfbn-tou-1-972-113.w86-210.abo.wanadoo.fr [86.210.203.113])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id C6800240008;
        Thu, 18 Feb 2021 08:24:41 +0000 (UTC)
Date:   Thu, 18 Feb 2021 09:24:40 +0100
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Cc:     <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <gregkh@linuxfoundation.org>, <shubhrajyoti.datta@gmail.com>
Subject: Re: [PATCH v9 0/7] clk: clk-wizard: clock-wizard: Driver updates
Message-ID: <20210218092440.7ddeb617@xps13>
In-Reply-To: <1613623791-4598-1-git-send-email-shubhrajyoti.datta@xilinx.com>
References: <1613623791-4598-1-git-send-email-shubhrajyoti.datta@xilinx.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Shubhrajyoti,

Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com> wrote on Thu, 18 Feb
2021 10:19:44 +0530:

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

I think we prefer to move "clean" drivers out of the staging tree
rather than "to be fixed" code. So I would invert the order of the
patches in this series to make more sense:
* 3/7-7/7 (various fixes/improvements)
* 1/7 (bindings)
* 2/7 (move to clk)

> Shubhrajyoti Datta (7):
>   dt-bindings: add documentation of xilinx clocking wizard
>   clk: clock-wizard: Add the clockwizard to clk directory
>   clk: clock-wizard: Fix kernel-doc warning
>   clk: clock-wizard: Add support for dynamic reconfiguration
>   clk: clock-wizard: Add support for fractional support
>   clk: clock-wizard: Remove the hardcoding of the clock outputs
>   clk: clock-wizard: Update the fixed factor divisors
> 
>  .../bindings/clock/xlnx,clocking-wizard.yaml       |  65 ++
>  drivers/clk/Kconfig                                |   9 +
>  drivers/clk/Makefile                               |   1 +
>  drivers/clk/clk-xlnx-clock-wizard.c                | 689 +++++++++++++++++++++
>  drivers/staging/Kconfig                            |   2 -
>  drivers/staging/Makefile                           |   1 -
>  drivers/staging/clocking-wizard/Kconfig            |  10 -
>  drivers/staging/clocking-wizard/Makefile           |   2 -
>  drivers/staging/clocking-wizard/TODO               |  12 -
>  .../clocking-wizard/clk-xlnx-clock-wizard.c        | 333 ----------
>  drivers/staging/clocking-wizard/dt-binding.txt     |  30 -
>  11 files changed, 764 insertions(+), 390 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
>  create mode 100644 drivers/clk/clk-xlnx-clock-wizard.c
>  delete mode 100644 drivers/staging/clocking-wizard/Kconfig
>  delete mode 100644 drivers/staging/clocking-wizard/Makefile
>  delete mode 100644 drivers/staging/clocking-wizard/TODO
>  delete mode 100644 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c
>  delete mode 100644 drivers/staging/clocking-wizard/dt-binding.txt
> 

Thanks,
Miquèl
