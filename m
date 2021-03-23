Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69EF3C433C1
	for <linux-clk@archiver.kernel.org>; Tue, 23 Mar 2021 16:27:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2ABE36198C
	for <linux-clk@archiver.kernel.org>; Tue, 23 Mar 2021 16:27:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233236AbhCWQ0w (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 23 Mar 2021 12:26:52 -0400
Received: from vern.gendns.com ([98.142.107.122]:46288 "EHLO vern.gendns.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233111AbhCWQ0w (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 23 Mar 2021 12:26:52 -0400
X-Greylist: delayed 1390 seconds by postgrey-1.27 at vger.kernel.org; Tue, 23 Mar 2021 12:26:52 EDT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=IXxDqDTGOear+eoTNi2ODN81+h7N7MT8HG/mh7nXvIQ=; b=TQ2lsTEmXc9X59oAnOL1FFAiXp
        BOXF/HOt3bDU/c8FqAs3/tCX6rx8tk5Q4MDsBXfpimBav1c9N09AVYpXi2vGAK1obl0leo6gvE7Pn
        U1GXveNNl3s3etWvuLtpuEBcCu6oaa+/0yCaPCAueEcH1qBJc3Qq5nQYo4tjUmxml97sSNDHyMpud
        JA8nkvW8B5Xonwilxo83M8tyVAwIup3sXgz81eeMfQtnt4/lFADkgDu3PjC01cxh6VdjESP89t53s
        Tb2Ae8mbwVS5G8nBz0NmvJV5C87IIWMRfLunpK2ocFdJSLCXj2EBL9QrxAGsMLzZasdz8V33A7Ume
        utqAFFPg==;
Received: from 108-198-5-147.lightspeed.okcbok.sbcglobal.net ([108.198.5.147]:56780 helo=[192.168.0.134])
        by vern.gendns.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <david@lechnology.com>)
        id 1lOjVL-0003rc-9F; Tue, 23 Mar 2021 12:03:39 -0400
Subject: Re: [PATCH] clk: davinci: fix regmap use PTR_ERR after initial
To:     Jian Dong <dj0227@163.com>, nsekhar@ti.com,
        mturquette@baylibre.com, sboyd@kernel.org
Cc:     linux-clk@vger.kernel.org, huyue2@yulong.com,
        Jian Dong <dongjian@yulong.com>
References: <1616484126-131947-1-git-send-email-dj0227@163.com>
From:   David Lechner <david@lechnology.com>
Message-ID: <adc19516-3cfa-7c2c-32fe-900ded46a994@lechnology.com>
Date:   Tue, 23 Mar 2021 11:03:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1616484126-131947-1-git-send-email-dj0227@163.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - vern.gendns.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lechnology.com
X-Get-Message-Sender-Via: vern.gendns.com: authenticated_id: davidmain+lechnology.com/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: vern.gendns.com: davidmain@lechnology.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 3/23/21 2:22 AM, Jian Dong wrote:
> From: Jian Dong <dongjian@yulong.com>
> 
> fixes coccicheck ERROR:
> 
> drivers/clk/davinci/da8xx-cfgchip.c:768:18-25: ERROR:
> PTR_ERR applied after initialization to constant on line 746
> 
> Signed-off-by: Jian Dong <dongjian@yulong.com>
> ---
>   drivers/clk/davinci/da8xx-cfgchip.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/davinci/da8xx-cfgchip.c b/drivers/clk/davinci/da8xx-cfgchip.c
> index 77d1827..f57ba1b 100644
> --- a/drivers/clk/davinci/da8xx-cfgchip.c
> +++ b/drivers/clk/davinci/da8xx-cfgchip.c
> @@ -743,7 +743,7 @@ static int da8xx_cfgchip_probe(struct platform_device *pdev)
>   	struct da8xx_cfgchip_clk_platform_data *pdata = dev->platform_data;
>   	const struct of_device_id *of_id;
>   	da8xx_cfgchip_init clk_init = NULL;
> -	struct regmap *regmap = NULL;
> +	struct regmap *regmap;
>   
>   	of_id = of_match_device(da8xx_cfgchip_of_match, dev);
>   	if (of_id) {
> 

I think it is better to leave this as-is. Otherwise some compilers
may create an error/warning about using an uninitialized value
even if it technically is not possible.

In fact, the coccicheck error seems wrong. regmap will have always
been assigned a value by the time IS_ERR_OR_NULL(regmap) is called.

Here is the full function for context:

static int da8xx_cfgchip_probe(struct platform_device *pdev)
{
	struct device *dev = &pdev->dev;
	struct da8xx_cfgchip_clk_platform_data *pdata = dev->platform_data;
	const struct of_device_id *of_id;
	da8xx_cfgchip_init clk_init = NULL;
	struct regmap *regmap = NULL;

	of_id = of_match_device(da8xx_cfgchip_of_match, dev);
	if (of_id) {
		struct device_node *parent;

		clk_init = of_id->data;
		parent = of_get_parent(dev->of_node);
		regmap = syscon_node_to_regmap(parent);
		of_node_put(parent);
	} else if (pdev->id_entry && pdata) {
		clk_init = (void *)pdev->id_entry->driver_data;
		regmap = pdata->cfgchip;
	}

	if (!clk_init) {
		dev_err(dev, "unable to find driver data\n");
		return -EINVAL;
	}

	if (IS_ERR_OR_NULL(regmap)) {
		dev_err(dev, "no regmap for CFGCHIP syscon\n");
		return regmap ? PTR_ERR(regmap) : -ENOENT;
	}

	return clk_init(dev, regmap);
}
