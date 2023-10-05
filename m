Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8AC5E92706
	for <linux-clk@archiver.kernel.org>; Thu,  5 Oct 2023 14:38:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235569AbjJEOih (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 5 Oct 2023 10:38:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235943AbjJEOgQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 5 Oct 2023 10:36:16 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D17D434433
        for <linux-clk@vger.kernel.org>; Thu,  5 Oct 2023 06:58:51 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3AEFE152B;
        Thu,  5 Oct 2023 03:20:39 -0700 (PDT)
Received: from pluto (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CF0813F5A1;
        Thu,  5 Oct 2023 03:19:59 -0700 (PDT)
Date:   Thu, 5 Oct 2023 11:19:57 +0100
From:   Cristian Marussi <cristian.marussi@arm.com>
To:     Sudeep Holla <sudeep.holla@arm.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: scmi: Free scmi_clk allocated when the clocks with
 invalid info are skipped
Message-ID: <ZR6NzUUP2gg3nNiC@pluto>
References: <20231004193600.66232-1-sudeep.holla@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231004193600.66232-1-sudeep.holla@arm.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Oct 04, 2023 at 08:36:00PM +0100, Sudeep Holla wrote:
> Add the missing devm_kfree() when we skip the clocks with invalid or
> missing information from the firmware.
> 

Hi,

LGTM.

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Cristian

> Cc: Cristian Marussi <cristian.marussi@arm.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Fixes: 6d6a1d82eaef ("clk: add support for clocks provided by SCMI")
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>  drivers/clk/clk-scmi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/clk-scmi.c b/drivers/clk/clk-scmi.c
> index 2e1337b511eb..3f525bed9794 100644
> --- a/drivers/clk/clk-scmi.c
> +++ b/drivers/clk/clk-scmi.c
> @@ -232,6 +232,7 @@ static int scmi_clocks_probe(struct scmi_device *sdev)
>  		sclk->info = scmi_proto_clk_ops->info_get(ph, idx);
>  		if (!sclk->info) {
>  			dev_dbg(dev, "invalid clock info for idx %d\n", idx);
> +			devm_kfree(dev, sclk);
>  			continue;
>  		}
>  
> -- 
> 2.42.0
> 
