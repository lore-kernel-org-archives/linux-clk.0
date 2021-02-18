Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF13AC433DB
	for <linux-clk@archiver.kernel.org>; Thu, 18 Feb 2021 09:23:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5FD3064D73
	for <linux-clk@archiver.kernel.org>; Thu, 18 Feb 2021 09:23:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231241AbhBRJWq convert rfc822-to-8bit (ORCPT
        <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 18 Feb 2021 04:22:46 -0500
Received: from mslow2.mail.gandi.net ([217.70.178.242]:46511 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231509AbhBRJGT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 18 Feb 2021 04:06:19 -0500
Received: from relay6-d.mail.gandi.net (unknown [217.70.183.198])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id DE23C3A63E2
        for <linux-clk@vger.kernel.org>; Thu, 18 Feb 2021 08:32:59 +0000 (UTC)
X-Originating-IP: 86.210.203.113
Received: from xps13 (lfbn-tou-1-972-113.w86-210.abo.wanadoo.fr [86.210.203.113])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 3C26BC0007;
        Thu, 18 Feb 2021 08:29:36 +0000 (UTC)
Date:   Thu, 18 Feb 2021 09:29:36 +0100
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Cc:     <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <gregkh@linuxfoundation.org>, <shubhrajyoti.datta@gmail.com>
Subject: Re: [PATCH v9 3/7] clk: clock-wizard: Fix kernel-doc warning
Message-ID: <20210218092936.44108d1d@xps13>
In-Reply-To: <1613623791-4598-4-git-send-email-shubhrajyoti.datta@xilinx.com>
References: <1613623791-4598-1-git-send-email-shubhrajyoti.datta@xilinx.com>
        <1613623791-4598-4-git-send-email-shubhrajyoti.datta@xilinx.com>
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
2021 10:19:47 +0530:

> Update description for the clocking wizard structure

"Fix the clocking wizard main structure kernel documentation." ?

> 
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> ---
>  drivers/clk/clk-xlnx-clock-wizard.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/clk-xlnx-clock-wizard.c b/drivers/clk/clk-xlnx-clock-wizard.c
> index 1bab68e..fb2d555 100644
> --- a/drivers/clk/clk-xlnx-clock-wizard.c
> +++ b/drivers/clk/clk-xlnx-clock-wizard.c
> @@ -40,7 +40,8 @@ enum clk_wzrd_int_clks {
>  };
>  
>  /**
> - * struct clk_wzrd:
> + * struct clk_wzrd - Clock wizard private data structure
> + *
>   * @clk_data:		Clock data
>   * @nb:			Notifier block
>   * @base:		Memory base


Thanks,
Miquèl
