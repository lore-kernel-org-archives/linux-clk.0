Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7E47C433E1
	for <linux-clk@archiver.kernel.org>; Tue, 23 Mar 2021 16:27:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 83F51619C0
	for <linux-clk@archiver.kernel.org>; Tue, 23 Mar 2021 16:27:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233030AbhCWQ0w (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 23 Mar 2021 12:26:52 -0400
Received: from m12-11.163.com ([220.181.12.11]:57175 "EHLO m12-11.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233190AbhCWQ0h (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 23 Mar 2021 12:26:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=Date:From:Subject:Message-ID:MIME-Version; bh=c7Fxc
        VW9ibHft5SXt5N8fc+PA9Gg2OiT0hzZUEtbw4c=; b=cuwr5Ttfw27SEIEbXBYJk
        4SwsmDSPEuhHB6btWrmGqIhdIZQ9mQNDp3WU9OJrqoRU8PydiETsN42i0mDAjcQu
        oK5eK62z8PfpItt4awv7839EZEhIugGFJscgdMxj4uTsDFcp0FG8mRKxrMpGhr2B
        2cJydwjDIW/zkTTLt8wCqQ=
Received: from localhost (unknown [218.94.48.178])
        by smtp7 (Coremail) with SMTP id C8CowADH529tFlpgoCnvTg--.52941S2;
        Wed, 24 Mar 2021 00:25:17 +0800 (CST)
Date:   Wed, 24 Mar 2021 00:25:28 +0800
From:   Jian Dong <dj0227@163.com>
To:     David Lechner <david@lechnology.com>
Cc:     nsekhar@ti.com, mturquette@baylibre.com, sboyd@kernel.org,
        linux-clk@vger.kernel.org, huyue2@yulong.com,
        Jian Dong <dongjian@yulong.com>
Subject: Re: [PATCH] clk: davinci: fix regmap use PTR_ERR after initial
Message-ID: <20210324002528.000057e7@163.com>
In-Reply-To: <adc19516-3cfa-7c2c-32fe-900ded46a994@lechnology.com>
References: <1616484126-131947-1-git-send-email-dj0227@163.com>
        <adc19516-3cfa-7c2c-32fe-900ded46a994@lechnology.com>
Organization: yulong
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: C8CowADH529tFlpgoCnvTg--.52941S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxZr1xWr4DKr17Cr1xWFy8Krg_yoW5XF1kpF
        WUJFZYyw4UGr47Kr1Iqw4rAFySgw1fGayaya48C3W09r98CFyDXr15Kryjkan5XrW5A3W5
        tFW8uayUZa1DXr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UdrchUUUUU=
X-Originating-IP: [218.94.48.178]
X-CM-SenderInfo: dgmqjjqx6rljoofrz/1tbiTA1e3VSIm-zWsAAAsf
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 23 Mar 2021 11:03:38 -0500
David Lechner <david@lechnology.com> wrote:

> On 3/23/21 2:22 AM, Jian Dong wrote:
> > From: Jian Dong <dongjian@yulong.com>
> > 
> > fixes coccicheck ERROR:
> > 
> > drivers/clk/davinci/da8xx-cfgchip.c:768:18-25: ERROR:
> > PTR_ERR applied after initialization to constant on line 746
> > 
> > Signed-off-by: Jian Dong <dongjian@yulong.com>
> > ---
> >   drivers/clk/davinci/da8xx-cfgchip.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/clk/davinci/da8xx-cfgchip.c
> > b/drivers/clk/davinci/da8xx-cfgchip.c index 77d1827..f57ba1b 100644
> > --- a/drivers/clk/davinci/da8xx-cfgchip.c
> > +++ b/drivers/clk/davinci/da8xx-cfgchip.c
> > @@ -743,7 +743,7 @@ static int da8xx_cfgchip_probe(struct
> > platform_device *pdev) struct da8xx_cfgchip_clk_platform_data
> > *pdata = dev->platform_data; const struct of_device_id *of_id;
> >   	da8xx_cfgchip_init clk_init = NULL;
> > -	struct regmap *regmap = NULL;
> > +	struct regmap *regmap;
> >   
> >   	of_id = of_match_device(da8xx_cfgchip_of_match, dev);
> >   	if (of_id) {
> >   
> 
> I think it is better to leave this as-is. Otherwise some compilers
> may create an error/warning about using an uninitialized value
> even if it technically is not possible.
> 
> In fact, the coccicheck error seems wrong. regmap will have always
> been assigned a value by the time IS_ERR_OR_NULL(regmap) is called.
> 
> Here is the full function for context:
> 
> static int da8xx_cfgchip_probe(struct platform_device *pdev)
> {
> 	struct device *dev = &pdev->dev;
> 	struct da8xx_cfgchip_clk_platform_data *pdata =
> dev->platform_data; const struct of_device_id *of_id;
> 	da8xx_cfgchip_init clk_init = NULL;
> 	struct regmap *regmap = NULL;
> 
> 	of_id = of_match_device(da8xx_cfgchip_of_match, dev);
> 	if (of_id) {
> 		struct device_node *parent;
> 
> 		clk_init = of_id->data;
> 		parent = of_get_parent(dev->of_node);
> 		regmap = syscon_node_to_regmap(parent);
> 		of_node_put(parent);
> 	} else if (pdev->id_entry && pdata) {
> 		clk_init = (void *)pdev->id_entry->driver_data;
> 		regmap = pdata->cfgchip;
> 	}
> 
> 	if (!clk_init) {
> 		dev_err(dev, "unable to find driver data\n");
> 		return -EINVAL;
> 	}
> 
> 	if (IS_ERR_OR_NULL(regmap)) {
> 		dev_err(dev, "no regmap for CFGCHIP syscon\n");
> 		return regmap ? PTR_ERR(regmap) : -ENOENT;
> 	}
> 
> 	return clk_init(dev, regmap);
> }

Hi, thanks for reply.

I see other use of PTR_ERR in this file such as
of_da8xx_usb_phy_clk_init() and of_da8xx_cfgchip_init_mux_clock(), all
PTR_ERR(value) with uninitialized, So I think maybe it is a way to fix
the coccicheck error.

In fact I'm not sure about this, initialized should be a good habit.

