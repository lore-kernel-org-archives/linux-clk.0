Return-Path: <SRS0=3egD=OV=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AF4CC67839
	for <linux-clk@archiver.kernel.org>; Wed, 12 Dec 2018 08:42:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C11932086D
	for <linux-clk@archiver.kernel.org>; Wed, 12 Dec 2018 08:42:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZkndDXk8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C11932086D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726519AbeLLIml (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 12 Dec 2018 03:42:41 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:58422 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726020AbeLLImk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 12 Dec 2018 03:42:40 -0500
Received: from avalon.localnet (dfj612ybrt5fhg77mgycy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:2e86:4862:ef6a:2804])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C929E55A;
        Wed, 12 Dec 2018 09:42:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1544604158;
        bh=hZXZhHD/dwZIxm0bdVT0D+P3k5+3rM79VVC34XPLAO0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZkndDXk8TnMxisV7vTW7yAoeGFh8JBeoCDfIIw3aSrh4TPI39b9MxoxJv5NkkY/Zg
         t5kL0S9KgPoyVAdypMwIeE5+hJ2Aw1K6dxqOYuHn9o1nhYWfN0+OoKV2apOgc58WlN
         RDgTNNQEAY1XpAgv4Q6XpSwEKWkO5lw5v3X69SqE=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Marek Vasut <marek.vasut@gmail.com>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Alexey Firago <alexey_firago@mentor.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH V2] clk: vc5: Add suspend/resume support
Date:   Wed, 12 Dec 2018 10:43:22 +0200
Message-ID: <1632836.JPXSTA8kTp@avalon>
Organization: Ideas on Board Oy
In-Reply-To: <20181212014130.18634-1-marek.vasut+renesas@gmail.com>
References: <20181212014130.18634-1-marek.vasut+renesas@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Marex,

Thank you for the patch.

On Wednesday, 12 December 2018 03:41:30 EET Marek Vasut wrote:
> Add simple suspend/resume handlers to the driver to restore the chip
> configuration after resume. It is possible that the chip was configured
> with non-default values before suspend-resume cycle and that the chip
> is powered down during this cycle, so the configuration could get lost.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Alexey Firago <alexey_firago@mentor.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> V2: Replace ifdef with __maybe_unused
>     Simplify return value handling in resume
> ---
>  drivers/clk/clk-versaclock5.c | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock5.c
> index decffb3826ec..b66586a3abb7 100644
> --- a/drivers/clk/clk-versaclock5.c
> +++ b/drivers/clk/clk-versaclock5.c
> @@ -906,6 +906,34 @@ static int vc5_remove(struct i2c_client *client)
>  	return 0;
>  }
> 
> +static int __maybe_unused vc5_suspend(struct device *dev)
> +{
> +	struct vc5_driver_data *vc5 = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = regcache_sync(vc5->regmap);

Didn't you say the sync here was unneeded and would be dropped ?

> +	if (ret != 0) {
> +		dev_err(dev, "Failed to save register map: %d\n", ret);
> +		return ret;
> +	}
> +	regcache_cache_only(vc5->regmap, true);
> +	regcache_mark_dirty(vc5->regmap);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused vc5_resume(struct device *dev)
> +{
> +	struct vc5_driver_data *vc5 = dev_get_drvdata(dev);
> +	int ret;
> +
> +	regcache_cache_only(vc5->regmap, false);
> +	ret = regcache_sync(vc5->regmap);
> +	if (ret)
> +		dev_err(dev, "Failed to restore register map: %d\n", ret);
> +	return ret;
> +}
> +
>  static const struct vc5_chip_info idt_5p49v5923_info = {
>  	.model = IDT_VC5_5P49V5923,
>  	.clk_fod_cnt = 2,
> @@ -961,9 +989,12 @@ static const struct of_device_id clk_vc5_of_match[] = {
> };
>  MODULE_DEVICE_TABLE(of, clk_vc5_of_match);
> 
> +static SIMPLE_DEV_PM_OPS(vc5_pm_ops, vc5_suspend, vc5_resume);
> +
>  static struct i2c_driver vc5_driver = {
>  	.driver = {
>  		.name = "vc5",
> +		.pm	= &vc5_pm_ops,
>  		.of_match_table = clk_vc5_of_match,
>  	},
>  	.probe		= vc5_probe,

-- 
Regards,

Laurent Pinchart



