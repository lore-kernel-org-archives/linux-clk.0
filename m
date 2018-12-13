Return-Path: <SRS0=bPXJ=OW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15B1BC67872
	for <linux-clk@archiver.kernel.org>; Thu, 13 Dec 2018 20:38:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C81F420870
	for <linux-clk@archiver.kernel.org>; Thu, 13 Dec 2018 20:38:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="sX7aJ5Yc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C81F420870
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726697AbeLMUi4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Dec 2018 15:38:56 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:41444 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726401AbeLMUiz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 13 Dec 2018 15:38:55 -0500
Received: from avalon.localnet (dfj612ybrt5fhg77mgycy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:2e86:4862:ef6a:2804])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 094FD549;
        Thu, 13 Dec 2018 21:38:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1544733533;
        bh=J1hXCAHdtIfJqU4GaZ1ZmJyhE71YtKjRJ3JtN3MjlWY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=sX7aJ5YctB33nMQ55Cjh9X6B9XHssPpeGvlPCfJ2Lx9yZ1WAyX93UgYpW/EXcY4oh
         sJn+EDH6ITIjYzwK1VgYpZazN/kSObUrBiqAPJAyAw8BFRalah/jF6r4TtvElCXkSl
         yZmXzqvFa5PbTHqe/U0Db+CRBYOD8+kImBrHhyUI=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Marek Vasut <marek.vasut@gmail.com>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Alexey Firago <alexey_firago@mentor.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH V3] clk: vc5: Add suspend/resume support
Date:   Thu, 13 Dec 2018 22:39:40 +0200
Message-ID: <2567101.UjicnDk6qB@avalon>
Organization: Ideas on Board Oy
In-Reply-To: <20181213161528.20318-1-marek.vasut+renesas@gmail.com>
References: <20181213161528.20318-1-marek.vasut+renesas@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Marek,

Thank you for the patch.

On Thursday, 13 December 2018 18:15:28 EET Marek Vasut wrote:
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

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Tested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> V2: Replace ifdef with __maybe_unused
>     Simplify return value handling in resume
> V3: Drop useless regcache_sync() call from suspend callback
>     (thanks Laurent for testing with working DU)
> ---
>  drivers/clk/clk-versaclock5.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock5.c
> index decffb3826ec..5b393e711e94 100644
> --- a/drivers/clk/clk-versaclock5.c
> +++ b/drivers/clk/clk-versaclock5.c
> @@ -906,6 +906,28 @@ static int vc5_remove(struct i2c_client *client)
>  	return 0;
>  }
> 
> +static int __maybe_unused vc5_suspend(struct device *dev)
> +{
> +	struct vc5_driver_data *vc5 = dev_get_drvdata(dev);
> +
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
> @@ -961,9 +983,12 @@ static const struct of_device_id clk_vc5_of_match[] = {
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



