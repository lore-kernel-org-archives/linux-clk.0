Return-Path: <SRS0=VWtO=PX=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75DC7C43387
	for <linux-clk@archiver.kernel.org>; Tue, 15 Jan 2019 08:37:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4223F2063F
	for <linux-clk@archiver.kernel.org>; Tue, 15 Jan 2019 08:37:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="NyWRaHIT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727703AbfAOIhF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 15 Jan 2019 03:37:05 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:34290 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725869AbfAOIhE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 15 Jan 2019 03:37:04 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x0F8axNn039775;
        Tue, 15 Jan 2019 02:37:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1547541420;
        bh=gEggVuFI0WgbWwhAvsRmM9+LSfD+8VwuSP9fsBnZsmI=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=NyWRaHITzjSCKVGbD3wOMaj3bCBvpZ+Z/XqZPs2ETsQ7sitExad1YOpI5IBrhkM77
         nR2oX6mwnVagbCfnFCVCilPgrwKc+/y6eEccTIXZDxIt6yWaM/T4iggSXaBfUBdqjI
         cztqsPcymYIUusyDiHMXJGAxDyQP8DnRkXdXYs60=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x0F8axiA020818
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 15 Jan 2019 02:36:59 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10; Tue, 15
 Jan 2019 02:36:59 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend Transport;
 Tue, 15 Jan 2019 02:36:59 -0600
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x0F8atWq016747;
        Tue, 15 Jan 2019 02:36:57 -0600
Subject: Re: [PATCH] clk: ti: Fix error handling in
 ti_clk_parse_divider_data()
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Stephen Boyd <sboyd@kernel.org>
CC:     Michael Turquette <mturquette@baylibre.com>,
        <linux-omap@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>
References: <20190115070149.wpiyqw5vqqqsapxt@kili.mountain>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <c4a5e9bb-36b9-800c-f9df-5d261f9fd301@ti.com>
Date:   Tue, 15 Jan 2019 10:36:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190115070149.wpiyqw5vqqqsapxt@kili.mountain>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 15/01/2019 09:01, Dan Carpenter wrote:
> The ti_clk_parse_divider_data() function is only called from
> _get_div_table_from_setup().  That function doesn't look at the return
> value but instead looks at the "*table" pointer.  In this case, if the
> kcalloc() fails then *table is NULL (which means success).  It should
> instead be an error pointer.
> 
> The ti_clk_parse_divider_data() function has two callers.  One checks
> for errors and the other doesn't.  I have fixed it so now both handle
> errors.
> 
> Fixes: 4f6be5655dc9 ("clk: ti: divider: add driver internal API for parsing divider data")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Looks fine to me:

Acked-by: Tero Kristo <t-kristo@ti.com>

> ---
>   drivers/clk/ti/divider.c | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/ti/divider.c b/drivers/clk/ti/divider.c
> index 8d77090ad94a..4c48ef424ad5 100644
> --- a/drivers/clk/ti/divider.c
> +++ b/drivers/clk/ti/divider.c
> @@ -403,8 +403,10 @@ int ti_clk_parse_divider_data(int *div_table, int num_dividers, int max_div,
>   	num_dividers = i;
>   
>   	tmp = kcalloc(valid_div + 1, sizeof(*tmp), GFP_KERNEL);
> -	if (!tmp)
> +	if (!tmp) {
> +		*table = PTR_ERR(-ENOMEM);
>   		return -ENOMEM;
> +	}
>   
>   	valid_div = 0;
>   	*width = 0;
> @@ -439,6 +441,7 @@ struct clk_hw *ti_clk_build_component_div(struct ti_clk_divider *setup)
>   {
>   	struct clk_omap_divider *div;
>   	struct clk_omap_reg *reg;
> +	int ret;
>   
>   	if (!setup)
>   		return NULL;
> @@ -458,6 +461,12 @@ struct clk_hw *ti_clk_build_component_div(struct ti_clk_divider *setup)
>   		div->flags |= CLK_DIVIDER_POWER_OF_TWO;
>   
>   	div->table = _get_div_table_from_setup(setup, &div->width);
> +	if (IS_ERR(div->table)) {
> +		ret = PTR_ERR(div->table);
> +		kfree(div);
> +		return ret;
> +	}
> +
>   
>   	div->shift = setup->bit_shift;
>   	div->latch = -EINVAL;
> 

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
